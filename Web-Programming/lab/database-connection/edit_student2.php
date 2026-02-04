<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>อัปเดตข้อมูลนักศึกษา</title>
</head>
<body>
    <?php include("mainmenu.php"); ?>
    <div class="main">
        <?php
            if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['id'])) {
                $id = $_GET['id']; 
                include("connectDB.php");

                // ดึงข้อมูลนักศึกษาจากฐานข้อมูล
                $sql = "SELECT * FROM student WHERE Student_id = '$id'";
                $result = mysqli_query($connect, $sql);

                if ($row = mysqli_fetch_assoc($result)) {
        ?>
        <h3>แก้ไขข้อมูลนักศึกษา</h3>
        <form action="edit_student.php" method="post">
            รหัสนักศึกษา <input type="text" name="id" value=<?php echo $row['Student_id']; ?> required readonly> <br>
            ชื่อ <input type="text" name="first_name" value=<?php echo $row['Student_name']; ?> required> <br>
            นามสกุล <input type="text" name="last_name" value=<?php echo $row['Student_surname']; ?> required> <br>
            เบอร์โทร <input type="text" name="tel" value=<?php echo $row['Student_tel']; ?> required> <br>
            รหัสคณะ <input type="text" name="faculty_id" value=<?php echo $row['Fac_id']; ?> required readonly> <br>
            <input type="reset" name="reset" value="ยกเลิก">
            <input type="submit" name="submit" value="แก้ไขข้อมูล">
        </form>
        <?php
                } else {
                    echo "ไม่พบข้อมูลนักศึกษา";
                }
                mysqli_close($connect);
            } elseif ($_SERVER["REQUEST_METHOD"] == "POST") {
                // ตรวจสอบการส่งข้อมูล
                if (isset($_POST['id']) && isset($_POST['first_name']) && isset($_POST['last_name']) && isset($_POST['tel'])) {
                    $id = $_POST['id'];
                    $first_name = $_POST['first_name'];
                    $last_name = $_POST['last_name'];
                    $tel = $_POST['tel'];

                    include("connectDB.php");

                    // คำสั่ง SQL สำหรับอัปเดตข้อมูลนักศึกษา
                    $sql = "UPDATE student SET Student_name=?, Student_surname=?, Student_tel=? WHERE Student_id=?";
                    
                    // เตรียมคำสั่ง SQL
                    $stmt = mysqli_prepare($connect, $sql);
                    mysqli_stmt_bind_param($stmt, "sssi", $first_name, $last_name, $tel, $id);

                    // ดำเนินการคำสั่ง SQL
                    if (mysqli_stmt_execute($stmt)) {
                        echo "ข้อมูลนักศึกษาได้ถูกอัปเดตแล้ว";
                    } else {
                        echo "ไม่สามารถอัปเดตข้อมูล: " . mysqli_stmt_error($stmt);
                    }

                    // ปิดคำสั่งและการเชื่อมต่อ
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
