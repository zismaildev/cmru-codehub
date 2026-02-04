<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>แสดงข้อมูลนักศึกษา</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<?php
    $con = mysqli_connect("localhost", "root", "", "registration420") or die("เกิดข้อผิดพลาดเกิดขึ้น");
    if ($con) {
        echo "<h1>เชื่อมต่อฐานข้อมูลสำเร็จ</h1>";
        echo "<h1>ณัฐพงษ์ ปันธิยะ</h1>";
        echo "<h2>รหัสนักศึกษา : 66143420</h2>";
    }
    mysqli_set_charset($con, 'utf8');

    $sql = "SELECT s.stu_id, s.stu_name, s.major_id, m.major_name, s.faculty_id, f.faculty_name FROM student420 s INNER JOIN major420 m ON s.major_id = m.major_id INNER JOIN faculty420 f ON s.Faculty_id = f.faculty_id;";
    $result = mysqli_query($con, $sql);

    while ($dbarray = mysqli_fetch_array($result)) {
        echo '<div class="product">';
        echo "รหัสนักศึกษา: " . $dbarray['stu_id'] . "<br>ชื่อ: " . $dbarray['stu_name'] .  "<br>คณะ: " . $dbarray['faculty_name'] . "<br>วิชาเอก: " . $dbarray['major_name'] ;
        echo '</div>';
    }

    echo "<p>จบการทำงาน</p>";
    mysqli_close($con);
?>

</body>
</html>