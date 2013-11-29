-- phpMyAdmin SQL Dump
-- version 3.1.3.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 05, 2013 at 12:55 AM
-- Server version: 5.1.33
-- PHP Version: 5.2.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jbsperpus`
--

-- --------------------------------------------------------

--
-- Table structure for table `aktivitas`
--

CREATE TABLE IF NOT EXISTS `aktivitas` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `aktivitas` text,
  `perpustakaan` int(10) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_aktivitas_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `aktivitas`
--


-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE IF NOT EXISTS `anggota` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `noregistrasi` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL DEFAULT '',
  `alamat` varchar(255) NOT NULL,
  `kodepos` varchar(6) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telpon` varchar(100) DEFAULT NULL,
  `HP` varchar(100) DEFAULT NULL,
  `pekerjaan` varchar(100) DEFAULT NULL,
  `institusi` varchar(100) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `tgldaftar` date NOT NULL DEFAULT '0000-00-00',
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `foto` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `Index_nopen` (`noregistrasi`),
  KEY `IX_anggota_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='InnoDB free: 2020352 kB; InnoDB free: 2020352 kB; (`NoRegist' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `anggota`
--


-- --------------------------------------------------------

--
-- Table structure for table `daftarpustaka`
--

CREATE TABLE IF NOT EXISTS `daftarpustaka` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pustaka` int(10) unsigned NOT NULL,
  `perpustakaan` int(10) unsigned NOT NULL,
  `kodepustaka` varchar(45) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0 dipinjam, 1 tersedia',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_daftarpustaka_perpus` (`perpustakaan`),
  KEY `FK_daftarpustaka_pustaka` (`pustaka`),
  KEY `IX_daftarpustaka_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

--
-- Triggers `daftarpustaka`
--
DROP TRIGGER IF EXISTS `jbsperpus`.`fsync_trins_daftarpustaka_100`;
DELIMITER //
CREATE TRIGGER `jbsperpus`.`fsync_trins_daftarpustaka_100` BEFORE INSERT ON `jbsperpus`.`daftarpustaka`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsperpus`.`fsync_trupd_daftarpustaka_100`;
DELIMITER //
CREATE TRIGGER `jbsperpus`.`fsync_trupd_daftarpustaka_100` BEFORE UPDATE ON `jbsperpus`.`daftarpustaka`
 FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsperpus`.`fsync_trdel_daftarpustaka_100`;
DELIMITER //
CREATE TRIGGER `jbsperpus`.`fsync_trdel_daftarpustaka_100` AFTER DELETE ON `jbsperpus`.`daftarpustaka`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsperpus', tablename = 'daftarpustaka', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `daftarpustaka`
--


-- --------------------------------------------------------

--
-- Table structure for table `denda`
--

CREATE TABLE IF NOT EXISTS `denda` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpinjam` int(10) unsigned NOT NULL,
  `denda` int(10) DEFAULT '0',
  `telat` int(10) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_denda_idpeminjaman` (`idpinjam`),
  KEY `IX_denda_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

--
-- Dumping data for table `denda`
--


-- --------------------------------------------------------

--
-- Table structure for table `format`
--

CREATE TABLE IF NOT EXISTS `format` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(3) NOT NULL DEFAULT '',
  `nama` varchar(100) NOT NULL DEFAULT '',
  `keterangan` varchar(255) NOT NULL DEFAULT '',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `Kode_U` (`kode`),
  KEY `IX_format_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=2 ;

--
-- Dumping data for table `format`
--

INSERT INTO `format` (`replid`, `kode`, `nama`, `keterangan`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(1, 'BU', 'Buku', '', NULL, NULL, NULL, '2010-03-08 08:40:53', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `katalog`
--

CREATE TABLE IF NOT EXISTS `katalog` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(15) NOT NULL,
  `nama` varchar(100) NOT NULL DEFAULT '',
  `rak` int(10) unsigned NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `counter` int(10) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `REPL_IN` (`kode`),
  KEY `FK_katalog_rak` (`rak`),
  KEY `IX_katalog_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=48 ;

