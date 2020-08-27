
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Cơ sở dữ liệu: `db_banhang`
--

-- --------------------------------------------------------

--
-- Các trường trong  bảng `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `total` float DEFAULT NULL COMMENT 'tổng tiền',
  `payment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'trạng thái',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Thêm dữ liệu cho bảng `bills`
--

-- INSERT INTO `bills` (`id`, `id_customer`, `date_order`, `total`, `payment`, `note`, `status`, `created_at`, `updated_at`) VALUES
-- (17, 17, '2020-06-18', 553784000, 'ATM', 'ok tới đây đi em yêu', 'đã xử lý', '2020-06-21 03:55:33', '2020-06-21 03:55:33'),
-- (18, 18, '2020-06-18', 58900000, 'COD', 'ok nào', 'đã xử lý', '2020-06-21 01:52:00', '2020-06-18 15:39:10'),
-- (19, 19, '2020-06-18', 1010000, 'COD', 'Giao hàng trước ngày 2020-06-19', 'đã xử lý', '2020-06-21 01:52:05', '2020-06-18 15:51:29'),
-- (28, 28, '2020-06-19', 6588000, 'COD', 'ok nhanh nhé', 'đã xử lý', '2020-06-21 04:08:05', '2020-06-21 04:08:05'),
-- (24, 24, '2020-06-20', 177534000, 'COD', 'ok', 'đã xử lý', '2020-06-21 04:08:10', '2020-06-21 04:08:10'),
-- (26, 26, '2020-06-21', 7420000, 'ATM', 'ok nhớ giao hàng đúng ngày', 'đã hủy', '2020-06-21 01:52:37', '2020-06-21 10:46:50'),
-- (29, 32, '2020-06-21', 13538000, 'ATM', 'chuyển nhanh cho mình nhé', 'đã hủy', '2020-06-21 04:09:26', '2020-06-21 04:09:26'),
-- (30, 33, '2020-06-21', 115684000, 'ATM', 'mang nhanh qua cho minh nhé.', 'đã hủy', '2020-06-21 04:09:35', '2020-06-21 04:09:35'),
-- (31, 34, '2020-06-21', 56931000, 'COD', 'giao hàng cẩn thận cho mình', 'Đang xử lý', '2020-06-21 04:03:53', '2020-06-21 04:03:53'),
-- (32, 35, '2020-06-21', 6205000, 'COD', 'chuyển hàng cẩn thận nhé', 'đã xử lý', '2020-06-21 04:12:38', '2020-06-21 04:12:38'),
-- (33, 36, '2020-06-23', 474096000, 'COD', 'Ghi Chú', 'Đang xử lý', '2020-06-23 09:25:28', '2020-06-23 09:25:28');

-- --------------------------------------------------------

