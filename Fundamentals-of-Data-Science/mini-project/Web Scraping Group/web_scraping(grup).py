import requests
from bs4 import BeautifulSoup
import pandas as pd

url  = 'https://www.set.or.th/th/market/information/member-list/main'
headers = {'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36'}
r = requests.get(url, headers=headers)
r
print(r.status_code)
soup = BeautifulSoup(r.content, 'html.parser')

company = soup.find_all('div', {'class': 'card p-3 market-related-info mt-3'})
company

stock_names = []

for div in company:
    # หา div ที่เป็นชื่อบริษัท (class ตรงกับที่เห็น)
    name_tag = div.find('div', {'class': 'title-font-family fw-bolder text-deep-gray'})
    if name_tag:
        name = name_tag.get_text(strip=True)
        stock_names.append(name)

stock_names

company_names = []

for div in company:
    name_tags = div.find_all('div', {'class': 'title-font-family fw-bolder fs-24px text-deep-gray'})
    if len(name_tags) > 1:
        # ตัวที่สองเป็นชื่อบริษัท
        name = name_tags[1].get_text(strip=True)
        company_names.append(name)

company_names

company_address = []

for div in company:
    # หา div ที่เป็นชื่อบริษัท (class ตรงกับที่เห็น)
    name_tag = div.find('div', {'class': 'default-font-family text-deep-gray'})
    if name_tag:
        name = name_tag.get_text(strip=True)
        company_address.append(name)

company_address

company_contact = []

for div in company:
    # หา div ที่เป็นชื่อบริษัท (class ตรงกับที่เห็น)
    name_tag = div.find('div', {'class': 'default-font-family text-gray phone'})
    if name_tag:
        name = name_tag.get_text(strip=True)
        company_contact.append(name)

company_contact



stocksinfo = pd.DataFrame({
    'Stock Name': stock_names,
    'Company Name': company_names,
    'Company Address': company_address,
    'Company Contact': company_contact
})

stocksinfo

stocksinfo.to_csv("stocks_info.csv", index=False, encoding='utf-8-sig')