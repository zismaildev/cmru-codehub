<?php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}

require 'db.php';

// ตรวจสอบการส่งแบบฟอร์มเพื่อเพิ่มสินค้า
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['action'])) {
    if ($_POST['action'] === 'add') {
        // เพิ่มสินค้าใหม่
        $name = $_POST['name'];
        $price = $_POST['price'];
        $image = $_POST['image'];

        $stmt = $pdo->prepare("INSERT INTO products (name, price, image) VALUES (?, ?, ?)");
        if ($stmt->execute([$name, $price, $image])) {
            echo "<script>alert('เพิ่มสินค้าสำเร็จ'); window.location.href='admin.php';</script>";
        } else {
            echo "<script>alert('เกิดข้อผิดพลาดในการเพิ่มสินค้า');</script>";
        }
    } elseif ($_POST['action'] === 'edit') {
        // แก้ไขสินค้าที่มีอยู่
        $id = $_POST['id'];
        $name = $_POST['name'];
        $price = $_POST['price'];
        $image = $_POST['image'];

        $stmt = $pdo->prepare("UPDATE products SET name = ?, price = ?, image = ? WHERE id = ?");
        if ($stmt->execute([$name, $price, $image, $id])) {
            echo "<script>alert('แก้ไขสินค้าสำเร็จ'); window.location.href='admin.php';</script>";
        } else {
            echo "<script>alert('เกิดข้อผิดพลาดในการแก้ไขสินค้า');</script>";
        }
    }
}

// ตรวจสอบ ID ของสินค้าที่จะทำการแก้ไข
if (isset($_GET['edit'])) {
    $id = $_GET['edit'];
    $stmt = $pdo->prepare("SELECT * FROM products WHERE id = ?");
    $stmt->execute([$id]);
    $product_to_edit = $stmt->fetch(PDO::FETCH_ASSOC);
}

// ดึงสินค้าทั้งหมดจากฐานข้อมูล
$stmt = $pdo->query("SELECT * FROM products");
$products = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>จัดการสินค้า</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Computer Shop</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.php">หน้าแรก</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout.php">ออกจากระบบ</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container mt-4">
        <h2>จัดการสินค้า</h2>
        <form action="admin.php" method="post">
            <div class="form-group">
                <label for="name">ชื่อสินค้า</label>
                <input type="text" class="form-control" id="name" name="name" value="<?php echo isset($product_to_edit) ? $product_to_edit['name'] : ''; ?>" required>
            </div>
            <div class="form-group">
                <label for="price">ราคา</label>
                <input type="number" class="form-control" id="price" name="price" value="<?php echo isset($product_to_edit) ? $product_to_edit['price'] : ''; ?>" required>
            </div>
            <div class="form-group">
                <label for="image">URL รูปภาพ</label>
                <input type="text" class="form-control" id="image" name="image" value="<?php echo isset($product_to_edit) ? $product_to_edit['image'] : ''; ?>" required>
            </div>
            <input type="hidden" name="id" value="<?php echo isset($product_to_edit) ? $product_to_edit['id'] : ''; ?>">
            <input type="hidden" name="action" value="<?php echo isset($product_to_edit) ? 'edit' : 'add'; ?>">
            <button type="submit" class="btn btn-primary"><?php echo isset($product_to_edit) ? 'แก้ไขสินค้า' : 'เพิ่มสินค้า'; ?></button>
        </form>

        <h3 class="mt-4">รายการสินค้า</h3>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">ชื่อสินค้า</th>
                    <th scope="col">ราคา</th>
                    <th scope="col">รูปภาพ</th>
                    <th scope="col">จัดการ</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($products as $product): ?>
                    <tr>
                        <td><?php echo $product['id']; ?></td>
                        <td><?php echo $product['name']; ?></td>
                        <td><?php echo $product['price']; ?></td>
                        <td><img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>" width="50"></td>
                        <td>
                            <a href="?edit=<?php echo $product['id']; ?>" class="btn btn-warning btn-sm">แก้ไข</a>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
