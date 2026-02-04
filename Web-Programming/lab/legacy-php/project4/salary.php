<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<?php
    function roundSalary($salary) {
        return round($salary); // ปัดเศษให้เป็นจำนวนเต็มใกล้เคียง
    }

    function floorSalary($salary) {
        return floor($salary); // ปัดลง
    }

    function ceilSalary($salary) {
        return ceil($salary); // ปัดขึ้น
    }

    // ตัวอย่างการใช้งาน
    $salary = 1234.5678;

    $roundedSalary = roundSalary($salary);
    echo "เงินเดือนก่อนปัดเศษ: $salary\n";
    echo "เงินเดือนหลังปัดเศษให้เป็นจำนวนเต็มใกล้เคียง: $roundedSalary\n";

    $flooredSalary = floorSalary($salary);
    echo "เงินเดือนหลังปัดเศษลง: $flooredSalary\n";

    $ceiledSalary = ceilSalary($salary);
    echo "เงินเดือนหลังปัดเศษขึ้น: $ceiledSalary\n";
?>


</body>
</html>