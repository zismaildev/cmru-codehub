<?php
require 'db.php';

// ดึงข้อมูลล่าสุดจาก Rain Sensor
$rain_stmt = $pdo->query("SELECT id, rain_value, status, created_at FROM rain_data ORDER BY created_at DESC");
$rain_data = $rain_stmt->fetchAll();
?>
<!DOCTYPE html>
<html lang="th">

<head>
    <meta charset="UTF-8">
    <title>ข้อมูล Sensor Rain</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">IoT Dashboard</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item"><a class="nav-link" href="index.php">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="dht.php">DHT11</a></li>
                    <li class="nav-item"><a class="nav-link active" href="rain.php">Rain</a></li>
                    <li class="nav-item"><a class="nav-link" href="ldr.php">LDR</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <h2 class="mb-4">ข้อมูลที่ได้จาก Rain Sensor</h2>
        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>ปริมาณน้ำฝน</th>
                        <th>สถานะ</th>
                        <th>เวลาที่บันทึก</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    if ($rain_data) {
                        foreach ($rain_data as $row) {
                            echo "<tr>";
                            echo "<td>" . htmlspecialchars($row['id']) . "</td>";
                            echo "<td>" . htmlspecialchars($row['rain_value']) . "</td>";
                            echo "<td>" . htmlspecialchars($row['status']) . "</td>";
                            echo "<td>" . htmlspecialchars($row['created_at']) . "</td>";
                            echo "</tr>";
                        }
                    } else {
                        echo "<tr><td colspan='4'>ยังไม่มีข้อมูล</td></tr>";
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</body>

</html>
