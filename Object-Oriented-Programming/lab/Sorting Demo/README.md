# 📶 Sorting Algorithms Demo

<div align="center">

![Language](https://img.shields.io/badge/Language-Java-ED8B00?style=for-the-badge&logo=java)
![Topic](https://img.shields.io/badge/Algorithm-Bubble_Sort-red?style=for-the-badge)

**"Comparing Loop Structures in Sorting Logic"**

</div>

---

## 🎯 Objective
โปรแกรมสาธิตการทำงานของ **Bubble Sort** อัลกอริทึม โดยเปรียบเทียบการเขียน Loop Control 3 รูปแบบ (`for`, `while`, `do-while`) เพื่อเข้าใจพฤติกรรมการวนซ้ำที่แตกต่างกัน

## 🏗️ Bubble Sort Visualization

```mermaid
graph LR
    Step0[64, 34, 25, 12] -->|Pass 1| Step1[34, 25, 12, 64]
    Step1 -->|Pass 2| Step2[25, 12, 34, 64]
    Step2 -->|Pass 3| Step3[12, 25, 34, 64]
    Step3 -->|Sorted| Final([Result])
    
    style Final fill:#bbf,stroke:#333
```

## 💻 Code Comparison
การสลับค่า (Swapping) เป็นหัวใจสำคัญของ Bubble Sort

```java
// Swapping Logic
if (arr[j] > arr[j+1]) {
    int temp = arr[j];
    arr[j] = arr[j+1];
    arr[j+1] = temp;
}
```

## 💡 Key Learnings
- **Time Complexity**: Bubble Sort มีความซับซ้อนระดับ O(n²) ซึ่งช้าแต่เข้าใจง่าย
- **Loop Control**: `for` เหมาะกับรู้จำนวนรอบ, `while` เหมาะกับเงื่อนไข
