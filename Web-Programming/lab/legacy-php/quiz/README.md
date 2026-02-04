# 📝 Online Quiz Assessment System

<div align="center">

![Tech](https://img.shields.io/badge/Language-PHP_Native-777BB4?style=for-the-badge)
![Concept](https://img.shields.io/badge/Concept-Array_Processing-blue?style=for-the-badge)

**"Automated Scoring and Feedback Mechanism"**

</div>

---

## 🎯 Problem Statement
การประเมินผลออนไลน์ (E-Assessment) ช่วยลดภาระงานตรวจข้อสอบของอาจารย์ โจทย์คือการสร้างระบบที่รับคำตอบจากผู้เรียน เปรียบเทียบกับเฉลย (Answer Key) และคำนวณคะแนนทันที

## 🏗️ Scoring Logic Flow

```mermaid
graph TD
    Start([User Submit]) --> Receive[Receive $_POST Data]
    Receive --> Init[Set Score = 0]
    Init --> CheckQ1{Q1 Correct?}
    CheckQ1 -- Yes --> Inc1[Score++]
    CheckQ1 -- No --> Next1
    Inc1 --> Next1
    Next1 --> CheckQ2{Q2 Correct?}
    CheckQ2 -- Yes --> Inc2[Score++]
    CheckQ2 -- No --> Next2
    Inc2 --> Display[/Display Total Score/]
```

## 💻 Tech Implementation
- **Associative Arrays**: ใช้เก็บเฉลย `['q1' => 'a', 'q2' => 'c']` เพื่อความง่ายในการแก้ไข
- **Ternary Operator**: ใช้ลดรูป If-Else ในการตรวจคำตอบ

```php
// Check Answer Logic
$total_score = 0;
$answer_key = ['q1' => 'active', 'q2' => 'server'];

if (isset($_POST['submit'])) {
    foreach ($answer_key as $q => $ans) {
        if ($_POST[$q] == $ans) $total_score++;
    }
}
```

## 💡 Key Learnings
- **Form State**: การใช้ Radio Button `name="q1"` เพื่อให้เลือกได้เพียงข้อเดียว
- **Scalability**: การใช้ Loop + Array ตรวจคำตอบ ทำให้รองรับจำนวนข้อสอบได้ไม่จำกัดโดยไม่ต้องแก้ Code เยอะ
