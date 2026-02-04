# 🅿️ Smart Parking System (IoT Capstone)

<div align="center">

![Hardware](https://img.shields.io/badge/Hardware-ESP8266_NodeMCU-000000?style=for-the-badge)
![Sensor](https://img.shields.io/badge/Sensor-Ultrasonic_SR04-FF0000?style=for-the-badge)
![Protocol](https://img.shields.io/badge/Protocol-HTTP_Over_WiFi-blue?style=for-the-badge)

**"Automated Parking Slot Detection & Web Visualization"**

</div>

---

## 🎯 Project Overview
ระบบลานจอดรถอัจฉริยะแบบ Real-time แก้ปัญหาการวนหาที่จอดรถ โดยใช้อุปกรณ์ IoT ตรวจจับรถและแสดงผลบน Web Dashboard ผ่าน WiFi

## 🏗️ System Architecture

```mermaid
graph TD
    Car[Car Enters] --> Sensor[Ultrasonic Sensor]
    Sensor -- Detect < 10cm --> MCU[NodeMCU ESP8266]
    MCU -- Toggle --> LED[Red LED On]
    MCU -- Display --> LCD[LCD: 'Occupied']
    MCU -- HTTP POST --> WiFi[WiFi Router]
    WiFi --> Server[Web Server (PHP)]
    Server --> DB[(MySQL)]
    DB --> Dashboard[Web Dashboard]
```

## 💻 Firmware Logic (`final.ino`)
- **Non-Blocking**: ใช้ `millis()` ในการอ่านค่า Sensor เพื่อไม่ให้กระทบการทำงานของ Network
- **Edge Computing**: ตัดสินใจสถานะ (ว่าง/ไม่ว่าง) ที่ตัว MCU ก่อนส่งขึ้น Server เพื่อลด Latency

```cpp
if (distance < 10) {
  status = "BUSY";
  digitalWrite(LED_RED, HIGH);
} else {
  status = "FREE";
  digitalWrite(LED_GREEN, HIGH);
}
```
