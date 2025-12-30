<?php
session_start();

function require_login() {
    if (empty($_SESSION['user_id'])) {
        http_response_code(401);
        echo json_encode(['status'=>'error','message'=>'Session expired']);
        exit;
    }
}

function require_role_level($minLevel) {
    require_login();
    if ($_SESSION['role_level'] < $minLevel) {
        http_response_code(403);
        echo json_encode(['status'=>'error','message'=>'Access denied']);
        exit;
    }
}
