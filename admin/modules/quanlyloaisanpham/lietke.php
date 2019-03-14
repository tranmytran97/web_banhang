<?php 
	include ('modules/config.php');
?>
<?php
	//include ('modules/config.php');	
	$sqli= "select id,name from type_products order by id desc";
	$run=mysqli_query($conn,$sqli);
?>
<table width="100%" border="20" bordercolor="#0340E7">
	<tr>
		<td>ID</td>
		<td>Tên sản phẩm</td>
		<td colspan="2">Quản lý</td>
	</tr>
	<?php 
	$i=0;
		while ($dong = mysqli_fetch_array($run,MYSQLI_ASSOC)) {

	 ?>
	<tr>
		<td><?php echo $i  ?></td>
		<td><?php echo $dong['name'] ?></td>
		<td><a href="index.php?quanly=quanlyloaisanpham&ac=sua&id=<?php echo $dong['id'] ?>">Sửa</a></td>
		<td><a href="modules/quanlyloaisanpham/xuly.php?id=<?php echo $dong['id'] ?>">Xóa</a></td>
	</tr>
	<?php
		$i++; 
		}
	?>
</table>