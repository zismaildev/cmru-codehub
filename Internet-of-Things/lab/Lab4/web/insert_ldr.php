<?php
require 'db.php';

if ($conn->connect_error) {
    die(json_encode(['status'=>'error','message'=>'DB connection failed']));
}

if (isset($_GET['ldr_state'])) {
    $state = $_GET['ldr_state'];
    $raw = isset($_GET['raw']) ? intval($_GET['raw']) : 0; // default 0

    $stmt = $conn->prepare("INSERT INTO ldr_data (ldr_state, raw_value) VALUES (?, ?)");
    $stmt->bind_param("si", $state, $raw);

    if ($stmt->execute()) {
        echo json_encode([
            'status' => 'success',
            'message' => 'LDR Data Inserted',
            'data' => ['ldr_state' => $state, 'raw' => $raw]
        ]);
    } else {
        echo json_encode([
            'status' => 'error',
            'message' => $stmt->error
        ]);
    }

    $stmt->close();
} else {
    echo json_encode([
        'status' => 'error',
        'message' => 'Missing parameter: ldr_state'
    ]);
}

$conn->close();
?>
