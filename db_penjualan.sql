-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2024 at 10:48 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_penjualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(8) NOT NULL,
  `barkode` int(20) NOT NULL,
  `name` char(100) NOT NULL,
  `harga_jual` bigint(20) NOT NULL,
  `harga_beli` bigint(20) NOT NULL,
  `stok` int(10) NOT NULL,
  `kategori_id` int(8) NOT NULL,
  `satuan_id` int(8) NOT NULL,
  `supplier_id` int(8) NOT NULL,
  `user_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `barkode`, `name`, `harga_jual`, `harga_beli`, `stok`, `kategori_id`, `satuan_id`, `supplier_id`, `user_id`) VALUES
(1, 100, 'Paracetamol', 10, 5, 100, 1, 1, 1, 122),
(2, 101, 'Sabun', 12, 10, 30, 5, 4, 2, 127),
(3, 199, 'Kacangan', 15, 9, 10, 3, 6, 3, 124),
(4, 1122, 'Ice', 16, 8, 100, 4, 2, 4, 123),
(5, 1009, 'Pop Mie', 7, 4, 60, 3, 6, 3, 124),
(6, 88, 'Sabun Muka', 17, 10, 70, 5, 3, 6, 126);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(8) NOT NULL,
  `name` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `name`) VALUES
(1, 'Obat'),
(2, 'Minuman'),
(3, 'Makanan'),
(4, 'Snack'),
(5, 'Kecantikan'),
(6, 'Sabun');

-- --------------------------------------------------------

--
-- Table structure for table `kustomer`
--

CREATE TABLE `kustomer` (
  `id` int(8) NOT NULL,
  `nik` int(16) NOT NULL,
  `name` char(100) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `telp` char(20) NOT NULL,
  `email` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kustomer`
--

INSERT INTO `kustomer` (`id`, `nik`, `name`, `alamat`, `telp`, `email`) VALUES
(1, 12345, 'Muhammad Reza', 'Jln.Ahmad Yani', '082252453775', 'Muhazasaya@gmail.com'),
(2, 12341, 'Reza Syafi\'i', 'Jln.Pangeran', '082252453779', 'syafii99@gmail.com'),
(3, 992, 'Aulia Sari', 'Jln.Anggrek', '082252453798', 'sariaaaulia@gmail.com'),
(4, 33442, 'Nezukoo', 'Jln.Isekai', '082252453122', 'nejukooo@gmail.com'),
(5, 1092, 'Obanai', 'Jln.Ice BLue', '08225245312', 'Banaiii87@gmail.com'),
(6, 2902, 'Kakashi', 'Jln.Konohaa aja', '082252453128', 'kkakashi@gmmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id` int(8) NOT NULL,
  `invoice` int(20) NOT NULL,
  `total` bigint(20) NOT NULL,
  `bayar` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `diskripsi` varchar(266) NOT NULL,
  `supplier_id` int(8) NOT NULL,
  `user_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id`, `invoice`, `total`, `bayar`, `tanggal`, `diskripsi`, `supplier_id`, `user_id`) VALUES
(1, 100, 90, 90, '2024-04-01', 'Bagus Sekali', 900, 89),
(2, 11, 100, 180, '2024-04-02', 'Bagus', 100, 900),
(3, 88, 10, 60, '2024-04-03', 'Kurang', 199, 267),
(4, 122, 11, 170, '2024-04-04', 'Baik Sekali', 99, 100),
(5, 94, 200, 50, '2024-04-05', 'Mantapp', 12, 100),
(6, 200, 20, 250, '2024-04-06', 'Baik Saja', 44, 100);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_detail`
--

CREATE TABLE `pembelian_detail` (
  `id` int(8) NOT NULL,
  `harga` int(11) NOT NULL,
  `qty` int(10) NOT NULL,
  `subtotal` bigint(20) NOT NULL,
  `barang_id` int(8) NOT NULL,
  `pembelian_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembelian_detail`
--

INSERT INTO `pembelian_detail` (`id`, `harga`, `qty`, `subtotal`, `barang_id`, `pembelian_id`) VALUES
(1, 10, 10, 100, 1, 1),
(2, 12, 12, 10, 2, 2),
(3, 20, 20, 20, 3, 3),
(4, 50, 10, 10, 4, 4),
(5, 30, 12, 20, 5, 5),
(6, 20, 12, 20, 6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(8) NOT NULL,
  `invoice` int(20) NOT NULL,
  `total` bigint(20) NOT NULL,
  `bayar` int(11) NOT NULL,
  `kembali` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `kustomer_id` int(8) NOT NULL,
  `user_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id`, `invoice`, `total`, `bayar`, `kembali`, `tanggal`, `kustomer_id`, `user_id`) VALUES
(1, 10, 10, 10, 1, '2024-04-01', 3, 100),
(2, 11, 10, 90, 10, '2024-04-02', 6, 100),
(3, 14, 12, 10, 1, '2024-04-03', 1, 10),
(4, 5, 10, 50, 10, '2024-04-04', 4, 20),
(5, 12, 20, 40, 5, '2024-04-05', 5, 20),
(6, 20, 12, 20, 10, '2024-04-06', 2, 10);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_detail`
--

