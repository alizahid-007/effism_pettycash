<?php
$entered = '12345';
$hash = '$2y$10$YRTzDwbK2cC0OqZaP/jTce1KUQ/PEv7Yw2Qmy0hMt5yP4GE9oI55i';
var_dump(password_verify($entered, $hash));
