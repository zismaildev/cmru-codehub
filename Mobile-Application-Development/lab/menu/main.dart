import 'package:flutter/material.dart';


void main() {
  runApp(const FoodMenuApp());
}

class FoodMenuApp extends StatelessWidget {
  const FoodMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp เป็น Widget หลักที่ให้ Material Design
    return MaterialApp(
      // ชื่อแอพพลิเคชัน
      title: 'เมนูอาหารไทย',
      // ปิด banner "Debug" มุมขวาบน
      debugShowCheckedModeBanner: false,
      // กำหนดธีมสีของแอพ
      theme: ThemeData(
        // ใช้สี deep orange เป็นสีหลัก
        primarySwatch: Colors.deepOrange,
        // ใช้ Material 3 design
        useMaterial3: true,
      ),
      // กำหนดหน้าแรกของแอพ
      home: const FoodMenuPage(),
    );
  }
}

// Widget สำหรับหน้าแสดงรายการอาหาร (StatelessWidget)
class FoodMenuPage extends StatelessWidget {
  // const constructor
  const FoodMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold เป็น Widget ที่ให้โครงสร้างพื้นฐานของหน้า (AppBar, Body, etc.)
    return Scaffold(
      // AppBar คือแถบด้านบนของหน้า
      appBar: AppBar(
        // ชื่อที่แสดงบน AppBar
        title: const Text(
          'เมนูอาหารไทย',
          // กำหนดสไตล์ของข้อความ
          style: TextStyle(
            fontWeight: FontWeight.bold, // ตัวหนา
            fontSize: 24, // ขนาดตัวอักษร 24
          ),
        ),
        // จัดชื่อให้อยู่ตรงกลาง
        centerTitle: true,
        // สีพื้นหลังของ AppBar
        backgroundColor: Colors.deepOrange,
        // สีของข้อความบน AppBar
        foregroundColor: Colors.white,
        // ความสูงของเงา
        elevation: 4,
      ),
      // Body คือส่วนเนื้อหาหลักของหน้า
      body: Container(
        // กำหนดสีพื้นหลังแบบ gradient
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // gradient จากบนลงล่าง
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            // สีที่ใช้ใน gradient
            colors: [
              Colors.orange.shade50, // สีส้มอ่อน
              Colors.white, // สีขาว
            ],
          ),
        ),
        // ListView.builder สร้างรายการแบบ scrollable และมีประสิทธิภาพ
        child: ListView.builder(
          // padding รอบๆ ListView
          padding: const EdgeInsets.all(16),
          // จำนวนรายการที่จะแสดง (ใช้จำนวนอาหารใน foodList)
          itemCount: foodList.length,
          // ฟังก์ชันสร้าง Widget สำหรับแต่ละรายการ
          itemBuilder: (context, index) {
            // ดึงข้อมูลอาหารจาก list ตาม index
            final food = foodList[index];
            // return Widget ที่จะแสดงสำหรับรายการนี้
            return FoodCard(food: food);
          },
        ),
      ),
    );
  }
}

// Widget สำหรับแสดงการ์ดอาหารแต่ละรายการ
class FoodCard extends StatelessWidget {
  // ตัวแปรเก็บข้อมูลอาหาร (final = ค่าคงที่หลังจากกำหนดแล้ว)
  final Food food;

