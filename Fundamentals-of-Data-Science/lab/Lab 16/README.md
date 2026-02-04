# 🔢 Lab 16: NumPy Basics

<div align="center">

![Library](https://img.shields.io/badge/Library-NumPy-013243?style=for-the-badge&logo=numpy)
![Topic](https://img.shields.io/badge/Topic-Scientific_Computing-blue?style=for-the-badge)

**"High Performance Numerical Arrays"**

</div>

---

## 🎯 Objective
ก้าวเข้าสู่โลกของ Data Science ด้วย **NumPy** (Numerical Python) ไลบรารีสำหรับจัดการ Array หลายมิติที่มีประสิทธิภาพสูงกว่า List ปกติ

## 🏗️ Array Structure

```mermaid
graph TD
    Scalar[Scalar: 10]
    Vector[Vector (1D): [1, 2, 3]]
    Matrix[Matrix (2D): [[1,2], [3,4]]]
```

## 💻 Tech Highlights
- **Broadcasting**: การคำนวณทั้ง Array โดยไม่ต้องวน Loop (Vectorization)
- **ndarray**: Core Object ของ NumPy

```python
import numpy as np
arr = np.array([1, 2, 3])
print(arr * 2) # Output: [2, 4, 6]
```
