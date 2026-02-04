# 📊 Student Grading System

<div align="center">

![Language](https://img.shields.io/badge/Language-Java-ED8B00?style=for-the-badge&logo=java)
![Algorithm](https://img.shields.io/badge/Algorithm-Grading_Logic-blue?style=for-the-badge)

**"Automated Score Calculation & Reporting"**

</div>

---

## 🎯 Objective
ระบบคำนวณเกรดนักศึกษาอัตโนมัติ รองรับการประมวลผลข้อมูลจำนวนมาก (Batch Processing) และแสดงผลรายงานสรุปทางสถิติของห้องเรียน

## 🏗️ Logic Flowchart

```mermaid
graph TD
    Start([Start]) --> Input[Input Student Scores]
    Input --> Loop{For Each Student}
    Loop --> CheckScore{Score >= 80?}
    CheckScore -- Yes --> GradeA[Grade = A]
    CheckScore -- No --> CheckB{Score >= 70?}
    CheckB -- Yes --> GradeB[Grade = B]
    CheckB -- No --> GradeF[Calculate Other Grades...]
    GradeA --> Store[Store in Array]
    GradeB --> Store
    GradeF --> Store
    Store --> Loop
    Loop -- Done --> Report[Print Class Report]
    Report --> End([End])
```

## � Tech Implementation
การใช้ **Array** เพื่อเก็บข้อมูลและ Loop เพื่อประมวลผล

```java
// Grade Calculation Logic
public char calculateGrade(int score) {
    if (score >= 80) return 'A';
    else if (score >= 70) return 'B';
    else if (score >= 60) return 'C';
    else if (score >= 50) return 'D';
    else return 'F';
}
```

## 💡 Key Learnings
- **Control Flow**: การใช้ if-else ladder ในการตัดสินใจช่วงคะแนน
- **Data Aggregation**: การคำนวณค่าเฉลี่ย (Average) และหาค่า Max/Min ของข้อมูลใน Array
