<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\ProductType;
use App\Bill;
use Illuminate\Http\Request;

class TotalMonneyController extends Controller
{
    public function getTotalMonney($id_type){
        $bill = Bill::all();
		$total_monney= 0;
        foreach ($bill as $one_bill) 
        {
           $total_monney= $total_monney + $one_bill->total;
        }
    	return view('admin.layout.trangchu',compact('total_monney'));
    }
}
?>