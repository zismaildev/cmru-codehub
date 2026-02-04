<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "iot_data";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) die("Connection failed: " . $conn->connect_error);

$sql = "SELECT * FROM parking_slots ORDER BY id DESC LIMIT 1";
$result = $conn->query($sql);
$data = $result->fetch_assoc();

$slot1 = $data['slot1'];
$slot2 = $data['slot2'];
?>

<!DOCTYPE html>
<html lang="th">
<head>
  <meta charset="UTF-8">
  <title>สถานะที่จอดรถ</title>
  <link href="https://fonts.googleapis.com/css2?family=Kanit:wght@400;700&display=swap" rel="stylesheet">
  <meta http-equiv="refresh" content="3">
  <style>
    body {
      font-family: 'Kanit', sans-serif;
      background: #f0f4f8;
      text-align: center;
      margin: 0;
      padding: 50px 0;
    }
    h1 {
      font-size: 36px;
      color: #333;
      margin-bottom: 40px;
    }
    .slots {
      display: flex;
      justify-content: center;
      gap: 30px;
      flex-wrap: wrap;
    }
    .slot {
      font-size: 24px;
      padding: 30px 20px;
      border-radius: 15px;
      width: 220px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.1);
      display: flex;
      flex-direction: column;
      align-items: center;
      transition: transform 0.3s, background 0.3s;
    }
    .slot.free {
      background: #4CAF50;
      color: white;
    }
    .slot.occupied {
      background: #F44336;
      color: white;
    }
    .slot i {
      font-size: 60px;
      margin-bottom: 15px;
    }
    .slot.free i {
      color: #C8E6C9;
    }
    .slot.occupied i {
      color: #FFCDD2;
    }
    .footer {
      margin-top: 50px;
      font-size: 14px;
      color: #666;
    }
  </style>
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body>
  <h1>สถานะที่จอดรถ</h1>
  <div class="slots">
    <div class="slot <?php echo ($slot1==0?'free':'occupied'); ?>">
      <i class="fas <?php echo ($slot1==0?'fa-car-side':'fa-car'); ?>"></i>
      ช่อง 1: <?php echo ($slot1==0?'ว่าง':'มีรถ'); ?>
    </div>
    <div class="slot <?php echo ($slot2==0?'free':'occupied'); ?>">
      <i class="fas <?php echo ($slot2==0?'fa-car-side':'fa-car'); ?>"></i>
      ช่อง 2: <?php echo ($slot2==0?'ว่าง':'มีรถ'); ?>
    </div>
  </div>
  <div class="footer">
    รีเฟรชข้อมูลอัตโนมัติทุก 3 วินาที
  </div>
</body>
</html>
