# 🧩 IoT Workshop 3: Modular Sensors

<div align="center">

![Hardware](https://img.shields.io/badge/Sensors-DHT_LDR_Ultrasonic-red?style=for-the-badge)
![Type](https://img.shields.io/badge/Type-Module_Integration-orange?style=for-the-badge)

**"Working with Various Input Devices"**

</div>

---

## 🎯 Objective
เรียนรู้การเขียนโค้ดเพื่ออ่านค่าจากเซ็นเซอร์ชนิดต่างๆ แยกเป็นโมดูล เพื่อความเข้าใจใน Hardware Interface (Digital vs Analog pin)

## 📂 Modules
- **DHT**: วัดอุณหภูมิและความชื้น (Digital Pin)
- **LDR**: วัดความเข้มแสง (Analog Pin `A0`)
- **Ultrasonic**: วัดระยะทาง (Trigger/Echo Pins)

## 💻 Example Logic (Ultrasonic)
```cpp
digitalWrite(trigPin, LOW);
delayMicroseconds(2);
digitalWrite(trigPin, HIGH);
delayMicroseconds(10);
digitalWrite(trigPin, LOW);
duration = pulseIn(echoPin, HIGH);
distance = duration * 0.034 / 2;
```
