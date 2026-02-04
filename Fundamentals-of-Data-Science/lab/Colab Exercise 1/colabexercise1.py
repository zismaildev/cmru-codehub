# ข้อที่ 1
# ร้านขายหนังสือจัดโปรโมชัน ถ้าลูกค้าซื้อหนังสือ 2 เล่มขึ้นไป และมีมูลค่าเกิน 300 บาท
# ลูกค้าจะได้รับส่วนลด 10% ให้เขียนโปรแกรมในการคำนวณยอดเงินที่ลูกค้าต้องจ่ายตามโปรโมชันที่กำหนด
#
# Sample output1

# How many books: 2
# How much: 1000
# You have to pay 900 bath.

# Sample output2

# How many books: 1
# How much: 500
# You have to pay 500 bath.

# Sample output3

# How many books: 3
# How much: 300
# You have to pay 300 bath.

# เขียนโปรแกรมของนักศึกษาต่อได้เลยค่ะ

num_books = int(input("How many books: "))
total_price = float(input("How much: "))

if num_books >= 2 and total_price > 300:
    discount = total_price * 0.10
    total_price -= discount

print(f"You have to pay {int(total_price) if total_price.is_integer() else total_price:.2f} bath1")

# ข้อที่ 2
# เขียนโปรแกรมรับจำนวนเต็ม จากนั้นพิมพ์จำนวนเต็มดังกล่าวออกมาทีละหลัก หลักละ 1 บรรทัด
# โดยพิมพ์จากหลักหน่วยก่อน

# ตัวอย่างการทำงาน 1

# Enter number: 12437
# 7
# 3
# 4
# 2
# 1

# ตัวอย่างการทำงาน 2

# Enter number: 10000
# 0
# 0
# 0
# 0
# 1

# เขียนโปรแกรมของนักศึกษาต่อได้เลยค่ะ
number = int(input("Enter number: "))

while number > 0:
    digit = number % 10
    print(digit)
    number = number // 10

# ข้อที่ 3
# "Python is a high-level, interpreted, general-purpose programming language. Its design philosophy
# emphasizes code readability with the use of significant indentation.
#
# Python is dynamically-typed and garbage-collected. It supports multiple programming paradigms,
# including structured (particularly procedural), object-oriented and functional programming.
# It is often described as a 'batteries included' language due to its comprehensive standard library.
#
# Guido van Rossum began working on Python in the late 1980s as a successor to the ABC
# programming language and first released it in 1991 as Python 0.9.0. Python 2.0 was released
# in 2000 and introduced new features such as list comprehensions, cycle-detecting garbage
# collection, reference counting, and Unicode support. Python 3.0, released in 2008, was a major
# revision that is not completely backward-compatible with earlier versions. Python 2 was discontinued
# with version 2.7.18 in 2020.

# Python consistently ranks as one of the most popular programming languages."
# จากข้อความด้านบน ให้เขียนโปรแกรมเพื่อนับจำนวนคำว่า "Python" ว่าปรากฏทั้งหมดกี่ครั้ง

# เขียนโปรแกรมของนักศึกษาต่อได้เลยค่ะ
text = """
Python is a high-level, interpreted, general-purpose programming language. Its design philosophy
emphasizes code readability with the use of significant indentation.

Python is dynamically-typed and garbage-collected. It supports multiple programming paradigms,
including structured (particularly procedural), object-oriented and functional programming.
It is often described as a 'batteries included' language due to its comprehensive standard library.

Guido van Rossum began working on Python in the late 1980s as a successor to the ABC
programming language and first released it in 1991 as Python 0.9.0. Python 2.0 was released
in 2000 and introduced new features such as list comprehensions, cycle-detecting garbage
collection, reference counting, and Unicode support. Python 3.0, released in 2008, was a major
revision that is not completely backward-compatible with earlier versions. Python 2 was discontinued
with version 2.7.18 in 2020.

Python consistently ranks as one of the most popular programming languages.
"""

count = text.count("Python")

print(f'The word "Python" appears {count} times')

# ข้อที่ 4
# ให้เขียนโปรแกรมในการนับจำนวนข้อความ (string) ที่เป็นสมาชิกใน list ที่ตรงตามเงื่อนไข คือ เป็น
# ข้อความที่ มีจำนวนตัวอักษร 2 ตัวอักษรขึ้นไป และ มีตัวอักษรตัวแรกและตัวสุดท้ายเหมือนกัน

# Sample List : ['abc', 'xyz', 'aba', '1221', 'กนก']
# Expected Result : 3

# เขียนโปรแกรมของนักศึกษาต่อได้เลยค่ะ
words = ['abc', 'xyz', 'aba', '1221', 'กนก']

count = 0

for word in words:
    if len(word) >= 2 and word[0] == word[-1]:
        count += 1

print("Expected Result:", count)

# ข้อที่ 5
# เขียนโปรแกรมสร้าง dictionary จากข้อความ (string)

# Sample string : 'w3resource'
# Expected output: {'w': 1, '3': 1, 'r': 2, 'e': 2, 's': 1, 'o': 1, 'u': 1, 'c': 1}

# เขียนโปรแกรมของนักศึกษาต่อได้เลยค่ะ
# hint ให้ใช้ method get()    my_dict.get(......)

text = 'w3resource'

char_count = {}

for char in text:
    char_count[char] = char_count.get(char, 0) + 1

print(char_count)