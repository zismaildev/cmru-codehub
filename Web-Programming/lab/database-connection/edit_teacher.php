<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>แก้ไขข้อมูลอาจารย์</title>
</head>
<body>
    <?php include("mainmenu.php"); ?>
    <div class="main">
        <?php
            $id = $_GET['id']; 
            include("connectDB.php");

            $sql = "SELECT * FROM teacher WHERE Teacher_id = '$id'";
            $result = mysqli_query($connect, $sql);

            if ($row = mysqli_fetch_assoc($result)) {
        ?>
        <h3>แก้ไขข้อมูลอาจารย์</h3>
        <form action="edit_teacher2.php" method="post">
            รหัสอาจารย์ <input type="text" name="id" value=<?php echo $row['Teacher_id']; ?> readonly> <br>
            ชื่อ <input type="text" name="first_name" value=<?php echo $row['Teacher_name']; ?> required> <br>
            นามสกุล <input type="text" name="last_name" value=<?php echo $row['Teacher_surname']; ?> required> <br>
            เบอร์โทร <input type="text" name="tel" value=<?php echo $row['Teacher_tel']; ?> required> <br>
            ห้องพักอาจารย์ <input type="text" name="room" value=<?php echo $row['Teacher_room']; ?> required> <br>
            <input type="reset" name="reset" value="ยกเลิก">
            <input type="submit" name="submit" value="แก้ไขข้อมูล">
        </form>
        <?php
            } else {
                echo "ไม่พบข้อมูลอาจารย์";
            }
            mysqli_close($connect);
        ?>
    </div>
</body>
</html>
