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
-- Database: `VishalMegamartDhanbad`
--

-- --------------------------------------------------------

--
-- Table structure for table `Items`
--

CREATE TABLE `Items` (
  `Id` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Price` float NOT NULL,
  `Code` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Items`
--

INSERT INTO `Items` (`Id`, `Name`, `Price`, `Code`) VALUES
(1, 'Cargo Track Pants', 1500, 'VMD1'),
(2, 'Men\'s T-shirt', 799, 'VMD2'),
(3, 'AXE Deo', 150, 'VMD3'),
(4, 'Bedsheet and Pillow cover', 1500, 'VMD4'),
(5, 'DNMX Jeans', 1999, 'VMD5'),
(6, 'Kissan Mixed Fruits Jam', 146.5, 'VMD6'),
(7, 'Red Label Tea 500gm', 237, 'VMD7'),
(8, '1L Slice', 72, 'VMD8'),
(9, 'Sonata Watch', 2500, 'VMD9'),
(10, 'Tropicana Orange Juice', 100, 'VMD10'),
(11, 'Towel', 350, 'VMD11'),
(12, 'Dettol Handwash', 80, 'VMD12');

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
