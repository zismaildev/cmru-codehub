<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>รายงานข้อมูล</title>
</head>

<body>
    <?php include("mainmenu.php"); ?>
    <div class="main">
        <h3>รายงานข้อมูลคณะวิชา</h3>
        <table width=100% border="1">
            <tr>
                <th>รหัสคณะ</th>
                <th>ชื่อคณะวิชา</th>
            </tr>

            <?php
            include("connectDB.php");

            if ($connect) {
                $sql = "SELECT * FROM faculty ORDER BY Fac_id";
                $result = mysqli_query($connect, $sql);

                if (mysqli_num_rows($result) > 0) {
                    while ($row = mysqli_fetch_assoc($result)) { ?>
                        <tr>
                            <td width=25%> <?php echo $row['Fac_id']; ?> </td>
                            <td> <?php echo $row['Fac_name']; ?> </td>
                        </tr>
                    <?php
                    }
                } else {
                    echo "<tr><td colspan='2'>ไม่พบข้อมูลคณะวิชา</td></tr>";
                }

                mysqli_close($connect);
            } else {
                echo "<tr><td colspan='2'>ไม่สามารถเชื่อมต่อฐานข้อมูลได้: " . mysqli_connect_error() . "</td></tr>";
            }
            ?>
        </table>
    </div>

</body>

</html>
