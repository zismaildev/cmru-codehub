<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>การสมัครสมาชิก</title>
</head>
<body>
    <h2>การสมัครสมาชิก</h2>
    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $username = htmlspecialchars($_POST['username']);
        $email = htmlspecialchars($_POST['email']);
        $password = htmlspecialchars($_POST['password']);
        
        echo "<p>ชื่อผู้ใช้: $username</p>";
        echo "<p>อีเมล: $email</p>";
    } else {
        echo "<p>ไม่มีข้อมูลสำหรับการสมัครสมาชิก</p>";
    }
    ?>
</body>
</html>
