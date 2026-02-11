-- ====================================
-- ไฟล์: database/setup.sql
-- วัตถุประสงค์: สร้างฐานข้อมูลและตารางสำหรับระบบ Login
-- ====================================

-- 1. สร้างฐานข้อมูล
CREATE DATABASE IF NOT EXISTS mini_project_db
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

-- เลือกใช้ฐานข้อมูล
USE mini_project_db;

-- 2. สร้างตาราง users
CREATE TABLE IF NOT EXISTS users (
    id INT(11) NOT NULL AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(32) NOT NULL COMMENT 'MD5 hashed password',
    full_name VARCHAR(100) NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    INDEX idx_username (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 3. เพิ่มข้อมูลผู้ใช้ตัวอย่าง
-- username: admin, password: admin123 (MD5: 0192023a7bbd73250516f069df18b500)
INSERT INTO users (username, password, full_name) VALUES
('66143420', MD5('66143420'), 'ณัฐพงษ์ ปันธิยะ');
-- username: 66143420, password: 66143420

-- 4. ตรวจสอบข้อมูล
SELECT * FROM users;
