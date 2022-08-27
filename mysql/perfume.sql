-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 27, 2022 at 03:21 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perfume`
--

-- --------------------------------------------------------

--
-- Table structure for table `ct_don_hang`
--

CREATE TABLE `ct_don_hang` (
  `CTDH_ID` int(11) NOT NULL,
  `DonHangID` varchar(12) NOT NULL,
  `MaNH` int(11) NOT NULL,
  `SoLuong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `don_hang`
--

CREATE TABLE `don_hang` (
  `DonHangID` varchar(12) NOT NULL,
  `TenDN` varchar(255) NOT NULL,
  `TongDonHang` int(11) NOT NULL,
  `ThanhToan` int(11) NOT NULL,
  `NgayTT` datetime NOT NULL DEFAULT current_timestamp(),
  `DaThanhToan` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gio_hang`
--

CREATE TABLE `gio_hang` (
  `id` int(11) NOT NULL,
  `MaNH` int(11) NOT NULL,
  `TenDN` varchar(255) NOT NULL,
  `SoLuong` int(11) NOT NULL DEFAULT 1,
  `NgayMua` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `nuoc_hoa`
--

CREATE TABLE `nuoc_hoa` (
  `MaNH` int(11) NOT NULL,
  `TenNH` varchar(255) NOT NULL,
  `MoTa` text NOT NULL,
  `HinhAnh` varchar(255) NOT NULL,
  `Gia` int(11) NOT NULL,
  `MaTL` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nuoc_hoa`
--

INSERT INTO `nuoc_hoa` (`MaNH`, `TenNH`, `MoTa`, `HinhAnh`, `Gia`, `MaTL`) VALUES
(1, 'Nước hoa nữ Chanel No.5 Eau De Parfum', 'Đây là dòng nước hoa nữ đầu tiên của hãng Chanel nổi tiếng. Chanel No.5 – một sản phẩm huyền thoại đã đồng hành với nhiều cô gái ở mọi độ tuổi suốt cả một thập kỷ qua. Sở hữu hương thơm đầy mê hoặc, Chanel No.5 đã làm say đắm biết bao tâm hồn thiếu nữ.', '/assets/product/1.jpg\r\n', 4400000, 2),
(2, 'Nước hoa nữ D&G Velvet Cypress', 'Ra mắt từ năm 2017 nhưng đến nay D&G Velvet Cypress vẫn luôn là sự lựa chọn của rất nhiều bạn gái. Chai nước hoa nữ với thiết kế lọ thủy tinh sang trọng, đầy cuốn hút với màu xanh lá bắt mắt mang đến mùi hương độc lạ mê hoặc biết bao người từ những cô gái trẻ đến các quý bà sang trọng.', '/assets/product/2.jpg', 5600000, 2),
(3, 'Nước hoa nữ chính hãng Dior J’adore', 'Sản phẩm có khả năng lưu hương rất lâu dù chỉ với một lượng nhỏ. Hương thơm dịu nhẹ của J’adore cực kỳ gợi cảm, tinh tế, quyến rũ, chắc chắn sẽ làm siêu lòng bất kỳ ai.\r\nNăm phát hành:1999\r\nGiới tính:Nữ\r\nPhong cách:Gợi cảm, nữ tính, thanh lịch', '/assets/product/3.jpg\r\n', 3500000, 2),
(4, 'Nước Hoa Nữ Chanel Gabrielle EDP, 100ml\r\n', 'Nếu đang tìm kiếm dòng nước hoa tôn vinh nét đẹp quyến rũ của người phụ nữ thì nhất định phải biết đến nước hoa Dior J’adore Eau De Parfum 100ml.\r\nNăm phát hành:\r\n2017\r\nGiới tính:\r\nNữ\r\nPhong cách:\r\nTươi mới, sang trọng , quyễn rũ', '/assets/product/4.jpg', 3970000, 2),
(5, 'Nước hoa Lancome Peut-Être Eau De Parfum', 'Nhẹ nhàng, tươi trẻ và cực kỳ nữ tính, nước hoa Lancome Peut Etre chính là chiếc chìa khóa bí mật giúp mở ra cánh cửa sức hút trong bạn.\r\n\r\nThương hiệu: Lancôme\r\nXuất xứ: Pháp\r\nThời gian ra mắt: 2008\r\nNhà sáng tạo: Nathalie Lorson\r\nNhóm hương: Hương hoa cỏ\r\nDung tích phổ biến: 75ml', '/assets/product/5.jpg', 4600000, 2),
(6, 'Nước Hoa Gucci Pour Homme Eau De Toilette\r\n', 'Nước hoa Gucci Pour Homme ra mắt năm 2003, dành cho các quý ông thanh lịch, hiện đại. Thuộc nhóm hương hương cay nồng phương đông, toàn bộ các lớp hương xoay quanh sự ấm áp và lôi cuốn của các loại gỗ.\r\n\r\nThương hiệu: Gucci\r\nNhóm nước hoa: Hương gỗ cay nồng\r\nNăm ra mắt: 2003\r\nSáng tạo bởi : Michel Almairac\r\nPhong cách: Nam tính, lịch lãm, tinh tế\r\nDung tích phổ biến: 30ml, 50ml, 100ml ', '/assets/product/6.jpg', 1460000, 1),
(7, 'Nước hoa Chanel Bleu de Chanel Eau de Parfum\r\n', 'Nước hoa Chanel Bleu de Chanel Eau de Parfum là dòng nước hoa có mùi thơm nồng nàn dành cho phái mạnh, mang lại cho cánh mày râu một vẻ đẹp sang trọng, lịch lãm và đầy lôi cuốn. Mùi hương được hầu hết tất cả những người đã sử dụng đánh giá là tuyệt hảo từ độ lưu hương và tỏa hương. \r\n\r\nThương hiệu: Chanel.\r\nNăm ra mắt: 2014.\r\nNhà sáng tạo: Jacques Polge.\r\nXuất xứ: Pháp.\r\nNhóm hương: Gỗ thơm.\r\nPhong cách: Mạnh mẽ, lôi cuốn.\r\nThời điểm sử dụng tốt nhất: Xuân, Thu, Đông, Hè, Ngày, Đêm.', '/assets/product/7.jpg', 755000, 1),
(8, 'Nước Hoa Gucci Pour Homme II Eau De Toilette\r\n', 'Nước hoa Gucci Pour Homme II ra mắt năm 2007, dành cho các quý ông thanh lịch, hiện đại. Thuộc nhóm hương hương gỗ cay nồng phương đông, toàn bộ các lớp hương xoay quanh sự ấm áp và lôi cuốn của các loại gỗ.\r\n\r\nThương hiệu: Gucci\r\nNăm ra mắt: 2007\r\nNhóm nước hoa: Hương gỗ cay nồng\r\nPhong cách: Nam tính, lịch lãm, mạnh mẽ\r\nDung tích phổ biến: 50ml, 100ml', '/assets/product/8.jpg', 2210000, 1),
(9, 'Set Nước Hoa Dior Les Parfums Iconiques 3 Chai', 'Setgift nước hoa Dior Les Parfum Iconique hội tụ 3 mùi hương quyến rũ bậc nhất đến từ “đế chế” Dior huyền thoại. Phiên bản mini không hề thiếu đi sự đẳng cấp, sang chảnh, ngược lại còn là hội tụ của những gì lộng lẫy, kiêu sa nhất. Set nước hoa Dior 3 chai chọn làm quà tặng quả thực là “chân ái”.\r\n\r\nThương hiệu: Dior\r\nXuất xứ: Pháp\r\nSetgift bao gồm:\r\n\r\n– Nước hoa Miss Dior Eau De Parfum 5ml\r\n\r\n– Nước hoa Dior J’adore Eau De Parfum 5ml\r\n\r\n– Nước hoa Dior Sauvage Eau De Toilette 10ml', '/assets/product/9.jpg', 1290000, 1),
(10, 'Nước hoa Chanel Allure Homme Sport Eau De Toilette\r\n', 'Là sự hòa quyện giữa vị ngọt ngào của hương vani, pha chút cay nồng của tiêu đen cùng hương aldehyde cực kỳ bùng nổ, nước hoa Chanel Allure Homme Sport Eau De Toilette chắc chắc sẽ tạo nên những cung bậc cảm xúc khó quên trong cuộc sống thường ngày của bạn.\r\n\r\nThương hiệu: Chanel\r\nXuất xứ: Pháp\r\nNhà sáng tạo: Jacques Polge\r\nNăm ra mắt: 2004\r\nDòng: Allure Homme Sport\r\nNhóm hương: Hương gỗ cay nồng\r\nDung tích: 10ml, 50ml, 100ml, 150ml.', '/assets/product/10.jpg', 2500000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `SliderID` int(11) NOT NULL,
  `SliderName` varchar(255) NOT NULL,
  `Thumbnail` varchar(255) NOT NULL,
  `Active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`SliderID`, `SliderName`, `Thumbnail`, `Active`) VALUES
(1, 'Slider 1', '/assets/slider/s1.jpg', 1),
(2, 'Slider 2', '/assets/slider/s2.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tai_khoan`
--

CREATE TABLE `tai_khoan` (
  `TenDN` varchar(255) NOT NULL,
  `HoTen` varchar(255) NOT NULL,
  `MatKhau` varchar(255) NOT NULL,
  `QuyenTC` int(11) NOT NULL DEFAULT 2,
  `TrangThai` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tai_khoan`
--

INSERT INTO `tai_khoan` (`TenDN`, `HoTen`, `MatKhau`, `QuyenTC`, `TrangThai`) VALUES
('admin', 'LQH', '202cb962ac59075b964b07152d234b70', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `the_loai`
--

CREATE TABLE `the_loai` (
  `MaTL` int(11) NOT NULL,
  `TenTL` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `the_loai`
--

INSERT INTO `the_loai` (`MaTL`, `TenTL`) VALUES
(1, 'Nước hoa Nam'),
(2, 'Nước hoa Nữ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ct_don_hang`
--
ALTER TABLE `ct_don_hang`
  ADD PRIMARY KEY (`CTDH_ID`);

--
-- Indexes for table `don_hang`
--
ALTER TABLE `don_hang`
  ADD PRIMARY KEY (`DonHangID`);

--
-- Indexes for table `gio_hang`
--
ALTER TABLE `gio_hang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `MaNH` (`MaNH`),
  ADD KEY `TenDN` (`TenDN`);

--
-- Indexes for table `nuoc_hoa`
--
ALTER TABLE `nuoc_hoa`
  ADD PRIMARY KEY (`MaNH`),
  ADD KEY `MaTL` (`MaTL`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`SliderID`);

--
-- Indexes for table `tai_khoan`
--
ALTER TABLE `tai_khoan`
  ADD PRIMARY KEY (`TenDN`);

--
-- Indexes for table `the_loai`
--
ALTER TABLE `the_loai`
  ADD PRIMARY KEY (`MaTL`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ct_don_hang`
--
ALTER TABLE `ct_don_hang`
  MODIFY `CTDH_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gio_hang`
--
ALTER TABLE `gio_hang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nuoc_hoa`
--
ALTER TABLE `nuoc_hoa`
  MODIFY `MaNH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `SliderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `the_loai`
--
ALTER TABLE `the_loai`
  MODIFY `MaTL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `gio_hang`
--
ALTER TABLE `gio_hang`
  ADD CONSTRAINT `gio_hang_ibfk_1` FOREIGN KEY (`MaNH`) REFERENCES `nuoc_hoa` (`MaNH`),
  ADD CONSTRAINT `gio_hang_ibfk_2` FOREIGN KEY (`TenDN`) REFERENCES `tai_khoan` (`TenDN`);

--
-- Constraints for table `nuoc_hoa`
--
ALTER TABLE `nuoc_hoa`
  ADD CONSTRAINT `nuoc_hoa_ibfk_1` FOREIGN KEY (`MaTL`) REFERENCES `the_loai` (`MaTL`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
