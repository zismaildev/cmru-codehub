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
        session_start();
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
            if (isset($_SESSION['name']) && isset($_SESSION['username']) && isset($_SESSION['password'])) {
                echo "<h1>Welcome, " . htmlspecialchars($_SESSION['name']) . "</h1>";
                echo "<p>Username: " . htmlspecialchars($_SESSION['username']) . "</p>";
                echo "<p>Password: " . htmlspecialchars($_SESSION['password']) . "</p>";
            } else {
                echo "<p>Please log in to see your account details.</p>";
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
