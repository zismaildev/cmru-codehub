# COM 1602 Database System 1

<div align="center">

![Type](https://img.shields.io/badge/Focus-Data_Management-blue?style=for-the-badge)
![Tech](https://img.shields.io/badge/Stack-SQL_%7C_MySQL-4479A1?style=for-the-badge)

**"Data is the new oil. SQL is the refinery."**

</div>

---

## 🎯 เกี่ยวกับรายวิชา

รายวิชานี้สอน**การจัดการข้อมูลอย่างเป็นระบบ** ผ่าน **ฐานข้อมูลเชิงสัมพันธ์ (Relational Database)** และภาษา **SQL** ซึ่งเป็นพื้นฐานสำคัญของทุกระบบงานในยุคดิจิทัล

### ทำไมต้องเรียนฐานข้อมูล?
แอปพลิเคชันทุกตัวต้อง**จัดเก็บข้อมูล**:
- Facebook: โพสต์, เพื่อน, รูปภาพหมื่นล้านรายการ
- ธนาคาร: บัญชี, ธุรกรรม, ยอดเงิน
- E-Commerce: สินค้า, คำสั่งซื้อ, ลูกค้า

**ถ้าไม่มีฐานข้อมูล:**
- ❌ ข้อมูลสูญหาย (File หาย)
- ❌ ข้อมูลซ้ำซ้อน (Copy ไฟล์หลายที่)
- ❌ ข้อมูลไม่สอดคล้อง (แก้ที่หนึ่ง อีกที่ไม่เปลี่ยน)

**ใช้ฐานข้อมูล:**
- ✅ ข้อมูลปลอดภัย (Backup, Recovery)
- ✅ ข้อมูลไม่ซ้ำ (Normalization)
- ✅ ค้นหาเร็ว (Indexing)
- ✅ หลายคนใช้พร้อมกันได้ (Concurrency)

### เนื้อหาหลักที่เรียน
1. **Database Concepts** - ER Diagram, Normalization
2. **SQL Basics** - SELECT, INSERT, UPDATE, DELETE
3. **Table Design** - Primary Key, Foreign Key
4. **Relationships** - One-to-Many, Many-to-Many
5. **Joins** - INNER JOIN, LEFT JOIN
6. **Advanced SQL** - Subqueries, Aggregations, Views

---

## 🔑 สิ่งที่เรียนรู้ (Key Learnings)

### 1. Database Design Fundamentals

#### ER Diagram (Entity-Relationship)
แผนภาพแสดงความสัมพันธ์ระหว่างตาราง

**ตัวอย่าง:** ระบบห้องสมุด
```
[Book] ----< [Borrow] >---- [Member]
   |                            |
ISBN, Title              MemberID, Name
```

#### Normalization (ลดความซ้ำซ้อน)
- **1NF**: ไม่มีข้อมูลซ้อนกันในช่องเดียว
- **2NF**: แยกข้อมูลที่ไม่ขึ้นกับ Primary Key ออก
- **3NF**: แยกข้อมูลที่ขึ้นกับฟิลด์อื่นที่ไม่ใช่ Key

#### Primary Key & Foreign Key
```sql
-- Primary Key: unique identifier
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);

-- Foreign Key: reference ไปตารางอื่น
CREATE TABLE enrollments (
    id INT PRIMARY KEY,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);
```

### 2. SQL - Structured Query Language

#### Data Definition Language (DDL)
สร้างและแก้ไขโครงสร้าง

```sql
-- สร้างตาราง
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    price DECIMAL(10,2),
    stock INT
);

-- แก้ไขตาราง
ALTER TABLE products ADD COLUMN category VARCHAR(50);

-- ลบตาราง
DROP TABLE products;
```

#### Data Manipulation Language (DML)
จัดการข้อมูล (CRUD)

```sql
-- INSERT (Create)
INSERT INTO products (name, price, stock) 
VALUES ('Laptop', 25000, 10);

-- SELECT (Read)
SELECT * FROM products WHERE price > 10000;

-- UPDATE
UPDATE products SET price = 24000 WHERE id = 1;

-- DELETE
DELETE FROM products WHERE stock = 0;
```

### 3. WHERE Clause - การกรองข้อมูล

```sql
-- เงื่อนไขเดียว
SELECT * FROM products WHERE price > 10000;

-- หลายเงื่อนไข (AND)
SELECT * FROM products WHERE price > 5000 AND stock > 0;

-- OR
SELECT * FROM products WHERE category = 'Electronics' OR category = 'Computers';

-- LIKE (ค้นหาแบบคล้ายๆ)
SELECT * FROM products WHERE name LIKE '%Laptop%';

-- IN
SELECT * FROM products WHERE category IN ('Electronics', 'Computers');

-- BETWEEN
SELECT * FROM products WHERE price BETWEEN 10000 AND 50000;
```

### 4. Joins - เชื่อมตาราง

#### INNER JOIN (แสดงเฉพาะข้อมูลที่มีทั้ง 2 ตาราง)
```sql
SELECT orders.id, customers.name, orders.total
FROM orders
INNER JOIN customers ON orders.customer_id = customers.id;
```

#### LEFT JOIN (แสดงข้อมูลฝั่งซ้ายทั้งหมด)
```sql
SELECT customers.name, orders.total
FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id;
-- ลูกค้าที่ไม่เคยสั่งจะแสดง total เป็น NULL
```

### 5. Aggregate Functions - คำนวณสรุป

```sql
-- นับจำนวน
SELECT COUNT(*) FROM products;

-- หาผลรวม
SELECT SUM(price) FROM products;

-- หาค่าเฉลี่ย
SELECT AVG(price) FROM products;

-- หาค่าสูงสุด/ต่ำสุด
SELECT MAX(price), MIN(price) FROM products;

-- จัดกลุ่ม (GROUP BY)
SELECT category, COUNT(*), AVG(price)
FROM products
GROUP BY category;

-- กรองกลุ่ม (HAVING)
SELECT category, COUNT(*) as count
FROM products
GROUP BY category
HAVING count > 5;
```

### 6. Advanced Concepts

#### Subquery (Query ซ้อน Query)
```sql
SELECT name FROM products
WHERE price > (SELECT AVG(price) FROM products);
```

#### View (Table เสมือน)
```sql
CREATE VIEW expensive_products AS
SELECT * FROM products WHERE price > 20000;

SELECT * FROM expensive_products;
```

---

## 📂 โครงสร้างภายใน (Repository Structure)

```
Database-System-1/
├── README.md                ← ไฟล์นี้
└── lab/                     ← Lab SQL Scripts
    ├── [Lab 1-12]           → SQL Queries, Database Design
    └── [Schema Files]       → .sql files
```

---

## 📚 Lab Topics

### 🟢 Weeks 1-4: Database Design
- **Lab 1**: Introduction to Databases
- **Lab 2**: ER Diagram Design
- **Lab 3**: Normalization (1NF, 2NF, 3NF)
- **Lab 4**: CREATE TABLE, Data Types

### 🟡 Weeks 5-8: SQL Basics
- **Lab 5**: SELECT, WHERE, ORDER BY
- **Lab 6**: INSERT, UPDATE, DELETE
- **Lab 7**: Joins (INNER, LEFT, RIGHT)
- **Lab 8**: Aggregate Functions

### 🟠 Weeks 9-12: Advanced SQL
- **Lab 9**: Subqueries
- **Lab 10**: Views & Indexes
- **Lab 11**: Transactions
- **Lab 12**: Final Project - Complete Database Design

---

## 🛠️ เครื่องมือที่ใช้

### ✅ Required
- **[MySQL](https://dev.mysql.com/downloads/)** - Database Server
- **[MySQL Workbench](https://dev.mysql.com/downloads/workbench/)** - GUI Tool
  - หรือใช้ **phpMyAdmin** (มากับ XAMPP)

### 📦 Alternative Tools
- **PostgreSQL**: ฐานข้อมูลทางเลือก
- **DB Browser for SQLite**: สำหรับ SQLite
- **DBeaver**: Universal Database Tool

---

## 🚀 วิธีการรัน (How to Run)

### 📋 Prerequisites
1. ติดตั้ง MySQL:
   - Download จาก [mysql.com](https://dev.mysql.com/downloads/)
   - หรือติดตั้ง XAMPP (มี MySQL มาด้วย)

2. เปิด MySQL Server:
   - XAMPP: Start MySQL
   - Standalone: `mysql.server start`

### ▶️ รัน SQL Script

**วิธีที่ 1: MySQL Command Line**
```bash
mysql -u root -p
> CREATE DATABASE mydb;
> USE mydb;
> SOURCE schema.sql;
```

**วิธีที่ 2: MySQL Workbench**
1. เปิด MySQL Workbench
2. Connect to Server
3. File → Open SQL Script
4. Execute (⚡)

**วิธีที่ 3: phpMyAdmin**
1. เปิด `http://localhost/phpmyadmin`
2. สร้าง Database ใหม่
3. Import ไฟล์ .sql

---

## 📖 แนะนำสำหรับรุ่นน้อง

### 🎓 เริ่มต้นอย่างไร?
1. **เข้าใจ Concept ก่อน**: ER Diagram, Normalization สำคัญมาก
2. **ฝึก SQL ทุกวัน**: SQL ต้องพิมพ์เอง จะจำได้
3. **วาด ER Diagram**: จะทำให้เห็นภาพชัดเจน
4. **ทำโปรเจกต์จริง**: ออกแบบ Database ของระบบที่สนใจ

### 💡 Tips & Best Practices
- **ตั้งชื่อตารางเป็นพหูพจน์**: `users` ไม่ใช่ `user`
- **ใช้ Primary Key เสมอ**: ทุกตารางต้องมี
- **Foreign Key บังคับ Relationship**: ป้องกันข้อมูลผิดพลาด
- **Backup ข้อมูลบ่อยๆ**: `mysqldump` หรือ Export
- **ใช้ Transaction**: สำหรับงานที่ต้องทำหลายขั้นตอน

### 📚 แหล่งเรียนรู้เพิ่มเติม
- [W3Schools SQL](https://www.w3schools.com/sql/) - Tutorial + Try it
- [MySQL Documentation](https://dev.mysql.com/doc/)
- [SQLZoo](https://sqlzoo.net/) - Interactive SQL Tutorial
- [DB-Fiddle](https://www.db-fiddle.com/) - Online SQL Playground

### ⚠️ ข้อผิดพลาดที่พบบ่อย
- ❌ ลืม WHERE ใน UPDATE/DELETE (แก้/ลบทั้งตาราง!)
- ❌ ใช้ SELECT * (ช้า, ควรระบุฟิลด์)
- ❌ ไม่ได้ normalize (ข้อมูลซ้ำซ้อน)
- ❌ ลืม ; ท้าย SQL Statement
- ❌ Case-sensitive ใน Linux (ตารางต้องเป็นตัวเล็ก)

---

## 📄 License
โค้ดในโปรเจกต์นี้เป็นส่วนหนึ่งของการเรียนการสอนในรายวิชา COM 1602 Database System 1

---

<div align="center">

**Happy Querying! 🗄️💾**

*"In SQL we trust, all others bring data."*

</div>