--
-- Các trường trong  bảng `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bill` int(10) NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(11) NOT NULL COMMENT 'số lượng',
  `unit_price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Thêm dữ liệu cho bảng `bill_detail`
--

-- INSERT INTO `bill_detail` (`id`, `id_bill`, `id_product`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
-- (20, 17, 6, 1, 198716000, '2020-06-18 15:32:44', '2020-06-18 15:32:44'),
-- (21, 17, 8, 2, 177534000, '2020-06-18 15:32:44', '2020-06-18 15:32:44'),
-- (22, 18, 2, 1, 9150000, '2020-06-18 15:39:10', '2020-06-18 15:39:10'),
-- (23, 18, 3, 1, 49750000, '2020-06-18 15:39:10', '2020-06-18 15:39:10'),
-- (24, 19, 61, 1, 1010000, '2020-06-18 15:51:29', '2020-06-18 15:51:29'),
-- (32, 25, 2, 1, 9150000, '2020-06-19 17:14:04', '2020-06-19 17:14:04'),
-- (33, 25, 8, 1, 177534000, '2020-06-19 17:14:04', '2020-06-19 17:14:04'),
-- (34, 26, 5, 1, 7420000, '2020-06-21 10:46:50', '2020-06-21 10:46:50'),
-- (19, 16, 1, 1, 7320000, '2020-06-18 15:15:51', '2020-06-18 15:15:51'),
-- (30, 24, 8, 1, 177534000, '2020-06-19 17:03:46', '2020-06-19 17:03:46'),
-- (31, 25, 1, 1, 7320000, '2020-06-19 17:14:04', '2020-06-19 17:14:04'),
-- (35, 27, 4, 1, 29890000, '2020-06-20 07:03:37', '2020-06-20 07:03:37'),
-- (36, 28, 1, 1, 6588000, '2020-06-19 14:11:03', '2020-06-19 14:11:03'),
-- (37, 29, 1, 1, 6588000, '2020-06-21 03:28:09', '2020-06-21 03:28:09'),
-- (38, 29, 7, 1, 6950000, '2020-06-21 03:28:09', '2020-06-21 03:28:09'),
-- (39, 30, 9, 1, 85794000, '2020-06-21 03:28:44', '2020-06-21 03:28:44'),
-- (40, 30, 4, 1, 29890000, '2020-06-21 03:28:44', '2020-06-21 03:28:44'),
-- (41, 31, 49, 1, 56931000, '2020-06-21 04:03:53', '2020-06-21 04:03:53'),
-- (42, 32, 19, 1, 1855000, '2020-06-21 04:12:14', '2020-06-21 04:12:14'),
-- (43, 32, 30, 1, 1650000, '2020-06-21 04:12:14', '2020-06-21 04:12:14'),
-- (44, 32, 33, 1, 2700000, '2020-06-21 04:12:14', '2020-06-21 04:12:14'),
-- (45, 33, 12, 1, 76664000, '2020-06-23 09:25:28', '2020-06-23 09:25:28'),
-- (46, 33, 6, 2, 198716000, '2020-06-23 09:25:28', '2020-06-23 09:25:28');

-- --------------------------------------------------------

--
-- Các trường trong  bảng `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_type` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_vietnamese_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Thêm dữ liệu cho bảng `category`
--

-- INSERT INTO `category` (`id`, `id_type`, `name`, `description`, `created_at`, `updated_at`) VALUES
-- (1, 1, 'sofa bộ', 'cung cấp các bộ sofa chất lượng', NULL, NULL),
-- (2, 1, 'sofa góc', 'cung cấp các bộ sofa góc chất lượng', NULL, NULL),
-- (3, 1, 'sofa băng dài', 'cung cấp các loại sofa băng dài', NULL, NULL),
-- (4, 1, 'sofa giường', 'cung cấp các loại sofa giường', NULL, NULL),
-- (5, 1, 'ghế thư giãn', '', NULL, NULL),
-- (6, 1, 'Armchair', '', NULL, NULL),
-- (7, 1, 'Bàn trà', '', NULL, NULL),
-- (8, 1, 'Kệ tivi', '', NULL, NULL),
-- (9, 1, 'Vách ốp phòng khách', '', NULL, NULL),
-- (10, 1, 'kệ trang trí tủ sách', '', NULL, NULL),
-- (11, 2, 'Giường ngủ', 'cung cấp các loại giường ngủ cao cấp', '2020-06-18 11:33:07', '2020-06-18 15:47:39'),
-- (12, 2, 'Táp đầu giường', '<p>cung cấp c&aacute;c loại tap đầu giường đẹp chuẩn</p>', '2020-06-18 16:44:28', '2020-06-18 16:44:28'),
-- (13, 2, 'Tủ cá nhân', 'bán các loại tủ cá nhân', '2020-06-18 17:07:58', '2020-06-18 17:07:58'),
-- (14, 2, 'Tủ quần áo', 'bán các loại tủ quần áo', '2020-06-18 17:08:32', '2020-06-18 17:08:32'),
-- (15, 2, 'Bàn trang điểm', 'bán các loại bàn trang điểm', '2020-06-18 17:08:58', '2020-06-18 17:08:58'),
-- (16, 2, 'Kệ tivi phòng ngủ', 'bán các loại kệ tivi', '2020-06-18 17:10:48', '2020-06-18 17:10:48'),
-- (17, 2, 'Bàn làm việc', 'bán các loại bàn làm việc', '2020-06-18 17:11:11', '2020-06-18 17:11:11'),
-- (18, 2, 'Ghế', 'bán các loại ghế', '2020-06-18 17:11:34', '2020-06-18 17:11:34'),
-- (19, 2, 'Vách ốp phòng ngủ', 'bán các loại vách ốp dành cho không gian phòng ngủ của bạn', '2020-06-18 17:12:09', '2020-06-18 17:12:09'),
-- (20, 3, 'Bàn ăn', 'bán các loại bàn ăn với mẫu mã đẹp phù hợp tất cả không gian của ngôi nhà', '2020-06-18 17:13:07', '2020-06-18 17:13:07'),
-- (21, 3, 'Ghế ăn', 'bán các loại ghế ăn', '2020-06-18 17:13:28', '2020-06-18 17:13:28'),
-- (22, 3, 'Tủ buffet', 'cung cấp các loại Tủ buffet', '2020-06-18 17:13:54', '2020-06-18 17:13:54'),
-- (23, 3, 'Tủ rượu', 'cung cấp các mẫu tủ rượu đẹp', '2020-06-18 17:14:29', '2020-06-18 17:14:29'),
-- (24, 3, 'Ghế quầy bar', 'cung cấp các mẫu ghế quầy bar', '2020-06-18 17:14:57', '2020-06-18 17:14:57'),
-- (25, 4, 'Thảm trang trí', 'cung cấp các loại thảm trang trí cho căn phòng của bạn', '2020-06-18 17:15:40', '2020-06-18 17:15:40'),
-- (26, 4, 'Bình hoa', 'cung cấp các mẫu bình hoa trang trí', '2020-06-18 17:16:06', '2020-06-18 17:16:06'),
-- (27, 4, 'Bình trang trí', 'cung cấp các mẫu bình trang trí', '2020-06-18 17:16:28', '2020-06-18 17:16:28'),
-- (28, 4, 'Đèn trang trí', 'cung cấp các mẫu đèn trang trí', '2020-06-18 17:17:05', '2020-06-18 17:17:05'),
-- (29, 4, 'Tranh in hiện đại', 'cung cấp các mẫu tranh in hiện đại', '2020-06-18 17:17:47', '2020-06-18 17:17:47');

-- --------------------------------------------------------

--
-- Các trường trong  bảng `comment`
--

CREATE TABLE `comment` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `id_product` int(10) UNSIGNED NOT NULL,
  `content` varchar(2000) COLLATE utf8_vietnamese_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Thêm dữ liệu cho bảng `comment`
--

-- INSERT INTO `comment` (`id`, `id_user`, `id_product`, `content`, `created_at`, `updated_at`) VALUES
-- (1, 3, 40, 'màu sắc sản phẩm đẹp', '2020-06-19 17:00:00', NULL),
-- (4, 3, 40, 'chất lượng tốt', '2020-06-19 17:00:00', NULL);

-- --------------------------------------------------------

--
-- Các trường trong  bảng `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Thêm dữ liệu cho bảng `customer`
--

