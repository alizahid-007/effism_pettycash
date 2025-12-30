<?php
ob_start();
ini_set('display_errors', 0);
error_reporting(E_ALL);
header('Content-Type: application/json');

include_once __DIR__ . '/../includes/db.php';
include_once __DIR__ . '/../includes/auth.php';
require_login();

$claimId = isset($_GET['id']) ? (int)$_GET['id'] : 0;
if ($claimId <= 0) {
    echo json_encode(['status' => 'error', 'message' => 'Invalid claim id']);
    exit;
}

try {

    // -------------------------------------------------
    // Claim header
    // -------------------------------------------------
    $stmt = $pdo->prepare("
        SELECT 
            c.*, 
            u.username AS requester_name
        FROM claims c
        LEFT JOIN users u ON c.requester_id = u.user_id
        WHERE c.claim_id = ?
        LIMIT 1
    ");
    $stmt->execute([$claimId]);
    $claim = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$claim) {
        echo json_encode(['status' => 'error', 'message' => 'Claim not found']);
        exit;
    }

    // -------------------------------------------------
    // Line items (ALL rows)
    // -------------------------------------------------
    $itemStmt = $pdo->prepare("
        SELECT 
            d.detail_id,
            d.description,
            d.main_category,
            d.sub_category,
            d.amount,
            d.job_no,
            d.company,
            d.division,
            d.subdivision
        FROM claim_details d
        WHERE d.claim_id = ?
        ORDER BY d.detail_id ASC
    ");
    $itemStmt->execute([$claimId]);

    $items = [];
    while ($it = $itemStmt->fetch(PDO::FETCH_ASSOC)) {

        // ---------------------------------------------
        // Attachments PER line item (correct way)
        // ---------------------------------------------
        $attStmt = $pdo->prepare("
            SELECT 
                a.file_name,
                a.file_path
            FROM attachments a
            WHERE a.detail_id = ?
            ORDER BY a.attachment_id ASC
        ");
        $attStmt->execute([$it['detail_id']]);
        $it['attachments'] = $attStmt->fetchAll(PDO::FETCH_ASSOC);

        $items[] = $it;
    }

    // -------------------------------------------------
    // Approval / audit logs
    // -------------------------------------------------
    $logStmt = $pdo->prepare("
        SELECT 
            l.action,
            l.note,
            l.created_at,
            u.username AS done_by
        FROM audit_log l
        LEFT JOIN users u ON u.user_id = l.user_id
        WHERE l.claim_id = ?
        ORDER BY l.created_at ASC
    ");
    $logStmt->execute([$claimId]);
    $logs = $logStmt->fetchAll(PDO::FETCH_ASSOC);

    // -------------------------------------------------
    // Final response
    // -------------------------------------------------
    echo json_encode([
        'status' => 'success',
        'claim'  => $claim,
        'items'  => $items,   // ✅ ALL line items
        'logs'   => $logs
    ]);
    exit;

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        'status'  => 'error',
        'message' => 'Server error',
        'detail'  => $e->getMessage()
    ]);
    exit;
}

ob_end_flush();
