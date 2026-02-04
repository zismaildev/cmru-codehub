# 🔺 Pyramid Pattern Printing (C Logic)

<div align="center">

![Language](https://img.shields.io/badge/Language-C_Programming-A8B9CC?style=for-the-badge)
![Topic](https://img.shields.io/badge/Topic-Nested_Loops-red?style=for-the-badge)

**"Mastering Control Flow with Nested Iterations"**

</div>

---

## 🎯 Problem Statement
หนึ่งในโจทย์ปราบเซียนสำหรับผู้เริ่มต้นเขียนโปรแกรมคือ "Nested Loop" (Loop ซ้อน Loop) การพิมพ์รูปทรงพีระมิดต้องใช้ตรรกะทางคณิตศาสตร์ความสัมพันธ์ระหว่าง "บรรทัด" (Row), "ช่องว่าง" (Space), และ "ดอกจัน" (Star)

## 🏗️ Loop Visualization

```mermaid
graph TD
    Outer[Outer Loop: Rows i=1 to N] --> InnerSpace[Inner Loop 1: Print Spaces]
    InnerSpace --> InnerStar[Inner Loop 2: Print Stars]
    InnerStar --> NewLine[Print New Line \n]
    NewLine --> Check{i <= N?}
    Check -- Yes --> Outer
    Check -- No --> End([Finish])
```

## 📐 Mathematical Logic
สำหรับพีระมิดความสูง `n`:
- **Spaces**: `n - i` ช่อง
- **Stars**: `2*i - 1` ดวง

```c
// Example for Row i
for(j = 1; j <= n-i; j++) printf(" ");  // Print Spaces
for(k = 1; k <= 2*i-1; k++) printf("*"); // Print Stars
```

## 💡 Key Learnings
- **Index Manipulation**: การจัดการตัวแปร `i, j, k` ใน Loop ซ้อนกัน
- **Pattern Recognition**: การมอง Output ให้ออกเป็นสมการคณิตศาสตร์
