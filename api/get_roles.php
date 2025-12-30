<?php
header('Content-Type: application/json');
include_once __DIR__ . '/../includes/db.php';
include_once __DIR__ . '/../includes/auth.php';
require_login();

$stmt = $pdo->query("SELECT role_name, role_id FROM roles ORDER BY role_level ASC, role_id ASC");
$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode(['status'=>'success','roles'=>$rows]);
