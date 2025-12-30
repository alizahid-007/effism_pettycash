<?php
header('Content-Type: application/json');
include_once __DIR__ . '/../includes/db.php';
include_once __DIR__ . '/../includes/auth.php';
require_login();

$userId = (int)($_SESSION['user_id'] ?? 0);
$roleName = strtolower($_SESSION['role_name'] ?? '');

try {
    // All users should see claims they have created (requester_id = their id),
    // as well as claims currently assigned to their role (if not requester).
    if ($roleName === 'requester') {
        // Show claims created by requester
        $stmt = $pdo->prepare("
            SELECT 
                c.claim_id, c.claim_no, c.total_amount, c.currency, 
                c.status, c.submitted_at, u.username AS requester_name
            FROM claims c
            LEFT JOIN users u ON c.requester_id = u.user_id
            WHERE c.requester_id = ?
            ORDER BY c.submitted_at DESC
        ");
        $stmt->execute([$userId]);
    } else {
        // Show claims created by this user OR currently assigned to this user's role
        $stmt = $pdo->prepare("
            SELECT 
                c.claim_id, c.claim_no, c.total_amount, c.currency,
                c.status, c.submitted_at, u.username AS requester_name
            FROM claims c
            LEFT JOIN users u ON c.requester_id = u.user_id
            WHERE c.requester_id = ?
               OR LOWER(c.assigned_role) = ?
            ORDER BY c.submitted_at DESC
        ");
        $stmt->execute([$userId, $roleName]);
    }

    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode(['status'=>'success','data'=>$rows]);
    exit;

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['status'=>'error','message'=>$e->getMessage()]);
    exit;
}
