<?php
function getComputerChoice() {
    $choices = ['rock', 'paper', 'scissors'];
    return $choices[array_rand($choices)];
}

function determineWinner($player, $computer) {
    if ($player === $computer) {
        return "เสมอกัน!";
    }

    if (($player === 'rock' && $computer === 'scissors') ||
        ($player === 'scissors' && $computer === 'paper') ||
        ($player === 'paper' && $computer === 'rock')) {
        return "ผู้เล่นชนะ!";
    } else {
        return "คอมพิวเตอร์ชนะ!";
    }
}

$playerChoice = isset($_POST['choice']) ? $_POST['choice'] : null;
$computerChoice = $playerChoice ? getComputerChoice() : null;
$result = $playerChoice ? determineWinner($playerChoice, $computerChoice) : null;
?>

<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <title>เกมเป่า ยิ้ง ฉุบ</title>
</head>
<body>
    <h1>เกมเป่า ยิ้ง ฉุบ</h1>
    <form method="POST">
        <label>
            <input type="radio" name="choice" value="rock" required> ฆ้อน
        </label>
        <label>
            <input type="radio" name="choice" value="paper"> กระดาษ
        </label>
        <label>
            <input type="radio" name="choice" value="scissors"> กรรไกร
        </label>
        <button type="submit">เล่น</button>
    </form>

    <?php if ($playerChoice): ?>
        <h2>ผลลัพธ์</h2>
        <p>ผู้เล่นเลือก: <?php echo htmlspecialchars($playerChoice); ?></p>
        <p>คอมพิวเตอร์เลือก: <?php echo htmlspecialchars($computerChoice); ?></p>
        <h3><?php echo $result; ?></h3>
    <?php endif; ?>
</body>
</html>
