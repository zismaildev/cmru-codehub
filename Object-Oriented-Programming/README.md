# COM 3302 Object Oriented Programming

<div align="center">

![Type](https://img.shields.io/badge/Concept-Software_Design_Patterns-orange?style=for-the-badge)
![Tech](https://img.shields.io/badge/Stack-Java_SE_%7C_OOP-ED8B00?style=for-the-badge)

**"Building Scalable Systems with Strong Typing and Objects"**

</div>

---

## 🎯 เกี่ยวกับรายวิชา

รายวิชานี้เป็น**จุดเปลี่ยนสำคัญ** จากการเขียนโค้ดแบบ Procedural (เขียนตามลำดับ) มาเป็น **Object-Oriented Programming (OOP)** ซึ่งเป็นแนวคิดหลักในการพัฒนาซอฟต์แวร์สมัยใหม่

ใช้ภาษา **Java** เพราะ:
- **Strong Typing**: บังคับประกาศ Type ทำให้โค้ดปลอดภัยและหา Bug ง่าย
- **Pure OOP**: ทุกอย่างใน Java คือ Object (ยกเว้น Primitive Types)
- **Platform Independent**: เขียนครั้งเดียว รันได้ทุก OS (Write Once, Run Anywhere)
- **Industry Standard**: ใช้งานจริงในองค์กรขนาดใหญ่ทั่วโลก

### ทำไมต้องเรียน OOP?
เมื่อโปรแกรมใหญ่ขึ้น การเขียนโค้ดแบบเดิม (Procedural) จะ:
- **ซับซ้อน**: โค้ดยาวยืด อ่านยาก แก้ยาก
- **ซ้ำซ้อน**: Copy-Paste Code ซ้ำๆ
- **แก้ไขยาก**: เปลี่ยน 1 ที่ พังทั้งโปรแกรม

OOP แก้ปัญหาเหล่านี้ด้วยการ:
- **แบ่งโค้ดเป็น Objects** (วัตถุ) ที่มีหน้าที่ชัดเจน
- **Reuse Code** ผ่าน Inheritance
- **ปกป้องข้อมูล** ด้วย Encapsulation

### เนื้อหาหลักที่เรียน
1. **Class & Object** - การออกแบบ Blueprint และสร้าง Instance
2. **Encapsulation** - การซ่อนข้อมูลด้วย Access Modifiers
3. **Inheritance** - การสืบทอดคุณสมบัติ (Parent-Child)
4. **Polymorphism** - Method Overloading & Overriding
5. **Abstraction** - Abstract Class & Interface
6. **Exception Handling** - การจัดการข้อผิดพลาด
7. **Collections Framework** - ArrayList, HashMap

---

## 🔑 สิ่งที่เรียนรู้ (Key Learnings)

### 1. The 4 Pillars of OOP (เสาหลัก 4 ต้นของ OOP)

#### 🔒 Encapsulation (การห่อหุ้มข้อมูล)
- **Private Fields**: ซ่อนข้อมูลภายใน Class
- **Public Methods (Getters/Setters)**: ควบคุมการเข้าถึงข้อมูล
- **Data Hiding**: ป้องกันการแก้ไขข้อมูลโดยตรง

**ตัวอย่าง:**
```java
class BankAccount {
    private double balance; // ซ่อนไว้ภายใน
    
    public void deposit(double amount) { // ควบคุมผ่าน Method
        if (amount > 0) balance += amount;
    }
}
```

#### 🎭 Abstraction (การลดความซับซ้อน)
- **Abstract Class**: Class ที่ไม่สามารถสร้าง Object ได้โดยตรง
- **Interface**: สัญญาที่กำหนดว่า Class ต้องมี Method อะไรบ้าง
- **Hide Complex Logic**: แสดงเฉพาะสิ่งที่จำเป็น

#### 🧬 Inheritance (การสืบทอด)
- **extends keyword**: สืบทอดจาก Parent Class
- **Code Reusability**: ไม่ต้องเขียนซ้ำ
- **IS-A Relationship**: Dog IS-A Animal

**ตัวอย่าง:**
```java
class Animal { 
    void eat() { } 
}
class Dog extends Animal { 
    void bark() { } // Dog มีทั้ง eat() และ bark()
}
```

#### 🎨 Polymorphism (พหุสัณฐาน - หลายรูปแบบ)
- **Method Overloading**: Method ชื่อเดียวกัน แต่ Parameter ต่างกัน
- **Method Overriding**: Child Class เขียน Method ทับของ Parent
- **Dynamic Binding**: Java เลือก Method ที่ถูกต้องตอน Runtime

### 2. Class Design & Object Creation
- **Class**: แบบแปลน (Blueprint) ของ Object
- **Object**: สิ่งที่สร้างจาก Class (Instance)
- **Constructor**: Method พิเศษสำหรับสร้าง Object
- **this keyword**: อ้างอิงถึง Object ปัจจุบัน

### 3. Access Modifiers (ระดับการเข้าถึง)
- `public`: เข้าถึงได้จากทุกที่
- `private`: เข้าถึงได้เฉพาะใน Class เดียวกัน
- `protected`: เข้าถึงได้ใน Class และ Subclass
- `default` (ไม่ระบุ): เข้าถึงได้ใน Package เดียวกัน

### 4. Memory Management
- **Stack**: เก็บ Primitive Types และ Reference Variables
- **Heap**: เก็บ Objects จริงๆ
- **Garbage Collection**: Java ลบ Object ที่ไม่ใช้แล้วอัตโนมัติ

### 5. Collections Framework
- **ArrayList**: List แบบขยายขนาดได้
- **HashMap**: Key-Value Pairs
- **Generics**: `<T>` กำหนด Type ล่วงหน้า

---

## 📂 โครงสร้างภายใน (Repository Structure)

```
Object-Oriented-Programming/
├── README.md                ← ไฟล์นี้
├── lab/                     ← Lab ปฏิบัติการ
│   ├── Basic Apps/          → ฝึกพื้นฐาน Java (Input/Output/Logic)
│   ├── Logic and Math/      → คำนวณทางคณิตศาสตร์ด้วย OOP
│   ├── OOP Shapes/          → Workshop: Shapes (Inheritance, Polymorphism)
│   └── Sorting Demo/        → ฝึก Algorithm + OOP
└── mini-project/            ← โปรเจกต์ใหญ่
    └── [Various Projects]   → ระบบตัดเกรด, ระบบจัดการ, etc.
```

---

## 📚 Lab & Workshops

### 🟢 Level 1: Java Fundamentals
**Basic Apps**
- ฝึกพื้นฐาน Java Syntax
- การรับและแสดงผล (Scanner, System.out)
- Primitive Types vs Objects

**Logic and Math**
- การคำนวณทางคณิตศาสตร์
- ใช้ Math Library
- ฝึกเขียน Logic แบบ Object-Oriented

### 🟡 Level 2: OOP Concepts
**OOP Shapes**
- Workshop สร้าง Class: Circle, Rectangle, Triangle
- ฝึก Inheritance: Shape (Parent) → Circle, Rectangle (Child)
- ฝึก Polymorphism: Method `calculateArea()` ทำงานต่างกันตาม Shape
- ฝึก Encapsulation: Private Fields + Public Getters/Setters

**Sorting Demo**
- ฝึกการเรียงลำดับ (Bubble Sort, Selection Sort)
- ประยุกต์ใช้ OOP ในการจัดการข้อมูล
- ใช้ Collections Framework

---

## 🏆 Mini Projects

โปรเจกต์ที่ประยุกต์ใช้ OOP แบบเต็มรูปแบบ:

### ตัวอย่างโปรเจกต์ที่มักมีในวิชานี้
1. **ระบบตัดเกรด (Grading System)**
   - Class: Student, Course, Grade
   - Inheritance: Person → Student, Teacher
   - Encapsulation: Private grades + Calculate GPA

2. **ระบบห้องสมุด (Library System)**
   - Class: Book, Member, Transaction
   - Inheritance: Media → Book, Magazine, DVD
   - Encapsulation: Fine calculation logic

3. **ระบบจัดการสินค้า (Inventory System)**
   - Class: Product, Category, Stock
   - Inheritance: Product → Electronics, Food, Clothing
   - Collections: ArrayList<Product>

---

## 🛠️ เครื่องมือที่ใช้

### ✅ Required
- **[Java JDK](https://www.oracle.com/java/technologies/downloads/)** - Java Development Kit (แนะนำ JDK 11 หรือ 17)
- **IDE:**
  - [IntelliJ IDEA](https://www.jetbrains.com/idea/download/) (Community Edition ฟรี - แนะนำ)
  - หรือ [Eclipse](https://www.eclipse.org/downloads/)
  - หรือ [VS Code](https://code.visualstudio.com/) + Java Extension Pack

### 📦 Libraries
ส่วนใหญ่ใช้ **Java Standard Library** (มาพร้อมกับ JDK):
- `java.util.*` - Collections (ArrayList, HashMap)
- `java.io.*` - File I/O
- `java.lang.*` - พื้นฐาน (Math, String)

---

## 🚀 วิธีการรัน (How to Run)

### 📋 Prerequisites
1. ติดตั้ง Java JDK:
   - Download จาก [Oracle](https://www.oracle.com/java/technologies/downloads/)
   - ตั้งค่า `JAVA_HOME` Environment Variable

2. ตรวจสอบว่าติดตั้งสำเร็จ:
   ```bash
   java -version
   javac -version
   ```

### ▶️ รันโปรแกรม Java

**วิธีที่ 1: Command Line**
```bash
# Compile (แปลเป็น Bytecode)
javac Filename.java

# Run
java Filename
```

**วิธีที่ 2: ใช้ IDE (แนะนำ)**
1. เปิด Project ใน IntelliJ IDEA / Eclipse
2. คลิกขวาที่ไฟล์ที่มี `main()` method
3. เลือก "Run"

**ตัวอย่าง:**
```bash
cd Object-Oriented-Programming/lab/Basic\ Apps/
javac HelloWorld.java
java HelloWorld
```

### 🔧 Troubleshooting
- **`javac` ไม่ทำงาน**: ตรวจสอบว่าเพิ่ม JDK/bin ใน PATH แล้ว
- **Class not found**: ตรวจสอบว่า Compile แล้ว (มีไฟล์ `.class`)
- **Package errors**: ให้สอน Package Structure ให้ถูกต้อง

---

## 📖 แนะนำสำหรับรุ่นน้อง

### 🎓 เริ่มต้นอย่างไร?
1. **เข้าใจ Class & Object ก่อน**: นี่คือหัวใจของ OOP
2. **ฝึกวาด Diagram**: UML Class Diagram ช่วยให้เห็นภาพ
3. **เริ่มจาก Lab ง่ายๆ**: Basic Apps → Shapes → Mini Project
4. **เปรียบเทียบกับ Python**: ดูว่า OOP ใน Java ต่างยังไง

### 💡 Tips & Best Practices
- **ตั้งชื่อ Class ตัวใหญ่**: `BankAccount` ไม่ใช่ `bankaccount`
- **ตั้งชื่อ Method ตัวเล็ก**: `calculateTotal()` ไม่ใช่ `CalculateTotal()`
- **1 Class = 1 File**: ไฟล์ชื่อเดียวกับ Class (เช่น `Student.java`)
- **ใช้ Encapsulation เสมอ**: ทำ Fields เป็น private + สร้าง Getters/Setters
- **อ่าน Error Message**: Java บอกข้อผิดพลาดละเอียดมาก

### 📚 แหล่งเรียนรู้เพิ่มเติม
- [Oracle Java Tutorials](https://docs.oracle.com/javase/tutorial/) - เอกสารทางการ
- [Java OOP Concepts](https://www.w3schools.com/java/java_oop.asp) - W3Schools
- [Head First Java](https://www.oreilly.com/library/view/head-first-java/0596009208/) - หนังสือแนะนำ
- [Java Visualizer](https://pythontutor.com/java.html) - ดูการทำงานของโค้ดแบบ Step-by-step

### ⚠️ ข้อผิดพลาดที่พบบ่อย
- ❌ ลืมใส่ Semicolon `;` ท้ายบรรทัด
- ❌ เขียน `public static void Main` แทน `main` (ตัวเล็ก!)
- ❌ เข้าถึง Private Field จากนอก Class
- ❌ ลืม `new` ตอนสร้าง Object: `Student s = new Student();`
- ❌ เปรียบเทียบ String ด้วย `==` แทน `.equals()`

### 🔄 Python → Java Cheat Sheet
| Python | Java |
|:---|:---|
| `def func():` | `void func() { }` |
| `x = 5` | `int x = 5;` |
| `my_list = []` | `ArrayList<Integer> myList = new ArrayList<>();` |
| `if x == 5:` | `if (x == 5) { }` |
| `class Dog:` | `class Dog { }` |

---

## 📄 License
โค้ดในโปรเจกต์นี้เป็นส่วนหนึ่งของการเรียนการสอนในรายวิชา COM 3302 Object Oriented Programming

---

<div align="center">

**Happy Coding! ☕️💻**

*"OOP is not just about code, it's about thinking in objects."*

</div>
