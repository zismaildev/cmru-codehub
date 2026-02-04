<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calculator</title>
</head>
<body>
    <?php
    if (isset($_POST['num1']) && isset($_POST['num2']) && isset($_POST['operation'])) {
        $num1 = (float)$_POST['num1'];
        $num2 = (float)$_POST['num2'];
        $operation = $_POST['operation'];
        
        switch ($operation) {
            case 'add':
                $result = $num1 + $num2;
                $operationText = 'บวก';
                break;
            case 'subtract':
                $result = $num1 - $num2;
                $operationText = 'ลบ';
                break;
            default:
                $result = '';
                $operationText = '';
                break;
        }
        
        echo "<h2>ผลลัพธ์การ $operationText</h2>";
        echo "<p>$num1 $operationText $num2 = $result</p>";
    }
    ?>
    <div>
        <h2>Calculator</h2>
        <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post"><br>
            <input type="number" name="num1" placeholder="Enter number 1" required><br>
            <input type="number" name="num2" placeholder="Enter number 2" required><br>
            <button type="submit" name="operation" value="add">บวก</button>
            <button type="submit" name="operation" value="subtract">ลบ</button>
            <button type="reset">ยกเลิก</button>
        </form>
    </div>
</body>
</html>
