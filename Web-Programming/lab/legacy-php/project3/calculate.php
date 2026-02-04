<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calculator</title>
</head>
<body>
    <h2>Calculator</h2>
    <form method="POST">
        <label for="number1">Enter number 1:</label>
        <input type="number" id="number1" name="number1" required><br><br>
        
        <label for="operator">Choose an operator:</label>
        <select id="operator" name="operator" required>
            <option value="">Select operator</option>
            <option value="+">+</option>
            <option value="-">-</option>
            <option value="*">*</option>
            <option value="/">/</option>
        </select><br><br>
        
        <label for="number2">Enter number 2:</label>
        <input type="number" id="number2" name="number2" required><br><br>
        
        <button type="submit">Calculate</button>
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $number1 = $_POST["number1"];
        $operator = $_POST["operator"];
        $number2 = $_POST["number2"];

        switch ($operator) {
            case '+':
                $result = $number1 + $number2;
                echo "<h3>ผลบวกของ $number1 และ $number2 คือ $result</h3>";
                break;
            case '-':
                $result = $number1 - $number2;
                echo "<h3>ผลต่างของ $number1 และ $number2 คือ $result</h3>";
                break;
            case '*':
                $result = $number1 * $number2;
                echo "<h3>ผลคูณของ $number1 และ $number2 คือ $result</h3>";
                break;
            case '/':
                if ($number2 == 0) {
                    echo "<h3>ไม่สามารถหารด้วยศูนย์ได้</h3>";
                } else {
                    $result = $number1 / $number2;
                    echo "<h3>ผลหารของ $number1 และ $number2 คือ $result</h3>";
                }
                break;
            default:
                echo "<h3>โปรดเลือกสัญลักษณ์คณิตศาสตร์ที่ถูกต้อง</h3>";
                break;
        }
    }
    ?>
</body>
</html>
