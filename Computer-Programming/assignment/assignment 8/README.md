# 📂 Python Assignment 8: File Handling

<div align="center">

![Topic](https://img.shields.io/badge/Topic-IO_Integration-brown?style=for-the-badge)
![Focus](https://img.shields.io/badge/Focus-Read/Write-grey?style=for-the-badge)

</div>

---

## 🎯 Objective
การอ่านและเขียนไฟล์ (.txt, .csv) เพื่อบันทึกข้อมูลถาวร (Persistence)

## 💻 Code Logic
```python
# Write to file
with open("data.txt", "w") as f:
    f.write("Hello File!")

# Read from file
with open("data.txt", "r") as f:
    content = f.read()
```
