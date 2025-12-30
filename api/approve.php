<?php
ob_start();
ini_set('display_errors', 0);
error_reporting(E_ALL);
header('Content-Type: application/json');

include_once __DIR__ . '/../includes/db.php';
include_once __DIR__ . '/../includes/auth.php';
require_login();

$data = json_decode(file_get_contents('php://input'), true);

$claimId = (int)($data['claim_id'] ?? 0);
$action  = strtolower(trim($data['action'] ?? ''));
$note    = trim($data['note'] ?? '');

if (
    !$claimId ||
    !in_array($action, ['approve','reject','clarify','resubmit'], true)
) {
    echo json_encode(['status'=>'error','message'=>'Invalid request']);
    exit;
}

$currentRole   = strtolower($_SESSION['role_name'] ?? '');
$currentUserId = (int)($_SESSION['user_id'] ?? 0);

try {

    /* ---------------- LOAD CLAIM ---------------- */
    $stmt = $pdo->prepare("SELECT * FROM claims WHERE claim_id=?");
    $stmt->execute([$claimId]);
    $claim = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!$claim) throw new Exception("Claim not found");

    /* =====================================================
       ROLE MAPS (LOCKED BUSINESS RULE)
       ===================================================== */
    $roleDown = [
        'reviewer'              => 'requester',
        'approver'              => 'reviewer',
        'accountsreviewer'      => 'approver',
        'accountsapprovalhead'  => 'accountsreviewer'
    ];

    $roleUp = [
        'requester'        => 'reviewer',
        'reviewer'         => 'approver',
        'approver'         => 'accountsreviewer',
        'accountsreviewer' => 'accountsapprovalhead'
    ];

    /* =====================================================
       🔴 REJECT → FINAL (NO RE-ROUTING)
       ===================================================== */
    if ($action === 'reject') {

        $pdo->prepare("
            UPDATE claims
            SET status='Rejected',
                assigned_role=NULL,
                assigned_to=NULL,
                updated_at=NOW()
            WHERE claim_id=?
        ")->execute([$claimId]);

        $pdo->prepare("
            INSERT INTO audit_log (claim_id,user_id,action,note,created_at)
            VALUES (?,?,?,?,NOW())
        ")->execute([$claimId, $currentUserId, 'Rejected', $note]);

        echo json_encode(['status'=>'success','message'=>'Claim rejected']);
        exit;
    }

    /* =====================================================
       🟡 CLARIFY → ONE LEVEL DOWN ONLY
       ===================================================== */
    if ($action === 'clarify') {

        $lowerRole = $roleDown[$currentRole] ?? null;
        if (!$lowerRole) {
            throw new Exception("Clarification not allowed from this role");
        }

        $u = $pdo->prepare("
            SELECT u.user_id
            FROM users u
            JOIN roles r ON r.role_id = u.role_id
            WHERE LOWER(r.role_name)=LOWER(?)
              AND u.is_active=1
            ORDER BY u.user_id ASC
            LIMIT 1
        ");
        $u->execute([$lowerRole]);
        $lowerUserId = $u->fetchColumn();

        if (!$lowerUserId) {
            throw new Exception("No active user found for role {$lowerRole}");
        }

        $pdo->prepare("
            UPDATE claims
            SET status='Clarification Required',
                assigned_role=?,
                assigned_to=?,
                updated_at=NOW()
            WHERE claim_id=?
        ")->execute([$lowerRole, $lowerUserId, $claimId]);

        $pdo->prepare("
            INSERT INTO audit_log (claim_id,user_id,action,note,created_at)
            VALUES (?,?,?,?,NOW())
        ")->execute([$claimId, $currentUserId, 'Clarification Requested', $note]);

        echo json_encode([
            'status'=>'success',
            'message'=>"Clarification sent to {$lowerRole}"
        ]);
        exit;
    }

    /* =====================================================
       🔵 RESUBMIT → ONE LEVEL UP ONLY
       ===================================================== */
    if ($action === 'resubmit') {

        if (strtolower($claim['status']) !== 'clarification required') {
            throw new Exception("Claim is not in clarification state");
        }

        if (
            $currentUserId !== (int)$claim['assigned_to'] &&
            $currentUserId !== (int)$claim['requester_id']
        ) {
            throw new Exception("You are not allowed to resubmit this claim");
        }

        $nextRole = $roleUp[$currentRole] ?? 'reviewer';

        $u = $pdo->prepare("
            SELECT u.user_id
            FROM users u
            JOIN roles r ON r.role_id = u.role_id
            WHERE LOWER(r.role_name)=LOWER(?)
              AND u.is_active=1
            ORDER BY u.user_id ASC
            LIMIT 1
        ");
        $u->execute([$nextRole]);
        $nextUserId = $u->fetchColumn();

        if (!$nextUserId) {
            throw new Exception("No active user found for role {$nextRole}");
        }

        $pdo->prepare("
            UPDATE claims
            SET status=?,
                assigned_role=?,
                assigned_to=?,
                updated_at=NOW()
            WHERE claim_id=?
        ")->execute([
            "Pending {$nextRole}",
            $nextRole,
            $nextUserId,
            $claimId
        ]);

        $pdo->prepare("
            INSERT INTO audit_log (claim_id,user_id,action,note,created_at)
            VALUES (?,?,?,?,NOW())
        ")->execute([$claimId, $currentUserId, 'Resubmitted', $note]);

        echo json_encode([
            'status'=>'success',
            'message'=>"Claim resubmitted to {$nextRole}"
        ]);
        exit;
    }

    /* =====================================================
       🟢 APPROVAL FLOW (UPDATED – ADDITIVE ONLY)
       ===================================================== */
    $amount   = (float)$claim['total_amount'];
    $nextRole = null;
    $autoNote = '';

    if ($currentRole === 'reviewer') {

        if ($amount < 5000) {
            $nextRole = null;
            $autoNote = 'Final Approved by Reviewer (<5000)';
        } else {
            $nextRole = 'approver';
            $autoNote = 'Approved by Reviewer → Approver';
        }

    } elseif ($currentRole === 'logistics') {

        $nextRole = 'reviewer';
        $autoNote = 'Approved by Logistics → Reviewer';

    } elseif ($currentRole === 'invoicereviewer') {

        /* ========= NEW CONDITION START ========= */

        $stmt = $pdo->prepare("
            SELECT
                SUM(CASE WHEN job_no IS NOT NULL AND job_no <> '' THEN 1 ELSE 0 END) AS has_job,
                SUM(
                    CASE
                        WHEN LOWER(main_category) LIKE '%transport%'
                          OR LOWER(sub_category) LIKE '%taxi%'
                          OR LOWER(sub_category) LIKE '%bus%'
                        THEN 1 ELSE 0
                    END
                ) AS has_transport
            FROM claim_details
            WHERE claim_id=?
        ");
        $stmt->execute([$claimId]);
        $flags = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($flags['has_job'] > 0 && $flags['has_transport'] > 0) {

            // InvoiceReviewer → Logistics
            $nextRole = 'logistics';
            $autoNote = 'Approved by Invoice Reviewer → Logistics (Job + Transport)';

        } else {

            // EXISTING BEHAVIOR (UNCHANGED)
            $nextRole = 'reviewer';
            $autoNote = 'Approved by Invoice Reviewer → Reviewer';
        }

        /* ========= NEW CONDITION END ========= */

    } elseif ($currentRole === 'approver') {

        $nextRole = 'accountsreviewer';
        $autoNote = 'Approved by Approver → Accounts Reviewer';

    } elseif ($currentRole === 'accountsreviewer') {

        $nextRole = 'accountsapprovalhead';
        $autoNote = 'Approved by Accounts Reviewer → Accounts Approval Head';

    } elseif ($currentRole === 'accountsapprovalhead') {

        $nextRole = null;
        $autoNote = 'Final Approved by Accounts Approval Head';
    }

    if ($nextRole === null) {

        $pdo->prepare("
            UPDATE claims
            SET status='Final Approved',
                assigned_role=NULL,
                assigned_to=NULL,
                updated_at=NOW()
            WHERE claim_id=?
        ")->execute([$claimId]);

        $pdo->prepare("
            INSERT INTO audit_log (claim_id,user_id,action,note,created_at)
            VALUES (?,?,?,?,NOW())
        ")->execute([$claimId, $currentUserId, 'Approved', $autoNote]);

        echo json_encode(['status'=>'success','message'=>'Final Approved']);
        exit;
    }

    $u = $pdo->prepare("
        SELECT u.user_id
        FROM users u
        JOIN roles r ON r.role_id=u.role_id
        WHERE LOWER(r.role_name)=LOWER(?)
          AND u.is_active=1
        LIMIT 1
    ");
    $u->execute([$nextRole]);
    $nextUser = $u->fetchColumn();

    if (!$nextUser) {
        throw new Exception("No active user found for role {$nextRole}");
    }

    $pdo->prepare("
        UPDATE claims
        SET status=?,
            assigned_role=?,
            assigned_to=?,
            updated_at=NOW()
        WHERE claim_id=?
    ")->execute([
        "Pending {$nextRole}",
        $nextRole,
        $nextUser,
        $claimId
    ]);

    $pdo->prepare("
        INSERT INTO audit_log (claim_id,user_id,action,note,created_at)
        VALUES (?,?,?,?,NOW())
    ")->execute([$claimId, $currentUserId, 'Approved', $autoNote]);

    echo json_encode(['status'=>'success','message'=>"Moved to {$nextRole}"]);
    exit;

} catch (Exception $e) {
    echo json_encode(['status'=>'error','message'=>$e->getMessage()]);
    exit;
}

ob_end_flush();
