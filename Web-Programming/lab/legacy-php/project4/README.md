# 🖼️ Gallery & File Upload System

<div align="center">

![Language](https://img.shields.io/badge/Language-PHP-777BB4?style=for-the-badge)
![Feature](https://img.shields.io/badge/Feature-File_Upload-orange?style=for-the-badge)

**"Managing User-Generated Content & Image Assets"**

</div>

---

## 🎯 Problem Statement
การอนุญาตให้ผู้ใช้อัปโหลดไฟล์ (File Upload) มีความซับซ้อนกว่าข้อมูลตัวอักษร ต้องจัดการเรื่อง **Permissions**, **Unique Filenames**, และ **File Types** เพื่อความปลอดภัย

## 🏗️ Upload Process

```mermaid
sequenceDiagram
    participant User
    participant Browser
    participant Server
    participant Storage

    User->>Browser: Select Image & Submit
    Browser->>Server: POST (Multipart/Form-Data)
    Server->>Server: Check File Size & Type
    alt Valid File
        Server->>Storage: move_uploaded_file()
        Storage-->>Server: File Saved
        Server->>Database: Insert File Path
        Server-->>User: Success Message
    else Invalid
        Server-->>User: Error (Wrong Format/Too Large)
    end
```

## 💻 Tech Implementation
- **enctype="multipart/form-data"**: Attribute จำเป็นสำหรับ Form อัปโหลดไฟล์
- **tmp_name**: การจัดการไฟล์ชั่วคราวก่อนย้ายไปยังโฟลเดอร์จริง

```php
$target_dir = "uploads/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file);
```

## 💡 Key Learnings
- **Security Risk**: ทำไมต้องตรวจสอบนามสกุลไฟล์ป้องกันการอัปโหลดไฟล์ `.php` (Shell Upload)
- **Directory Permissions**: การตั้งค่า Folder ให้เขียนข้อมูลได้ (Write Permission)
