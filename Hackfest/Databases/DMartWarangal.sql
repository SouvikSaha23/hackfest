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
-- Database: `DMartWarangal`
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
(1, 'Bourbon', 25.5, 'DMW1'),
(2, 'Peanuts', 15, 'DMW2'),
(3, 'Fogg', 199, 'DMW3'),
(4, 'Skybags Luggage Bag', 5000, 'DMW4'),
(5, 'Mens\'s Tshirt', 899, 'DMW5'),
(6, 'Kissan Mixed Fruits Jam', 142, 'DMW6'),
(7, '2kg Sugar', 70, 'DMW7'),
(8, '1L Slice', 70, 'DMW8'),
(9, 'Hide & Seek', 30, 'DMW9'),
(10, 'Aquafina 1 Bottle', 20, 'DMW10'),
(11, 'Handkerchief 5Pcs', 120, 'DMW11'),
(12, 'Dettol Cool Soap', 25, 'DMW12');

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
