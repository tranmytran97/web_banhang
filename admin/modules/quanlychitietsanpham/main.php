<div class="center">
	<?php
		if(isset($_GET['ac']))
			$temp=$_GET['ac'];
		else
			$temp='';
		if($temp=='them')
			include ('modules/quanlychitietsanpham/them.php');
		if($temp=='sua')
			include ('modules/quanlychitietsanpham/sua.php'); 
	?>
</div>
<div class="center">
	<?php 
		include ('modules/quanlychitietsanpham/lietke.php');
	?>
</div>