CREATE TABLE `penjualan_detail` (
  `id` int(8) NOT NULL,
  `harga` int(11) NOT NULL,
  `qty` int(10) NOT NULL,
  `subtotal` bigint(20) NOT NULL,
  `barang_id` int(8) NOT NULL,
  `penjualan_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penjualan_detail`
--

INSERT INTO `penjualan_detail` (`id`, `harga`, `qty`, `subtotal`, `barang_id`, `penjualan_id`) VALUES
(1, 10, 10, 100, 1, 1),
(2, 20, 20, 200, 2, 2),
(3, 12, 12, 120, 3, 3),
(4, 20, 20, 20, 4, 4),
(5, 50, 30, 10, 6, 6),
(6, 10, 1, 100, 6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE `satuan` (
  `id` int(8) NOT NULL,
  `name` char(100) NOT NULL,
  `diskripsi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `satuan`
--

INSERT INTO `satuan` (`id`, `name`, `diskripsi`) VALUES
(1, 'Paracetamol', 'Meredakan Sakit Kepala'),
(2, 'Ice Cream', 'Menaikkan Mood Wanita'),
(3, 'Face Wash', 'Mengurangi Minyak di Muka\r\n'),
(4, 'Sabun', 'Wanginya Enak'),
(5, 'Minuman Sosro', 'Menyegarkan Tenggorokan'),
(6, 'Kacang Garuda', 'Menemani nonton bareng keluarga');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(8) NOT NULL,
  `nik` int(16) NOT NULL,
  `name` char(100) NOT NULL,
  `telp` char(20) NOT NULL,
  `email` varchar(150) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `perusahaan` varchar(150) NOT NULL,
  `nama_bank` varchar(150) NOT NULL,
  `nama_akun_bank` varchar(150) NOT NULL,
  `no_akun_bank` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `nik`, `name`, `telp`, `email`, `alamat`, `perusahaan`, `nama_bank`, `nama_akun_bank`, `no_akun_bank`) VALUES
(1, 22100200, 'Reza', '082252453775', 'reza00@gmail.com', 'Jln.Hasan Basri', 'Tencent', 'BRI', 'MUHAMMAD REZA', '00998877'),
(2, 221002001, 'Syafii', '082252453776', 'syafii@gmail.com', 'Jln.Pasar', 'Ubi', 'BRI', 'Muhammad Syafii', '00998866'),
(3, 221002003, 'Muhammad', '082252453777', 'Muhammad@gmail.com', 'Jln.Ahyani', 'Tambang', 'BNI', 'Muhammmadd', '9900112'),
(4, 221002004, 'Aulia', '082252453771', 'aulia990@gmail.com', 'Jln.Pemuda Lestari', 'Bank', 'BNI', 'Auliaaa0', '0091209'),
(5, 221002005, 'Febyani', '08225245312', 'febyani099@gmail.com', 'Jln.Cantika Lestari', 'Bank', 'Mandiri', 'Febyaniajaa', '099334'),
(6, 221002006, 'Arif Maulana', '082252453128', 'maulana99@gmail.com', 'Jln.Indah Baru', 'BUMN', 'BNI', 'Maulanajaaa', '9220332');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(8) NOT NULL,
  `nik` int(16) NOT NULL,
  `username` char(100) NOT NULL,
  `full_name` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `tipe` char(20) NOT NULL,
  `email` varchar(150) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `telp` char(20) NOT NULL,
  `is_active` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nik`, `username`, `full_name`, `password`, `tipe`, `email`, `alamat`, `telp`, `is_active`) VALUES
(122, 22100200, 'Reza', 'Muhammadb Reza Syafi\'i', 'rezausd00', 'admin', 'muhazasya@gmail.com', 'Jln. Hasan Basri', '082252453775', 'active'),
(123, 221002001, 'Aulia', 'Aulia Sari Febyani', 'aulia00', 'kasir', 'aulia120@gmai.com', 'Jln.Akasia', '082252453776', 'active'),
(124, 221002002, 'Muhammad', 'Muhammad Syafi\'i Reza', 'muhammad00', 'pegawai', 'muhammad00@gmail.com', 'Jln.Baliuk', '082252453777', 'active'),
(125, 221002003, 'Febyani', 'Febyani Sari', 'saiiiri09', 'pegawai', 'febyarii@gmail.com', 'Jln.Merdeka Jaya', '082252453778', 'active'),
(126, 221002004, 'Arif', 'Arif Maulana', 'lanamau00', 'admin', 'maualanajaa@gmail.com', 'Jln.Pemuda', '082252453779', 'inactive'),
(127, 221002005, 'Syaf\'i', 'Muhammad Syafi\'i', 'syafii879', 'pegawai', 'syafii19@gmail.com', 'Jln.Ahmad Yani', '082252453770', 'inactive');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategori_id` (`kategori_id`,`satuan_id`,`supplier_id`,`user_id`),
  ADD KEY `satuan_id` (`satuan_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kustomer`
--
ALTER TABLE `kustomer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pembelian_detail_ibfk_2` (`barang_id`),
  ADD KEY `pembelian_id` (`pembelian_id`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kustomer_id` (`kustomer_id`);

--
-- Indexes for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penjualan_id` (`penjualan_id`),
  ADD KEY `barang_id` (`barang_id`);

--
-- Indexes for table `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`),
  ADD CONSTRAINT `barang_ibfk_2` FOREIGN KEY (`satuan_id`) REFERENCES `satuan` (`id`),
  ADD CONSTRAINT `barang_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`),
  ADD CONSTRAINT `barang_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  ADD CONSTRAINT `pembelian_detail_ibfk_2` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`),
  ADD CONSTRAINT `pembelian_detail_ibfk_3` FOREIGN KEY (`pembelian_id`) REFERENCES `pembelian` (`id`);

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`kustomer_id`) REFERENCES `kustomer` (`id`);

--
-- Constraints for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  ADD CONSTRAINT `penjualan_detail_ibfk_2` FOREIGN KEY (`penjualan_id`) REFERENCES `penjualan` (`id`),
  ADD CONSTRAINT `penjualan_detail_ibfk_3` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
