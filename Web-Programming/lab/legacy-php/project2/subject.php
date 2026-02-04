<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Subject</title>
</head>
<body>
    <?php
        $course_code = "COM 2305-63";
        
        $course_name = "Web Programming";
        
        $credits = 3;

        $output = sprintf("รหัสวิชา: %s<br>ชื่อวิชา: %s<br>หน่วยกิต: %d", $course_code, $course_name, $credits);

        echo $output;
    ?>
</body>
</html>
