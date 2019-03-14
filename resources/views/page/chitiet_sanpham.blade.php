@extends('master')
@section('content')
	<div class="inner-header">
		<div class="container">
			<div class="pull-left">
				<h6 class="inner-title">Sản phẩm {{$sanpham->name}}</h6>
			</div>
			<div class="pull-right">
				<div class="beta-breadcrumb font-large">
					<a href="{{route('trang-chu')}}">Trang chủ</a> / <span>Thông tin chi tiết sản phẩm</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>

	<div class="container">
		<div id="content">
			<div class="row">
				<div class="col-sm-9">

					<div class="row">
						<div class="col-sm-4">
							<img src="source/image/product/{{$sanpham->image}}" alt="">
						</div>
						<div class="col-sm-8">
							<div class="single-item-body">
								<p class="single-item-title"><h2>{{$sanpham->name}}</h2></p>
								<p class="single-item-price">
									@if($sanpham->promotion_price==0)
										<span class="flash-sale">{{number_format($sanpham->unit_price)}} đồng</span>
									@else
										<span class="flash-del">{{number_format($sanpham->unit_price)}} đồng</span>
										<span class="flash-sale">{{number_format($sanpham->promotion_price)}} đồng</span>
									@endif
								</p>
							</div>

							<div class="clearfix"></div>
							<div class="space20">&nbsp;</div>

							<div class="single-item-desc">
								<p>{{$sanpham->description}}</p>
							</div>
							<div class="space20">&nbsp;</div>

							<p>Số lượng:</p>
							<div class="single-item-options">

								<select class="wc-select" name="color">
									<option>Số lượng</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>
								<a class="add-to-cart" href="{{route('themgiohang',$sanpham->id)}}"><i class="fa fa-shopping-cart"></i></a>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>

					<div class="space40">&nbsp;</div>
					<div class="woocommerce-tabs">
						<ul class="tabs">
							<li><a href="#tab-description">Mô tả</a></li>
						</ul>

						<div class="panel" id="tab-description">
							<p>{{$sanpham->description}}</p>
						</div>
					</div>
					<div class="space50">&nbsp;</div>
					<div class="beta-products-list">
						<h4>Sản phẩm tương tự</h4>

						<div class="row">
							@foreach($sp_tuongtu as $sptt)
								<div class="col-sm-4">
									<div class="single-item">
										@if($sptt->promotion_price!=0)
											<div class="ribbon-wrapper"><div class="ribbon sale">Sale</div></div>
										@endif
										<div class="single-item-header">
											<a href="{{route('chitietsanpham',$sptt->id)}}"><img src="source/image/product/{{$sptt->image}}" alt="" height="150px"></a>
										</div>
										<div class="single-item-body">
											<p class="single-item-title">{{$sptt->name}}</p>
											<p class="single-item-price" style="font-size: 18px">
												@if($sptt->promotion_price==0)
													<span class="flash-sale">{{number_format($sptt->unit_price)}} đồng</span>
												@else
													<span class="flash-del">{{number_format($sptt->unit_price)}} đồng</span>
													<span class="flash-sale">{{number_format($sptt->promotion_price)}} đồng</span>
												@endif
											</p>
										</div>
										<div class="single-item-caption">
											<a class="add-to-cart pull-left" href="{{route('themgiohang',$sptt->id)}}"><i class="fa fa-shopping-cart"></i></a>
											<a class="beta-btn primary" href="{{route('chitietsanpham',$sptt->id)}}">chi tiết<i class="fa fa-chevron-right"></i></a>
											<div class="clearfix"></div>
										</div>
									</div>
								</div>
							@endforeach
						</div>
						<div class="row">{{$sp_tuongtu->links()}}</div>
					</div> <!-- .beta-products-list -->
				</div>
				<div class="col-sm-3 aside">
					<div class="widget">
						<h3 class="widget-title">Thông tin mua hàng</h3>
						<div class="widget-body">
							<div class="pdPolicyWrap">
											<ul class="listPolicy">				
												<li class="item">
													<div class="box">
														<div class="icon">
															<img src="//theme.hstatic.net/1000233206/1000372993/14/product_policy_1.png?v=576" alt="Giao hàng">
														</div>
														<div class="detail">
															<h5>
																Giao hàng
															</h5>
															<span>Miễn phí giao hàng trong nội thành TP.HCM</span>
														</div>
													</div>
												</li>
												
												<li class="item">
													<div class="box">
														<div class="icon">
															<img src="//theme.hstatic.net/1000233206/1000372993/14/product_policy_2.png?v=576" alt="Sản phẩm">
														</div>
														<div class="detail">
															<h5>
																Sản phẩm
															</h5>
															<span>Cam kết hàng mới 100% <div> Bảo hành chính hãng			
														</div>
													</span></div>
												</div></li>
												<li class="item">
													<div class="box">
														<div class="icon">
															<img src="//theme.hstatic.net/1000233206/1000372993/14/product_policy_3.png?v=576" alt="Đổi trả">
														</div>
														<div class="detail">
															<h5>
																Đổi trả
															</h5>	
															<span>Đổi mới sản phẩm từ 7 - 30 ngày</span>	
														</div>
													</div>
												</li>
					
												<li class="item">
													<div class="box">
														<div class="icon">
															<img src="//theme.hstatic.net/1000233206/1000372993/14/product_policy_5.png?v=576" alt="CHẤP NHẬN THANH TOÁN">
														</div>
														<div class="detail">
															<h5>
																CHẤP NHẬN THANH TOÁN
															</h5>
															<span><img src="//theme.hstatic.net/1000233206/1000372993/14/product_policy_5_2.png?v=576"></span>
														</div>
													</div>
												</li>	
												<div class="pdSocaial">
											<h4>
												Chia sẻ ngay
											</h4>
											<div class="box_social">
												<div class="fb">
													<div class="fb-share-button" data-href="https://www.facebook.com/Laptop-HT-1247070752100896/?modal=admin_todo_tour" data-layout="button_count" data-size="large" data-mobile-iframe="false"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fwww.facebook.com%2FLaptop-HT-1247070752100896%2F%3Fmodal%3Dadmin_todo_tour&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Chia sẻ</a></div>
													
												
												<div class="gg">
													<div id="___plus_0" style="text-indent: 0px; margin: 0px; padding: 0px; background: transparent; border-style: none; float: none; line-height: normal; font-size: 1px; vertical-align: baseline; display: inline-block; width: 67px; height: 20px;"><iframe ng-non-bindable="" frameborder="0" hspace="0" marginheight="0" marginwidth="0" scrolling="no" style="position: static; top: 0px; width: 67px; margin: 0px; border-style: none; left: 0px; visibility: visible; height: 20px;" tabindex="0" vspace="0" width="100%" id="I0_1543514068028" name="I0_1543514068028" src="https://apis.google.com/u/0/se/0/_/+1/sharebutton?plusShare=true&amp;usegapi=1&amp;action=share&amp;annotation=none&amp;hl=vi&amp;origin=https%3A%2F%2Fhangchinhhieu.vn&amp;url=https%3A%2F%2Fhangchinhhieu.vn%2Fproducts%2Fmsi-gt83-titan-8rg-037vn&amp;gsrc=3p&amp;ic=1&amp;jsh=m%3B%2F_%2Fscs%2Fapps-static%2F_%2Fjs%2Fk%3Doz.gapi.vi.xYrtb-ZupOY.O%2Fam%3DwQ%2Frt%3Dj%2Fd%3D1%2Frs%3DAGLTcCNtchgKMsoX24iUjHn2Vb6XC9ONrg%2Fm%3D__features__#_methods=onPlusOne%2C_ready%2C_close%2C_open%2C_resizeMe%2C_renderstart%2Concircled%2Cdrefresh%2Cerefresh%2Conload&amp;id=I0_1543514068028&amp;_gfid=I0_1543514068028&amp;parent=https%3A%2F%2Fhangchinhhieu.vn&amp;pfname=&amp;rpctoken=29487340" data-gapiattached="true" title="G+"></iframe></div>
												</div>
											</div>
										</div>
												
											</ul>
										</div>
					</div> <!-- best sellers widget -->
					
					</div> <!-- best sellers widget -->
				</div>
			</div>
		</div> <!-- #content -->
	</div> <!-- .container -->
	
@endsection