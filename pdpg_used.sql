-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2017 at 06:25 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES tis620 */;

--
-- Database: `kkp_usedcar`
--

-- --------------------------------------------------------

--
-- Table structure for table `pdpg_used`
--

CREATE TABLE `pdpg_used` (
  `pdpgId` int(5) NOT NULL,
  `gradeTentId` int(2) NOT NULL,
  `NCB_Type` int(2) NOT NULL,
  `NCB_Name` varchar(20) COLLATE utf8_bin NOT NULL,
  `occupation` varchar(10) COLLATE utf8_bin NOT NULL,
  `carAge` int(2) NOT NULL,
  `maxLTV` int(3) NOT NULL,
  `maxTerm` int(2) NOT NULL,
  `DBR` float NOT NULL DEFAULT '0',
  `IIR` int(2) NOT NULL DEFAULT '0',
  `conditionExcept` bigint(12) NOT NULL,
  `description` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `pdpg_used`
--

;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pdpg_used`
--
ALTER TABLE `pdpg_used`
  ADD PRIMARY KEY (`pdpgId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pdpg_used`
--
ALTER TABLE `pdpg_used`
  MODIFY `pdpgId` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
