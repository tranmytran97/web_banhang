<?php
	include ('modules/config.php');
?>
<form action="modules/quanlychitietsanpham/xuly.php" method="post" enctype="multipart/form-data">
<table width="100%" border="1">
	<tr>
		<td colspan="2" style="text-align: center;">Thêm chi tiết sản phẩm</td>
	</tr>
	<tr>
		<td>Tên sản phẩm</td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>Hình ảnh</td>
		<td><input type="file" name="image"></td>
	</tr>
	<tr>
		<td>Gía sản phẩm</td>
		<td><input type="bigint" name="unit_price"></td>
	</tr>
	<tr>
		<td>Mô tả sản phẩm</td>
		<td><textarea name="description" cols="30" rows="20"></textarea></td>
	</tr>
	<tr>	
		<?php
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
			<button name="them" value="Thêm">Thêm</button>
		</td>
	</tr>
</table>
</form>