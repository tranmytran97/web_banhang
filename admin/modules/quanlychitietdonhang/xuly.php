<?php
	include ('../config.php');
	$name=$_POST['name'];
	$email=$_POST['email'];
	$address=$_POST['address'];
	$phone_number=$_POST['phone_number'];
	$totalr=$_POST['total'];
	$payment=$_POST['payment'];
	
	
		$id=$_GET['id'];
		$sqli="delete  from customer where id=$id ";
		$sqli="delete  from bills where id=$id ";
		mysqli_query($conn,$sqli);
		header('location:../../index.php?quanly=quanlychitietdonhang&ac=them');
	
?>