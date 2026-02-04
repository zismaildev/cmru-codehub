# 🧮 Lab 3: Basic Calculation

<div align="center">

![Topic](https://img.shields.io/badge/Topic-Arithmetic-orange?style=for-the-badge)
![Math](https://img.shields.io/badge/Math-Basic_Operations-blue?style=for-the-badge)

**"Python as a Calculator"**

</div>

---

## 🎯 Objective
ฝึกการใช้ Python คำนวณทางคณิตศาสตร์พื้นฐาน (+, -, *, /) และลำดับความสำคัญของเครื่องหมาย (PEMDAS)

## 🏗️ Operations Flow

```mermaid
graph LR
    Input[Expression: 2 + 3 * 5] --> Process[Multiply First: 3*5=15]
    Process --> Process2[Add Next: 2+15=17]
    Process2 --> Output[Result: 17]
```

## 💻 Code Snippet
```python
a = 10
b = 3
print(a + b)  # Addition
print(a ** b) # Power (10^3)
print(a % b)  # Modulo (Remainder)
```
