# 🔄 Lab 11: Control Flow (While Loop)

<div align="center">

![Topic](https://img.shields.io/badge/Topic-Iteration-green?style=for-the-badge)
![Logic](https://img.shields.io/badge/Logic-Conditional_Loop-orange?style=for-the-badge)

**"Looping Based on Conditions"**

</div>

---

## 🎯 Objective
ทดลองใช้ `while` loop ซึ่งจะทำงานซ้ำไปเรื่อยๆ ตราบเท่าที่เงื่อนไขยังเป็นจริง (True) เหมาะสำหรับสถานการณ์ที่ไม่รู้จำนวนรอบที่แน่นอน

## 🏗️ State Diagram

```mermaid
stateDiagram-v2
    [*] --> Check
    Check --> Action : Condition is True
    Action --> Check
    Check --> [*] : Condition is False
```

## 💻 Code Example
```python
count = 0
while count < 5:
    print(f"Count is {count}")
    count += 1
```
