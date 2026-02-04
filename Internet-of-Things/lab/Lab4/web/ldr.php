<?php
require 'db.php';

// ดึงข้อมูลล่าสุดจาก LDR Sensor
$ldr_stmt = $pdo->query("SELECT id, ldr_state, raw_value, created_at FROM ldr_data ORDER BY created_at DESC");
$ldr_data = $ldr_stmt->fetchAll();
?>
<!DOCTYPE html>
<html lang="th">

<head>
    <meta charset="UTF-8">
    <title>ข้อมูล Sensor LDR</title>
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
                    <li class="nav-item"><a class="nav-link" href="rain.php">Rain</a></li>
                    <li class="nav-item"><a class="nav-link active" href="ldr.php">LDR</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <h2 class="mb-4">ข้อมูลที่ได้จาก LDR Sensor</h2>
        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>สถานะแสง</th>
                        <th>ค่าดิบ (Raw Value)</th>
                        <th>เวลาที่บันทึก</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    if ($ldr_data) {
                        foreach ($ldr_data as $row) {
                            echo "<tr>";
                            echo "<td>" . htmlspecialchars($row['id']) . "</td>";
                            echo "<td>" . htmlspecialchars($row['ldr_state']) . "</td>";
                            echo "<td>" . htmlspecialchars($row['raw_value']) . "</td>";
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
