# 🧠 Java Logic & Math Algorithms

<div align="center">

![Language](https://img.shields.io/badge/Language-Java-ED8B00?style=for-the-badge&logo=openjdk)
![Type](https://img.shields.io/badge/Type-Algorithm-purple?style=for-the-badge)

**"Strengthening Computational Thinking with Java"**

</div>

---

## 🎯 Problem Statement
ก่อนจะสร้างระบบที่ซับซ้อน Programmer ต้องแม่นยำในตรรกะพื้นฐาน (Control Flow) และคณิตศาสตร์ Lab นี้รวบรวมโจทย์ฝึกสมอง เช่น การหาตัวหารร่วม, การเช็คเลขคู่/คี่, และสถิติ

## 🏗️ Logic Flowchart

อัลกอริทึมตรวจสอบเลขคู่-คี่ (Even/Odd Logic)

```mermaid
graph TD
    Start([Start]) --> Input[/Input Number N/]
    Input --> Mod{N % 2 == 0?}
    Mod -- Yes --> Even[Print 'Even']
    Mod -- No --> Odd[Print 'Odd']
    Even --> End([End])
    Odd --> End
```

## 💻 Code Examples

### 1. Modulo Operator (%)
ใช้หาเศษจากการหาร เพื่อแยกแยะ Pattern ของตัวเลข
```java
if (number % 2 == 0) {
    System.out.println("Even Number");
} else {
    System.out.println("Odd Number");
}
```

### 2. Loop & Summation
หาผลรวมตัวเลข 1 ถึง N
```java
int sum = 0;
for (int i = 1; i <= n; i++) {
    sum += i;
}
```

## 💡 Key Learnings
- **Algorithm Complexity**: เข้าใจการทำงานของ O(1) vs O(n) ผ่าน Loop
- **Data Types**: การเลือกใช้ `int` vs `double` ให้เหมาะสมกับโจทย์
