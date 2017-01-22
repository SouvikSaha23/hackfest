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
-- Database: `VishalMegamartRanchi`
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
(1, 'Bourbon', 25.5, 'VMR1'),
(2, 'T-shirt', 799, 'VMR2'),
(3, '1kg Rice', 50, 'VMR3'),
(4, '2kg Oranges', 90, 'VMR4'),
(5, 'DNMX Jeans', 1999, 'VMR5'),
(6, 'Kissan Mixed Fruits Jam', 146.5, 'VMR6'),
(7, 'Men\'s Jacket', 1500, 'VMR7'),
(8, '1L Maaza', 72, 'VMR8'),
(9, 'Sofa Cover', 1200, 'VMR9'),
(10, 'Titan Watch', 2200, 'VMR10'),
(11, 'Vim Soap', 30, 'VMR11'),
(12, 'Aerial 500g', 80, 'VMR12');

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
