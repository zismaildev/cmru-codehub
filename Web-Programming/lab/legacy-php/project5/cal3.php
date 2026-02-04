<?php
function add($a, $b) {
    return $a + $b;
}

function subtract($a, $b) {
    return $a - $b;
}

function multiply($a, $b) {
    return $a * $b;
}

function divide($a, $b) {
    if ($b != 0) {
        return $a / $b;
    } else {
        return "ไม่สามารถหารด้วยศูนย์ได้";
    }
}

echo "ผลบวกของ 10 และ 5 คือ: " . add(10, 5) . "<br>";
echo "ผลลบของ 10 และ 5 คือ: " . subtract(10, 5) . "<br>";
echo "ผลคูณของ 10 และ 5 คือ: " . multiply(10, 5) . "<br>";
echo "ผลหารของ 10 และ 5 คือ: " . divide(10, 5) . "<br>";
?>
