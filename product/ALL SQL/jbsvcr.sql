-- phpMyAdmin SQL Dump
-- version 3.1.3.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 05, 2013 at 12:58 AM
-- Server version: 5.1.33
-- PHP Version: 5.2.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jbsvcr`
--

-- --------------------------------------------------------

--
-- Table structure for table `agenda`
--

CREATE TABLE IF NOT EXISTS `agenda` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `tanggal` date NOT NULL,
  `judul` varchar(255) NOT NULL,
  `komentar` text NOT NULL,
  `idguru` varchar(20) DEFAULT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_agenda_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `agenda`
--


-- --------------------------------------------------------

--
-- Table structure for table `angket`
--

CREATE TABLE IF NOT EXISTS `angket` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) NOT NULL DEFAULT '',
  `tglmulai` date NOT NULL DEFAULT '0000-00-00',
  `tglakhir` date NOT NULL DEFAULT '0000-00-00',
  `jenis` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_angket_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `angket`
--


-- --------------------------------------------------------

--
-- Table structure for table `beritaguru`
--

CREATE TABLE IF NOT EXISTS `beritaguru` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `judul` varchar(255) NOT NULL,
  `tanggal` datetime NOT NULL,
  `abstrak` text NOT NULL,
  `isi` text NOT NULL,
  `idguru` varchar(20) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_beritaguru_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `beritaguru`
--


-- --------------------------------------------------------

--
-- Table structure for table `beritasekolah`
--

CREATE TABLE IF NOT EXISTS `beritasekolah` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `judul` varchar(255) NOT NULL,
  `tanggal` datetime NOT NULL,
  `jenisberita` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `abstrak` text NOT NULL,
  `isi` text NOT NULL,
  `idpengirim` varchar(20) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_beritasiswa_nip` (`idpengirim`),
  KEY `IX_beritasekolah_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `beritasekolah`
--


-- --------------------------------------------------------

--
-- Table structure for table `beritasiswa`
--

CREATE TABLE IF NOT EXISTS `beritasiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `judul` varchar(255) NOT NULL,
  `tanggal` datetime NOT NULL,
  `abstrak` text NOT NULL,
  `isi` text NOT NULL,
  `idpengirim` varchar(20) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_beritasiswa_nip` (`idpengirim`),
  KEY `IX_beritasiswa_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `beritasiswa`
--


-- --------------------------------------------------------

--
-- Table structure for table `buletin`
--

CREATE TABLE IF NOT EXISTS `buletin` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `tempatbuletin` varchar(50) NOT NULL,
  `tanggalbuletin` date NOT NULL,
  `judul` varchar(255) NOT NULL,
  `buletin` text NOT NULL,
  `idpengirim` varchar(20) NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `gambar` mediumblob,
  `tanggalinput` datetime DEFAULT NULL,
  `idkategori` int(10) unsigned DEFAULT '0',
  `tampil` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '''0 Null, 1 Situs, 2 Jibas, 3 Situs&Jibas''',
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_buletin_1` (`idkategori`),
  KEY `IX_buletin_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `buletin`
--


-- --------------------------------------------------------

--
-- Table structure for table `buletin_cmt`
--

CREATE TABLE IF NOT EXISTS `buletin_cmt` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idbuletin` int(10) unsigned NOT NULL,
  `tglpost` datetime NOT NULL,
  `idpenilai` varchar(20) NOT NULL,
  `komentar` varchar(100) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_buletin_cmt_idbuletin` (`idbuletin`),
  KEY `IX_buletin_cmt_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `buletin_cmt`
--


-- --------------------------------------------------------

--
-- Table structure for table `buletin_rate`
--

CREATE TABLE IF NOT EXISTS `buletin_rate` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idbuletin` int(10) unsigned NOT NULL,
  `tglpost` datetime NOT NULL,
  `idpenilai` varchar(20) NOT NULL,
  `rating` tinyint(3) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_buletin_rate_idbuletin` (`idbuletin`),
  KEY `IX_buletin_rate_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `buletin_rate`
--


-- --------------------------------------------------------

--
-- Table structure for table `catatankategori`
--

CREATE TABLE IF NOT EXISTS `catatankategori` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `kategori` varchar(255) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_catatankategori_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catatankategori`
--


-- --------------------------------------------------------

--
-- Table structure for table `catatansiswa`
--

CREATE TABLE IF NOT EXISTS `catatansiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idkategori` int(10) unsigned NOT NULL,
  `nis` varchar(20) NOT NULL,
  `idkelas` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `judul` varchar(255) NOT NULL,
  `catatan` text NOT NULL,
  `nip` varchar(20) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_catatansiswa_idkat` (`idkategori`),
  KEY `IX_catatansiswa_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `catatansiswa`
--


-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE IF NOT EXISTS `chat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `id` varchar(50) NOT NULL,
  `waktukirim` date NOT NULL,
  `pesan` text NOT NULL,
  `chatgroup` text NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_chat_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `chat`
