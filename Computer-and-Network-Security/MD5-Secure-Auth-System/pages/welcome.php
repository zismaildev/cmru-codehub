<?php
/**
 * ไฟล์: pages/welcome.php
 * วัตถุประสงค์: หน้าต้อนรับหลัง Login สำเร็จ
 */
session_start();

// ตรวจสอบว่า login แล้วหรือยัง
if (!isset($_SESSION['logged_in']) || $_SESSION['logged_in'] !== true) {
    header('Location: login.php');
    exit;
}

// ข้อมูลผู้ใช้
$username = $_SESSION['username'];
$full_name = isset($_SESSION['full_name']) ? $_SESSION['full_name'] : $username;

// ข้อมูลนักศึกษา
$student_info = "ณัฐพงษ์ ปันธิยะ รหัส 66143420 หมู่เรียน วค66.วท.บ.4.2";
?>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ยินดีต้อนรับ - Mini Project</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="../assets/css/style.css">
</head>
<body>
    <div class="welcome-container">
        <div class="welcome-card">
            <h1>✨ ยินดีต้อนรับ!</h1>
            <p class="lead">
                <strong>Welcome to <?php echo htmlspecialchars($student_info); ?> Website</strong>
            </p>
            <p>
                สวัสดี <strong><?php echo htmlspecialchars($full_name); ?></strong><br>
                คุณได้เข้าสู่ระบบในชื่อ: <code><?php echo htmlspecialchars($username); ?></code>
            </p>
            
            <div class="mt-4">
                <a href="logout.php" class="btn-logout">ออกจากระบบ</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
