# 🐼 Lab 17: Pandas DataFrame

<div align="center">

![Library](https://img.shields.io/badge/Library-Pandas-150458?style=for-the-badge&logo=pandas)
![Concept](https://img.shields.io/badge/Concept-Tabular_Data-green?style=for-the-badge)

**"Data Manipulation and Analysis Tool"**

</div>

---

## 🎯 Objective
ทำความรู้จัก **Pandas**, เครื่องมือที่ทรงพลังที่สุดสำหรับ Data Analysis ใน Python เรียนรู้โครงสร้าง `Series` และ `DataFrame` (ตารางข้อมูล)

## 🏗️ DataFrame Structure

```mermaid
graph TD
    DF[DataFrame] --> Col1[Column: Name]
    DF --> Col2[Column: Age]
    DF --> Index[Index: 0, 1, 2...]
```

## 💻 Tech Spec
- **read_csv()**: อ่านไฟล์ข้อมูลเข้าสู่ DataFrame
- **head()**, **describe()**: คำสั่งสำรวจข้อมูลเบื้องต้น

```python
import pandas as pd
df = pd.read_csv('data.csv')
print(df.head())
```
