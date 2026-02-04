<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Number</title>
</head>
<body>
<?php
    function findMaxMin($numbers) {
        $max = max($numbers);
        $min = min($numbers);
        return array('max' => $max, 'min' => $min);
    }

    // ตัวอย่างการใช้งาน
    $numbers = array(12, 45, 7, 89, 23);
    $result = findMaxMin($numbers);

    echo "ตัวเลขที่กำหนด: " . implode(", ", $numbers) . "\n";
    echo "ตัวเลขมากที่สุด: " . $result['max'] . "\n";
    echo "ตัวเลขน้อยที่สุด: " . $result['min'] . "\n";
?>

</body>
</html>