<?php
//control Page
namespace App\Http\Controllers;
use App\Slide;
use App\Product;
use App\ProductType;
use App\Cart;
use App\Customer;
use App\Bill;
use App\BillDetail;
use App\User;
use App\Category;
use App\News;
use App\Comment;
//use Auth;
use Illuminate\Support\Facades\Auth;
use Hash;
use Session;
use Illuminate\Http\Request;

use App\HistoryProduct;


class PageController extends Controller
{
    public  function getIndex(){
        $slide = Slide::all();
        $loaisp = ProductType::all();
        $danhmuc = Category::all();
        // return view('page.trangchu',['slide'=>$slide]);
        $new_product = Product::where('status','<>', 'đã hủy')->where('new',1)->paginate(12);
        $sanpham_khuyenmai = Product::inRandomOrder()->where('promotion_price','<>',0)->paginate(12);
        return view('page.trangchu',compact('slide','new_product','sanpham_khuyenmai','loaisp','danhmuc'));
    }

    public function getLoaiSp($type){
        $sp_loai = Product::where('id_type',$type)->paginate(6);
        $sp_khac = Product::where('id_type','<>',$type)->paginate(8);
        // $sp_khac = Product::where('id_type','<>',$type);
        // $sp_khac = $sp_khac ->paginate(8);
        $loai = ProductType::all();
        $loai_sp = ProductType::where('id',$type)->first();
        return view('page.loai_sanpham',compact('sp_loai','sp_khac','loai','loai_sp'));
    }

    public function getDanhmucSp($type){
        $sp_loai = Product::where('id_category',$type)->paginate(6);
        $sp_khac = Product::where('id_type','<>',$type)->paginate(8);
        $danhmuc = Category::all();
        $loai_sp = Category::where('id',$type)->first();
        return view('page.danhmucsp',compact('sp_loai','sp_khac','danhmuc','loai_sp'));
    }


    //return ra view trang san pham moi
    public function getSpNew(){
        // sap xep hien thi cac san pham moi theo id giam, sp nao add sau xuat hien trc
        $sp_new = Product::orderBy('id', 'desc')->where('status','<>', 'đã hủy')->where('new',1)->paginate(6);

        //lay ban ghi ngau nhien san pham sau do chon ban ghi la hang cu (new =0) phan trang 8 sp 1 trang
        $sp_khac = Product::inRandomOrder()->where('new',0)->paginate(8);
        return view('page.sp_new',compact('sp_new','sp_khac'));
    }

    public function getSpSale(){
        $sp_sale = Product::inRandomOrder()->where('promotion_price','<>',0)->paginate(6);
        $sp_khac = Product::inRandomOrder()->where('new',1)->paginate(6);
        return view('page.sp_sale',compact('sp_sale','sp_khac'));
    }

    public function getChitiet(Request $req){
        $sanpham = Product::where('id',$req->id)->first();
        $comment = Comment::where('id_product',$sanpham->id)->get();
        $sp_tuongtu = Product::where('id_type',$sanpham->id_type)->paginate(4);
        $user = User::all();
        //dd ($comment->All());
        return view('page.chitiet_sanpham',compact('sanpham','sp_tuongtu','comment','user'));
    }

    public function getNews(){
        $tintuc = News::all();
        return view('page.news',compact('tintuc'));
    }

    public function getChitietNews(Request $req,$id)
    {
        $tintuc = News::where('id',$req->id)->first();
        $tintuc_khac = News::where('id','<>',$id)->paginate(8);
        return view('page.news_detail',compact('tintuc','tintuc_khac'));
    }

    public function getLienHe(){
        return view('page.lienhe');
    }

    public function getGioiThieu(){
        return view('page.gioithieu');
    }

    public function getAddtoCart( Request $req,$id){
        $product = Product::find($id);
        $oldCart = Session('cart')?Session::get('cart'):null;
        $cart = new Cart($oldCart);
        $cart->add($product,$id);
        $req->session()->put('cart',$cart);
        return redirect()->back();
    }

    //add vao gio hang o trang chi tiet san pham so luong hang
    public function getAddtoCart12( Request $req,$id){
        $product = Product::find($id);
        $oldCart = Session('cart')?Session::get('cart'):null;
        $cart = new Cart($oldCart);
        $x=0;
        $so_luong = (int)$req->get('so_luong') -1;
        for ((int)$x ; $x<=(int)$so_luong; (int)$x++ ) 
        {
        $cart->add($product,$id);
        }
        $req->session()->put('cart',$cart);
        
        return redirect()->back();
    }

    public function getDelItemCart($id){
        $oldCart = Session::has('cart')?Session::get('cart'):null;
        $cart = new Cart($oldCart);
        $cart->removeItem($id);
        if(count($cart->items)>0){
            Session::put('cart',$cart);
        }
        else{
            Session::forget('cart');
        }
        return redirect()->back();
    }
    public function getCheckout(){
        return view('page.dat_hang');
    }

