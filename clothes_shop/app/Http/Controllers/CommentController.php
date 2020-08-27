<?php
//control binh luan
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use App\User;
use App\Comment;
use Illuminate\Support\Facades\Auth;

class CommentController extends Controller
{
    //
    public function getDelete($id,$id_product){
        $comment = Comment::find($id);
        $comment->delete();

        return redirect('admin/sanpham/edit/'.$id_product)->with('thongbao','Xóa bình luận thành công!');
    }

	public function postAdd(Request $req)
    {
    	$comment = new Comment();
        $comment->id_user = Auth::id();
        $comment->id_product = $req->id_san_pham;
        $comment->content = $req->content1;
        $comment->save();
        return redirect( 'chi-tiet-san-pham/'.$req->id_san_pham)->with('thongbao','cảm ơn bạn đã bình luận về sản phẩm!!');
    }

}