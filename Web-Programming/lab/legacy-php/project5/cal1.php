<?php
function add() {
    $a = 10;
    $b = 5;
    echo "ผลบวกของ $a และ $b คือ: " . ($a + $b) . "<br>";
}

function subtract() {
    $a = 10;
    $b = 5;
    echo "ผลลบของ $a และ $b คือ: " . ($a - $b) . "<br>";
}

function multiply() {
    $a = 10;
    $b = 5;
    echo "ผลคูณของ $a และ $b คือ: " . ($a * $b) . "<br>";
}

function divide() {
    $a = 10;
    $b = 5;
    if ($b != 0) {
        echo "ผลหารของ $a และ $b คือ: " . ($a / $b) . "<br>";
    } else {
        echo "ไม่สามารถหารด้วยศูนย์ได้<br>";
    }
}

add();
subtract();
multiply();
divide();
?>
