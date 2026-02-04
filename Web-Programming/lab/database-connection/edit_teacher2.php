<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>อัปเดตข้อมูลอาจารย์</title>
</head>
<body>
    <?php include("mainmenu.php"); ?>
    <div class="main">
        <?php
            if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['id'])) {
                $id = $_GET['id']; 
                include("connectDB.php");

                $sql = "SELECT * FROM Teacher WHERE Teacher_id = '$id'";
                $result = mysqli_query($connect, $sql);

                if ($row = mysqli_fetch_assoc($result)) {
        ?>
        <h3>แก้ไขข้อมูลอาจารย์</h3>
        <form action="edit_teacher.php" method="post">
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
            } elseif ($_SERVER["REQUEST_METHOD"] == "POST") {
                if (isset($_POST['id']) && isset($_POST['first_name']) && isset($_POST['last_name']) && isset($_POST['tel']) && isset($_POST['room'])) {
                    $id = $_POST['id'];
                    $first_name = $_POST['first_name'];
                    $last_name = $_POST['last_name'];
                    $tel = $_POST['tel'];
                    $room = $_POST['room'];

                    include("connectDB.php");

                    $sql = "UPDATE Teacher SET Teacher_name=?, Teacher_surname=?, Teacher_tel=?, Teacher_room=? WHERE Teacher_id=?";
                    
                    $stmt = mysqli_prepare($connect, $sql);
                    mysqli_stmt_bind_param($stmt, "ssssi", $first_name, $last_name, $tel, $room, $id);

                    if (mysqli_stmt_execute($stmt)) {
                        echo "ข้อมูลอาจารย์ได้ถูกอัปเดตแล้ว";
                    } else {
                        echo "ไม่สามารถอัปเดตข้อมูล: " . mysqli_stmt_error($stmt);
                    }

                    mysqli_stmt_close($stmt);
                    mysqli_close($connect);
                } else {
                    echo "ไม่พบข้อมูลในการส่ง";
                }
            } else {
                echo "ไม่พบข้อมูลในการส่ง";
            }
        ?>
    </div>
</body>
</html>
