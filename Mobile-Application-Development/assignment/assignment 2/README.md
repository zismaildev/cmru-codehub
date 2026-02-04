# 🧮 Advanced Dart Algorithms (Assignment 2)

<div align="center">

![Language](https://img.shields.io/badge/Language-Dart-0175C2?style=for-the-badge&logo=dart)
![Math](https://img.shields.io/badge/Math-Financial_%7C_Health-green?style=for-the-badge)

**"Complex Computations & Unit Conversions"**

</div>

---

## 🎯 Problem Statement
แบบฝึกหัดชุดนี้เน้นการประยุกต์ใช้สูตรคำนวณที่ซับซ้อนขึ้นในชีวิตจริง ทั้งด้านวิทยาศาสตร์ (อุณหภูมิ), สุขภาพ (BMI), และการเงิน (ดอกเบี้ย) โดยใช้ Data Type `double` อย่างแม่นยำ

## 🏗️ Logic Diagrams

**1. Temperature Conversion Logic**
```mermaid
graph LR
    Input[Temp Input] --> Type{Unit?}
    Type -- C to F --> Calc1[F = C * 9/5 + 32]
    Type -- F to C --> Calc2[C = (F - 32) * 5/9]
    Calc1 --> Output
    Calc2 --> Output
```

## 📋 Challenge Set
1.  **BMI Calculator**: `Weight(kg) / Height(m)^2`
2.  **Compound Interest**: `A = P(1 + r/n)^(nt)`
3.  **Temp Converter**: Celsius ↔ Fahrenheit

## 💻 Tech Implementation
Using `dart:math` for power calculation (`pow`).

```dart
import 'dart:math';

double calculateCompoundInterest(double principal, double rate, int years) {
  // A = P * (1 + r)^t
  return principal * pow((1 + rate/100), years);
}
```

## 💡 Key Learnings
- **Library Import**: การเรียกใช้ `dart:math` เพื่อใช้ฟังก์ชันทางคณิตศาสตร์ขั้นสูง
- **Operator Precedence**: ลำดับความสำคัญของเครื่องหมายคณิตศาสตร์
