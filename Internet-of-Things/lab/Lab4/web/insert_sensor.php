<?php
// connect db
$servername = "localhost"; // หรือ IP server ของจริง
$username = "root";        // user db
$password = "";            // password db
$dbname = "iot_data";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// รับค่าจาก ESP8266
$temp = isset($_GET['temp']) ? floatval($_GET['temp']) : null;
$hum = isset($_GET['hum']) ? floatval($_GET['hum']) : null;
$heat_index = isset($_GET['heat']) ? floatval($_GET['heat']) : null;
$ldr = isset($_GET['ldr']) ? intval($_GET['ldr']) : null;
$rain_state = isset($_GET['rain_state']) ? intval($_GET['rain_state']) : null;
$rain_status = isset($_GET['rain_status']) ? $_GET['rain_status'] : null;

if ($temp !== null && $hum !== null && $heat_index !== null) {
    $stmt = $conn->prepare("INSERT INTO sensor_data (temp, hum, heat_index, ldr, rain_state, rain_status) VALUES (?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("dddiss", $temp, $hum, $heat_index, $ldr, $rain_state, $rain_status);

    if ($stmt->execute()) {
        echo "Insert Success";
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
} else {
    echo "Missing data!";
}

$conn->close();
?>
