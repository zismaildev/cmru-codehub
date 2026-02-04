<?php
require 'db.php';

// ดึงข้อมูลล่าสุดจาก DHT11
$dht_stmt = $pdo->query("SELECT id, temperature, humidity, heat_index, created_at FROM dht_data ORDER BY created_at DESC");
$dht_data = $dht_stmt->fetchAll();
?>
<!DOCTYPE html>
<html lang="th">

<head>
    <meta charset="UTF-8">
    <title>ข้อมูล Sensor DHT11</title>
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
                    <li class="nav-item"><a class="nav-link active" href="dht.php">DHT11</a></li>
                    <li class="nav-item"><a class="nav-link" href="rain.php">Rain</a></li>
                    <li class="nav-item"><a class="nav-link" href="ldr.php">LDR</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <h2 class="mb-4">ข้อมูลที่ได้จาก DHT11</h2>
        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>อุณหภูมิ (°C)</th>
                        <th>ความชื้น (%)</th>
                        <th>รู้สึกเหมือน (°C)</th>
                        <th>เวลาที่บันทึก</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    if ($dht_data) {
                        foreach ($dht_data as $row) {
                            echo "<tr>";
                            echo "<td>" . htmlspecialchars($row['id']) . "</td>";
                            echo "<td>" . htmlspecialchars($row['temperature']) . "</td>";
                            echo "<td>" . htmlspecialchars($row['humidity']) . "</td>";
                            echo "<td>" . htmlspecialchars($row['heat_index']) . "</td>";
                            echo "<td>" . htmlspecialchars($row['created_at']) . "</td>";
                            echo "</tr>";
                        }
                    } else {
                        echo "<tr><td colspan='5'>ยังไม่มีข้อมูล</td></tr>";
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</body>

</html>
