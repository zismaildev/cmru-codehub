<?php
$host = 'localhost';
$db   = 'iot_lab';
$user = 'root';
$pass = '';

try {
    $pdo = new PDO(
        "mysql:host=$host;dbname=$db;charset=utf8mb4",
        $user,
        $pass,
        [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,   // แสดง error
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC, // fetch แบบ associative array
            PDO::ATTR_EMULATE_PREPARES => false,          // ป้องกัน SQL injection
        ]
    );
} catch (PDOException $e) {
    // ไม่โชว์ error ในหน้าเว็บโดยตรง แค่ log หรือ echo แบบเบา ๆ
    error_log("Database Connection Failed: " . $e->getMessage());
    die("Database connection failed. Please check the logs.");
}
?>