    public function postCheckout(Request $req){
        $cart = Session::get('cart');
        $customer = new Customer;
        $customer->name = $req->name;
        $customer->gender = $req->gender;
        $customer->email = $req->email;
        $customer->address = $req->address;
        $customer->phone_number = $req->phone;
        $customer->note = $req->notes;
        $customer->save();

        $bill = new Bill;
        $bill->id_customer = $customer->id;
        $bill->date_order = date('Y-m-d');
        $bill->total = $cart->totalPrice;
        $bill->payment = $req->payment_method;
        $bill->note = $req->notes;
        $bill->status = 'Đang xử lý';
        $bill->id_last_user_action = Auth::id();
        //get user by id authen
        $user_get = User::where('id',Auth::id())->first();
        $bill->save();


        //check value count remain product < 0
        foreach ($cart->items as $key1 => $value1) {
            //$product_get = Product::find($key);
            $product_get = Product::where('id',$key1)->first();
            if ($product_get->count_remain < $value1['qty'])
            {
                return redirect()->back()->with('thongbao_sanphamhet', $product_get->name);
            }
        }

        foreach ($cart->items as $key => $value) {
            $bill_detail = new BillDetail;
            $bill_detail->id_bill = $bill->id;
            $bill_detail->id_product = $key;
            $bill_detail->quantity = $value['qty'];
            $bill_detail->unit_price = ($value['price']/$value['qty']);
            $bill_detail->save();


            // $id_bills = $bill_detail->id;
            // $product_get1 = Product::where('id',$key)->first();

           
            //$his_pro1 = HistoryProduct::find($bill->id);
            $his_product_get = HistoryProduct::where('id_bills',$bill->id)->get();

            foreach($his_product_get as $his_pro )
            {
                if ( $user_get->level = 1) 
                {
                    $his_pro->type_user = 'Admin';
                }
                else if ($user_get->level = 2)
                     {
                        $his_pro->type_user = 'Nhân viên kinh doanh';
                     }
                     else
                     { 
                        $his_pro->type_user = 'Người dùng';
                     }


                $his_pro->name_people_action = $user_get->full_name;
                $his_pro->name_customer_order = $customer->name;
                $his_pro->save();
            }
        }
        // Insert to bills

        Session::forget('cart');
        return redirect()->back()->with('thongbao','Đặt Hàng Thành Công!!');
    }

    public function getLogin(){
        return view('page.dangnhap');
    }

    public function getSigin(){
        return view('page.dangky');
    }

    public function postSigin(Request $req){
        $this->validate($req,
            [
                'email'=>'required|email|unique:users,email',
                'password'=>'required|min:6|max:20',
                'fullname'=>'required',
                're_password'=>'required|same:password'
            ],
            [
                'email.required'=>'Vui lòng nhập email',
                'email.email'=>'email không đúng định dạng',
                'email.unique'=>'email đã được sử dụng',
                'password.required'=>'Vui lòng nhập mật khẩu',
                're_password.same'=>'mật khẩu nhập lại không trùng',
                'password.min'=>'mật khẩu ít nhất 6 ký tự'
            ]);
        $user = new User();
        $user->full_name = $req->fullname;
        $user->email = $req->email;
        $user->password = Hash::make($req->password);
        $user->phone = $req->phone;
        $user->address = $req->address;
        // $user->level = $req->level;
        $user->save();
        return redirect()->back()->with('thanhcong','Đăng ký tài khoản thành công!!');
    }

    public function postLogin(Request $req){
        $this->validate($req,
            [
                'email'=>'required|email',
                'password'=>'required|min:6|max:20'
            ],
            [
                'email.required'=>'Vui lòng nhập email',
                'email.email'=>'Email không đúng định dạng',
                'password.required'=>'Vui lòng nhập mật khẩu',
                'password.min'=>'Mật khẩu ít nhất 6 ký tự',
                'password.max'=>'mật khẩu tối đa 20 ký tự'
            ]
        );
        $thong_tin_dang_nhap = array('email'=>$req->email,'password'=>$req->password);
        //attempt  so sanh xem email ton tai k, neu ton tai so sanh pass hash
        if(Auth::attempt($thong_tin_dang_nhap)){
            if (Auth::user()->level==1) {
                return redirect('http://localhost/clothes_shop/public/index');
            }
            else
            return redirect('index');
        }else{
            return redirect()->back()->with(['flag'=>'danger','message'=>'Tài Khoản Hoặc Mật Khẩu Không Đúng!!']);
        }
    }

    public function postLogout(){
        Auth::logout();
        return redirect()->route('trang-chu');
    }

    public function getSearch(Request $req){
        $product = Product::where('name','like','%'.$req->key.'%')
                            ->orWhere('unit_price',$req->key)
                            ->get();
        return view('page.search',compact('product'));
    }
}
