<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>แก้ไขข้อมูลนักศึกษา</title>
</head>
<body>
    <?php include("mainmenu.php"); ?>
    <div class="main">
        <?php
            $id = $_GET['id']; 
            include("connectDB.php");

            $sql = "SELECT * FROM student WHERE Student_id = '$id'";
            $result = mysqli_query($connect, $sql);

            if ($row = mysqli_fetch_assoc($result)) {
        ?>
        <h3>แก้ไขข้อมูลนักศึกษา</h3>
        <form action="edit_student2.php" method="post">
            รหัสนักศึกษา <input type="text" name="id" value=<?php echo $row['Student_id']; ?>disabled> <br>
            ชื่อ <input type="text" name="first_name" value=<?php echo $row['Student_name']; ?> required> <br>
            นามสกุล <input type="text" name="last_name" value=<?php echo $row['Student_surname']; ?> required> <br>
            เบอร์โทร <input type="text" name="tel" value=<?php echo $row['Student_tel']; ?> required> <br>
            รหัสคณะ <input type="text" name="faculty_id" value=<?php echo $row['Fac_id']; ?> required> <br>
            <input type="reset" name="reset" value="ยกเลิก">
            <input type="submit" name="submit" value="แก้ไขข้อมูล">
        </form>
        <?php
            } else {
                echo "ไม่พบข้อมูลนักศึกษา";
            }
            mysqli_close($connect);
        ?>
    </div>
</body>
</html>
