<?php
	$con=mysqli_connect("localhost","root","","nattapong51") or die("เกิดข้อผิดพลาดเกิดขึ้น");
	if ($con)
	{
		echo " เชื่อมต่อฐานข้อมูลสำเร็จ <br>";
	}
	mysqli_set_charset($con,'utf8');
	$sql="Select * from product420;";
	$result=mysqli_query($con,$sql);
	while ($dbarray=mysqli_fetch_array($result))
	{
	echo "รหัสสินค้า :  ".$dbarray['idProduct']."ชื่อสินค้า :  ".$dbarray['NameProduct']."<p>";
	}
echo "จบการทำงาน";
mysqli_close($con);
?>
