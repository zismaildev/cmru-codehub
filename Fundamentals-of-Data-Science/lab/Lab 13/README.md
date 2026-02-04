# 🔒 Lab 13: Tuples (Immutable Lists)

<div align="center">

![Topic](https://img.shields.io/badge/Topic-Immutability-red?style=for-the-badge)
![Usage](https://img.shields.io/badge/Usage-Constants_%26_Coords-blue?style=for-the-badge)

**"Read-Only Data Structures"**

</div>

---

## 🎯 Objective
ทำความเข้าใจ **Tuple** ซึ่งเหมือน List แต่ "ห้ามแก้ไข" (Immutable) เหมาะสำหรับเก็บข้อมูลค่าคงที่ เช่น พิกัด GPS หรือ Config

## 🏗️ Memory Concept
Tuple เร็วกว่า List และใช้ Memory น้อยกว่าเพราะขนาดคงที่

```mermaid
graph TD
    Tuple((10, 20)) -->|Fixed Size| Memory
    List[10, 20] -->|Dynamic Size| Memory
    List -.->|Resize| NewMemory
```

## 💻 Code Snippet
```python
# Unpacking Tuple
point = (10, 20)
x, y = point
print(f"X: {x}, Y: {y}")
```
