<?php
session_start();
require 'db.php';

// ตรวจสอบว่ามีการส่ง ID ของสินค้า
if (isset($_GET['id'])) {
    $id = $_GET['id'];

    // ดึงข้อมูลสินค้าเพื่อนำไปแสดงในฟอร์ม
    $stmt = $pdo->prepare("SELECT * FROM products WHERE id = ?");
    $stmt->execute([$id]);
    $product = $stmt->fetch(PDO::FETCH_ASSOC);

    // ถ้ามีการส่งข้อมูลเพื่ออัปเดต
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $name = $_POST['name'];
        $price = $_POST['price'];
        $image = $_POST['image'];

        // อัปเดตข้อมูลสินค้าในฐานข้อมูล
        $stmt = $pdo->prepare("UPDATE products SET name = ?, price = ?, image = ? WHERE id = ?");
        if ($stmt->execute([$name, $price, $image, $id])) {
            echo "<script>alert('แก้ไขสินค้าสำเร็จ'); window.location.href='index.php';</script>";
        } else {
            echo "<script>alert('เกิดข้อผิดพลาดในการแก้ไขสินค้า');</script>";
        }
    }
} else {
    echo "<script>alert('ไม่พบสินค้า'); window.location.href='index.php';</script>";
    exit();
}
?>

<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>แก้ไขสินค้า</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>แก้ไขสินค้า</h2>
        <form action="edit_product.php?id=<?php echo $product['id']; ?>" method="post">
            <div class="form-group">
                <label for="name">ชื่อสินค้า</label>
                <input type="text" class="form-control" id="name" name="name" value="<?php echo $product['name']; ?>" required>
            </div>
            <div class="form-group">
                <label for="price">ราคา</label>
                <input type="number" class="form-control" id="price" name="price" value="<?php echo $product['price']; ?>" required>
            </div>
            <div class="form-group">
                <label for="image">URL รูปภาพ</label>
                <input type="text" class="form-control" id="image" name="image" value="<?php echo $product['image']; ?>" required>
            </div>
            <button type="submit" class="btn btn-primary">อัปเดตสินค้า</button>
        </form>
        <a href="index.php" class="btn btn-secondary mt-3">กลับ</a>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
