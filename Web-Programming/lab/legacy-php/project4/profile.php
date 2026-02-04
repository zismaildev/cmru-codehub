<?php
$fullName = "Nattapong Panthiya";

list($firstName, $lastName) = explode(" ", $fullName);

$upper = strtoupper($fullName);
$lower = strtolower($fullName);
$firstUpper = ucfirst($lower);
$wordsUpper = ucwords($lower);

$nameLength = strlen($fullName);
$currentDate = date("2004-02-13");

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Information</title>
</head>
<body>
    <h1>Student Information</h1>
    <p><strong>Full Name:</strong> <?php echo $fullName; ?></p>
    <p><strong>First Name:</strong> <?php echo $firstName; ?></p>
    <p><strong>Last Name:</strong> <?php echo $lastName; ?></p>

    <h2>String Functions</h2>
    <p><strong>Uppercase (strtoupper):</strong> <?php echo $upper; ?></p>
    <p><strong>Lowercase (strtolower):</strong> <?php echo $lower; ?></p>
    <p><strong>First character uppercase (individually):</strong> <?php echo $firstUpper; ?></p>
    <p><strong>Uppercase first character of each word (ucwords):</strong> <?php echo $wordsUpper; ?></p>

    <h2>Character Count</h2>
    <p><strong>Number of characters in full name:</strong> <?php echo $nameLength; ?></p>

    <h2>Current Date</h2>
    <p><?php echo "Current Date: " . $currentDate; ?></p>
</body>
</html>
