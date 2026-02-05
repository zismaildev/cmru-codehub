# 📝 Python Practical Test 1 & 2

<div align="center">

![Type](https://img.shields.io/badge/Type-Assessment-red?style=for-the-badge)
![Topic](https://img.shields.io/badge/Topic-Problem_Solving-blue?style=for-the-badge)

**"Midterm & Final Proficiency Exams"**

</div>

---

## 🎯 Overview

ชุดข้อสอบปฏิบัติ (Hands-on Exam) เพื่อวัดผลความเข้าใจในการเขียน โปรแกรม Python ครอบคลุมตั้งแต่นิพจน์พื้นฐานไปจนถึง List และ Loop

---

## 📋 Practical Test 1 (Midterm)

###  หัวข้อที่สอบ
- ✅ Input/Output (print, input)
- ✅ Variables & Data Types
- ✅ Arithmetic Operations
- ✅ Conditional Statements (if-else)
- ✅ Type Conversion
- ✅ การแปลงหน่วย

### ตัวอย่างโจทย์

#### ข้อ 1: เปรียบเทียบเลข 2 จำนวน
```python
x = int(input("Enter First Number: "))
y = int(input("Enter Second Number: "))

if x > y:
    print(f"Result {x} is Greater than {y}")
elif y > x:
    print(f"Result {y} is Greater than {x}")
else:
    print("Both numbers are equal")
```

#### ข้อ 2: แปลงหน่วย (cm → foot)
```python
cm = float(input("Enter cm: "))

inches = cm / 2.54
foot = inches / 12

print(f"{cm} cm = {foot:.2f} feet")
```

**สูตร:**
- 1 inch = 2.54 cm
- 1 foot = 12 inches

---

## 📋 Practical Test 2 (Final)

### หัวข้อที่สอบ
- ✅ for & while Loops
- ✅ Lists & Arrays
- ✅ Dictionaries
- ✅ Functions (def)
- ✅ Pattern Printing
- ✅ Integration Problems

### ตัวอย่างโจทย์

#### ข้อ 1: หาผลรวมเลขคู่ 1-N
```python
n = int(input("Enter N: "))
total = 0

for i in range(1, n + 1):
    if i % 2 == 0:  # เลขคู่
        total += i

print(f"Sum of even numbers: {total}")
```

**Example:**  
Input: 10  
Output: 30 (2+4+6+8+10)

#### ข้อ 2: Dictionary - จัดการข้อมูลนักเรียน
```python
students = {}

# เพิ่มนักเรียน
students["001"] = {"name": "Alice", "score": 85}
students["002"] = {"name": "Bob", "score": 72}

# แสดงผล
for id, data in students.items():
    print(f"ID: {id}")
    print(f"  Name: {data['name']}")
    print(f"  Score: {data['score']}")
```

#### ข้อ 3: พิมพ์รูปทรงเรขาคณิต
```python
n = int(input("จำนวนแถว: "))

# สามเหลี่ยมขวา
for i in range(1, n + 1):
    print("*" * i)
```

**Output (n=5):**
```
*
**
***
****
*****
```

---

## 💡 เคล็ดลับการสอบ

### ⏰ Time Management
- อ่านโจทย์ให้ละเอียด
- เริ่มจากข้อง่ายก่อน
- ทดสอบ code ทุกข้อ

### 🐛 Common Mistakes
- ❌ ลืมแปลง Type (`int()`, `float()`)
- ❌ Indentation ผิด
- ❌ ใช้ `=` แทน `==`
- ❌ Index out of range

### ✅ Testing Strategy
```python
# Test case 1: Normal case
# Test case 2: Edge case (0, negative)
# Test case 3: Large numbers
```

---

## 📚 Topics to Review

### Practical Test 1
1. Print & Input
2. Variables & Types
3. if-elif-else
4. Basic Math
5. String Formatting

### Practical Test 2
1. for & while Loops
2. Lists (append, remove, index)
3. Dictionaries (add, delete, loop)
4. Functions (def, return)
5. Nested Loops (patterns)

---

## 🚀 Practice More

```bash
# Run practice tests
python practicaltest1.py
python practicaltest2.py
```

---

<div align="center">

**Good Luck! 🍀**

*"Practice makes perfect"*

</div>
