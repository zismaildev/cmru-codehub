<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>แปลงปี ค.ศ. เป็นปี พ.ศ.</title>
</head>
<body>
    <h1>แปลงปี ค.ศ. เป็นปี พ.ศ.</h1>
    <form method="post" action="">
        <label for="year">กรุณาใส่ปี ค.ศ.:</label>
        <input type="number" id="year" name="year" required>
        <input type="submit" value="แปลง">
    </form>

    <?php
    function convertToBE($year) {
        return $year + 543;
    }

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $year = isset($_POST['year']) ? intval($_POST['year']) : 0;
        if ($year > 0) {
            $beYear = convertToBE($year);
            echo "<p>ปี พ.ศ. ที่แปลงจากปี ค.ศ. $year คือ: $beYear</p>";
        } else {
            echo "<p>กรุณาใส่ปี ค.ศ. ที่ถูกต้อง</p>";
        }
    }
    ?>
</body>
</html>
