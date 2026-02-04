<?php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}

/**
 * Shopping Cart Controller
 * Handles display and management of user's shopping cart.
 * 
 * Flow:
 * 1. Check Authentication
 * 2. Fetch Cart Items (Joined with Products)
 * 3. Handle Updates/Deletes via POST
 */

require 'db.php';

/** 
 * Fetch Cart Data
 * Retrieves all items in the user's cart including product details.
 * 
 * @var int $user_id From Session
 */
$user_id = $_SESSION['user_id'];
$stmt = $pdo->prepare("
    SELECT cart.*, products.name, products.price 
    FROM cart 
    JOIN products ON cart.product_id = products.id 
    WHERE cart.user_id = ?
");
$stmt->execute([$user_id]);
$cart_items = $stmt->fetchAll(PDO::FETCH_ASSOC);

// ตรวจสอบว่ามีการส่งข้อมูล POST มาหรือไม่
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['update'])) {
        // อัปเดตจำนวนสินค้าในตะกร้า
        $product_id = $_POST['product_id'];
        $quantity = $_POST['quantity'];
        $stmt = $pdo->prepare("UPDATE cart SET quantity = ? WHERE user_id = ? AND product_id = ?");
        $stmt->execute([$quantity, $user_id, $product_id]);
    } elseif (isset($_POST['remove'])) {
        // ลบสินค้าจากตะกร้า
        $product_id = $_POST['product_id'];
        $stmt = $pdo->prepare("DELETE FROM cart WHERE user_id = ? AND product_id = ?");
        $stmt->execute([$user_id, $product_id]);
    }

    // รีเฟรชหน้าเพื่อตรวจสอบการเปลี่ยนแปลง
    header("Location: " . $_SERVER['PHP_SELF']);
    exit();
}
?>

<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ตะกร้าสินค้า</title>
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
        <h2>ตะกร้าสินค้า</h2>
        <?php if (isset($_SESSION['username'])): ?>
            <h1>ตะกร้าสินค้าของ, <?php echo htmlspecialchars($_SESSION['username']); ?></h1>
        <?php endif; ?>
        
        <?php if (empty($cart_items)): ?>
            <p>ตะกร้าของคุณว่างเปล่า</p>
        <?php else: ?>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">ชื่อสินค้า</th>
                        <th scope="col">ราคา</th>
                        <th scope="col">จำนวน</th>
                        <th scope="col">รวม</th>
                        <th scope="col">จัดการ</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($cart_items as $item): ?>
                        <tr>
                            <td><?php echo htmlspecialchars($item['name']); ?></td>
                            <td><?php echo number_format($item['price'], 2); ?> บาท</td>
                            <td>
                                <form action="" method="POST" class="form-inline">
                                    <input type="hidden" name="product_id" value="<?php echo $item['product_id']; ?>">
                                    <input type="number" name="quantity" value="<?php echo $item['quantity']; ?>" min="1" class="form-control" style="width: 70px;">
                                    <button type="submit" name="update" class="btn btn-primary ml-2">อัปเดต</button>
                                </form>
                            </td>
                            <td><?php echo number_format($item['price'] * $item['quantity'], 2); ?> บาท</td>
                            <td>
                                <form action="" method="POST">
                                    <input type="hidden" name="product_id" value="<?php echo $item['product_id']; ?>">
                                    <button type="submit" name="remove" class="btn btn-danger">ลบ</button>
                                </form>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        <?php endif; ?>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
