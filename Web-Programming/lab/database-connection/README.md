# 🏫 University DB System (Dev Phase)

<div align="center">

![Phase](https://img.shields.io/badge/Phase-Development-yellow?style=for-the-badge)
![Stack](https://img.shields.io/badge/Lang-PHP-777BB4?style=for-the-badge)

**"Backend Logic Implementation for Faculty & Students"**

</div>

---

## 🎯 Objective
เวอร์ชันพัฒนาระหว่างทาง (Development Build) ของระบบจัดการมหาวิทยาลัย เน้นการทดสอบฟังก์ชัน CRUD (Create, Read, Update, Delete) ของตาราง `student` และ `faculty` ก่อนนำไปประกอบร่างเป็น Final Project

## 🏗️ ER Diagram (Simplified)

```mermaid
erDiagram
    FACULTY ||--|{ STUDENT : has
    FACULTY {
        int fac_id PK
        string fac_name
    }
    STUDENT {
        int std_id PK
        string std_name
        int fac_id FK
    }
```

## 💻 Key Scripts
- `connectDB.php`: Setup Database Connection
- `addpen_student.php`: Form สำหรับเพิ่มนักศึกษาใหม่
- `search_student.php`: ระบบค้นหาข้อมูล
