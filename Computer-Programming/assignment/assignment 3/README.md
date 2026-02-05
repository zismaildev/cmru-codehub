# 🔀 Python Assignment 3: Conditions (If-Else)

<div align="center">

![Topic](https://img.shields.io/badge/Topic-Control_Flow-red?style=for-the-badge)
![Logic](https://img.shields.io/badge/Logic-Branching-purple?style=for-the-badge)

**"Making Decisions in Code"**

</div>

---

## 🎯 Learning Objectives

- ✅ ใช้ if-else ตัดสินใจ
- ✅ ใช้ elif สำหรับหลายเงื่อนไข
- ✅ เข้าใจ Comparison Operators (==, <, >, <=, >=, !=)
- ✅ ใช้ Logical Operators (and, or, not)
- ✅ เขียน Nested if (if ซ้อน if)

---

## 📝 Problem Sets

### ข้อ 1: if-else พื้นฐาน
```python
score = 80
if score == 80:
    print("Very Good")
else:
    print("Sorry")
```

### ข้อ 2: Nested if - ป้องกันหารด้วยศูนย์
```python
x = int(input("Enter X: "))
y = int(input("Enter Y: "))

if y == 0:
    print("ไม่สามารถหารด้วย 0 ได้")
else:
    print(f"{x} / {y} = {x/y:.2f}")
```

### ข้อ 3: elif - หลายเงื่อนไข
```python
number = int(input("Enter Number: "))

if number > 0:
    print("Positive Number")
elif number < 0:
    print("Negative Number")
else:
    print("Zero")
```

### ข้อ 4: 💰 Tax Calculator
**โจทย์:** คำนวณภาษีตามรายได้

| รายได้ | ภาษี |
|:---|:---|
| ≤ 5,000 | 0% |
| 5,001 - 20,000 | 7% |
| 20,001 - 50,000 | 10% |
| > 50,000 | 15% |

```python
salary = float(input("เงินเดือน: "))
overtime = float(input("ค่าล่วงเวลา: "))
total = salary + overtime

if total <= 5000:
    tax = 0
elif total <= 20000:
    tax = total * 0.07
elif total <= 50000:
    tax = total * 0.10
else:
    tax = total * 0.15

income = total - tax
print(f"ภาษี: {tax:.2f} ฿")
print(f"รายได้สุทธิ: {income:.2f} ฿")
```

### ข้อ 5: 📊 Grading System
```python
score = int(input("คะแนน: "))

if 80 <= score <= 100:
    grade = 'A'
elif 70 <= score < 80:
    grade = 'B'
elif 60 <= score < 70:
    grade = 'C'
elif 50 <= score < 60:
    grade = 'D'
elif 0 <= score < 50:
    grade = 'F'
else:
    print("คะแนนไม่ถูกต้อง")
    exit()

print(f"เกรด: {grade}")
```

### ข้อ 6: 🧮 Calculator Menu
```python
print("Menu Program")
print("A : Add")
print("S : Subtract")

menu = input("Choice: ")

if menu.lower() == 'a':
    num1 = float(input("Number 1: "))
    num2 = float(input("Number 2: "))
    print(f"{num1} + {num2} = {num1 + num2}")
elif menu.lower() == 's':
    num1 = float(input("Number 1: "))
    num2 = float(input("Number 2: "))
    print(f"{num1} - {num2} = {num1 - num2}")
else:
    print("Invalid choice!")
```

---

## 💡 Key Concepts

### Comparison Operators
```python
x == y  # เท่ากับ
x != y  # ไม่เท่ากับ
x > y   # มากกว่า
x < y   # น้อยกว่า
x >= y  # มากกว่าหรือเท่ากับ
x <= y  # น้อยกว่าหรือเท่ากับ
```

### Logical Operators
```python
# AND - ทั้งสองต้องเป็นจริง
if score >= 50 and score <= 100:
    print("Valid score")

# OR - อย่างใดอย่างหนึ่งเป็นจริง
if age < 18 or age > 60:
    print("Discount available")

# NOT - กลับค่า
if not is_student:
    print("Full price")
```

### Ternary Operator
```python
# แบบสั้น
result = "Pass" if score >= 50 else "Fail"
```

---

## 🚀 How to Run
```bash
python assignment_3.py
```
