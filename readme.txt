-- dump database : dump_database/db_banhang.sql
--Login với user:
User: user@gmail.com 
Pass: 123456

--Login với Admin:
Admin: admin@gmail.com
Pass: 123456

Trang chủ: http://localhost/clothes_shop/public/index
Trang chủ admin: http://localhost/clothes_shop/public/admin/layout/trangchu

bảo mật: truy cập url có (/admin gọi qua middlewear trong route) check middlewear nếu là admin(type=1) thì mới cho request truy cập nếu không phải admin thì trả về trang đăng nhập lại