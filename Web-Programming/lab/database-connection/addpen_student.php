<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>เพิ่มข้อมูลนักศึกษา</title>
</head>
<body>
    <?php include("mainmenu.php"); ?>
    <div class="main">
        <h3>เพิ่มข้อมูลนักศึกษา</h3>
        <form method="post">
            รหัสนักศึกษา <input type="text" name="id" required> <br>
            ชื่อ <input type="text" name="name" required> <br>
            นามสกุล <input type="text" name="surname" required> <br>
            เบอร์โทร <input type="text" name="tel" required> <br>
            รหัสคณะ <input type="text" name="fac_id" required> <br>
            <input type="reset" name="reset" value="ยกเลิก">
            <input type="submit" name="submit" value="เพิ่มข้อมูล">
        </form>
        <hr>
        <?php
            if(isset($_POST['submit']))
            {
                $id = $_POST['id'];
                $name = $_POST['name'];
                $surname = $_POST['surname'];
                $tel = $_POST['tel'];
                $fac_id = $_POST['fac_id'];

                include("connectDB.php");

                // ตรวจสอบรหัสนักศึกษา
                $sql2 = "SELECT * FROM student WHERE Student_id = '$id'";
                $result2 = mysqli_query($connect, $sql2);
                $num_r = mysqli_num_rows($result2);

                if($num_r == 0)
                {
                    // เพิ่มข้อมูลนักศึกษา
                    $sql = "INSERT INTO student (Student_id, Student_name, Student_surname, Student_tel, Fac_id) 
                            VALUES ('$id', '$name', '$surname', '$tel', '$fac_id')";
                    $result = mysqli_query($connect, $sql);

                    if($result)
                    {
                        echo "บันทึกข้อมูลนักศึกษาแล้ว";
                    }
                    else {
                        echo "ไม่สามารถบันทึกข้อมูล: " . mysqli_error($connect);
                    }
                } else {
                    echo "ข้อมูลนักศึกษาอยู่ในระบบแล้ว";
                }
                mysqli_close($connect);
            }
        ?>
    </div>
</body>
</html>
