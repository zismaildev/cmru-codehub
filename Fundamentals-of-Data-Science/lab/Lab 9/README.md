# 🚦 Lab 9: Control Flow (Conditions)

<div align="center">

![Topic](https://img.shields.io/badge/Topic-Decision_Making-orange?style=for-the-badge)
![Keyword](https://img.shields.io/badge/Keyword-if_elif_else-blue?style=for-the-badge)

**"Logic and Decision Making in Python"**

</div>

---

## 🎯 Objective
การเขียนโปรแกรมให้ "คิด" ได้ ต้องใช้เงื่อนไข `if-elif-else` เพื่อควบคุมทิศทางการทำงานของโปรแกรมตามข้อมูลที่ได้รับ

## 🏗️ Logic Flowchart

```mermaid
graph TD
    Start --> Check{Score >= 50?}
    Check -- Yes --> Pass[Print 'Pass']
    Check -- No --> Fail[Print 'Fail']
```

## 💻 Code Snippet
```python
score = 75
if score >= 80:
    grade = "A"
elif score >= 70:
    grade = "B"
else:
    grade = "F"
```
