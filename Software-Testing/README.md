# COM 4501 Software Testing

<div align="center">

![Type](https://img.shields.io/badge/Focus-Quality_Assurance-green?style=for-the-badge)
![Tech](https://img.shields.io/badge/Stack-Robot_Framework-00C0B5?style=for-the-badge)

**"Quality is not an act, it is a habit" - Aristotle**

</div>

---

## 🎯 เกี่ยวกับรายวิชา

รายวิชานี้สอน**การทดสอบซอฟต์แวร์อย่างเป็นระบบ** เพื่อให้มั่นใจว่าตัวโปรแกรมทำงานถูกต้องตามที่ออกแบบไว้ ใช้ **Robot Framework** ซึ่งเป็นเครื่องมือทดสอบอัตโนมัติ (Test Automation)

### ทำไมต้องทดสอบซอฟต์แวร์?
❌ **ไม่ทดสอบ** = มี Bug ในระบบ → ผู้ใช้โกรธ → บริษัทเสียชื่อเสียง
✅ **ทดสอบดี** = มี Bug น้อย → ผู้ใช้พอใจ → ธุรกิจเติบโต

**ตัวอย่างจริง:**
- NASA Mars Orbiter (1999): สูญเสีย 125 ล้านดอลลาร์ เพราะผิด Unit (Metric vs Imperial)
- Therac-25: เครื่องฉายรังสีพลัง

Error ทำให้มีผู้เสียชีวิต

### เนื้อหาหลักที่เรียน
1. **Testing Fundamentals** - ความรู้พื้นฐาน, ประเภทของการทดสอบ
2. **Test Case Design** - การออกแบบ Test Case ที่ดี
3. **Robot Framework** - เครื่องมือทดสอบอัตโนมัติ
4. **Web Testing** - ทดสอบเว็บด้วย Selenium Library
5. **API Testing** - ทดสอบ REST API
6. **Test Automation** - ทำให้การทดสอบเป็นอัตโนมัติ

---

## 🔑 สิ่งที่เรียนรู้ (Key Learnings)

### 1. Software Testing Fundamentals

#### ประเภทของการทดสอบ
- **Unit Testing**: ทดสอบแต่ละ Function/Method ย่อยๆ
- **Integration Testing**: ทดสอบการทำงานร่วมกันของหลาย Module
- **System Testing**: ทดสอบระบบทั้งหมด (End-to-End)
- **Acceptance Testing**: ทดสอบว่าตรงตามความต้องการ User หรือไม่

#### Black Box vs White Box
- **Black Box**: ทดสอบโดยไม่รู้โครงสร้างภายใน (User perspective)
- **White Box**: ทดสอบโดยรู้โครงสร้างโค้ด (Developer perspective)

#### Manual vs Automation
- **Manual**: ทดสอบด้วยมือ (ช้า แต่ยืดหยุ่น)
- **Automation**: ใช้ Script ทดสอบ (เร็ว แต่ต้องเขียนก่อน)

### 2. Test Case Design Techniques

#### Equivalence Partitioning
แบ่งข้อมูลเป็นกลุ่ม แล้วทดสอบตัวแทนแต่ละกลุ่ม

**ตัวอย่าง:** อายุ 0-17, 18-60, 61+
→ ทดสอบ: 10, 30, 70

#### Boundary Value Analysis
ทดสอบค่าขอบเขต (มีโอกาส Error สูง)

**ตัวอย่าง:** ช่วง 18-60
→ ทดสอบ: 17, 18, 60, 61

#### Decision Table
เมื่อมีเงื่อนไขหลายตัว

| Age | Member | Discount |
|:---|:---|---:|
| <18 | Yes | 20% |
| <18 | No | 10% |
| ≥18 | Yes | 15% |
| ≥18 | No | 0% |

### 3. Robot Framework Basics

#### Test Case Structure
```robot
*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Valid Login
    Open Browser    http://example.com    chrome
    Input Text    id=username    admin
    Input Text    id=password    1234
    Click Button    id=login
    Page Should Contain    Welcome
    Close Browser
```

#### Keywords
- **Built-in**: Log, Should Be Equal, Sleep
- **Library**: SeleniumLibrary (Web), RequestsLibrary (API)
- **Custom**: สร้าง Keyword เอง

### 4. Web Testing with Selenium

#### ค้นหา Element
```robot
Click Element    id=submit
Click Element    xpath=//button[@class='btn']
Click Element    css=.login-button
```

#### Assertions
```robot
Page Should Contain    Success
Element Should Be Visible    id=welcome
Title Should Be    Dashboard
```

### 5. API Testing

#### REST API Testing
```robot
*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
Get User Data
    Create Session    api    https://api.example.com
    ${response}=    GET On Session    api    /users/1
    Status Should Be    200    ${response}
    Should Be Equal    ${response.json()['name']}    John
```

### 6. Data-Driven Testing

```robot
*** Test Cases ***
Login With Different Users
    [Template]    Test Login
    admin       1234        Success
    user1       wrongpwd    Failed
    guest       guest123    Success

*** Keywords ***
Test Login
    [Arguments]    ${user}    ${pwd}    ${expected}
    Input Username    ${user}
    Input Password    ${pwd}
    ${result}=    Get Login Result
    Should Be Equal    ${result}    ${expected}
```

---

## 📂 โครงสร้างภายใน (Repository Structure)

```
Software-Testing/
├── README.md                ← ไฟล์นี้
└── lab/                     ← Lab ทดสอบ
    ├── [Lab 1-12]           → Test Case Design, Robot Framework
    └── [Final Project]      → Automation Testing Project
```

---

## 📚 Lab Topics

### 🟢 Weeks 1-4: Testing Basics
- **Lab 1**: Introduction to Software Testing
- **Lab 2**: Test Case Design Techniques
- **Lab 3**: Boundary Value & Equivalence
- **Lab 4**: Decision Table Testing

### 🟡 Weeks 5-8: Robot Framework
- **Lab 5**: Robot Framework Basics
- **Lab 6**: Web Testing with Selenium
- **Lab 7**: API Testing
- **Lab 8**: Custom Keywords

### 🟠 Weeks 9-12: Advanced Automation
- **Lab 9**: Data-Driven Testing
- **Lab 10**: Page Object Pattern
- **Lab 11**: CI/CD Integration
- **Lab 12**: Final Project - Complete Test Suite

---

## 🛠️ เครื่องมือที่ใช้

### ✅ Required
- **[Python](https://www.python.org/)** - ภาษาที่ Robot Framework ใช้
- **[Robot Framework](https://robotframework.org/)** - Framework หลัก
  ```bash
  pip install robotframework
  ```
- **[SeleniumLibrary](https://robotframework.org/SeleniumLibrary/)** - สำหรับทดสอบเว็บ
  ```bash
  pip install robotframework-seleniumlibrary
  ```
- **[WebDriver](https://chromedriver.chromium.org/)** - Chrome/Firefox Driver

### 📦 Optional Tools
- **RequestsLibrary**: ทดสอบ API
- **Database Library**: ทดสอบ Database
- **Jenkins/GitHub Actions**: CI/CD

---

## 🚀 วิธีการรัน (How to Run)

### 📋 Prerequisites
1. ติดตั้ง Python (3.7+)
2. ติดตั้ง Robot Framework:
   ```bash
   pip install robotframework
   pip install robotframework-seleniumlibrary
   ```
3. ดาวโหลด [ChromeDriver](https://chromedriver.chromium.org/)
   - วางใน PATH หรือโฟลเดอร์เดียวกับ test

### ▶️ รัน Test

```bash
# รัน test file เดียว
robot test_login.robot

# รัน ทั้งโฟลเดอร์
robot tests/

# รันแบบมี Tag
robot --include smoke tests/

# Generate HTML Report
robot --outputdir results tests/
```

### 📊 ดูผลลัพธ์
หลังรันเสร็จจะได้:
- `report.html` - รายงานสรุป
- `log.html` - Log ละเอียด
- `output.xml` - ข้อมูล Machine-readable

---

## 📖 แนะนำสำหรับรุ่นน้อง

### 🎓 เริ่มต้นอย่างไร?
1. **เข้าใจ Manual Testing ก่อน**: รู้จักเขียน Test Case มือ
2. **ฝึก Robot Syntax**: เริ่มจาก Test ง่ายๆ
3. **ทดลองเว็บจริง**: ใช้ตัวอย่างที่มีอยู่แล้ว
4. **อ่าน Log เมื่อ Fail**: เรียนรู้จากข้อผิดพลาด

### 💡 Tips & Best Practices
- **ตั้งชื่อ Test ให้สื่อความหมาย**: `Valid_Login` ดีกว่า `Test1`
- **แยก Test Cases ให้ชัดเจน**: 1 Test = 1 Scenario
- **ใช้ Keywords ซ้ำได้**: อย่าเขียนซ้ำ (DRY)
- **รัน Test บ่อยๆ**: อย่ารอจนเขียนเสร็จหมด
- **Maintain Test Scripts**: Update เมื่อ UI เปลี่ยน

### 📚 แหล่งเรียนรู้เพิ่มเติม
- [Robot Framework User Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
- [SeleniumLibrary Docs](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)
- [Robot Framework Tutorial](https://github.com/robotframework/QuickStartGuide)

### ⚠️ ข้อผิดพลาดที่พบบ่อย
- ❌ ลืมติดตั้ง WebDriver
- ❌ Selector ผิด (id, xpath, css)
- ❌ Element ยังไม่โหลดเสร็จ (ใส่ Wait)
- ❌ Test ขึ้นกับลำดับ (ควร Independent)
- ❌ Hard-code URL/Data (ควรใช้ Variables)

---

## 📄 License
โค้ดในโปรเจกต์นี้เป็นส่วนหนึ่งของการเรียนการสอนในรายวิชา COM 4501 Software Testing

---

<div align="center">

**Happy Testing! 🧪✅**

*"Testing shows the presence, not the absence of bugs." - Dijkstra*

</div>
