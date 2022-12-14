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
(1, 'N?????c hoa n??? Chanel No.5 Eau De Parfum', '????y l?? d??ng n?????c hoa n??? ?????u ti??n c???a h??ng Chanel n???i ti???ng. Chanel No.5 ??? m???t s???n ph???m huy???n tho???i ???? ?????ng h??nh v???i nhi???u c?? g??i ??? m???i ????? tu???i su???t c??? m???t th???p k??? qua. S??? h???u h????ng th??m ?????y m?? ho???c, Chanel No.5 ???? l??m say ?????m bi???t bao t??m h???n thi???u n???.', '/assets/product/1.jpg\r\n', 4400000, 2),
(2, 'N?????c hoa n??? D&G Velvet Cypress', 'Ra m???t t??? n??m 2017 nh??ng ?????n nay D&G Velvet Cypress v???n lu??n l?? s??? l???a ch???n c???a r???t nhi???u b???n g??i. Chai n?????c hoa n??? v???i thi???t k??? l??? th???y tinh sang tr???ng, ?????y cu???n h??t v???i m??u xanh l?? b???t m???t mang ?????n m??i h????ng ?????c l??? m?? ho???c bi???t bao ng?????i t??? nh???ng c?? g??i tr??? ?????n c??c qu?? b?? sang tr???ng.', '/assets/product/2.jpg', 5600000, 2),
(3, 'N?????c hoa n??? ch??nh h??ng Dior J???adore', 'S???n ph???m c?? kh??? n??ng l??u h????ng r???t l??u d?? ch??? v???i m???t l?????ng nh???. H????ng th??m d???u nh??? c???a J???adore c???c k??? g???i c???m, tinh t???, quy???n r??, ch???c ch???n s??? l??m si??u l??ng b???t k??? ai.\r\nN??m ph??t h??nh:1999\r\nGi???i t??nh:N???\r\nPhong c??ch:G???i c???m, n??? t??nh, thanh l???ch', '/assets/product/3.jpg\r\n', 3500000, 2),
(4, 'N?????c Hoa N??? Chanel Gabrielle EDP, 100ml\r\n', 'N???u ??ang t??m ki???m d??ng n?????c hoa t??n vinh n??t ?????p quy???n r?? c???a ng?????i ph??? n??? th?? nh???t ?????nh ph???i bi???t ?????n n?????c hoa Dior J???adore Eau De Parfum 100ml.\r\nN??m ph??t h??nh:\r\n2017\r\nGi???i t??nh:\r\nN???\r\nPhong c??ch:\r\nT????i m???i, sang tr???ng , quy???n r??', '/assets/product/4.jpg', 3970000, 2),
(5, 'N?????c hoa Lancome Peut-??tre Eau De Parfum', 'Nh??? nh??ng, t????i tr??? v?? c???c k??? n??? t??nh, n?????c hoa Lancome Peut Etre ch??nh l?? chi???c ch??a kh??a b?? m???t gi??p m??? ra c??nh c???a s???c h??t trong b???n.\r\n\r\nTh????ng hi???u: Lanc??me\r\nXu???t x???: Ph??p\r\nTh???i gian ra m???t: 2008\r\nNh?? s??ng t???o: Nathalie Lorson\r\nNh??m h????ng: H????ng hoa c???\r\nDung t??ch ph??? bi???n: 75ml', '/assets/product/5.jpg', 4600000, 2),
(6, 'N?????c Hoa Gucci Pour Homme Eau De Toilette\r\n', 'N?????c hoa Gucci Pour Homme ra m???t n??m 2003, d??nh cho c??c qu?? ??ng thanh l???ch, hi???n ?????i. Thu???c nh??m h????ng h????ng cay n???ng ph????ng ????ng, to??n b??? c??c l???p h????ng xoay quanh s??? ???m ??p v?? l??i cu???n c???a c??c lo???i g???.\r\n\r\nTh????ng hi???u: Gucci\r\nNh??m n?????c hoa: H????ng g??? cay n???ng\r\nN??m ra m???t: 2003\r\nS??ng t???o b???i : Michel Almairac\r\nPhong c??ch: Nam t??nh, l???ch l??m, tinh t???\r\nDung t??ch ph??? bi???n: 30ml, 50ml, 100ml ', '/assets/product/6.jpg', 1460000, 1),
(7, 'N?????c hoa Chanel Bleu de Chanel Eau de Parfum\r\n', 'N?????c hoa Chanel Bleu de Chanel Eau de Parfum l?? d??ng n?????c hoa c?? m??i th??m n???ng n??n d??nh cho ph??i m???nh, mang l???i cho c??nh m??y r??u m???t v??? ?????p sang tr???ng, l???ch l??m v?? ?????y l??i cu???n. M??i h????ng ???????c h???u h???t t???t c??? nh???ng ng?????i ???? s??? d???ng ????nh gi?? l?? tuy???t h???o t??? ????? l??u h????ng v?? t???a h????ng. \r\n\r\nTh????ng hi???u: Chanel.\r\nN??m ra m???t: 2014.\r\nNh?? s??ng t???o: Jacques Polge.\r\nXu???t x???: Ph??p.\r\nNh??m h????ng: G??? th??m.\r\nPhong c??ch: M???nh m???, l??i cu???n.\r\nTh???i ??i???m s??? d???ng t???t nh???t: Xu??n, Thu, ????ng, H??, Ng??y, ????m.', '/assets/product/7.jpg', 755000, 1),
(8, 'N?????c Hoa Gucci Pour Homme II Eau De Toilette\r\n', 'N?????c hoa Gucci Pour Homme II ra m???t n??m 2007, d??nh cho c??c qu?? ??ng thanh l???ch, hi???n ?????i. Thu???c nh??m h????ng h????ng g??? cay n???ng ph????ng ????ng, to??n b??? c??c l???p h????ng xoay quanh s??? ???m ??p v?? l??i cu???n c???a c??c lo???i g???.\r\n\r\nTh????ng hi???u: Gucci\r\nN??m ra m???t: 2007\r\nNh??m n?????c hoa: H????ng g??? cay n???ng\r\nPhong c??ch: Nam t??nh, l???ch l??m, m???nh m???\r\nDung t??ch ph??? bi???n: 50ml, 100ml', '/assets/product/8.jpg', 2210000, 1),
(9, 'Set N?????c Hoa Dior Les Parfums Iconiques 3 Chai', 'Setgift n?????c hoa Dior Les Parfum Iconique h???i t??? 3 m??i h????ng quy???n r?? b???c nh???t ?????n t??? ???????? ch?????? Dior huy???n tho???i. Phi??n b???n mini kh??ng h??? thi???u ??i s??? ?????ng c???p, sang ch???nh, ng?????c l???i c??n l?? h???i t??? c???a nh???ng g?? l???ng l???y, ki??u sa nh???t. Set n?????c hoa Dior 3 chai ch???n l??m qu?? t???ng qu??? th???c l?? ???ch??n ??i???.\r\n\r\nTh????ng hi???u: Dior\r\nXu???t x???: Ph??p\r\nSetgift bao g???m:\r\n\r\n??? N?????c hoa Miss Dior Eau De Parfum 5ml\r\n\r\n??? N?????c hoa Dior J???adore Eau De Parfum 5ml\r\n\r\n??? N?????c hoa Dior Sauvage Eau De Toilette 10ml', '/assets/product/9.jpg', 1290000, 1),
(10, 'N?????c hoa Chanel Allure Homme Sport Eau De Toilette\r\n', 'L?? s??? h??a quy???n gi???a v??? ng???t ng??o c???a h????ng vani, pha ch??t cay n???ng c???a ti??u ??en c??ng h????ng aldehyde c???c k??? b??ng n???, n?????c hoa Chanel Allure Homme Sport Eau De Toilette ch???c ch???c s??? t???o n??n nh???ng cung b???c c???m x??c kh?? qu??n trong cu???c s???ng th?????ng ng??y c???a b???n.\r\n\r\nTh????ng hi???u: Chanel\r\nXu???t x???: Ph??p\r\nNh?? s??ng t???o: Jacques Polge\r\nN??m ra m???t: 2004\r\nD??ng: Allure Homme Sport\r\nNh??m h????ng: H????ng g??? cay n???ng\r\nDung t??ch: 10ml, 50ml, 100ml, 150ml.', '/assets/product/10.jpg', 2500000, 1);

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
(1, 'N?????c hoa Nam'),
(2, 'N?????c hoa N???');

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
