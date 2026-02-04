# 🎓 University Management System (Final Project)

<div align="center">

![Tech](https://img.shields.io/badge/Stack-PHP_+_MySQL-777BB4?style=for-the-badge)
![Role](https://img.shields.io/badge/Role-Full_Stack_Developer-green?style=for-the-badge)

**"Complete CRUD System for Teacher & Student Records"**

</div>

---

## 🎯 Project Overview
ระบบสารสนเทศมหาวิทยาลัยที่ครอบคลุมการจัดการข้อมูลหลัก 3 ส่วน: **คณะ (Faculty)**, **อาจารย์ (Teacher)**, และ **นักศึกษา (Student)** โดยมีการแบ่งสิทธิ์การเข้าถึง (Admin/User)

## 🏗️ System Architecture

```mermaid
graph TD
    User([User]) --> Auth{Login System}
    Auth -- Success --> Dashboard
    Dashboard --> Fac[Faculty Management]
    Dashboard --> Teach[Teacher Management]
    Dashboard --> Stu[Student Management]
    
    Fac --> CRUD_F[Add/Edit/Del Faculty]
    Teach --> CRUD_T[Add/Edit/Del Teacher]
    Stu --> CRUD_S[Add/Edit/Del Student]
    
    CRUD_F --> DB[(MySQL Database)]
    CRUD_T --> DB
    CRUD_S --> DB
```

## 🗂️ Key Features
- **Search System**: ระบบค้นหาอัจฉริยะที่กรองข้อมูลได้หลายเงื่อนไข
- **Reporting**: หน้าสรุปรายงานข้อมูล (Report Pages)
- **Security**: การเข้ารหัสรหัสผ่านและการตรวจสอบ Session

## 💻 Tech Implementation
- **Relational Database**: การเชื่อมตารางด้วย Foreign Key (Fac_ID)
- **Bootstrap 5**: ใช้ Framework เพื่อความสวยงามและ Responsive

```php
// SQL Join Example
$sql = "SELECT student.*, faculty.fac_name 
        FROM student 
        INNER JOIN faculty ON student.fac_id = faculty.fac_id";
```
