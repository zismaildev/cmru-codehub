<?php
require 'db.php';

if(isset($_GET['temp']) && isset($_GET['hum'])) {
    $temp = floatval($_GET['temp']);
    $hum  = floatval($_GET['hum']);
    $heat = isset($_GET['heat']) ? floatval($_GET['heat']) : 0;

    $stmt = $pdo->prepare("INSERT INTO dht_data (temperature, humidity, heat_index) VALUES (?, ?, ?)");
    if($stmt->execute([$temp, $hum, $heat])) {
        echo "DHT11 Data Inserted";
    } else {
        echo "Error inserting DHT11 data";
    }
} else {
    echo "Missing Parameters";
}
?>
