-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 22, 2017 at 10:14 AM
-- Server version: 5.7.16-0ubuntu0.16.04.1
-- PHP Version: 7.0.14-2+deb.sury.org~xenial+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping_malls`
--

-- --------------------------------------------------------

--
-- Table structure for table `Malls`
--

CREATE TABLE `Malls` (
  `Id` int(11) DEFAULT NULL,
  `Name` text,
  `Location` text,
  `QR_Code` text,
  `php_file` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Malls`
--

INSERT INTO `Malls` (`Id`, `Name`, `Location`, `QR_Code`, `php_file`) VALUES
(1, 'Big Bazar', 'Dhanbad, Jharkhand', 'BBD', 'Hackfest/php_files/BBD.php'),
(2, 'Vishal Megamart', 'Dhanbad,Jharkhand', 'VMD', 'Hackfest/php_files/VMD.php'),
(3, 'Big Bazar', 'Kolkata,West Bengal', 'BBK', 'Hackfest/php_files/BBK.php'),
(4, 'D Mart', 'Warangal,Telangana', 'DMW', 'Hackfest/php_files/DMW.php'),
(5, 'The Great India Place', 'Noida,Delhi', 'TGIPD', 'Hackfest/php_files/TGIPD.php'),
(6, 'Inorbit Mall', 'Mumbai,Maharashtra', 'IMM', 'Hackfest/php_files/IMM.php'),
(7, 'Vishal Megamart', 'Ranchi,Jharkhand', 'VMR', 'Hackfest/php_files/VMR.php'),
(8, 'City Centre Patna', 'Patna,Bihar', 'CCP', 'Hackfest/php_files/CCP.php');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Malls`
--
ALTER TABLE `Malls`
  ADD UNIQUE KEY `Id` (`Id`),
  ADD UNIQUE KEY `Id_2` (`Id`),
  ADD UNIQUE KEY `Id_3` (`Id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
