-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 12, 2018 at 09:09 AM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `impal-project`
--

-- --------------------------------------------------------

--
-- Table structure for table `Admin`
--

CREATE TABLE `Admin` (
  `idAdmin` varchar(20) NOT NULL,
  `usernameAdmin` varchar(30) NOT NULL,
  `passAdmin` varchar(50) NOT NULL,
  `emailAdmin` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `idCustomer` varchar(10) NOT NULL,
  `usernameCustomer` varchar(50) NOT NULL,
  `passCustomer` varchar(20) NOT NULL,
  `emailCustomer` varchar(50) NOT NULL,
  `namaCustomer` varchar(100) NOT NULL,
  `alamatCustomer` varchar(200) NOT NULL,
  `telpCustomer` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detilLaporan`
--

CREATE TABLE `detilLaporan` (
  `idDetilLaporan` varchar(20) NOT NULL,
  `idLaporan` varchar(20) NOT NULL,
  `idTransaksi` varchar(20) NOT NULL,
  `deskripsi` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Furniture`
--

CREATE TABLE `Furniture` (
  `idFurniture` varchar(20) NOT NULL,
  `namaFurniture` varchar(30) NOT NULL,
  `deskripsi` varchar(50) NOT NULL,
  `harga` int(15) NOT NULL,
  `idProdusen` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `itemTransaksi`
--

CREATE TABLE `itemTransaksi` (
  `idItemTransaksi` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `totalHargaItem` int(11) NOT NULL,
  `idFurniture` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Laporan`
--

CREATE TABLE `Laporan` (
  `idLaporan` varchar(20) NOT NULL,
  `tglLaporan` date NOT NULL,
  `idAdmin` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Produsen`
--

CREATE TABLE `Produsen` (
  `idProdusen` varchar(20) NOT NULL,
  `namaProdusen` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Transaksi`
--

CREATE TABLE `Transaksi` (
  `idTransaksi` varchar(20) NOT NULL,
  `tglTransaksi` date NOT NULL,
  `totalPembayaran` int(11) NOT NULL,
  `status` varchar(15) NOT NULL,
  `idCustomer` varchar(20) NOT NULL,
  `idItemTransaksi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Admin`
--
ALTER TABLE `Admin`
  ADD PRIMARY KEY (`idAdmin`),
  ADD UNIQUE KEY `usernameAdmin` (`usernameAdmin`),
  ADD UNIQUE KEY `emailAdmin` (`emailAdmin`);

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`idCustomer`),
  ADD UNIQUE KEY `idCustomer` (`idCustomer`,`usernameCustomer`,`emailCustomer`);

--
-- Indexes for table `detilLaporan`
--
ALTER TABLE `detilLaporan`
  ADD PRIMARY KEY (`idDetilLaporan`),
  ADD KEY `idLaporan` (`idLaporan`),
  ADD KEY `idTransaksi` (`idTransaksi`);

--
-- Indexes for table `Furniture`
--
ALTER TABLE `Furniture`
  ADD PRIMARY KEY (`idFurniture`),
  ADD UNIQUE KEY `namaFurniture` (`namaFurniture`),
  ADD KEY `idProdusen` (`idProdusen`);

--
-- Indexes for table `itemTransaksi`
--
ALTER TABLE `itemTransaksi`
  ADD PRIMARY KEY (`idItemTransaksi`),
  ADD KEY `idFurniture` (`idFurniture`);

--
-- Indexes for table `Laporan`
--
ALTER TABLE `Laporan`
  ADD PRIMARY KEY (`idLaporan`),
  ADD KEY `idAdmin` (`idAdmin`);

--
-- Indexes for table `Produsen`
--
ALTER TABLE `Produsen`
  ADD PRIMARY KEY (`idProdusen`),
  ADD UNIQUE KEY `namaProdusen` (`namaProdusen`);

--
-- Indexes for table `Transaksi`
--
ALTER TABLE `Transaksi`
  ADD PRIMARY KEY (`idTransaksi`),
  ADD KEY `idCustomer` (`idCustomer`),
  ADD KEY `idItemTransaksi` (`idItemTransaksi`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detilLaporan`
--
ALTER TABLE `detilLaporan`
  ADD CONSTRAINT `idLaporan` FOREIGN KEY (`idLaporan`) REFERENCES `Laporan` (`idLaporan`),
  ADD CONSTRAINT `idTransaksi` FOREIGN KEY (`idTransaksi`) REFERENCES `Transaksi` (`idTransaksi`);

--
-- Constraints for table `Furniture`
--
ALTER TABLE `Furniture`
  ADD CONSTRAINT `idProdusen` FOREIGN KEY (`idProdusen`) REFERENCES `Produsen` (`idProdusen`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `itemTransaksi`
--
ALTER TABLE `itemTransaksi`
  ADD CONSTRAINT `idFurniture` FOREIGN KEY (`idFurniture`) REFERENCES `Furniture` (`idFurniture`);

--
-- Constraints for table `Laporan`
--
ALTER TABLE `Laporan`
  ADD CONSTRAINT `idAdmin` FOREIGN KEY (`idAdmin`) REFERENCES `Admin` (`idAdmin`);

--
-- Constraints for table `Transaksi`
--
ALTER TABLE `Transaksi`
  ADD CONSTRAINT `idCustomer` FOREIGN KEY (`idCustomer`) REFERENCES `Customer` (`idCustomer`),
  ADD CONSTRAINT `idItemTransaksi` FOREIGN KEY (`idItemTransaksi`) REFERENCES `itemTransaksi` (`idItemTransaksi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