--


-- --------------------------------------------------------

--
-- Table structure for table `dirshare`
--

CREATE TABLE IF NOT EXISTS `dirshare` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idroot` int(10) unsigned NOT NULL,
  `dirname` varchar(255) NOT NULL,
  `dirfullpath` varchar(255) NOT NULL,
  `idguru` varchar(20) DEFAULT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_dirshare_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `dirshare`
--

INSERT INTO `dirshare` (`replid`, `ts`, `token`, `issync`, `idroot`, `dirname`, `dirfullpath`, `idguru`, `nis`, `info1`, `info2`, `info3`) VALUES
(1, '2010-03-02 10:08:16', 60772, 0, 0, 'root', 'root/', NULL, NULL, NULL, NULL, NULL),
(2, '2010-03-12 09:49:11', 0, 0, 1, '101', 'root/101/', '101', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `draft`
--

CREATE TABLE IF NOT EXISTS `draft` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `tanggalpesan` datetime NOT NULL,
  `judul` varchar(255) NOT NULL,
  `pesan` text NOT NULL,
  `idpemilik` varchar(20) NOT NULL,
  `idpengirim` varchar(25) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_draft_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `draft`
--


-- --------------------------------------------------------

--
-- Table structure for table `fileshare`
--

CREATE TABLE IF NOT EXISTS `fileshare` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `iddir` int(10) unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  `filesize` int(11) NOT NULL,
  `filetime` datetime NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_fileshareguru_1` (`iddir`),
  KEY `IX_fileshare_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `fileshare`
--


-- --------------------------------------------------------

--
-- Table structure for table `galerifoto`
--

CREATE TABLE IF NOT EXISTS `galerifoto` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idguru` varchar(20) DEFAULT NULL,
  `foto` blob,
  `keterangan` varchar(255) DEFAULT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `fotokecil` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_galerifoto_nip` (`idguru`),
  KEY `IX_galerifoto_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `galerifoto`
--


-- --------------------------------------------------------

--
-- Table structure for table `gambarbuletin`
--

CREATE TABLE IF NOT EXISTS `gambarbuletin` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idpengirim` varchar(20) NOT NULL,
  `foto` mediumblob,
  `keterangan` varchar(255) DEFAULT NULL,
  `namafile` varchar(100) NOT NULL,
  `bulan` tinyint(2) unsigned NOT NULL,
  `tahun` int(4) unsigned NOT NULL,
  `filename` varchar(100) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_gambarbuletin_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `gambarbuletin`
--


-- --------------------------------------------------------

--
-- Table structure for table `gambarlogin`
--

CREATE TABLE IF NOT EXISTS `gambarlogin` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `direktori` varchar(255) NOT NULL,
  `namafile` varchar(255) NOT NULL,
  `aktif` tinyint(1) DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_gambarlogin_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `gambarlogin`
--


-- --------------------------------------------------------

--
-- Table structure for table `gambartiny`
--

CREATE TABLE IF NOT EXISTS `gambartiny` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idguru` varchar(20) DEFAULT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `foto` blob,
  `keterangan` varchar(255) DEFAULT NULL,
  `namagambar` varchar(100) DEFAULT NULL,
  `bulan` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `tahun` int(4) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_gambartiny_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `gambartiny`
--


-- --------------------------------------------------------

--
-- Table structure for table `gambartinypesan`
--

CREATE TABLE IF NOT EXISTS `gambartinypesan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idguru` varchar(20) DEFAULT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `namafile` varchar(255) DEFAULT NULL,
  `direktori` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `namagambar` varchar(100) DEFAULT NULL,
  `bulan` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `tahun` int(4) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_gambartinypesan_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `gambartinypesan`
--


-- --------------------------------------------------------

--
-- Table structure for table `jawabanangket`
--

CREATE TABLE IF NOT EXISTS `jawabanangket` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idjawab` int(10) unsigned NOT NULL DEFAULT '0',
  `idpertanyaan` int(10) unsigned NOT NULL DEFAULT '0',
  `idpilihan` int(10) unsigned DEFAULT NULL,
  `isian` text,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_jawabanangket_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jawabanangket`
--


-- --------------------------------------------------------

--
-- Table structure for table `jawabangket`
--

CREATE TABLE IF NOT EXISTS `jawabangket` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idangket` int(10) unsigned NOT NULL DEFAULT '0',
  `nis` varchar(20) DEFAULT NULL,
  `nip` varchar(20) DEFAULT NULL,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_jawabangket_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jawabangket`
--


