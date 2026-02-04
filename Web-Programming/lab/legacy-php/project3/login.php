<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <script>
        function myFunction() {
            var x = document.getElementById("password");
            if (x.type === "password") {
                x.type = "text";
            } else {
                x.type = "password";
            }
        }
    </script>
</head>
<body>
    <h2>Login Form</h2>
    <form method="POST">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        <input type="checkbox" onclick="myFunction()">Show Password<br><br>
        <button type="submit">Login</button>
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $correct_username = "admin";
        $correct_password = "PwsNaKa";

        $username = $_POST["username"];
        $password = $_POST["password"];

        if ($username == $correct_username && $password == $correct_password) {
            echo "<h3>ยินดีต้อนรับ $username!</h3>";
        } else {
            echo "<h3>ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง</h3>";
        }
    }
    ?>
</body>
</html>
