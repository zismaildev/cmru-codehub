# Lab 5: Hierarchical Clustering

## 🎯 วัตถุประสงค์ (Objective)
ศึกษาวิธีการจัดกลุ่มข้อมูลอีกประเภทหนึ่งที่เรียกว่า **Hierarchical Clustering (การจัดกลุ่มแบบลำดับชั้น)** ซึ่งมีจุดเด่นที่ไม่ต้องระบุจำนวนกลุ่ม ($K$) ตั้งแต่แรกเหมือน K-Means

## 📝 เนื้อหาใน Lab
1. **Agglomerative Approach**: การจัดกลุ่มแบบ Bottom-Up เริ่มจากแต่ละจุดคือ 1 กลุ่ม ค่อยๆ ควบรวมกลุ่มที่ใกล้กันที่สุดเข้าด้วยกัน
2. **Linkage Criterion**: วิธีการวัดระยะห่างระหว่างจุด เช่น Single, Complete, Average หรือ Ward Linkage
3. **Dendrogram Visualization**: การสร้างโครงสร้างต้นไม้เพื่อดูภาพรวมของการควบรวมกลุ่ม และตัดสินใจว่าจะตัด(Cut)ที่ระดับไหนเพื่อจะได้จำนวนกลุ่มที่พอใจ

## 🚀 วิธีการรัน (How to Run)
```bash
python 5_hierarchical_clustering.py
```
