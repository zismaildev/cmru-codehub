# COM 3705 Internet of Things

<div align="center">

![Type](https://img.shields.io/badge/Type-Hardware_Software_Integration-orange?style=for-the-badge)
![Tech](https://img.shields.io/badge/Stack-C++_%7C_Arduino-00979D?style=for-the-badge)

**"Bridging the Gap Between Physical World and Digital Data"**

</div>

---

## 🎯 เกี่ยวกับรายวิชา

รายวิชานี้สอนการ**เชื่อมโยงอุปกรณ์ไฟฟ้าอิเล็กทรทรอนิกส์กับ Internet** เพื่อสร้างระบบอัจฉริยะที่ควบคุมและติดตามได้จากระยะไกล ผ่าน **Arduino และ ESP8266**

### IoT คืออะไร?
**Internet of Things** = การเชื่อมต่ออุปกรณ์ต่างๆ (สิ่งของ) เข้ากับ Internet เพื่อ:
- **รับข้อมูล**: อ่านค่าจากเซ็นเซอร์ (อุณหภูมิ, ความชื้น, ระยะทาง)
- **ควบคุม**: สั่งงานผ่าน Internet (เปิด-ปิดไฟ, เครื่องปรับอากาศ)
- **ติดตาม**: ดูสถานะแบบ Real-time บน Dashboard

### เนื้อหาหลักที่เรียน
1. **Arduino Basics** - Microcontroller Programming (C++/Wiring)
2. **Electronics Fundamentals** - Circuit, LED, Resistor, Sensors
3. **Sensors & Actuators** - DHT11, Ultrasonic, Relay, Servo
4. **ESP8266/ESP32** - WiFi Module สำหรับเชื่อมต่อ Internet
5. **MQTT Protocol** - การส่งข้อมูลแบบ Publish/Subscribe
6. **Web Dashboard** - แสดงผลและควบคุมผ่าน Web

---

## 🔑 สิ่งที่เรียนรู้ (Key Learnings)

### 1. Arduino & Microcontroller Programming

#### Arduino Basics
- **Digital I/O**: `digitalWrite(pin, HIGH/LOW);` - เปิด/ปิด LED
- **Analog I/O**: `analogRead(pin);` - อ่านค่าจากเซ็นเซอร์
- **Serial Communication**: `Serial.print()` - Debug ผ่าน Serial Monitor

**ตัวอย่างโค้ด:**
```cpp
void setup() {
    pinMode(LED_BUILTIN, OUTPUT);  // ตั้งค่า Pin เป็น Output
}

void loop() {
    digitalWrite(LED_BUILTIN, HIGH);  // เปิดไฟ
    delay(1000);                      // รอ 1 วินาที
    digitalWrite(LED_BUILTIN, LOW);   // ปิดไฟ
    delay(1000);
}
```

#### Arduino IDE Structure
- **setup()**: รันครั้งเดียวตอนเริinitialize
- **loop()**: รันวนซ้ำตลอดเวลา

### 2. Sensors (เซ็นเซอร์ - อ่านข้อมูล)

#### Temperature & Humidity (DHT11/DHT22)
```cpp
#include <DHT.h>
DHT dht(PIN, DHT11);
float temp = dht.readTemperature();
float humidity = dht.readHumidity();
```

#### Ultrasonic Distance (HC-SR04)
```cpp
// วัดระยะทาง (Sonar)
long duration = pulseIn(ECHO_PIN, HIGH);
float distance = duration * 0.034 / 2;  // cm
```

#### PIR Motion Sensor
```cpp
// ตรวจจับการเคลื่อนไหว
if (digitalRead(PIR_PIN) == HIGH) {
    Serial.println("Motion detected!");
}
```

### 3. Actuators (อุปกรณ์ควบคุม)

#### LED - แสงส่องสว่าง
```cpp
digitalWrite(LED_PIN, HIGH);  // เปิด
```

#### Relay - สวิตซ์ไฟฟ้า (ควบคุมอุปกรณ์ไฟบ้าน)
```cpp
digitalWrite(RELAY_PIN, HIGH);  // เปิดปั๊ม/พัดลม
```

#### Servo Motor - มอเตอร์หมุนแบบแม่นยำ
```cpp
#include <Servo.h>
Servo myServo;
myServo.write(90);  // หมุนไป 90 องศา
```

### 4. ESP8266/ESP32 - WiFi Connectivity

#### Connect to WiFi
```cpp
#include <ESP8266WiFi.h>

WiFi.begin("SSID", "PASSWORD");
while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
}
Serial.println("Connected!");
```

#### HTTP Request (Send Data to Server)
```cpp
HTTPClient http;
http.begin("http://example.com/api/data");
http.addHeader("Content-Type", "application/json");
http.POST("{\"temperature\":25}");
http.end();
```

### 5. MQTT - IoT Communication Protocol

#### Publish (ส่งข้อมูล)
```cpp
#include <PubSubClient.h>
WiFiClient espClient;
PubSubClient client(espClient);

client.publish("home/temperature", "25.5");
```

#### Subscribe (รับข้อมูล)
```cpp
void callback(char* topic, byte* payload, unsigned int length) {
    // ทำอะไรสักอย่างเมื่อได้รับข้อมูล
}
client.subscribe("home/lights");
```

### 6. Smart Home Architecture
```
[Sensors] → [ESP8266] → [MQTT Broker] → [Web Dashboard]
                ↓
         [Actuators (LED, Relay)]
```

---

## 📂 โครงสร้างภายใน (Repository Structure)

```
Internet-of-Things/
├── README.md                  ← ไฟล์นี้
├── lab/                       ← Lab ฝึกหัด
│   ├── Lab3/                  → Basic Sensors (DHT, Ultrasonic)
│   ├── Lab4/                  → ESP8266 WiFi Connection
│   ├── Lab5/                  → MQTT Communication
│   ├── workshop1/             → LED Control via Web
│   ├── workshop2/             → Sensor Dashboard
│   └── workshop3/             → Advanced IoT Integration
└── mini-project/              ← โปรเจกต์ใหญ่
    └── smart-home-final/      → ระบบ Smart Home (Final Project)
```

---

## 📚 Lab & Workshops

### 🟢 Level 1: Arduino & Sensors
**Lab3: Temperature & Distance**
- อ่านค่าอุณหภูมิจาก DHT11
- วัดระยะทางด้วย Ultrasonic
- แสดงผลบน Serial Monitor

### 🟡 Level 2: WiFi & Internet
**Lab4: ESP8266 Basics**
- เชื่อมต่อ WiFi
- ส่งข้อมูลไป Server (HTTP POST)
- รับคำสั่งจาก Web

**workshop1: Web-Controlled LED**
- สร้าง Web Server บน ESP8266
- เปิด-ปิดไฟผ่านเว็บบราวเซอร์

### 🟠 Level 3: MQTT & Integration
**Lab5 & workshop2: MQTT Dashboard**
- ใช้ MQTT Broker (Mosquitto)
- Publish sensor data
- Subscribe กับ Web Dashboard

**workshop3: Advanced Integration**
- รวม Sensors หลายตัว
- Dashboard แบบ Real-time
- อัตโนมัติด้วย Logic (ถ้าอุณหภูมิ > 30 → เปิดพัดลม)

---

## 🏆 Mini Project: Smart Home System

**smart-home-final/**

ระบบบ้านอัจฉริยะที่ควบคุมผ่าน Web Dashboard

### Features
- 🌡️ **Temperature Monitoring**: แสดงอุณหภูมิและความชื้นแบบ Real-time
- 💡 **Light Control**: เปิด-ปิดไฟผ่านเว็บ
- 🚪 **Door Security**: แจ้งเตือนเมื่อมีคนเข้า-ออก
- 📊 **Data Logging**: บันทึกข้อมูลลงฐานข้อมูล
- 📱 **Mobile Responsive**: ใช้งานได้ทั้ง Desktop/Mobile

### Hardware Components
- ESP8266 (NodeMCU)
- DHT11 (Temperature & Humidity)
- PIR Sensor (Motion)
- Relay Module (สำหรับควบคุมไฟ)
- Ultrasonic Sensor (ระยะทาง)

### Software Stack
- **Firmware**: C++ (Arduino IDE)
- **MQTT Broker**: Mosquitto
- **Backend**: PHP/Node.js
- **Frontend**: HTML/CSS/JavaScript
- **Database**: MySQL

---

## 🛠️ เครื่องมือที่ใช้

### ✅ Required Hardware
- **[ESP8266 NodeMCU](https://www.nodemcu.com/)** - WiFi Microcontroller
- **Sensors**: DHT11, HC-SR04, PIR
- **Actuators**: LED, Relay Module, Servo
- **Jumper Wires & Breadboard**
- **USB Cable** (สำหรับ Upload Code)

### ✅ Required Software
- **[Arduino IDE](https://www.arduino.cc/en/software)** - เขียนและ Upload โค้ด
- **ESP8266 Board Manager** (ใน Arduino IDE)
- **Libraries**: DHT, PubSubClient, ESP8266WiFi

### 📦 Optional Tools
- **Fritzing**: วาด Circuit Diagram
- **Mosquitto**: MQTT Broker (สำหรับทดสอบ)
- **Postman**: ทดสอบ API

---

## 🚀 วิธี การรัน (How to Run)

### 📋 Prerequisites
1. ติดตั้ง Arduino IDE
2. เพิ่ม ESP8266 Board:
   - File → Preferences → Additional Board Manager URLs:
   - `http://arduino.esp8266.com/stable/package_esp8266com_index.json`
   - Tools → Board → Boards Manager → ค้นหา "ESP8266" → Install

3. ติดตั้ง Libraries:
   - Sketch → Include Library → Manage Libraries
   - ค้นหา: `DHT sensor library`, `PubSubClient`

### ▶️ Upload Code to ESP8266

1. **เสียบ ESP8266 เข้า USB**
2. **เลือก Board**: Tools → Board → NodeMCU 1.0
3. **เลือก Port**: Tools → Port → COMx (Windows) หรือ /dev/ttyUSB0 (Linux)
4. **Upload**: กด Upload (→)

### 🔧 Troubleshooting
- **ไม่เจอ Port**: ติดตั้ง CP2102 Driver
- **Upload ล้มเหลว**: กดปุ่ม FLASH บนบอร์ดตอน Upload
- **WiFi ไม่เชื่อม**: เช็ค SSID/Password, ระยะทาง Router

---

## 📖 แนะนำสำหรับรุ่นน้อง

### 🎓 เริ่มต้นอย่างไร?
1. **เล่น Arduino ก่อน**: ฝึกกระพริบ LED, อ่านค่าเซ็นเซอร์
2. **เข้าใจไฟฟ้าพื้นฐาน**: Voltage, Current, Resistance
3. **ทดลองเซ็นเซอร์ทีละตัว**: อย่ารีบต่อหมด
4. **ใช้ Serial Monitor**: Debug อย่างสม่ำเสมอ

### 💡 Tips & Best Practices
- **เช็คสาย Jumper**: ส่วนใหญ่ปัญหามาจากสายหลุด/ขาด
- **ใส่ Resistor ให้ถูก**: ไม่งั้น LED ไหม้
- **ใช้ Breadboard**: อย่าบัดกกรี่ตั้งแต่แรก
- **อ่าน Datasheet**: เซ็นเซอร์แต่ละตัวต่าง Voltage ต่างกัน
- **เริ่มจากง่าย → ยาก**: อย่าเริ่มด้วยโปรเจกต์ซับซ้อนเกินไป

### 📚 แหล่งเรียนรู้เพิ่มเติม
- [Arduino Official Tutorials](https://www.arduino.cc/en/Tutorial/HomePage)
- [Random Nerd Tutorials](https://randomnerdtutorials.com/) - ESP8266/32
- [ESP8266 Documentation](https://arduino-esp8266.readthedocs.io/)
- [Instructables IoT](https://www.instructables.com/circuits/esp8266/projects/)

### ⚠️ ข้อผิดพลาดที่พบบ่อย
- ❌ ต่อสายผิด Pin (ตัวเลขผิด)
- ❌ ไม่ได้ `delay()` ทำให้ loop เร็วเกิน
- ❌ ใช้ 5V กับอุปกรณ์ 3.3V (ไหม้!)
- ❌ ลืมเชื่อม Ground (GND) ระหว่างอุปกรณ์
- ❌ WiFi.begin() ใน loop() (ควรอยู่ใน setup())

---

## 📄 License
โค้ดในโปรเจกต์นี้เป็นส่วนหนึ่งของการเรียนการสอนในรายวิชา COM 3705 Internet of Things

---

<div align="center">

**Happy Making! 🔌⚡**

*"The future is connected. Build it!"*

</div>
