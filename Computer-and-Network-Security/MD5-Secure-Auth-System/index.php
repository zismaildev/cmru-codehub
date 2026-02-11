<?php
/**
 * ไฟล์: index.php
 * วัตถุประสงค์: หน้าแรกของระบบ - Redirect ไปหน้า Login
 */

// เริ่ม session
session_start();

// ตรวจสอบว่า login แล้วหรือยัง
if (isset($_SESSION['logged_in']) && $_SESSION['logged_in'] === true) {
    // ถ้า login แล้ว ให้ไปหน้า welcome
    header('Location: pages/welcome.php');
} else {
    // ถ้ายัง login ให้ไปหน้า login
    header('Location: pages/login.php');
}

exit;
?>
