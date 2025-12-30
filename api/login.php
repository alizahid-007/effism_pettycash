<?php
header('Content-Type: application/json');
include_once '../includes/db.php';
session_start();

$data = json_decode(file_get_contents('php://input'), true);
$username = trim($data['username'] ?? '');
$password = trim($data['password'] ?? '');

if (!$username || !$password) {
    echo json_encode(['status' => 'error', 'message' => 'Missing credentials']);
    exit;
}

/*
   IMPORTANT:
   Your database contains:
   - u.full_name (OK but many rows = NULL)
   - u.specialization (OK but many rows = NULL)
   - u.department (OK but many rows = NULL)
   - r.role_title DOES NOT EXIST
*/

$stmt = $pdo->prepare("
    SELECT 
        u.user_id,
        u.username,
        COALESCE(u.full_name, u.username) AS full_name,
        u.specialization,
        u.department,
        u.role_id,
        r.role_name,
        r.role_level
    FROM users u
    JOIN roles r ON u.role_id = r.role_id
    WHERE u.username = ? AND u.password = ?
");
$stmt->execute([$username, $password]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);

if ($user) {
    // Store clean values in session
    $_SESSION['user_id']        = $user['user_id'];
    $_SESSION['username']       = $user['username'];
    $_SESSION['full_name']      = $user['full_name'];     // fallback already applied
    $_SESSION['specialization'] = $user['specialization'];
    $_SESSION['department']     = $user['department'];
    $_SESSION['role_id']        = $user['role_id'];
    $_SESSION['role_name']      = $user['role_name'];
    $_SESSION['role_level']     = $user['role_level'];

    echo json_encode([
        'status' => 'success',
        'user'   => $user
    ]);

} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid username or password']);
}
?>
