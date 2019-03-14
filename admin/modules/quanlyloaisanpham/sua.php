
<?php 
	include ('modules/config.php');
	$id=$_GET['id'];
	$sql="select id,name from type_products where id='$id'";
	$run=mysqli_query($conn,$sql);
	$dong=mysqli_fetch_array($run,MYSQLI_BOTH);
?>
<form action="modules/quanlyloaisanpham/xuly.php?id=<?php echo $dong['id'] ?>" method="post" enctype="multipart/form-data">
	<table width="100%" border="1">
		<tr>
			<td colspan="2" style="text-align: center;">Sửa loại sản phẩm</td>	
		</tr>
		<tr>
			<td>Tên loại sản phẩm</td>
			<td><input type="text" name="tenloaisanpham" value="<?php echo $dong['name']  ?>"></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center; "><input type="submit" name="sua" id="sua" value="Sửa" style="width: 150px;"></td>	
		</tr>
	</table>
</form>