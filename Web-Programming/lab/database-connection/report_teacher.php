<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>รายงานข้อมูลอาจารย์</title>
</head>

<body>
    <?php include("mainmenu.php"); ?>
    <div class="main">
        <h3>รายงานข้อมูลอาจารย์</h3>
        <table width=100% border="1">
            <tr>
                <th>รหัสอาจารย์</th>
                <th>ชื่ออาจารย์</th>
                <th>นามสกุลอาจารย์</th>
                <th>เบอร์โทรศัพท์</th>
                <th>ห้องพัก</th>
            </tr>

            <?php
            include("connectDB.php");

            if ($connect) {
                $sql = "SELECT * FROM teacher ORDER BY Teacher_id";
                $result = mysqli_query($connect, $sql);

                if (mysqli_num_rows($result) > 0) {
                    while ($row = mysqli_fetch_assoc($result)) { ?>
                        <tr>
                            <td width=15%> <?php echo $row['Teacher_id']; ?> </td>
                            <td> <?php echo $row['Teacher_name']; ?> </td>
                            <td> <?php echo $row['Teacher_surname']; ?> </td>
                            <td> <?php echo $row['Teacher_tel']; ?> </td>
                            <td> <?php echo $row['Teacher_room']; ?> </td>
                        </tr>
                    <?php
                    }
                } else {
                    echo "<tr><td colspan='5'>ไม่พบข้อมูลอาจารย์</td></tr>";
                }

                mysqli_close($connect);
            } else {
                echo "<tr><td colspan='5'>ไม่สามารถเชื่อมต่อฐานข้อมูลได้: " . mysqli_connect_error() . "</td></tr>";
            }
            ?>
        </table>
    </div>

</body>

</html>
