<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Food</title>
</head>
<body>
    <h2>Order Food</h2>
    <form method="POST">
        <label for="dish1">ข้าวผิดกระเพรา (ราคา 65 บาท):</label>
        <input type="number" id="dish1" name="dish1" min="0" value="0"><br><br>
        
        <label for="dish2">ข้าวขาหมู (ราคา 70 บาท):</label>
        <input type="number" id="dish2" name="dish2" min="0" value="0"><br><br>
        
        <label for="dish3">ข้าวหน้าปลาไหล (ราคา 100 บาท):</label>
        <input type="number" id="dish3" name="dish3" min="0" value="0"><br><br>
        
        <button type="submit">Calculate Total</button>
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $price_dish1 = 65;
        $price_dish2 = 70;
        $price_dish3 = 100;

        $quantity_dish1 = $_POST["dish1"];
        $quantity_dish2 = $_POST["dish2"];
        $quantity_dish3 = $_POST["dish3"];

        $total_price = ($quantity_dish1 * $price_dish1) + ($quantity_dish2 * $price_dish2) + ($quantity_dish3 * $price_dish3);

        echo "<h3>Total Price: $total_price บาท</h3>";
    }
    ?>
</body>
</html>
