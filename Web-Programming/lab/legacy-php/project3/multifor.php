<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Multiplication Table</title>
</head>
<body>
    <h1>Multiplication Table</h1>
    <form method="POST">
        <label for="number">Enter a number:</label>
        <input type="number" id="number" name="number" required>
        <button type="submit">Show Table</button>
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $number = intval($_POST["number"]);
        echo "<h2>Multiplication Table of $number</h2>";
        echo "<ul>";
        for ($i = 1; $i <= 12; $i++) {
            $result = $number * $i;
            echo "<li>$number x $i = $result</li>";
        }
        echo "</ul>";
    }
    ?>
</body>
</html>
