# COM 4304 Mobile Application Development

<div align="center">

![Type](https://img.shields.io/badge/Platform-Cross_Platform-blue?style=for-the-badge)
![Tech](https://img.shields.io/badge/Stack-Flutter_%7C_Dart-02569B?style=for-the-badge)

**"Creating Smooth, Native-Like Experiences on iOS and Android"**

</div>

---

## 🎯 เกี่ยวกับรายวิชา

รายวิชานี้มุ่งเน้นการพัฒนาแอปพลิเคชันบนอุปกรณ์เคลื่อนที่ (Mobile Application) ด้วย **Flutter Framework** ซึ่งเป็น SDK ที่พัฒนาโดย Google สำหรับสร้างแอปพลิเคชัน **Cross-platform** (เขียนโค้ดครั้งเดียว รันได้ทั้ง iOS และ Android)

### เนื้อหาหลักที่เรียน
1. **Dart Programming Language** - ภาษาโปรแกรมพื้นฐานที่ใช้กับ Flutter
2. **Flutter Widgets** - การสร้าง UI ด้วย Widget Tree
3. **State Management** - การจัดการข้อมูลและสถานะในแอป (StatelessWidget, StatefulWidget, Provider)
4. **Navigation & Routing** - การเปลี่ยนหน้าและส่งข้อมูลระหว่างหน้า
5. **User Input & Forms** - การรับข้อมูลจากผู้ใช้
6. **Asynchronous Programming** - การทำงานแบบ Async/Await กับ Future และ Stream
7. **API Integration** - การเชื่อมต่อกับ Backend ผ่าน HTTP Requests

---

## 🔑 สิ่งที่เรียนรู้ (Key Learnings)

### 1. Widget Tree & Composition
- **ทุกอย่างใน Flutter คือ Widget**: ตั้งแต่ปุ่ม, ข้อความ, Layout ไปจนถึงหน้าจอทั้งหมด
- **Composition over Inheritance**: การสร้าง UI ที่ซับซ้อนด้วยการประกอบ Widget เล็กๆ เข้าด้วยกัน
- **Stateless vs Stateful**: ความแตกต่างระหว่าง Widget ที่ไม่เปลี่ยนแปลงและ Widget ที่มี State

### 2. State Management Patterns
- **setState()**: การจัดการ State ภายใน Widget เดียว (Local State)
- **Provider Pattern**: การแชร์ State ข้อมูลระหว่างหลาย Widget (Global State)
- **ChangeNotifier**: Observer Pattern สำหรับแจ้งเตือนเมื่อข้อมูลเปลี่ยน

### 3. User Interface Design
- **Material Design**: หลักการออกแบบตามมาตรฐานของ Google
- **Responsive Layout**: การสร้าง UI ที่รองรับหน้าจอหลายขนาด (Mobile, Tablet)
- **Custom Widgets**: การสร้าง Widget ที่ Reusable และ Maintainable

### 4. Navigation & Data Passing
- **Navigator.push/pop**: การเปลี่ยนหน้าแบบ Stack
- **Named Routes**: การกำหนดเส้นทางด้วยชื่อ
- **Passing Arguments**: การส่งข้อมูลระหว่างหน้า

### 5. Asynchronous Programming
- **Future**: การจัดการงานที่ใช้เวลา (เช่น ดึงข้อมูลจาก API)
- **async/await**: Syntax สำหรับเขียนโค้ด Async แบบอ่านง่าย
- **Stream**: การรับข้อมูลแบบ Real-time

---

## 📂 โครงสร้างภายใน (Repository Structure)

```
Mobile-Application-Development/
├── README.md                    ← ไฟล์นี้
├── lab/                         ← บทเรียนตามลำดับ
│   ├── basic/                   → พื้นฐาน Widget (Text, Button, Container)
│   ├── chapter 2/               → Input & Dialog (TextField, AlertDialog)
│   ├── page_navigator/          → การเปลี่ยนหน้า (Navigator)
│   ├── state_management/        → Provider Pattern (ChangeNotifier)
│   └── menu/                    → Workshop Menu App
├── assignment/                  ← งานที่มอบหมาย
│   ├── assignment 1/            → ฝึก Dart Logic & Math
│   ├── assignment 2/            → Advanced Dart & List Manipulation
│   ├── quiz/                    → Quiz หลังเรียนจบ
│   └── quiz_exchange_currency/ → Quiz แปลงสกุลเงิน
└── mini-project/                ← โปรเจกต์ภาคเรียน
    └── stock_portfolio_mini_project/  → แอปบริหารพอร์ตหุ้น (Final Project)
```

---

## 📚 บทเรียน (Learning Modules)

เส้นทางการเรียนรู้แบบ Step-by-Step ตั้งแต่พื้นฐานจนถึงขั้นสูง:

### 🟢 Level 1: พื้นฐาน (Beginner)
1. **[Basic Widgets](./lab/basic/README.md)**
   - Widget พื้นฐาน: `Text`, `Container`, `Row`, `Column`
   - การจัด Layout แบบ Flexbox
   - การใส่สี, ขนาด, และ Padding/Margin

2. **[Chapter 2: Input & Dialog](./lab/chapter%202/README.md)**
   - การรับ Input จากผู้ใช้ด้วย `TextField`
   - การแสดง Dialog (Alert, Confirmation)
   - การ Validate Form

### 🟡 Level 2: กลาง (Intermediate)
3. **[Page Navigator](./lab/page_navigator/README.md)**
   - การเปลี่ยนหน้าด้วย `Navigator.push()` และ `Navigator.pop()`
   - การส่งข้อมูลระหว่างหน้า (Passing Data)
   - การใช้ Named Routes

4. **[State Management with Provider](./lab/state_management/README.md)**
   - Workshop: Fruit Shop App
   - การใช้ `ChangeNotifier` เพื่อจัดการ Shopping Cart
   - การแชร์ State ระหว่างหลายหน้า

### 🟠 Level 3: ขั้นสูง (Advanced)
5. **[Menu Workshop](./lab/menu/README.md)**
   - การสร้างเมนูอาหารแบบมีรูปภาพ
   - การใช้ `ListView` แบบ Dynamic
   - การเชื่อมต่อข้อมูลจาก Model

---

## 📝 งานที่มอบหมาย (Assignments & Quiz)

### 💼 Assignments
1. **[Assignment 1: Dart Logic & Math](./assignment/assignment%201/README.md)**
   - ฝึกพื้นฐานภาษา Dart
   - การคำนวณทางคณิตศาสตร์
   - Control Flow (if-else, loops)

2. **[Assignment 2: Advanced Dart](./assignment/assignment%202/README.md)**
   - การจัดการ List และ Collections
   - Functions และ Arrow Functions
   - String Manipulation

### ✅ Quizzes
3. **[Quiz: General Knowledge](./assignment/quiz/README.md)**
   - แบบทดสอบความรู้หลังเรียนจบ
   - ครอบคลุมทุกเนื้อหาที่เรียน

4. **[Quiz: Currency Exchange App](./assignment/quiz_exchange_currency/README.md)**
   - แอปแปลงสกุลเงิน THB → USD, CNY, JPY, KRW
   - ฝึกการใช้ `RadioButton`, `TextField`, และ `AlertDialog`
   - ฝึก State Management แบบ StatefulWidget

---

## 🏆 Mini Project: Stock Portfolio App

โปรเจกต์ภาคเรียน (Final Project) ที่รวมความรู้ทั้งหมดมาใช้:

### 📁 [Stock Portfolio Management App](./mini-project/stock_portfolio_mini_project/)

แอปพลิเคชันสำหรับบริหารจัดการพอร์ตหุ้น (Stock Portfolio) ที่ประกอบด้วย:

**Features:**
- 📊 แสดงรายการหุ้นที่ถือ (Portfolio List)
- ➕ เพิ่ม/ลบหุ้นในพอร์ต
- 💰 คำนวณกำไร/ขาดทุน (P&L)
- 📈 แสดงกราฟแนวโน้มราคา (Chart)
- 🔔 แจ้งเตือนเมื่อราคาหุ้นเปลี่ยน

**Tech Stack:**
- Flutter SDK
- Provider (State Management)
- HTTP Package (API Call)
- Charts Package (Visualization)
- Shared Preferences (Local Storage)

---

## 🛠️ เครื่องมือที่ใช้

### ✅ Required
- **[Flutter SDK](https://flutter.dev/docs/get-started/install)** - Framework หลัก
- **[Dart SDK](https://dart.dev/get-dart)** - มาพร้อมกับ Flutter
- **IDE:**
  - [Visual Studio Code](https://code.visualstudio.com/) + Flutter Extension (แนะนำ)
  - หรือ [Android Studio](https://developer.android.com/studio)

### 📦 Dependencies (ใช้ใน Project)
```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.0          # State Management
  http: ^0.13.0             # API Calls
  shared_preferences: ^2.0.0 # Local Storage
  fl_chart: ^0.55.0         # Charts & Graphs
```

---

## 🚀 วิธีการรัน (How to Run)

### 📋 Prerequisites (ติดตั้งก่อนใช้งาน)
1. ติดตั้ง Flutter SDK และตั้งค่า Environment PATH
2. รันคำสั่ง `flutter doctor` เพื่อตรวจสอบว่าติดตั้งครบถ้วน
3. ติดตั้ง Android SDK (สำหรับรันบน Android Emulator)
   - หรือ Xcode (สำหรับรันบน iOS Simulator - Mac เท่านั้น)

### ▶️ รันโปรเจกต์
1. เปิด Terminal/Command Prompt ที่โฟลเดอร์โปรเจกต์
2. ติดตั้ง Dependencies:
   ```bash
   flutter pub get
   ```
3. เชื่อมต่อ Emulator หรือ Device จริง
4. รันแอป:
   ```bash
   flutter run
   ```

### 🔧 Troubleshooting
- **หา SDK ไม่เจอ:** ตั้งค่า `FLUTTER_HOME` และ `ANDROID_HOME` ใน Environment Variables
- **Build ไม่ผ่าน:** ลองรัน `flutter clean` แล้ว `flutter pub get` ใหม่
- **Hot Reload ไม่ทำงาน:** กด `r` ใน Terminal เพื่อ Manual Reload

---

## 📖 แนะนำสำหรับรุ่นน้อง

### 🎓 เริ่มต้นอย่างไร?
1. **เรียนตามลำดับ**: เริ่มจาก `lab/basic` ไปจนถึง `lab/menu` ตามลำดับ
2. **ทำ Assignment ทุกอัน**: จะช่วยให้เข้าใจภาษา Dart มากขึ้น
3. **อ่าน README ทุกโฟลเดอร์**: มีคำอธิบายและตัวอย่างโค้ดที่เป็นประโยชน์
4. **ลองรันและแก้โค้ด**: การทดลองเองคือการเรียนรู้ที่ดีที่สุด

### 💡 Tips & Best Practices
- **Hot Reload คือเพื่อน**: แก้โค้ดแล้วเห็นผลทันที ไม่ต้องรีสตาร์ทแอป
- **ใช้ `const` ให้มาก**: ช่วย Performance และป้องกัน Bug
- **แยก Widget ออกเป็นไฟล์**: อย่าเขียนโค้ดยาวๆ ในไฟล์เดียว
- **ศึกษา Material Design**: ทำให้ UI สวยและมาตรฐาน
- **อ่าน Error Message**: Flutter บอกข้อผิดพลาดชัดเจนมาก อ่านแล้วแก้ได้

### 📚 แหล่งเรียนรู้เพิ่มเติม
- [Flutter Documentation](https://docs.flutter.dev/) - เอกสารทางการ (ดีที่สุด)
- [Flutter Cookbook](https://docs.flutter.dev/cookbook) - ตัวอย่างโค้ดสำเร็จรูป
- [Dart Language Tour](https://dart.dev/guides/language/language-tour) - เรียนรู้ภาษา Dart
- [Flutter Community](https://flutter.dev/community) - ชุมชนและฟอรัม

---

## 📄 License
โค้ดในโปรเจกต์นี้เป็นส่วนหนึ่งของการเรียนการสอนในรายวิชา COM 4304 Mobile Application Development

---

<div align="center">

**Happy Coding! 🚀📱**

*"The best way to learn Flutter is to build something."*

</div>
