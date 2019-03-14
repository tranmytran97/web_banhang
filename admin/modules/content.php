<div class="row">
    <div class="col-lg-12">

		<?php
			if(isset($_GET['quanly'])){
				$tam=$_GET['quanly'];
			}else{
				$tam='';
			}
			if($tam=='quanlyloaisanpham'){
				include ('modules/quanlyloaisanpham/main.php');
			}
			
			if($tam=='quanlychitietsanpham'){
				include ('modules/quanlychitietsanpham/main.php');
			}
			
			if($tam=='quanlychitietdonhang'){
				include ('modules/quanlychitietdonhang/main.php');
			}
			
			
			
			
		?>
		</div>
</div>
