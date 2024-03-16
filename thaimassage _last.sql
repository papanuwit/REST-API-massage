-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 09, 2023 at 09:13 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

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
  `phonenumber` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customerId`, `firstname`, `lastname`, `email`, `password`, `age`, `phonenumber`) VALUES
(5, 'ตนุภัทร', 'สิทธิวงศ์', 'tanupat@gmail.com', '1234', 24, '0983460756'),
(6, 'Tanupat', 'Sittiwong', 'tanupats@gmail.com', '123', 29, '0983460756'),
(7, 'ตนุภัทร', 'สิทธิวงศ์', 'tanupat@gmail.com', '123', 24, '0983460756'),
(8, 'sakorn', 'sittiwong', 'tanupat@gmail.co', 'sdfpoekf', 44, '0983895841'),
(9, 'sasi', 'sitti', 'tanupats@gmail.com', '123456', 20, '0983895841'),
(10, 'test', 'abv', 'tanupat285@gmail.com', '123', 18, '0983460756');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `massagequeue`
--

INSERT INTO `massagequeue` (`massagequeueId`, `masseuseId`, `date`, `time_start`, `time_end`, `detail`) VALUES
(1, 1, '2023-08-27', '09:00:00', '12:00:00', 'นวดแผนไทย');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `masseuse`
--

INSERT INTO `masseuse` (`masseuseId`, `firstname`, `lastname`, `age`, `profile`) VALUES
(1, 'jansuda', ' khanawapee', 20, 'https://www.sakonnakhonguide.com/upload/pics/9a11b02232729bc6db11fb777a4669d8.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `promotionId` int(3) NOT NULL,
  `title` varchar(255) NOT NULL,
  `discount` double(10,2) NOT NULL,
  `detail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `dateBooking` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `queuebooking`
--

INSERT INTO `queuebooking` (`queuebookingId`, `customerId`, `massagequeueId`, `massagetype`, `total`, `startTime`, `endTime`, `dateBooking`) VALUES
(1, 9, 1, '', 399.00, '00:00:00', '00:00:00', '2023-08-27'),
(2, 9, 1, 'นวดอโรม่า', 399.00, '00:00:00', '00:00:00', '2023-08-27'),
(3, 9, 1, '', 399.00, '00:00:00', '00:00:00', '2023-08-27'),
(4, 9, 1, '', 399.00, '00:00:00', '00:00:00', '2023-08-27'),
(5, 9, 1, 'นวดอโรม่า', 399.00, '00:00:00', '00:00:00', '2023-08-27'),
(6, 9, 1, '', 399.00, '00:00:01', '00:00:01', '2023-08-27'),
(7, 9, 1, 'นวดอโรม่า', 399.00, '09:00:00', '12:00:00', '2023-08-27'),
(8, 9, 1, 'นวดฝ่าเท้า', 399.00, '09:00:00', '12:00:00', '2023-08-27');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `statusqueue`
--

INSERT INTO `statusqueue` (`statusqueueId`, `massagequeueId`, `status`, `startTime`, `endTime`, `date`) VALUES
(1, 1, 'ว่าง', '09:00:00', '12:00:00', '2023-08-27'),
(2, 1, 'ว่าง', '15:00:00', '16:00:00', '2023-08-27');

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
  MODIFY `customerId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `massagequeue`
--
ALTER TABLE `massagequeue`
  MODIFY `massagequeueId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `masseuse`
--
ALTER TABLE `masseuse`
  MODIFY `masseuseId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `queuebooking`
--
ALTER TABLE `queuebooking`
  MODIFY `queuebookingId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `reviewId` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `statusqueue`
--
ALTER TABLE `statusqueue`
  MODIFY `statusqueueId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
