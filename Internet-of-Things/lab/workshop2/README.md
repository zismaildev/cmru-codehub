# ☁️ IoT Workshop 2: Send Data to NETPIE/Platform

<div align="center">

![Platform](https://img.shields.io/badge/Cloud-NETPIE_2020-blue?style=for-the-badge)
![Protocol](https://img.shields.io/badge/Protocol-MQTT-green?style=for-the-badge)

**"Visualize Sensor Data on Cloud Dashboard"**

</div>

---

## 🎯 Objective
การส่งข้อมูลขึ้น Cloud Platform (ในที่นี้อาจใช้ NETPIE, Blynk, หรือ Custom Server) เพื่อแสดงผลบน Dashboard แบบ Real-time

## 🏗️ Architecture

```mermaid
graph LR
    Device[ESP8266] -->|MQTT Publish| Broker[Cloud Broker]
    Broker -->|Subscribe| Dashboard[Web/Mobile App]
```

## 💻 Key Config
```cpp
#define MQTT_HOST "broker.netpie.io"
#define MQTT_CLIENT_ID "YOUR_CLIENT_ID"
#define MQTT_TOKEN "YOUR_TOKEN"
```
