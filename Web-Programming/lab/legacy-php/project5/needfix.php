<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>แจ้งเตือนอุปกรณ์ที่ชำรุด</title>
</head>
<body>
    <h1>แจ้งเตือนอุปกรณ์ที่ชำรุด</h1>
    <form method="post" action="">
        <label for="name">ชื่อผู้แจ้ง:</label>
        <input type="text" id="name" name="name" required>
        <br><br>
        <label for="device">ชื่ออุปกรณ์:</label>
        <input type="text" id="device" name="device" required>
        <br><br>
        <label for="details">รายละเอียด:</label>
        <textarea id="details" name="details" rows="4" cols="50" required></textarea>
        <br><br>
        <input type="submit" value="ส่งแจ้งเตือน">
    </form>

    <?php
    // ฟังก์ชันในการส่งข้อความไปยัง Line Notify
    function sendLineNotify($message, $accessToken) {
        $apiUrl = "https://notify-api.line.me/api/notify";
        $data = array('message' => $message);

        $ch = curl_init($apiUrl);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Content-Type: application/x-www-form-urlencoded',
            'Authorization: Bearer ' . $accessToken
        ));
        
        $response = curl_exec($ch);
        $error = curl_error($ch);
        curl_close($ch);

        return array('response' => $response, 'error' => $error);
    }

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $name = isset($_POST['name']) ? htmlspecialchars($_POST['name']) : '';
        $device = isset($_POST['device']) ? htmlspecialchars($_POST['device']) : '';
        $details = isset($_POST['details']) ? htmlspecialchars($_POST['details']) : '';

        if (!empty($name) && !empty($device) && !empty($details)) {
            $accessToken = 'v0IEoOayJGoMWqAM7dxkxvC4k17I1SxkIbYsL0yjtqV';
            $message = "มีการแจ้งเตือนอุปกรณ์ที่ชำรุด\n";
            $message .= "ชื่อผู้แจ้ง: $name\n";
            $message .= "ชื่ออุปกรณ์: $device\n";
            $message .= "รายละเอียด: $details";

            $result = sendLineNotify($message, $accessToken);
            echo "<p>การแจ้งเตือนถูกส่งแล้ว</p>";
            echo "<pre>Response: {$result['response']}</pre>";
            if ($result['error']) {
                echo "<p>cURL Error: {$result['error']}</p>";
            }
        } else {
            echo "<p>กรุณากรอกข้อมูลให้ครบถ้วน</p>";
        }
    }
    ?>
</body>
</html>