--
-- Triggers `katalog`
--
DROP TRIGGER IF EXISTS `jbsperpus`.`fsync_trins_katalog_100`;
DELIMITER //
CREATE TRIGGER `jbsperpus`.`fsync_trins_katalog_100` BEFORE INSERT ON `jbsperpus`.`katalog`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsperpus`.`fsync_trupd_katalog_100`;
DELIMITER //
CREATE TRIGGER `jbsperpus`.`fsync_trupd_katalog_100` BEFORE UPDATE ON `jbsperpus`.`katalog`
 FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsperpus`.`fsync_trdel_katalog_100`;
DELIMITER //
CREATE TRIGGER `jbsperpus`.`fsync_trdel_katalog_100` AFTER DELETE ON `jbsperpus`.`katalog`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsperpus', tablename = 'katalog', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `katalog`
--

INSERT INTO `katalog` (`replid`, `kode`, `nama`, `rak`, `keterangan`, `counter`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(1, '000', 'KARYA UMUM', 1, 'Klasifikasi pustaka dalam kelompok karya umum ', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 48886, 0),
(2, '010', 'Bibliografi', 1, '', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 34247, 0),
(3, '020', 'Perpustakaan dan Informasi Sains', 1, '', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 24576, 0),
(4, '030', 'Ensiklopedia dan Buku Pintar', 1, '', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 20137, 0),
(5, '040', '(   ...   )', 1, '', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 26959, 0),
(6, '050', 'Majalah, Jurnal dan Terbitan Berkala', 1, '', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 8852, 0),
(7, '060', 'Asosiasi, Organisasi dan Museum', 1, '', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 28911, 0),
(8, '070', 'Media Berita, Jurnalisme dan Publikasi', 1, '', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 52469, 0),
(9, '080', 'Kutipan', 1, '', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 44550, 0),
(10, '090', 'manuskrip dan buku-buku langka', 1, '', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 65344, 0),
(11, '100', 'FILSAFAT', 1, 'Klasifikasi pustaka yang tergolong dalam ilmu filsafat', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 62009, 0),
(12, '110', 'Metafisika', 1, '', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 48483, 0),
(13, '120', 'Epistemologi', 1, '', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 56389, 0),
(14, '130', 'Parapsikologi dan Perdukunan', 1, '', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 5433, 0),
(15, '140', 'Filsafat Aliran Pemikiran', 1, '', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 54588, 0),
(16, '150', 'Psikologi', 1, '', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 60049, 0),
(17, '160', 'Logika', 1, '', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 5421, 0),
(18, '170', 'Etika', 1, '', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 43547, 0),
(19, '180', 'Filsafat kuno, pertengahan dan lanjutan', 1, '', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 4883, 0),
(20, '190', 'Filsafat Barat Modern', 1, '', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 24833, 0),
(21, '200', 'AGAMA', 1, 'Klasifikasi pustaka yang berkaitan dengan keagamaan', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 43986, 0),
(22, '210', 'Filsafat dan Teori Agama', 1, '', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 14372, 0),
(23, '220', 'Injil', 1, '', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 5431, 0),
(24, '300', 'ILMU SOSIAL, SOSIOLOGI dan ANTROPOLOGI', 1, 'Pengelompokan Pustaka dalam kategori ilmu sosial', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 49567, 0),
(25, '310', 'Statistika Umum', 1, '', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 34952, 0),
(26, '320', 'Ilmu Politik', 1, '', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 26057, 0),
(27, '330', 'Ekonomi', 1, '', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 25429, 0),
(28, '340', 'Hukum', 1, '', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 48975, 0),
(29, '350', 'Administrasi Umum dan Ilmu Militer', 1, '', 2, NULL, NULL, NULL, '2010-03-08 08:44:43', 37528, 0),
(30, '360', 'Permasalahan Sosial dan Pelayanan Sosial', 1, '', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 40716, 0),
(31, '370', 'Pendidikan', 1, '', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 25463, 0),
(32, '380', 'Perdagangan, Komunikasi dan Perhubungan', 1, '', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 5165, 0),
(33, '390', 'Kewarganegaraan', 1, '', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 14967, 0),
(34, '400', 'BAHASA', 1, 'Klasifikasi pustaka dalam kelompok bahasa', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 59340, 0),
(35, '410', 'Linguistik', 1, '', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 55207, 0),
(36, '420', 'BAHASA INGGRIS', 1, 'pengelompokan pustaka (bahasa) dalam kelompok bahasa inggris', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 32485, 0),
(37, '430', 'Bahasa Arab', 1, '', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 62332, 0),
(38, '500', 'ILMU MURNI', 1, 'klasifikasi pustaka dalam kelompok ilmu murni', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 17616, 0),
(39, '510', 'Matematika', 1, 'pengelompokan pustaka (ilmu murni) dalam kelompok matematika', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 32144, 0),
(40, '530', 'Fisika', 1, 'pengelompokan pustaka ilmu murni berdasarkan klas fisika ', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 42340, 0),
(41, '540', 'Kimia', 1, 'klasifikasi pustaka ilmu murni dalam kelompok ilmu kimia', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 49740, 0),
(42, '570', 'Biologi', 1, 'pengelompokan pustaka ilmu murni kedalam klas biologi', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 56148, 0),
(43, '600', 'ILMU TERAPAN', 1, 'pengelompokan pustaka kedalam kategori ilmu terapan', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 458, 0),
(44, '700', 'KESENIAN', 1, 'Pengelompokan pustaka kedalam kategori kesenian', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 30437, 0),
(45, '710', 'Kreasi dan Ketrampilan', 1, '', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 19752, 0),
(46, '800', 'KESUSASTERAAN', 1, 'klasifikasi pustaka berdasarkan kelompok sastra', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 7445, 0),
(47, '900', 'GEOGRAFI dan SEJARAH ', 1, 'klasifikasi pustaka kedalam kelompok ilmu geografi dan sejarah', 0, NULL, NULL, NULL, '2010-03-07 17:28:08', 43502, 0);

-- --------------------------------------------------------

--
-- Table structure for table `konfigurasi`
--

CREATE TABLE IF NOT EXISTS `konfigurasi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siswa` int(10) unsigned DEFAULT NULL,
  `pegawai` int(10) unsigned DEFAULT NULL,
  `other` int(10) unsigned DEFAULT NULL,
  `denda` int(10) unsigned DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_konfigurasi_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `konfigurasi`
--

INSERT INTO `konfigurasi` (`replid`, `siswa`, `pegawai`, `other`, `denda`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(1, 3, 4, 0, 0, NULL, NULL, NULL, '2010-03-25 13:24:56', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `penerbit`
--

CREATE TABLE IF NOT EXISTS `penerbit` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(3) NOT NULL DEFAULT '',
  `nama` varchar(100) NOT NULL DEFAULT '',
  `alamat` varchar(255) DEFAULT NULL,
  `telpon` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fax` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `kontak` varchar(100) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `REPL_ID` (`kode`),
  KEY `IX_penerbit_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

--
-- Triggers `penerbit`
--
DROP TRIGGER IF EXISTS `jbsperpus`.`fsync_trins_penerbit_100`;
DELIMITER //
CREATE TRIGGER `jbsperpus`.`fsync_trins_penerbit_100` BEFORE INSERT ON `jbsperpus`.`penerbit`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsperpus`.`fsync_trupd_penerbit_100`;
DELIMITER //
CREATE TRIGGER `jbsperpus`.`fsync_trupd_penerbit_100` BEFORE UPDATE ON `jbsperpus`.`penerbit`
 FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsperpus`.`fsync_trdel_penerbit_100`;
DELIMITER //
CREATE TRIGGER `jbsperpus`.`fsync_trdel_penerbit_100` AFTER DELETE ON `jbsperpus`.`penerbit`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsperpus', tablename = 'penerbit', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `penerbit`
--


-- --------------------------------------------------------

--
-- Table structure for table `penulis`
--

CREATE TABLE IF NOT EXISTS `penulis` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(3) NOT NULL DEFAULT '',
  `nama` varchar(100) NOT NULL DEFAULT '',
  `kontak` varchar(255) DEFAULT NULL,
  `biografi` text,
  `keterangan` varchar(255) DEFAULT NULL,
  `gelardepan` varchar(45) DEFAULT NULL,
  `gelarbelakang` varchar(45) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `REPL_ID` (`kode`),
  KEY `IX_penulis_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

--
-- Triggers `penulis`
--
DROP TRIGGER IF EXISTS `jbsperpus`.`fsync_trins_penulis_100`;
DELIMITER //
CREATE TRIGGER `jbsperpus`.`fsync_trins_penulis_100` BEFORE INSERT ON `jbsperpus`.`penulis`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsperpus`.`fsync_trupd_penulis_100`;
DELIMITER //
CREATE TRIGGER `jbsperpus`.`fsync_trupd_penulis_100` BEFORE UPDATE ON `jbsperpus`.`penulis`
 FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsperpus`.`fsync_trdel_penulis_100`;
DELIMITER //
CREATE TRIGGER `jbsperpus`.`fsync_trdel_penulis_100` AFTER DELETE ON `jbsperpus`.`penulis`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsperpus', tablename = 'penulis', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `penulis`
--


-- --------------------------------------------------------

--
-- Table structure for table `perpustakaan`
--

CREATE TABLE IF NOT EXISTS `perpustakaan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL DEFAULT '',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `Nama` (`nama`),
  KEY `IX_perpustakaan_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=2 ;

--
-- Dumping data for table `perpustakaan`
--

INSERT INTO `perpustakaan` (`replid`, `nama`, `keterangan`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(1, 'sma', '', NULL, NULL, NULL, '2010-03-08 08:40:44', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pinjam`
--

CREATE TABLE IF NOT EXISTS `pinjam` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kodepustaka` varchar(45) NOT NULL,
  `tglpinjam` date NOT NULL DEFAULT '0000-00-00',
  `tglkembali` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(255) NOT NULL DEFAULT '',
  `idanggota` varchar(45) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 belum di acc, 1 udah di acc, 2 udah dikembalikan',
  `tglditerima` date NOT NULL DEFAULT '0000-00-00',
  `petugaspinjam` varchar(50) DEFAULT NULL,
  `petugaskembali` varchar(50) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`,`tglkembali`),
  KEY `IX_pinjam_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

--
-- Triggers `pinjam`
--
DROP TRIGGER IF EXISTS `jbsperpus`.`fsync_trins_pinjam_100`;
DELIMITER //
CREATE TRIGGER `jbsperpus`.`fsync_trins_pinjam_100` BEFORE INSERT ON `jbsperpus`.`pinjam`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsperpus`.`fsync_trupd_pinjam_100`;
DELIMITER //
CREATE TRIGGER `jbsperpus`.`fsync_trupd_pinjam_100` BEFORE UPDATE ON `jbsperpus`.`pinjam`
 FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsperpus`.`fsync_trdel_pinjam_100`;
DELIMITER //
CREATE TRIGGER `jbsperpus`.`fsync_trdel_pinjam_100` AFTER DELETE ON `jbsperpus`.`pinjam`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsperpus', tablename = 'pinjam', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `pinjam`
--


-- --------------------------------------------------------

--
-- Table structure for table `pustaka`
--

CREATE TABLE IF NOT EXISTS `pustaka` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) NOT NULL DEFAULT '',
  `abstraksi` text NOT NULL,
  `keyword` varchar(255) NOT NULL DEFAULT '',
  `tahun` int(4) unsigned NOT NULL DEFAULT '0',
  `keteranganfisik` varchar(255) NOT NULL DEFAULT '',
  `penulis` int(10) unsigned NOT NULL,
  `penerbit` int(10) unsigned NOT NULL,
  `format` int(10) unsigned NOT NULL,
  `katalog` int(10) unsigned NOT NULL,
  `cover` blob,
  `keterangan` varchar(255) DEFAULT NULL,
  `harga` int(10) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_pustaka_penulis` (`penulis`),
  KEY `FK_pustaka_format` (`format`),
  KEY `FK_pustaka_katalog` (`katalog`),
  KEY `FK_pustaka_penerbit` (`penerbit`),
  KEY `IX_pustaka_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

--
-- Triggers `pustaka`
--
DROP TRIGGER IF EXISTS `jbsperpus`.`fsync_trins_pustaka_100`;
DELIMITER //
CREATE TRIGGER `jbsperpus`.`fsync_trins_pustaka_100` BEFORE INSERT ON `jbsperpus`.`pustaka`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsperpus`.`fsync_trupd_pustaka_100`;
DELIMITER //
CREATE TRIGGER `jbsperpus`.`fsync_trupd_pustaka_100` BEFORE UPDATE ON `jbsperpus`.`pustaka`
 FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
  END IF;
  END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsperpus`.`fsync_trdel_pustaka_100`;
DELIMITER //
CREATE TRIGGER `jbsperpus`.`fsync_trdel_pustaka_100` AFTER DELETE ON `jbsperpus`.`pustaka`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsperpus', tablename = 'pustaka', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `pustaka`
--


-- --------------------------------------------------------

--
-- Table structure for table `rak`
--

CREATE TABLE IF NOT EXISTS `rak` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rak` varchar(25) NOT NULL,
  `keterangan` varchar(255) NOT NULL DEFAULT '',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `Kode_U` (`rak`),
  KEY `IX_rak_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=2 ;

--
-- Dumping data for table `rak`
--

INSERT INTO `rak` (`replid`, `rak`, `keterangan`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(1, 'Rak', 'contoh data', NULL, NULL, NULL, '2010-03-07 17:25:32', 0, 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `daftarpustaka`
--
ALTER TABLE `daftarpustaka`
  ADD CONSTRAINT `FK_daftarpustaka_perpus` FOREIGN KEY (`perpustakaan`) REFERENCES `perpustakaan` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_daftarpustaka_pustaka` FOREIGN KEY (`pustaka`) REFERENCES `pustaka` (`replid`) ON UPDATE CASCADE;

--
-- Constraints for table `denda`
--
ALTER TABLE `denda`
  ADD CONSTRAINT `FK_denda_idpeminjaman` FOREIGN KEY (`idpinjam`) REFERENCES `pinjam` (`replid`) ON UPDATE CASCADE;

--
-- Constraints for table `katalog`
--
ALTER TABLE `katalog`
  ADD CONSTRAINT `FK_katalog_rak` FOREIGN KEY (`rak`) REFERENCES `rak` (`replid`) ON UPDATE CASCADE;

--
-- Constraints for table `pustaka`
--
ALTER TABLE `pustaka`
  ADD CONSTRAINT `FK_pustaka_format` FOREIGN KEY (`format`) REFERENCES `format` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_pustaka_katalog` FOREIGN KEY (`katalog`) REFERENCES `katalog` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_pustaka_penerbit` FOREIGN KEY (`penerbit`) REFERENCES `penerbit` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_pustaka_penulis` FOREIGN KEY (`penulis`) REFERENCES `penulis` (`replid`) ON UPDATE CASCADE;
