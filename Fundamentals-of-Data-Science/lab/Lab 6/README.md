# 🔢 Lab 6: Advanced Data Types

<div align="center">

![Topic](https://img.shields.io/badge/Topic-Data_Structures-blue?style=for-the-badge)
![Type](https://img.shields.io/badge/Type-List_Tuple_Set_Dict-orange?style=for-the-badge)

**"Beyond Primitives: Managing Arrays and Collections"**

</div>

---

## 🎯 Objective
เจาะลึกโครงสร้างข้อมูล (Data Structures) ที่ใช้บ่อยใน Python ได้แก่ **List**, **Tuple**, **Set**, และ **Dictionary** ซึ่งเป็นพื้นฐานสำคัญก่อนการจัดการข้อมูลด้วย Pandas

## 🏗️ Structure Comparison
| Structure | Syntax | Mutable? | Ordered? | Duplicate? |
| :--- | :---: | :---: | :---: | :---: |
| **List** | `[]` | ✅ | ✅ | ✅ |
| **Tuple** | `()` | ❌ | ✅ | ✅ |
| **Set** | `{}` | ✅ | ❌ | ❌ |
| **Dictionary** | `{k:v}` | ✅ | ✅ | 🔑 No |

## 💻 Code Snippet
```python
# List (แก้ไขได้)
fruits = ["apple", "banana"]
fruits.append("cherry")

# Tuple (แก้ไขไม่ได้ - Read Only)
coordinates = (13.75, 100.50)
```
