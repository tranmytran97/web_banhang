@extends('master')
@section('content')
	<div class="inner-header">
		<div class="container">
			<div class="pull-left">
				<h6 class="inner-title">Thông tin liên hệ</h6>
			</div>
			<div class="pull-right">
				<div class="beta-breadcrumb font-large">
					<a href="{{route('trang-chu')}}">Trang chủ</a> / <span>Liên hệ</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="beta-map">
		
		<div class="abs-fullwidth beta-map wow flipInX"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.1142350162913!2d106.68713131477162!3d10.802561992303815!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317528c53cefbb05%3A0x27beadde9c08bcdf!2zMTA0IFRy4bqnbiBL4bq_IFjGsMahbmcsIFBoxrDhu51uZyA3LCBQaMO6IE5odeG6rW4sIEjhu5MgQ2jDrSBNaW5oLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2s!4v1541344633809" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe></div>
	</div>
	<div class="container">
		<div id="content" class="space-top-none">
			<div class="space50">&nbsp;</div>
			<div class="row">
				<div class="col-sm-8">
				
					<h2>Thông tin</h2>
					<div class="space20">&nbsp;</div>
					<p>Xin để lại Tên,Địa chỉ Email và lời nhắn tại đây chúng tôi sẽ giải đáp thắc mắc nhanh chóng</p>
					<div class="space20">&nbsp;</div>
					<form action="{{route('lienhe')}}" method="post" class="contact-form">
					<input type="hidden" name="_token" value="{{csrf_token()}}">

						@if(Session::has('thanhcong'))
					<div class="alert alert-success">{{Session::get('thanhcong')}}</div>
					@endif

						<div class="form-block">
							
							<input  name="name" type="text" id="name" placeholder="Họ và Tên (required)">
						</div>
						<div class="form-block">
							<input name="email" type="email" id="email" placeholder=" Email (required)">
						</div>
						<div class="form-block">
							<input   name="subject" type="text" id="subject" placeholder="Subject">
						</div>
						<div class="form-block">
							<textarea name="inbox" id="inbox" placeholder="Lời nhắn"></textarea>
						</div>
						<div class="form-block">
							<button type="submit" class="beta-btn primary">Gửi <i class="fa fa-chevron-right"></i></button>
						</div>
					</form>
				</div>
				<div class="col-sm-4">
					<h2>Thông tin liên hệ</h2>
					<div class="space20">&nbsp;</div>

					<h6 class="contact-title">Địa chỉ</h6>
					<p>
						104 Trần Kế Xương <br>
						Phường 7 Quận Phú Nhuận <br>
						TP.HCM
					</p>
					<div class="space20">&nbsp;</div>
					<h6 class="contact-title">Email</h6>
					<p>
						<a href="mailto:biz@betadesign.com">tranmytran1997@gmail.com</a>
					</p>
					<div class="space20">&nbsp;</div>
					<h6 class="contact-title">Điện thoại liên hệ</h6>
					<p>
						Thời gian làm việc:  từ thứ 2 đến thứ 7 (giờ hành chính)

						<a href="hr@betadesign.com">+84 3368802438</a>
					</p>
				</div>
			</div>
		</form>
		</div> <!-- #content -->
	</div> <!-- .container -->
@endsection