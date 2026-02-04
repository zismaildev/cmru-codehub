# 📏 Unit Converter Application

<div align="center">

![Language](https://img.shields.io/badge/Language-C_Programming-A8B9CC?style=for-the-badge)
![Type](https://img.shields.io/badge/Type-Utility-green?style=for-the-badge)

**"Metric to Imperial Unit Conversion Logic"**

</div>

---

## 🎯 Problem Statement
โปรแกรมแปลงหน่วยวัด (Unit Conversion) เป็นตัวอย่างที่ดีของการประยุกต์ใช้คณิตศาสตร์ร่วมกับเงื่อนไขทางโปรแกรม โจทย์คือการสร้างเครื่องมือแปลงค่าระหว่าง **นิ้ว (Inches)** และ **เมตร (Meters)**

## 🏗️ Process Diagram

```mermaid
sequenceDiagram
    participant User
    participant Program
    
    User->>Program: Select Mode (1: Inch->Meter, 2: Meter->Inch)
    User->>Program: Input Value
    alt Mode 1
        Program->>Program: Result = Value * 0.0254
    else Mode 2
        Program->>Program: Result = Value / 0.0254
    end
    Program-->>User: Display Formatted Result (%.4f)
```

## 💻 Code Snippet
Constants defined for precision and maintainability.

```c
#define INCH_TO_METER 0.0254

if (choice == 1) {
    printf("%.4f inches = %.4f meters", val, val * INCH_TO_METER);
} else {
    printf("%.4f meters = %.4f inches", val, val / INCH_TO_METER);
}
```

## 💡 Key Learnings
- **Floating Point Precision**: การใช้ `double` และ `%.4f` เพื่อจัดการทศนิยมให้แม่นยำ
- **Constants Definition**: การใช้ `#define` แทน Magic Number ในสูตรคำนวณ
