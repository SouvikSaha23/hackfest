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
-- Database: `InorbitMallMumbai`
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
(1, 'Sony Android Tv 45inch', 120000, 'IMM1'),
(2, 'Adidas Shoes', 4999, 'IMM2'),
(3, 'Fastrack Watch', 2599, 'IMM3'),
(4, 'Iphone 6S', 60000, 'IMM4'),
(5, 'Sony Headset Wireless', 12999, 'IMM5'),
(6, 'Lenovo A6000 PLus', 7500, 'IMM6'),
(7, 'HP 15 Notebook AC082TX', 42000, 'IMM7'),
(8, '2L Slice', 140, 'IMM8'),
(9, 'Kurkure Chilli Chatka', 20, 'IMM9'),
(10, 'Samsung Android Wathch', 12000, 'IMM10'),
(11, '1L Bisleri Bottle', 25, 'IMM11'),
(12, 'JBL Wireless Speakers', 6999, 'IMM12');

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
