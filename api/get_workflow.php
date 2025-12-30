<?php
header('Content-Type: application/json');
include_once __DIR__ . '/../includes/db.php';
include_once __DIR__ . '/../includes/auth.php';
require_login();

$wfId = (int)($_GET['id'] ?? 0);

if (!$wfId) {
    http_response_code(400);
    echo json_encode(['status'=>'error','message'=>'Workflow ID required']);
    exit;
}

$stmt = $pdo->prepare("SELECT * FROM workflows WHERE workflow_id=?");
$stmt->execute([$wfId]);
$workflow = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$workflow) {
    http_response_code(404);
    echo json_encode(['status'=>'error','message'=>'Workflow not found']);
    exit;
}

$steps = $pdo->prepare("
    SELECT *
    FROM workflow_steps
    WHERE workflow_id=?
    ORDER BY step_order ASC
");
$steps->execute([$wfId]);
$workflow['steps'] = $steps->fetchAll(PDO::FETCH_ASSOC);

echo json_encode(['status'=>'success','workflow'=>$workflow]);
