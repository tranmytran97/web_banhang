<?php 
	include ('../config.php');
	$tensanpham=$_POST['name_products'];
	$gia=$_POST['unit_price'];
	$hinhanh=$_FILES['image']['name_products'];
	$hinhanh_tmp=$_FILES['image']['name_products'];
	move_uploaded_file($hinhanh_tmp,'uploads/'.$hinhanh);
	$motasanpham=$_POST['description'];
	$tenloaisanpham=$_POST['name'];
	if(isset($_POST['them'])){
		$sqli="insert into type_products(name) values ('$tenloaisanpham')";
		$sqli="insert into products(name_products,image,unit_price,description) values ('$tensanpham','$hinhanh','$gia','$motasanpham')";
		
		mysqli_query($conn,$sqli);
		header('location:../../index.php?quanly=quanlychitietsanpham&ac=them');
	}
	elseif(isset($_POST['sua'])){
		if($hinhanh!=''){
			$id=$_GET['id'];
			$sqli="update products set name_products='$tensanpham' , unit_price='$gia', description='$motasanpham' , image='$hinhanh' where id='$id'";
		}else{
			$id=$_GET['id'];
			$sqli="update products set name='$tensanpham' , unit_price='$gia', description='$motasanpham' , id_type='$tenloaisanpham'  where id='$id'";
		}
		mysqli_query($conn,$sqli);
		header('location:../../index.php?quanly=quanlychitietsanpham&ac=sua&id=.$id');
	}else{
		$id=$_GET['id'];
		$sqli="delete from type_products where name='$tenloaisanpham'";
		$sqli="delete from products where id_type='$id'";
		
		mysqli_query($conn,$sqli);
		header('location:../../index.php?quanly=quanlychitietsanpham&ac=them');	
	}
?>