-- --------------------------------------------------------

--
-- Table structure for table `kategoribuletin`
--

CREATE TABLE IF NOT EXISTS `kategoribuletin` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `kategori` varchar(100) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  UNIQUE KEY `Index_2` (`kategori`),
  KEY `IX_kategoribuletin_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `kategoribuletin`
--


-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE IF NOT EXISTS `komentar` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nip` varchar(20) DEFAULT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `owner` varchar(20) DEFAULT NULL,
  `komentar` text,
  `tanggal` datetime NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_komentar_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `komentar`
--


-- --------------------------------------------------------

--
-- Table structure for table `lampiranberitaguru`
--

CREATE TABLE IF NOT EXISTS `lampiranberitaguru` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idberita` int(10) unsigned NOT NULL,
  `namafile` varchar(255) NOT NULL,
  `direktori` varchar(255) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_lampiranberitaguru_1` (`idberita`),
  KEY `IX_lampiranberitaguru_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `lampiranberitaguru`
--


-- --------------------------------------------------------

--
-- Table structure for table `lampiranberitasiswa`
--

CREATE TABLE IF NOT EXISTS `lampiranberitasiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idberita` int(10) unsigned NOT NULL,
  `namafile` varchar(255) NOT NULL,
  `direktori` varchar(255) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_lampiranberitasiswa_1` (`idberita`),
  KEY `IX_lampiranberitasiswa_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `lampiranberitasiswa`
--


-- --------------------------------------------------------

--
-- Table structure for table `lampirandraft`
--

CREATE TABLE IF NOT EXISTS `lampirandraft` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idpesan` int(10) unsigned NOT NULL,
  `namafile` varchar(255) NOT NULL,
  `direktori` varchar(255) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_lampirandraft_idpesan` (`idpesan`),
  KEY `IX_lampirandraft_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `lampirandraft`
--


-- --------------------------------------------------------

--
-- Table structure for table `lampiranpesan`
--

CREATE TABLE IF NOT EXISTS `lampiranpesan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idpesan` int(10) unsigned NOT NULL,
  `namafile` varchar(255) NOT NULL,
  `direktori` varchar(255) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_lampiranpesan_1` (`idpesan`),
  KEY `IX_lampiranpesan_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `lampiranpesan`
--


-- --------------------------------------------------------

--
-- Table structure for table `mutiara`
--

CREATE TABLE IF NOT EXISTS `mutiara` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `kata` varchar(255) NOT NULL DEFAULT '',
  `firstname` varchar(20) NOT NULL DEFAULT '',
  `lastname` varchar(25) NOT NULL DEFAULT '',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_mutiara_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `mutiara`
--


-- --------------------------------------------------------

--
-- Table structure for table `new`
--

CREATE TABLE IF NOT EXISTS `new` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `foto` longblob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IX_new_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `new`
--


-- --------------------------------------------------------

--
-- Table structure for table `pertanyaan`
--

CREATE TABLE IF NOT EXISTS `pertanyaan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idangket` int(10) unsigned NOT NULL DEFAULT '0',
  `pertanyaan` varchar(1000) NOT NULL DEFAULT '',
  `jenis` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_pertanyaan_angket` (`idangket`),
  KEY `IX_pertanyaan_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `pertanyaan`
--


-- --------------------------------------------------------

--
-- Table structure for table `pesan`
--

CREATE TABLE IF NOT EXISTS `pesan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `tanggalpesan` datetime NOT NULL,
  `tanggaltampil` date DEFAULT NULL,
  `judul` varchar(255) NOT NULL,
  `pesan` text NOT NULL,
  `idguru` varchar(20) DEFAULT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `keguru` tinyint(1) unsigned DEFAULT '0',
  `kesiswa` tinyint(1) unsigned DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_pesan_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `pesan`
--


-- --------------------------------------------------------

--
-- Table structure for table `pesanterkirim`
--

CREATE TABLE IF NOT EXISTS `pesanterkirim` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `judul` varchar(255) NOT NULL,
  `idpesan` int(10) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_pesanterkirim_1` (`idpesan`),
  KEY `IX_pesanterkirim_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `pesanterkirim`
--


-- --------------------------------------------------------

--
-- Table structure for table `pilihan`
--

CREATE TABLE IF NOT EXISTS `pilihan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpertanyaan` int(10) unsigned NOT NULL DEFAULT '0',
  `pilihan` varchar(45) NOT NULL DEFAULT '',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_pilihan_pertanyaan` (`idpertanyaan`),
  KEY `IX_pilihan_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `pilihan`
--


-- --------------------------------------------------------

--
-- Table structure for table `profil`
--

CREATE TABLE IF NOT EXISTS `profil` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nip` varchar(20) DEFAULT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `telpon` varchar(45) DEFAULT NULL,
  `hp` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `hobi` text,
  `buku` text,
  `riwayat` text,
  `foto` mediumblob,
  `tentang` text,
  `nis` varchar(20) DEFAULT NULL,
  `bg` mediumblob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_profil_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `profil`
