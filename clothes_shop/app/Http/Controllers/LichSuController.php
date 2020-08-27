<?php
//control Hoa Don
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\HistoryBill;
use App\HistoryProduct;
use App\Product;
use App\Customer;
use App\Bill;
use App\BillDetail;

class LichSuController extends Controller
{
    // const UPDATED_AT = null;
    //
    public function getListActionOnBills(){
        $history_bill = HistoryBill::orderBy('id', 'desc')->paginate(15);
        $customer = Customer::all();
        $bill = Bill::where('status','đang xử lý')->paginate(10);
        return view('admin.lichsu_hanhdong.danhsach_action_order',['bill'=>$bill,'customer'=>$customer,'history_bill'=>$history_bill]);
    }

public function getListActionProducts(){
        $history_products = HistoryProduct::orderBy('id', 'desc')->paginate(15);
        $customer = Customer::all();
        $bill = Bill::where('status','đang xử lý')->paginate(10);
        return view('admin.lichsu_hanhdong.danhsach_action_products',['bill'=>$bill,'customer'=>$customer,'history_products'=>$history_products]);
    }
    

    // public function getChitiet(Request $id){
    //     $bill = Bill::where('id',$id->id)->first();
    //     $bill_detail = BillDetail::where('id_bill',$bill->id)->get();
    //     return view('admin.hoadon_ban.chitietdon',compact('bill','bill_detail'));
    // }

    // public function getBan(Request $id){
    //    $customer = Customer::all();
    //     $bill = Bill::where('status','đã xử lý')->paginate(10);
    //     return view('admin.hoadon_ban.giao_hang_xong',compact('bill'));
    // }

    // public function postBan(Request $id){
    //     $bill = Bill::find($id);
    //     $bill = Bill::where('id',$id->id)->first();
    //     $bill->status = 'đã xử lý';
    //     $bill->save();
    //     return redirect()->back()->with('thongbao','Đã giao hàng!');
    // }

    //   public function getHuy(Request $id){
    //     $customer = Customer::all();
    //     $bill = Bill::where('status','đã hủy')->paginate(10);
    //     return view('admin.hoadon_ban.donhang_huy',compact('bill'));
    // }

    // public function postHuy(Request $id){
    //     $bill = Bill::find($id);
    //     $bill = Bill::where('id',$id->id)->first();
    //     $bill->status = 'đã hủy';
    //     $bill->save();
    //     return redirect()->back()->with('thongbao','Đã hủy hàng!');
    // }
}
