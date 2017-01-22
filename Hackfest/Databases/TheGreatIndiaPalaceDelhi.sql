-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 20, 2017 at 01:08 AM
-- Server version: 5.7.16-0ubuntu0.16.04.1
-- PHP Version: 7.0.14-2+deb.sury.org~xenial+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `TheGreatIndiaPalaceDelhi`
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
(1, 'Sweet Corn', 150, 'TGIPD1'),
(2, 'Track Suit', 899, 'TGIPD2'),
(3, 'Dell Wireless Mouse', 849, 'TGIPD3'),
(4, 'Harpic Toilet Cleaner', 90, 'TGIPD4'),
(5, 'Samsung Galaxy J7', 16999, 'TGIPD5'),
(6, 'Leather Jacket', 3999, 'TGIPD6'),
(7, 'Mobile Charger', 150, 'TGIPD7'),
(8, '1L Slice', 72, 'TGIPD8'),
(9, 'Sunfeast Dark Fantsy', 50, 'TGIPD9'),
(10, 'Laptop Adaptor', 999, 'TGIPD10'),
(11, 'HP Laptop Bag', 899, 'TGIPD11'),
(12, 'JBL Speakers', 5999, 'TGIPD12');

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
