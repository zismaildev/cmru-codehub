# Lab 4: K-Means Clustering

## 🎯 วัตถุประสงค์ (Objective)
ใช้อัลกอริทึม **K-Means Clustering** ซึ่งเป็นแบบ Unsupervised Learning สำหรับ "การจัดกลุ่ม" จุดข้อมูลที่มีลักษณะคล้ายกันเข้าไว้ด้วยกันโดยที่ข้อมูลไม่มีเฉลยมาก่อน

## 📝 เนื้อหาใน Lab
1. **Model Parameter (K)**: การกำหนดจำนวนกลุ่มเป้าหมาย ($K$) ที่ต้องการให้โมเดลแบ่ง
2. **KMeans Training**: การรันอัลกอริทึมเพื่อนำจุดศูนย์กลาง (Centroids) ไปวางและปรับตำแหน่งจนกระทั่งนิ่ง
3. **Cluster Visualization**: พล็อต scatter กราฟเพื่อแสดงความชัดเจนของการจัดกลุ่ม พร้อม Mark จุดกึ่งกลาง
4. **Elbow Method (Optional)**: เทคนิคกราฟ "ข้อศอก" เพื่อหาว่าค่า K เท่าไรถึงจะเหมาะสมกับ Dataset ที่สุด

## 🚀 วิธีการรัน (How to Run)
```bash
python 4_k_means_clustering.py
```