--


-- --------------------------------------------------------

--
-- Table structure for table `subkategoribuletin`
--

CREATE TABLE IF NOT EXISTS `subkategoribuletin` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `kategori` varchar(100) NOT NULL,
  `subkategori` varchar(100) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_subkategoribuletin_1` (`kategori`),
  KEY `IX_subkategoribuletin_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `subkategoribuletin`
--


-- --------------------------------------------------------

--
-- Table structure for table `tujuanpesan`
--

CREATE TABLE IF NOT EXISTS `tujuanpesan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `idpesan` int(10) unsigned NOT NULL,
  `idpenerima` varchar(20) NOT NULL,
  `baru` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_tujuanpesan_1` (`idpesan`),
  KEY `IX_tujuanpesan_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `tujuanpesan`
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `buletin_cmt`
--
ALTER TABLE `buletin_cmt`
  ADD CONSTRAINT `FK_buletin_cmt_idbuletin` FOREIGN KEY (`idbuletin`) REFERENCES `buletin` (`replid`) ON UPDATE CASCADE;

--
-- Constraints for table `buletin_rate`
--
ALTER TABLE `buletin_rate`
  ADD CONSTRAINT `FK_buletin_rate_idbuletin` FOREIGN KEY (`idbuletin`) REFERENCES `buletin` (`replid`) ON UPDATE CASCADE;

--
-- Constraints for table `catatansiswa`
--
ALTER TABLE `catatansiswa`
  ADD CONSTRAINT `FK_catatansiswa_idkat` FOREIGN KEY (`idkategori`) REFERENCES `catatankategori` (`replid`) ON UPDATE CASCADE;

--
-- Constraints for table `fileshare`
--
ALTER TABLE `fileshare`
  ADD CONSTRAINT `FK_fileshareguru_1` FOREIGN KEY (`iddir`) REFERENCES `dirshare` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lampiranberitaguru`
--
ALTER TABLE `lampiranberitaguru`
  ADD CONSTRAINT `FK_lampiranberitaguru_1` FOREIGN KEY (`idberita`) REFERENCES `beritaguru` (`replid`) ON UPDATE CASCADE;

--
-- Constraints for table `lampiranberitasiswa`
--
ALTER TABLE `lampiranberitasiswa`
  ADD CONSTRAINT `FK_lampiranberitasiswa_1` FOREIGN KEY (`idberita`) REFERENCES `beritasiswa` (`replid`) ON UPDATE CASCADE;

--
-- Constraints for table `lampirandraft`
--
ALTER TABLE `lampirandraft`
  ADD CONSTRAINT `FK_lampirandraft_idpesan` FOREIGN KEY (`idpesan`) REFERENCES `draft` (`replid`) ON UPDATE CASCADE;

--
-- Constraints for table `lampiranpesan`
--
ALTER TABLE `lampiranpesan`
  ADD CONSTRAINT `FK_lampiranpesan_1` FOREIGN KEY (`idpesan`) REFERENCES `pesan` (`replid`) ON UPDATE CASCADE;

--
-- Constraints for table `pertanyaan`
--
ALTER TABLE `pertanyaan`
  ADD CONSTRAINT `FK_pertanyaan_angket` FOREIGN KEY (`idangket`) REFERENCES `angket` (`replid`) ON UPDATE CASCADE;

--
-- Constraints for table `pesanterkirim`
--
ALTER TABLE `pesanterkirim`
  ADD CONSTRAINT `FK_pesanterkirim_1` FOREIGN KEY (`idpesan`) REFERENCES `pesan` (`replid`) ON UPDATE CASCADE;

--
-- Constraints for table `pilihan`
--
ALTER TABLE `pilihan`
  ADD CONSTRAINT `FK_pilihan_tanya` FOREIGN KEY (`idpertanyaan`) REFERENCES `pertanyaan` (`replid`) ON UPDATE CASCADE;

--
-- Constraints for table `subkategoribuletin`
--
ALTER TABLE `subkategoribuletin`
  ADD CONSTRAINT `FK_subkategoribuletin_1` FOREIGN KEY (`kategori`) REFERENCES `kategoribuletin` (`kategori`) ON UPDATE CASCADE;

--
-- Constraints for table `tujuanpesan`
--
ALTER TABLE `tujuanpesan`
  ADD CONSTRAINT `FK_tujuanpesan_1` FOREIGN KEY (`idpesan`) REFERENCES `pesan` (`replid`) ON UPDATE CASCADE;
