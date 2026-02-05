# COM 2701 Computer Systems & Architecture

<div align="center">

![Type](https://img.shields.io/badge/Level-Low_Level_Programming-red?style=for-the-badge)
![Tech](https://img.shields.io/badge/Stack-C_Language-A8B9CC?style=for-the-badge)

**"Understanding How Computers Really Work - From Bits to Programs"**

</div>

---

## 🎯 เกี่ยวกับรายวิชา

รายวิชานี้เป็น**จุดเชื่อมต่อระหว่างฮาร์ดแวร์กับซอฟต์แวร์** ที่จะทำให้เข้าใจว่าคอมพิวเตอร์ทำงานอย่างไร ตั้งแต่ระดับ **ฮาร์ดแวร์ (Hardware)** ไปจนถ มถึงระดับ **ซอฟต์แวร์ (Software)**

ใช้ภาษา **C** เพราะ:
- **Low-Level Language**: ใกล้กับภาษาเครื่อง (Assembly) มากที่สุดในภาษา High-Level
- **Direct Memory Access**: เข้าถึง Memory โดยตรงผ่าน Pointers
- **No Abstraction**: ไม่มีอะไรซ่อนไว้ เห็นทุกอย่างที่เกิดขึ้นจริงๆ
- **Foundation of OS**: Linux, Windows Core ล้วนเขียนด้วย C

### ทำไมต้องเรียนวิชานี้?
หลังจากเรียน Python, Java มาแล้ว อาจจะคิดว่า:
- "แค่เรียก Variable ก็ใช้ได้แล้ว ทำไมต้องสน Memory?"
- "Java มี Garbage Collector จัดการให้อยู่แล้ว"

**แต่ความจริงคือ:**
- Memory มีจำกัด - ถ้าไม่เข้าใจจะ Memory Leak
- Performance สำคัญ - CPU, Cache, การจัดเก็บข้อมูลมีผลมาก
- Debug ยาก - ไม่เข้าใจระบบภายในจะแก้ Bug ไม่ได้

วิชานี้ทำให้:
- เขียน Code มีประสิทธิภาพ (Fast & Memory-Efficient)
- Debug ง่ายขึ้น (รู้ว่าเกิดอะไรใน Memory)
- เข้าใจ OS, Embedded Systems, IoT

### เนื้อหาหลักที่เรียน
1. **Computer Organization** - CPU, Memory, I/O
2. **Number Systems** - Binary, Hex, Two's Complement
3. **C Programming** - Syntax, Pointers, Struct
4. **Memory Management** - Stack, Heap, malloc/free
5. **Data Representation** - How data stored in memory
6. **Assembly Language Basics** - Low-level instructions

---

## 🔑 สิ่งที่เรียนรู้ (Key Learnings)

### 1. Computer Architecture Fundamentals

#### 🖥️ Von Neumann Architecture
- **CPU (Central Processing Unit)**: สมองของเครื่อง
  - ALU: คำนวณทางคณิตศาสตร์และลอจิก
  - Control Unit: ควบคุมการทำงาน
  - Registers: หน่วยความจำที่เร็วที่สุด
- **Memory**: เก็บข้อมูลและคำสั่ง
  - RAM: หน่วยความจำชั่วคราว
  - ROM: หน่วยความจำถาวร
- **I/O Devices**: อุปกรณ์รับและแสดงผล
- **Bus**: สายสัญญาณเชื่อมต่อทุกอย่าง

#### 💾 Memory Hierarchy
```
[Fastest] Registers → Cache → RAM → Disk [Slowest]
[Smallest]                              [Largest]
```

### 2. Number Systems & Data Representation

#### Binary & Hexadecimal
- **Binary (ฐาน 2)**: `0b1010` = 10 (ฐาน 10)
- **Hex (ฐาน 16)**: `0xA` = 10 (ฐาน 10)
- **Two's Complement**: แทนเลขติดลบ (-5 = ~5 + 1)

#### Data Types in Memory
| Type | Size (bytes) | Range |
|:---|---:|:---|
| `char` | 1 | -128 to 127 |
| `int` | 4 | -2,147,483,648 to 2,147,483,647 |
| `float` | 4 | ~6-7 digits precision |
| `double` | 8 | ~15-16 digits precision |

### 3. C Programming Essentials

#### Pointers - ตัวแปรที่เก็บ Address
```c
int x = 10;        // x เก็บค่า 10
int *p = &x;       // p เก็บ Address ของ x
printf("%d", *p);  // *p = ค่าที่ Address นั้น (10)
```

**ทำไมต้องใช้ Pointer?**
- **Pass by Reference**: แก้ค่าตัวแปรใน Function ได้
- **Dynamic Memory**: จองหน่วยความจำตอน Runtime
- **Array & String**: ชื่อ Array คือ Pointer
- **Efficiency**: ส่ง Address ง่ายกว่าส่งข้อมูลทั้งก้อน

#### Memory Allocation
```c
// Stack (Auto-managed)
int x = 5;

// Heap (Manual)
int *p = (int*)malloc(sizeof(int) * 10);  // จอง
free(p);                                   // คืน (ต้องทำเอง!)
```

#### Struct - การรวมข้อมูลหลาย Type
```c
struct Student {
    char name[50];
    int id;
    float gpa;
};
```

### 4. Stack vs Heap

| | Stack | Heap |
|:---|:---|:---|
| **ขนาด** | เล็ก (~MB) | ใหญ่ (~GB) |
| **ความเร็ว** | เร็วมาก | ช้ากว่า |
| **การจัดการ** | Auto (ออกจาก Scope แล้วหาย) | Manual (malloc/free) |
| **ใช้เมื่อ** | Local Variables, Function Calls | Dynamic Arrays, Large Data |
| **อันตราย** | Stack Overflow | Memory Leak |

### 5. Common Memory Errors

#### 🔴 Memory Leak
```c
int *p = malloc(sizeof(int));
// ลืม free(p); ← Memory Leak!
```

#### 🔴 Dangling Pointer
```c
int *p = malloc(sizeof(int));
free(p);
*p = 5;  // ← ERROR! ใช้ Memory ที่ free แล้ว
```

#### 🔴 Buffer Overflow
```c
char name[10];
scanf("%s", name);  // ถ้าใส่เกิน 10 ตัว ← ERROR!
```

---

## 📂 โครงสร้างภายใน (Repository Structure)

```
Computer-Systems-and-Architecture/
├── README.md                ← ไฟล์นี้
└── lab/                     ← Lab ปฏิบัติการ
    ├── [Lab 1-12]           → แบบฝึกหัดรายสัปดาห์
    └── [Final Project]      → โปรเจกต์ปลายภาค
```

---

## 📚 Lab Topics (ตัวอย่าง)

### 🟢 Weeks 1-4: C Basics
- **Lab 1**: Hello World, Input/Output
- **Lab 2**: Data Types, Operators
- **Lab 3**: Control Flow (if, for, while)
- **Lab 4**: Arrays & Strings

### 🟡 Weeks 5-8: Pointers & Memory
- **Lab 5**: Introduction to Pointers
- **Lab 6**: Pointer Arithmetic
- **Lab 7**: Dynamic Memory (malloc, free)
- **Lab 8**: Struct & Union

### 🟠 Weeks 9-12: Advanced Topics
- **Lab 9**: File I/O
- **Lab 10**: Linked List (Dynamic Data Structure)
- **Lab 11**: Bit Manipulation
- **Lab 12**: Mini Project

---

## 🛠️ เครื่องมือที่ใช้

### ✅ Required
- **C Compiler:**
  - [GCC](https://gcc.gnu.org/) (Windows: MinGW, Mac/Linux: มีมาให้)
  - หรือ [Clang](https://clang.llvm.org/)
- **IDE/Editor:**
  - [VS Code](https://code.visualstudio.com/) + C/C++ Extension (แนะนำ)
  - หรือ [Code::Blocks](http://www.codeblocks.org/)
  - หรือ [Dev-C++](https://www.bloodshed.net/devcpp.html)

### 🔧 Optional Tools
- **Debugger**: GDB (มากับ GCC)
- **Memory Checker**: Valgrind (Linux/Mac) - ตรวจหา Memory Leak
- **Compiler Explorer**: [godbolt.org](https://godbolt.org/) - ดู Assembly Code

---

## 🚀 วิธีการรัน (How to Run)

### 📋 Prerequisites
1. ติดตั้ง GCC:
   - **Windows**: Download [MinGW](https://www.mingw-w64.org/)
   - **Mac**: `brew install gcc` หรือใช้ Clang ที่มามาให้
   - **Linux**: `sudo apt install build-essential`

2. ตรวจสอบว่าติดตั้งสำเร็จ:
   ```bash
   gcc --version
   ```

### ▶️ Compile & Run

```bash
# Compile (สร้างไฟล์ .exe หรือ a.out)
gcc program.c -o program

# Run
./program        # Mac/Linux
program.exe      # Windows
```

**ตัวอย่าง:**
```bash
cd Computer-Systems-and-Architecture/lab/
gcc lab1.c -o lab1
./lab1
```

### 🔧 Troubleshooting
- **`gcc` ไม่ทำงาน**: ตรวจสอบว่าเพิ่มใน PATH แล้ว
- **Warning ต่างๆ**: ใส่ Flag `-Wall` เพื่อเห็น Warning ทั้งหมด
  ```bash
  gcc -Wall program.c -o program
  ```
- **Segmentation Fault**: มักเกิดจาก Pointer ผิด, Array Out of Bounds

---

## 📖 แนะนำสำหรับรุ่นน้อง

### 🎓 เริ่มต้นอย่างไร?
1. **ทบทวน Python/Java ก่อน**: จะช่วยให้เข้าใจ Concept ได้ง่าย
2. **ฝึก Pointer บ่อยๆ**: นี่คือหัวใจของภาษา C
3. **วาดภาพ Memory**: ช่วยให้เห็น Address, Value ชัดเจน
4. **ใช้ Debugger**: อย่าพึ่งแค่ `printf()` เสมอ

### 💡 Tips & Best Practices
- **เช็ค NULL เสมอ**: หลัง malloc ต้องเช็คว่าจองสำเร็จไหม
  ```c
  int *p = malloc(sizeof(int));
  if (p == NULL) {
      printf("Memory allocation failed!");
      return 1;
  }
  ```
- **ใช้ `sizeof()` แทนเลข Hard-code**: `malloc(sizeof(int) * 10)`
- **free ทุกครั้งที่ malloc**: ป้องกัน Memory Leak
- **ระวัง Buffer Overflow**: ใช้ `fgets()` แทน `gets()`
- **Compile ด้วย `-Wall`**: จะเตือน Warning ที่อันตราย

### 📚 แหล่งเรียนรู้เพิ่มเติม
- [Learn-C.org](https://www.learn-c.org/) - Interactive Tutorial
- [C Programming Absolute Beginner's Guide](https://www.amazon.com/Programming-Absolute-Beginners-Guide-3rd/dp/0789751984)
- [The C Programming Language](https://www.amazon.com/Programming-Language-2nd-Brian-Kernighan/dp/0131103628) (K&R Bible)
- [CS50 by Harvard](https://cs50.harvard.edu/x/) - มี C และ Memory ละเอียดมาก

### ⚠️ ข้อผิดพลาดที่พบบ่อย
- ❌ ลืม `#include <stdio.h>` แล้วใช้ `printf()`
- ❌ ลืม `&` ใน `scanf()`: `scanf("%d", &x);` (ต้องมี &)
- ❌ ลืม `\0` ท้าย String
- ❌ ใช้ Pointer ที่ไม่ได้ Initialize
- ❌ free() แล้วใช้ต่อ (Dangling Pointer)

### 🔄 Java → C Differences
| Java | C |
|:---|:---|
| `String name = "John";` | `char name[] = "John";` |
| `int[] arr = new int[10];` | `int *arr = malloc(sizeof(int)*10);` |
| `System.out.println(x);` | `printf("%d\n", x);` |
| Auto Garbage Collection | Manual `free()` |
| No Pointers | Pointers Everywhere! |

---

## 📄 License
โค้ดในโปรเจกต์นี้เป็นส่วนหนึ่งของการเรียนการสอนในรายวิชา COM 2701 Computer Systems and Architecture

---

<div align="center">

**Happy Coding! 💾⚡**

*"C gives you enough rope to hang yourself." - But that's how you learn!*

</div>
