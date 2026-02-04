<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>แสดงข้อความภาษาไทย</title>
</head>
<body>
    <?php
        $thaiNumbers = array("ศูนย์", "หนึ่ง", "สอง", "สาม", "สี่", "ห้า", "หก", "เจ็ด", "แปด", "เก้า");

        echo "<ul>";
        foreach ($thaiNumbers as $number) {
            echo "<li>$number</li>";
        }
        echo "</ul>";
    ?>
</body>
</html>
