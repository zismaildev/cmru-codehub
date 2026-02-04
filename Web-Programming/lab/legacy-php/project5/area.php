<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>คำนวณพื้นที่วงกลม หรือ ความยาวเส้นรอบวง</title>
</head>
<body>
    <h1>คำนวณพื้นที่วงกลม หรือ ความยาวเส้นรอบวง</h1>
    <form method="post" action="">
        <label for="radius">กรุณาใส่รัศมี:</label>
        <input type="number" id="radius" name="radius" step="0.01" required>
        <br><br>
        <label for="calculation">เลือกการคำนวณ:</label>
        <select id="calculation" name="calculation" required>
            <option value="area">คำนวณพื้นที่วงกลม</option>
            <option value="circumference">คำนวณความยาวเส้นรอบวง</option>
        </select>
        <br><br>
        <input type="submit" value="คำนวณ">
    </form>

    <?php
    function calculateArea($radius) {
        return 3.14 * $radius * $radius;
    }

    function calculateCircumference($radius) {
        return 2 * 3.14 * $radius;
    }

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $radius = isset($_POST['radius']) ? floatval($_POST['radius']) : 0;
        $calculation = isset($_POST['calculation']) ? $_POST['calculation'] : '';

        if ($radius > 0) {
            if ($calculation == 'area') {
                $result = calculateArea($radius);
                echo "<p>พื้นที่วงกลมที่มีรัศมี $radius คือ: " . number_format($result, 2) . "</p>";
            } elseif ($calculation == 'circumference') {
                $result = calculateCircumference($radius);
                echo "<p>ความยาวเส้นรอบวงที่มีรัศมี $radius คือ: " . number_format($result, 2) . "</p>";
            } else {
                echo "<p>กรุณาเลือกการคำนวณที่ถูกต้อง</p>";
            }
        } else {
            echo "<p>กรุณาใส่รัศมีที่ถูกต้อง</p>";
        }
    }
    ?>
</body>
</html>
