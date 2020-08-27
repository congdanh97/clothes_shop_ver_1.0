										<div class="col-md-6">
											<h4 class="text-uppercase">Viết đánh giá của bạn</h4>
											<p>Đại chỉ email của bạn sẽ được công bố11.</p>
											<form class="review-form" method=" post" action ="{{route('add_comment')}}">
											@csrf
												<div class="form-group">
													@if(Auth::check())
													<label>Tên khách hàng:</label>
													<p> {{Auth::user()->full_name}} </p>
													@endif
												</div>
												<div class="form-group">
													@if(Auth::check())
													<label>Địa chỉ Email:</label>
													<input class="input" type="email" name="email" placeholder="Email Address" value="{{Auth::user()->email}}" />
													@endif
												</div>
												<div class="form-group">
													@if(Auth::check())
													<!-- <label>Id:</label> -->
													<input class="input" type="hidden" name="id_user" placeholder="Id" value="{{Auth::user()->id}}" />
													@endif
												</div>

												<div class="form-group">
													@if(Auth::check())
													<!-- <label>Id_san_pham:</label> -->
													<input class="input" type="hidden" name="id_san_pham" placeholder="Id" value="{{$sanpham->id}}" />
													@endif
												</div>
												<div class="form-group">
													<label>Nội dung góp ý:</label>
													<textarea class="input" name="content1" placeholder="Your review"></textarea>
												</div>
												<div class="form-group">
													<div class="input-rating">
														<strong class="text-uppercase">Your Rating: </strong>
														<div class="stars">
															<input type="radio" id="star5" name="rating" value="5" /><label for="star5"></label>
															<input type="radio" id="star4" name="rating" value="4" /><label for="star4"></label>
															<input type="radio" id="star3" name="rating" value="3" /><label for="star3"></label>
															<input type="radio" id="star2" name="rating" value="2" /><label for="star2"></label>
															<input type="radio" id="star1" name="rating" value="1" /><label for="star1"></label>
														</div>
													</div>
												</div>
												<button class="primary-btn" type="submit">Submit</button>
											</form>
										</div>