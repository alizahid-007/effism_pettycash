<?php
return [
  'db' => [
    'host' => '127.0.0.1',     // or 'localhost'
    'name' => 'effism_pettycash', // your database name
    'user' => 'root',          // or your MySQL username
    'pass' => '',              // MySQL password (if root has none, leave empty)
  ],
  'uploads' => __DIR__ . '/../uploads/pettycash/',
  'max_upload_mb' => 10,
  'allowed_types' => [
    'application/pdf',
    'image/jpeg',
    'image/png',
    'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
    'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
  ]
];
