# COM 3410 Fundamentals of Data Science

<div align="center">

![Type](https://img.shields.io/badge/Focus-Data_Analysis_%26_Visualization-blueviolet?style=for-the-badge)
![Tech](https://img.shields.io/badge/Stack-Python_%7C_Pandas_%7C_NumPy-3776AB?style=for-the-badge)

**"In Data We Trust - Turning Numbers into Insights"**

</div>

---

## 🎯 เกี่ยวกับรายวิชา

รายวิชานี้สอน**การวิเคราะห์และทำความเข้าใจข้อมูล (Data Analysis)** เพื่อหา Insights และตัดสินใจอย่างมีข้อมูลรองรับ ใช้ **Python** กับเครื่องมือทาง Data Science

### Data Science คืออะไร?
**Data Science** = การรวม 3 ศาสตร์:
1. **Statistics** (สถิติ): วิเคราะห์ข้อมูลเชิงตัวเลข
2. **Programming** (โปรแกรมมิ่ง): เขียนโค้ดประมวลผลข้อมูล
3. **Domain Knowledge** (ความรู้เฉพาะด้าน): เข้าใจบริบทของข้อมูล

**ตัวอย่างการใช้งานจริง:**
- Netflix: แนะนำหนังที่คุณจะชอบ (Recommendation System)
- Google: ค้นหาอันดับ Page (Search Algorithm)
- ธนาคาร: ตรวจจับธุรกรรมผิดปกติ (Fraud Detection)
- โรงพยา บาล: ทำนายโรค (Predictive Analytics)

### เนื้อหาหลักที่เรียน
1. **Python for Data Science** - NumPy, Pandas Libraries
2. **Data Cleaning** - จัดการข้อมูลผิดพลาด, Missing Values
3. **Exploratory Data Analysis (EDA)** - สำรวจและเข้าใจข้อมูล
4. **Data Visualization** - กราฟและแผนภูมิ (Matplotlib, Seaborn)
5. **Statistics Basics** - Mean, Median, Correlation
6. **Introduction to Machine Learning** - Linear Regression, Classification

---

## 🔑 สิ่งที่เรียนรู้ (Key Learnings)

### 1. NumPy - Numerical Python

#### Arrays (ทำงานกับเลขเยอะๆ)
```python
import numpy as np

# สร้าง Array
data = np.array([1, 2, 3, 4, 5])

# คำนวณแบบ Vectorized (เร็วกว่า Loop)
print(data * 2)  # [2, 4, 6, 8, 10]
print(data.mean())  # 3.0
print(data.std())   # 1.41 (Standard Deviation)
```

#### Matrix Operations
```python
matrix = np.array([[1, 2], [3, 4]])
print(matrix.T)  # Transpose
print(np.linalg.inv(matrix))  # Inverse
```

### 2. Pandas - Data Manipulation

#### DataFrame (ตารางข้อมูล)
```python
import pandas as pd

# อ่านข้อมูลจากไฟล์
df = pd.read_csv('data.csv')

# ดูข้อมูลคร่าวๆ
print(df.head())    # 5 แถวแรก
print(df.info())    # ประเภทข้อมูล
print(df.describe())  # สถิติพื้นฐาน

# Filter ข้อมูล
young_users = df[df['age'] < 25]

# Group By
avg_by_city = df.groupby('city')['income'].mean()
```

#### Data Cleaning
```python
# ลบค่า Missing
df.dropna()  # ลบแถวที่มี NaN

# เติมค่า Missing
df.fillna(df.mean())  # เติมด้วยค่าเฉลี่ย

# ลบ Duplicates
df.drop_duplicates()

# เปลี่ยน Type
df['age'] = df['age'].astype(int)
```

### 3. Data Visualization

#### Matplotlib - กราฟพื้นฐาน
```python
import matplotlib.pyplot as plt

# Line Chart
plt.plot(x, y)
plt.title('Sales Over Time')
plt.xlabel('Month')
plt.ylabel('Revenue')
plt.show()

# Bar Chart
plt.bar(categories, values)
plt.show()

# Histogram
plt.hist(data, bins=20)
plt.show()
```

#### Seaborn - กราฟที่สวยกว่า
```python
import seaborn as sns

# Heatmap ( Correlation)
sns.heatmap(df.corr(), annot=True)

# Box Plot
sns.boxplot(x='category', y='price', data=df)

# Pair Plot
sns.pairplot(df)
```

### 4. Exploratory Data Analysis (EDA)

#### สำรวจข้อมูล
```python
# ข้อมูลมีกี่แถว กี่คอลัมน์?
print(df.shape)  # (1000, 5)

# มีค่า Missing ไหม?
print(df.isnull().sum())

# ข้อมูลแต่ละฟิลด์เป็นอะไร?
print(df.dtypes)

# มีค่าผิดปกติไหม? (Outliers)
print(df.describe())
```

#### ถามคำถามกับข้อมูล
- กลุ่มลูกค้าไหนซื้อมากที่สุด?
- สินค้าไหนขายดี?
- วันไหนมียอดขายสูงสุด?

### 5. Statistics for Data Science

#### Descriptive Statistics
```python
# Central Tendency
df['price'].mean()    # ค่าเฉลี่ย
df['price'].median()  # ค่ากลาง
df['price'].mode()    #  ค่าที่พบบ่อยสุด

# Spread
df['price'].std()    # Standard Deviation
df['price'].var()    # Variance
df['price'].min(), df['price'].max()
```

#### Correlation (ความสัมพันธ์)
```python
# หาความสัมพันธ์ระหว่างตัวแปร
df.corr()

# Correlation = 1: สัมพันธ์บวกสมบูรณ์
# Correlation = -1: สัมพันธ์ลบสมบูรณ์
# Correlation = 0: ไม่สัมพันธ์
```

### 6. Machine Learning Basics

#### Linear Regression (ทำนายตัวเลข)
```python
from sklearn.linear_model import LinearRegression

model = LinearRegression()
model.fit(X_train, y_train)  # เรียนรู้
predictions = model.predict(X_test)  # ทำนาย
```

#### Classification (จัดกลุ่ม)
```python
from sklearn.tree import DecisionTreeClassifier

model = DecisionTreeClassifier()
model.fit(X_train, y_train)
accuracy = model.score(X_test, y_test)
```

---

## 📂 โครงสร้างภายใน (Repository Structure)

```
Fundamentals-of-Data-Science/
├── README.md                ← ไฟล์นี้
└── lab/                     ← Lab Notebooks
    ├── [Lab 1-12]           → Jupyter Notebooks (.ipynb)
    └── [Datasets]           → CSV, Excel files
```

---

## 📚 Lab Jupyter Notebooks

วิชานี้มี **17+ Labs** เป็น Jupyter Notebooks (.ipynb) ครอบคลุมตั้งแต่พื้นฐานถึงขั้นสูง:

### 🟢 Python & Data Fundamentals (Lab 1-6)
- **[Lab 1](./lab/Lab%201/)**: Python Basics for Data Science
- **[Lab 2](./lab/Lab%202/)**: NumPy Arrays & Operations
- **[Lab 3](./lab/Lab%203/)**: Pandas DataFrame Basics
- **[Lab 4](./lab/Lab%204/)**: Data Cleaning & Preprocessing
- **[Lab 5](./lab/Lab%205/)**: Reading Data (CSV, Excel, JSON)
- **[Lab 6](./lab/Lab%206/)**: Data Manipulation Techniques

### 🟡 Visualization & EDA (Lab 7-12)
- **[Lab 7](./lab/Lab%207/)**: Matplotlib Charts (Line, Bar, Scatter)
- **[Lab 8](./lab/Lab%208/)**: Seaborn Statistical Plots
- **[Lab 9](./lab/Lab%209/)**: Exploratory Data Analysis (EDA)
- **[Lab 10](./lab/Lab%2010/)**: Statistical Analysis
- **[Lab 11](./lab/Lab%2011/)**: Correlation & Relationships
- **[Lab 12](./lab/Lab%2012/)**: Advanced Visualization

### 🟠 Machine Learning Basics (Lab 13-17)
- **[Lab 13](./lab/Lab%2013/)**: Linear Regression
- **[Lab 14](./lab/Lab%2014/)**: Classification - Decision Tree
- **[Lab 15](./lab/Lab%2015/)**: K-Nearest Neighbors (KNN)
- **[Lab 16](./lab/Lab%2016/)**: Model Evaluation Metrics
- **[Lab 17](./lab/Lab%2017/)**: Complete ML Workflow

### 🔵 Special Topics
- **[Colab Exercise 1](./lab/Colab%20Exercise%201/)**: Google Colab Tutorial
- **[Web Scraping Tutorial](./lab/Web%20Scraping%20Tutorial/)**: ดึงข้อมูลจากเว็บ

> **วิธีใช้:** เปิดไฟล์ .ipynb ด้วย Jupyter Notebook หรือ Google Colab สำหรับ Interactive Learning

---

## 🛠️ เครื่องมือที่ใช้

### ✅ Required
- **[Python](https://www.python.org/)** (3.8+)
- **[Jupyter Notebook](https://jupyter.org/)** หรือ Google Colab
- **Libraries:**
  ```bash
  pip install numpy pandas matplotlib seaborn scikit-learn
  ```

### 📦 Optional Tools
- **[Anaconda](https://www.anaconda.com/)**: ติดตั้งทุกอย่างพร้อมใช้
- **Google Colab**: ใช้ฟรีบน Cloud (ไม่ต้องติดตั้งอะไร)

---

## 🚀 วิธีการรัน (How to Run)

### 📋 Prerequisites
1. ติดตั้ง Anaconda หรือ Python + Jupyter
2. ติดตั้ง Libraries:
   ```bash
   pip install numpy pandas matplotlib seaborn scikit-learn jupyter
   ```

### ▶️ รัน Jupyter Notebook

```bash
# เปิด Jupyter
jupyter notebook

# จะเปิดเว็บที่ http://localhost:8888
# คลิกไฟล์ .ipynb เพื่อเปิด
# กด Shift+Enter เพื่อรันแต่ละ Cell
```

**หรือใช้ Google Colab:**
1. ไปที่ [colab.research.google.com](https://colab.research.google.com/)
2. Upload ไฟล์ .ipynb
3. รันได้เลย ไม่ต้องติดตั้งอะไร

---

## 📖 แนะนำสำหรับรุ่นน้อง

### 🎓 เริ่มต้นอย่างไร?
1. **ทบทวน Python**: Pandas ใช้ Python พื้นฐาน
2. **เล่นกับข้อมูลจริง**: Kaggle Datasets มีให้ดาวน์โหลดฟรี
3. **ทำ EDA เสมอ**: ก่อน Model อะไรให้เข้าใจข้อมูลก่อน
4. **ภาพกราฟช่วยได้**: ข้อมูลจินตนาการยาก แต่กราฟเห็นชัด

### 💡 Tips & Best Practices
- **แยก Data Cleaning กับ Analysis**: อย่าปนเป
- **ใช้ Jupyter Markdown**: อธิบายโค้ดในแต่ละ Cell
- **Plot บ่อยๆ**: Visualization ช่วยหา Insight
- **เช็ค Data Type**: ตัวเลขบางทีเก็บเป็น String
- **Version Control**: ใช้ Git สำหรับ Notebooks

### 📚 แหล่งเรียนรู้เพิ่มเติม
- [Kaggle Learn](https://www.kaggle.com/learn) - Free Data Science Courses
- [Pandas Documentation](https://pandas.pydata.org/docs/)
- [Seaborn Gallery](https://seaborn.pydata.org/examples/index.html)
- [Scikit-learn Tutorials](https://scikit-learn.org/stable/tutorial/index.html)

### ⚠️ ข้อผิดพลาดที่พบบ่อย
- ❌ ลืมเช็ค Missing Values (NaN)
- ❌ ใช้ Mean ตอนที่มี Outliers (ควรใช้ Median)
- ❌ ไม่แยก Train/Test Set
- ❌ ไม่ได้ Normalize ข้อมูล (Model ทำงานย้อม)
- ❌ Overfitting - Model จำข้อมูลแทนที่จะเรียนรู้

---

## 📄 License
โค้ดในโปรเจกต์นี้เป็นส่วนหนึ่งของการเรียนการสอนในรายวิชา COM 3410 Fundamentals of Data Science

---

<div align="center">

**Happy Analyzing! 📊🔬**

*"Data is the new oil, but analytics is the combustion engine."*

</div>
