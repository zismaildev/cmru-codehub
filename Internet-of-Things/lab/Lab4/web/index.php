<?php
require 'db.php';

// ดึงข้อมูลล่าสุดจาก DHT/LDR/Rain สำหรับ card
$dht_data = $pdo->query("SELECT temperature, humidity, heat_index, created_at FROM dht_data ORDER BY created_at DESC LIMIT 1")->fetch();
$rain_data = $pdo->query("SELECT rain_value, status, created_at FROM rain_data ORDER BY created_at DESC LIMIT 1")->fetch();
$ldr_data  = $pdo->query("SELECT ldr_state, raw_value, created_at FROM ldr_data ORDER BY created_at DESC LIMIT 1")->fetch();
?>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <title>IoT Sensor Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">IoT Dashboard</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link active" href="index.php">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="dht.php">DHT11</a></li>
                <li class="nav-item"><a class="nav-link" href="rain.php">Rain</a></li>
                <li class="nav-item"><a class="nav-link" href="ldr.php">LDR</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <h1 class="mb-4">Dashboard Overview</h1>
    <div class="row">
        <!-- DHT11 Card -->
        <div class="col-md-4 mb-4">
            <div class="card p-4">
                <div class="card-body">
                    <h5 class="card-title">🌡 DHT11 Sensor</h5>
                    <p>อุณหภูมิ: <span id="tempVal"><?php echo $dht_data['temperature'] ?? '-'; ?></span> °C</p>
                    <p>ความชื้น: <span id="humVal"><?php echo $dht_data['humidity'] ?? '-'; ?></span> %</p>
                    <p>รู้สึกเหมือน: <span id="heatVal"><?php echo $dht_data['heat_index'] ?? '-'; ?></span> °C</p>
                    <p class="small-text">อัปเดตล่าสุด: <span id="dhtTime"><?php echo $dht_data['created_at'] ?? '-'; ?></span></p>
                </div>
            </div>
        </div>

        <!-- LDR Card -->
        <div class="col-md-4 mb-4">
            <div class="card p-4">
                <div class="card-body">
                    <h5 class="card-title">💡 LDR Sensor</h5>
                    <p>ตอนนี้: <span id="ldrState"><?php echo $ldr_data['ldr_state'] ?? '-'; ?></span></p>
                    <p>ค่าดิบ: <span id="ldrVal"><?php echo $ldr_data['raw_value'] ?? '-'; ?></span></p>
                    <p class="small-text">อัปเดตล่าสุด: <span id="ldrTime"><?php echo $ldr_data['created_at'] ?? '-'; ?></span></p>
                </div>
            </div>
        </div>

        <!-- Rain Card -->
        <div class="col-md-4 mb-4">
            <div class="card p-4">
                <div class="card-body">
                    <h5 class="card-title">🌧 Rain Sensor</h5>
                    <p>ปริมาณน้ำฝน: <span id="rainVal"><?php echo $rain_data['rain_value'] ?? '-'; ?></span></p>
                    <p>สถานะ: <span id="rainStatus"><?php echo $rain_data['status'] ?? '-'; ?></span></p>
                    <p class="small-text">อัปเดตล่าสุด: <span id="rainTime"><?php echo $rain_data['created_at'] ?? '-'; ?></span></p>
                </div>
            </div>
        </div>
    </div>

    <!-- Chart -->
    <div class="row mt-4">
        <div class="col-12">
            <div class="card p-4">
                <canvas id="sensorChart" style="width: 100%; height: 400px;"></canvas>
            </div>
        </div>
    </div>
</div>

<script>
const ctx = document.getElementById('sensorChart').getContext('2d');
let sensorChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: [],
        datasets: [
            { label: 'Temperature (°C)', data: [], borderColor: '#ff5733', backgroundColor: 'rgba(255,87,51,0.2)', tension: 0.3 },
            { label: 'Humidity (%)', data: [], borderColor: '#33c1ff', backgroundColor: 'rgba(51,193,255,0.2)', tension: 0.3 },
            { label: 'Rain Value', data: [], borderColor: '#33ff57', backgroundColor: 'rgba(51,255,87,0.2)', tension: 0.3 },
            { label: 'LDR Value', data: [], borderColor: '#ffff33', backgroundColor: 'rgba(255,255,51,0.2)', tension: 0.3 }
        ]
    },
    options: { responsive: true }
});

function updateDashboard() {
    axios.get('get_sensor_data.php')
        .then(response => {
            const data = response.data;

            // อัปเดต card
            document.getElementById('tempVal').innerText = data.temperature.slice(-1)[0] ?? '-';
            document.getElementById('humVal').innerText = data.humidity.slice(-1)[0] ?? '-';
            document.getElementById('heatVal').innerText = data.heat_index?.slice(-1)[0] ?? '-';
            document.getElementById('dhtTime').innerText = data.labels.slice(-1)[0] ?? '-';

            document.getElementById('ldrVal').innerText = data.ldr.slice(-1)[0] ?? '-';
            document.getElementById('ldrTime').innerText = data.labels.slice(-1)[0] ?? '-';
            document.getElementById('ldrState').innerText = data.ldr_state?.slice(-1)[0] ?? '-';

            document.getElementById('rainVal').innerText = data.rain.slice(-1)[0] ?? '-';
            document.getElementById('rainStatus').innerText = data.rain_status?.slice(-1)[0] ?? '-';
            document.getElementById('rainTime').innerText = data.labels.slice(-1)[0] ?? '-';

            // อัปเดต chart
            sensorChart.data.labels = data.labels;
            sensorChart.data.datasets[0].data = data.temperature;
            sensorChart.data.datasets[1].data = data.humidity;
            sensorChart.data.datasets[2].data = data.rain;
            sensorChart.data.datasets[3].data = data.ldr;
            sensorChart.update();
        })
        .catch(err => console.error('Error fetching data:', err));
}

updateDashboard();
setInterval(updateDashboard, 5000);
</script>
</body>
</html>
