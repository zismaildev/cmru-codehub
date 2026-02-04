# 📖 Lab 14: Dictionary (Key-Value)

<div align="center">

![Topic](https://img.shields.io/badge/Topic-Hash_Map-purple?style=for-the-badge)
![Format](https://img.shields.io/badge/Structure-JSON_Like-yellow?style=for-the-badge)

**"Mapping Data with Unique Keys"**

</div>

---

## 🎯 Objective
เรียนรู้โครงสร้างแบบ Key-Value Pair (คล้าย JSON) ซึ่งทรงพลังมากในการเก็บข้อมูลที่มีความสัมพันธ์กัน เช่น ข้อมูลโปรไฟล์ผู้ใช้

## 🏗️ Structure Visual

```mermaid
graph LR
    Key1[Key: "name"] --> Value1[Value: "Alice"]
    Key2[Key: "age"] --> Value2[Value: 25]
    Key3[Key: "role"] --> Value3[Value: "Admin"]
```

## 💻 Tech Spec
- **Access**: `data['key']` หรือ `data.get('key')` (ปลอดภัยกว่า)
- **Nested**: Dictionary ซ้อน Dictionary ได้

```python
user = {
    "id": 101,
    "meta": {
        "login_count": 5,
        "active": True
    }
}
```
