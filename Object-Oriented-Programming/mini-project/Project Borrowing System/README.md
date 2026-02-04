# 📚 Project Borrowing System

<div align="center">

![Language](https://img.shields.io/badge/Language-Java-ED8B00?style=for-the-badge)
![Concept](https://img.shields.io/badge/Concept-Object_Oriented-red?style=for-the-badge)

**"Equipment Management Logic Implementation"**

</div>

---

## 🎯 Objective
ระบบจำลองการยืม-คืนอุปกรณ์ (Borrowing System) ฝึกการใช้ OOP (Encapsulation, Inheritance) เพื่อจัดการสถานะของสิ่งของและผู้ใช้งาน

## 🏗️ Class Diagram

```mermaid
classDiagram
    class Item {
        -String id
        -String name
        -boolean isBorrowed
        +borrow(User user)
        +returnItem()
    }
    class User {
        -String userId
        -String name
        -List borrowedItems
    }
    class SystemMain {
        +main()
        +menu()
    }
    
    Item "0..*" <-- "1" User : borrows
```

## 💻 Code Structure
- **Main.java**: จุดเริ่มต้นของโปรแกรม (Entry Point) และ Menu Loop
- **Supermain.java**: คลาสหลักที่มี Logic การจัดการ Array ของอุปกรณ์

```java
// Logic การตรวจสอบสถานะอุปกรณ์
if (!item.isBorrowed()) {
    item.setBorrowed(true);
    System.out.println("Borrow Success!");
} else {
    System.out.println("Item is already borrowed.");
}
```

## 💡 Key Learnings
- **State Management**: การใช้ Boolean Flag (`isBorrowed`) เพื่อป้องกันการยืมซ้ำ
- **User Interface**: การออกแบบ CLI Menu ที่ใช้งานง่าย
