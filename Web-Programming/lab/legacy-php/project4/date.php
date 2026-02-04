<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Date</title>
</head>
<body>
<?php
function getThaiDate($date) {
    $days = array("อาทิตย์", "จันทร์", "อังคาร", "พุธ", "พฤหัสบดี", "ศุกร์", "เสาร์");
    $months = array(
        1 => "มกราคม", "กุมภาพันธ์", "มีนาคม", "เมษายน", "พฤษภาคม", "มิถุนายน",
        "กรกฎาคม", "สิงหาคม", "กันยายน", "ตุลาคม", "พฤศจิกายน", "ธันวาคม"
    );

    $dayOfWeek = date("w", strtotime($date));
    $day = date("j", strtotime($date));
    $month = date("n", strtotime($date));
    $year = date("Y", strtotime($date)) + 543;

    return "วัน" . $days[$dayOfWeek] . " ที่ " . $day . " " . $months[$month] . " พ.ศ. " . $year;
}

$currentDate = date("Y-m-d");

echo getThaiDate($currentDate);
?>

</body>
</html>