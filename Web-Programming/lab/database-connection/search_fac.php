<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php include("mainmenu.php"); ?>
    <div class="main">
        <h3>ค้นหาข้อมูลคณะวิชา</h3>
        <form method="post">
            <input type="text" name="search" placeholder="ค้นหาชื่อคณะ" required>
            <input type="submit" name="submit" value="ค้นหา">
        </form>
        <hr/>
        <?php
            if(isset($_POST['submit'])) {
                $search = $_POST['search'];
                include("connectDB.php");

                $sql = "SELECT * FROM faculty WHERE Fac_name LIKE '%$search%'";
                $result = mysqli_query($connect, $sql);
                $num_r = mysqli_num_rows($result);

                if ($num_r == 0) {
                    echo "ไม่พบข้อมูล";
                } else {
                    ?>
                    <table width=80% border=1>
                        <tr>
                            <th width=25%> รหัสคณะ </th>
                            <th>ชื่อคณะ</th>
                            <th>แก้ไข</th>
                            <th>ลบ</th>
                        </tr>
                    <?php
                    while($row = mysqli_fetch_assoc($result)) { ?>
                        <tr>
                            <td width=25%><?php echo $row['Fac_id']; ?> </td>
                            <td><?php echo $row['Fac_name']; ?> </td>
                            <td><a href="edit_fac.php?id=<?php echo $row['Fac_id']; ?>">แก้ไข</a></td>
                            <td><a href="del_fac.php?id=<?php echo $row['Fac_id']; ?>" onclick="return confirm('คุณแน่ใจหรือไม่ว่าต้องการลบข้อมูลนี้?');">ลบ</a></td>
                        </tr>
                    <?php
                    }
                    echo "</table>";
                }
                mysqli_close($connect);
            }
        ?>
    </div>
</body>
</html>
