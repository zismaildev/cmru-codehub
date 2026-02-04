<?php
    include("nav.php");
    echo "<h1>Welcome, " . $_COOKIE['name'] . "</h1>";
    echo "<p>Username: " . $_COOKIE['user'] . "</p>";
    echo "<p>Password: " . $_COOKIE['pass'] . "</p>";
    echo "<a href='cookie4.php' class='btn'>Go to Profile</a>";
?>