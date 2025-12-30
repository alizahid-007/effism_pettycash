<?php
header('Content-Type: application/json');
include_once '../includes/auth.php';
require_login();

$config = include '../includes/config.php';
$uploadDir = $config['uploads'];

if (!isset($_FILES['file'])) {
    echo json_encode(['status'=>'error','message'=>'No file uploaded']); exit;
}

$file = $_FILES['file'];
$mime = mime_content_type($file['tmp_name']);

if (!in_array($mime, $config['allowed_types'])) {
    echo json_encode(['status'=>'error','message'=>'Invalid file type']); exit;
}
if ($file['size'] > $config['max_upload_mb']*1024*1024) {
    echo json_encode(['status'=>'error','message'=>'File too large']); exit;
}

$newName = time() . '_' . preg_replace('/[^a-zA-Z0-9_.-]/','',$file['name']);
$targetPath = $uploadDir . $newName;
if (!move_uploaded_file($file['tmp_name'], $targetPath)) {
    echo json_encode(['status'=>'error','message'=>'Upload failed']); exit;
}

echo json_encode(['status'=>'success','file_name'=>$newName,'path'=>'uploads/pettycash/'.$newName]);
