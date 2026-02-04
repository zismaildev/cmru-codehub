<!DOCTYPE html>
<html>
<head>
    <title>ฟอร์มรับบริจาคสิ่งของช่วยน้ำท่วม</title>
</head>
<body>
    <h2>ฟอร์มรับบริจาคสิ่งของช่วยน้ำท่วม</h2>
    <form method="post" action="">
        <label for="water">จำนวนขวดน้ำ (ขวด): </label>
        <input type="number" name="water" id="water" required><br><br>

        <label for="bread">จำนวนขนมปังก้อน (ก้อน): </label>
        <input type="number" name="bread" id="bread" required><br><br>

        <label for="eggs">จำนวนไข่ต้ม (ฟอง): </label>
        <input type="number" name="eggs" id="eggs" required><br><br>

        <input type="submit" name="submit" value="คำนวณจำนวนถุงยังชีพ">
    </form>

    <?php
    if (isset($_POST['submit'])) {
        $water = $_POST['water'];
        $bread = $_POST['bread'];
        $eggs = $_POST['eggs'];

        $water_per_bag = 3;
        $bread_per_bag = 2;
        $eggs_per_bag = 5;

        $total_bags = min(floor($water / $water_per_bag), floor($bread / $bread_per_bag), floor($eggs / $eggs_per_bag));

        $remaining_water = $water - ($total_bags * $water_per_bag);
        $remaining_bread = $bread - ($total_bags * $bread_per_bag);
        $remaining_eggs = $eggs - ($total_bags * $eggs_per_bag);

        echo "<h3>ผลการคำนวณ:</h3>";
        echo "จำนวนถุงยังชีพที่สามารถจัดได้: " . $total_bags . " ถุง<br>";
        echo "สิ่งของที่เหลือ:<br>";
        echo "ขวดน้ำ: " . $remaining_water . " ขวด<br>";
        echo "ขนมปังก้อน: " . $remaining_bread . " ก้อน<br>";
        echo "ไข่ต้ม: " . $remaining_eggs . " ฟอง<br>";
    }
    ?>
</body>
</html>
