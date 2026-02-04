# 🧪 Data Science Lab 1: Google Colab & Python Basics

<div align="center">

![Platform](https://img.shields.io/badge/Platform-Google_Colab-F9AB00?style=for-the-badge&logo=googlecolab)
![Language](https://img.shields.io/badge/Language-Python_3-3776AB?style=for-the-badge&logo=python)

**"Getting Started with Cloud-based Jupyter Notebooks"**

</div>

---

## 🎯 Objective
จุดเริ่มต้นของการเรียนรู้ Data Science คือการใช้เครื่องมือที่ถูกต้อง Lab นี้แนะนำการใช้งาน **Google Colab** และการเขียน Python เบื้องต้น (Variables, Lists, Dictionaries)

## 🏗️ Workflow Diagram

```mermaid
graph LR
    User[User] --> Browser[Web Browser]
    Browser --> Colab[Google Colab]
    Colab --> Kernel[Python Runtime (Cloud)]
    Kernel --> Execute[Run Cell]
    Execute --> Output[Display Result]
```

## 💻 Tech Highlights
- **Lists vs Tuples**: ความแตกต่างระหว่าง Mutable และ Immutable Data Structures
- **Dictionaries**: การเก็บข้อมูลแบบ Key-Value Pair

```python
# Dictionary Example
student = {
    "name": "John Doe",
    "id": 64001,
    "scores": [80, 75, 90]
}
```

## 💡 Key Learnings
- **Cloud Computing**: ไม่ต้องลง Python ในเครื่องก็เขียนโค้ดได้
- **Cell Execution**: การรันโค้ดทีละส่วน (Block) ช่วยให้ Debug ง่ายขึ้น
