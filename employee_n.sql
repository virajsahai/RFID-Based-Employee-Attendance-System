-- phpMyAdmin SQL Dump
-- version 4.3.11.1
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Oct 09, 2016 at 08:20 PM
-- Server version: 5.5.42
-- PHP Version: 5.4.39

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `employee_n`
--

-- --------------------------------------------------------

--
-- Table structure for table `1_102015`
--

CREATE TABLE IF NOT EXISTS `1_102015` (
  `srl` int(11) NOT NULL,
  `att_date` date DEFAULT NULL,
  `in_time` time DEFAULT NULL,
  `out_time` time DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `1_102015`
--

INSERT INTO `1_102015` (`srl`, `att_date`, `in_time`, `out_time`) VALUES
(1, '2015-10-25', '19:59:25', '19:59:44'),
(2, '2015-10-28', '14:51:48', '14:52:06');

-- --------------------------------------------------------

--
-- Table structure for table `1_attn_mo`
--

CREATE TABLE IF NOT EXISTS `1_attn_mo` (
  `serial` int(8) NOT NULL,
  `mon_yr` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `1_attn_mo`
--

INSERT INTO `1_attn_mo` (`serial`, `mon_yr`) VALUES
(0, 102015);

-- --------------------------------------------------------

--
-- Table structure for table `2_102015`
--

CREATE TABLE IF NOT EXISTS `2_102015` (
  `srl` int(11) NOT NULL,
  `att_date` date DEFAULT NULL,
  `in_time` time DEFAULT NULL,
  `out_time` time DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `2_102015`
--

INSERT INTO `2_102015` (`srl`, `att_date`, `in_time`, `out_time`) VALUES
(1, '2015-10-28', '14:53:52', '14:54:11');

-- --------------------------------------------------------

--
-- Table structure for table `2_attn_mo`
--

CREATE TABLE IF NOT EXISTS `2_attn_mo` (
  `serial` int(5) NOT NULL,
  `mon_yr` varchar(6) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `2_attn_mo`
--

INSERT INTO `2_attn_mo` (`serial`, `mon_yr`) VALUES
(1, '102015');

-- --------------------------------------------------------

--
-- Table structure for table `employee_dat`
--

CREATE TABLE IF NOT EXISTS `employee_dat` (
  `emp_id` int(8) NOT NULL,
  `emp_name` varchar(25) DEFAULT NULL,
  `emp_pass` varchar(25) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `contact` int(12) DEFAULT NULL,
  `emp_add` varchar(25) DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `rfid_num` varchar(25) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_dat`
--

INSERT INTO `employee_dat` (`emp_id`, `emp_name`, `emp_pass`, `email`, `contact`, `emp_add`, `join_date`, `rfid_num`) VALUES
(1, 'Rahul', 'test123', 'rah@gmail.com', 12345, 'Rah,123', '2015-10-25', ' 85 29 e0 74'),
(2, 'xyz', 'xyz', 'xyz', 123, 'qqq''', '2015-10-28', ' 36 8f 2d 3b');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `1_102015`
--
ALTER TABLE `1_102015`
  ADD PRIMARY KEY (`srl`);

--
-- Indexes for table `2_102015`
--
ALTER TABLE `2_102015`
  ADD PRIMARY KEY (`srl`);

--
-- Indexes for table `2_attn_mo`
--
ALTER TABLE `2_attn_mo`
  ADD PRIMARY KEY (`serial`);

--
-- Indexes for table `employee_dat`
--
ALTER TABLE `employee_dat`
  ADD PRIMARY KEY (`emp_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `1_102015`
--
ALTER TABLE `1_102015`
  MODIFY `srl` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `2_102015`
--
ALTER TABLE `2_102015`
  MODIFY `srl` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `2_attn_mo`
--
ALTER TABLE `2_attn_mo`
  MODIFY `serial` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `employee_dat`
--
ALTER TABLE `employee_dat`
  MODIFY `emp_id` int(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
