<?php
require 'db.php';

if (isset($_GET['rain']) && isset($_GET['status'])) {
    $value = intval($_GET['rain']);
    $englishStatus = $_GET['status'];
    
    // แปลงเป็นภาษาไทย
    $status = ($englishStatus == 'raining') ? 'ฝนตก' : 'ฝนไม่ตก';

    $stmt = $conn->prepare("INSERT INTO rain_data (rain_value, status) VALUES (?, ?)");
    $stmt->bind_param("is", $value, $status);

    if($stmt->execute()) {
        echo "Rain Data Inserted";
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
} else {
    echo "Missing Parameters";
}

$conn->close();
?>