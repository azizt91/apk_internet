-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Mar 2024 pada 09.11
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `internet`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_bulan`
--

CREATE TABLE `tb_bulan` (
  `id_bulan` varchar(2) NOT NULL,
  `bulan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_bulan`
--

INSERT INTO `tb_bulan` (`id_bulan`, `bulan`) VALUES
('01', 'Januari'),
('02', 'Februari'),
('03', 'Maret'),
('04', 'April'),
('05', 'Mei'),
('06', 'Juni'),
('07', 'Juli'),
('08', 'Agustus'),
('09', 'September'),
('10', 'Oktober'),
('11', 'November'),
('12', 'Desember');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_paket`
--

CREATE TABLE `tb_paket` (
  `id_paket` varchar(6) NOT NULL,
  `paket` varchar(20) NOT NULL,
  `tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_paket`
--

INSERT INTO `tb_paket` (`id_paket`, `paket`, `tarif`) VALUES
('P001', '3 MB', 100000),
('P002', '5 MB', 150000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `id_pelanggan` varchar(6) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(15) NOT NULL,
  `level` varchar(5) NOT NULL DEFAULT 'PLG',
  `id_paket` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pelanggan`
--

INSERT INTO `tb_pelanggan` (`id_pelanggan`, `nama`, `alamat`, `no_hp`, `email`, `password`, `level`, `id_paket`) VALUES
('C001', 'Aufa', 'Pamutih', '6285292270450', 'aufa@gmail.com', '6368', 'PLG', 'P001'),
('C002', 'Mila', 'Pamutih', '6282329227692', 'mila@gmail.com', '2836', 'PLG', 'P002'),
('C003', 'Tc', 'Pamutih', '62895366892738', 'tc@gmail.com', '3417', 'PLG', 'P001'),
('C004', 'Wiwik', 'Pamutih', '6282322611096', 'wiwik@gmail.com', '9889', 'PLG', 'P002'),
('C005', 'Nunung', 'Pamutih', '6282327122994', 'nunung@gmail.com', '3795', 'PLG', 'P002');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `nama_pengguna` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `level` varchar(50) NOT NULL DEFAULT 'Administrator'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pengguna`
--

INSERT INTO `tb_pengguna` (`id_pengguna`, `nama_pengguna`, `username`, `password`, `level`) VALUES
(2, 'Taufiq Aziz', 'admin', '1', 'Administrator');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_tagihan`
--

CREATE TABLE `tb_tagihan` (
  `id_tagihan` int(11) NOT NULL,
  `bulan` varchar(3) NOT NULL,
  `tahun` year(4) NOT NULL,
  `id_pelanggan` varchar(6) NOT NULL,
  `tagihan` int(11) NOT NULL,
  `status` enum('BL','LS') NOT NULL,
  `tgl_bayar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_tagihan`
--

INSERT INTO `tb_tagihan` (`id_tagihan`, `bulan`, `tahun`, `id_pelanggan`, `tagihan`, `status`, `tgl_bayar`) VALUES
(57, '01', 2024, 'C001', 100000, 'LS', '2024-01-31'),
(58, '01', 2024, 'C002', 150000, 'BL', '0000-00-00'),
(59, '01', 2024, 'C003', 100000, 'BL', '0000-00-00'),
(60, '01', 2024, 'C004', 150000, 'BL', '0000-00-00'),
(61, '01', 2024, 'C005', 150000, 'BL', '0000-00-00');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_bulan`
--
ALTER TABLE `tb_bulan`
  ADD PRIMARY KEY (`id_bulan`);

--
-- Indeks untuk tabel `tb_paket`
--
ALTER TABLE `tb_paket`
  ADD PRIMARY KEY (`id_paket`);

--
-- Indeks untuk tabel `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`),
  ADD KEY `id_kamar` (`id_paket`);

--
-- Indeks untuk tabel `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indeks untuk tabel `tb_tagihan`
--
ALTER TABLE `tb_tagihan`
  ADD PRIMARY KEY (`id_tagihan`),
  ADD KEY `id_penghuni` (`id_pelanggan`),
  ADD KEY `bulan` (`bulan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_tagihan`
--
ALTER TABLE `tb_tagihan`
  MODIFY `id_tagihan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD CONSTRAINT `tb_pelanggan_ibfk_1` FOREIGN KEY (`id_paket`) REFERENCES `tb_paket` (`id_paket`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_tagihan`
--
ALTER TABLE `tb_tagihan`
  ADD CONSTRAINT `tb_tagihan_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `tb_pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_tagihan_ibfk_2` FOREIGN KEY (`bulan`) REFERENCES `tb_bulan` (`id_bulan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
