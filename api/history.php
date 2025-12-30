<?php
header('Content-Type: application/json');
include_once '../includes/db.php';
include_once '../includes/auth.php';
require_login();

$claimId = (int)($_GET['claim_id'] ?? 0);
$stmt = $pdo->prepare("SELECT a.*, u.username 
                       FROM audit_log a LEFT JOIN users u ON a.user_id=u.user_id
                       WHERE claim_id=? ORDER BY created_at ASC");
$stmt->execute([$claimId]);
echo json_encode(['status'=>'success','data'=>$stmt->fetchAll()]);
