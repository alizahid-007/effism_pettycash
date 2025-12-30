<?php
header('Content-Type: application/json');
include_once __DIR__ . '/../includes/db.php';
include_once __DIR__ . '/../includes/auth.php';
require_login();

if (strtolower($_SESSION['role_name'] ?? '') !== 'admin') {
    http_response_code(403);
    echo json_encode(['status'=>'error','message'=>'Admin-only']);
    exit;
}

$data = json_decode(file_get_contents('php://input'), true);

$name  = trim($data['name'] ?? '');
$desc  = trim($data['description'] ?? '');
$steps = $data['steps'] ?? [];

if (!$name || !is_array($steps) || count($steps) === 0) {
    http_response_code(400);
    echo json_encode(['status'=>'error','message'=>'Invalid input']);
    exit;
}

try {
    $pdo->beginTransaction();

    // INSERT NEW WORKFLOW (DO NOT deactivate old ones)
    $stmt = $pdo->prepare("
        INSERT INTO workflows (name, description, is_active, created_at)
        VALUES (?, ?, 0, NOW())
    ");
    $stmt->execute([$name, $desc]);
    $workflowId = $pdo->lastInsertId();

    // INSERT STEPS
    $stepStmt = $pdo->prepare("
        INSERT INTO workflow_steps
        (workflow_id, step_order, role_name, role_label, created_at)
        VALUES (?, ?, ?, ?, NOW())
    ");

    $order = 1;
    foreach ($steps as $s) {
        $role = trim($s['role_name'] ?? '');
        if (!$role) continue;

        $label = $s['role_label'] ?? $role;
        $stepStmt->execute([$workflowId, $order, $role, $label]);
        $order++;
    }

    $pdo->commit();

    echo json_encode(['status'=>'success','message'=>'Workflow saved']);
} catch (Exception $e) {
    if ($pdo->inTransaction()) $pdo->rollBack();
    http_response_code(500);
    echo json_encode(['status'=>'error','message'=>$e->getMessage()]);
}
