<?php
session_start();

if (!isset($_SESSION['username'])) {
    // หากผู้ใช้ยังไม่ได้ล็อกอิน ให้ส่งกลับไปยังหน้า login
    header("Location: login.php");
    exit();
}

require 'db.php'; // ไฟล์เชื่อมต่อฐานข้อมูล

// ตรวจสอบว่ามีการส่งข้อมูล POST มาหรือไม่
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $product_id = $_POST['product_id'];
    $quantity = $_POST['quantity'];
    $user_id = $_SESSION['user_id']; // ดึง user_id จาก session

    // ดึงข้อมูลสินค้าจากฐานข้อมูล
    $stmt = $pdo->prepare("SELECT * FROM products WHERE id = ?");
    $stmt->execute([$product_id]);
    $product = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$product) {
        // หากไม่พบสินค้า ส่งกลับไปที่หน้าแสดงสินค้าพร้อมแจ้งเตือน
        echo "<script>alert('ไม่พบสินค้าที่เลือก'); window.location.href='index.php';</script>";
        exit();
    }

    // ตรวจสอบว่าผู้ใช้มีสินค้านี้อยู่ในตะกร้าแล้วหรือไม่
    $stmt = $pdo->prepare("SELECT * FROM cart WHERE user_id = ? AND product_id = ?");
    $stmt->execute([$user_id, $product_id]);
    $cart_item = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($cart_item) {
        // ถ้ามีสินค้าอยู่ในตะกร้าแล้ว ให้เพิ่มจำนวนสินค้า
        $new_quantity = $cart_item['quantity'] + $quantity;
        $stmt = $pdo->prepare("UPDATE cart SET quantity = ? WHERE user_id = ? AND product_id = ?");
        $stmt->execute([$new_quantity, $user_id, $product_id]);
    } else {
        // ถ้าไม่มีสินค้านี้อยู่ในตะกร้า ให้เพิ่มสินค้าลงในตาราง cart
        $stmt = $pdo->prepare("INSERT INTO cart (user_id, product_id, quantity) VALUES (?, ?, ?)");
        $stmt->execute([$user_id, $product_id, $quantity]);
    }

    // หลังจากเพิ่มสินค้าลงในตะกร้าแล้วให้ไปที่หน้าแสดงสินค้าหรือหน้าอื่นๆ
    echo "<script>alert('เพิ่มสินค้าลงในตะกร้าเรียบร้อยแล้ว'); window.location.href='index.php';</script>";
    exit();
}
?>
