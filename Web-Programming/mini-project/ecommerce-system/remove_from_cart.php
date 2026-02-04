<?php
session_start();
require 'db.php';

// ตรวจสอบว่าผู้ใช้เข้าสู่ระบบแล้ว
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

// ลบสินค้าจากตะกร้า
if (isset($_GET['product_id'])) {
    $product_id = $_GET['product_id'];
    $user_id = $_SESSION['user_id'];

    $stmt = $pdo->prepare("DELETE FROM cart WHERE user_id = ? AND product_id = ?");
    $stmt->execute([$user_id, $product_id]);

    header("Location: cart.php");
    exit();
}
?>
