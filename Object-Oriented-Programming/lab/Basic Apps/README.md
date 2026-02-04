# 📱 Java Console Applications

<div align="center">

![Language](https://img.shields.io/badge/Language-Java-ED8B00?style=for-the-badge)
![Interface](https://img.shields.io/badge/UI-Console/CLI-black?style=for-the-badge)

**"Building Interactive Command-Line Tools"**

</div>

---

## 🎯 Problem Statement
การสร้างโปรแกรมบรรทัดคำสั่ง (CLI) เป็นพื้นฐานของการรับค่าจากผู้ใช้ (User Input) และการแสดงผล (Output) โดยไม่ต้องพึ่งพากราฟิก GUI

## 🏗️ Activity Diagram

การทำงานของเครื่องคิดเลข (Simple Calculator)

```mermaid
graph TD
    Start([Start]) --> Msg[/Show Menu (+, -, *, /)/]
    Msg --> Input[/Input Choice & Numbers/]
    Input --> Switch{Switch Choice}
    Switch -- + --> Add[Result = A + B]
    Switch -- - --> Sub[Result = A - B]
    Switch -- * --> Mul[Result = A * B]
    Switch -- / --> Div[Result = A / B]
    Add --> Show[/Display Result/]
    Sub --> Show
    Mul --> Show
    Div --> Show
    Show --> Loop{Continue?}
    Loop -- Yes --> Msg
    Loop -- No --> End([End])
```

## 💻 Code Structure
- **Scanner Class**: ใช้ `java.util.Scanner` เพื่อรับค่าจาก Keyboard
- **Switch Case**: ใช้สำหรับสร้างเมนูทางเลือกที่ชัดเจนและอ่านง่ายกว่า if-else ซ้อนกัน

```java
Scanner sc = new Scanner(System.in);
System.out.print("Enter number: ");
int num = sc.nextInt();
```

## 💡 Key Learnings
- **Input Validation**: การป้องกันโปรแกรม Crash เมื่อผู้ใช้ใส่ค่าผิด (เช่น หารด้วยศูนย์)
- **User Experience (CLI)**: การออกแบบ Flow ให้ผู้ใช้ใช้งานง่ายแม้ไม่มีปุ่มกด
