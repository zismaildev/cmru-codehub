<?php
session_start();
require 'db.php';

// ตรวจสอบการลงทะเบียน
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT); // เข้ารหัสรหัสผ่าน

    // บันทึกข้อมูลผู้ใช้ในฐานข้อมูล
    $stmt = $pdo->prepare("INSERT INTO users (username, password) VALUES (?, ?)");
    if ($stmt->execute([$username, $password])) {
        echo "<script>alert('ลงทะเบียนสำเร็จ'); window.location.href='login.php';</script>";
    } else {
        echo "<script>alert('เกิดข้อผิดพลาดในการลงทะเบียน');</script>";
    }
}
?>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ลงทะเบียน</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>ลงทะเบียน</h2>
        <form action="register.php" method="post">
            <div class="form-group">
                <label for="username">ชื่อผู้ใช้</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">รหัสผ่าน</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary">ลงทะเบียน</button>
        </form>
        <p class="mt-3">มีบัญชีอยู่แล้ว? <a href="login.php">ล็อกอินที่นี่</a></p>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
