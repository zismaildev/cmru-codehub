<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>เพิ่มข้อมูลอาจารย์</title>
</head>
<body>
    <?php include("mainmenu.php"); ?>
    <div class="main">
        <h3>เพิ่มข้อมูลอาจารย์</h3>
        <form method="post">
            รหัสอาจารย์ <input type="text" name="id" required> <br>
            ชื่ออาจารย์ <input type="text" name="name" required> <br>
            นามสกุลอาจารย์ <input type="text" name="surname" required> <br>
            เบอร์โทรศัพท์ <input type="text" name="tel" required> <br>
            ห้องพัก <input type="text" name="room" required> <br>
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
                $room = $_POST['room'];

                include("connectDB.php");

                $sql2 = "SELECT * FROM teacher WHERE Teacher_id = '$id'";
                $result2 = mysqli_query($connect, $sql2);
                $num_r = mysqli_num_rows($result2);

                if($num_r == 0)
                {
                    $sql = "INSERT INTO teacher (Teacher_id, Teacher_name, Teacher_surname, Teacher_tel, Teacher_room) 
                            VALUES ('$id', '$name', '$surname', '$tel', '$room')";
                    $result = mysqli_query($connect, $sql);

                    if($result)
                    {
                        echo "บันทึกข้อมูลอาจารย์แล้ว";
                    }
                    else {
                        echo "ไม่สามารถบันทึกข้อมูล: " . mysqli_error($connect);
                    }
                } else {
                    echo "ข้อมูลซ้ำ: รหัสอาจารย์นี้มีอยู่ในระบบแล้ว";
                }
                mysqli_close($connect);
            }
        ?>
    </div>
</body>
</html>
