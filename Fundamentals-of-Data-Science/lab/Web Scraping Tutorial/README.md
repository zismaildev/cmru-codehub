# 🕸️ Web Scraping Tutorial (Advanced)

<div align="center">

![Tech](https://img.shields.io/badge/Tech-Selenium_%26_BeautifulSoup-success?style=for-the-badge)
![Level](https://img.shields.io/badge/Level-Advanced-red?style=for-the-badge)

**"Handling Dynamic Content and Pagination"**

</div>

---

## 🎯 Objective
บทเรียนขั้นสูงสำหรับการดึงข้อมูลจากเว็บไซต์ที่มีความซับซ้อน (Dynamic Web Pages) ที่ใช้ JavaScript หรือมีการแบ่งหน้า (Pagination)

## 🏗️ Scraping Strategy

```mermaid
graph TD
    Start[Start URL] --> Req[Requests/Selenium]
    Req --> Parse[Parse HTML]
    Parse --> Data[Extract Data]
    Data --> Save[Save to List]
    Parse --> Check{Has Next Page?}
    Check -- Yes --> Next[Get Next URL]
    Next --> Req
    Check -- No --> Export[Export to CSV]
```

## 💻 Code Logic
```python
# Pagination handling
while next_button:
    scrape_current_page()
    click_next_page()
    time.sleep(2) # Respect server rate limit
```
