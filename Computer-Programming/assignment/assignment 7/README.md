# 📑 Python Assignment 5-8: Lists, Dictionaries & Integration

> **Note:** Assignment 5-8 เน้นการจัดการข้อมูลกลุ่ม (Collections) และการรวม Concepts ต่างๆ เข้าด้วยกัน

---

## Assignment 5: Lists & Arrays 📑

### 🎯 Learning Objectives
- สร้างและจัดการ List
- เพิ่ม/ลบข้อมูล (append, remove, pop)
- เข้าถึงข้อมูลด้วย Index
- ใช้ List Methods

### Key Concepts
```python
# สร้าง List
scores = [80, 75, 90, 60]

# เพิ่มข้อมูล
scores.append(85)  # [80, 75, 90, 60, 85]

# เข้าถึงด้วย Index
print(scores[0])   # 80 (ตัวแรก)
print(scores[-1])  # 85 (ตัวสุดท้าย)

# Functions
print(f"Max: {max(scores)}")  # 90
print(f"Min: {min(scores)}")  # 60
print(f"Sum: {sum(scores)}")  # 390
```

---

## Assignment 6: Advanced Lists 🟠

### 🎯 Learning Objectives
- List Slicing
- Nested Lists (List ซ้อน List)
- List Comprehension

### Key Concepts
```python
# Slicing
nums = [1, 2, 3, 4, 5, 6]
print(nums[1:4])   # [2, 3, 4]
print(nums[:3])    # [1, 2, 3]
print(nums[3:])    # [4, 5, 6]

# Nested Lists (2D Array)
matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]
print(matrix[0][0])  # 1
print(matrix[1][2])  # 6

# List Comprehension
squares = [x**2 for x in range(10)]
# [0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
```

---

## Assignment 7: Dictionaries 🔴

### 🎯 Learning Objectives
- สร้าง Dictionary (Key-Value Pairs)
- เพิ่ม/ลบ/แก้ไขข้อมูล
- วน Loop ใน Dictionary

### Key Concepts
```python
# สร้าง Dictionary
student = {
    "name": "John",
    "age": 20,
    "grade": "A"
}

# เข้าถึงข้อมูล
print(student["name"])  # John
print(student.get("age"))  # 20

# เพิ่มข้อมูล
student["major"] = "Computer Science"

# ลบข้อมูล
del student["grade"]

# วน Loop
for key in student:
    print(f"{key}: {student[key]}")

# Loop แบบ items()
for key, value in student.items():
    print(f"{key} = {value}")
```

---

## Assignment 8: Integration Project 🔴

### 🎯 Learning Objectives
- รวม Lists, Dictionaries, Loops, Conditionals
- ออกแบบโปรแกรมที่ทำงานได้จริง
- การคิดแก้ปัญหาแบบองค์รวม

### Example: Student Management System
```python
# ระบบจัดการนักเรียน
students = []

# เพิ่มนักเรียน
def add_student(name, score):
    student = {
        "name": name,
        "score": score,
        "grade": calculate_grade(score)
    }
    students.append(student)

# คำนวณเกรด
def calculate_grade(score):
    if score >= 80:
        return 'A'
    elif score >= 70:
        return 'B'
    elif score >= 60:
        return 'C'
    elif score >= 50:
        return 'D'
    else:
        return 'F'

# แสดงข้อมูล
def display_students():
    for student in students:
        print(f"Name: {student['name']}, "
              f"Score: {student['score']}, "
              f"Grade: {student['grade']}")

# เพิ่มข้อมูล
add_student("Alice", 85)
add_student("Bob", 72)
add_student("Charlie", 58)

# แสดงผล
display_students()
```

---

## 💡 Summary: Collections Comparison

| Type | Ordered | Mutable | Syntax |
|:---|:---:|:---:|:---|
| List | ✅ | ✅ | `[1, 2, 3]` |
| Tuple | ✅ | ❌ | `(1, 2, 3)` |
| Dictionary | ❌ | ✅ | `{"key": "value"}` |
| Set | ❌ | ✅ | `{1, 2, 3}` |

---

## 🚀 How to Run
```bash
python assignment_5.py
python assignment_6.py
python assignment_7.py
python assignment_8.py
```
