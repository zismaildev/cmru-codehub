# COM 3705 Internet of Things

<div align="center">

![Type](https://img.shields.io/badge/Type-Hardware_Software_Integration-orange?style=for-the-badge)
![Tech](https://img.shields.io/badge/Stack-C++_%7C_Arduino-00979D?style=for-the-badge)

**"Bridging the Gap Between Physical World and Digital Data"**

</div>

---

## 🎯 เกี่ยวกับรายวิชา
เรียนรู้การออกแบบและพัฒนาอุปกรณ์ **IoT (Internet of Things)** เพื่อเชื่อมต่อโลกกายภาพเข้ากับโลกดิจิทัล ผ่านการใช้งาน Microcontroller และเซ็นเซอร์ต่างๆ ส่งข้อมูลผ่านเครือข่ายอินเทอร์เน็ต

## 🔑 สิ่งที่เรียนรู้ (Key Learnings)
- **Microcontrollers:** การใช้งาน Arduino และ ESP8266 (NodeMCU)
- **Sensors & Actuators:** การอ่านค่าจากเซ็นเซอร์ (Ultrasonic, Temp) และควบคุมอุปกรณ์ (Relay, LED)
- **Network Protocols:** ความเข้าใจเรื่อง MQTT, HTTP, และ Web Server บนชิป
- **Circuit Design:** พื้นฐานวงจรอิเล็กทรอนิกส์และการต่อสาย

## 📂 โครงสร้างภายใน (Repository Structure)
- **`lab/`**: Workshop รายสัปดาห์ เช่น การต่อไฟ LED, การอ่านค่าเซ็นเซอร์, การเชื่อมต่อ WiFi
- **`mini-project/`**:
    - `smart-home-final/`: โปรเจกต์จำลองระบบบ้านอัจฉริยะ (Smart Home Project)

## 🛠️ เครื่องมือที่ใช้
- **Hardware:** ESP8266, Breadboard, Sensors
- **Software:** Arduino IDE

---

## 🚀 วิธีการรัน (How to Run)
1. เปิดไฟล์ `.ino` ด้วย **Arduino IDE**
2. ติดตั้ง Library ที่จำเป็น (เช่น `ESP8266WiFi`)
3. เลือก Board และ Port ให้ถูกต้อง
4. กด **Upload** เพื่อลงโค้ดไปยังบอร์ด
