@extends('admin.layout.index')
@section('content')
    <section class="content-header">
      <h1>
        LỊCH SỬ THAY ĐỔI SẢN PHẨM
        <small>kiểm tra lại sự thay đổi các sản phẩm</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Lịch sử</a></li>
        <li class="active">Lịch sử HĐ sản phẩm</li>
      </ol>
    </section>
    <br>
			<!-- Main content -->
			<!-- <div class="content-wrapper"> -->
 <section class="content">
      <div class="row">
        <div class="col-xs-12">
        <div class="box">
                  <!-- /.box-header -->
                  <div class="box-body">
                  		<div class="row">
                  			<div class="col-sm-12">
				<!-- Task manager table -->
				<div class="panel panel-flat" style="width: 100%; border: 1px solid grey;">
					@if(session('thongbao'))
	    		<div class="alert alert-success">
	    			{{session('thongbao')}}
	    		</div>
	    	@endif
					<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>STT</th>
									<th>Mã đơn hàng</th>
									<th>Chức vụ</th>
									<th>Tên </th>
									<th>Hành động</th>

									<th>Giá gốc cũ</th>
									<th>Giá gốc mới</th>
									<th>Giá sale cũ</th>
									<th>Giá sale mới</th>

									<th>đơn vị tiền</th>

									<th>Ảnh</th>
									<th>Số lượng cũ</th>
									<th>Số lượng mới</th>
									<th>Thời gian thực hiện</th>
									<th>Xem chi tiết đơn hàng</th>

								</tr>
							</thead>
							<tbody>
								@foreach($history_products as $hs_products )	
								<tr>
									<td>{{$hs_products->id}}</td>
									<td>{{$hs_products->id_bills}}</td>
									<td>{{$hs_products->type_user}}</td>
									<td>{{$hs_products->name_people_action}}</td>
									<td>{{$hs_products->action}}</td>

									<td>{{$hs_products->old_unit_price}}</td>
									<td>{{$hs_products->new_unit_price}}</td>
									<td>{{$hs_products->old_promotion_price}}</td>
									<td>{{$hs_products->new_promotion_price}}</td>

									<td>{{$hs_products->unit}}</td>
									<td><img src="source/image/product/{{$hs_products->image}}" width="50px" height="50px;"></td>	
									<td>{{$hs_products->old_count_remain}}</td>
									<td>{{$hs_products->new_count_remain}}</td>
									<td>{{$hs_products->time_action}}</td>		
									<td class="center"><a href="admin/bill/chitietdon/{{$hs_products->id_bills}}"><i class="icon icon"></i> Chi tiết</a></td>
								</tr>
								@endforeach
							</tbody>
						</table>
					</div>
				</div>
              </div>
              <div class="row">
	      			<!-- <div class="col-sm-5">
	      				<div class="dataTables_info" id="example1_info" role="status" aria-live="polite">showing 1 to 1 of 1 entries</div>
	      			</div> -->
	      			<div class="col-sm-7">{{$history_products->links()}}</div>
               </div>
				<!-- /task manager table -->

			</div>
			<!-- /main content -->

		</div>
	</div>
</div>
</section>

@endsection