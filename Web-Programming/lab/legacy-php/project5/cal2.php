<?php
function add($a, $b) {
    echo "ผลบวกของ $a และ $b คือ: " . ($a + $b) . "<br>";
}

function subtract($a, $b) {
    echo "ผลลบของ $a และ $b คือ: " . ($a - $b) . "<br>";
}

function multiply($a, $b) {
    echo "ผลคูณของ $a และ $b คือ: " . ($a * $b) . "<br>";
}

function divide($a, $b) {
    if ($b != 0) {
        echo "ผลหารของ $a และ $b คือ: " . ($a / $b) . "<br>";
    } else {
        echo "ไม่สามารถหารด้วยศูนย์ได้<br>";
    }
}

add(10, 5);
subtract(10, 5);
multiply(10, 5);
divide(10, 5);
?>
