# COM 3604-63 Data Mining (เหมืองข้อมูล)

<div align="center">

![Type](https://img.shields.io/badge/Focus-Data_Analysis_%7C_Machine_Learning-blue?style=for-the-badge)
![Tech](https://img.shields.io/badge/Stack-Python_%7C_Scikit--Learn-3776AB?style=for-the-badge)

**"Discovering hidden patterns and knowledge from massive datasets."**

</div>

---

## 🎯 เกี่ยวกับรายวิชา

รายวิชานี้เน้นการศึกษาหลักการและเทคนิคการทำ **เหมืองข้อมูล (Data Mining)** ซึ่งเป็นกระบวนการค้นหาความสัมพันธ์ รูปแบบ (Patterns) และกฎเกณฑ์ที่ซ่อนอยู่ในชุดข้อมูลขนาดใหญ่ เพื่อนำไปใช้พยากรณ์หรือช่วยในการตัดสินใจ

### Data Mining คืออะไร?
เมื่อยุคดิจิทัลมีข้อมูลเกิดขึ้นมหาศาล (Big Data) ลำพังแค่การเก็บข้อมูลไว้ไม่ก่อให้เกิดประโยชน์สูงสุด Data Mining จึงเข้ามาช่วยทำงานเสมือน "คนขุดเหมือง" เพื่อหาแร่ธาตุ (ความรู้) ที่มีค่าจากกองดิน (ข้อมูลดิบ):
- **Association**: ค้นหาสิ่งที่มักเกิดขึ้นพร้อมกัน (เช่น ซื้อขนมปังแล้วมักซื้อเนย)
- **Classification**: แยกแยะประเภทข้อมูล (เช่น อีเมลนี้เป็นสแปมหรือไม่)
- **Clustering**: จัดกลุ่มสิ่งที่คล้ายกัน (เช่น แบ่งกลุ่มลูกค้าตามพฤติกรรม)
- **Prediction**: ทายผลสิ่งที่จะเกิดในอนาคต (เช่น พยากรณ์ยอดขายเดือนหน้า)

### เนื้อหาหลักที่เรียน
1. **Data Preprocessing** - การเตรียมและทำความสะอาดข้อมูล
2. **Similarity & Distance Measures** - การวัดระยะห่างและความคล้ายคลึง
3. **Classification Techniques** - การจำแนกประเภทข้อมูลที่มีผู้สอน (Supervised)
4. **Clustering Techniques** - การจัดกลุ่มข้อมูลที่ไม่มีผู้สอน (Unsupervised)
5. **Dimensionality Reduction** - การลดมิติของข้อมูลที่ซับซ้อน

---

## 🔑 สิ่งที่เรียนรู้ (Key Learnings)

### 1. Similarity & Distance Measures

#### การวัดระยะห่างขั้นพื้นฐาน
```python
from scipy.spatial import distance
import numpy as np

p1 = np.array([1, 2, 3])
p2 = np.array([4, 5, 6])

# Euclidean Distance (ระยะกระจัด/เส้นตรง)
euclidean = distance.euclidean(p1, p2)

# Manhattan Distance (บวกระยะตามแนวแกน)
manhattan = distance.cityblock(p1, p2)

# Cosine Similarity (ดูทิศทางของเวกเตอร์)
cosine = 1 - distance.cosine(p1, p2)
```

### 2. Classification (Supervised Learning)

#### การจำแนกประเภทด้วย Decision Tree
```python
from sklearn.tree import DecisionTreeClassifier
from sklearn.model_selection import train_test_split

# แบ่งข้อมูลสำหรับสอนและทดสอบ
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3)

# สร้างและสอนโมเดลต้นไม้ตัดสินใจ
clf = DecisionTreeClassifier(criterion='entropy', max_depth=3)
clf.fit(X_train, y_train)

# ทำนายผล
predictions = clf.predict(X_test)
```

#### การประเมินประสิทธิภาพ (Model Evaluation)
```python
from sklearn.metrics import accuracy_score, classification_report, confusion_matrix
import seaborn as sns

# ดูความแม่นยำ
print("Accuracy:", accuracy_score(y_test, predictions))

# ดู Precision, Recall, F1-Score
print(classification_report(y_test, predictions))

# วาดตาราง Confusion Matrix เพื่อความชัดเจน
cm = confusion_matrix(y_test, predictions)
sns.heatmap(cm, annot=True)
```

### 3. Clustering (Unsupervised Learning)

#### การจัดกลุ่มด้วย K-Means
```python
from sklearn.cluster import KMeans
import matplotlib.pyplot as plt

# ให้โมเดลหา 3 กลุ่มที่เหมาะสม
kmeans = KMeans(n_clusters=3, random_state=42)
kmeans.fit(X)

# ดูจุดกึ่งกลางของแต่ละกลุ่ม (Centroids)
print(kmeans.cluster_centers_)

# ทำนายว่าแต่ละ Data Point อยู่กลุ่มไหน
labels = kmeans.predict(X)
plt.scatter(X[:, 0], X[:, 1], c=labels, cmap='viridis')
plt.show()
```

#### Hierarchical Clustering (จัดกลุ่มแบบลำดับชั้น)
```python
from scipy.cluster.hierarchy import dendrogram, linkage
from sklearn.cluster import AgglomerativeClustering

# สร้างแผนภาพต้นไม้ (Dendrogram) เพื่อดูระยะห่างเวลาควบรวมกลุ่ม
Z = linkage(X, 'ward')
dendrogram(Z)

# ตัดตามจำนวนกลุ่มที่ต้องการ
hc = AgglomerativeClustering(n_clusters=3, linkage='ward')
clusters = hc.fit_predict(X)
```

### 4. Dimensionality Reduction

#### PCA (Principal Component Analysis)
```python
from sklearn.decomposition import PCA
from sklearn.preprocessing import StandardScaler

# นอร์มัลไลซ์ข้อมูลก่อนเสมอเพื่อไม่ให้สเกลเพี้ยน
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

# ลดมิติข้อมูลจากมาก ให้เหลือแค่ 2 แกนที่อธิบายความแปรปรวนได้ดีสุด
pca = PCA(n_components=2)
components = pca.fit_transform(X_scaled)

# ดู Variance ที่รักษาไว้ได้
print(pca.explained_variance_ratio_)
```

---

## 📂 โครงสร้างภายใน (Repository Structure)

```
Data-Mining/
├── README.md                ← ไฟล์นี้
└── lab/                     ← ไฟล์ Source Code สำหรับ Lab เหมืองข้อมูล
    ├── 1_similarity_measures.py
    ├── 2_decision_tree_classification.py
    ├── 3_classification_model_evaluation.py
    ├── 4_k_means_clustering.py
    ├── 5_hierarchical_clustering.py
    └── dimensionality_reduction_pca.py
```

---

## 📚 Lab Python Scripts

วิชานี้เน้นการเขียนโค้ด Python โดยใช้ไลบรารีเครื่องมือมาตรฐาน (Scikit-Learn) ในโฟลเดอร์ `lab/` ดังนี้:

### 🟢 การเตรียมข้อมูลและการวัด
- **[Lab 1: Similarity Measures](./lab/1_similarity_measures/)**: เปรียบเทียบระยะห่างเพื่อจำแนกความเหมือนของข้อมูล

### 🟡 Supervised Learning
- **[Lab 2: Decision Tree Classification](./lab/2_decision_tree_classification/)**: การเทรน Tree โมเดลและการใช้งาน
- **[Lab 3: Classification Model Evaluation](./lab/3_classification_model_evaluation/)**: พล็อต Matrix และดูค่าสถิติความจำแนก (Accuracy, Precision, Recall)

### 🟠 Unsupervised Learning
- **[Lab 4: K-Means Clustering](./lab/4_k_means_clustering/)**: การใช้อัลกอริทึม K-Means และหาค่า K ที่ดีที่สุด
- **[Lab 5: Hierarchical Clustering](./lab/5_hierarchical_clustering/)**: จัดกลุ่มเชิงลำดับชั้นและวาดแผนภาพ Dendrogram

### 🔵 Feature Engineering
- **[Lab 6: Dimensionality Reduction (PCA)](./lab/6_dimensionality_reduction_pca/)**: ลดจำนวน Feature ในข้อมูลให้น้อยลงโดยยังคงสาระสำคัญของ Dataset ไว้

---

## 🛠️ เครื่องมือที่ใช้

### ✅ Required
- **[Python](https://www.python.org/)** (3.8+)
- **Libraries:**
  ```bash
  pip install numpy pandas matplotlib seaborn scikit-learn
  ```

### 📦 Optional Tools
- **Jupyter Notebook / Google Colab**: สำหรับการรันและดูผลลัพธ์ทีละ Cell

---

## 🚀 วิธีการรัน (How to Run)

### 📋 Prerequisites
1. ติดตั้ง Python และ Libraries
```bash
pip install numpy pandas matplotlib seaborn scikit-learn scipy
```

### ▶️ รัน Python Script
เปิด Terminal หรือ Command Prompt ไปที่โฟลเดอร์ขิงโปรเจกต์
```bash
cd Data-Mining/lab

# รันไฟล์ที่ต้องการ
python 1_similarity_measures.py
python 4_k_means_clustering.py
```
*เพื่อผลลัพธ์ที่ดี แนะนำให้เปิดด้วย VS Code หรือ IDE ที่สามารถแสดงผล Graphic หรือ Heatmap ได้*

---

## 📖 แนะนำสำหรับรุ่นน้อง

### 🎓 เริ่มต้นอย่างไร?
1. **ทบทวนความน่าจะเป็นและสถิติเบื้องต้น**: เช่น Mean, Variance, Probability พื้นฐานสำคัญมากต่อการตีความ
2. **เข้าใจ Data Types ของ Python รึยัง**: การทำงานส่วนใหญ่มักเป็นการแปลง Dictionary, List ไปเป็น Numpy Array และ Pandas Dataframe
3. **เตรียมข้อมูลคือ 80% ของงาน**: ก่อนนำ 데이터 (Data) โยนใส่โมเดล พยายามเช็ค Missing ค่าขยะ หรือ Outliers ให้เรียบร้อย
4. **ทำไมโมเดลถึงทายผลแบบนี้?**: สำคัญกว่าผลลัพธ์ (Accuracy 99%) คือต้องเข้าใจเงื่อนไขของอัลกอริทึม (เช่นทำไม Tree ถึงเลือกตัด Split จุดนี้)

### 💡 Tips & Best Practices
- **Scaling เสมอเมื่อวัดระยะทาง**: เช่น KNN หรือ KMeans ต้องใช้ `StandardScaler` มิเช่นนั้นฟีเจอร์ที่มีตัวเลขหลักหมื่นจะกลืนฟีเจอร์หลักหน่วย
- **อย่าพึ่งมั่นใจกับ Accuracy เพียงอย่างเดียว**: ถ้าข้อมูลเป็น Imbalanced Class (เช่น มีเคสป่วย 1 คน ใน 100 คนโมเดลทายว่าไม่ป่วยหมดเลยก็ได้ Accuracy 99%) ให้ดู Precision และ Recall ประกอบ
- **Grid Search & Cross-Validation**: ลองใช้ K-Fold และจูนพารามิเตอร์เพื่อหาจุดที่ดีที่สุดให้โมเดล 

### 📚 แหล่งเรียนรู้เพิ่มเติม
- [Scikit-learn Documentation](https://scikit-learn.org/stable/user_guide.html) - ดีที่สุดและครบถ้วนที่สุด 
- [Machine Learning Mastery](https://machinelearningmastery.com/) 
- [Towards Data Science (Medium)](https://towardsdatascience.com/) 

### ⚠️ ข้อผิดพลาดที่พบบ่อย
- ❌ ใช้ข้อมูล Test ไปรวมตอนทำ Data Scaling กฏข้อบังคับ (Fit กับ Data Train แค่นั้นเวลาเอาไป Scale Data Test หรือ Predict ต้อง Transform เท่านั้น)
- ❌ ให้ `random_state` เป็น None (ควรตั้งค่าตอน Development เสมอเพื่อความ Reproducible)
- ❌ โดนคำสาปแห่งจำนวนมิติ (Curse of Dimensionality) ใส่ Feature มาเยอะจนวิเคราะห์ไม่ได้ (ควรใช้ PCA มาช่วย)

---

## 📄 License
โค้ดในโปรเจกต์นี้เป็นส่วนหนึ่งของการเรียนการสอนในรายวิชา COM 3604-63 Data Mining

---

<div align="center">

**Happy Mining! ⛏️💎**

*"Data is meaningful, but the pattern is powerful."*

</div>
