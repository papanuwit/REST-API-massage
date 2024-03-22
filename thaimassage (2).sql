-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2024 at 08:56 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thaimassage`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customerId` int(3) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `age` int(2) NOT NULL,
  `phonenumber` varchar(10) NOT NULL,
  `profile` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `gender` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customerId`, `firstname`, `lastname`, `email`, `password`, `age`, `phonenumber`, `profile`, `role`, `gender`) VALUES
(12, 'papanuwit', 'pasatho', 'panu@gmail.com', '123', 18, '099999999', 'photo-1698389627021.jpg', 'user', 'male'),
(13, 'พงสธร', 'แก้วใจ', 'panuwit@gmail.com', '123456789', 20, '0973077786', 'photo-1698391792919.jpg', 'user', 'female'),
(14, 'ภาณุวิชญ์', 'ปัสสาโท', 'panuwit1458@gmail.com', '123456', 24, '0999991234', 'photo-1698393239285.jpg', 'user', 'female'),
(15, 'จันสุดา', 'คณะวาปี', 'panuwit1458@gmail.com', '123456', 35, '4254543545', '', 'user', 'female'),
(16, 'ครูสมหมาย', 'ใจดี', 'test@gmail.com', '1234', 23, '1234567890', '', 'user', 'male'),
(17, 'ภานุวิท', 'ครับ', 'test01@gmail.com', '1234', 26, '0123456789', '', 'user', 'female'),
(18, 'ภานุวิช', 'ปัสสาโท', 'panuwit999@gmail.com', '1234', 23, '0123456876', 'files/file-1710695209035.jpg', 'admin', 'male'),
(19, 'panu', 'ok', 'panu001@gmail.com', '1234', 21, '1234567890', 'files/file-1711077273841.jpg', 'user', 'male'),
(20, 'ภาณุ', 'ปัสส', 'panuwit14587@gmail.com', '1234', 20, '0973077786', 'files/file-1711083539493.jpg', 'user', 'male'),
(21, 'panu', 'passa', 'panu111@gmail.com', '1234', 20, '0973077786', 'files/file-1711086149596.gif', 'user', 'male');

-- --------------------------------------------------------

--
-- Table structure for table `massagequeue`
--

CREATE TABLE `massagequeue` (
  `massagequeueId` int(3) NOT NULL,
  `masseuseId` int(3) NOT NULL,
  `date` date NOT NULL,
  `time_start` time NOT NULL,
  `time_end` time NOT NULL,
  `detail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `massagequeue`
--

INSERT INTO `massagequeue` (`massagequeueId`, `masseuseId`, `date`, `time_start`, `time_end`, `detail`) VALUES
(1, 3, '2023-08-27', '00:00:00', '00:00:00', 'นวดแผนไทย'),
(2, 0, '2024-03-21', '00:00:00', '00:00:00', 'หมอนวดมาใหม่'),
(3, 0, '2024-03-21', '00:00:00', '00:00:00', 'test'),
(4, 4, '2024-03-22', '00:00:00', '00:00:00', 'test'),
(5, 5, '2024-03-22', '00:00:00', '00:00:00', 'detail'),
(6, 6, '2024-03-22', '00:00:00', '00:00:00', 'ดีเทล');

-- --------------------------------------------------------

--
-- Table structure for table `masseuse`
--

CREATE TABLE `masseuse` (
  `masseuseId` int(3) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `age` int(2) NOT NULL,
  `profile` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `masseuse`
--

INSERT INTO `masseuse` (`masseuseId`, `firstname`, `lastname`, `age`, `profile`) VALUES
(2, 'ภานุวิช', 'หมอใจดี', 22, 'files/file-1711075358159.jpg'),
(3, 'สมปอง', 'บ้านเดื่อ', 36, 'files/file-1711008675862.jpg'),
(4, 'หมอนวดเอ', 'มาดี', 45, 'files/file-1711015432568.gif'),
(5, 'demo', 'test', 50, 'files/file-1711086857195.png'),
(6, 'หมอขาว', '123', 20, 'files/file-1711087928435.gif');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `queuebookingId` int(11) NOT NULL,
  `profile` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `queuebookingId`, `profile`) VALUES