-- INSERT INTO `customer` (`id`, `name`, `gender`, `email`, `address`, `phone_number`, `note`, `created_at`, `updated_at`) VALUES
-- (3, 'lê thị tuyết', 'nu', 'tuyet102@gmail.com', 'bigC - tp thanh hóa - thanh hóa', '0369712385', 'Cách big c 300m', '2020-06-18 15:32:44', '2020-06-18 15:32:44'),
-- (4, 'nguyễn công đại', 'nam', 'dai96@gmail.com', '24 Ngọc Trạo - tp thanh hóa - thanh hóa', '0361231124', 'ngõ to ô tô đủ vào', '2020-06-18 15:39:10', '2020-06-18 15:39:10'),
-- (5, 'nguyễn hương giang', 'nam', 'giangmeo@gmail.com', '13 Phố Môi - tp thanh hóa - thanh hóa', '01213219653', 'vận chuyển cẩn thận', '2020-06-23 09:25:28', '2020-06-23 09:25:28');

-- --------------------------------------------------------

--
-- Các trường trong  bảng `employees`
--

CREATE TABLE `employees` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_employees` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL COMMENT 'tên nhân viên',
  `email` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL COMMENT 'email',
  `address` varchar(250) COLLATE utf8_vietnamese_ci NOT NULL COMMENT 'địa chỉ',
  `phone` varchar(20) COLLATE utf8_vietnamese_ci NOT NULL COMMENT 'số điện thoại',
  `gender` varchar(10) COLLATE utf8_vietnamese_ci NOT NULL COMMENT 'giới tính',
  `position` varchar(100) COLLATE utf8_vietnamese_ci NOT NULL COMMENT 'chức vụ',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Thêm dữ liệu cho bảng `employees`
--

INSERT INTO `employees` (`id`, `name_employees`, `email`, `address`, `phone`, `gender`, `position`, `created_at`, `updated_at`) VALUES
(1, 'công danh', 'danh31951@gmail.com', 'tp thanh hóa - thanh hóa', '0941942243', 'nam', 'quản lý', NULL, '2020-06-19 03:16:59'),
(2, 'lê đức', 'ducle99@gmail.com', 'sơn trà - đà nẵng', '0368813131', 'nữ', 'nhân viên kinh doanh', '2020-06-19 03:21:47', '2020-06-19 03:21:47');

-- --------------------------------------------------------

--
-- Các trường trong  bảng `import_bill`
--

CREATE TABLE `import_bill` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_import_bill_detail` int(10) UNSIGNED NOT NULL,
  `total_price` float NOT NULL,
  `id_employees` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Thêm dữ liệu cho bảng `import_bill`
--

