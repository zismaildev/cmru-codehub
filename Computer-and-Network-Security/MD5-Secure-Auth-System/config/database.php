<?php
/**
 * ไฟล์: config/database.php
 * วัตถุประสงค์: เชื่อมต่อกับฐานข้อมูล MySQL
 */

// กำหนดค่าการเชื่อมต่อฐานข้อมูล
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', ''); // เปลี่ยนตามการตั้งค่า XAMPP ของคุณ
define('DB_NAME', 'mini_project_db');
define('DB_CHARSET', 'utf8mb4');

// สร้างการเชื่อมต่อ
$conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);

// ตรวจสอบการเชื่อมต่อ
if ($conn->connect_error) {
    die("การเชื่อมต่อล้มเหลว: " . $conn->connect_error);
}

// ตั้งค่า charset
$conn->set_charset(DB_CHARSET);

// ส่งคืนการเชื่อมต่อ
return $conn;
?>
