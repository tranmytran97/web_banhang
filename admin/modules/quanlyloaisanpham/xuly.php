<?php
	include ('../config.php');
	$name=$_POST['name'];
	if(isset($_POST['them'])){
		$sqli="insert into type_products(name) values ('$name')";
		mysqli_query($conn,$sqli);
		header('location:../../index.php?quanly=quanlyloaisanpham&ac=them');
	}
	elseif(isset($_POST['sua'])){
		$id=$_GET['id'];
		$sqli="update type_products set name='$name' where id='$id' ";
		mysqli_query($conn,$sqli);
		header('location:../../index.php?quanly=quanlyloaisanpham&ac=sua&id=.$id');
	}else{
		$id=$_GET['id'];
		$sqli="delete from type_products where id='$id' ";
		mysqli_query($conn,$sqli);
		header('location:../../index.php?quanly=quanlyloaisanpham&ac=them');
	}
?>