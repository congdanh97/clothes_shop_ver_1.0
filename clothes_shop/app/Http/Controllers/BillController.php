<?php
//control Hoa Don
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Bill;
use App\BillDetail;
use App\Product;
use App\Customer;
use Illuminate\Support\Facades\Auth;

class BillController extends Controller
{
    // const UPDATED_AT = null;
    //
    public function getDanhSach(){
        $customer = Customer::all();
    	$bill = Bill::where('status','đang xử lý')->paginate(10);
        return view('admin.hoadon_ban.dangxuly',['bill'=>$bill,'customer'=>$customer]);
    }

    public function getChitiet(Request $id){
        $bill = Bill::where('id',$id->id)->first();
        $bill_detail = BillDetail::where('id_bill',$bill->id)->get();
        return view('admin.hoadon_ban.chitietdon',compact('bill','bill_detail'));
    }

    public function getXacNhan(Request $id){
        $customer = Customer::all();
        $bill = Bill::where('status','đã xác nhận')->paginate(10);
        return view('admin.hoadon_ban.da_xac_nhan',compact('bill'));
    }

    public function postXacNhan(Request $id){
        $bill = Bill::find($id);
        $bill = Bill::where('id',$id->id)->first();
        $bill->status = 'đã xác nhận';
        $bill->id_last_user_action=Auth::id();
        $bill->save();
        return redirect()->back()->with('thongbao','Đã Xác Nhận Đơn Hàng!');
    }

    public function getBan(Request $id){
       $customer = Customer::all();
        $bill = Bill::where('status','đã xử lý')->paginate(10);
        return view('admin.hoadon_ban.giao_hang_xong',compact('bill'));
    }

    public function postBan(Request $id){
        $bill = Bill::find($id);
        $bill = Bill::where('id',$id->id)->first();
        $bill->status = 'đã xử lý';
        $bill->id_last_user_action=Auth::id();
        $bill->save();
        return redirect()->back()->with('thongbao','Đã giao hàng cho khách, Hoàn thành đơn!');
    }

      public function getHuy(Request $id){
        $customer = Customer::all();
        $bill = Bill::where('status','đã hủy')->paginate(10);
        return view('admin.hoadon_ban.donhang_huy',compact('bill'));
    }

    public function postHuy(Request $id){
        $bill = Bill::find($id);
        $bill = Bill::where('id',$id->id)->first();
        $bill->status = 'đã hủy';
        $bill->save();

         //add quanty product after cancel order
        $bill_detail_get = BillDetail::where('id_bill',$bill->id)->get();
        foreach($bill_detail_get as $bi )
        {
            $product_get = Product::where('id',$bi->id_product)->first();
            $product_get->count_remain = $product_get->count_remain + $bi->quantity;
            $product_get->save();
        }

        //$product_get = Product::find($key);
        return redirect()->back()->with('thongbao','Đã hủy hàng!');
    }
}
