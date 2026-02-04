<?php
$feedback = htmlspecialchars($_POST['zis']);

echo "<h2>Submitted Feedback</h2>";
echo "Feedback: " . nl2br($feedback);
?>
