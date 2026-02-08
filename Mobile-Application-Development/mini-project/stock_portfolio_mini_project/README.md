# 📊 Stock Portfolio Mini Project

**Stock Portfolio Management Application** สำหรับจัดการการซื้อขายหุ้นแบบง่าย ๆ พร้อม Backend API

## 📱 About

แอปพลิเคชันจัดการพอร์ตหุ้นที่พัฒนาด้วย **Flutter** และ **PHP MySQL Backend** รองรับการจัดการธุรกรรมการซื้อขายหุ้นครบวงจร (CRUD) พร้อมคำนวณมูลค่าและค่าใช้จ่ายอัตโนมัติ

### ✨ Features

**CRUD Operations:**
- ✅ **เพิ่มธุรกรรม** - Form validation ครบ, คำนวณอัตโนมัติ
- ✅ **แก้ไขธุรกรรม** - Pre-fill ข้อมูลเดิม
- ✅ **ลบธุรกรรม** - Confirmation dialog  
- ✅ **ดูรายการ** - แสดงทั้งหมดพร้อมรายละเอียด

**การคำนวณ:**
- คำนวณ Gross Amount (ราคา × จำนวน)
- คำนวณ Net Amount (รวม Commission + VAT)
- คำนวณยอดเงินลงทุนสุทธิ (Buy - Sell)
- แสดงสรุปในแต่ละธุรกรรม

**UX/UI:**
- Material Design
- Loading indicators
- Success/Error messages
- DateTime picker
- Form validation
- Responsive layout

---

## 🏗️ Architecture

### Frontend (Flutter)
```
lib/
├── models/              # Data models
├── providers/           # State management (Provider)
├── services/            # API service
├── screens/             # UI screens
└── main.dart            # Entry point
```

### Backend (PHP + MySQL)
```
backend/
├── api/                 # REST API endpoints
├── config/              # Database configuration
└── database/            # SQL schema
```

---

## 🚀 Quick Start

### Prerequisites
- Flutter SDK (3.0+)
- XAMPP (Apache + MySQL)
- Dart (3.0+)

### 1. Clone Repository
```bash
git clone <repository-url>
cd stock_portfolio_mini_project
```

### 2. Setup Backend
```bash
# ติดตั้ง XAMPP และเปิด Apache + MySQL

# Copy backend folder ไป htdocs
cp -r backend C:/xampp/htdocs/stock_portfolio_api

# Import database
# เปิด http://localhost/phpmyadmin
# Import: backend/database/stock_portfolio.sql
```

### 3. Setup Frontend
```bash
# Install dependencies
flutter pub get

# แก้ API URL ใน lib/services/api_service.dart
# เปลี่ยน baseUrl ให้ตรงกับ backend ของคุณ

# Run app
flutter run
```

### 4. ทดสอบ API
เปิด browser: `http://localhost/stock_portfolio_api/api/transactions.php`

ควรเห็น JSON response

---

## 📖 Usage

### เพิ่มธุรกรรม
1. กดปุ่ม **+** (FloatingActionButton) ที่หน้า Home
2. กรอกข้อมูล:
   - Symbol (เช่น AAPL, NVDA)
   - Exchange (NASDAQ, NYSE, SET)
   - Side (Buy/Sell)
   - Price และ Quantity
   - Commission และ VAT
   - วันที่/เวลา
3. ดูสรุปยอดด้านล่าง
4. กด **บันทึก**

### แก้ไขธุรกรรม
1. เลือกธุรกรรมจากรายการ
2. กดปุ่ม **✏️** บน AppBar
3. แก้ไขข้อมูล
4. กด **บันทึกการแก้ไข**

### ลบธุรกรรม
1. เลือกธุรกรรมจากรายการ
2. กดปุ่ม **🗑️** บน AppBar
3. ยืนยันการลบ

---

## 🛠️ Tech Stack

### Frontend
- **Flutter** - UI Framework
- **Provider** - State Management  
- **HTTP** - API Client
- **Intl** - Date/Number Formatting

### Backend
- **PHP** - REST API
- **MySQL** - Database
- **PDO** - Database Driver

---

## 📋 API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/transactions.php` | ดึงรายการทั้งหมด |
| GET | `/api/transactions.php?id=1` | ดึงรายการเดียว |
| POST | `/api/transactions.php` | เพิ่มธุรกรรม |
| PUT | `/api/transactions.php` | แก้ไขธุรกรรม |
| DELETE | `/api/transactions.php?id=1` | ลบธุรกรรม |

ดูรายละเอียดใน [../backend/README.md](../backend/README.md)

---

## 📸 Screenshots

> **Note:** เพิ่ม screenshots ของแอปได้ที่นี่

---

## 🧪 Testing

### Manual Testing
- [ ] Add Transaction
- [ ] Edit Transaction
- [ ] Delete Transaction
- [ ] View All Transactions
- [ ] Error handling (Backend offline)

### Code Analysis
```bash
flutter analyze
```

### Run App
```bash
flutter run -d chrome          # Web
flutter run -d windows         # Windows Desktop
```

---

## 📂 Project Structure

```
stock_portfolio_mini_project/
├── backend/                   # PHP Backend
│   ├── api/
│   ├── config/
│   └── database/
├── lib/                       # Flutter App
│   ├── models/
│   ├── providers/
│   ├── services/
│   ├── screens/
│   └── main.dart
├── pubspec.yaml              # Dependencies
└── README.md                 # This file
```

---

## 🐛 Known Issues

- ต้อง setup Backend ก่อนใช้งาน (ไม่มี Offline mode)
- API URL ต้องแก้ manual ใน `api_service.dart`

---

## 🔮 Future Improvements

- [ ] Offline mode (SQLite)
- [ ] User authentication
- [ ] Charts และ Analytics
- [ ] Export ข้อมูลเป็น CSV
- [ ] Dark mode
- [ ] Multi-language support

---

## 👨‍💻 Development

### Prerequisites
- Flutter SDK 3.0+
- Dart 3.0+
- IDE (VS Code / Android Studio)

### Setup Development Environment
```bash
# Clone repo
git clone <repo-url>

# Install dependencies
flutter pub get

# Run in debug mode
flutter run --debug
```

---

## 📄 License

This project is for educational purposes (Mini Project).

---

## 🙏 Acknowledgments

- Flutter Team
- Provider Package
- HTTP Package
- Intl Package

---

## 📞 Contact

ถ้ามีคำถามหรือข้อเสนอแนะ กรุณาติดต่อผ่าน GitHub Issues

---

**Made with ❤️ using Flutter & PHP**
