-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 20, 2020 at 12:25 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank`
--

-- --------------------------------------------------------

--
-- Table structure for table `applycar`
--
CREATE DATABASE bank;

USE bank;

CREATE TABLE `applycar` (
  `customerid` int(6) NOT NULL,
  `name` varchar(30) NOT NULL,
  `amount` double NOT NULL,
  `salary` double NOT NULL,
  `years` int(2) NOT NULL,
  `months` int(2) NOT NULL,
  `mobileno` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `applycredit`
--

CREATE TABLE `applycredit` (
  `customerid` int(6) NOT NULL,
  `name` varchar(30) NOT NULL,
  `salary` double NOT NULL,
  `mobileno` varchar(13) NOT NULL,
  `address` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `applydebit`
--

CREATE TABLE `applydebit` (
  `customerid` int(6) NOT NULL,
  `name` varchar(30) NOT NULL,
  `mobileno` bigint(13) NOT NULL,
  `dob` date NOT NULL,
  `address` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `applydebit`
--

INSERT INTO `applydebit` (`customerid`, `name`, `mobileno`, `dob`, `address`) VALUES
(500004, 'Chirag', 678967678, '3445-12-21', 'Chandigarh Group of colleges\r\nGate no. 6,Shantikunj Hostel');

-- --------------------------------------------------------

--
-- Table structure for table `applyhome`
--

CREATE TABLE `applyhome` (
  `customerid` int(6) NOT NULL,
  `name` varchar(30) NOT NULL,
  `amount` double NOT NULL,
  `salary` double NOT NULL,
  `years` int(2) NOT NULL,
  `months` int(2) NOT NULL,
  `mobileno` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `carloan`
--

CREATE TABLE `carloan` (
  `customerid` int(6) NOT NULL,
  `loanno` int(5) NOT NULL,
  `amount` double NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `years` int(2) NOT NULL,
  `months` int(2) NOT NULL,
  `installment` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carloan`
--

INSERT INTO `carloan` (`customerid`, `loanno`, `amount`, `date`, `years`, `months`, `installment`) VALUES
(500004, 10001, 500000, '2020-08-07 08:09:53', 6, 6, 63541.666666666664);

-- --------------------------------------------------------

--
-- Table structure for table `creditcard`
--

