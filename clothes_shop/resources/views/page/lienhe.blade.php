	@extends('master')
	@section('content')
	<div class="inner-header">
		<div class="container">
			<div class="pull-left">
				<br>
				<h3 class="inner-title">SN 71 Phố Môi
				</h3>
			</div>
			<div class="pull-right">
				<div class="beta-breadcrumb font-large">
					<a href="index.html">Home</a> / <span>Contacts</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="container">

		<!-- Get GPS coordinates -->
		<div style="width: 100%"><iframe width="100%" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?width=100%25&amp;height=400&amp;hl=en&amp;q=Ph%E1%BB%91%20M%C3%B4i%20Qu%E1%BA%A3ng%20T%C3%A2m,%20Qu%E1%BA%A3ng%20X%C6%B0%C6%A1ng%20District,%20Thanh%20Hoa,%20Vietnam+(S%E1%BB%91%20nh%C3%A0%2071)&amp;t=h&amp;z=14&amp;ie=UTF8&amp;iwloc=B&amp;output=embed"></iframe><a href="http://www.gps.ie/"></a></div>

</div>
	<div class="container">
		<div id="content" class="space-top-none">
			
			<div class="space50">&nbsp;</div>
			<div class="row">
				<div class="col-sm-8">
					<h2>Liên Hệ</h2>
					<div class="space20">&nbsp;</div>
					<p>Mọi thắc mắc vui lòng điền form dưới đây!</p>
					<div class="space20">&nbsp;</div>
					<form action="#" method="post" class="contact-form">	
						<div class="form-group form-block">
							<input class="input" input name="your-name" type="text" placeholder="Hãy nhập vào tên">
						</div>
						<div class="form-group form-block">
								<input class="input" type="email" name="email" placeholder="expample@gmail.com" required="required" width="20px;">
							</div>
						<div class="form-group form-block">
							<input class="input" input name="your-subject" type="text" placeholder="Chủ đề">
						</div>
						<div class="form-group form-block">
							<textarea name="your-message" cols="70" rows="5" placeholder="Ý kiến của bạn"></textarea>
						</div>
						<div class="form-group form-block">
							<button type="submit" class="beta-btn primary">Gửi Phản Hồi <i class="fa fa-chevron-right"></i></button>
						</div>
					</form>
				</div>
				<div class="col-sm-4">
					<h2>Thông tin liên lạc</h2>
					<div class="space20">&nbsp;</div>

					<h6 class="contact-title">Địa chỉ</h6>
					<p>
						Số nhà 71 Phố Môi,<br>
						TP.Thanh Hóa ,<br>
						Thanh Hóa
					</p>
					<div class="space20">&nbsp;</div>
					<h6 class="contact-title">Mọi thắc mắc xin liên hệ:</h6>
					<p>
						<a>congdanh97nuce@gmail.com</a>
					</p>
					<div class="space20">&nbsp;</div>
					<!-- <h6 class="contact-title">Employment</h6>
					<p>
						We’re always looking for talented persons to <br>
						join our team. <br>
						<a href="hr@betadesign.com">hr@betadesign.com</a>
					</p> -->
				</div>
			</div>
		</div> <!-- #content -->
	</div> <!-- .container -->
	@endsection