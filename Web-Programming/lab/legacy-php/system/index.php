<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Zismail's Website</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <?php
        include("nav.php");
    ?>

    <section class="hero">
        <div class="hero-content">
            <h2>Welcome to My Website!</h2>
            <p>I'm Zismail, a passionate developer from Chiang Mai.</p>
            <a href="login.php" class="btn">Login</a>
        </div>
    </section>

    <div class="container">
        <?php
            if (isset($_POST['submit'])) {
                $user = $_POST['username'];
                $password = $_POST['password'];

                if ($user == "Zismail" && $password == "1123") {

                    setcookie("name", "Nattapong Panthiya", time() + 60);
                    setcookie("user", $user, time() + 60);
                    setcookie("pass", $password, time() + 60); 

                    echo "<h1>Welcome, " . $_COOKIE['name'] . "</h1>";
                    echo "<p>Username: " . $_COOKIE['user'] . "</p>";
                    echo "<p>Password: " . $_COOKIE['pass'] . "</p>";
                    echo "<a href='cookie3.php' class='btn'>Go to Profile</a>";
                } else {
                    echo "<script>alert('Username or password incorrect');</script>";
                    header("Refresh:0; url='login.php'");
                    exit();
                }
            }
        ?>
    </div>

    <section id="about" class="content-section">
        <h2>About Me</h2>
        <p>
            สวัสดีครับ! ฉันชื่อ Zismail กำลังเรียนวิทยาการคอมพิวเตอร์ที่มหาวิทยาลัยราชภัฏเชียงใหม่ ฉันสนใจพัฒนาเว็บไซต์โดยใช้ Next.js, NextUI, และ MongoDB ฉันยังมีความหลงใหลในการเล่นเกม และเทคโนโลยีใหม่ๆ อยู่เสมอ
        </p>
    </section>

    <section id="projects" class="content-section">
        <h2>My Projects</h2>
        <ul>
            <li><strong>Zismail-Shop:</strong> A full-featured e-commerce platform using Next.js and MongoDB.</li>
            <li><strong>Portfolio:</strong> A personal portfolio website showcasing my skills and projects.</li>
            <li><strong>Game Companion App:</strong> A mobile app for tracking game stats and connecting with friends.</li>
        </ul>
    </section>

    <section id="contact" class="content-section">
        <h2>Contact Me</h2>
        <p>If you would like to get in touch, feel free to send me an email at <a href="mailto:nattapong130247@gmail.com">nattapong130247@gmail.com</a>.</p>
    </section>

    <footer>
        <p>&copy; 2024 ZismailDev. All Rights Reserved.</p>
    </footer>
</body>
</html>
