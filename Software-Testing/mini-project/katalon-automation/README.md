# 🤖 Robot Framework Automation

<div align="center">

![Tool](https://img.shields.io/badge/Tool-Robot_Framework-black?style=for-the-badge&logo=robotframework)
![Library](https://img.shields.io/badge/Lib-SeleniumLibrary-green?style=for-the-badge)

**"Keyword-Driven Acceptance Testing"**

</div>

---

## 🎯 Objective
รวมชุด Automated Test Script ที่เขียนด้วย **Robot Framework** ซึ่งเป็น Keyword-Driven Testing Tool ที่อ่านง่ายเหมือนภาษาอังกฤษ ใช้ทดสอบ Web UI (Assignment Login, Facebook Register)

## 🏗️ Test Execution Flow

```mermaid
sequenceDiagram
    participant Tester
    participant Robot as Robot Framework
    participant Driver as ChromeDriver
    participant Browser as Chrome
    participant App as Web App

    Tester->>Robot: Run Test Suite
    Robot->>Driver: Open Browser
    Driver->>Browser: Launch URL
    Browser->>App: Interact (Click/Type)
    App-->>Browser: Update UI
    Browser-->>Driver: Return State
    Driver-->>Robot: Verify Result (Assert)
    Robot-->>Tester: Generate Report.html
```

## 📂 Test Suites
1.  **Assignment (Login)**: ทดสอบ Workflow การล็อกอินที่ `the-internet.herokuapp.com`
2.  **Facebook Register**: ทดสอบกรอกฟอร์มสมัครสมาชิก (Demo)

## 💻 Code Example (.robot)
```robot
*** Test Cases ***
Valid Login
    Open Browser    ${URL}    chrome
    Input Text      id=username    tomsmith
    Input Password  id=password    SuperSecretPassword!
    Click Button    css=button[type='submit']
    Element Should Contain    id=flash    You logged into a secure area!
    [Teardown]    Close Browser
```
