<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
    include("mainmenu.php");
    ?>
        <div class="main">
            <?php
                $id = $_GET['id'];
                include("connectDB.php");
                $sql = "delete from faculty where Fac_id = $id";
                $result = mysqli_query($connect, $sql);
                echo "ลบข้อมูลเรียบร้อยแล้ว";
                mysqli_close($connect);
            ?>
        </div>
    ?>
</body>
</html>