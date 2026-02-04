<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>รายงานข้อมูลนักศึกษา</title>
</head>

<body>
    <?php include("mainmenu.php"); ?>
    <div class="main">
        <h3>รายงานข้อมูลนักศึกษา</h3>
        <table width=100% border="1">
            <tr>
                <th>รหัสนักศึกษา</th>
                <th>ชื่อ</th>
                <th>นามสกุล</th>
                <th>เบอร์โทรศัพท์</th>
                <th>รหัสคณะ</th>
            </tr>

            <?php
            include("connectDB.php");

            if ($connect) {
                $sql = "SELECT * FROM student ORDER BY Student_id";
                $result = mysqli_query($connect, $sql);

                if (mysqli_num_rows($result) > 0) {
                    while ($row = mysqli_fetch_assoc($result)) { ?>
                        <tr>
                            <td width=25%> <?php echo $row['Student_id']; ?> </td>
                            <td> <?php echo $row['Student_name']; ?> </td>
                            <td> <?php echo $row['Student_surname']; ?> </td>
                            <td> <?php echo $row['Student_tel']; ?> </td>
                            <td> <?php echo $row['Fac_id']; ?> </td>
                        </tr>
                    <?php
                    }
                } else {
                    echo "<tr><td colspan='5'>ไม่พบข้อมูลนักศึกษา</td></tr>";
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