  // Constructor รับข้อมูลอาหาร
  const FoodCard({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    // Card เป็น Widget ที่สร้างกล่องมีเงา
    return Card(
      // ความโค้งมนของมุม
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      // ความสูงของเงา
      elevation: 6,
      // ระยะห่างระหว่างการ์ด
      margin: const EdgeInsets.only(bottom: 20),
      // ClipRRect ใช้ตัดขอบให้โค้งมน
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        // Column จัดเรียง Widget ในแนวตั้ง
        child: Column(
          // จัดให้ชิดซ้าย
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stack ใช้วาง Widget ซ้อนกัน
            Stack(
              children: [
                // รูปภาพอาหาร (ใช้รูปจาก assets แทนการดึงจากเน็ต)
                Image.asset(
                  food.imageUrl, // path ของรูปภาพใน assets
                  height: 200, // ความสูง 200 pixels
                  width: double.infinity, // ความกว้างเต็มที่
                  fit: BoxFit.cover, // ครอบคลุมพื้นที่โดยรักษาสัดส่วน
                  // แสดงเมื่อโหลดรูปไม่สำเร็จ
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      color: Colors.grey.shade300,
                      child: const Center(
                        child: Icon(
                          Icons.broken_image, // ไอคอนรูปเสีย
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  },
                ),
                // Positioned ใช้วาง Widget ในตำแหน่งที่กำหนดใน Stack
                Positioned(
                  bottom: 0, // ชิดด้านล่าง
                  right: 0, // ชิดด้านขวา
                  // Container สำหรับแสดงราคา
                  child: Container(
                    // padding ภายใน Container
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    // สีพื้นหลังแบบโปร่งแสง
                    decoration: BoxDecoration(
                      color: Colors.deepOrange.withOpacity(0.9),
                      // มุมโค้งเฉพาะมุมบนซ้าย
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                      ),
                    ),
                    // แสดงราคา
                    child: Text(
                      '฿${food.price}', // แสดงราคาพร้อมสัญลักษณ์บาท
                      style: const TextStyle(
                        color: Colors.white, // สีขาว
                        fontSize: 20, // ขนาด 20
                        fontWeight: FontWeight.bold, // ตัวหนา
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Padding เพิ่มระยะห่างรอบๆ
            Padding(
              padding: const EdgeInsets.all(16),
              // Column จัดเรียงข้อความในแนวตั้ง
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ชื่ออาหารภาษาไทย
                  Text(
                    food.nameThai,
                    style: const TextStyle(
                      fontSize: 22, // ขนาดตัวอักษร
                      fontWeight: FontWeight.bold, // ตัวหนา
                      color: Colors.black87, // สีดำอ่อน
                    ),
                  ),
                  // SizedBox ใช้เพิ่มระยะห่างแนวตั้ง
                  const SizedBox(height: 4),
                  // ชื่ออาหารภาษาอังกฤษ
                  Text(
                    food.nameEnglish,
                    style: TextStyle(
                      fontSize: 16, // ขนาดตัวอักษร
                      color: Colors.grey.shade600, // สีเทา
                      fontStyle: FontStyle.italic, // ตัวเอียง
                    ),
                  ),
                  // ระยะห่าง 8 pixels
                  const SizedBox(height: 8),
                  // แถบคั่นแนวนอน
                  Divider(
                    color: Colors.orange.shade200, // สีส้มอ่อน
                    thickness: 1, // ความหนา
                  ),
                  // ระยะห่าง 8 pixels
                  const SizedBox(height: 8),
                  // Row จัดเรียง Widget ในแนวนอน
                  Row(
                    children: [
                      // ไอคอนดาว
                      Icon(
                        Icons.star,
                        color: Colors.amber.shade600,
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                      // ข้อความเรตติ้ง
                      Text(
                        '4.5', // คะแนนตัวอย่าง
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 16),
                      // ไอคอนไฟ (แสดงความเผ็ด)
                      Icon(
                        Icons.local_fire_department,
                        color: Colors.red.shade400,
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                      // ข้อความระดับความเผ็ด
                      Text(
                        'เผ็ดกลาง',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Class สำหรับเก็บข้อมูลอาหาร (Model)
class Food {
  final String nameThai; // ชื่อภาษาไทย
  final String nameEnglish; // ชื่อภาษาอังกฤษ
  final double price; // ราคา
  final String imageUrl; // URL รูปภาพ

  // Constructor สำหรับสร้าง object Food
  Food({
    required this.nameThai,
    required this.nameEnglish,
    required this.price,
    required this.imageUrl,
  });
}

// List เก็บข้อมูลอาหารทั้งหมด (ตัวอย่าง 5 รายการ)
final List<Food> foodList = [
  // รายการที่ 1: ผัดไทย
  Food(
    nameThai: 'ผัดไทยกุ้งสด',
    nameEnglish: 'Pad Thai with Shrimp',
    price: 60.0,
    imageUrl: 'images/pad_thai_noodle_with_shrimps_vegetables_close_up_table.jpg',
  ),
  // รายการที่ 2: ต้มยำกุ้ง
  Food(
    nameThai: 'ต้มยำกุ้ง',
    nameEnglish: 'Tom Yum Goong',
    price: 120.0,
    imageUrl: 'images/thai_chili_tom_yam_soup.jpg',
  ),
  // รายการที่ 3: ข้าวกะเพราหมูสับ
  Food(
    nameThai: 'ข้าวกะเพราหมูสับไข่ดาว',
    nameEnglish: 'Basil Minced Pork with Rice and Fried Egg',
    price: 50.0,
    imageUrl: 'images/basil-minced-pork-with-rice-fried-egg_1150-27369.png',
  ),
  // รายการที่ 4: ข้าวขาหมู
  Food(
    nameThai: 'ข้าวขาหมู',
    nameEnglish: 'Stewed Pork Leg with Rice',
    price: 60.0,
    imageUrl: 'images/stewed_pork_leg_with_rice.png',
  ),
  // รายการที่ 5: ข้าวหมูกรอบ
  Food(
    nameThai: 'ข้าวหมูกรอบ',
    nameEnglish: 'Crispy Pork Belly with Rice',
    price: 55.0,
    imageUrl: 'images/crispy_pork_belly_with_rice.png',
  ),
];


