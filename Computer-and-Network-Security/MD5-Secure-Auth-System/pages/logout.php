<?php
/**
 * ไฟล์: pages/logout.php
 * วัตถุประสงค์: ออกจากระบบและทำลาย Session
 */
session_start();

// ทำลาย session ทั้งหมด
$_SESSION = array();

// ลบ session cookie
if (isset($_COOKIE[session_name()])) {
    setcookie(session_name(), '', time() - 42000, '/');
}

// ทำลาย session
session_destroy();

// redirect กลับไปหน้า login
header('Location: login.php?error=logout');
exit;
?>
