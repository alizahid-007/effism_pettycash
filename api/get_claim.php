<?php
header('Content-Type: application/json');
include '../includes/db.php';
session_start();

$claimId = $_GET['id'] ?? 0;

$stmt = $pdo->prepare("SELECT c.*, u.username AS requester_name 
                       FROM claims c
                       JOIN users u ON c.requester_id = u.user_id
                       WHERE c.claim_id = ?");
$stmt->execute([$claimId]);
$claim = $stmt->fetch();

if (!$claim) {
    echo json_encode(["status"=>"error","message"=>"Claim not found"]);
    exit;
}

echo json_encode(["status"=>"success","data"=>$claim]);
