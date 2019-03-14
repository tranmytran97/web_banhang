
<?php  include('modules/config.php'); ?>
<?php
	$sqli="select * from products as a,type_products as b where a.id_type=b.id";
	$run=mysqli_query($conn,$sqli);
	$sqli=mysqli_set_charset($conn, 'UTF8');
?>
<table width="100%" border="20" bordercolor="#0340E7">
	<tr>
		<td>ID</td>
		
		<td>Tên sản phẩm</td>
		<td>Hình ảnh</td>
		<td>Gía</td>
		<td>Mô tả</td>
		<td>Loại sản phẩm</td>
		<td colspan="2" style="text-align: center;">Quản lý</td>
	</tr>
	<?php
		$i=1;
		while($dong=mysqli_fetch_array($run,MYSQLI_ASSOC)) {
	?>
	<tr>

	
		<td><?php echo $i ?></td>
		<td><?php echo $dong['name_products'] ?></td>
		<td><img src="modules/quanlychitietsanpham/uploads/<?php echo $dong['image'] ?>" width="60px" height="60"></td>
		<td><?php echo $dong['unit_price'] ?></td>
		<td><?php echo $dong['description'] ?></td>
		<td><?php echo $dong['name'] ?></td>
		<td><a href="index.php?quanly=quanlychitietsanpham&ac=sua&id=<?php echo $dong['id']?>">Sửa</a></td>
		<td><a href="modules/quanlychitietsanpham/xuly.php?id=<?php echo $dong['id'] ?>">Xóa</a></td>
	</tr>
	<?php
	$i++;
		}
	?>
</table>