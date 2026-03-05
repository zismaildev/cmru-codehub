# 👨‍💻 Nattapong Panthiya (Cmru CodeHub)

<div align="center">

![Role](https://img.shields.io/badge/Role-Software_Architect-000000?style=for-the-badge&logo=archlinux)
![Focus](https://img.shields.io/badge/Focus-System_Design_%7C_Scalability-blue?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Designing_Next_Gen_Solutions-success?style=for-the-badge)

**"Architecting scalable, robust, and maintainable ecosystems."**

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/nattapong-panthiya-29a3a3330/)
[![Email](https://img.shields.io/badge/Email-EA4335?style=for-the-badge&logo=gmail&logoColor=white)](mailto:nattapong130247@gmail.com)
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/zismaildev)

</div>

---

## 🏛️ Executive Summary

Experienced Software Architect with a strong foundation in **Full Stack Development** and **IoT Systems**. I specialize in transforming complex business requirements into high-performance, scalable technical solutions.
My expertise lies in designing microservices architectures, optimizing data pipelines, and implementing secure, event-driven systems that bridge the physical and digital worlds.

> *"Great software is not just about code; it's about the decisions you make to handle change."*

---

## 🧩 Architectural Landscape (Tech Stack)

<div align="center">

| Layer | Technologies & Protocols |
| :--- | :--- |
| **🏗️ Infrastructure & IoT** | `ESP8266` `Arduino` `MQTT` `HTTP/s` `Edge Computing` |
| **⚙️ Backend Ecosystem** | `Node.js` `PHP (Modern)` `RESTful API` `Microservices` |
| **💻 Frontend Experience** | `Flutter (Mobile)` `Bootstrap` `Responsive Design` `State Management` |
| **🗄️ Data Persistence** | `MySQL (Relational)` `Data Normalization` `Optimization` |
| **🛠️ DevOps & QA** | `Git` `Robot Framework` `Automated Testing` `CI/CD Pipelines` |

</div>

---

## �️ Architectural Showcases

Highlighted projects demonstrating architectural decisions, pattern implementation, and system complexity.

### 1. 🅿️ Smart Parking Ecosystem (IoT & Event-Driven)
**Pattern:** `Pub/Sub (MQTT)` • `Edge Computing` • `Polling vs Interrupts`
> **The Challenge:** Handling real-time state changes from multiple sensors with minimal latency while ensuring data consistency on the web dashboard.
>
> **The Solution:**
> - Implemented **Edge Computing** on ESP8266 to process sensor noise locally before transmission.
> - Utilized **Async Non-blocking I/O** (millis) to maintain connection stability while sensing.
> - **Architecture:** `Sensor Node` -> `Broker/Gateway` -> `Web Server` -> `Client Dashboard`.

### 2. 🛒 E-Commerce Monolith to Modular Service (Web)
**Pattern:** `MVC` • `Singleton` • `DAO (Data Access Object)`
> **The Challenge:** Building a robust sales platform that separates business logic from presentation, ensuring maintainability.
>
> **The Solution:**
> - Adopted **MVC Architecture** to decouple the user interface from database operations.
> - Implemented **Singleton Pattern** for Database Connections to manage resource pools efficiently.
> - Secured data flow with **Prepared Statements** and Session-based Authentication state.

### 3. 📱 Cross-Platform Mobile Suite (Flutter)
**Pattern:** `Provider (Observer)` • `Repository Pattern` • `Clean Architecture`
> **The Challenge:** Managing complex application state across multiple screens without prop-drilling or tightly coupled widgets.
>
> **The Solution:**
> - leveraged **Provider for State Management**, allowing a reactive UI that updates instantly upon data changes.
> - Structured code using **Repository Pattern** to abstract data sources (API/Local DB) from the UI layer.

---

## 🧭 Engineering Philosophy

- **Clean Architecture**: System independent of frameworks, UI, and external agencies.
- **SOLID Principles**: Ensuring code is easy to maintain and extend.
- **DRY (Don't Repeat Yourself)**: Promoting code reusability and reducing technical debt.
- **Security First**: Integrating security best practices (Validation, Sanitization, Auth) at every layer.

---

## 🚀 Getting Started (สำหรับรุ่นน้องและผู้สนใจ)

เพื่อให้การศึกษา Source Code ใน Portfolio นี้เป็นไปได้อย่างราบรื่น แนะนำให้เตรียม Environment ดังนี้ครับ:

### 🛠️ Recommended Tools
- **IDE:** [VS Code](https://code.visualstudio.com/) (แนะนำติดตั้ง Extension ตามภาษาที่สนใจ)
- **Version Control:** [Git](https://git-scm.com/)
- **Database:** [XAMPP](https://www.apachefriends.org/) หรือ [Docker](https://www.docker.com/) (สำหรับ MySQL)

### 📂 How to Explore
1. **Choose a Course:** เลือกรายวิชาจากตารางด้านล่างตามความสนใจ
2. **Read the Docs:** เข้าไปอ่าน `README.md` ของวิชานั้นๆ เพื่อดูวิธีการรันและสิ่งที่ต้องเตรียม (เช่น Library หรือ Database Schema)
3. **Database Setup:** หากวิชานั้นมี Database (เช่น SQL หรือ Web) ไฟล์ Schema มักจะอยู่ในโฟลเดอร์ `lab/` หรือ `database/` ให้ Import เข้า phpMyAdmin ก่อนรัน

### 📥 How to Download Specific Folders
หากต้องการดาวน์โหลดเฉพาะโฟลเดอร์ที่สนใจ โดยไม่ต้องการ clone มาทั้งโปรเจกต์ สามารถทำได้ดังนี้ครับ:

#### 1. ใช้เว็บไซต์ Download Directory (ง่ายที่สุด)
- คัดลอก URL ของโฟลเดอร์นั้นจาก Browser
- เข้าไปที่เว็บไซต์ [download-directory.github.io](https://download-directory.github.io/)
- วาง URL ลงในช่องว่างแล้วกด Enter เพื่อดาวน์โหลดไฟล์ .zip

#### 2. ใช้คำสั่ง Git Sparse Checkout
หากติดตั้ง Git เวอร์ชั่น 2.25 ขึ้นไป:
```bash
mkdir my-project
cd my-project
git init
git remote add -f origin https://github.com/zismaildev/cmru-codehub.git
git sparse-checkout set Mobile-Application-Development/mini-project/stock_portfolio_mini_project
git pull origin main
```

#### 3. ใช้ GitHub CLI
```bash
gh repo clone zismaildev/cmru-codehub -- --sparse
cd cmru-codehub
git sparse-checkout set Mobile-Application-Development/mini-project/stock_portfolio_mini_project
```

> [!TIP]
> **คำแนะนำเพิ่มเติม:** หากมีแผนจะศึกษาหัวข้ออื่นๆ ในภายหลัง การ `git clone` ทั้งโปรเจกต์เก็บไว้เลยอาจจะสะดวกกว่าในระยะยาวครับ เพราะไฟล์โค้ดส่วนใหญ่มีขนาดไม่ใหญ่มากนัก

---

## 🗺️ Repository Map (Course-based Portfolio)

| Course Code | Course Name (Topic) | Tech Stack |
| :--- | :--- | :--- |
| **COM 1305** | **[Computer Programming](./Computer-Programming)** | [![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/) |
| **COM 3302** | **[Object Oriented Programming](./Object-Oriented-Programming)** | [![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)](https://www.java.com/) |
| **COM 2305** | **[Web Programming](./Web-Programming)** | [![PHP](https://img.shields.io/badge/PHP-777BB4?style=for-the-badge&logo=php&logoColor=white)](https://www.php.net/) [![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/) |
| **COM 2701** | **[Computer Systems & Architecture](./Computer-Systems-and-Architecture)** | [![C](https://img.shields.io/badge/C-A8B9CC?style=for-the-badge&logo=c&logoColor=white)](https://gcc.gnu.org/) |
| **COM 3705** | **[Internet of Things](./Internet-of-Things)** | [![Arduino](https://img.shields.io/badge/Arduino-00979D?style=for-the-badge&logo=arduino&logoColor=white)](https://www.arduino.cc/) [![C++](https://img.shields.io/badge/C%2B%2B-00599C?style=for-the-badge&logo=cplusplus&logoColor=white)](https://isocpp.org/) |
| **COM 4304** | **[Mobile App Development](./Mobile-Application-Development)** | [![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/) [![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/) |
| **COM 1602** | **[Database System 1](./Database-System-1)** | [![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/) |
| **COM 3410** | **[Fundamentals of Data Science](./Fundamentals-of-Data-Science)** | [![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/) [![Pandas](https://img.shields.io/badge/Pandas-150458?style=for-the-badge&logo=pandas&logoColor=white)](https://pandas.pydata.org/) |
| **COM 3604-63**| **[Data Mining](./Data-Mining)** | [![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/) [![Jupyter](https://img.shields.io/badge/Jupyter-F37626.svg?&style=for-the-badge&logo=Jupyter&logoColor=white)](https://jupyter.org/) |
| **COM 4501** | **[Software Testing](./Software-Testing)** | [![Robot Framework](https://img.shields.io/badge/Robot%20Framework-00C0B5?style=for-the-badge&logo=robot-framework&logoColor=white)](https://robotframework.org/) |
| **COM 4402** | **[Computer and Network Security](./Computer-and-Network-Security)** | [![PHP](https://img.shields.io/badge/PHP-777BB4?style=for-the-badge&logo=php&logoColor=white)](https://www.php.net/) [![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/) |

---

## 📬 Contact & Connect

<div align="center">

### Let's Build Something Amazing Together!

ฉันยินดีรับฟังโอกาสในการทำงาน, คำแนะนำ, หรือคำถามเกี่ยวกับโปรเจคต่างๆ

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=for-the-badge&logo=linkedin)](https://www.linkedin.com/in/nattapong-panthiya-29a3a3330/)
[![Email](https://img.shields.io/badge/Email-Send%20Message-EA4335?style=for-the-badge&logo=gmail)](mailto:nattapong130247@gmail.com)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-181717?style=for-the-badge&logo=github)](https://github.com/zismaildev)

---

<p><i>"Architecting the future, one line of code at a time."</i></p>
<p><b>© 2026 Nattapong Panthiya</b> | Computer Science Student | Software Architect</p>

</div>
