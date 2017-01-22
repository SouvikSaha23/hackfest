-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 20, 2017 at 01:07 AM
-- Server version: 5.7.16-0ubuntu0.16.04.1
-- PHP Version: 7.0.14-2+deb.sury.org~xenial+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `BigBazarKolkata`
--

-- --------------------------------------------------------

--
-- Table structure for table `Items`
--

CREATE TABLE `Items` (
  `Id` int(11) NOT NULL,
  `Name` text,
  `Price` float DEFAULT NULL,
  `Code` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Items`
--

INSERT INTO `Items` (`Id`, `Name`, `Price`, `Code`) VALUES
(1, 'Sony LED TV 45 inch', 45000, 'BBK1'),
(2, 'Men Formal Tshirt', 1249, 'BBK2'),
(3, 'Baby Corn', 150.49, 'BBK3'),
(4, 'Sony Mixer Grinder ', 8999, 'BBK4'),
(5, 'Titan Eye Lens', 2500, 'BBK5'),
(6, 'Washing Machine', 12000, 'BBK6'),
(7, 'Iphone7', 70000, 'BBK7'),
(8, 'Frooti', 10, 'BBK8'),
(9, 'Sweatshirt', 1399, 'BBK9'),
(10, 'Panasonic Sound System', 5999, 'BBK10'),
(11, 'Prestige Induction Cooker', 1200, 'BBK11'),
(12, 'Dove Soap', 45, 'BBK12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Items`
--
ALTER TABLE `Items`
  ADD PRIMARY KEY (`Id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
