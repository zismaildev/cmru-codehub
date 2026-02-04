# 🌐 IoT Lab 4: Web Receiver Interface

<div align="center">

![Tech](https://img.shields.io/badge/Tech-PHP_&_MySQL-777BB4?style=for-the-badge)
![Role](https://img.shields.io/badge/Role-Data_Logger-green?style=for-the-badge)

**"Backend API for IoT Data Collection"**

</div>

---

## 🎯 Objective
ส่วนนี้คือ **Backend Server** ที่คอยรับค่า HTTP GET Request จากบอร์ด ESP8266 และบันทึกลง Database พร้อมหน้าเว็บสำหรับแสดงผลข้อมูลย้อนหลัง

## 🏗️ Data Flow

```mermaid
graph LR
    ESP[ESP8266] -->|GET /add.php?temp=25| Server[Web Server]
    Server -->|INSERT| DB[(MySQL Database)]
    Admin[User] -->|VIEW index.php| Server
    Server -->|SELECT| DB
```

## 📂 File Structure
- `add.php`: API Endpoint สำหรับรับค่าจาก Sensor
- `connectDB.php`: ไฟล์เชื่อมต่อฐานข้อมูล
- `index.php`: Dashboard แสดงทารางข้อมูล

## 💻 Code Logic (add.php)
```php
$temp = $_GET['temp'];
$sql = "INSERT INTO weather_log (temperature) VALUES ('$temp')";
mysqli_query($conn, $sql);
```
