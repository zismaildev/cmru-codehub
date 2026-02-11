<?php
/**
 * ไฟล์: pages/auth.php
 * วัตถุประสงค์: ตรวจสอบ Username และ Password
 */
session_start();

// ตรวจสอบว่ามีการส่งข้อมูลมาหรือไม่
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header('Location: login.php');
    exit;
}

// รับค่าจากฟอร์ม
$username = isset($_POST['username']) ? trim($_POST['username']) : '';
$password = isset($_POST['password']) ? trim($_POST['password']) : '';

// ตรวจสอบว่ากรอกครบหรือไม่
if (empty($username) || empty($password)) {
    header('Location: login.php?error=invalid');
    exit;
}

// เชื่อมต่อฐานข้อมูล (path ใหม่)
$conn = require_once '../config/database.php';

// เข้ารหัส password ด้วย MD5
$password_md5 = md5($password);

// เตรียม SQL query (ป้องกัน SQL Injection)
$stmt = $conn->prepare("SELECT id, username, full_name FROM users WHERE username = ? AND password = ?");
$stmt->bind_param("ss", $username, $password_md5);
$stmt->execute();
$result = $stmt->get_result();

// ตรวจสอบผลลัพธ์
if ($result->num_rows === 1) {
    // Login สำเร็จ
    $user = $result->fetch_assoc();
    
    // เก็บข้อมูลใน session
    $_SESSION['logged_in'] = true;
    $_SESSION['user_id'] = $user['id'];
    $_SESSION['username'] = $user['username'];
    $_SESSION['full_name'] = $user['full_name'];
    
    // ปิด statement และ connection
    $stmt->close();
    $conn->close();
    
    // redirect ไปหน้า welcome
    header('Location: welcome.php');
    exit;
} else {
    // Login ไม่สำเร็จ
    $stmt->close();
    $conn->close();
    
    header('Location: login.php?error=invalid');
    exit;
}
?>
