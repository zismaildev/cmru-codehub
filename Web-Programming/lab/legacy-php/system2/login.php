<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <?php
        include("nav.php");
    ?>
    <div class="login-container">
        <h2>Login</h2>
        <form action="" method="post">
            <div class="input-group">
                <input type="text" name="username" required>
                <label>Username</label>
            </div>
            <div class="input-group">
                <input type="password" name="password" required>
                <label>Password</label>
            </div>
            <button type="submit" name="submit">Login</button>
        </form>
    </div>

    <?php
        if (isset($_POST['submit'])) {
            $user = $_POST['username'];
            $password = $_POST['password'];

            if ($user == 'Zismail' && $password == '1123') {
                session_start();
                $_SESSION['name'] = "Nattapong Panthiya";
                $_SESSION['username'] = $user;
                $_SESSION['password'] = $password;
                header("Refresh:0; url='index.php' ");
                exit();
            } else {
                echo "<script>alert('Username or password incorrect');</script>";
            }
        }
    ?>
</body>
</html>
