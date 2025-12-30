<?php
header('Content-Type: application/json');
include_once __DIR__ . '/../includes/db.php';
include_once __DIR__ . '/../includes/auth.php';
require_login();

/*
  IMPORTANT:
  - Admins create workflows
  - All users can READ workflows
*/

$stmt = $pdo->query("
    SELECT workflow_id, name, description, created_at
    FROM workflows
    ORDER BY created_at DESC
");

echo json_encode([
    'status' => 'success',
    'workflows' => $stmt->fetchAll(PDO::FETCH_ASSOC)
]);
