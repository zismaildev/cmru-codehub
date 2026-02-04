<?php
require 'db.php';

// ดึงข้อมูลล่าสุด 50 แถวจาก DHT + Ultrasonic รวมกัน
$dht_stmt = $pdo->query("SELECT 'DHT11' as sensor, temperature as value1, humidity as value2, created_at as time FROM dht ORDER BY created_at DESC LIMIT 50");
$dht_rows = $dht_stmt->fetchAll(PDO::FETCH_ASSOC);

$rain_stmt = $pdo->query("SELECT 'Ultrasonic' as sensor, rainfall as value1, NULL as value2, reading_time as time FROM data ORDER BY reading_time DESC LIMIT 50");
$rain_rows = $rain_stmt->fetchAll(PDO::FETCH_ASSOC);

// รวมแล้วเรียงเวลาใหม่
$logs = array_merge($dht_rows, $rain_rows);
usort($logs, function ($a, $b) {
    return strtotime($a['time']) - strtotime($b['time']);
});
?>
<!DOCTYPE html>
<html lang="th">

<head>
    <meta charset="UTF-8">
    <title>IoT Terminal</title>
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
                    <li class="nav-item"><a class="nav-link" href="ultrasonic.php">Ultrasonic</a></li>
                    <li class="nav-item"><a class="nav-link" href="dht.php">DHT11</a></li>
                    <li class="nav-item"><a class="nav-link active" href="terminal.php">Terminal</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <h1>IoT Terminal</h1>
        <div id="terminal">
            <?php foreach ($logs as $log): ?>
                <?php if ($log['sensor'] == 'DHT11'): ?>
                    <div class="log-dht">[<?php echo $log['time']; ?>] DHT11 -> Temp: <?php echo $log['value1']; ?>°C Humidity: <?php echo $log['value2']; ?>%</div>
                <?php else: ?>
                    <div class="log-rain">[<?php echo $log['time']; ?>] Ultrasonic -> Distance: <?php echo $log['value1']; ?> cm</div>
                <?php endif; ?>
            <?php endforeach; ?>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script>
        function refreshTerminal() {
            axios.get('get_terminal_data.php')
                .then(response => {
                    document.getElementById('terminal').innerHTML = response.data;
                    document.getElementById('terminal').scrollTop = document.getElementById('terminal').scrollHeight;
                });
        }

        // อัปเดตทุก 2 วินาที
        setInterval(refreshTerminal, 2000);
    </script>
</body>

</html>