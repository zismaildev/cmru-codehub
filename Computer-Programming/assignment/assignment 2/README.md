# 🔢 Python Assignment 2: Variables & Math

<div align="center">

![Topic](https://img.shields.io/badge/Topic-Arithmetic-orange?style=for-the-badge)
![Focus](https://img.shields.io/badge/Focus-Calculations-blue?style=for-the-badge)

**"Mastering Variables and Mathematical Operations"**

</div>

---

## 🎯 Learning Objectives

- ✅ เข้าใจการใช้งานตัวแปร (Variables)
- ✅ ใช้ Arithmetic Operators (+, -, *, /, %, //, **)
- ✅ จัดรูปแบบ Output ด้วย String Formatting
- ✅ รับค่าจากผู้ใช้ด้วย `input()`
- ✅ แปลง Type (Type Casting) อย่างถูกต้อง

---

## 📝 Problem Sets

### ข้อ 1: แสดงผลตัวแปร
```python
grade = 3.75
print("Grade = ", grade)

name = "Computer"
print(name)
```

### ข้อ 2: String Formatting
```python
# \n = New Line
# \t = Tab
# \" = Double Quote
a = " Hello... \n Python Programing"
print(a)

a = "ยินดีต้อนรับเข้าสู่"
b = "\t\"โปรแกรมภาษาไพธอน \""
print(a)
print(b)
```

### ข้อ 3: การรับค่าจากผู้ใช้
```python
# รับค่า String
name = input("Enter Your Name : ")
lname = input("Enter Your LastName: ")
print("Name %s LastName %s" % (name, lname))

# รับค่าตัวเลข - ต้องแปลง Type!
w = float(input("Enter Your W : "))
h = float(input("Enter Your H : "))
area = w * h
print("พื้นที่ %.2f X %.2f = %.2f" % (w, h, area))
```

**Key Concept:**
- `input()` return String เสมอ!
- ต้องใช้ `int()` หรือ `float()` แปลงก่อนคำนวณ

### ข้อ 4: String Concatenation
```python
U1 = "Chiang Mai"
U2 = "Rajabhat"
U3 = "University"
cmru = U1 + ' ' + U2 + ' ' + U3
print(cmru)  # Chiang Mai Rajabhat University
```

---

## 💡 Key Concepts

### Arithmetic Operators
| Operator | คำอธิบาย | ตัวอย่าง |
|:---:|:---|:---|
| `+` | บวก | `10 + 5 = 15` |
| `-` | ลบ | `10 - 3 = 7` |
| `*` | คูณ | `4 * 5 = 20` |
| `/` | หาร (ได้ float) | `10 / 3 = 3.333...` |
| `//` | หาร (ได้ int) | `10 // 3 = 3` |
| `%` | หารเอาเศษ | `10 % 3 = 1` |
| `**` | ยกกำลัง | `2 ** 3 = 8` |

### String Formatting
```python
# วิธีที่ 1: % formatting
print("%d + %d = %d" % (10, 20, 30))
print("%.2f" % 3.14159)  # 3.14

# วิธีที่ 2: f-string (แนะนำ)
x, y = 10, 20
print(f"{x} + {y} = {x + y}")
```

---

## 🚀 How to Run
```bash
python assignment_2.py
```
