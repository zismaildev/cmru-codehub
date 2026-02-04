# 🔐 Authentication System Fundamentals

<div align="center">

![Language](https://img.shields.io/badge/Language-PHP-777BB4?style=for-the-badge)
![Security](https://img.shields.io/badge/Concept-Session_Management-red?style=for-the-badge)

**"Stateful User Experience on Stateless HTTP"**

</div>

---

## 🎯 Problem Statement
การสร้างระบบสมาชิกต้องอาศัยกลไกการจดจำผู้ใช้งาน (State Persistence) ข้ามหน้าเว็บ โจทย์คือกาสร้างระบบ Login/Logout ที่ปลอดภัยและตรวจสอบสิทธิ์ได้ถูกต้อง

## 🏗️ Authentication Lifecycle

```mermaid
stateDiagram-v2
    [*] --> Guest
    Guest --> Login : Submit Credentials
    Login --> Auth{Verify?}
    Auth -- Yes --> User : Start Session
    Auth -- No --> Guest : Show Error
    User --> ProtectedPage : Access Allowed
    User --> Logout : Click Logout
    Logout --> Guest : Destroy Session
```

## 💻 Code Implementation
- **Login Check**: ตรวจสอบ Username/Password จาก Input
- **Session Control**:
  ```php
  session_start();
  // Set Session Variable
  $_SESSION['user_id'] = $user_data['id'];
  // Check Session
  if (!isset($_SESSION['user_id'])) header("Location: login.php");
  ```

## 💡 Key Learnings
- **Session ID**: PHP สร้าง ID ไม่ซ้ำกันแปะไปกับ Cookie `PHPSESSID`
- **Security Best Practice**: ไม่ควรเก็บ Password จริงใน Session
