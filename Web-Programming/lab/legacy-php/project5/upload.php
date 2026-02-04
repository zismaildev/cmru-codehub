<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>อัพโหลดรูปภาพ</title>
</head>
<body>
    <h1>อัพโหลดรูปภาพ</h1>
    <form method="post" action="" enctype="multipart/form-data">
        <label for="image">เลือกไฟล์รูปภาพ:</label>
        <input type="file" id="image" name="image" accept="image/*" required>
        <br><br>
        <input type="submit" value="อัพโหลด">
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        if (isset($_FILES['image']) && $_FILES['image']['error'] == UPLOAD_ERR_OK) {
            $fileTmpPath = $_FILES['image']['tmp_name'];
            $fileName = $_FILES['image']['name'];
            $fileSize = $_FILES['image']['size'];
            $fileType = $_FILES['image']['type'];
            $fileNameCmps = explode(".", $fileName);
            $fileExtension = strtolower(end($fileNameCmps));
            
            $allowedExts = array("jpg", "jpeg", "png", "gif");
            $uploadFileDir = './uploaded_images/';
            
            if (in_array($fileExtension, $allowedExts)) {
                if (!is_dir($uploadFileDir)) {
                    mkdir($uploadFileDir, 0777, true);
                }

                $newFileName = md5(time() . $fileName) . '.' . $fileExtension;
                $dest_path = $uploadFileDir . $newFileName;

                if (move_uploaded_file($fileTmpPath, $dest_path)) {
                    echo "<p>ไฟล์ถูกอัพโหลดสำเร็จ: <a href='$dest_path' target='_blank'>ดูรูปภาพ</a></p>";
                } else {
                    echo "<p>เกิดข้อผิดพลาดในการอัพโหลดไฟล์</p>";
                }
            } else {
                echo "<p>ไฟล์ที่อัพโหลดไม่ถูกต้อง. อนุญาตเฉพาะไฟล์ jpg, jpeg, png, หรือ gif เท่านั้น.</p>";
            }
        } else {
            echo "<p>เกิดข้อผิดพลาดในการอัพโหลดไฟล์. รหัสข้อผิดพลาด: " . $_FILES['image']['error'] . "</p>";
        }
    }
    ?>
</body>
</html>
