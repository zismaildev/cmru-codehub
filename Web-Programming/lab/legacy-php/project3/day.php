<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Week Days</title>
</head>
<body>
    <h2>Week Days</h2>

    <?php
    $weekdays = array(
        "Monday" => "จันทร์",
        "Tuesday" => "อังคาร",
        "Wednesday" => "พุธ",
        "Thursday" => "พฤหัสบดี",
        "Friday" => "ศุกร์",
        "Saturday" => "เสาร์",
        "Sunday" => "อาทิตย์"
    );

    foreach ($weekdays as $key => $value) {
        echo "<p>$key - $value</p>";
    }
    ?>
</body>
</html>
