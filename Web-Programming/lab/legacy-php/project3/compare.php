<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Compare Numbers</title>
</head>
<body>
    <h2>Compare Numbers</h2>
    <form method="POST">
        <label for="number1">Enter number 1:</label>
        <input type="number" id="number1" name="number1" required><br><br>
        <label for="number2">Enter number 2:</label>
        <input type="number" id="number2" name="number2" required><br><br>
        <button type="submit">Compare</button>
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $number1 = $_POST["number1"];
        $number2 = $_POST["number2"];

        if ($number1 > $number2) {
            echo "<p>$number1 มากกว่า $number2</p>";
        } elseif ($number1 < $number2) {
            echo "<p>$number1 น้อยกว่า $number2</p>";
        } else {
            echo "<p>$number1 เท่ากับ $number2</p>";
        }
    }
    ?>
</body>
</html>
