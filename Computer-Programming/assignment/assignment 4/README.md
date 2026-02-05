# 🔄 Python Assignment 4: Loops & Iteration

<div align="center">

![Topic](https://img.shields.io/badge/Topic-Looping-green?style=for-the-badge)
![Logic](https://img.shields.io/badge/Logic-Repetition-blue?style=for-the-badge)

**"Automate Repetitive Tasks"**

</div>

---

## 🎯 Learning Objectives

- ✅ ใช้ `for` loop วนซ้ำจำนวนครั้งที่แน่นอน
- ✅ ใช้ `while` loop วนซ้ำตามเงื่อนไข
- ✅ เข้าใจ `range()` function
- ✅ สร้าง Pattern ด้วย Nested Loops
- ✅ ใช้ `break` และ `continue`

---

## 📝 Problem Sets

### ข้อ 1: for Loop พื้นฐาน
```python
# แสดงชื่อ 5 ครั้ง
for i in range(5):
    print("Nattapong Panthiya")
```

### ข้อ 2: range() แบบต่างๆ
```python
# 1-10 (คี่)
for i in range(1, 10, 2):
    print(i)  # 1, 3, 5, 7, 9
```

### ข้อ 3: Summation
```python
# หาผลรวม 1+2+...+50
total = 0
for num in range(1, 51):
    total += num
print(total)  # 1275
```

### ข้อ 4: while Loop
```python
# นับถอยหลัง
i = 9
while i > 0:
    print("Happy Day")
    i -= 1
print("Good Bye")
```

### ข้อ 5: 🔢 Multiplication Table
```python
x = int(input("แม่สูตรคูณ: "))

for i in range(1, 13):
    result = x * i
    print(f"{x} x {i} = {result}")
```

**Output:**
```
แม่สูตรคูณ: 5
5 x 1 = 5
5 x 2 = 10
5 x 3 = 15
...
5 x 12 = 60
```

### ข้อ 6: ⭐ Nested Loops - Pyramid
```python
# สามเหลี่ยมดาว
for i in range(1, 10):
    for j in range(1, i + 1):
        print("*", end=" ")
    print()  # ขึ้นบรรทัดใหม่
```

**Output:**
```
* 
* * 
* * * 
* * * * 
* * * * * 
...
```

### ข้อ 7: 📊 Calculate Average
```python
total = 0
count = 1

while count <= 5:
    num = int(input(f"Number {count}: "))
    total += num
    count += 1

avg = total / 5
print(f"Sum = {total}")
print(f"Avg = {avg}")
```

---

## 💡 Key Concepts

### for vs while
```python
# for - จำนวนครั้งแน่นอน
for i in range(10):
    print(i)

# while - ไม่รู้จำนวนครั้ง (ตามเงื่อนไข)
while user_input != 'quit':
    user_input = input("Command: ")
```

### range() Syntax
```python
range(stop)           # 0 ถึง stop-1
range(start, stop)    # start ถึง stop-1
range(start, stop, step)  # มีระยะห่าง step

range(5)        # 0, 1, 2, 3, 4
range(1, 5)     # 1, 2, 3, 4
range(1, 10, 2) # 1, 3, 5, 7, 9
```

### break & continue
```python
# break - หยุด loop ทันที
for i in range(10):
    if i == 5:
        break  # หยุดเมื่อ i=5
    print(i)  # 0,1,2,3,4

# continue - ข้ามรอบนั้น
for i in range(5):
    if i == 2:
        continue  # ข้าม 2
    print(i)  # 0,1,3,4
```

---

## 🚀 How to Run
```bash
python assignment_4.py
```
