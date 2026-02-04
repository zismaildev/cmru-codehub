<?php
// รับข้อมูลจากฟอร์ม
$username = $_POST['username'];
$password = $_POST['password'];

// แสดงข้อมูล
echo "<h2>Submitted Information</h2>";
echo "Username: " . htmlspecialchars($username) . "<br>";
echo "Password: " . htmlspecialchars($password) . "<br>";
?>
