<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "iot_data";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) die("Connection failed: " . $conn->connect_error);

$slot1 = isset($_GET['slot1']) ? intval($_GET['slot1']) : 0;
$slot2 = isset($_GET['slot2']) ? intval($_GET['slot2']) : 0;

$sql = "INSERT INTO parking_slots (slot1, slot2) VALUES ($slot1, $slot2)";
if ($conn->query($sql) === TRUE) {
  echo "OK";
} else {
  echo "Error: " . $conn->error;
}

$conn->close();
?>
