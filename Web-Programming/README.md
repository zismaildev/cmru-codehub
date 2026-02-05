# COM 2305 Web Programming

<div align="center">

![Type](https://img.shields.io/badge/Type-Full_Stack-blue?style=for-the-badge)
![Tech](https://img

.shields.io/badge/Stack-PHP_MySQL-777BB4?style=for-the-badge)

**"From Static Designs to Dynamic Data-Driven Applications"**

</div>

---

## 🎯 เกี่ยวกับรายวิชา

รายวิชานี้สอนการ**สร้างเว็บแอปพลิเคชันแบบครบวงจร (Full Stack)** ตั้งแต่ฝั่ง **Frontend** (ส่วนที่ผู้ใช้เห็น) ไปจนถึง **Backend** (ส่วนจัดการข้อมูล) และ **Database** (จัดเก็บข้อมูล)

ใช้ **PHP + MySQL** เพราะ:
- **PHP**: ภาษา Server-side ที่ทำงานบน Web Server
- **MySQL**: Database ที่ได้รับความนิยมสูงสุดสำหรับเว็บ
- **Easy to Learn**: Syntax ง่าย เริ่มต้นได้ไว
- **Wide Hosting Support**: รองรับทุก Web Hosting

### Web Development Journey
```
Static HTML → Add CSS (Design) → Add JavaScript (Interactive)
→ Add PHP (Backend Logic) → Add MySQL (Data Persistence)
```

### เนื้อหาหลักที่เรียน
1. **HTML & CSS** - โครงสร้างและการออกแบบหน้าเว็บ
2. **JavaScript (Client-side)** - ทำให้เว็บมี Interaction
3. **PHP (Server-side)** - ประมวลผลข้อมูลฝั่ง Server
4. **MySQL** - จัดการฐานข้อมูล (CRUD)
5. **HTTP & Sessions** - การสื่อสารและจัดการ User State
6. **Security** - SQL Injection, XSS Prevention

---

## 🔑 สิ่งที่เรียนรู้ (Key Learnings)

### 1. Frontend Development (Client-side)

#### HTML - โครงสร้างหน้าเว็บ
- **Semantic HTML**: `<header>`, `<nav>`, `<article>`, `<footer>`
- **Forms**: การรับข้อมูลผู้ใช้ (`<form>`, `<input>`, `<select>`)
- **Tables**: แสดงข้อมูลแบบตาราง

#### CSS - การออกแบบ
- **Selectors**: Class, ID, Element
- **Box Model**: Margin, Padding, Border
- **Layout**: Flexbox, Grid
- **Responsive Design**: Media Queries สำหรับ Mobile/Tablet

#### JavaScript - Interaction
- **DOM Manipulation**: แก้ไข HTML ด้วย JavaScript
- **Events**: onClick, onChange, onSubmit
- **AJAX**: โหลดข้อมูลโดยไม่ reload หน้า

### 2. Backend Development (Server-side)

#### PHP Fundamentals
- **Variables**: `$name = "John";`
- **Superglobals**: `$_GET`, `$_POST`, `$_SESSION`, `$_COOKIE`
- **Functions**: สร้างฟังก์ชันเอง
- **Include/Require**: แยกโค้ดเป็นไฟล์ย่อย

#### PHP & Forms
```php
// รับข้อมูลจาก Form
$username = $_POST['username'];
$password = $_POST['password'];

// Process...
if ($username == "admin" && $password == "1234") {
    $_SESSION['logged_in'] = true;
}
```

### 3. Database Management (MySQL)

#### SQL Basics
- **CREATE**: สร้างตาราง
- **INSERT**: เพิ่มข้อมูล
- **SELECT**: ดึงข้อมูล (+ WHERE, ORDER BY, LIMIT)
- **UPDATE**: แก้ไขข้อมูล
- **DELETE**: ลบข้อมูล

#### PHP + MySQL Connection
```php
// เชื่อมต่อฐานข้อมูล
$conn = mysqli_connect("localhost", "root", "", "mydb");

// Query
$sql = "SELECT * FROM users WHERE id = 1";
$result = mysqli_query($conn, $sql);

// Fetch
$row = mysqli_fetch_assoc($result);
echo $row['name'];
```

### 4. Web Architecture

#### Client-Server Model
```
[Browser] --HTTP Request--> [Web Server + PHP] --SQL--> [MySQL]
          <--HTTP Response-- [PHP Process Data]  <--Data--
```

#### MVC Pattern Basics
- **Model**: จัดการข้อมูล (Database)
- **View**: แสดงผล (HTML/CSS)
- **Controller**: ควบคุมตรรกะ (PHP)

### 5. Security Concepts

#### SQL Injection Prevention
```php
// ❌ อันตราย
$sql = "SELECT * FROM users WHERE name = '$name'";

// ✅ ปลอดภัย (Prepared Statement)
$stmt = $conn->prepare("SELECT * FROM users WHERE name = ?");
$stmt->bind_param("s", $name);
```

#### XSS Prevention
```php
// ป้องกัน Script Injection
echo htmlspecialchars($user_input);
```

#### Password Hashing
```php
// เข้ารหัสรหัสผ่าน
$hashed = password_hash($password, PASSWORD_DEFAULT);

// ตรวจสอบ
if (password_verify($input, $hashed)) {
    // Login Success
}
```

---

## 📂 โครงสร้างภายใน (Repository Structure)

```
Web-Programming/
├── README.md                ← ไฟล์นี้
├── lab/                     ← Lab ฝึกหัด
│   ├── static-web/          → HTML/CSS/JS Static Pages
│   ├── legacy-php/          → PHP Basics & Forms
│   └── database-connection/ → PHP + MySQL Integration
└── mini-project/            ← โปรเจกต์ใหญ่
    └── ecommerce-system/    → ระบบ E-Commerce (Final Project)
```

---

## 📚 Lab Modules

### 🟢 Level 1: Static Web (Frontend)

#### [static-web/](./lab/static-web/)
**HTML/CSS/JavaScript - หน้าเว็บแบบ Static**
- ฝึกเขียน HTML Tags และ Semantic HTML
- ออกแบบหน้าเว็บด้วย CSS (Flexbox, Grid)
- เพิ่ม Interaction ด้วย JavaScript
- สร้างหน้า Portfolio/Landing Page
- Responsive Design สำหรับ Mobile

### 🟡 Level 2: Dynamic PHP

#### [legacy-php/](./lab/legacy-php/)
**PHP Programming Fundamentals**
- ฝึกพื้นฐาน PHP (Variables, Loops, Functions)
- Form Handling ($_GET, $_POST)
- Session & Cookie Management  
- File Upload และการจัดการไฟล์
- include/require สำหรับ Code Organization

### 🟠 Level 3: Database Integration

#### [database-connection/](./lab/database-connection/)
**PHP + MySQL Integration**
- เชื่อมต่อ PHP กับ MySQL (mysqli, PDO)
- CRUD Operations (Create, Read, Update, Delete)
- Login System พื้นฐาน
- User Management และ Authentication
- Prepared Statements (ป้องกัน SQL Injection)

---

## 🏆 Mini Project

### [E-Commerce System](./mini-project/ecommerce-system/)

**ระบบร้านค้าออนไลน์แบบครบวงจร** - Full Stack Web Application

ประกอบด้วย:

**Features:**
- 🛍️ **Product Catalog**: แสดงสินค้าทั้งหมด พร้อมรูปภาพ
- 🔍 **Search & Filter**: ค้นหาและกรองสินค้าตามหมวดหมู่
- 🛒 **Shopping Cart**: ตะกร้าสินค้า (Session-based)
- 👤 **User Authentication**: สมัครสมาชิก/เข้าสู่ระบบ
- 📦 **Order Management**: จัดการคำสั่งซื้อ
- 🔐 **Admin Panel**: ส่วนจัดการสำหรับผู้ดูแล

**Tech Stack:**
- Frontend: HTML5, CSS3, JavaScript
- Backend: PHP
- Database: MySQL
- Session Management
- Security: Password Hashing, SQL Injection Prevention

---

## 🛠️ เครื่องมือที่ใช้

### ✅ Required
- **Web Server**: [XAMPP](https://www.apachefriends.org/) หรือ [MAMP](https://www.mamp.info/)
  - มี Apache (Web Server), MySQL, PHP พร้อมใช้งาน
- **Browser**: Chrome/Firefox (มี DevTools)
- **IDE/Editor**:
  - [VS Code](https://code.visualstudio.com/) + PHP Intelephense Extension
  - หรือ [PhpStorm](https://www.jetbrains.com/phpstorm/)

### 📦 Optional Tools
- **phpMyAdmin**: จัดการ Database แบบ GUI (มากับ XAMPP)
- **Postman**: ทดสอบ API
- **Git**: Version Control

---

## 🚀 วิธีการรัน (How to Run)

### 📋 Prerequisites
1. ติดตั้ง XAMPP:
   - Download จาก [apachefriends.org](https://www.apachefriends.org/)
   - เปิด XAMPP Control Panel
   - Start **Apache** และ **MySQL**

2. ตรวจสอบว่าทำงาน:
   - เปิด Browser ไปที่ `http://localhost`
   - ควรเห็นหน้า XAMPP Dashboard

### ▶️ รันโปรเจกต์

1. **Copy ไฟล์ไปยัง htdocs:**
   ```
   C:\xampp\htdocs\my-project\
   ```

2. **สร้างฐานข้อมูล:**
   - เปิด phpMyAdmin: `http://localhost/phpmyadmin`
   - สร้าง Database ใหม่
   - Import ไฟล์ `.sql` (ถ้ามี)

3. **เปิดเว็บ:**
   - Browser: `http://localhost/my-project/`

### 🔧 Troubleshooting
- **Apache ไม่ Start**: Port 80 ถูกใช้แล้ว (ปิด Skype หรือเปลี่ยน Port)
- **MySQL ไม่ Start**: Port 3306 ถูกใช้ (ปิดโปรแกรมที่ใช้ Port นี้)
- **404 Not Found**: เช็ค Path ใน htdocs ให้ถูกต้อง
- **Database Connection Failed**: เช็ค Username/Password ใน `mysqli_connect()`

---

## 📖 แนะนำสำหรับรุ่นน้อง

### 🎓 เริ่มต้นอย่างไร?
1. **เริ่มจาด HTML/CSS**: ทำความเข้าใจโครงสร้างก่อน
2. **เรียนรู้ JavaScript พื้นฐาน**: จะช่วยทำ Dynamic UI
3. **ฝึก PHP + MySQL**: เริ่มจาก CRUD ง่ายๆ
4. **ทำโปรเจกต์จริง**: เรียนรู้จากการลงมือทำ

### 💡 Tips & Best Practices
- **แยกโครงสร้างให้ชัดเจน**: HTML, CSS, JS, PHP แยกกัน
- **ใช้ Prepared Statements**: ป้องกัน SQL Injection
- **Validate Input**: ทั้งฝั่ง Client และ Server
- **ใช้ Session อย่างปลอดภัย**: `session_regenerate_id()` หลัง Login
- **Test บน Browser หลายตัว**: Chrome, Firefox, Safari

### 📚 แหล่งเรียนรู้เพิ่มเติม
- [W3Schools PHP](https://www.w3schools.com/php/) - Tutorial + Examples
- [PHP.net](https://www.php.net/manual/en/) - เอกสารทางการ
- [MDN Web Docs](https://developer.mozilla.org/) - HTML/CSS/JS
- [MySQL Tutorial](https://www.mysqltutorial.org/) - เรียน SQL ละเอียด

### ⚠️ ข้อผิดพลาดที่พบบ่อย
- ❌ ลืมเปิด XAMPP (Apache/MySQL)
- ❌ วางไฟล์นอก `htdocs/`
- ❌ เขียน SQL ผิด Syntax
- ❌ ไม่ได้เช็ค `mysqli_connect()` Error
- ❌ ใช้ `mysql_*` แทน `mysqli_*` (เลิกใช้แล้ว!)

---

## 📄 License
โค้ดในโปรเจกต์นี้เป็นส่วนหนึ่งของการเรียนการสอนในรายวิชา COM 2305 Web Programming

---

<div align="center">

**Happy Coding! 🌐💻**

*"The Web is the platform. Build something amazing!"*

</div>
