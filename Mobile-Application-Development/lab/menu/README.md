# 📲 Interactive Menu UI

<div align="center">

![Framework](https://img.shields.io/badge/Framework-Flutter-02569B?style=for-the-badge)
![Widget](https://img.shields.io/badge/Widget-ListView_%7C_Card-green?style=for-the-badge)

**"Building Scrollable Lists and Touch Interactions"**

</div>

---

## 🎯 Problem Statement
การแสดงรายการข้อมูลจำนวนมาก (List) เป็น UI Pattern ที่พบบ่อยที่สุด โจทย์คือการสร้างเมนูที่เลื่อนได้ (Scrollable) และตอบสนองต่อการกด (Interactive) อย่างลื่นไหล

## 🏗️ Widget Tree Structure

โครงสร้างของหน้าจอ Menu

```mermaid
graph TD
    Scaffold --> AppBar
    Scaffold --> Body
    Body --> ListView
    ListView --> Card_1
    ListView --> Card_2
    ListView --> Card_N
    Card_1 --> ListTile
    ListTile --> Leading(Icon)
    ListTile --> Title(Text)
    ListTile --> Trailing(Arrow)
```

## 🛠️ Components
- **ListView.builder**: Widget สำหรับสร้าง List ที่มีประสิทธิภาพสูง (Render เฉพาะสิ่งที่เห็นบนจอ)
- **InkWell / GestureDetector**: เพิ่ม Ripple Effect และการตรวจจับการกด
- **Card**: ตกแต่งด้วยเงา (Elevation) และขอบโค้ง

## 💡 Key Learnings
- **Performance**: การใช้ `ListView.builder` แทน `ListView` ปกติเมื่อมีข้อมูลจำนวนมาก เพื่อลด Memory Usage
- **UX feedback**: ผู้ใช้ต้องรู้ว่ามีการกดปุ่มผ่าน Visual Feedback (สีเปลี่ยน/เงานูนขึ้น)
