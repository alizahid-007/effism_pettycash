<?php
function json_ok($data=[], $msg=''){ echo json_encode(['status'=>'success','message'=>$msg,'data'=>$data]); }
function json_err($msg=''){ http_response_code(400); echo json_encode(['status'=>'error','message'=>$msg]); }
