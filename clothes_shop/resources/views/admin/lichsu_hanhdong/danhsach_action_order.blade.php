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
									<th>Chức vụ</th>
									<th>Tên </th>
									<th>Hành động</th>
									<th>ID khách đặt</th>
									<th>ID đơn hàng</th>
									<th>Tên Khách</th>
									<th>Tổng tiền đơn</th>
									<th>Trạng thái cũ</th>
									<th>Trạng thái mới</th>
									<th>Thời gian thực hiện</th>

								</tr>
							</thead>
							<tbody>
								@foreach($history_bill as $hs_bill )	
								<tr>
									<td>{{$hs_bill->id}}</td>
									<td>{{$hs_bill->type_user}}</td>
									<td>{{$hs_bill->name_people_action}}</td>
									<td>{{$hs_bill->action}}</td>
									<td>{{$hs_bill->id_customer}}</td>
									<td>{{$hs_bill->id_bills}}</td>
									<td>{{$hs_bill->name_customer}}</td>
									<td>{{$hs_bill->total_1_bills}}</td>
									<td>{{$hs_bill->old_status}}</td>
									<td>{{$hs_bill->new_status}}</td>
									<td>{{$hs_bill->time_action}}</td>		
									<td class="center"><a href="admin/bill/chitietdon/{{$hs_bill->id_bills}}"><i class="icon icon"></i> Chi tiết</a></td>
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
	      			<div class="col-sm-7">{{$history_bill->links()}}</div>
               </div>
				<!-- /task manager table -->

			</div>
			<!-- /main content -->

		</div>
	</div>
</div>
</section>

@endsection