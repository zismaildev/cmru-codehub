# 🛠️ Lab 8: Functions vs Methods

<div align="center">

![Topic](https://img.shields.io/badge/Topic-Modular_Programming-purple?style=for-the-badge)
![Concept](https://img.shields.io/badge/Concept-OOP_Basics-red?style=for-the-badge)

**"Reusable Code and Object Behaviors"**

</div>

---

## 🎯 Objective
แยกแยะความแตกต่างระหว่าง **Function** (เรียกใช้โดดๆ) และ **Method** (เรียกใช้ผ่าน Object) และฝึกเขียน Function ของตัวเองเพื่อลดความซ้ำซ้อนของโค้ด (DRY Principle)

## 💻 Comparison
```python
# Function
len([1, 2, 3]) 

# Method (Associated with Object)
my_list.append(4)
```

## 🏗️ Function Anatomy
```python
def calculate_area(width, height):
    """Calculates rectangle area"""
    return width * height
```
