<?php
$num1 = $_POST['num1'];
$num2 = $_POST['num2'];
$num3 = $_POST['num3'];

$sum = $num1 + $num2 + $num3;
$average = $sum / 3;

echo "<h2>Calculation Results</h2>";
echo "Number 1: " . htmlspecialchars($num1) . "<br>";
echo "Number 2: " . htmlspecialchars($num2) . "<br>";
echo "Number 3: " . htmlspecialchars($num3) . "<br>";
echo "Sum: " . $sum . "<br>";
echo "Average: " . $average . "<br>";
?>
