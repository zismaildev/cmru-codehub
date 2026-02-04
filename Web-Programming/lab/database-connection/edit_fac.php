<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>แก้ไขข้อมูลคณะวิชา</title>
</head>
<body>
    <?php include("mainmenu.php"); ?>
    <div class="main">
        <?php
            $id = $_GET['id']; 
            include("connectDB.php");

            $sql = "SELECT * FROM faculty WHERE Fac_id = '$id'";
            $result = mysqli_query($connect, $sql);

            if ($row = mysqli_fetch_assoc($result)) {
        ?>
        <h3>แก้ไขข้อมูลคณะวิชา</h3>
        <form action="edit_fac2.php" method="post">
            รหัสคณะ <input type="text" name="id" value="<?php echo $row['Fac_id']; ?>" disabled> <br>
            <input type="hidden" name="id" value="<?php echo $row['Fac_id']; ?>">
            ชื่อคณะวิชา <input type="text" name="name" value="<?php echo $row['Fac_name']; ?>" required> <br>
            <input type="reset" name="reset" value="ยกเลิก">
            <input type="submit" name="submit" value="แก้ไขข้อมูล">
        </form>
        <?php
            } else {
                echo "ไม่พบข้อมูลคณะวิชานี้";
            }
            mysqli_close($connect);
        ?>
    </div>
</body>
</html>
