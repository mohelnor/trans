-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 03, 2023 at 05:03 AM
-- Server version: 5.7.17-log
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `manarah`
--

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL COMMENT 'معرف أو المفتاح الرئيسي',
  `name` varchar(100) NOT NULL COMMENT 'المدينة',
  `details` varchar(100) NOT NULL COMMENT 'موقع الميناء أو أي تفاصيل أخرى'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `details`) VALUES
(1, 'بورتسودان', 'البحر الأحمر'),
(2, 'swakin', 'redsea state'),
(3, 'khartoum', 'الميناء البري'),
(4, 'كسلا', 'السوق الشعبي'),
(5, 'الأبيض', 'الأبيض'),
(6, 'الجزيرة', 'الشعبي');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `vehicle` int(11) NOT NULL,
  `ton` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `fuel` int(11) NOT NULL,
  `cash-receved` int(11) NOT NULL,
  `transaction` int(11) NOT NULL,
  `zakat_fine` int(11) NOT NULL,
  `cash_remained` int(11) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `noloan`
--

CREATE TABLE `noloan` (
  `id` int(11) NOT NULL,
  `city` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `remain` int(11) NOT NULL,
  `_value` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `required` int(11) NOT NULL,
  `price_txt` varchar(300) NOT NULL,
  `type` enum('60%','70%') NOT NULL,
  `user` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `noloan`
--

INSERT INTO `noloan` (`id`, `city`, `price`, `remain`, `_value`, `total`, `required`, `price_txt`, `type`, `user`, `created`, `updated`) VALUES
(1, 'madani', 100, 1000, 70, 10000, 9000, '10000', '60%', 1, '2023-11-26 07:16:59', '2023-11-29 16:27:30'),
(2, 'madani', 999, 9000, 90, 90000, 9000, '9000', '70%', 1, '2023-11-26 07:16:59', '2023-11-29 16:26:56'),
(3, 'madani', 100, 1000, 60, 10000, 9000, '10000', '60%', 1, '2023-11-26 07:16:59', '2023-11-26 07:16:59'),
(4, 'madani', 100, 1000, 60, 10000, 9000, '10000', '60%', 1, '2023-11-26 07:16:59', '2023-11-26 07:16:59'),
(5, 'madani', 100, 1000, 60, 10000, 9000, '10000', '60%', 1, '2023-11-26 07:16:59', '2023-11-26 07:16:59'),
(6, 'madani', 100, 1000, 60, 10000, 9000, '10000', '60%', 1, '2023-11-26 07:16:59', '2023-11-26 07:16:59'),
(7, 'madani', 100, 1000, 60, 10000, 9000, '10000', '60%', 1, '2023-11-26 07:16:59', '2023-11-26 07:16:59'),
(8, 'madani', 100, 1000, 60, 10000, 9000, '10000', '60%', 1, '2023-11-26 07:16:59', '2023-11-26 07:16:59'),
(9, 'madani', 100, 1000, 60, 10000, 9000, '10000', '60%', 1, '2023-11-26 07:16:59', '2023-11-26 07:16:59'),
(10, 'madani', 100, 1000, 60, 10000, 9000, '10000', '60%', 1, '2023-11-26 07:16:59', '2023-11-26 07:16:59'),
(11, 'madani', 100, 1000, 60, 10000, 9000, '10000', '60%', 1, '2023-11-26 07:16:59', '2023-11-26 07:16:59'),
(12, 'madani', 100, 1000, 60, 10000, 9000, '10000', '60%', 1, '2023-11-26 07:16:59', '2023-11-26 07:16:59'),
(13, 'madani', 100, 1000, 60, 10000, 9000, '10000', '60%', 1, '2023-11-26 07:16:59', '2023-11-26 07:16:59'),
(14, 'madani', 100, 1000, 60, 10000, 9000, '10000', '60%', 1, '2023-11-26 07:16:59', '2023-11-26 07:16:59'),
(15, 'madani', 100, 1000, 60, 10000, 9000, '10000', '60%', 1, '2023-11-26 07:16:59', '2023-11-26 07:16:59'),
(16, 'madani', 100, 1000, 60, 10000, 9000, '10000', '60%', 1, '2023-11-26 07:16:59', '2023-11-26 07:16:59'),
(17, 'madani', 100, 1000, 60, 10000, 9000, '10000', '60%', 1, '2023-11-26 07:16:59', '2023-11-26 07:16:59'),
(18, 'madani', 100, 1000, 60, 10000, 9000, '10000', '60%', 1, '2023-11-26 07:16:59', '2023-11-26 07:16:59'),
(19, 'madani', 100, 1000, 60, 10000, 9000, '10000', '60%', 1, '2023-11-26 07:16:59', '2023-11-26 07:16:59'),
(20, 'madani', 100, 1000, 60, 10000, 9000, '10000', '60%', 1, '2023-11-26 07:16:59', '2023-11-26 07:16:59'),
(21, 'madani', 100, 1000, 60, 10000, 9000, '10000', '60%', 1, '2023-11-26 07:16:59', '2023-11-26 07:16:59'),
(22, 'madani', 100, 1000, 60, 10000, 9000, '10000', '60%', 1, '2023-11-26 07:16:59', '2023-11-26 07:16:59'),
(23, 'madani', 100, 1000, 60, 10000, 9000, '10000', '60%', 1, '2023-11-26 07:16:59', '2023-11-26 07:16:59'),
(24, 'madani', 100, 1000, 60, 10000, 9000, '10000', '60%', 1, '2023-11-26 07:16:59', '2023-11-26 07:16:59'),
(25, 'madani', 100, 1000, 60, 10000, 9000, '10000', '60%', 1, '2023-11-26 07:16:59', '2023-11-26 07:16:59'),
(26, 'madani', 100, 1000, 60, 10000, 9000, '10000', '60%', 1, '2023-11-26 07:16:59', '2023-11-26 07:16:59'),
(27, 'madani', 100, 1000, 60, 10000, 9000, '10000', '60%', 1, '2023-11-26 07:16:59', '2023-11-26 07:16:59'),
(28, 'madani', 100, 1000, 60, 10000, 9000, '10000', '60%', 1, '2023-11-26 07:16:59', '2023-11-26 07:16:59'),
(29, 'madani', 100, 1000, 60, 10000, 9000, '10000', '60%', 1, '2023-11-26 07:16:59', '2023-11-26 07:16:59'),
(30, 'madani', 100, 1000, 60, 10000, 9000, '10000', '60%', 1, '2023-11-26 07:16:59', '2023-11-26 07:16:59'),
(31, 'madani', 100, 1000, 60, 10000, 9000, '10000', '60%', 1, '2023-11-26 07:16:59', '2023-11-26 07:16:59'),
(32, 'madani', 100, 1000, 60, 10000, 9000, '10000', '60%', 1, '2023-11-26 07:16:59', '2023-11-26 07:16:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user` varchar(100) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `role` varchar(100) NOT NULL,
  `city` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user`, `name`, `password`, `phone`, `role`, `city`, `created`) VALUES
(1, 'mohammed', 'mohammed elnour', '123', '123', 'client', 1, '2023-11-20 20:54:56'),
(7, 'majda', 'majda omer', '123', NULL, 'client', 0, '2023-11-29 05:57:38'),
(8, 'محمد', 'محمد النور', '555', NULL, 'client', 0, '2023-11-29 09:36:16');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `id` int(11) NOT NULL,
  `company` varchar(200) DEFAULT NULL,
  `board` varchar(8) DEFAULT NULL,
  `driver` varchar(100) DEFAULT NULL,
  `destination` varchar(100) DEFAULT NULL,
  `shipment` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `amount` varchar(100) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `user` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`id`, `company`, `board`, `driver`, `destination`, `shipment`, `type`, `amount`, `phone`, `user`, `created`, `updated`) VALUES
(1, 'max', '0', 'mohammed', 'madani', 'cotton', 'more', '60 ton', '0912228465', 1, '2023-11-26 07:08:08', '2023-11-26 07:08:08'),
(2, 'maxima', '9999', 'mohanad', 'wad madani', 'candy', 'more', '40ton', '0914448465', 1, '2023-11-26 07:08:08', '2023-12-01 00:15:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `noloan`
--
ALTER TABLE `noloan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'معرف أو المفتاح الرئيسي', AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `noloan`
--
ALTER TABLE `noloan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
