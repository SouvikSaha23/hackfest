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
-- Database: `BigBazarDhanbad`
--

-- --------------------------------------------------------

--
-- Table structure for table `Items`
--

CREATE TABLE `Items` (
  `Id` int(11) NOT NULL,
  `Name` text,
  `Price` float NOT NULL,
  `Code` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Items`
--

INSERT INTO `Items` (`Id`, `Name`, `Price`, `Code`) VALUES
(1, 'Bourbon', 25.5, 'BBD1'),
(2, 'T-shirt', 799, 'BBD2'),
(3, '1kg Rice', 50, 'BBD3'),
(4, '2kg Apples', 90, 'BBD4'),
(5, 'DNMX Jeans', 1999, 'BBD5'),
(6, 'Kissan Mixed Fruits Jam', 146.5, 'BBD6'),
(7, 'Mobile Charger', 150, 'BBD7'),
(8, '1L Slice', 72, 'BBD8'),
(9, 'Nokia 114', 3499, 'BBD9'),
(10, 'Jacket', 2200, 'BBD10'),
(11, 'Towel', 350, 'BBD11'),
(12, 'Dettol Handwash', 80, 'BBD12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Items`
--
ALTER TABLE `Items`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Id` (`Id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