-- INSERT INTO `import_bill` (`id`, `id_import_bill_detail`, `total_price`, `id_employees`, `created_at`, `updated_at`) VALUES
-- (1, 2, 91000000, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Các trường trong  bảng `import_bill_detail`
--

CREATE TABLE `import_bill_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_product` int(10) UNSIGNED NOT NULL COMMENT 'mã sản phẩm',
  `id_type_product` int(10) UNSIGNED NOT NULL COMMENT 'mã loại sp',
  `id_category` int(10) UNSIGNED NOT NULL COMMENT 'mã danh mục',
  `id_supplier` int(10) UNSIGNED NOT NULL COMMENT 'mã nhà cung cấp',
  `quantity` int(10) NOT NULL COMMENT 'số lượng',
  `unit_price` float NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Thêm dữ liệu cho bảng `import_bill_detail`
--

-- INSERT INTO `import_bill_detail` (`id`, `id_product`, `id_type_product`, `id_category`, `id_supplier`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
-- (1, 33, 4, 27, 1, 100, 1290000, NULL, NULL),
-- (2, 34, 1, 7, 4, 20, 4550000, NULL, NULL);

-- --------------------------------------------------------

--
-- Các trường trong bảng `news`
--

CREATE TABLE `news` (
  `id` int(10) NOT NULL,
  `title` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'tiêu đề',
  `summary` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tóm tắt',
  `content` varchar(5000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'nội dung',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'hình',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


--
-- Thêm dữ liệu cho bảng `news`
--

INSERT INTO `news` (`id`, `title`, `summary`, `content`, `image`, `created_at`, `updated_at`) VALUES
(1, 'PHONG THỦY PHÒNG KHÁCH', 'tieu de1',  'noi dung bai 1','tranh_treo_tuong.png', '2020-06-18 16:48:10', '2020-06-18 16:48:10'),
(2, 'BÍ QUYẾT CHỌN SOFA CHO PHÒNG KHÁCH NHỎ', 'tieu de 2', 'noi dung bai 2', 'sofa_nho.jpg', '2020-06-18 16:48:10', '2020-06-18 16:48:10'),
(3, '5 CÁCH CHỌN BÀN ĂN PHÙ HỢP CHO PHÒNG KHÁCH', 'tieu de 3',  'noi dung bai 3','5-cach-chon-ban-an-phu-hop-cho-tung-khong-gian-nen-xem-ngay-4.jpg', '2020-06-18 16:48:10', '2020-06-18 16:48:10');

-- --------------------------------------------------------

--
-- Các trường trong  bảng `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_type` int(10) UNSIGNED DEFAULT NULL,
  `id_category` int(10) UNSIGNED DEFAULT NULL,
  `id_supplier` int(11) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `Parameter` varchar(500) COLLATE utf8_unicode_ci NOT NULL COMMENT 'thông số',
  `origin` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'xuất xứ',
  `material` varchar(250) COLLATE utf8_unicode_ci NOT NULL COMMENT 'chất liệu',
  `unit_price` float DEFAULT NULL COMMENT 'giá gốc',
  `promotion_price` float DEFAULT NULL COMMENT 'giá sale',
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'đơn vị',
  `new` tinyint(4) DEFAULT '0',
  `status` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Thêm dữ liệu cho bảng `products`
--

-- INSERT INTO `products` (`id`, `name`, `id_type`, `id_category`, `id_supplier`, `description`, `Parameter`, `origin`, `material`, `unit_price`, `promotion_price`, `image`, `unit`, `new`, `status`, `created_at`, `updated_at`) VALUES
-- (1, 'Táp đầu giường - BRS-H062-ST', 2, 12, 3, 'mẫu mã đẹp, kiểu dáng sang trọng', 'KÍCH THƯỚC L 700   W 435   H 510 (mm', 'Gỗ công nghiệp, cạnh viền bọc da Chân kim loại', 'Xuất xứ Malaysia', 7320000, 6588000, 'brs-h062.5.jpg', 'bộ', 1, 'đã hủy', '2020-06-18 03:00:16', '2020-06-18 07:39:18'),
-- (2, 'Táp đầu giường - BRS-W028-ST', 2, 12, NULL, 'thiết kế sang trọng và đẹp mắt', 'L 800   W 450   H 650 (mm)', 'Xuất xứ Malaysia', 'Gỗ công nghiệp. Bề mặt phủ laminate. Hai mặt bên ốp da. Chân kim loại', 9150000, 8235000, 'brs-w028.5.jpg', 'bộ', 1, NULL, '2020-06-18 03:00:16', '2020-06-19 11:17:10'),
-- (3, 'Giường da - HA319', 2, 11, NULL, 'màu sắc đẹp , độ rộng phù hợp với căn phòng ngủ của bạn.', 'KÍCH THƯỚC L 2120   W 2230   H 970 (mm).KÍCH THƯỚC ĐỆM 1800x2000 (mm)', 'Xuất xứ Trung Quốc. Thương hiệu Hoàn Mỹ', 'Khung giường bằng gỗ tự nhiên Dát giường: plywood kết hợp với khung đỡ bằng sắt sơn tĩnh điện Đầu gi', 49750000, 0, 'ha319.1.jpg', 'bộ', 0, NULL, '2020-06-18 03:00:16', '2020-06-19 11:19:15'),
-- (4, 'Giường-BRS-H062-KB', 2, 11, NULL, 'ĐẶC ĐIỂM NỔI BẬT CỦA GIƯỜNG - BRS-H062-KB\r\nGỗ chưa bao giờ là “hết thời” trong thiết kế phòng ngủ, đặc biệt là dành cho một chiếc giường vững chắc và bền bỉ với thời gian. Các thanh gỗ mộc mạc dưới bàn tay người thợ tạo nên một kết cấu phóng khoáng, trẻ trung mà vẫn giữ được sự ấm áp cho không gian.\r\nYếu tố quan trọng trong các thiết kế giường hiện đại chính là vừa có sự đơn giản, phóng khoáng song vẫn phải thể hiện được sự sang trọng và đẳng cấp không hề thua kém các thiết kế cổ điển hay tân cổ điển. Vì vậy các chi tiết da và nỉ bọc với màu sắc thuần nhất được thêm vào một cách khéo léo, đủ để tạo nên sự khác biệt trong phong cách và vẫn tạo được hiệu ứng thẩm mỹ tinh tế, thanh lịch cùng sự sang trọng vốn hiện hữu của phong cách châu Âu hiện đại. \r\nĐiểm nhấn thú vị trong bộ sưu tập các mẫu giường lần này nằm ở phần kệ đầu giường kiểu cách, được sáng tạo với nhiều hình dạng và kết cấu khác nhau, giúp không gian phòng ngủ có diện mạo hoàn hảo hơn. Phần kệ đầu giường này khi kết hợp hài hào với tổng thể sẽ đem đến một làn gió mới, một ấn tượng mới dành riêng cho không gian. Sở hữu những đường nét thiết kế sang trọng, hiện đại cùng màu sắc tinh tế, thanh lịch, bộ sưu tập giường ngủ mới nhất tại Nội thất Hoàn Mỹ chắc chắn sẽ không khiến bạn thất vọng.', 'KÍCH THƯỚC\r\nL 1988   W 2170   H 1478 (mm)', 'Xuất xứ Malaysia', 'Khung gỗ công nghiệp bọc da và vải màu 6012-4\r\nChân kim loại', 29890000, 0, 'brs-h062.1_1.jpg', 'bộ', 1, NULL, '2020-06-18 03:00:16', '2020-06-19 11:29:19'),
-- (5, ' Bàn trà - BCP-NK-SON-106SH-INOX', 1, 7, NULL, '', '', '', '', 7420000, 0, 'bcp-nk-son-106sh-inox.1.jpg', 'cái', 1, NULL, '2020-06-18 03:00:16', '2020-06-18 22:11:00'),
-- (6, 'Ghế sofa góc Nieri - 100300186', 1, 2, NULL, 'Là bộ sản phẩm độc quyền bán chạy nhất của thương hiệu Nieri từ năm 1992 đến nay, Sofa Corniche có thiết kế mang đậm phong cách cổ điển và truyền thống, phần khung với viền trang trí bằng gỗ óc chó sang trọng, mang đến nét chấm phá mới cho cuộc sống hiện đại. ', '', '', '', 283880000, 198716000, 'ghe-sofa-goc-nieri-10030018-noi-that-hoan-my_1_.jpg', 'bộ', 0, NULL, '2020-06-18 03:00:16', '2020-06-18 22:11:00'),
-- (7, 'Bàn trà mặt đá-BCP-MDV-DCT-CS', 1, 7, NULL, '', '', '', '', 6950000, 0, 'bcp-mdv-dct-cs.1a.jpg', 'cái', 1, NULL, '2020-06-18 03:00:16', '2020-06-18 22:11:00'),
-- (8, 'Ghế sofa da bộ Nieri - 100300113', 1, 1, NULL, '', '', '', '', 253620000, 177534000, 'ghe-sofa-da-bo-nieri-10030011-noi-that-hoan-my_1_.jpg', 'bộ', 0, NULL, '2020-06-18 03:00:16', '2020-06-18 22:11:00'),
-- (9, 'Tủ rượu AFLATUS - VS-13', 3, 23, NULL, '', '', '', '', 142990000, 85794000, 'tu_ruou_vs-13_rsz_compressed.jpg', 'bộ', 0, NULL, '2020-06-18 03:00:16', '2020-06-18 22:11:00'),
-- (11, 'Ghế ăn - HD6789[DH813]', 3, 21, NULL, '', '', '', '', 2170000, 0, 'dh6789.2.jpg', 'cái', 0, NULL, '2020-06-18 02:00:00', '2020-06-18 02:24:00'),
-- (12, 'Ghế sofa bộ Baopo - MG-A2032A-2', 1, 1, NULL, '', '', '', '', 109520000, 76664000, 'bo_sofa_ban_tra_mg_a2032a2_2_rsz_compressed.jpg', 'cái', 0, NULL, '2020-06-18 02:00:00', '2020-06-18 02:24:00'),
-- (13, 'Ghế ăn - 9-09M', 3, 21, NULL, '', '', '', '', 1950000, 0, '9-09m.2.jpg', 'cái', 1, NULL, '2020-06-18 02:00:00', '2020-06-18 02:24:00'),
-- (14, 'Bàn làm việc Baopo - MG-A2020', 2, 17, NULL, '', '', '', '', 40860000, 28602000, 'ban_mg-a2020_rsz_compressed.jpg', 'cái', 0, NULL, '2020-06-18 02:00:00', '2020-06-18 02:24:00'),
-- (15, 'Ghế ăn - 7-10MZ', 3, 21, NULL, '', '', '', '', 1400000, 0, '7-10mz.2.jpg', 'cái', 1, NULL, '2020-06-18 02:00:00', '2020-06-18 02:24:00'),
-- (16, 'Bàn ăn Baopo - MG-2050A-1', 3, 20, NULL, '', '', '', '', 40780000, 28546000, 'ban_an_mg-2050a-1_rsz_compressed.jpg', 'cái', 0, NULL, '2020-06-18 02:00:00', '2020-06-18 02:24:00'),
-- (17, 'Bàn soạn Status - HMPEDIVB305', 2, 17, NULL, '', '', '', '', 47360000, 28416000, 'b.soan_hmpedivb305_1_rsz_compressed.jpg', 'cái', 0, NULL, '2020-06-18 02:00:00', '2020-06-18 02:24:00'),
-- (18, 'Bàn trang điểm - BRS-H062-DS', 2, 15, NULL, '', '', '', '', 25620000, 0, 'brs-h062.12.jpg', 'cái', 0, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (19, 'Bình trang trí - CG641', 4, 27, NULL, '', '', '', '', 1855000, 0, 'cg-641.1.jpg', 'cái', 1, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (20, 'Bàn trang điểm - BP-ARC-PARC09-M2', 2, 15, NULL, '', '', '', '', 21420000, 0, 'bp-arc-parc09-m2_rsz_compressed.jpg', 'cái', 0, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (21, 'Bàn ăn Baopo - JL-A1050b', 3, 20, NULL, '', '', '', '', 37160000, 26012000, 'ban_an_jl-a1050b_rsz_compressed.jpg', 'cái', 0, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (22, '\r\nBình trang trí - CG642', 4, 27, NULL, '', '', '', '', 1290000, 0, 'cg-642.3.jpg', 'cái', 1, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (23, 'Bàn làm việc - BLV-MFC-204SH', 2, 17, NULL, '', '', '', '', 12280000, 0, 'blv-1.jpg', 'cái', 0, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (24, 'Bàn học Hoàn Mỹ - BH-MFC-030SH/941SL', 2, 17, NULL, '', '', '', '', 5250000, 0, 'bh-mfc-030-941sl_gs-mfc-941sl-1_2.jpg', 'cái', 0, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (25, 'Bộ bàn trà phòng ngủ Baopo ', 2, 7, NULL, '', '', '', '', 36130000, 25291000, 'ghe_mg_a2010a_3_rsz_compressed.jpg', 'bộ', 0, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (26, 'Vách ốp phòng ngủ - VOP04-ARC-PARC02', 2, 19, NULL, '', '', '', '', 2880000, 0, '4_40_1.jpg', 'bộ', 0, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (27, 'Ghế bàn ăn Segis - 521001304050', 3, 21, NULL, '', '', '', '', 1290000, 903000, 'ghe-ban-an-segis-52100130-noi-that-hoan-my_1_.jpg', 'cái', 0, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (28, 'Bàn trà - BCP-CN-VHT19-CS (1)', 1, 7, NULL, '', '', '', '', 5660000, 0, 'bcp-cn-vht19-cs.1_1.jpg', 'cái', 1, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (29, 'Vách ốp phòng ngủ - VOP01-MFC-221SH', 2, 19, NULL, '', '', '', '', 2530000, 0, '7_41_3.jpg', 'bộ', 0, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (30, 'Ghế ăn - HD001-BL103', 3, 21, NULL, '', '', '', '', 1650000, 0, 'hd001.2.jpg', 'cái', 1, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (31, 'Tủ rượu Status - HMAVDBLCMP01', 3, 23, NULL, '', '', '', '', 56240000, 33744000, 'hmavdblcmp01-1.jpg', 'cái', 0, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (32, 'Ghế sofa đơn Calia - CAL1018/4410', 1, 5, NULL, '', '', '', '', 41160000, 32928000, '1_10_2.jpg', 'cái', 0, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (33, 'Bình trang trí - CF2204', 4, 27, NULL, '', '', '', '', 2700000, 0, 'cf-2204.1.jpg', 'cái', 1, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (34, 'Bàn trà - BCP-T-VHT19-CS (3)', 1, 7, NULL, '', '', '', '', 4550000, 0, 'bcp-t-vht19-cs.1_1.jpg', 'cái', 1, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (35, 'Sofa vải 2,5 chỗ - A10M/A08-20A', 1, 3, NULL, '', '', '', '', 16820000, 0, 'a08-20a_b_.1.jpg', 'bộ', 1, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (36, 'Ghế sofa góc Omega - KH153L/3005', 1, 2, NULL, '', '', '', '', 63580000, 31790000, 'ghe-sofa-goc-omega-kh153l-3005-noi-that-hoan-my_1_.jpg', 'cái', 0, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (37, 'Bàn ăn Laminate-LK2118I', 3, 20, NULL, '', '', '', '', 21650000, 0, 'ba-3m-ctg-lk2118i.3.jpg', 'cái', 1, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (38, 'Tủ rượu Status - HMPEDIVV105', 3, 23, NULL, '', '', '', '', 52820000, 31692000, 't_hmpediw105_rsz_compressed.jpg', 'cái', 0, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (39, 'Sofa 2 chỗ Calia - 756/115 (2)', 1, 3, NULL, '', '', '', '', 60960000, 30480000, '6_40_1.jpg', 'bộ', 0, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (40, 'Bộ bàn trà phòng ngủ AFLATUS - VS-27', 2, 7, NULL, '', '', '', '', 50290000, 30174000, 'bo_ban_tra_vs-27_rsz_compressed.jpg', 'bộ', 0, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (41, 'Ghế sofa đơn Calia - 52020020', 1, 5, NULL, '', '', '', '', 42520000, 29764000, 'ghe-sofa-don-calia-52020020-noi-that-hoan-my_1__1.jpg', 'cái', 0, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (42, 'Ghế sofa da bộ Omega - 10090181225', 1, 1, NULL, '', '', '', '', 73890000, 59112000, 'ghe-sofa-da-bo-omega-10090181-noi-that-hoan-my_1_.jpg', 'bộ', 0, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (43, 'Sofa da bộ Calia - CAL1013/115', 1, 1, NULL, '', '', '', '', 150180000, 0, 'cal1013_115.jpg', 'bộ', 1, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (44, 'kệ tivi - HKTV01-MFC-106SH', 1, 8, NULL, '', '', '', '', 14930000, 0, '1_22.jpg', 'cái', 0, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (45, 'Kệ tivi Melamine - 21120190', 1, 8, NULL, '', '', '', '', 38050000, 0, 'ke-tivi-melamine-21120190-noi-that-hoan-my_1_.jpg', 'cái', 0, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (46, 'Kệ tivi - KTVM01-MFC-333PL/204SH', 2, 16, NULL, '', '', '', '', 9750000, 0, 'ktvm01-mfc-333pl-204sh-_1950x420x480_.1a.jpg', 'cái', 0, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (47, 'Tủ buffet Marte - 650000144', 3, 22, NULL, ' ', '', '', '', 29600000, 0, 'marte_sideboad_white_pigmented_solid_veneer_oak_4_drawers_2_doors_dr.jpg', 'cái', 0, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (48, 'Tủ buffet Acrylic - 35120020', 3, 22, NULL, '', '', '', '', 20150000, 0, 'tbf-arc-earc11_kt_900x490x1036_1_rsz_compressed.jpg', 'cái', 0, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (49, 'Giường ngủ IMAB - T40258YA', 2, 11, NULL, '', '', '', '', 81330000, 56931000, 'giuong_t40258ya_rsz_compressed.jpg', 'cái', 0, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (50, 'Ghế sofa da bộ Livani - 1007015123', 1, 1, NULL, '', '', '', '', 114090000, 57045000, 'ghe-sofa-da-bo-livani-10070151-noi-that-hoan-my_1_.jpg', 'cái', 0, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (51, 'Sofa 2 chỗ Hoàn Mỹ - Verola/TL-13 (1)', 1, 3, NULL, '', '', '', '', 30080000, 0, 'verola_tl_13_bo_.7c.jpg', 'bộ', 0, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (52, 'Sofa góc Hoàn Mỹ - Veneto (M)-223', 1, 2, NULL, '', '', '', '', 56720000, 0, 'veneto-223_goc_don_.2z.jpg', 'bộ', 0, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (53, 'Ghế armchair - FS17-1', 1, 6, NULL, '', '', '', '', 4200000, 0, 'fs17-1.1.jpg', 'cái', 0, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (54, 'Tranh trang trí - Q-G14044-1', 4, 29, NULL, '', '', '', '', 2600000, 0, '3_23.jpg', 'bức', 1, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (55, 'Ghế armchair - FS16-1', 1, 6, NULL, '', '', '', '', 4550000, 0, 'fs16-1.7.jpg', 'cái', 0, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (56, 'Ghế armchair - 1064A-1P-TX1235', 1, 6, NULL, '', '', '', '', 10360000, 0, '1064a-1p-tx1235-1.jpg', 'cái', 0, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (57, 'Bình trang trí - PE362', 4, 27, NULL, '', '', '', '', 710000, 0, 'pe362.1.jpg', 'bộ', 1, NULL, '2020-06-18 02:20:00', '2020-06-18 03:20:00'),
-- (58, 'Tủ rượu Baopo - JL-A1054', 3, 23, NULL, '', '', '', '', 36680000, 25676000, 'tu_ruou_jl_a1054_rsz_compressed.jpg', '', 0, NULL, '2020-06-18 17:00:00', '2020-06-18 17:00:00'),
-- (59, 'Tủ quần áo Melamine - TA03', 2, 14, NULL, '', '', '', '', 21650000, 0, 'ta03-mfc-873ev-106sh_rsz_compressed_1.jpg', '', 0, NULL, '2020-06-18 17:00:00', '2020-06-18 17:00:00'),
-- (60, 'Tủ quần áo Acrylic - 35120010', 2, 14, NULL, '', '', '', '', 45080000, 0, 'tu-quan-ao-acrylic-35120010-noi-that-hoan-my_1_.jpg', '', 0, 'đã hủy', '2020-06-18 17:00:00', '2020-06-18 07:07:32'),
-- (61, '\r\nBình trang trí - CK741', 4, 27, NULL, '', '', '', '', 1010000, 950000, 'ck741.2.jpg', 'cái', 1, NULL, NULL, NULL),
-- (62, 'Ghế sofa góc Zolano - 1013006766', 1, 2, NULL, 'Với khả năng nâng - hạ phần tựa đầu cùng thiết kế bọc mút tựa lưng tiện dụng, bộ Sofa góc Zolano này chắc chắn mang lại những phút giây thư giãn cho người sử dụng. Chất liệu da bò 100% nhập khẩu Ý mềm mại, màu sắc thời thượng, bộ sofa này sẽ là điểm nhấn độc đáo cho mọi không gian phòng khách!', 'Đôn: L/W 835   P/D 600 (mm) Góc: L/W 3130  P/D 2020  D 1030  H 800 (chưa nâng tựa đầu) /900 (đã nâng tựa đầu) (mm)', 'Zolano, Malaysia', 'Chất liệu: 100% da bò Ý. Khung sofa: Làm bằng gỗ dầu đã qua xử lý và plywood. Chân: Thép mạ crom.', 66220000, 46354000, 'ghe-sofa-goc-zolano-10130067-noi-that-hoan-my_1_.jpg', 'bộ', 1, 'đã hủy', NULL, '2020-06-18 06:57:45');

-- --------------------------------------------------------

--
-- Các trường trong  bảng `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `link` varchar(100) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Thêm dữ liệu cho bảng `slide`
--

INSERT INTO `slide` (`id`, `name`, `link`, `image`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Sang Trọng', '/clothes_shop/public/index', 'NoiThatleMotifsBanner03.jpg', 'noi that sang trong', '2020-06-18 15:32:09', '0000-00-00 00:00:00'),
(2, 'Hiện Đại', '/clothes_shop/public/index', 'bannerthang.png', 'noi that hien dai', '2020-06-18 15:32:16', '0000-00-00 00:00:00'),
(3, 'Cổ Điển', '/clothes_shop/public/index', 'banner-dghm-1.jpg', 'noi that co dien', '2020-06-18 15:32:26', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Các trường trong  bảng `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) UNSIGNED NOT NULL,
  `name_supplier` varchar(250) COLLATE utf8_vietnamese_ci NOT NULL,
  `address` varchar(1000) COLLATE utf8_vietnamese_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_vietnamese_ci NOT NULL,
  `email` varchar(200) COLLATE utf8_vietnamese_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Thêm dữ liệu cho bảng `supplier`
--

-- INSERT INTO `supplier` (`id`, `name_supplier`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
-- (1, 'Công ty Cổ phần Jep Việt Nam', '499 Hoàng Quốc Việt - Cầu Giấy - Hà Nội', '024 320 44 333', 'khoacuacaocap.com.vn@gmail.com', '2020-06-19 14:50:54', '2020-06-19 14:50:54'),
-- (2, 'Công ty TNHH thương mại Paint Trường Phát', 'P 107, TT B8, Khuất Duy Tiến, Thanh Xuân, Hà Nội', '(028) 62982999', 'truongphat.pu@gmail.com', '2020-06-19 14:49:18', '0000-00-00 00:00:00'),
-- (3, 'Công Ty Sàn Gỗ Quang Huy', 'số 201 Cổ Nhuế 2 - Bắc Từ Liêm - Hà Nội', '0982.48.99.12', 'minhtien@mtic.vn', '2020-06-19 14:49:18', '0000-00-00 00:00:00'),
-- (4, 'Công ty CP TCMN Gỗ Liên Minh', '185 Lý Chính Thắng, Phường 7, Quận 3, Tp Hồ Chí Minh, Việt Nam', '07 9999 7657', 'info@hawacorp.com.vn', '2020-06-19 15:20:28', '2020-06-19 15:20:28');

-- --------------------------------------------------------

--
-- Các trường trong  bảng `type_products`
--

CREATE TABLE `type_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Thêm dữ liệu cho bảng `type_products`
--

-- INSERT INTO `type_products` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
-- (1, 'Nội thất phòng khách', 'Những đồ nội thất đẹp dành cho phòng khách', 'anh1.jpg', NULL, NULL),
-- (2, 'Nội thất phòng ngủ', 'Những đồ nội thất cho phòng ngủ bao gồm. giường, tủ quần áo, bàn làm việc, bàn học, bàn trang điểm', 'anh2.jpg', '2020-06-18 02:16:15', '2020-06-18 01:38:35'),
-- (3, 'Nội thất phòng ăn', 'Những đồ nội thất cho phòng ăn bao gồm: bàn ăn , ghế ăn ăn, tủ bếp, tủ rượu, bàn buffer', 'anh3.jpg', '2020-06-18 00:33:33', '2020-06-18 07:25:27'),
-- (4, 'Đồ trang trí', 'Những đồ trang trí cho nội thất như bình thủy tinh, tranh ảnh', 'anh4.jpg', '2020-06-18 03:29:19', '2020-06-18 02:22:22');

-- --------------------------------------------------------

--
-- Các trường trong  bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(3) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Thêm dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `phone`, `address`, `level`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'congdanh', 'congdanh@gmail.com', '$2y$10$ARTatC/TXs2voWkENWLCZOswaky0/v9SaFJPzkRFKORpFmt5WgEtO', '0941942243','thanh hóa', 1, NULL, '2020-06-18 17:05:41', '2020-06-18 17:05:41'),
(2, 'admin', 'admin@gmail.com', '$2y$10$o0ufKYZn9gMLolMWzCqEQeqTozpLl4/Iy0JgL3d5poGN2M8x4vZum', '0941942243', 'hà nội', 1, NULL, '2020-06-18 17:09:58', '2020-06-18 17:09:58'),
(3, 'user', 'user@gmail.com', '$2y$10$o0ufKYZn9gMLolMWzCqEQeqTozpLl4/Iy0JgL3d5poGN2M8x4vZum', '0941942243', 'hà nội', 0, NULL, '2020-06-18 17:09:58', '2020-06-18 17:09:58');



--
-- Tạo khóa cho bảng `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_ibfk_1` (`id_customer`);

--
-- Tạo khóa cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_detail_ibfk_2` (`id_product`);

--
-- Tạo khóa cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_type` (`id_type`);

--
-- Tạo khóa cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_user` (`id_user`);

--
-- Tạo khóa cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Tạo khóa cho bảng `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Tạo khóa cho bảng `import_bill`
--
ALTER TABLE `import_bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_employees` (`id_employees`),
  ADD KEY `id_import_bill_detail` (`id_import_bill_detail`);

--
-- Tạo khóa cho bảng `import_bill_detail`
--
ALTER TABLE `import_bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_type_product` (`id_type_product`),
  ADD KEY `id_category` (`id_category`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Tạo khóa cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Tạo khóa cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id_type_foreign` (`id_type`),
  ADD KEY `id_category` (`id_category`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Tạo khóa cho bảng `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Tạo khóa cho bảng `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Tạo khóa cho bảng `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`id`);

--
-- Tạo khóa cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `import_bill`
--
ALTER TABLE `import_bill`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `import_bill_detail`
--
ALTER TABLE `import_bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT cho bảng `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `type_products`
--
ALTER TABLE `type_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `type_products` (`id`);

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `import_bill`
--
ALTER TABLE `import_bill`
  ADD CONSTRAINT `import_bill_ibfk_1` FOREIGN KEY (`id_employees`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `import_bill_ibfk_2` FOREIGN KEY (`id_import_bill_detail`) REFERENCES `import_bill_detail` (`id`);

--
-- Các ràng buộc cho bảng `import_bill_detail`
--
ALTER TABLE `import_bill_detail`
  ADD CONSTRAINT `import_bill_detail_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `import_bill_detail_ibfk_2` FOREIGN KEY (`id_type_product`) REFERENCES `type_products` (`id`),
  ADD CONSTRAINT `import_bill_detail_ibfk_3` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `import_bill_detail_ibfk_4` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `type_products` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `products_ibfk_3` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id`);
COMMIT;


