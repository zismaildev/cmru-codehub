# 📱 Basic Widgets & Layouts

<div align="center">

![Type](https://img.shields.io/badge/Module-UI_Fundamentals-02569B?style=for-the-badge&logo=flutter)
![Topic](https://img.shields.io/badge/Topic-Widget_Tree-green?style=for-the-badge)

**"Mastering Properties of Row, Column, and Container"**

</div>

---

## 🎯 Problem Statement
การเข้าใจ **Widget Tree** คือหัวใจของการเขียน Flutter การจัดวาง Elements ต่างๆ ต้องอาศัยการซ้อน Widget (Nesting) อย่างถูกวิธีเพื่อให้ได้ UI ที่ยืดหยุ่น (Responsive)

## 🏗️ Widget Tree Visualizer

โครงสร้างหน้าจอ Profile อย่างง่าย

```mermaid
graph TD
    Scaffold --> AppBar[App Bar: 'My Profile']
    Scaffold --> Body
    Body --> Column[Column (Vertical)]
    Column --> CircleAvatar[User Image]
    Column --> Text1[Name: John Doe]
    Column --> Text2[Role: Developer]
    Column --> Row[Row (Horizontal)]
    Row --> Button1[Call]
    Row --> Button2[Email]
```

## 🧱 Key Components
- **Container**: กล่องสี่เหลี่ยมที่กำหนดขนาด สี ขอบ (Border) และเงา (Shadow) ได้
- **Row/Column**: Flexbox Layout สำหรับจัดเรียง Objects
- **Stack**: การวาง Widget ทับกัน (Z-Axis) เช่น การวาง Text บนรูป

## 💻 Tech Implementation
การใช้ `MainAxisAlignment` เพื่อจัดตำแหน่ง

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text("Left"),
    Text("Right"),
  ],
)
```

## 💡 Key Learnings
- **Constraint Layout**: "Constraints go down. Sizes go up. Parent sets position."
- **Padding vs Margin**: Padding คือระยะห่าง *ภายใน* Container, Margin คือระยะห่าง *ภายนอก*
