<?php
/**
 * ไฟล์: pages/login.php
 * วัตถุประสงค์: หน้า Login Form
 */
session_start();

// ถ้า login แล้ว ให้ redirect ไปหน้า welcome
if (isset($_SESSION['logged_in']) && $_SESSION['logged_in'] === true) {
    header('Location: welcome.php');
    exit;
}

// รับข้อความ error ถ้ามี
$error = isset($_GET['error']) ? $_GET['error'] : '';
?>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>เข้าสู่ระบบ - Mini Project</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="../assets/css/style.css">
</head>
<body>
    <div class="login-container">
        <div class="login-card">
            <div class="login-header">
                <h1>เข้าสู่ระบบ</h1>
                <p>กรุณากรอก Username และ Password</p>
            </div>

            <?php if ($error === 'invalid'): ?>
                <div class="alert alert-danger" role="alert">
                    <strong>CAN NOT LOGIN</strong><br>
                    Username หรือ Password ไม่ถูกต้อง
                </div>
            <?php endif; ?>

            <?php if ($error === 'logout'): ?>
                <div class="alert alert-success" role="alert">
                    ออกจากระบบเรียบร้อยแล้ว
                </div>
            <?php endif; ?>

            <form action="auth.php" method="POST">
                <div class="form-group">
                    <label for="username" class="form-label">Username</label>
                    <input 
                        type="text" 
                        class="form-control" 
                        id="username" 
                        name="username" 
                        placeholder="กรอก username"
                        required 
                        autofocus
                    >
                </div>

                <div class="form-group">
                    <label for="password" class="form-label">Password</label>
                    <input 
                        type="password" 
                        class="form-control" 
                        id="password" 
                        name="password" 
                        placeholder="กรอก password"
                        required
                    >
                </div>

                <button type="submit" class="btn-login">เข้าสู่ระบบ</button>
            </form>

            <div class="mt-3 text-center">
                <small class="text-muted">
                    ทดลองใช้: admin / admin123 หรือ student / student123
                </small>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
