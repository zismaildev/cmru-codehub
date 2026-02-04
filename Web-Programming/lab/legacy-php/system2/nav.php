<nav>
    <div class="logo">
        <h1><a href="/system/index.php">ZismailDev</a></h1>
    </div>
    <ul class="nav-links main-nav">
        <li><a href="/system/new.php">New</a></li>
        <li><a href="/system/activity.php">Activity</a></li>
        <li><a href="#contact">Contact</a></li>
    </ul>
    <?php
        if (isset($_SESSION['username'])) {
            echo '
            <ul class="nav-links auth-nav">
                <li><a href="logout.php">Logout</a></li>
            </ul>
            ';
        } else {
            echo '
            <ul class="nav-links auth-nav">
                <li><a href="login.php">Login</a></li>
            </ul>
            ';
        }
    ?>
</nav>

<style>
    nav {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: #444;
        padding: 15px 30px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    /* Logo Styles */
    .logo h1 {
        margin: 0;
        font-size: 28px;
    }

    .logo a {
        color: #fff;
        text-decoration: none;
    }

    .logo a:hover {
        color: #ddd;
    }

    /* Navigation Links */
    .nav-links {
        list-style: none;
        display: flex;
        margin: 0;
        padding: 0;
    }

    .nav-links li {
        margin-left: 25px;
    }

    .nav-links a {
        color: #fff;
        text-decoration: none;
        font-size: 18px;
        padding: 5px 10px;
        border-radius: 5px;
        transition: background-color 0.3s ease, color 0.3s ease;
    }

    .nav-links a:hover {
        background-color: #555;
        color: #fff;
    }

    /* Differentiate between main nav and auth nav */
    .auth-nav li {
        background-color: #ff4500;
        border-radius: 5px;
    }

    .auth-nav a {
        color: #fff;
        font-weight: bold;
    }

    .auth-nav a:hover {
        background-color: #ff6347;
    }
</style>
