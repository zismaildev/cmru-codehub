<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>เพิ่มข้อมูลคณะวิชา</title>
</head>
<body>
    <?php include("mainmenu.php"); ?>
    <div class="main">
        <h3>เพิ่มข้อมูลคณะวิชา</h3>
        <form method="post">
            รหัสคณะ <input type="text" name="id" required> <br>
            ชื่อคณะวิชา <input type="text" name="name" required> <br>
            <input type="reset" name="reset" value="ยกเลิก">
            <input type="submit" name="submit" value="เพิ่มข้อมูล">
        </form>
        <hr>
        <?php
            if(isset($_POST['submit']))
            {
                $id = $_POST['id'];
                $name = $_POST['name'];

                include("connectDB.php");

                $sql2 = "SELECT * FROM faculty WHERE Fac_id = '$id'";
                $result2 = mysqli_query($connect, $sql2);
                $num_r = mysqli_num_rows($result2);

                if($num_r == 0)
                {
                    $sql = "INSERT INTO faculty (Fac_id, Fac_name) VALUES ('$id','$name')";
                    $result = mysqli_query($connect, $sql);

                    if($result)
                    {
                        echo "บันทึกข้อมูลแล้ว";
                    }
                    else {
                        echo "ไม่สามารถบันทึกข้อมูล: " . mysqli_error($conn);
                    }
                } else {
                    echo "ข้อมูลซ้ำ";
                }
                mysqli_close($connect);
            }
        ?>
    </div>
</body>
</html>
