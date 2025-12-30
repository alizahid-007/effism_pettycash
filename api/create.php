<?php
ob_start();
ini_set('display_errors', 0);
error_reporting(E_ALL);
header('Content-Type: application/json');

include_once __DIR__ . "/../includes/db.php";
include_once __DIR__ . "/../includes/auth.php";

require_login();

try {

    /* ------------------ BASIC VALIDATION ------------------ */
    if (
        !isset(
            $_POST["total_amount"],
            $_POST["currency"],
            $_POST["items"],
            $_POST["creator_role"],
            $_POST["creator_user_id"]
        )
    ) {
        echo json_encode(["status" => "error", "message" => "Missing payload"]);
        exit;
    }

    $total_amount  = (float) $_POST["total_amount"];
    $currency      = trim($_POST["currency"]);
    $items         = json_decode($_POST["items"], true);

    $workflowType  = $_POST["workflow_type"] ?? "default";
    $workflowId    = $_POST["workflow_id"] ?? null;

    $creatorRole   = trim($_POST["creator_role"]);
    $creatorUserId = (int) $_POST["creator_user_id"];

    /* ------------------ EDIT MODE DETECTION ------------------ */
    $editMode    = isset($_POST['edit']) && $_POST['edit'] === '1';
    $editClaimId = isset($_POST['claim_id']) ? (int)$_POST['claim_id'] : 0;

    if (!is_array($items) || count($items) === 0) {
        echo json_encode(["status" => "error", "message" => "No line items found"]);
        exit;
    }

    /* ---------------------------------------------------
       HARD VALIDATION + DETECTIONS
    --------------------------------------------------- */
    $containsTransport = false;
    $containsJobNo     = false;
    $detectedDivisions = [];

    foreach ($items as $row) {

        if (
            empty($row['description']) ||
            empty($row['main_category']) ||
            empty($row['division']) ||
            floatval($row['amount'] ?? 0) <= 0
        ) {
            echo json_encode([
                "status" => "error",
                "message" => "Each line item must have Description, Main Category, Division and Amount"
            ]);
            exit;
        }

        $detectedDivisions[] = trim($row['division']);

        if (!empty($row['job_no'])) {
            $containsJobNo = true;
        }

        $main = strtolower($row['main_category']);
        $sub  = strtolower($row['sub_category'] ?? '');

        if (
            strpos($main, 'transport') !== false ||
            strpos($sub, 'taxi') !== false ||
            strpos($sub, 'bus') !== false
        ) {
            $containsTransport = true;
        }
    }

    $detectedDivisions = array_unique($detectedDivisions);
    $divisionGlobal = count($detectedDivisions) === 1 ? $detectedDivisions[0] : null;

    /* ---------------------------------------------------
       BUSINESS RULE FLAGS
    --------------------------------------------------- */
    $requiresJobNo                  = false;
    $requiresLogistics              = false;
    $requiresInvoiceThenLogistics   = false; // ✅ NEW
    $reviewerCanApprove             = false;

    if ($containsJobNo) {
        $requiresJobNo = true;
    }

    if ($containsTransport) {
        $requiresLogistics = true;
    }

    // ✅ NEW COMBINED CONDITION (HIGHEST PRIORITY)
    if ($containsJobNo && $containsTransport) {
        $requiresInvoiceThenLogistics = true;
    }

    if (
        $total_amount < 5000
        && !$requiresJobNo
        && !$requiresLogistics
    ) {
        $reviewerCanApprove = true;
    }

    /* ---------------------------------------------------
       EDIT PERMISSION CHECK
    --------------------------------------------------- */
    if ($editMode) {

        if (!$editClaimId) {
            echo json_encode(["status"=>"error","message"=>"Invalid claim for edit"]);
            exit;
        }

        $chk = $pdo->prepare("
            SELECT assigned_to
            FROM claims
            WHERE claim_id=?
        ");
        $chk->execute([$editClaimId]);
        $row = $chk->fetch(PDO::FETCH_ASSOC);

        if (!$row || (int)$row['assigned_to'] !== $creatorUserId) {
            echo json_encode([
                "status"=>"error",
                "message"=>"You are not allowed to edit this claim"
            ]);
            exit;
        }
    }

    /* ---------------------------------------------------
       INITIAL ASSIGNMENT (ONLY FOR NEW CLAIM)
    --------------------------------------------------- */
    $assigned_role   = 'reviewer';
    $assigned_to     = null;
    $initial_status  = "Pending reviewer";
    $msg_assignment  = "Claim submitted";

    if (!$editMode) {

        /* ===================================================
           ADMIN WORKFLOW OVERRIDE (UNCHANGED)
        =================================================== */
        if (strtolower($workflowType) === 'admin' && $workflowId) {

            $stepStmt = $pdo->prepare("
                SELECT role_name
                FROM workflow_steps
                WHERE workflow_id=?
                ORDER BY step_order ASC
                LIMIT 1
            ");
            $stepStmt->execute([$workflowId]);
            $firstStep = $stepStmt->fetch(PDO::FETCH_ASSOC);

            if (!$firstStep) {
                throw new Exception("Admin workflow has no steps defined");
            }

            $assigned_role  = strtolower($firstStep['role_name']);
            $initial_status = "Pending " . ucfirst($assigned_role);
            $msg_assignment = "Claim assigned via Admin Workflow";

        } else {

            /* ================= EXISTING LOGIC (EXTENDED ONLY) ================= */

            // ✅ NEW: Job + Transport → InvoiceReviewer FIRST
            if ($requiresInvoiceThenLogistics) {

                $assigned_role  = 'invoiceReviewer';
                $initial_status = "Pending InvoiceReviewer";
                $msg_assignment = "Claim with Job No & Transport sent to InvoiceReviewer";

            }
            elseif ($requiresJobNo) {

                $assigned_role  = 'invoiceReviewer';
                $initial_status = "Pending InvoiceReviewer";
                $msg_assignment = "Claim with Job No sent to InvoiceReviewer for verification";

            }
            elseif ($requiresLogistics) {

                $assigned_role  = 'logistics';
                $initial_status = "Pending logistics";
                $msg_assignment = "Claim with transport expense sent to Logistics for verification";

            }
            elseif ($reviewerCanApprove) {

                $assigned_role  = 'reviewer';
                $initial_status = "Pending reviewer";
                $msg_assignment = "Claim sent to Reviewer (Direct approval allowed)";

            }
            else {

                $roleHierarchy = [
                    'requester' => 'reviewer',
                    'reviewer' => 'approver',
                    'approver' => 'accountsReviewer',
                    'accountsreviewer' => 'accountsApprovalHead',
                    'accountsapprovalhead' => null,
                    'logistics' => 'invoiceReviewer',
                    'invoicereviewer' => 'approver',
                ];

                $creatorRoleLower = strtolower($creatorRole);

                if (array_key_exists($creatorRoleLower, $roleHierarchy)) {
                    $nextRole = $roleHierarchy[$creatorRoleLower];

                    if ($nextRole !== null) {
                        $assigned_role  = $nextRole;
                        $initial_status = "Pending $assigned_role";
                        $msg_assignment = "Claim created and assigned to ".ucfirst($assigned_role);
                    }
                }
            }
        }

        /* -------- FIND ASSIGNED USER (UNCHANGED) -------- */
        $stmtRole = $pdo->prepare("SELECT role_id FROM roles WHERE LOWER(role_name)=? LIMIT 1");
        $stmtRole->execute([strtolower($assigned_role)]);
        $roleRow = $stmtRole->fetch(PDO::FETCH_ASSOC);

        if ($roleRow) {
            $uStmt = $pdo->prepare("
                SELECT user_id FROM users WHERE role_id=? AND is_active=1 LIMIT 1
            ");
            $uStmt->execute([$roleRow['role_id']]);
            $uRow = $uStmt->fetch(PDO::FETCH_ASSOC);
            if ($uRow) {
                $assigned_to = (int)$uRow['user_id'];
            }
        }

        $claim_no = "PC-" . date("Ymd-His") . "-" . rand(100, 999);
    }

    /* ---------------------------------------------------
       DB TRANSACTION
    --------------------------------------------------- */
    $pdo->beginTransaction();

    /* ---------------------------------------------------
       CREATE CLAIM
    --------------------------------------------------- */
    $stmt = $pdo->prepare("
        INSERT INTO claims
        (claim_no, requester_id, total_amount, currency, status,
         assigned_role, assigned_to, workflow_type, workflow_id,
         submitted_at, division)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), ?)
    ");

    $stmt->execute([
        $claim_no,
        $creatorUserId,
        $total_amount,
        $currency,
        $initial_status,
        $assigned_role,
        $assigned_to,
        $workflowType,
        strtolower($workflowType) === 'admin' ? $workflowId : null,
        $divisionGlobal
    ]);

    $claim_id = $pdo->lastInsertId();

    /* ---------------------------------------------------
       INSERT LINE ITEMS
    --------------------------------------------------- */
    $stmtDetail = $pdo->prepare("
        INSERT INTO claim_details
        (claim_id, description, main_category, sub_category,
         amount, job_no, company, division, subdivision)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
    ");

    foreach ($items as $row) {
        $stmtDetail->execute([
            $claim_id,
            $row['description'],
            $row['main_category'],
            $row['sub_category'] ?? null,
            (float)$row['amount'],
            $row['job_no'] ?? null,
            $row['company'] ?? null,
            $row['division'],
            $row['subdivision'] ?? null
        ]);
    }

    /* ---------------------------------------------------
       AUDIT LOG
    --------------------------------------------------- */
    $pdo->prepare("
        INSERT INTO audit_log
        (claim_id, user_id, action, note, created_at)
        VALUES (?,?,?,?,NOW())
    ")->execute([
        $claim_id,
        $creatorUserId,
        'Created',
        'Claim created by user'
    ]);

    $pdo->commit();

    echo json_encode([
        "status"   => "success",
        "claim_id" => $claim_id,
        "message"  => $msg_assignment
    ]);
    exit;

} catch (Exception $e) {

    if ($pdo->inTransaction()) $pdo->rollBack();

    echo json_encode([
        "status"  => "error",
        "message" => $e->getMessage()
    ]);
    exit;
}

ob_end_flush();
