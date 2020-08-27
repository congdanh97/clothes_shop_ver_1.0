@extends('admin.layout.index')
@section('content')
    <section class="content-header">
      <h1>
        DANH SÁCH
        <small>Đơn hàng đang chờ xử lý</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Đơn hàng đang chờ xử lý</a></li>
        <li class="active">danh sách</li>
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
									<th>ID</th>
									<th>Tên khách hàng</th>
									<th>Ngày đặt hàng</th>
									<th>Tổng tiền</th>
									<th>Hình thức thanh toán</th>
									<th>Ghi chú</th>
									<th>Trạng thái</th>
									<th>Xử lý</th>
									<th>Hủy</th>
									<th>Chi tiết</th>
								</tr>
							</thead>
							<tbody>
								@foreach($bill as $bi )	
								<tr>
									<td>{{$bi->id}}</td>
									<td>{{$bi->customer['name']}}</td>
									<td>{{$bi->date_order}}</td>
									<td>{{$bi->total}}</td>
									<td>{{$bi->payment}}</td>
									<td>{{$bi->note}}</td>
									<td>Đang chờ xử lý</td>
									<td class="center">
										<form method="post" action="admin/bill/ban/{{$bi->id}}" onsubmit="return confirm('đã giao hàng')">
											{{csrf_field()}}
											<button class="btn btn-primary" type="submit">Đã Giao</button>
										</form>
										
									</td>
									<td class="center">
										<form method="post" action="admin/bill/huy/{{$bi->id}}" onsubmit="return confirm('bạn có chắc muốn hủy?')">
											{{csrf_field()}}
											<button class="btn btn-primary" type="submit">Hủy đơn</button>
										</form>
									</td>
									<td class="center"><a href="admin/bill/chitietdon/{{$bi->id}}"><i class="icon icon"></i> Chi tiết</a></td>
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
	      			<div class="col-sm-7">{{$bill->links()}}</div>
               </div>
				<!-- /task manager table -->

			</div>
			<!-- /main content -->

		</div>
	</div>
</div>
</section>

@endsection