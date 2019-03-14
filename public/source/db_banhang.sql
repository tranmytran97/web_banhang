-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 10, 2018 lúc 06:18 PM
-- Phiên bản máy phục vụ: 10.1.37-MariaDB
-- Phiên bản PHP: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_banhang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills`
--

CREATE TABLE `bills` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `total` float DEFAULT NULL COMMENT 'tổng tiền',
  `payment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `bills`
--

INSERT INTO `bills` (`id`, `id_customer`, `date_order`, `total`, `payment`, `note`, `created_at`, `updated_at`) VALUES
(18, 37, '2018-12-10', 59990000, 'COD', '13h giao', '2018-12-10 16:30:57', '2018-12-10 16:30:57'),
(17, 17, '2018-12-10', 22990000, 'ATM', 'Giao hàng lúc 5h chiều', '2018-12-10 15:32:42', '2018-12-10 15:32:42'),
(16, 16, '2018-12-10', 40990000, 'COD', 'Giao hàng lúc 13h', '2018-12-10 15:30:21', '2018-12-10 15:30:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_detail`
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
-- Đang đổ dữ liệu cho bảng `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `id_bill`, `id_product`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(19, 16, 3, 1, 40990000, '2018-12-10 15:30:21', '2018-12-10 15:30:21'),
(21, 18, 22, 1, 59990000, '2018-12-10 16:30:57', '2018-12-10 16:30:57'),
(20, 17, 10, 1, 22990000, '2018-12-10 15:32:42', '2018-12-10 15:32:42');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id_customer` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`id_customer`, `name`, `gender`, `email`, `address`, `phone_number`, `note`, `created_at`, `updated_at`) VALUES
(37, 'Trần Mỹ Trân', 'nữ', 'tranmytran1997@gmail.com', 'Chung cư miếu nổi', '0368802438', '13h giao', '2018-12-10 16:30:57', '2018-12-10 16:30:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` int(10) NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'tiêu đề',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'nội dung',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'hình',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_type` int(10) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `unit_price` float DEFAULT NULL,
  `promotion_price` float DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `id_type`, `description`, `unit_price`, `promotion_price`, `image`, `unit`, `new`, `created_at`, `updated_at`) VALUES
