<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Show Name</title>
</head>
<body>
    <?php
    //loop while
        $i = 1;
        $name = "ณัฐพงษ์ ปันธิยะ<br>";
        while ($i <= 5)
        {
            echo "$i ", "$name   ";
            $i++;
        }

    //loop do while
        $k = 1;
        do {
            echo "$k ", "$name   ";
            $k++;
        } while ($k <= 5);

    // loop for
        for ($j = 1; $j <= 5; $j++) {
            echo "$j ", "$name  ";
        }
    ?>
</body>
</html>
