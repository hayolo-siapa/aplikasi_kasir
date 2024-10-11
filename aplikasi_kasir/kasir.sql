-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2024 at 02:32 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kasir`
--

-- --------------------------------------------------------

--
-- Table structure for table `kassa`
--

CREATE TABLE `kassa` (
  `idkassa` int(11) NOT NULL,
  `userkassa` varchar(10) NOT NULL,
  `pwdkassa` varchar(32) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `jkkassa` enum('L','P') NOT NULL DEFAULT 'L',
  `statuskassa` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `idkategori` int(3) UNSIGNED ZEROFILL NOT NULL,
  `namakategori` varchar(50) NOT NULL,
  `ketkategori` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`idkategori`, `namakategori`, `ketkategori`) VALUES
(001, 'CAMERA', NULL),
(002, 'AKSESORIS', NULL),
(006, 'LAPTOP', '');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `idproduk` int(11) NOT NULL,
  `kodeproduk` varchar(10) NOT NULL,
  `kategori` int(3) UNSIGNED ZEROFILL NOT NULL,
  `namaproduk` varchar(255) NOT NULL,
  `hargadasar` double NOT NULL,
  `hargajual` double NOT NULL,
  `stok` int(11) UNSIGNED NOT NULL,
  `stokminimal` tinyint(4) UNSIGNED DEFAULT NULL,
  `noticeproduk` varchar(255) DEFAULT NULL,
  `statusproduk` enum('Y','N') NOT NULL DEFAULT 'Y',
  `addedproduk` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`idproduk`, `kodeproduk`, `kategori`, `namaproduk`, `hargadasar`, `hargajual`, `stok`, `stokminimal`, `noticeproduk`, `statusproduk`, `addedproduk`) VALUES
(1, '100345', 001, 'Ezviz TY 1 Indoor', 350000, 400000, 2, 1, NULL, 'Y', '2024-10-08 13:19:12');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `idtr` int(11) NOT NULL,
  `faktur` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `produk` varchar(10) NOT NULL COMMENT 'kode produk',
  `nama_produk` varchar(255) NOT NULL,
  `harga` double UNSIGNED NOT NULL,
  `harga_dasar` double UNSIGNED NOT NULL COMMENT 'dari tb produk',
  `qty` int(10) UNSIGNED NOT NULL,
  `potongan` double NOT NULL,
  `kassa` int(11) NOT NULL,
  `nama_kassa` varchar(255) NOT NULL,
  `periode` varchar(5) NOT NULL,
  `added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_temp`
--

CREATE TABLE `transaksi_temp` (
  `idtr` int(11) NOT NULL,
  `faktur` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `produk` varchar(10) NOT NULL COMMENT 'kode produk',
  `nama_produk` varchar(255) NOT NULL,
  `harga` double UNSIGNED NOT NULL,
  `harga_dasar` double UNSIGNED NOT NULL COMMENT 'dari tb produk',
  `qty` int(10) UNSIGNED NOT NULL,
  `potongan` double NOT NULL,
  `kassa` int(11) NOT NULL,
  `nama_kassa` varchar(255) NOT NULL,
  `periode` varchar(5) NOT NULL,
  `added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kassa`
--
ALTER TABLE `kassa`
  ADD PRIMARY KEY (`idkassa`),
  ADD UNIQUE KEY `userkassa` (`userkassa`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`idkategori`),
  ADD UNIQUE KEY `namakategori` (`namakategori`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`idproduk`),
  ADD UNIQUE KEY `kodeproduk` (`kodeproduk`),
  ADD KEY `kategori` (`kategori`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`idtr`),
  ADD KEY `produk` (`produk`),
  ADD KEY `kassa` (`kassa`);

--
-- Indexes for table `transaksi_temp`
--
ALTER TABLE `transaksi_temp`
  ADD PRIMARY KEY (`idtr`),
  ADD KEY `produk` (`produk`),
  ADD KEY `kassa` (`kassa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kassa`
--
ALTER TABLE `kassa`
  MODIFY `idkassa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `idkategori` int(3) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `idproduk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `idtr` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaksi_temp`
--
ALTER TABLE `transaksi_temp`
  MODIFY `idtr` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`kategori`) REFERENCES `kategori` (`idkategori`) ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`produk`) REFERENCES `produk` (`kodeproduk`) ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`kassa`) REFERENCES `kassa` (`idkassa`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
