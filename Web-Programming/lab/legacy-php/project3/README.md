# 📋 Membership Registration System

<div align="center">

![Language](https://img.shields.io/badge/Language-PHP_Native-777BB4?style=for-the-badge)
![Type](https://img.shields.io/badge/Type-Form_Validation-green?style=for-the-badge)

**"Secure User Input & Data Verification"**

</div>

---

## 🎯 Problem Statement
การรับข้อมูลผู้ใช้ (Registration) เป็นจุดเริ่มต้นของระบบสมาชิก ความท้าทายคือการตรวจสอบความถูกต้องของข้อมูล (Validation) เช่น รหัสผ่านต้องตรงกัน (Confirm Password) และอีเมลถูกต้อง

## 🏗️ Data Processing Flow

```mermaid
graph TD
    Start([User Input]) --> Form[HTML Registration Form]
    Form --> Submit[POST Request]
    Submit --> Validate{Validation Check}
    Validate -- Pass!=Confirm --> Error[Show Error Message]
    Validate -- Empty Fields --> Error
    Validate -- OK --> Connect[Connect to DB]
    Connect --> Insert[INSERT INTO Users]
    Insert --> Success[/Registration Successful/]
```

## 💻 Code Highlights
```php
// Password Matching Validation
if ($_POST['password'] !== $_POST['confirm_password']) {
    die("Error: Passwords do not match!");
}

// SQL Injection Prevention (Basic)
$username = mysqli_real_escape_string($conn, $_POST['username']);
```

## 💡 Key Learnings
- **Form Validation**: ความสำคัญของการตรวจสอบข้อมูลฝั่ง Server (Server-side Validation)
- **UX**: การแจ้งเตือนผู้ใช้เมื่อกรอกข้อมูลผิดพลาด
