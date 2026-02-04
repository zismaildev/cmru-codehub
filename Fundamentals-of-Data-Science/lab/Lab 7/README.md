# 🔤 Lab 7: String Manipulation

<div align="center">

![Topic](https://img.shields.io/badge/Topic-Text_Processing-success?style=for-the-badge)
![Method](https://img.shields.io/badge/Method-Slicing_%26_Formatting-blue?style=for-the-badge)

**"Mastering Text Data Cleaning"**

</div>

---

## 🎯 Objective
ข้อมูลในโลกจริงส่วนใหญ่เป็นข้อความ (Text) Lab นี้สอนการจัดการ Strings ทั้งการตัดคำ (Slicing), การค้นหา, และการจัดรูปแบบ (Formatting) ซึ่งจำเป็นมากสำหรับงาน NLP

## 🏗️ Slicing Logic
`text[start:stop:step]`

```mermaid
graph LR
    Str[P y t h o n]
    Idx[0 1 2 3 4 5]
    Str --- Idx
```

## 💻 Code Highlights
```python
text = "  Data Science  "
clean = text.strip().upper() # Remove space & upper case
print(f"Cleaned: {clean}")   # f-string formatting
```
