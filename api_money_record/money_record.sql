-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 21, 2022 at 01:48 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `money_record`
--

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id_history` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  `total` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `created_at` varchar(50) NOT NULL,
  `updated_at` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id_history`, `id_user`, `type`, `date`, `total`, `details`, `created_at`, `updated_at`) VALUES
(1, 2, 'Pengeluaran', '2022-06-18', '7500.0', '[{\"name\":\"Cireng\",\"price\":\"2000\"},{\"name\":\"Bala-Bala\",\"price\":\"3000\"},{\"name\":\"Cimol\",\"price\":\"1000\"},{\"name\":\"Es Teh\",\"price\":\"1500\"}]', '2022-06-19T01:12:19.355228', '2022-06-19T11:36:44.850295'),
(2, 2, 'Pengeluaran', '2022-06-19', '15000.0', '[{\"name\":\"Es teh manis\",\"price\":\"4000\"},{\"name\":\"bakso\",\"price\":\"6000\"},{\"name\":\"Jus\",\"price\":\"5000\"}]', '2022-06-19T01:17:02.151015', '2022-06-19T11:34:04.975636'),
(4, 2, 'Pemasukan', '2022-06-20', '300000.0', '[{\"name\":\"aplikasi Touring\",\"price\":\"300000\"}]', '2022-06-20T22:27:22.694317', '2022-06-20T22:27:22.701227'),
(6, 2, 'Pengeluaran', '2022-06-20', '5000.0', '[{\"name\":\"Cilok\",\"price\":\"5000\"}]', '2022-06-20T23:53:12.115511', '2022-06-20T23:53:12.115686'),
(7, 2, 'Pengeluaran', '2022-06-21', '12000.0', '[{\"name\":\"Cimol\",\"price\":\"7000\"},{\"name\":\"Cipeng\",\"price\":\"5000\"}]', '2022-06-21T00:27:40.241810', '2022-06-21T00:40:04.123565'),
(8, 1, 'Pemasukan', '2022-08-20', '100000', '[{\"name\":\"jualan\",\"price\":\"100000\"}]', '2022-08-20T20:39:59.949', '2022-08-20T20:39:59.949'),
(9, 1, 'Pemasukan', '2022-08-20', '0', '[]', '2022-08-20T20:40:37.070', '2022-08-21T18:46:29.065'),
(10, 1, 'Pemasukan', '2022-08-21', '3000000', '[{\"name\":\"income dari saham\",\"price\":\"1000000\"},{\"name\":\"income dari bunga bank\",\"price\":\"2000000\"}]', '2022-08-21T18:45:27.079', '2022-08-21T18:45:27.080');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` varchar(50) NOT NULL,
  `updated_at` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', '202cb962ac59075b964b07152d234b70', '2022-01-09 02:17:44', '2022-01-09 02:17:44'),
(2, 'indra', 'indra@gmail.com', '202cb962ac59075b964b07152d234b70', '2022-06-17T16:44:58.031049', '2022-06-17T16:44:58.031193'),
(3, 'johan', 'johanhartono@gmail.com', '202cb962ac59075b964b07152d234b70', '1900-01-01', '1900-01-01'),
(4, 'linda', 'linda@gmail.com', '202cb962ac59075b964b07152d234b70', '2022-08-20T14:26:51.053551', '2022-08-20T14:26:51.075455'),
(5, 'shia', 'shia@gmail.com', '202cb962ac59075b964b07152d234b70', '2022-08-20T14:37:19.895527', '2022-08-20T14:37:19.907839'),
(6, 'linshia', 'lilnda@gmail.com', '202cb962ac59075b964b07152d234b70', '2022-08-20T14:43:18.266722', '2022-08-20T14:43:18.268934'),
(7, 'hhs', 'sss', '5283b9cd76f000def23a69e32d9df8ec', '2022-08-20T14:44:08.680407', '2022-08-20T14:44:08.680557'),
(8, 'han', 'johan@gmail.com', '202cb962ac59075b964b07152d234b70', '2022-08-20T14:50:07.860435', '2022-08-20T14:50:07.871422'),
(9, 'hanjo', 'hanjo@gmail.com', '202cb962ac59075b964b07152d234b70', '2022-08-20T14:52:05.753226', '2022-08-20T14:52:05.753466'),
(10, 'sudiman', 'sudiman@gmail.com', '202cb962ac59075b964b07152d234b70', '2022-08-20T14:52:52.248803', '2022-08-20T14:52:52.250733'),
(11, 'hartono', 'hartono@gmail.com', '202cb962ac59075b964b07152d234b70', '2022-08-20T14:53:43.630505', '2022-08-20T14:53:43.632451'),
(12, 'hartonos', 'hartonos@gmail.com', '202cb962ac59075b964b07152d234b70', '2022-08-20T14:54:24.800930', '2022-08-20T14:54:24.802820');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id_history`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id_history` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