(1, 'Laptop Acer Predator Helios 500 ', 2, 'CPU: Intel Core i9-8950HK 2.9GHz up to 4.8GHz 12MB.\r\nRAM: 32GB DDR4 2666MHz.\r\nỔ cứng: HDD 2TB 5400rpm + 512GB SSD PCIe\r\nCard đồ họa: NVIDIA GeForce GTX 1070 8GB GDDR5.\r\nMàn hình: 17.3\" UHD (3840 x 2160) IPS, Anti-Glare.\r\nCổng giao tiếp: 3x USB 3.0, 1x USB Type-C, 1x Thunderbolt, HDMI, DisplayPort, RJ-45.', 119000000, NULL, 'ace-predator-helios.jpg', 'full box', 0, NULL, NULL),
(2, 'Laptop Acer Nitro 5', 2, 'CPU: Intel Core i7-8750H 2.2GHz up to 4.1GHz 9MB.\r\nRAM: 8GB DDR4 2666MHz (2x SO-DIMM socket, up to 32GB SDRAM).\r\nỔ cứng: HDD 1TB 5400rpm, x1 slot SSD M.2 (SATA/ PCIe).\r\nCard đồ họa: NVIDIA GeForce GTX 1050Ti 4GB GDDR5 + Intel UHD Graphics 630.\r\nMàn hình: 15.6\" FHD (1920 x 1080) IPS, Anti-Glare, 144Hz/ 3ms.\r\nCổng giao tiếp: 2x USB 2.0, 1x USB 3.0, 1x USB 3.1 Type C, 1x HDMI.', 29000000, NULL, 'acer_nitro_5.jpg', 'full box', 0, NULL, NULL),
(3, 'Laptop Acer Predator Helios 300', 2, 'CPU: Intel Core i7-8750H 2.2GHz up to 4.1GHz 9MB.\r\nRAM: 16GB DDR4 2666MHz (2x SO-DIMM socket, up to 32GB SDRAM).\r\nỔ cứng: HDD 1TB 5400rpm + 256GB SSD PCIE G3X4.\r\nCard đồ họa: NVIDIA GeForce GTX 1060 6GB GDDR5.\r\nMàn hình: 15.6\" FHD (1920 x 1080) IPS, Anti-Glare, 144Hz/ 3ms.\r\nCổng giao tiếp	2x USB 2.0, 1x USB 3.0, 1x USB 3.1 Type C, 1x HDMI.', 40990000, NULL, 'acer_predator.jpg', 'full box', 1, NULL, NULL),
(4, 'Laptop Acer Predator Helios 300', 2, 'CPU: Intel Core i7-8750H 2.2GHz up to 4.1GHz 9MB.\r\nRAM: 8GB DDR4 2666MHz (2x SO-DIMM socket, up to 32GB SDRAM).\r\nỔ cứng: HDD 1TB 5400rpm + 256GB SSD PCIE G3X4.\r\nCard đồ họa: NVIDIA GeForce GTX 1060 6GB GDDR5.\r\nMàn hình: 15.6\" FHD (1920 x 1080) IPS, Anti-Glare, 144Hz/ 3ms.\r\nCổng giao tiếp	2x USB 2.0, 1x USB 3.0, 1x USB 3.1 Type C, 1x HDMI.', 40990000, 38990000, 'acer_predator_helios_300_p.jpg', 'full box', 0, NULL, NULL),
(5, 'Laptop Acer Swift 5', 2, 'CPU	Intel Core i7-8550U 1.8GHz up to 4.0GHz 8MB\r\nRAM	8GB LPDDR3 1600MHz\r\nỔ cứng	256GB SSD\r\nCard đồ họa	Intel UHD Graphics 620\r\nMàn hình	14\" FHD (1920 x 1080) CineCrystal In-Plane Switching IPS-Pro + Multi-Touch\r\nCổng giao tiếp	2x USB 3.0, 1x USB 3.1 Type-C, 1x HDMI', 28000000, 27490000, 'acer_swift5.jpg', 'full box', 0, NULL, NULL),
(6, 'Laptop ASUS ROG Griffin G703GI-E5132T', 5, 'CPU: intel Core i9-8950HK 2.9GHz up to 4.8GHz 12MB.\r\nRAM: 32GB DDR4 2666MHz (4x SO-DIMM socket, up to 64GB SDRAM).\r\nỔ cứng: SSHD 2TB 5400rpm (8GB Cache) + 1.5TB SSD PCIE G3X4.\r\nCard đồ họa: NVIDIA GeForce GTX 1080 8GB GDDR5X.\r\nMàn hình: 17.3\" FHD (1920 x 1080) IPS Non-Glare, 144Hz G-Sync, 3ms, 300nits.', 108000000, NULL, 'asus_rog_griffin.jpg', 'full box', 0, NULL, NULL),
(8, 'Laptop ASUS A510UN-EJ469T', 5, 'CPU: Intel Core i7-8550U 1.8GHz up to 4.0GHz 8MB.\r\nRAM: 4GB DDR4 2400MHz (2x SO-DIMM socket, up to 24GB SDRAM).\r\nỔ cứng: HDD 1TB 5400rpm, x1 slot SSD M.2 SATA.\r\nCard đồ họa: NVIDIA GeForce MX150 2GB GDDR5 + Intel UHD Graphics 620.\r\nMàn hình: 15.6\" FHD (1920 x 1080) Anti-Glare.\r\nCổng giao tiếp: 2x USB 2.0, 1x USB 3.0, 1x HDMI, 1x USB 3.0 Type-C, Finger Print.', 18900000, 17900000, 'asus-a510un.jpg', 'full box', 0, NULL, NULL),
(9, 'Laptop Dell Vostro 3468', 8, 'CPU: Intel Core i5-7200U 2.5GHz up to 3.1GHz 3MB.\r\nRAM: 4GB DDR4 2400MHz.\r\nỔ cứng: HDD 500GB 5400rpm.\r\nCard đồ họa: AMD Radeon R5 M420 2GB + Intel HD Graphics 620.\r\nMàn hình: 14\" HD (1366 x 768) Anti-Glare.\r\nCổng giao tiếp: 2x USB 3.0, 1x USB 2.0, VGA, HDMI, RJ-45, Finger Print.', 14190000, NULL, 'dell_vostro.png', 'full box', 0, NULL, NULL),
(10, 'Laptop Dell Vostro 7570', 8, 'CPU: Intel Core i5-7300HQ 2.5GHz up to 3.5GHz 6MB.\r\nRAM: 4GB DDR4 2400MHz (2x SO-DIMM socket, up to 32GB SDRAM).\r\nỔ cứng: HDD 1TB 5400rpm, x1 slot SSD M.2 SATA.\r\nCard đồ họa: NVIDIA GeForce GTX 10.50 4GB GDDR5 + Intel HD Graphics 630\r\nMàn hình: 15.6\" FHD (1920 x 1080) IPS, Anti-Glare.\r\nCổng giao tiếp: 3x USB 3.0, 1x USB 3.1 Type-C (Thunderbolt 3), HDMI, VGA, RJ-45, Finger Print.', 22990000, NULL, 'dell_vostro_7570.jpg', NULL, 1, NULL, NULL),
(11, 'Laptop Dell G3 Inspiron 3579', 8, 'CPU: Intel Core i7-8750H 2.2GHz up to 4.1GHz 9MB.\r\nRAM: 8GB DDR4 2666MHz (2x SO-DIMM socket, up to 32GB SDRAM).\r\nỔ cứng: HDD 1TB 5400rpm + 128GB SSD M.2 SATA.\r\nCard đồ họa: NVIDIA GeForce GTX 1050Ti 4GB GDDR5 + Intel UHD Graphics 630.\r\nMàn hình: 15.6\" FHD (1920 x 1080) IPS, Anti-Glare.\r\nCổng giao tiếp	3x USB 3.1, HDMI, RJ-45, Finger Print.', 27000000, NULL, 'dell-g3.jpg', 'full box', 1, NULL, NULL),
(12, 'Laptop Dell XPS 13 9370 ', 8, 'CPU: Intel Core i7-8550U 1.8GHz up to 4.0GHz 8MB.\r\nRAM: 16GB LPDDR3 1866MHz\r\nỔ cứng	512GB SSD.\r\nCard đồ họa: Intel UHD Graphics 620\r\nMàn hình: 13.3\" UHD (3840 x 2160) IPS + Touch.\r\nCổng giao tiếp: 2x Thunderbolt 3 with .PowerShare, DC-in & DisplayPort; 1x USB-C 3.1 with DC-in & DisplayPort.', 55990000, 52990000, 'dell_xps_13_9370.jpg', 'full box', 0, NULL, NULL),
(13, 'Laptop HP Envy 13', 6, 'CPU:Intel Core i7-8550U 2.7GHz up to 3.5GHz 8MB.\r\nRAM: 8GB LPDDR3 2133MHz (Onboard).\r\nỔ cứng	256GB PCIe® NVMe™ M.2 SSD.\r\nCard đồ họa: Intel UHD Graphics 620.\r\nMàn hình: 13.3\" FHD (1920 x 1080) IPS, BrightView Micro-Edge.\r\nCổng giao tiếp	2x USB 3.1, 1x USB 3.1 Type-C.', 25000000, NULL, 'hp_envy_13.jpg', 'full box', 1, NULL, NULL),
(15, 'Laptop HP Pavilion Gaming', 6, 'CPU: Intel Core i5-8300H 2.3GHz up to 4.0GHz 8MB.\r\nRAM: 8GB DDR4 2666MHz (2x SO-DIMM socket, up to 32GB SDRAM).\r\nỔ cứng: HDD 1TB 7200rpm + 128GB SSD M.2 PCIe.\r\nCard đồ họa: NVIDIA GeForce GTX 1050 4GB GDDR5 + Intel UHD Graphics 630.\r\nMàn hình: 15.6\" FHD (1920 x 1080) IPS, Anti-Glare, Micro-Edge WLED-Backlit.\r\nCổng giao tiếp	3x USB 3.1, 1x USB 3.1 Type-C, HDMI, RJ-45.', 27790000, NULL, 'hp_pavilion-gaming-15.jpg', 'full box', 1, NULL, NULL),
(16, 'Laptop HP Pavilion x360', 6, 'CPU: Intel Core i7-7500U 2.7GHz up to 3.5GHz 4MB.\r\nRAM: 4GB DDR4 2400MHz.\r\nỔ cứng: HDD 1TB 5400rpm (8GB SSD Cache).\r\nCard đồ họa: Intel HD Graphics 620.\r\nMàn hình: 14\" FHD (1920 x 1080) IPS WLED-Backlit + MultiTouch.\r\nCổng giao tiếp	2x USB 3.1, 1x USB 3.1 Type-C, 1x HDMI.', 17990000, NULL, 'hp-pavilion-x360.jpg', 'full box', 1, NULL, NULL),
(17, 'Laptop Lenovo IdeaPad 710S-13IKB', 7, 'CPU: Intel Core i3-7100U 2.4GHz 3MB.\r\nRAM: 4GB LPDDR3L 1600MHz.\r\nỔ cứng: 128GB SSD PCIe.\r\nCard đồ họa: Intel HD Graphics 620\r\nMàn hình: 13.3\" FHD (1920 x 1080) IPS, Anti-Glare.\r\nCổng giao tiếp: 1x USB 2.0, 1x USB 3.0, 1x USB-C (DisplayPort).\r\nAudio: 2 x 2W JBL® Speakers, Dolby® Home Theater® DAX2 Certification.', 15490000, 14490000, 'lenovo_ideapad_710s.png', 'full box', 0, NULL, NULL),
(18, 'Laptop Lenovo ThinkPad', 7, 'CPU: Intel Core i7-8550U 1.8GHz up to 4.0GHz 8MB.\r\nRAM: 8GB LPDDR3 2133MHz.\r\nỔ cứng: 256GB SSD M.2 PCIe NVMe.\r\nCard đồ họa: Intel UHD Graphics 620.\r\nMàn hình: 14\" WQHD (2560 x 1440) IPS, Anti-Glare.\r\nCổng giao tiếp: 2x USB 3.1 Gen 1, 2x USB 3.1 Gen 2 Type-C / Intel Thunderbolt 3, HDMI, Finger Print.\r\nAudio: Dolby® Audio Premium™.', 60000000, 58990000, 'lenovo_thinkpad.jpg', 'full box', 0, NULL, NULL),
(20, 'Laptop LG Gram 2018 ', 3, 'CPU: Intel Core i5-8250U 1.6GHz up to 3.4GHz 6MB.\r\nRAM: 8GB DDR4 2400MHz.\r\nỔ cứng	256GB SSD M.2 SATA (x2 slot M.2 SATA/PCIe).\r\nCard đồ họa: Intel UHD Graphics 620.\r\nMàn hình: 14\" FHD (1920 x 1080) IPS, ~100% sRGB.\r\nCổng giao tiếp:	2x USB 3.0, 1x Type-C USB 3.1, HDMI.', 27990000, 25490000, 'lg_gram1.jpg', 'full box', 0, NULL, NULL),
(21, 'Laptop LG Gram 2018 ', 3, 'CPU: Intel Core i5-8250U 1.6GHz up to 3.4GHz 6MB.\r\nRAM: 8GB DDR4 2400MHz.\r\nỔ cứng	512GB SSD M.2 SATA (x2 slot M.2 SATA/PCIe).\r\nCard đồ họa: Intel UHD Graphics 620.\r\nMàn hình: 15.6\" FHD (1920 x 1080) IPS, ~100% sRGB.\r\nCổng giao tiếp:2x USB 3.0, 1x Type-C USB 3.1, HDMI.', 28000000, NULL, 'lg_gram2.jpg', 'full box', 1, NULL, NULL),
(22, 'Laptop MSI GE75 8RF-043VN Raider ', 1, 'CPU: Intel Core i7-8750H 2.2GHz up to 4.1GHz 9MB.\r\nRAM: 16GB DDR4 2666MHz (2x SO-DIMM socket, up to 32GB SDRAM).\r\nỔ cứng: HDD 1TB 7200rpm + 512GB SSD PCIe NVMe.\r\nCard đồ họa: NVIDIA GeForce GTX 1070 8GB GDDR5.\r\nMàn hình: 17.3\" FHD (1920 x 1080) IPS-Level, 144Hz/3ms, 100% sRGB, Thin Bezel.\r\nCổng giao tiếp: 2x USB 3.1, 1x USB 3.1 Gen2, 1x USB 3.1 Type-C Gen2, HDMI, Mini-DisplayPort.\r\nAudio: Nahimic 3 Audio Technology.', 59990000, NULL, 'msi-ge75-8rf-raider.jpg', NULL, 0, NULL, NULL),
(23, 'Laptop MSI GT83 Titan', 1, 'CPU: Intel Core i7-8850H 2.6GHz up to 4.3GHz 9MB.\r\nRAM:32GB DDR4 2666MHz (4x SO-DIMM socket, up to 64GB SDRAM).\r\nỔ cứng: HDD 1TB 7200rpm + 512GB SSD PCIe NVMe.\r\nCard đồ họa: Dual NVIDIA GeForce GTX 1080 8GB SLI.\r\nMàn hình: 18.4\" FHD (1920 x 1080), IPS-Level.\r\nCổng giao tiếp: 3x USB 3.1, 2x USB 3.1 Gen2, 1x Type-C (USB3.1 Gen2 / DP / Thunderbolt™3), 1x HDMI, 1x Mini-DisplayPort.\r\nAudio: Nahimic 3 Audio Technology.', 145000000, NULL, 'msi_gt83_titan.jpg', 'full box', 1, NULL, NULL),
(24, 'Laptop MSI GP73 ', 1, 'CPU: Intel Core i7-8750H 2.2GHz up to 4.1GHz 9MB.\r\nRAM: 8GB DDR4 2666MHz (2x SO-DIMM socket, up to 32GB SDRAM).\r\nỔ cứng	HDD 1TB 7200rpm + 128GB SSD PCIe NVMe.\r\nCard đồ họa: NVIDIA GeForce GTX 1060 6GB GDDR5.\r\nMàn hình: 17.3\" FHD (1920 x 1080) 120Hz, 3ms, Anti-Glare with 94% NTSC, Wide-View.\r\nCổng giao tiếp	2x USB 3.1, 1x USB 3.1 Gen2, 1x USB 3.1 Type-C Gen2, 1x HDMI, 1x Mini-DisplayPort.', 37890000, NULL, 'msi_gp73_8re-429vn__7__grande.jpg', 'full box', 1, NULL, NULL),
(25, 'Laptop MSI GS63 ', 1, 'CPU: Intel Core i7-8750H 2.2GHz up to 4.1GHz 9MB.\r\nRAM: 8GB DDR4 2666MHz (2x SO-DIMM socket, up to 32GB SDRAM).\r\nỔ cứng	HDD 1TB 7200rpm + 128GB SSD PCIe NVMe.\r\nCard đồ họa:NVIDIA GeForce GTX 1050Ti 4GB GDDR5.\r\nMàn hình: 15.6\" FHD (1920 x 1080) 120Hz, 3ms, Anti-Glare with 94% NTSC, Wide-View.\r\nCổng giao tiếp:	1x USB 2.0, 3x USB 3.0, 1x HDMI, 1x Mini-DisplayPort, 1x Type-C (USB 3.1 Gen2/ DP/ Thunderbolt™3).\r\nAudio: Sound by Dynaudio and High-Resolution Audio ready.', 43990000, NULL, 'msi_gs63_8rd-006vn__2__grande.jpg', 'full box', 1, NULL, NULL),
(26, 'Laptop MSI PS42', 1, 'CPU: Intel Core i5-8250U 1.6GHz up to 3.4GHz 6MB.\r\nRAM: 8GB DDR4 2400MHz.\r\nỔ cứng	256GB PCIe NVMe™ M.2 SSD.\r\nCard đồ họa: Intel UHD Graphics 620.\r\nMàn hình: 14\" FHD (1920 x 1080) IPS-Level Narrow Bezel.\r\nCổng giao tiếp: 2x USB 2.0, 2x Type C USB 3.0, HDMI, Finger Print.\r\nAudio:Nahimic 3.', 22000000, NULL, 'msi_ps42_8rb_grande.jpg', 'full box', 0, NULL, NULL),
(27, 'Laptop MSI GS65 8RE-242VN Stealth Thin ', 1, 'CPU: Intel Core i7-8750H 2.2GHz up to 4.1GHz 9MB.\r\nRAM: 16GB DDR4 2666MHz (2x SO-DIMM socket, up to 32GB SDRAM).\r\nỔ cứng: 256GB SSD PCIe NVMe.\r\nCard đồ họa: NVIDIA GeForce GTX 1060 6GB GDDR5.\r\nMàn hình: 15.6\" FHD (1920 x 1080) IPS, 144Hz, 7ms, Narrow Bezel, Anti-Glare.\r\nCổng giao tiếp	3x USB 3.1, 1x Type-C (USB 3.1 Gen2/ DP/ Thunderbolt™3), 1x HDMI, 1x Mini-DisplayPort.', 53000000, NULL, 'msi_gs65_8re-242vn_stealth_thin__3__grande.jpg', 'full box', 1, NULL, NULL),
(28, 'Laptop MSI GE75', 1, 'CPU:Intel Core i7-8750H 2.2GHz up to 4.1GHz 9MB\r\nRAM: 16GB DDR4 2666MHz (2x SO-DIMM socket, up to 32GB SDRAM)\r\nỔ cứng:HDD 1TB 7200rpm + 512GB SSD PCIe NVMe\r\nCard đồ họa:NVIDIA GeForce GTX 1070 8GB GDDR5\r\nMàn hình: 17.3\" FHD (1920 x 1080) IPS-Level, 144Hz/3ms, 100% sRGB, Thin Bezel\r\nCổng giao tiếp	2x USB 3.1, 1x USB 3.1 Gen2, 1x USB 3.1 Type-C Gen2, HDMI, Mini-DisplayPort\r\nAudio: Nahimic 3 Audio Technology', 23000000, 21990000, 'msi-ge75-8rf-raider.jpg', 'full box', 0, NULL, NULL),
(29, 'Laptop MSI P65', 1, 'CPU:Intel Core i7-8750H 2.2GHz up to 4.1GHz 9MB\r\nRAM: 16GB DDR4 2666MHz (2x SO-DIMM socket, up to 32GB SDRAM)\r\nỔ cứng	512GB SSD PCIe NVMe\r\nCard đồ họa: NVIDIA GeForce GTX 1070 8GB GDDR5\r\nMàn hình: 15.6\" FHD (1920 x 1080), IPS-Level, 144Hz/ 7ms, Thin Bezel \r\nCổng giao tiếp	2x USB 3.1 Gen1, 1x USB 3.1 Gen2, 1x Type-C (USB 3.1 Gen2 / DP / Thunderbolt™3), HDMI, Mini-DisplayPort, RJ-45\r\nAudio: Sound by Dynaudio and High-Resolution Audio ready (2x 2W Speaker)', 63990000, 62990000, 'msi-p65-8re.jpg', 'full box', 0, NULL, NULL),
(30, 'Laptop MSI GL73', 1, 'CPU: Intel Core i7-8750H 2.2GHz up to 4.1GHz 9MB\r\nRAM:8GB DDR4 2666MHz (2x SO-DIMM socket, up to 32GB SDRAM)\r\nỔ cứng:	HDD 1TB 7200rpm, x1 slot SSD M.2 (SATA/ PCIe)\r\nCard đồ họa:NVIDIA GeForce GTX 1050 4GB GDDR5 + Intel UHD 630\r\nMàn hình:17.3\" FHD (1920 x 1080) Anti-Glare, 94% NTSC Wide-View\r\nCổng giao tiếp:3x USB 3.1, 1x USB 3.1 Type-C, 1x HDMI, 1x Mini-DisplayPort.\r\nAudio: Nahimic 3 Audio Technology.', 26990000, 25990000, 'msi_gl73.jpg', 'full box', 0, NULL, NULL),
(39, 'Laptop Acer Swift 3 ', 2, 'CPU: Intel Core i7-8565U 1.8GHz up 4.6GHz 8MB.\r\nRAM: 8GB DDR4 2400MHz.\r\nỔ cứng: 512GB PCIe NVMe™ M.2 SS.D\r\nCard đồ họa: NVIDIA GeForce MX150 2GB. GDDR5 + Intel UHD Graphics 620.\r\nMàn hình: 14\" FHD (1920 x 1080) IPS.\r\nCổng giao tiếp	2x USB 3.0, 1x USB 3.1 Type-C, HDMI, Finger Print.', 374900000, 364900000, 'acer-swift-3.jpg', 'full box', 0, NULL, NULL),
(40, 'Laptop HP Pavilion x360', 6, 'CPU: Intel Core i5-8250U 1.6GHz up to 3.4GHz 6MB.\r\nRAM: 4GB DDR4 2400MHz.\r\nỔ cứng: HDD 500GB 5400rpm.\r\nCard đồ họa: Intel UHD Graphics 620.\r\nMàn hình: 14\" FHD (1920 x 1080) IPS WLED-Backlit + MultiTouch.\r\nCổng giao tiếp: 2x USB 3.1, 1x USB 3.1 Type-C, 1x HDMI.', 17000000, 15990000, 'hp_pavilion_x360_14.jpg', 'full box', 0, NULL, NULL),
(41, 'Laptop Dell Inspiron 7370', 8, 'CPU: Intel Core i7-8550U 1.8GHz up to 4.0GHz 8MB.\r\nRAM: 8GB DDR4 2400MHz.\r\nỔ cứng: 256GB SSD.\r\nCard đồ họa: Intel UHD Graphics 620.\r\nMàn hình: 13.3\" FHD (1920 x 1080) IPS Truelife LED-Backlit Narrow Border.\r\nCổng giao tiếp	2x USB 3.1, 1x USB-C 3.1, HDMI.', 27000000, 25990000, 'dell_inspiron_7370__7d61y3__grande.png', 'full box', 0, NULL, NULL),
(42, 'Laptop Dell Vostro 7580', 8, 'CPU: Intel Core i7-8750H 2.2GHz up to 4.1GHz 9MB.\r\nRAM: 8GB DDR4 2666MHz (2x SO-DIMM socket, up to 32GB SDRAM).\r\nỔ cứng: HDD 1TB 5400rpm + 128GB SSD M.2 SATA.\r\nCard đồ họa: NVIDIA GeForce GTX 1050Ti 4GB GDDR5.\r\nMàn hình: 15.6\" FHD (1920 x 1080) IPS, LED-Backlit + Anti-Glare.\r\nCổng giao tiếp	3x USB 3.1, 1x Thunderbolt™ 3, HDMI, RJ-45, Finger Print.', 32000000, 30990000, 'dell_vostro_7580__70159096__grande.jpg', 'full box', 0, NULL, NULL),
(43, 'Laptop Lenovo IdeaPad 530s-14IKB', 7, 'CPU: Intel Core i5-8250U 1.6GHz up to 3.4GHz 6MB.\r\nRAM: 4GB DDR4 2400MHz.\r\nỔ cứng: 256GB SSD PCIe.\r\nCard đồ họa: Intel UHD Graphics 620\r\nMàn hình: 14\" FHD (1920 x 1080) IPS.\r\nCổng giao tiếp: 2x USB 3.0, 1x USB Type-C 3.1, HDMI, Finger Print.', 17000000, 16000000, 'lenovo_ideapad_530s__81eu007qvn__grande.png', 'full box', 0, NULL, NULL),
(44, 'Laptop Lenovo Legion Y730', 7, 'CPU: Intel Core i7-8750H 2.2GHz up to 4.1GHz 9MB\r\nRAM: 16GB DDR4 2666MHz (2x SO-DIMM socket, up to 32GB SDRAM)\r\nỔ cứng: HDD 2TB 5400rpm + 256GB SSD M.2 PCIe\r\nCard đồ họa: NVIDIA GeForce GTX 1050Ti 4GB GDDR5 + Intel UHD Graphics 630\r\nMàn hình: 15.6\" FHD (1920 x 1080) IPS, 144Hz G-SYNC™\r\nCổng giao tiếp: 1x USB 3.1 Gen 1, 2x USB 3.1 Gen 2, 1x USB Thunderbolt™ 3 Type-C™, Mini DP, HDMI, RJ-45\r\nAudio: Dolby Atmos® Speaker System', 38000000, NULL, 'lenovo_legion.jpg', 'full box', 1, NULL, NULL),
(45, 'Laptop Lenovo ThinkPad L380', 7, 'CPU: Intel Core i5-8250U 1.6GHz up to 3.4GHz 6MB.\r\nRAM: 4GB DDR4 2400MHz.\r\nỔ cứng: 256GB SSD M.2.\r\nCard đồ họa: Intel UHD Graphics 620\r\nMàn hình: 13.3\" FHD (1920 x 1080) IPS, Anti-Glare.\r\nCổng giao tiếp: 2x USB 3.1, 2x USB 3.1 Type-C, HDMI, Mini RJ-45.', 19900000, NULL, 'lenovo_thinkpad_l380_20m5s01500__1__grande.jpg', 'full box', 0, NULL, NULL),
(46, 'Laptop Lenovo Yoga 520-14IKBR ', 7, 'CPU: Intel Core i3-7020U 2.3GHz 3MB.\r\nRAM: 4GB DDR4 2400MHz.\r\nỔ cứng: 256GB SSD.\r\nCard đồ họa: Intel HD Graphics 620.\r\nMàn hình: 14\" HD (1366 x 768) LED + TouchScreen.\r\nCổng giao tiếp:	2x USB 3.0, 1x USB Type-C, 1x HDMI, Finger Print, Pen.', 15000000, NULL, 'lenovo_yoga_520-14ikbr__81c800lhvn__grande.jpg', 'full box', 0, NULL, NULL),
(50, 'Laptop ASUS ROG Zephyrus M', 5, 'CPU: Intel Core i7-8750H 2.2GHz up to 4.1GHz 9MB.\r\nRAM: 16GB DDR4 2666MHz (2x SO-DIMM socket, up to 32GB SDRAM).\r\nỔ cứng	:SSHD 1TB 5400rpm (8GB Cache) + 512GB SSD PCIE G3X4.\r\nCard đồ họa: NVIDIA GeForce GTX 1070 8GB GDDR5.\r\nMàn hình: 15.6\" FHD (1920 x 1080) IPS Non-Glare, 100% sRGB, 144Hz G-Sync, 3ms, 300nits.\r\nCổng giao tiếp:	4x USB 3.0, 1x Type C USB 3.1 (Thunderbolt), 1x HDMI\r\nAudio	ASUS Sonic Studio.', 65000000, 62999000, 'asus_rog_zephyrus2.jpg', 'full box', 0, NULL, NULL),
(51, 'Laptop ASUS ROG Zephyrus', 5, 'CPU: Intel Core i7-8750H 2.2GHz up to 4.1GHz 9MB.\r\nRAM: 24GB DDR4 2666MHz.\r\nỔ cứng: 1TB SSD PCIE G3x4.\r\nCard đồ họa: NVIDIA GeForce GTX 1080 8GB GDDR5 with Max-Q Design.\r\nMàn hình: 15.6\" FHD (1920 x 1080) IPS Non-Glare, 100% sRGB, 144Hz G-Sync, 3ms, 300nits.\r\nCổng giao tiếp: 4x USB 3.0, 1x Type C USB 3.1 (Thunderbolt), 1x HDMI.', 85900000, NULL, 'asus_rog_zephyrus.jpg', 'full box', 1, NULL, NULL),
(52, 'Laptop ASUS ZenBook ', 5, 'CPU: Intel Core i7-8565U 1.8GHz up to 4.6GHz 8MB.\r\nRAM: 8GB DDR4 2400MHz.\r\nỔ cứng	512GB SSD PCIE G3X2.\r\nCard đồ họa: NVIDIA GeForce GTX 1050 2GB GDDR5 + Intel UHD Graphics 630.\r\nMàn hình: 15.6\" FHD (1920 x 1080) Anti-Glare, NanoEdge, 100% sRGB, 178° wide-view.', 32990000, NULL, 'asus-zenbook-ux533fd-a9027t_grande.jpg', 'full box', 1, NULL, NULL),
(53, 'Laptop ASUS TUF Gaming ', 5, 'CPU: Intel Core i7-8750H 2.2GHz up to 4.1GHz 9MB.\r\nRAM: 8GB DDR4 2666MHz (2x SO-DIMM socket, up to 32GB SDRAM).\r\nỔ cứng	HDD 1TB 5400rpm, x1 slot SSD M.2 (SATA/ PCIe).\r\nCard đồ họa: NVIDIA GeForce GTX 1050 4GB GDDR5 + Intel UHD Graphics 630.\r\nMàn hình:15.6\" FHD (1920 x 1080) IPS, 60Hz, Anti-Glare with 45% NTSC .\r\nCổng giao tiếp	1x USB 2.0, 2x USB 3.1, HDMI, RJ-45.', 25990000, NULL, 'asus-tuf-gaming-fx505gd-bq014t_8_grande.jpg', 'full box', 0, NULL, NULL),
(54, 'MacBook Pro 13.3-inch 2017 ', 4, '2.3GHz dual-core Intel Core i5 processor, Turbo Boost up to 3.6GHz \r\n\r\n8GB 2133MHz Memory \r\n\r\n256GB SSD Storage \r\n\r\nIntel Iris Plus Graphics 640 \r\n\r\n2 x ports ThunderBolt 3', 34500000, NULL, 'MacBookPro-13.jpg', 'full box', 0, NULL, NULL),
(55, 'MacBook Pro 15.4-inch 2018 ', 4, '2.6GHz 6-core Intel Core i7 processor, Turbo Boost up to 4.3GHz \r\n\r\n16GB 2400MHz DDR4 memory \r\n\r\n512GB SSD Storage \r\n\r\nRadeon Pro 560X with 4GB memory \r\n\r\n4 x ports ThunderBolt 3 \r\n\r\nTouch Bar and Touch ID', 60500000, NULL, 'MacBookPro-2018-15inch-SpaceGray-A.jpg', 'full box', 0, NULL, NULL),
(56, 'MacBook Pro 15.4-inch 2018 (Silver)', 4, '2.6GHz 6-core Intel Core i7 processor, Turbo Boost up to 4.3GHz \r\n\r\n16GB 2400MHz DDR4 memory \r\n\r\n512GB SSD Storage \r\n\r\nRadeon Pro 560X with 4GB memory \r\n\r\n4 x ports ThunderBolt 3 \r\n\r\nTouch Bar and Touch ID', 60500000, NULL, 'MacBookPro-2018-15inch-Silver-A.jpg', 'full box', 1, NULL, NULL),
(57, 'MacBook 12-inch 512GB ', 4, '1.3GHz dual-core Intel Core i5 processor (Turbo Boost up to 3.2GHz)\r\n\r\n8GB 1866MHz Memory\r\n\r\n512GB SSD Storage\r\n\r\nIntel HD Graphics 615\r\n\r\nBuilt-in battery (10 hours)\r\n\r\nColor: Space Gray, Silver, Gold and Rose Gold', 35600000, NULL, 'MacBook-Gold-C.jpg', 'full box', 0, NULL, NULL),
(58, 'MacBook Air 2017 1.8GHz ', 4, '1.8GHz dual-core Intel Core i5 (Turbo Boost up to 2.9GHz)\r\n\r\n8GB 1600MHz Memory\r\n\r\n128GB PCIe-based Flash Storage\r\n\r\nIntel HD Graphics 6000 \r\n\r\nBuilt-in battery (12 hours)\r\n\r\nLED-backlit glossy widescreen', 20200000, NULL, 'MacBookAir-13inch.jpg', 'full box', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `slide`
--

INSERT INTO `slide` (`id`, `link`, `image`) VALUES
(1, '', 'banner1.png'),
(2, '', 'banner.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type_products`
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
-- Đang đổ dữ liệu cho bảng `type_products`
--

INSERT INTO `type_products` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'MSI', '', '', NULL, NULL),
(2, 'ACER', '', '', NULL, NULL),
(3, 'LG', '', '', NULL, NULL),
(4, 'APPLE', '', '', NULL, NULL),
(5, 'ASUS', '', '', NULL, NULL),
(6, 'HP', '', '', NULL, NULL),
(7, 'LENOVO', '', '', NULL, NULL),
(8, 'DELL', '', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `phone`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Trần mỹ Trân', 'tranmytran1997@gmail.com', '$2y$10$YnOUWaQXP4znuUj5PSNwUuwophAsUtp0j0SkpAs1hWKGAlKis1yPG', '0368802438', 'Chung cư miếu nổi', NULL, '2018-12-10 15:29:00', '2018-12-10 15:29:00');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_ibfk_1` (`id_customer`);

--
-- Chỉ mục cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_detail_ibfk_2` (`id_product`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id_type_foreign` (`id_type`);

--
-- Chỉ mục cho bảng `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id_customer` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT cho bảng `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `type_products`
--
ALTER TABLE `type_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_id_type_foreign` FOREIGN KEY (`id_type`) REFERENCES `type_products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
