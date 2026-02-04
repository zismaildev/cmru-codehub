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
            if ($_SERVER["REQUEST_METHOD"] == "POST") {
                if (isset($_POST['id'])) {
                    $id = $_POST['id'];
                    $name = $_POST['name'];

                    include("connectDB.php");

                    $sql = "UPDATE faculty SET Fac_name='$name' WHERE Fac_id='$id'";

                    if (mysqli_query($connect, $sql)) {
                        echo "ข้อมูลคณะวิชาได้ถูกอัปเดตแล้ว";
                    } else {
                        echo "ไม่สามารถอัปเดตข้อมูล: " . mysqli_error($connect);
                    }

                    mysqli_close($connect);
                } else {
                    echo "ไม่พบรหัสคณะในการส่ง";
                }
            } else {
                echo "ไม่พบข้อมูลในการส่ง";
            }
        ?>
    </div>
</body>
</html>