(1, 2, 'fuke...'),
(2, 16, 'files/file-1711078880491.jpg'),
(3, 25, 'files/file-1711086245198.jpg'),
(4, 27, 'files/file-1711093168805.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `promotionId` int(3) NOT NULL,
  `title` varchar(255) NOT NULL,
  `discount` double(10,2) NOT NULL,
  `detail` varchar(255) NOT NULL,
  `profile` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `promotion`
--

INSERT INTO `promotion` (`promotionId`, `title`, `discount`, `detail`, `profile`) VALUES
(1, 'นวด 3 ชม ', 10.00, 'นวดครบสามชั่วโมงรับส่วนลด 10 %', ''),
(2, 'มาเยอะลดเยอะ', 15.00, 'มา 5 คนลดเลย 15%', 'files/file-1711039526649.gif'),
(3, 'นวด 3 ชม ลด 20 % ', 20.00, 'นวด 3 ชม ลด 20 %  หรือชวนเพื่อนมาด้วย', 'files/file-1711039933054.png');

-- --------------------------------------------------------

--
-- Table structure for table `queuebooking`
--

CREATE TABLE `queuebooking` (
  `queuebookingId` int(3) NOT NULL,
  `customerId` int(3) NOT NULL,
  `massagequeueId` int(3) NOT NULL,
  `massagetype` varchar(100) NOT NULL,
  `total` double(10,2) NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  `dateBooking` date DEFAULT current_timestamp(),
  `payment` varchar(20) NOT NULL DEFAULT 'ยังไม่ชำระ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `queuebooking`
--

INSERT INTO `queuebooking` (`queuebookingId`, `customerId`, `massagequeueId`, `massagetype`, `total`, `startTime`, `endTime`, `dateBooking`, `payment`) VALUES
(2, 14, 1, 'นวดอโรม่า', 399.00, '00:00:00', '00:00:00', '2023-08-27', 'ยังไม่ชำระ'),
(5, 13, 1, 'นวดอโรม่า', 399.00, '00:00:00', '00:00:00', '2023-08-27', 'ยังไม่ชำระ'),
(7, 18, 1, 'นวดอโรม่า', 399.00, '09:00:00', '12:00:00', '2023-08-27', 'ยังไม่ชำระ'),
(8, 12, 1, 'นวดฝ่าเท้า', 399.00, '09:00:00', '12:00:00', '2023-08-27', 'ยังไม่ชำระ'),
(10, 16, 1, 'นวดออยล์', 399.00, '09:00:00', '12:00:00', '2023-10-27', 'ยังไม่ชำระ'),
(11, 17, 1, 'นวดอโรม่า', 399.00, '09:00:00', '12:00:00', '2023-10-27', 'ยังไม่ชำระ'),
(12, 12, 1, 'นวดออยล์', 399.00, '09:00:00', '12:00:00', '2023-10-27', 'ยังไม่ชำระ'),
(13, 12, 1, 'นวดอโรม่า', 399.00, '09:00:00', '12:00:00', '2023-10-27', 'ยังไม่ชำระ'),
(16, 19, 3, 'นวดออยล์', 450.00, '16:00:00', '17:00:00', '2024-03-22', 'ชำระเงินสำเร็จ'),
(17, 19, 3, 'นวดออยล์', 425.00, '16:30:00', '17:30:00', '2024-03-22', 'ยังไม่ชำระ'),
(19, 19, 3, 'นวดออยล์', 425.00, '16:30:00', '17:30:00', '2024-03-22', 'ยังไม่ชำระ'),
(20, 19, 3, 'นวดออยล์', 400.00, '16:00:00', '17:00:00', '2024-03-22', 'ยังไม่ชำระ'),
(21, 19, 3, 'นวดออยล์', 400.00, '16:30:00', '17:30:00', '2024-03-22', 'ยังไม่ชำระ'),
(23, 20, 3, 'นวดออยล์', 400.00, '16:30:00', '17:30:00', '2024-03-22', 'ยังไม่ชำระ'),
(25, 21, 3, 'นวดอโรม่า', 400.00, '16:00:00', '17:00:00', '2024-03-22', 'ชำระเงินสำเร็จ'),
(26, 21, 3, 'นวดอโรม่า', 450.00, '16:30:00', '17:30:00', '2024-03-22', 'ยังไม่ชำระ'),
(27, 19, 4, 'นวดอโรม่า', 400.00, '09:00:00', '14:00:00', '2024-03-22', 'แจ้งชำระเงินแล้ว');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `reviewId` int(3) NOT NULL,
  `queuebookingId` varchar(255) NOT NULL,
  `reviewname` varchar(255) NOT NULL,
  `reviewdetail` varchar(255) NOT NULL,
  `dateTime` date NOT NULL,
  `customerId` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `statusqueue`
--

CREATE TABLE `statusqueue` (
  `statusqueueId` int(3) NOT NULL,
  `massagequeueId` int(3) NOT NULL,
  `status` varchar(20) NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `statusqueue`
--

INSERT INTO `statusqueue` (`statusqueueId`, `massagequeueId`, `status`, `startTime`, `endTime`, `date`) VALUES
(1, 2, 'ว่าง', '09:00:00', '12:00:00', '2023-08-27'),
(2, 1, 'ว่าง', '15:00:00', '16:00:00', '2023-08-27'),
(3, 1, 'ว่าง', '14:00:00', '15:00:00', '2023-10-27'),
(4, 2, 'ว่าง', '16:00:00', '17:00:00', '2024-03-21'),
(5, 3, 'ไม่ว่าง', '16:00:00', '17:00:00', '2024-03-21'),
(6, 3, 'ไม่ว่าง', '16:30:00', '17:30:00', '2024-03-21'),
(7, 4, 'ไม่ว่าง', '09:00:00', '14:00:00', '2024-03-21'),
(8, 4, 'ว่าง', '17:00:00', '18:00:00', '2024-03-22'),
(9, 5, 'ว่าง', '16:00:00', '18:00:00', '2024-03-22'),
(10, 6, 'ว่าง', '12:00:00', '14:00:00', '2024-03-22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customerId`);

--
-- Indexes for table `massagequeue`
--
ALTER TABLE `massagequeue`
  ADD PRIMARY KEY (`massagequeueId`);

--
-- Indexes for table `masseuse`
--
ALTER TABLE `masseuse`
  ADD PRIMARY KEY (`masseuseId`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`promotionId`);

--
-- Indexes for table `queuebooking`
--
ALTER TABLE `queuebooking`
  ADD PRIMARY KEY (`queuebookingId`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`reviewId`);

--
-- Indexes for table `statusqueue`
--
ALTER TABLE `statusqueue`
  ADD PRIMARY KEY (`statusqueueId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customerId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `massagequeue`
--
ALTER TABLE `massagequeue`
  MODIFY `massagequeueId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `masseuse`
--
ALTER TABLE `masseuse`
  MODIFY `masseuseId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `promotionId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `queuebooking`
--
ALTER TABLE `queuebooking`
  MODIFY `queuebookingId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `reviewId` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `statusqueue`
--
ALTER TABLE `statusqueue`
  MODIFY `statusqueueId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
