<?php
	include ('modules/config.php');
	$id=$_GET['id'];
	$sqli="select * from products as a,type_products as b where a.id_type=b.id";
	$run=mysqli_query($conn,$sqli);
	$dong=mysqli_fetch_array($run,MYSQLI_BOTH);
?>
<form action="modules/quanlychitietsanpham/xuly.php?id=<?php echo $dong['id'] ?>" method="post" enctype="multipart/form-data">
<table width="100%" border="1">
	<tr>
		<td colspan="2" style="text-align: center;">Sửa chi tiết sản phẩm</td>
	</tr>
	<tr>
		<td>Tên sản phẩm</td>
		<td><input type="text" name="tensanpham" value="<?php echo $dong['name_products']?>"></td>
	</tr>
	<tr>
		<td>Hình ảnh</td>
		<td><input type="file" name="hinhanh" ><img src="modules/quanlychitietsanpham/uploads/<?php echo $dong['image'] ?>" width="60px" height="60" ></td>
	</tr>
	<tr>
		<td>Gía sản phẩm</td>
		<td><input type="bigint" name="gia" value="<?php echo $dong['unit_price'] ?>"></td>
	</tr>
	<tr>
		<td>Mô tả sản phẩm</td>
		<td><textarea name="motasanpham" cols="35" rows="20" ><?php echo $dong['description'] ?></textarea></td>
	</tr>
	
	<tr>	
		<?php
			$id=$_GET['id'];
			$sqli="select * from type_products";
			$run=mysqli_query($conn,$sqli);
		?>
			<td>Loại sản phẩm</td>
		<td>
			<select name="loaisanpham">
				<?php 
					while ($dong=mysqli_fetch_array($run)){ 
				?>
				<option value="<?php echo $dong['id']; ?>"> <?php echo $dong['name']; ?> </option>
				<?php 
					}
				?>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center;">
			<button style="width: 50px" name="sua" value="Sửa">Sửa</button>
		</td>
	</tr>
</table>
</form>