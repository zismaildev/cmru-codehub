<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ค้นหาข้อมูลนักศึกษา</title>
</head>
<body>
    <?php include("mainmenu.php"); ?>
    <div class="main">
        <h3>ค้นหาข้อมูลนักศึกษา</h3>
        <form method="post">
            <input type="text" name="search" placeholder="ค้นหาชื่อหรือนามสกุลนักศึกษา" required>
            <input type="submit" name="submit" value="ค้นหา">
        </form>
        <hr/>
        <?php
            if(isset($_POST['submit'])) {
                $search = $_POST['search'];
                include("connectDB.php");

                $sql = "SELECT * FROM student WHERE Student_name LIKE '%$search%' OR Student_surname LIKE '%$search%'";
                $result = mysqli_query($connect, $sql);
                $num_r = mysqli_num_rows($result);

                if ($num_r == 0) {
                    echo "ไม่พบข้อมูลนักศึกษา";
                } else {
                    ?>
                    <table width=80% border=1>
                        <tr>
                            <th width=25%> รหัสนักศึกษา </th>
                            <th>ชื่อ</th>
                            <th>นามสกุล</th>
                            <th>เบอร์โทรศัพท์</th>
                            <th>แก้ไข</th>
                            <th>ลบ</th>
                        </tr>
                    <?php
                    while($row = mysqli_fetch_assoc($result)) { ?>
                        <tr>
                            <td width=25%><?php echo $row['Student_id']; ?> </td>
                            <td><?php echo $row['Student_name']; ?> </td>
                            <td><?php echo $row['Student_surname']; ?> </td>
                            <td><?php echo $row['Student_tel']; ?> </td>
                            <td><a href="edit_student.php?id=<?php echo $row['Student_id']; ?>">แก้ไข</a></td>
                            <td><a href="del_student.php?id=<?php echo $row['Student_id']; ?>" onclick="return confirm('คุณแน่ใจหรือไม่ว่าต้องการลบข้อมูลนี้?');">ลบ</a></td>
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
