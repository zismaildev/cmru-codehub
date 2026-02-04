# 🔌 MySQL Database Connection

<div align="center">

![Tech](https://img.shields.io/badge/Language-PHP_7.4+-777BB4?style=for-the-badge)
![Tech](https://img.shields.io/badge/Database-MySQLi-4479A1?style=for-the-badge)

**"Establishing Secure Connection to Relational Database"**

</div>

---

## 🎯 Problem Statement
หัวใจของ Web Application คือข้อมูล การเชื่อมต่อระหว่าง PHP (Server) และ MySQL (Database) เป็นด่านแรกที่สำคัญ จำเป็นต้องจัดการเรื่อง **Encoding (UTF-8)** และ **Error Handling** ให้ถูกต้อง

## 🏗️ Connection Flow

```mermaid
sequenceDiagram
    participant Client
    participant PHP as PHP Script
    participant MySQL as Database Server

    Client->>PHP: Request Page
    PHP->>MySQL: mysqli_connect(Host, User, Pass, DB)
    alt Connection Success
        MySQL-->>PHP: Connection Object
        PHP->>MySQL: SET NAMES 'utf8'
        MySQL-->>PHP: OK
    else Connection Failed
        MySQL-->>PHP: Error Message
        PHP-->>Client: Die("Connection Failed")
    end
```

## 💻 Implementation Highlights

```php
// Standard Connection Pattern
$conn = mysqli_connect("localhost", "root", "", "my_db");

// Check Connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Support Thai Language
mysqli_set_charset($conn, "utf8");
```

## 💡 Key Learnings
- **MySQLi Extension**: การใช้ Driver รุ่นปรับปรุง (Improved) แทน mysql เดิมที่เลิกใช้แล้ว
- **Character Set**: การตั้งค่า `utf8` เพื่อป้องกันปัญหาภาษาต่างดาว (Mojibake)
