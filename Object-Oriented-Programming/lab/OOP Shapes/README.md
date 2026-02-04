# 📐 OOP Shapes (Polymorphism)

<div align="center">

![Language](https://img.shields.io/badge/Language-Java-ED8B00?style=for-the-badge&logo=java)
![Concept](https://img.shields.io/badge/Concept-Method_Overloading-purple?style=for-the-badge)

**"Flexible Class Design with Constructors"**

</div>

---

## 🎯 Objective
เรียนรู้หลักการ **Polymorphism** (การพ้องรูป) ผ่านการทำ **Constructor Overloading** ซึ่งช่วยให้ Class เดียวสามารถสร้าง Object รูปทรงต่างๆ ได้หลายแบบโดยใช้ชื่ออ้างอิงเดิม

## 🏗️ Overloading Structure

```mermaid
classDiagram
    class AreaShape {
        +double area
        +AreaShape(double r)
        +AreaShape(double w, double h)
        +AreaShape(double b, double h, String type)
        +getArea()
    }
    
    note for AreaShape "One Class, Multiple Forms"
```

## 💻 Code Implementation
```java
// 1. Circle Constructor
public AreaShape(double r) {
    this.area = Math.PI * r * r;
}

// 2. Rectangle Constructor
public AreaShape(double w, double h) {
    this.area = w * h;
}
```

## 💡 Key Learnings
- **Overloading**: การมี Method/Constructor ชื่อเดียวกันแต่ Parameter ต่างกัน
- **Code Reusability**: ลดการสร้าง Class ใหม่พร่ำเพรื่อ (เช่น `CircleClass`, `RectClass`) โดยรวบรวม Logic ไว้ที่เดียว