CREATE TABLE `creditcard` (
  `customerid` int(6) NOT NULL,
  `name` varchar(30) NOT NULL,
  `cardno` bigint(16) NOT NULL,
  `mobileno` bigint(13) NOT NULL,
  `pin` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `creditcard`
--

INSERT INTO `creditcard` (`customerid`, `name`, `cardno`, `mobileno`, `pin`) VALUES
(500004, 'Chirag', 1234123412340001, 9478507626, 1234),
(500006, 'tfuyt7', 1234123412340002, 76478995, 1234);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `sno` longtext NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pan` varchar(20) NOT NULL,
  `aadhar` bigint(12) NOT NULL,
  `fathername` varchar(100) NOT NULL,
  `gender` char(1) NOT NULL,
  `dob` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`sno`, `name`, `phone`, `email`, `pan`, `aadhar`, `fathername`, `gender`, `dob`, `address`, `password`) VALUES
('1', 'Batra Chirag', '567656568', 'gjkhk@hgdfghf', 'jhcgdfug5678', 6754799568, 'kgkgk', 'M', '2020-07-09', 'djhdjhdfdy', '1234'),
('2', 'Sourav Kumar', '7589315082', 'souravbansal@gmail.com', 'GUFY476CD', 662902564920, 'Narinder Kumar', 'M', '2001-02-04', 'Indra Basti', '1234'),
('4', 'jhgyi', '6768956', 'hgfh@rf', 'edyjy56', 657657690, 'dfudfg', 'M', '2020-07-02', 'dhdhyljyj', '5678'),
('5', 'rfutyitiu', '5685898', 'uughjig@hyfj', 'ghkgku89', 897856998, 'ytitui', 'M', '2020-07-18', 'hgdhjhgh', '3456'),
('6', 'rfutyitiu', '5685898', 'uughjig@hyfj', 'ghkgku89', 897856998, 'ytitui', 'M', '2020-07-18', 'hgdhjhgh', '3456'),
('6', 'Ashok Batra', '9417395026', 'ashokbatra05@gmail.com', 'TRCYU87UY', 235415402989, 'Sunder Lal', 'M', '1965-05-25', 'Cinema Chowk', '1234'),
('7', 'Ashok Batra', '9417395026', 'ashokbatra05@gmail.com', 'TRCYU87UY', 235415402989, 'Sunder Lal', 'M', '1965-05-25', 'Cinema Chowk', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `debitcard`
--

CREATE TABLE `debitcard` (
  `customerid` int(6) NOT NULL,
  `cardno` bigint(16) NOT NULL,
  `name` varchar(30) NOT NULL,
  `mobileno` bigint(13) NOT NULL,
  `dob` date NOT NULL,
  `pin` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `debitcard`
--

INSERT INTO `debitcard` (`customerid`, `cardno`, `name`, `mobileno`, `dob`, `pin`) VALUES
(500001, 5678567856780001, 'Chirag', 9876543210, '1993-11-15', 1234);

-- --------------------------------------------------------

--
-- Table structure for table `fds`
--

CREATE TABLE `fds` (
  `customerid` int(6) NOT NULL,
  `amount` double NOT NULL,
  `months` int(2) NOT NULL,
  `days` int(2) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fds`
--

INSERT INTO `fds` (`customerid`, `amount`, `months`, `days`, `date`) VALUES
(500001, 5600, 12, 0, '2020-08-05 06:35:21'),
(500006, 50, 1, 0, '2020-08-07 10:54:26'),
(500002, 200, 2, 0, '2020-08-07 10:55:58');

-- --------------------------------------------------------

--
-- Table structure for table `homeloan`
--

CREATE TABLE `homeloan` (
  `customerid` int(6) NOT NULL,
  `loanno` int(5) NOT NULL,
  `amount` double NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `years` int(2) NOT NULL,
  `months` int(2) NOT NULL,
  `installment` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `homeloan`
--

INSERT INTO `homeloan` (`customerid`, `loanno`, `amount`, `date`, `years`, `months`, `installment`) VALUES
(500004, 20001, 1500000, '2020-08-07 08:15:52', 15, 0, 152500);

-- --------------------------------------------------------

--
-- Table structure for table `permanentcustomers`
--

CREATE TABLE `permanentcustomers` (
  `sno` longtext NOT NULL,
  `customerid` bigint(10) NOT NULL,
  `accountno` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pan` varchar(20) NOT NULL,
  `aadhar` bigint(12) NOT NULL,
  `fathername` varchar(100) NOT NULL,
  `gender` char(1) NOT NULL,
  `dob` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `password` varchar(15) NOT NULL,
  `balance` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `permanentcustomers`
--

INSERT INTO `permanentcustomers` (`sno`, `customerid`, `accountno`, `name`, `phone`, `email`, `pan`, `aadhar`, `fathername`, `gender`, `dob`, `address`, `password`, `balance`) VALUES
('1', 500001, 500000001, 'Chirag', '9876543210', 'chirag@gmail.com', 'TRFYTYFHY7', 76869696976, 'Ashok Batra', 'M', '1993-11-15', 'Mohali', '5678', 1000),
('2', 500002, 500000002, 'Chirag Batra', '09478507626', 'batrachirag64@gmail.com', 'EKPQB1407L', 235415402998, 'Ashok Batra', 'M', '2000-10-18', 'Chandigarh Group of colleges\r\nGate no. 6,Shantikunj Hostel', 'cHIRAG18#', 800),
('3', 500003, 500000003, 'Chirag Batra', '09478507626', 'vmngfgh@yddugdk', 'hgdfysd', 9478507626, 'Ashok Batra', 'M', '2000-10-18', 'Chandigarh Group of colleges\r\nGate no. 6,Shantikunj Hostel', 'fgjd', 1000),
('4', 500004, 500000004, 'Chirag', '678967678', 'batra@gmail.com', 'TRCYU87UY', 7376746278, 'ffkjfj', 'M', '3445-12-21', 'Chandigarh Group of colleges\r\nGate no. 6,Shantikunj Hostel', '1234', 800),
('5', 500005, 500000005, 'tyuytuy', '769969690', 'fcfuu@bgkkg', 'jkfufuyk76', 78798895685, 'jhfjhfjh', 'M', '2020-07-18', 'yiyigtii', '1234', 1000),
('6', 500006, 500000006, 'tfuyt7', '76478995', 'batrachirag64@ytrty', 'hulkjbhjkl6', 568685686, 'dhfutifui', 'M', '2020-07-02', 'fjfjghgykghyijy', '1234', 900),
('7', 500007, 500000007, 'Sourav Kumar', '7589315082', 'souravbansal@gmail.com', 'GUFY476CD', 662902564920, 'Narinder Kumar', 'M', '2001-02-04', 'Indra Basti', '1234', 850);

-- --------------------------------------------------------

--
-- Table structure for table `rds`
--

CREATE TABLE `rds` (
  `customerid` int(6) NOT NULL,
  `amount` double NOT NULL,
  `months` int(3) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rds`
--

INSERT INTO `rds` (`customerid`, `amount`, `months`, `date`) VALUES
(500004, 2000, 12, '2020-08-04 18:30:00'),
(500002, 1100, 12, '2020-08-05 03:41:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `permanentcustomers`
--
ALTER TABLE `permanentcustomers`
  ADD PRIMARY KEY (`customerid`),
  ADD UNIQUE KEY `aadhar` (`aadhar`),
  ADD UNIQUE KEY `accountno` (`accountno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
