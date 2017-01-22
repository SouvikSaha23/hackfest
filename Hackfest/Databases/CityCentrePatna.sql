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
-- Database: `CityCentrePatna`
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
(1, 'Vasaline Lip Balm', 25, 'CCP1'),
(2, 'Frontech Extension Chord', 250, 'CCP2'),
(3, 'Apple MacBook Pro', 154800, 'CCP3'),
(4, 'Pillow Cover', 149, 'CCP4'),
(5, 'Denims Jeans', 1999, 'CCP5'),
(6, 'Britania Jim Jam', 30, 'CCP6'),
(7, 'Samsung S6', 56000, 'CCP7'),
(8, '1L CocaCola', 84, 'CCP8'),
(9, 'Frontech Keyboard', 399, 'CCP9'),
(10, 'Link Hardened Steel Lock', 80, 'CCP10'),
(11, 'Bathing Robe', 560, 'CCP11'),
(12, 'Pantene Shampoo', 120, 'CCP12');

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
