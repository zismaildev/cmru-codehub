# Stock Portfolio Backend API

## 🚀 วิธีติดตั้งและใช้งาน

### 1. ติดตั้ง XAMPP
1. ดาวน์โหลด XAMPP: https://www.apachefriends.org/
2. ติดตั้งและเปิด **Apache** และ **MySQL**

### 2. Setup Database
1. เปิด phpMyAdmin: http://localhost/phpmyadmin
2. Import ไฟล์ `database/stock_portfolio.sql`
3. หรือ copy SQL จากไฟล์แล้ววางใน SQL tab

### 3. Config Database
แก้ไขไฟล์ `config/database.php`:
```php
define('DB_USER', 'root');  // username ของคุณ
define('DB_PASS', '');      // password ของคุณ
```

### 4. Copy Backend ไปที่ htdocs
```bash
# Copy folder backend ไปที่
C:\xampp\htdocs\stock_portfolio_api
```

### 5. ทดสอบ API
เปิดเบราว์เซอร์:
- ดูทั้งหมด: http://localhost/stock_portfolio_api/api/transactions.php
- ดูรายการเดียว: http://localhost/stock_portfolio_api/api/transactions.php?id=1

---

## 📡 API Endpoints

### GET - ดึงข้อมูล
```
GET /api/transactions.php          - ดึงทั้งหมด
GET /api/transactions.php?id=1     - ดึงรายการเดียว
```

### POST - เพิ่มข้อมูล
```
POST /api/transactions.php
Content-Type: application/json

{
  "id": "5",
  "symbol": "MSFT",
  "exchange": "NASDAQ",
  "side": "buy",
  "executedPrice": 380.50,
  "quantity": 0.1,
  "grossAmount": 38.05,
  "commission": 0.03,
  "vat": 0.0021,
  "executionDateTime": "2026-02-08 12:00:00",
  "orderType": "market",
  "portfolio": "Dime! USD",
  "orderId": "STKBMF20260208120000000001"
}
```

### PUT - แก้ไขข้อมูล
```
PUT /api/transactions.php
Content-Type: application/json

{
  "id": "5",
  "symbol": "MSFT",
  ... (ข้อมูลที่ต้องการแก้)
}
```

### DELETE - ลบข้อมูล
```
DELETE /api/transactions.php?id=5
```

---

## 📝 Response Format

### Success Response
```json
{
  "success": true,
  "data": [...]
}
```

### Error Response
```json
{
  "success": false,
  "message": "Error description"
}
```

---

## 🧪 ทดสอบด้วย Postman

1. ติดตั้ง Postman: https://www.postman.com/downloads/
2. ทดสอบ GET: http://localhost/stock_portfolio_api/api/transactions.php
3. ทดสอบ POST/PUT/DELETE ตาม format ด้านบน

---

## 📂 โครงสร้างไฟล์

```
backend/
├── api/
│   └── transactions.php        # REST API endpoints
├── config/
│   └── database.php           # Database configuration
├── database/
│   └── stock_portfolio.sql    # Database schema + mock data
└── README.md                  # เอกสารนี้
```

---

## ⚠️ หมายเหตุ

- ตรวจสอบว่า Apache และ MySQL เปิดอยู่ใน XAMPP Control Panel
- URL อาจต้องเปลี่ยนตาม folder ที่คุณวางไฟล์
- ถ้า error ให้ดูที่ PHP error log ใน XAMPP
