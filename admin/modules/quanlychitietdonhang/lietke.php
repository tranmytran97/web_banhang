<?php  include('modules/config.php'); ?>
<?php
	$sqli="select id,name,email,address,phone_number,total,payment from customer as a,bills as b where a.id_customer=b.id_customer";
	$run=mysqli_query($conn,$sqli);
?>
<table width="100%"  border="20" bordercolor="#0340E7">
	<tr>
		<td>ID</td>
		<td>Họ và tên</td>
		<td>Email</td>
		<td>Địa chỉ</td>
		<td>Điện thoại</td>
		<td>Giá</td>
		<td>Thanh toán</td>
	
		<td colspan="2" style="text-align: center;">Quản lý</td>
	</tr>
	<?php
		$i=1;
		while($dong=mysqli_fetch_array($run,MYSQLI_ASSOC)) {
	?>
	<tr>
		<td><?php echo $i  ?></td>
		<td><?php echo $dong['name'] ?></td>
		<td><?php echo $dong['email'] ?></td>
		<td><?php echo $dong['address'] ?></td>
		<td><?php echo $dong['phone_number'] ?></td>
		<td><?php echo $dong['total'] ?></td>
		<td><?php echo $dong['payment'] ?></td>
		
		
		<td><a href="modules/quanlychitietdonhang/xuly.php?id=<?php echo $dong['id'] ?>">Xóa</a></td>
	</tr>
	<?php
	$i++;
		}
	?>
</table>