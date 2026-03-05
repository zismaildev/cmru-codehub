# Lab 6: Dimensionality Reduction (PCA)

## 🎯 วัตถุประสงค์ (Objective)
เรียนรู้วิธีการแก้ปัญหา "Curse of Dimensionality" (คำสาปของมิติ) โดยใช้เทคนิค **Principal Component Analysis (PCA)** เพื่อลดจำนวน Feature (ตัวแปร) ให้น้อยลงโดยยังพยายามเก็บ "ความแปรปรวน" สำคัญๆ ของข้อมูลไว้

## 📝 เนื้อหาใน Lab
1. **Standardization / Scaling**: การทำ Normalization ข้อมูลก่อนรัน PCA เสมอ (สำคัญมาก)
2. **PCA Transformation**: การสกัดโครงสร้างข้อมูลจากแกนเดิม ไปสู่องค์ประกอบหลัก (Principal Components)
3. **Explained Variance**: การคำนวณและพล็อตกราฟดูว่า แกนใหม่แต่ละแกนสามารถอธิบายข้อมูลได้กี่เปอร์เซ็นต์
4. **Visualizing High-Dimensional Data**: ลดฟีเจอร์สิบกว่าตัวเหลือแค่ 2 ตัวเพื่อให้สามารถพล็อตลง Scatter 2D ดูความสัมพันธ์ด้วยตาเปล่าได้ง่าย

## 🚀 วิธีการรัน (How to Run)
```bash
python 6_dimensionality_reduction_pca.py
```
