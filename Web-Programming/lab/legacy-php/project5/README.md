# 🔐 Login & Session Management

<div align="center">

![Language](https://img.shields.io/badge/Language-PHP-777BB4?style=for-the-badge)
![Security](https://img.shields.io/badge/Topic-Authentication-red?style=for-the-badge)

**"State Management with Sessions & Cookies"**

</div>

---

## 🎯 Problem Statement
HTTP เป็น Stateless Protocol (จำสถานะไม่ได้) ระบบ Login จึงต้องใช้ **Sessions** เพื่อจดจำว่า "ใครใช้งานอยู่" เมื่อเปลี่ยนหน้าเพจ

## 🏗️ Auth State Diagram

```mermaid
stateDiagram-v2
    [*] --> LoginPage
    LoginPage --> Authenticating : Submit Creds
    Authenticating --> Dashboard : Success (Set Session)
    Authenticating --> LoginPage : Fail (Error Msg)
    Dashboard --> Logout : Click Logout
    Logout --> [*] : Destroy Session
```

## 💻 Code Structure
- **session_start()**: ต้องประกาศบรรทัดแรกสุดของทุกหน้าที่ต้องการเช็ค Login
- **$_SESSION**: ตัวแปร Global สำหรับเก็บ User ID/Status

```php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: login.php"); // Redirect if not logged in
    exit();
}
```

## 💡 Key Learnings
- **Session Hijacking**: ความสำคัญของการ `session_regenerate_id()` เมื่อ Login สำเร็จ
- **Logout Logic**: การใช้ `session_destroy()` เพื่อล้างสถานะอย่างสมบูรณ์
