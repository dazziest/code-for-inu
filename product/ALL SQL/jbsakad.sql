-- phpMyAdmin SQL Dump
-- version 3.1.3.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 05, 2013 at 12:33 AM
-- Server version: 5.1.33
-- PHP Version: 5.2.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jbsakad`
--

-- --------------------------------------------------------

--
-- Table structure for table `aktivitaskalender`
--

CREATE TABLE IF NOT EXISTS `aktivitaskalender` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkalender` int(10) unsigned NOT NULL DEFAULT '0',
  `tanggalawal` date NOT NULL DEFAULT '0000-00-00',
  `tanggalakhir` date NOT NULL DEFAULT '0000-00-00',
  `kegiatan` varchar(50) NOT NULL,
  `keterangan` text,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_aktivitaskalender_kalenderakademik` (`idkalender`),
  KEY `IX_aktivitaskalender_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `aktivitaskalender`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_aktivitaskalender_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_aktivitaskalender_100` BEFORE INSERT ON `jbsakad`.`aktivitaskalender`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_aktivitaskalender_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_aktivitaskalender_100` BEFORE UPDATE ON `jbsakad`.`aktivitaskalender`
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
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_aktivitaskalender_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_aktivitaskalender_100` AFTER DELETE ON `jbsakad`.`aktivitaskalender`
 FOR EACH ROW BEGIN
   IF @DISABLE_TRIGER IS NULL THEN
      INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'aktivitaskalender', dataid = OLD.replid, datatoken = OLD.token;
   END IF;
 END
//
DELIMITER ;

--
-- Dumping data for table `aktivitaskalender`
--


-- --------------------------------------------------------

--
-- Table structure for table `alumni`
--

CREATE TABLE IF NOT EXISTS `alumni` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(45) NOT NULL,
  `klsakhir` int(10) unsigned NOT NULL,
  `tktakhir` int(10) unsigned NOT NULL,
  `tgllulus` date DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `departemen` varchar(50) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_alumni_siswa` (`nis`),
  KEY `FK_alumni_tingkat` (`tktakhir`),
  KEY `FK_alumni_kelas` (`klsakhir`),
  KEY `FK_alumni_departemen` (`departemen`),
  KEY `IX_alumni_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `alumni`
--


-- --------------------------------------------------------

--
-- Table structure for table `angkatan`
--

CREATE TABLE IF NOT EXISTS `angkatan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `angkatan` varchar(50) NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_angkatan_departemen` (`departemen`),
  KEY `IX_angkatan_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Triggers `angkatan`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_angkatan_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_angkatan_100` BEFORE INSERT ON `jbsakad`.`angkatan`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_angkatan_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_angkatan_100` BEFORE UPDATE ON `jbsakad`.`angkatan`
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
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_angkatan_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_angkatan_100` AFTER DELETE ON `jbsakad`.`angkatan`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'angkatan', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `angkatan`
--

INSERT INTO `angkatan` (`replid`, `angkatan`, `departemen`, `aktif`, `keterangan`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(19, '2012', 'SMK Negeri 12 Malang', 1, 'Angkatan 2012-2013', NULL, NULL, NULL, '2013-07-02 20:42:33', 11596, 0),
(20, '2013', 'SMK Negeri 12 Malang', 0, '', NULL, NULL, NULL, '2013-05-28 13:40:49', 51177, 0);

-- --------------------------------------------------------

--
-- Table structure for table `asalsekolah`
--

CREATE TABLE IF NOT EXISTS `asalsekolah` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) NOT NULL,
  `sekolah` varchar(100) NOT NULL,
  `urutan` tinyint(2) unsigned DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`sekolah`),
  UNIQUE KEY `UX_asalsekolah` (`replid`),
  KEY `FK_asalsekolah_departemen` (`departemen`),
  KEY `IX_asalsekolah_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Triggers `asalsekolah`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_asalsekolah_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_asalsekolah_100` BEFORE INSERT ON `jbsakad`.`asalsekolah`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_asalsekolah_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_asalsekolah_100` BEFORE UPDATE ON `jbsakad`.`asalsekolah`
 FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
     IF NEW.sekolah <> OLD.sekolah THEN 
         INSERT INTO jbsclient.pkchanges SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'asalsekolah', dataid = OLD.replid, datatoken = OLD.token, newpk = NEW.sekolah, oldpk = OLD.sekolah;
     END IF;
  END IF;
  END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_asalsekolah_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_asalsekolah_100` AFTER DELETE ON `jbsakad`.`asalsekolah`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'asalsekolah', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `asalsekolah`
--

INSERT INTO `asalsekolah` (`replid`, `departemen`, `sekolah`, `urutan`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(31, 'SDN', 'SDN Indonesia Membaca', NULL, NULL, NULL, NULL, '2010-03-02 10:06:17', 29807, 0),
(30, 'SMAN', 'SMAN Indonesia Membaca', NULL, NULL, NULL, NULL, '2010-03-02 10:06:17', 48716, 0),
(21, 'SMPN', 'SMP Indonesia Membaca', NULL, NULL, NULL, NULL, '2010-03-02 10:06:17', 23099, 0);

-- --------------------------------------------------------

--
-- Table structure for table `aturangrading`
--

CREATE TABLE IF NOT EXISTS `aturangrading` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nipguru` varchar(20) NOT NULL,
  `idtingkat` int(10) unsigned NOT NULL,
  `idpelajaran` int(10) unsigned NOT NULL,
  `dasarpenilaian` varchar(50) NOT NULL,
  `nmin` decimal(6,1) NOT NULL,
  `nmax` decimal(6,1) NOT NULL,
  `grade` varchar(2) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_aturangrading_pegawai` (`nipguru`),
  KEY `FK_aturangrading_tingkat` (`idtingkat`),
  KEY `FK_aturangrading_pelajaran` (`idpelajaran`),
  KEY `FK_aturangrading_dasarpenilaian` (`dasarpenilaian`),
  KEY `IX_aturangrading_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=266 ;

--
-- Triggers `aturangrading`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_aturangrading_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_aturangrading_100` BEFORE INSERT ON `jbsakad`.`aturangrading`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_aturangrading_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_aturangrading_100` BEFORE UPDATE ON `jbsakad`.`aturangrading`
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
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_aturangrading_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_aturangrading_100` AFTER DELETE ON `jbsakad`.`aturangrading`
 FOR EACH ROW BEGIN
   IF @DISABLE_TRIGER IS NULL THEN
      INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'aturangrading', dataid = OLD.replid, datatoken = OLD.token;
   END IF;
 END
//
DELIMITER ;

--
-- Dumping data for table `aturangrading`
--

INSERT INTO `aturangrading` (`replid`, `nipguru`, `idtingkat`, `idpelajaran`, `dasarpenilaian`, `nmin`, `nmax`, `grade`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(207, '1024', 26, 45, 'Praktik', 75.0, 100.0, 'A', NULL, NULL, NULL, '2010-03-02 10:06:17', 34878, 0),
(208, '1024', 26, 45, 'Praktik', 60.0, 74.9, 'B', NULL, NULL, NULL, '2010-03-02 10:06:17', 39560, 0),
(209, '1024', 26, 45, 'Praktik', 50.0, 59.9, 'C', NULL, NULL, NULL, '2010-03-02 10:06:17', 27637, 0),
(210, '1024', 26, 45, 'Praktik', 40.0, 49.9, 'D', NULL, NULL, NULL, '2010-03-02 10:06:17', 19503, 0),
(211, '1024', 26, 45, 'Praktik', 0.0, 39.9, 'E', NULL, NULL, NULL, '2010-03-02 10:06:17', 14603, 0),
(217, '1024', 27, 45, 'Pemahaman Konsep', 75.0, 100.0, 'A', NULL, NULL, NULL, '2010-03-02 10:06:17', 14507, 0),
(218, '1024', 27, 45, 'Pemahaman Konsep', 60.0, 74.9, 'B', NULL, NULL, NULL, '2010-03-02 10:06:17', 28724, 0),
(219, '1024', 27, 45, 'Pemahaman Konsep', 50.0, 59.9, 'C', NULL, NULL, NULL, '2010-03-02 10:06:17', 34571, 0),
(220, '1024', 27, 45, 'Pemahaman Konsep', 40.0, 49.9, 'D', NULL, NULL, NULL, '2010-03-02 10:06:17', 21151, 0),
(221, '1024', 27, 45, 'Pemahaman Konsep', 0.0, 39.9, 'E', NULL, NULL, NULL, '2010-03-02 10:06:17', 2041, 0),
(222, '1024', 27, 45, 'Praktik', 70.0, 100.0, 'A', NULL, NULL, NULL, '2010-03-02 10:06:17', 12283, 0),
(223, '1024', 27, 45, 'Praktik', 50.0, 69.9, 'B', NULL, NULL, NULL, '2010-03-02 10:06:17', 55290, 0),
(224, '1024', 27, 45, 'Praktik', 40.0, 49.9, 'C', NULL, NULL, NULL, '2010-03-02 10:06:17', 43011, 0),
(225, '1024', 27, 45, 'Praktik', 30.0, 39.9, 'D', NULL, NULL, NULL, '2010-03-02 10:06:17', 49186, 0),
(226, '1024', 27, 45, 'Praktik', 0.0, 29.9, 'E', NULL, NULL, NULL, '2010-03-02 10:06:17', 51364, 0),
(227, '1024', 28, 45, 'Pemahaman Konsep', 75.0, 100.0, 'A', NULL, NULL, NULL, '2010-03-02 10:06:17', 43731, 0),
(228, '1024', 28, 45, 'Pemahaman Konsep', 60.0, 74.9, 'B', NULL, NULL, NULL, '2010-03-02 10:06:17', 64565, 0),
(229, '1024', 28, 45, 'Pemahaman Konsep', 50.0, 59.9, 'C', NULL, NULL, NULL, '2010-03-02 10:06:17', 60569, 0),
(230, '1024', 28, 45, 'Pemahaman Konsep', 40.0, 49.9, 'D', NULL, NULL, NULL, '2010-03-02 10:06:17', 43622, 0),
(231, '1024', 28, 45, 'Pemahaman Konsep', 0.0, 39.9, 'E', NULL, NULL, NULL, '2010-03-02 10:06:17', 36402, 0),
(242, '1024', 28, 45, 'Praktik', 70.0, 100.0, 'A', NULL, NULL, NULL, '2010-03-02 10:06:17', 51145, 0),
(243, '1024', 28, 45, 'Praktik', 50.0, 69.9, 'B', NULL, NULL, NULL, '2010-03-02 10:06:17', 15456, 0),
(244, '1024', 28, 45, 'Praktik', 40.0, 49.9, 'C', NULL, NULL, NULL, '2010-03-02 10:06:17', 54904, 0),
(245, '1024', 28, 45, 'Praktik', 30.0, 39.9, 'D', NULL, NULL, NULL, '2010-03-02 10:06:17', 31562, 0),
(246, '1024', 28, 45, 'Praktik', 0.0, 29.9, 'E', NULL, NULL, NULL, '2010-03-02 10:06:17', 58628, 0),
(252, '1024', 26, 45, 'Pemahaman Konsep', 75.0, 100.0, 'A', NULL, NULL, NULL, '2010-03-02 10:06:17', 1865, 0),
(253, '1024', 26, 45, 'Pemahaman Konsep', 60.0, 74.9, 'B', NULL, NULL, NULL, '2010-03-02 10:06:17', 30031, 0),
(254, '1024', 26, 45, 'Pemahaman Konsep', 50.0, 59.9, 'C', NULL, NULL, NULL, '2010-03-02 10:06:17', 13500, 0),
(255, '1024', 26, 45, 'Pemahaman Konsep', 40.0, 49.9, 'D', NULL, NULL, NULL, '2010-03-02 10:06:17', 42936, 0),
(256, '1024', 26, 45, 'Pemahaman Konsep', 0.0, 39.9, 'E', NULL, NULL, NULL, '2010-03-02 10:06:17', 43118, 0),
(257, '12312312', 26, 47, 'Pemahaman Konsep', 1.0, 60.0, 'D', NULL, NULL, NULL, '2013-05-27 22:57:18', 5252, 0),
(258, '12312312', 26, 47, 'Pemahaman Konsep', 60.0, 75.0, 'C', NULL, NULL, NULL, '2013-05-27 22:57:18', 45702, 0),
(259, '12312312', 26, 47, 'Pemahaman Konsep', 75.0, 85.0, 'B', NULL, NULL, NULL, '2013-05-27 22:57:18', 18258, 0),
(260, '12312312', 26, 47, 'Pemahaman Konsep', 85.0, 100.0, 'A', NULL, NULL, NULL, '2013-05-27 22:57:18', 21881, 0),
(261, '12312312', 27, 47, 'Pemahaman Konsep', 80.0, 100.0, 'A', NULL, NULL, NULL, '2013-05-27 23:14:11', 21844, 0),
(262, '12312312', 27, 47, 'Pemahaman Konsep', 60.0, 80.0, 'B', NULL, NULL, NULL, '2013-05-27 23:14:11', 14442, 0),
(263, '12312312', 28, 47, 'Pemahaman Konsep', 80.0, 100.0, 'A', NULL, NULL, NULL, '2013-05-27 23:14:45', 48555, 0),
(264, '12312312', 28, 47, 'Pemahaman Konsep', 60.0, 80.0, 'B', NULL, NULL, NULL, '2013-05-27 23:14:45', 56543, 0),
(265, '12312312', 28, 47, 'Pemahaman Konsep', 0.0, 60.0, 'C', NULL, NULL, NULL, '2013-05-27 23:14:45', 54810, 0);

-- --------------------------------------------------------

--
-- Table structure for table `aturannhb`
--

CREATE TABLE IF NOT EXISTS `aturannhb` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nipguru` varchar(20) NOT NULL,
  `idtingkat` int(10) unsigned NOT NULL,
  `idpelajaran` int(10) unsigned NOT NULL,
  `dasarpenilaian` varchar(50) NOT NULL,
  `idjenisujian` int(10) unsigned NOT NULL,
  `bobot` tinyint(3) unsigned NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_aturannhb_jenisujian` (`idjenisujian`),
  KEY `FK_aturannhb_dasarpenilaian` (`dasarpenilaian`),
  KEY `FK_aturannhb_pelajaran` (`idpelajaran`),
  KEY `FK_aturannhb_tingkat` (`idtingkat`),
  KEY `FK_aturannhb_pegawai` (`nipguru`),
  KEY `IX_aturannhb_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=247 ;

--
-- Triggers `aturannhb`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_aturannhb_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_aturannhb_100` BEFORE INSERT ON `jbsakad`.`aturannhb`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_aturannhb_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_aturannhb_100` BEFORE UPDATE ON `jbsakad`.`aturannhb`
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
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_aturannhb_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_aturannhb_100` AFTER DELETE ON `jbsakad`.`aturannhb`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'aturannhb', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `aturannhb`
--

INSERT INTO `aturannhb` (`replid`, `nipguru`, `idtingkat`, `idpelajaran`, `dasarpenilaian`, `idjenisujian`, `bobot`, `aktif`, `keterangan`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(203, '1024', 26, 45, 'Pemahaman Konsep', 108, 10, 1, NULL, NULL, NULL, NULL, '2013-06-16 10:58:14', 42437, 0),
(214, '1024', 27, 45, 'Pemahaman Konsep', 108, 10, 1, NULL, NULL, NULL, NULL, '2010-03-02 10:06:17', 55114, 0),
(222, '1024', 28, 45, 'Pemahaman Konsep', 108, 10, 1, NULL, NULL, NULL, NULL, '2010-03-02 10:06:17', 5132, 0),
(223, '12312312', 26, 47, 'Pemahaman Konsep', 109, 30, 1, NULL, NULL, NULL, NULL, '2013-05-27 22:52:39', 24607, 0),
(224, '12312312', 26, 47, 'Pemahaman Konsep', 110, 20, 1, NULL, NULL, NULL, NULL, '2013-05-27 22:52:39', 51742, 0),
(225, '12312312', 26, 47, 'Pemahaman Konsep', 111, 50, 1, NULL, NULL, NULL, NULL, '2013-05-27 22:52:39', 16198, 0),
(226, '12312312', 27, 47, 'Praktik', 109, 40, 1, NULL, NULL, NULL, NULL, '2013-05-27 22:53:01', 23750, 0),
(227, '12312312', 27, 47, 'Praktik', 110, 10, 1, NULL, NULL, NULL, NULL, '2013-05-27 22:53:01', 41076, 0),
(228, '12312312', 27, 47, 'Praktik', 111, 50, 1, NULL, NULL, NULL, NULL, '2013-05-27 22:53:01', 24704, 0),
(229, '12312312', 28, 47, 'Pemahaman Konsep', 109, 3, 1, NULL, NULL, NULL, NULL, '2013-05-27 22:54:11', 49521, 0),
(230, '12312312', 28, 47, 'Pemahaman Konsep', 110, 1, 1, NULL, NULL, NULL, NULL, '2013-05-27 22:54:11', 36921, 0),
(231, '12312312', 28, 47, 'Pemahaman Konsep', 111, 5, 1, NULL, NULL, NULL, NULL, '2013-05-27 22:54:11', 53020, 0),
(232, '12345678', 26, 46, 'Pemahaman Konsep', 112, 20, 1, NULL, NULL, NULL, NULL, '2013-07-02 21:22:31', 21105, 0),
(233, '12345678', 26, 46, 'Pemahaman Konsep', 113, 25, 1, NULL, NULL, NULL, NULL, '2013-07-02 21:22:31', 52536, 0),
(234, '12345678', 26, 46, 'Pemahaman Konsep', 114, 25, 1, NULL, NULL, NULL, NULL, '2013-07-02 21:22:31', 52176, 0),
(235, '12345678', 26, 46, 'Pemahaman Konsep', 115, 30, 1, NULL, NULL, NULL, NULL, '2013-07-02 21:22:31', 18583, 0),
(236, '12345678', 27, 46, 'Pemahaman Konsep', 112, 10, 1, NULL, NULL, NULL, NULL, '2013-07-02 21:23:29', 65090, 0),
(237, '12345678', 27, 46, 'Pemahaman Konsep', 113, 35, 1, NULL, NULL, NULL, NULL, '2013-07-02 21:23:29', 11458, 0),
(238, '12345678', 27, 46, 'Pemahaman Konsep', 114, 20, 1, NULL, NULL, NULL, NULL, '2013-07-02 21:23:29', 36291, 0),
(239, '12345678', 27, 46, 'Pemahaman Konsep', 115, 35, 1, NULL, NULL, NULL, NULL, '2013-07-02 21:23:29', 56197, 0),
(240, '12345678', 28, 46, 'Pemahaman Konsep', 112, 23, 1, NULL, NULL, NULL, NULL, '2013-05-27 22:55:27', 14895, 0),
(241, '12345678', 28, 46, 'Pemahaman Konsep', 113, 32, 1, NULL, NULL, NULL, NULL, '2013-05-27 22:55:27', 7914, 0),
(242, '12345678', 28, 46, 'Pemahaman Konsep', 114, 12, 1, NULL, NULL, NULL, NULL, '2013-05-27 22:55:27', 38878, 0),
(243, '12345678', 28, 46, 'Pemahaman Konsep', 115, 31, 1, NULL, NULL, NULL, NULL, '2013-05-27 22:55:27', 63175, 0),
(244, '12312312', 26, 47, 'Praktik', 109, 45, 1, NULL, NULL, NULL, NULL, '2013-07-02 21:38:13', 42232, 0),
(245, '12312312', 26, 47, 'Praktik', 110, 30, 1, NULL, NULL, NULL, NULL, '2013-07-02 21:38:13', 28468, 0),
(246, '12312312', 26, 47, 'Praktik', 111, 25, 1, NULL, NULL, NULL, NULL, '2013-07-02 21:38:13', 35666, 0);

-- --------------------------------------------------------

--
-- Table structure for table `auditnilai`
--

CREATE TABLE IF NOT EXISTS `auditnilai` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jenisnilai` varchar(45) NOT NULL,
  `idnilai` int(10) unsigned NOT NULL,
  `nasli` decimal(10,2) NOT NULL,
  `nubah` decimal(10,2) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `alasan` varchar(255) NOT NULL,
  `pengguna` varchar(100) NOT NULL,
  `informasi` varchar(255) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auditnilai`
--


-- --------------------------------------------------------

--
-- Table structure for table `bobotnau`
--

CREATE TABLE IF NOT EXISTS `bobotnau` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idinfo` int(10) unsigned DEFAULT NULL,
  `idujian` int(10) unsigned NOT NULL,
  `bobot` int(10) unsigned NOT NULL DEFAULT '0',
  `idaturan` int(10) unsigned DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_bobotnau_infobobot` (`idinfo`),
  KEY `FK_bobotnau_ujian` (`idujian`),
  KEY `IX_bobotnau_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `bobotnau`
--


-- --------------------------------------------------------

--
-- Table structure for table `calonsiswa`
--

CREATE TABLE IF NOT EXISTS `calonsiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nopendaftaran` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `panggilan` varchar(30) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `tahunmasuk` int(10) unsigned NOT NULL,
  `idproses` int(10) unsigned NOT NULL,
  `idkelompok` int(10) unsigned NOT NULL,
  `suku` varchar(20) NOT NULL,
  `agama` varchar(20) NOT NULL,
  `status` varchar(100) NOT NULL,
  `kondisi` varchar(100) NOT NULL,
  `kelamin` varchar(1) NOT NULL,
  `tmplahir` varchar(50) NOT NULL,
  `tgllahir` date NOT NULL,
  `warga` varchar(5) DEFAULT NULL,
  `anakke` tinyint(2) unsigned DEFAULT '0',
  `jsaudara` tinyint(2) unsigned DEFAULT '0',
  `bahasa` varchar(60) DEFAULT NULL,
  `berat` decimal(4,1) unsigned DEFAULT '0.0',
  `tinggi` decimal(4,1) unsigned DEFAULT '0.0',
  `darah` varchar(2) DEFAULT NULL,
  `foto` blob,
  `alamatsiswa` varchar(255) DEFAULT NULL,
  `kodepossiswa` varchar(8) DEFAULT NULL,
  `telponsiswa` varchar(20) DEFAULT NULL,
  `hpsiswa` varchar(20) DEFAULT NULL,
  `emailsiswa` varchar(100) DEFAULT NULL,
  `kesehatan` varchar(255) DEFAULT NULL,
  `asalsekolah` varchar(100) DEFAULT NULL,
  `ketsekolah` varchar(255) DEFAULT NULL,
  `namaayah` varchar(100) DEFAULT NULL,
  `namaibu` varchar(100) DEFAULT NULL,
  `almayah` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `almibu` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pendidikanayah` varchar(20) DEFAULT NULL,
  `pendidikanibu` varchar(20) DEFAULT NULL,
  `pekerjaanayah` varchar(100) DEFAULT NULL,
  `pekerjaanibu` varchar(100) DEFAULT NULL,
  `wali` varchar(100) DEFAULT NULL,
  `penghasilanayah` int(10) unsigned DEFAULT '0',
  `penghasilanibu` int(10) unsigned DEFAULT '0',
  `alamatortu` varchar(100) DEFAULT NULL,
  `telponortu` varchar(20) DEFAULT NULL,
  `hportu` varchar(20) DEFAULT NULL,
  `emailayah` varchar(100) DEFAULT NULL,
  `alamatsurat` varchar(100) DEFAULT NULL,
  `keterangan` text,
  `replidsiswa` int(10) unsigned DEFAULT NULL,
  `emailibu` varchar(100) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nopendaftaran`),
  UNIQUE KEY `UX_calonsiswa_replid` (`replid`),
  KEY `FK_calonsiswa_prosespenerimaansiswa` (`idproses`),
  KEY `FK_calonsiswa_kelompokcalonsiswa` (`idkelompok`),
  KEY `FK_calonsiswa_suku` (`suku`),
  KEY `FK_calonsiswa_agama` (`agama`),
  KEY `FK_calonsiswa_statusiswa` (`status`),
  KEY `FK_calonsiswa_asalsekolah` (`asalsekolah`),
  KEY `FK_calonsiswa_tingkatpendidikan` (`pendidikanayah`),
  KEY `FK_calonsiswa_jenispekerjaan` (`pekerjaanayah`),
  KEY `FK_calonsiswa_tingkatpendidikanibu` (`pendidikanibu`),
  KEY `FK_calonsiswa_jenispekerjaanibu` (`pekerjaanibu`),
  KEY `FK_calonsiswa_kondisisiswa` (`kondisi`),
  KEY `IX_calonsiswa_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 196608 kB; (`pendidikanibu`) REFER `jbsumum/tin' AUTO_INCREMENT=1 ;

--
-- Triggers `calonsiswa`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_calonsiswa_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_calonsiswa_100` BEFORE INSERT ON `jbsakad`.`calonsiswa`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_calonsiswa_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_calonsiswa_100` BEFORE UPDATE ON `jbsakad`.`calonsiswa`
 FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
     IF NEW.nopendaftaran <> OLD.nopendaftaran THEN 
         INSERT INTO jbsclient.pkchanges SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'calonsiswa', dataid = OLD.replid, datatoken = OLD.token, newpk = NEW.nopendaftaran, oldpk = OLD.nopendaftaran;
     END IF;
  END IF;
  END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_calonsiswa_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_calonsiswa_100` AFTER DELETE ON `jbsakad`.`calonsiswa`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'calonsiswa', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `calonsiswa`
--


-- --------------------------------------------------------

--
-- Table structure for table `dasarpenilaian`
--

CREATE TABLE IF NOT EXISTS `dasarpenilaian` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dasarpenilaian` varchar(50) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`dasarpenilaian`),
  UNIQUE KEY `UX_dasarpenilaian_replid` (`replid`),
  KEY `IX_dasarpenilaian_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Triggers `dasarpenilaian`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_dasarpenilaian_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_dasarpenilaian_100` BEFORE INSERT ON `jbsakad`.`dasarpenilaian`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_dasarpenilaian_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_dasarpenilaian_100` BEFORE UPDATE ON `jbsakad`.`dasarpenilaian`
 FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
     IF NEW.dasarpenilaian <> OLD.dasarpenilaian THEN 
         INSERT INTO jbsclient.pkchanges SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'dasarpenilaian', dataid = OLD.replid, datatoken = OLD.token, newpk = NEW.dasarpenilaian, oldpk = OLD.dasarpenilaian;
     END IF;
  END IF;
  END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_dasarpenilaian_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_dasarpenilaian_100` AFTER DELETE ON `jbsakad`.`dasarpenilaian`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'dasarpenilaian', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `dasarpenilaian`
--

INSERT INTO `dasarpenilaian` (`replid`, `dasarpenilaian`, `keterangan`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(3, 'Pemahaman Konsep', NULL, NULL, NULL, NULL, '2010-03-02 10:06:17', 50529, 0),
(4, 'Praktik', NULL, NULL, NULL, NULL, '2010-03-02 10:06:17', 24109, 0);

-- --------------------------------------------------------

--
-- Table structure for table `deleteddata`
--

CREATE TABLE IF NOT EXISTS `deleteddata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tablename` varchar(100) NOT NULL,
  `rowid` bigint(20) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IX_deleteddata_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `deleteddata`
--


-- --------------------------------------------------------

--
-- Table structure for table `departemen`
--

CREATE TABLE IF NOT EXISTS `departemen` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) NOT NULL,
  `nipkepsek` varchar(20) NOT NULL,
  `urutan` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`departemen`),
  UNIQUE KEY `UX_departemen_replid` (`replid`),
  KEY `FK_departemen_pegawai` (`nipkepsek`),
  KEY `IX_departemen_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Triggers `departemen`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_departemen_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_departemen_100` BEFORE INSERT ON `jbsakad`.`departemen`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_departemen_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_departemen_100` BEFORE UPDATE ON `jbsakad`.`departemen`
 FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
     IF NEW.departemen <> OLD.departemen THEN 
         INSERT INTO jbsclient.pkchanges SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'departemen', dataid = OLD.replid, datatoken = OLD.token, newpk = NEW.departemen, oldpk = OLD.departemen;
     END IF;
  END IF;
  END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_departemen_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_departemen_100` AFTER DELETE ON `jbsakad`.`departemen`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'departemen', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `departemen`
--

INSERT INTO `departemen` (`replid`, `departemen`, `nipkepsek`, `urutan`, `keterangan`, `aktif`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(11, 'SMK Negeri 12 Malang', '12312312', 1, 'smk 12 malang', 1, NULL, NULL, NULL, '2013-06-15 12:27:58', 34486, 0),
(15, 'smkn coba 1', '112233', 8, '', 1, NULL, NULL, NULL, '2013-06-17 23:07:36', 52015, 0),
(14, 'smkn coba 2', '112233', 9, '', 1, NULL, NULL, NULL, '2013-06-17 23:07:38', 42169, 0);

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE IF NOT EXISTS `guru` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(20) NOT NULL,
  `idpelajaran` int(10) unsigned NOT NULL,
  `statusguru` varchar(50) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_guru_pegawai` (`nip`),
  KEY `FK_guru_pelajaran` (`idpelajaran`),
  KEY `FK_guru_statusguru` (`statusguru`),
  KEY `IX_guru_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

--
-- Triggers `guru`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_guru_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_guru_100` BEFORE INSERT ON `jbsakad`.`guru`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_guru_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_guru_100` BEFORE UPDATE ON `jbsakad`.`guru`
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
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_guru_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_guru_100` AFTER DELETE ON `jbsakad`.`guru`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'guru', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`replid`, `nip`, `idpelajaran`, `statusguru`, `aktif`, `keterangan`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(44, '1024', 45, 'Guru Tetap', 1, '', NULL, NULL, NULL, '2010-03-02 10:06:17', 34572, 0),
(45, '12312312', 47, 'Guru Tetap', 1, '', NULL, NULL, NULL, '2013-05-27 22:45:58', 57365, 0),
(47, '12345678', 47, 'Asisten', 1, '', NULL, NULL, NULL, '2013-05-27 22:47:27', 23194, 0),
(48, '12345678', 46, 'Guru Tetap', 1, '', NULL, NULL, NULL, '2013-05-27 22:47:50', 13452, 0);

-- --------------------------------------------------------

--
-- Table structure for table `infobobotnau`
--

CREATE TABLE IF NOT EXISTS `infobobotnau` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idujian` int(10) unsigned NOT NULL,
  `idaturan` int(10) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_infobobotnau_ujian` (`idujian`),
  KEY `IX_infobobotnau_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `infobobotnau`
--


-- --------------------------------------------------------

--
-- Table structure for table `infobobotujian`
--

CREATE TABLE IF NOT EXISTS `infobobotujian` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `idpelajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `idkelas` int(10) unsigned NOT NULL DEFAULT '0',
  `idsemester` int(10) unsigned NOT NULL DEFAULT '0',
  `idjenisujian` int(10) unsigned NOT NULL DEFAULT '0',
  `pilihan` tinyint(4) NOT NULL DEFAULT '0',
  `info` varchar(100) NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_infobobotujian_idpelajaran` (`idpelajaran`),
  KEY `FK_infobobotujian_idsemester` (`idsemester`),
  KEY `FK_infobobotujian_idjenis` (`idjenisujian`),
  KEY `FK_infobobotujian_kelas` (`idkelas`),
  KEY `IX_infobobotujian_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `infobobotujian`
--


-- --------------------------------------------------------

--
-- Table structure for table `infojadwal`
--

CREATE TABLE IF NOT EXISTS `infojadwal` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deskripsi` varchar(100) NOT NULL DEFAULT '',
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `terlihat` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `idtahunajaran` int(10) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_infojadwal_tahunajaran` (`idtahunajaran`),
  KEY `IX_infojadwal_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `infojadwal`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_infojadwal_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_infojadwal_100` BEFORE INSERT ON `jbsakad`.`infojadwal`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_infojadwal_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_infojadwal_100` BEFORE UPDATE ON `jbsakad`.`infojadwal`
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
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_infojadwal_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_infojadwal_100` AFTER DELETE ON `jbsakad`.`infojadwal`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'infojadwal', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `infojadwal`
--


-- --------------------------------------------------------

--
-- Table structure for table `infonap`
--

CREATE TABLE IF NOT EXISTS `infonap` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpelajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `idsemester` int(10) unsigned NOT NULL DEFAULT '0',
  `idkelas` int(10) unsigned NOT NULL DEFAULT '0',
  `nilaimin` decimal(5,2) NOT NULL DEFAULT '0.00',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_infonap_pelajaran` (`idpelajaran`),
  KEY `FK_infonap_semester` (`idsemester`),
  KEY `FK_infonap_kelas` (`idkelas`),
  KEY `IX_infonap_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Triggers `infonap`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_infonap_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_infonap_100` BEFORE INSERT ON `jbsakad`.`infonap`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_infonap_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_infonap_100` BEFORE UPDATE ON `jbsakad`.`infonap`
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
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_infonap_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_infonap_100` AFTER DELETE ON `jbsakad`.`infonap`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'infonap', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `infonap`
--

INSERT INTO `infonap` (`replid`, `idpelajaran`, `idsemester`, `idkelas`, `nilaimin`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(1, 47, 20, 48, 70.00, NULL, NULL, NULL, '2013-07-03 12:06:05', 18479, 0),
(2, 46, 20, 48, 75.00, NULL, NULL, NULL, '2013-07-03 20:18:23', 44855, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE IF NOT EXISTS `jadwal` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkelas` int(10) unsigned NOT NULL DEFAULT '0',
  `nipguru` varchar(20) NOT NULL,
  `idpelajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `departemen` varchar(50) NOT NULL DEFAULT '',
  `infojadwal` int(10) unsigned NOT NULL DEFAULT '0',
  `hari` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `jamke` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `njam` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sifat` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `jam1` time NOT NULL DEFAULT '00:00:00',
  `jam2` time NOT NULL DEFAULT '00:00:00',
  `idjam1` int(10) unsigned NOT NULL DEFAULT '0',
  `idjam2` int(10) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_jadwal_departemen` (`departemen`),
  KEY `FK_jadwal_pegawai` (`nipguru`),
  KEY `FK_jadwal_jam1` (`idjam1`),
  KEY `FK_jadwal_jam2` (`idjam2`),
  KEY `FK_jadwal_infojadwal` (`infojadwal`),
  KEY `FK_jadwal_pelajaran` (`idpelajaran`),
  KEY `FK_jadwal_kelas` (`idkelas`),
  KEY `IX_jadwal_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `jadwal`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_jadwal_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_jadwal_100` BEFORE INSERT ON `jbsakad`.`jadwal`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_jadwal_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_jadwal_100` BEFORE UPDATE ON `jbsakad`.`jadwal`
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
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_jadwal_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_jadwal_100` AFTER DELETE ON `jbsakad`.`jadwal`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'jadwal', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `jadwal`
--


-- --------------------------------------------------------

--
-- Table structure for table `jam`
--

CREATE TABLE IF NOT EXISTS `jam` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jamke` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `departemen` varchar(50) NOT NULL DEFAULT '',
  `jam1` time NOT NULL DEFAULT '00:00:00',
  `jam2` time NOT NULL DEFAULT '00:00:00',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_jam_departemen` (`departemen`),
  KEY `IX_jam_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

--
-- Triggers `jam`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_jam_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_jam_100` BEFORE INSERT ON `jbsakad`.`jam`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_jam_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_jam_100` BEFORE UPDATE ON `jbsakad`.`jam`
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
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_jam_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_jam_100` AFTER DELETE ON `jbsakad`.`jam`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'jam', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `jam`
--

INSERT INTO `jam` (`replid`, `jamke`, `departemen`, `jam1`, `jam2`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(34, 1, 'SMK Negeri 12 Malang', '06:30:00', '08:00:00', NULL, NULL, NULL, '2010-03-02 10:06:17', 52283, 0),
(35, 2, 'SMK Negeri 12 Malang', '08:00:00', '09:30:00', NULL, NULL, NULL, '2010-03-02 10:06:17', 40376, 0),
(36, 3, 'SMK Negeri 12 Malang', '09:30:00', '10:00:00', NULL, NULL, NULL, '2010-03-02 10:06:17', 45031, 0),
(37, 4, 'SMK Negeri 12 Malang', '10:30:00', '12:00:00', NULL, NULL, NULL, '2010-03-02 10:06:17', 38498, 0),
(38, 5, 'SMK Negeri 12 Malang', '12:00:00', '13:30:00', NULL, NULL, NULL, '2010-03-02 10:06:17', 57397, 0),
(39, 6, 'SMK Negeri 12 Malang', '13:30:00', '15:00:00', NULL, NULL, NULL, '2010-03-02 10:06:17', 40428, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jenismutasi`
--

CREATE TABLE IF NOT EXISTS `jenismutasi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jenismutasi` varchar(45) NOT NULL DEFAULT '',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_jenismutasi_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `jenismutasi`
--

INSERT INTO `jenismutasi` (`replid`, `jenismutasi`, `keterangan`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(2, 'Pindah Sekolah', '', NULL, NULL, NULL, '2010-03-02 10:06:17', 29948, 0),
(3, 'Dikeluarkan', 'Sekedar contoh. Menu ini mengatur jenis-jenis mutasi siswa. Ubah atau tambahkan data ini sesuai dengan jenis-jenis mutasi siswa yang terjadi.', NULL, NULL, NULL, '2010-03-02 10:06:17', 28455, 0),
(4, 'Mengundurkan Diri', '', NULL, NULL, NULL, '2010-03-02 10:06:17', 52431, 0),
(5, 'Meninggal Dunia', '', NULL, NULL, NULL, '2010-03-02 10:06:17', 45730, 0),
(6, 'Pindah Tempat Tinggal', '', NULL, NULL, NULL, '2010-03-02 10:06:17', 5828, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jenisujian`
--

CREATE TABLE IF NOT EXISTS `jenisujian` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jenisujian` varchar(50) NOT NULL,
  `idpelajaran` int(10) unsigned NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_jenisujian_pelajaran` (`idpelajaran`),
  KEY `IX_jenisujian_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=116 ;

--
-- Triggers `jenisujian`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_jenisujian_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_jenisujian_100` BEFORE INSERT ON `jbsakad`.`jenisujian`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_jenisujian_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_jenisujian_100` BEFORE UPDATE ON `jbsakad`.`jenisujian`
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
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_jenisujian_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_jenisujian_100` AFTER DELETE ON `jbsakad`.`jenisujian`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'jenisujian', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `jenisujian`
--

INSERT INTO `jenisujian` (`replid`, `jenisujian`, `idpelajaran`, `keterangan`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(108, 'PR', 45, 'Sekedar contoh. Menu ini mengatur jenis-jenis ujian untuk pengambilan nilai siswa pada setiap pelajaran di sekolah. Ubah atau tambahkan data ini sesuai dengan jenis-jenis ujian yang digunakan di sekolah.', 'PR', NULL, NULL, '2010-04-16 08:55:23', 32036, 0),
(109, 'praktik', 47, '', 'ptk', NULL, NULL, '2013-05-27 22:49:01', 12025, 0),
(110, 'teori', 47, '', 'tri', NULL, NULL, '2013-05-27 22:49:15', 29332, 0),
(111, 'uas', 47, '', 'uas', NULL, NULL, '2013-05-27 22:49:28', 35771, 0),
(112, 'praktek', 46, '', 'prtk', NULL, NULL, '2013-07-02 21:12:40', 51645, 0),
(113, 'teori', 46, '', 'teo', NULL, NULL, '2013-07-02 21:13:03', 52391, 0),
(114, 'uts', 46, '', 'uts', NULL, NULL, '2013-05-27 22:50:14', 3753, 0),
(115, 'uas', 46, '', 'uas', NULL, NULL, '2013-05-27 22:50:26', 32640, 0);

-- --------------------------------------------------------

--
-- Table structure for table `kalenderakademik`
--

CREATE TABLE IF NOT EXISTS `kalenderakademik` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kalender` varchar(50) NOT NULL DEFAULT '',
  `aktif` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `terlihat` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `idtahunajaran` int(10) unsigned NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_kalenderakademik_tahunajaran` (`idtahunajaran`),
  KEY `FK_kalenderakademik_departemen` (`departemen`),
  KEY `IX_kalenderakademik_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `kalenderakademik`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_kalenderakademik_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_kalenderakademik_100` BEFORE INSERT ON `jbsakad`.`kalenderakademik`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_kalenderakademik_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_kalenderakademik_100` BEFORE UPDATE ON `jbsakad`.`kalenderakademik`
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
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_kalenderakademik_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_kalenderakademik_100` AFTER DELETE ON `jbsakad`.`kalenderakademik`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'kalenderakademik', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `kalenderakademik`
--


-- --------------------------------------------------------

--
-- Table structure for table `kejadianpenting`
--

CREATE TABLE IF NOT EXISTS `kejadianpenting` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkriteria` int(10) unsigned NOT NULL DEFAULT '0',
  `nis` varchar(15) NOT NULL DEFAULT '',
  `nip` varchar(15) NOT NULL DEFAULT '',
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `kejadian` text NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_kejadianpenting_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `kejadianpenting`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_kejadianpenting_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_kejadianpenting_100` BEFORE INSERT ON `jbsakad`.`kejadianpenting`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_kejadianpenting_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_kejadianpenting_100` BEFORE UPDATE ON `jbsakad`.`kejadianpenting`
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
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_kejadianpenting_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_kejadianpenting_100` AFTER DELETE ON `jbsakad`.`kejadianpenting`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'kejadianpenting', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `kejadianpenting`
--


-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE IF NOT EXISTS `kelas` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelas` varchar(50) NOT NULL,
  `idtahunajaran` int(10) unsigned NOT NULL,
  `kapasitas` int(10) unsigned NOT NULL,
  `nipwali` varchar(20) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `idtingkat` int(10) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_kelas_pegawai` (`nipwali`),
  KEY `FK_kelas_tahunajaran` (`idtahunajaran`),
  KEY `FK_kelas_tingkat` (`idtingkat`),
  KEY `IX_kelas_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

--
-- Triggers `kelas`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_kelas_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_kelas_100` BEFORE INSERT ON `jbsakad`.`kelas`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_kelas_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_kelas_100` BEFORE UPDATE ON `jbsakad`.`kelas`
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
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_kelas_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_kelas_100` AFTER DELETE ON `jbsakad`.`kelas`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'kelas', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`replid`, `kelas`, `idtahunajaran`, `kapasitas`, `nipwali`, `aktif`, `keterangan`, `idtingkat`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(46, 'TKJ 3', 20, 50, '12312312', 1, '', 26, NULL, NULL, NULL, '2013-05-27 22:34:08', 17056, 0),
(47, 'RPL 1', 20, 35, '12345678', 1, '', 26, NULL, NULL, NULL, '2013-05-27 22:34:39', 26037, 0),
(48, 'MM 1', 20, 33, '12312312', 1, '', 26, NULL, NULL, NULL, '2013-05-28 13:41:51', 553, 0),
(49, 'TKJ 3', 20, 35, '12345678', 1, '', 27, NULL, NULL, NULL, '2013-05-28 13:45:49', 43945, 0),
(50, 'TKJ 3', 22, 33, '112233', 1, '', 27, NULL, NULL, NULL, '2013-06-17 21:41:27', 32736, 0);

-- --------------------------------------------------------

--
-- Table structure for table `kelompokcalonsiswa`
--

CREATE TABLE IF NOT EXISTS `kelompokcalonsiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompok` varchar(100) NOT NULL,
  `idproses` int(10) unsigned NOT NULL,
  `kapasitas` int(10) unsigned NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_kelompokcalonsiswa_prosespenerimaansiswa` (`idproses`),
  KEY `IX_kelompokcalonsiswa_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `kelompokcalonsiswa`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_kelompokcalonsiswa_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_kelompokcalonsiswa_100` BEFORE INSERT ON `jbsakad`.`kelompokcalonsiswa`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_kelompokcalonsiswa_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_kelompokcalonsiswa_100` BEFORE UPDATE ON `jbsakad`.`kelompokcalonsiswa`
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
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_kelompokcalonsiswa_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_kelompokcalonsiswa_100` AFTER DELETE ON `jbsakad`.`kelompokcalonsiswa`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'kelompokcalonsiswa', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `kelompokcalonsiswa`
--


-- --------------------------------------------------------

--
-- Table structure for table `komennap`
--

CREATE TABLE IF NOT EXISTS `komennap` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `idinfo` int(10) unsigned NOT NULL DEFAULT '0',
  `komentar` text NOT NULL,
  `predikat` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_komennap_infonap` (`idinfo`),
  KEY `FK_komennap_siswa` (`nis`),
  KEY `IX_komennap_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Triggers `komennap`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_komennap_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_komennap_100` BEFORE INSERT ON `jbsakad`.`komennap`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_komennap_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_komennap_100` BEFORE UPDATE ON `jbsakad`.`komennap`
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
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_komennap_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_komennap_100` AFTER DELETE ON `jbsakad`.`komennap`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'komennap', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `komennap`
--

INSERT INTO `komennap` (`replid`, `nis`, `idinfo`, `komentar`, `predikat`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(1, '111/555/888', 1, '', 2, NULL, NULL, NULL, '2013-06-16 11:36:00', 40321, 0),
(2, '123/456/789', 1, '', 3, NULL, NULL, NULL, '2013-07-03 12:06:05', 10017, 0),
(3, '147/258/369', 1, '', 4, NULL, NULL, NULL, '2013-07-03 12:06:05', 24018, 0),
(4, '1101', 2, '<p>tingkakan prestasi</p>', 3, NULL, NULL, NULL, '2013-07-03 20:19:04', 18798, 0),
(5, '123/456/789', 2, '', 2, NULL, NULL, NULL, '2013-07-03 20:18:24', 18997, 0),
(6, '147/258/369', 2, '', 2, NULL, NULL, NULL, '2013-07-03 20:18:24', 60697, 0);

-- --------------------------------------------------------

--
-- Table structure for table `kondisisiswa`
--

CREATE TABLE IF NOT EXISTS `kondisisiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kondisi` varchar(100) NOT NULL,
  `urutan` tinyint(2) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`kondisi`),
  UNIQUE KEY `UX_kondisisiswa` (`replid`),
  KEY `IX_kondisisiswa_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Triggers `kondisisiswa`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_kondisisiswa_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_kondisisiswa_100` BEFORE INSERT ON `jbsakad`.`kondisisiswa`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_kondisisiswa_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_kondisisiswa_100` BEFORE UPDATE ON `jbsakad`.`kondisisiswa`
 FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
     IF NEW.kondisi <> OLD.kondisi THEN 
         INSERT INTO jbsclient.pkchanges SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'kondisisiswa', dataid = OLD.replid, datatoken = OLD.token, newpk = NEW.kondisi, oldpk = OLD.kondisi;
     END IF;
  END IF;
  END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_kondisisiswa_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_kondisisiswa_100` AFTER DELETE ON `jbsakad`.`kondisisiswa`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'kondisisiswa', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `kondisisiswa`
--

INSERT INTO `kondisisiswa` (`replid`, `kondisi`, `urutan`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(8, 'Berkecukupan', 1, NULL, NULL, NULL, '2010-03-02 10:06:17', 30009, 0),
(9, 'Kurang Mampu', 2, NULL, NULL, NULL, '2010-03-02 10:06:17', 54640, 0);

-- --------------------------------------------------------

--
-- Table structure for table `kriteriakejadian`
--

CREATE TABLE IF NOT EXISTS `kriteriakejadian` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kriteria` varchar(50) NOT NULL DEFAULT '',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_kriteriakejadian_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `kriteriakejadian`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_kriteriakejadian_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_kriteriakejadian_100` BEFORE INSERT ON `jbsakad`.`kriteriakejadian`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_kriteriakejadian_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_kriteriakejadian_100` BEFORE UPDATE ON `jbsakad`.`kriteriakejadian`
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
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_kriteriakejadian_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_kriteriakejadian_100` AFTER DELETE ON `jbsakad`.`kriteriakejadian`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'kriteriakejadian', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `kriteriakejadian`
--


-- --------------------------------------------------------

--
-- Table structure for table `mutasisiswa`
--

CREATE TABLE IF NOT EXISTS `mutasisiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(15) NOT NULL DEFAULT '',
  `jenismutasi` int(10) unsigned NOT NULL DEFAULT '0',
  `tglmutasi` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(255) DEFAULT NULL,
  `departemen` varchar(50) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_mutasisiswa_jenismutasi` (`jenismutasi`),
  KEY `FK_mutasisiswa_siswa` (`nis`),
  KEY `FK_mutasisiswa_departemen` (`departemen`),
  KEY `IX_mutasisiswa_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `mutasisiswa`
--


-- --------------------------------------------------------

--
-- Table structure for table `nap`
--

CREATE TABLE IF NOT EXISTS `nap` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL DEFAULT '',
  `idaturan` int(10) unsigned NOT NULL DEFAULT '0',
  `idinfo` int(10) unsigned NOT NULL DEFAULT '0',
  `nilaiangka` decimal(10,2) NOT NULL DEFAULT '0.00',
  `nilaihuruf` varchar(2) NOT NULL DEFAULT '',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_nap_infonap` (`idinfo`),
  KEY `FK_nap_siswa` (`nis`),
  KEY `FK_nap_aturannhb` (`idaturan`),
  KEY `IX_nap_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Triggers `nap`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_nap_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_nap_100` BEFORE INSERT ON `jbsakad`.`nap`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_nap_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_nap_100` BEFORE UPDATE ON `jbsakad`.`nap`
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
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_nap_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_nap_100` AFTER DELETE ON `jbsakad`.`nap`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'nap', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `nap`
--

INSERT INTO `nap` (`replid`, `nis`, `idaturan`, `idinfo`, `nilaiangka`, `nilaihuruf`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(10, '1101', 244, 1, 0.00, '', NULL, NULL, NULL, '2013-07-03 12:06:05', 12742, 0),
(11, '1101', 223, 1, 0.00, 'D', NULL, NULL, NULL, '2013-07-03 12:06:05', 49029, 0),
(12, '123/456/789', 244, 1, 0.00, '', NULL, NULL, NULL, '2013-07-03 12:06:05', 10331, 0),
(13, '123/456/789', 223, 1, 80.00, 'B', NULL, NULL, NULL, '2013-07-03 12:06:05', 35625, 0),
(14, '147/258/369', 244, 1, 0.00, '', NULL, NULL, NULL, '2013-07-03 12:06:05', 16072, 0),
(15, '147/258/369', 223, 1, 90.00, 'A', NULL, NULL, NULL, '2013-07-03 12:06:05', 39014, 0),
(16, '1101', 232, 2, 88.00, '', NULL, NULL, NULL, '2013-07-03 20:18:24', 43779, 0),
(17, '123/456/789', 232, 2, 77.00, '', NULL, NULL, NULL, '2013-07-03 20:18:24', 28185, 0),
(18, '147/258/369', 232, 2, 76.00, '', NULL, NULL, NULL, '2013-07-03 20:18:24', 10432, 0);

-- --------------------------------------------------------

--
-- Table structure for table `nau`
--

CREATE TABLE IF NOT EXISTS `nau` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpelajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `nis` varchar(20) NOT NULL,
  `idkelas` int(10) unsigned DEFAULT NULL,
  `idsemester` int(10) unsigned NOT NULL DEFAULT '0',
  `idjenis` int(10) unsigned NOT NULL DEFAULT '0',
  `nilaiAU` decimal(10,2) NOT NULL DEFAULT '0.00',
  `keterangan` varchar(255) DEFAULT NULL,
  `idaturan` int(10) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_nau_idpelajaran` (`idpelajaran`),
  KEY `FK_nau_nis` (`nis`),
  KEY `FK_nau_idsemester` (`idsemester`),
  KEY `FK_nau_idjenis` (`idjenis`),
  KEY `FK_nau_idaturan` (`idaturan`),
  KEY `FK_nau_kelas` (`idkelas`),
  KEY `IX_nau_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `nau`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_nau_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_nau_100` BEFORE INSERT ON `jbsakad`.`nau`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_nau_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_nau_100` BEFORE UPDATE ON `jbsakad`.`nau`
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
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_nau_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_nau_100` AFTER DELETE ON `jbsakad`.`nau`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'nau', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `nau`
--


-- --------------------------------------------------------

--
-- Table structure for table `nilaiujian`
--

CREATE TABLE IF NOT EXISTS `nilaiujian` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idujian` int(10) unsigned NOT NULL DEFAULT '0',
  `nis` varchar(20) NOT NULL,
  `nilaiujian` decimal(10,2) NOT NULL DEFAULT '0.00',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_nilaiujian_idujian` (`idujian`),
  KEY `FK_nilaiujian_nis` (`nis`),
  KEY `IX_nilaiujian_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Triggers `nilaiujian`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_nilaiujian_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_nilaiujian_100` BEFORE INSERT ON `jbsakad`.`nilaiujian`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_nilaiujian_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_nilaiujian_100` BEFORE UPDATE ON `jbsakad`.`nilaiujian`
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
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_nilaiujian_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_nilaiujian_100` AFTER DELETE ON `jbsakad`.`nilaiujian`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'nilaiujian', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `nilaiujian`
--

INSERT INTO `nilaiujian` (`replid`, `idujian`, `nis`, `nilaiujian`, `keterangan`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(1, 1, '111/555/888', 60.00, '', NULL, NULL, NULL, '2013-06-16 11:36:59', 56035, 0),
(2, 1, '123/456/789', 70.00, '', NULL, NULL, NULL, '2013-06-16 11:36:59', 13389, 0),
(3, 1, '147/258/369', 80.00, '', NULL, NULL, NULL, '2013-06-16 11:36:59', 29898, 0),
(4, 2, '111/555/888', 50.00, '', NULL, NULL, NULL, '2013-06-16 11:37:55', 9596, 0),
(5, 2, '123/456/789', 60.00, '', NULL, NULL, NULL, '2013-06-16 11:37:55', 59492, 0),
(6, 2, '147/258/369', 70.00, '', NULL, NULL, NULL, '2013-06-16 11:37:55', 6551, 0),
(7, 3, '111/555/888', 90.00, '', NULL, NULL, NULL, '2013-06-16 11:38:52', 55771, 0),
(8, 3, '123/456/789', 80.00, '', NULL, NULL, NULL, '2013-06-16 11:38:52', 26263, 0),
(9, 3, '147/258/369', 70.00, '', NULL, NULL, NULL, '2013-06-16 11:38:52', 29533, 0),
(10, 1, '1101', 90.00, '', NULL, NULL, NULL, '2013-07-03 16:19:58', 25820, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pelajaran`
--

CREATE TABLE IF NOT EXISTS `pelajaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `sifat` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_daftarpelajaran_kode` (`kode`),
  KEY `FK_pelajaran_departemen` (`departemen`),
  KEY `IX_pelajaran_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

--
-- Triggers `pelajaran`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_pelajaran_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_pelajaran_100` BEFORE INSERT ON `jbsakad`.`pelajaran`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_pelajaran_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_pelajaran_100` BEFORE UPDATE ON `jbsakad`.`pelajaran`
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
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_pelajaran_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_pelajaran_100` AFTER DELETE ON `jbsakad`.`pelajaran`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'pelajaran', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `pelajaran`
--

INSERT INTO `pelajaran` (`replid`, `kode`, `nama`, `departemen`, `sifat`, `aktif`, `keterangan`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(45, 'FIS', 'Fisika', 'SMK Negeri 12 Malang', 1, 1, '', NULL, NULL, NULL, '2013-07-02 21:03:31', 52115, 0),
(46, 'bind', 'b Indonesia', 'SMK Negeri 12 Malang', 1, 1, '', NULL, NULL, NULL, '2013-05-27 22:45:11', 46302, 0),
(47, 'bing', 'b inggris', 'SMK Negeri 12 Malang', 1, 1, '', NULL, NULL, NULL, '2013-05-27 22:45:23', 6854, 0),
(48, 'bjep', 'b jepang', 'SMK Negeri 12 Malang', 0, 1, '', NULL, NULL, NULL, '2013-07-02 21:04:14', 10120, 0);

-- --------------------------------------------------------

--
-- Table structure for table `phsiswa`
--

CREATE TABLE IF NOT EXISTS `phsiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpresensi` int(10) unsigned NOT NULL,
  `nis` varchar(20) NOT NULL,
  `hadir` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ijin` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sakit` smallint(5) unsigned NOT NULL DEFAULT '0',
  `cuti` smallint(5) unsigned NOT NULL DEFAULT '0',
  `alpa` smallint(5) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_phsiswa_siswa` (`nis`),
  KEY `FK_phsiswa_presensiharian` (`idpresensi`),
  KEY `IX_phsiswa_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Triggers `phsiswa`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_phsiswa_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_phsiswa_100` BEFORE INSERT ON `jbsakad`.`phsiswa`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_phsiswa_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_phsiswa_100` BEFORE UPDATE ON `jbsakad`.`phsiswa`
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
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_phsiswa_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_phsiswa_100` AFTER DELETE ON `jbsakad`.`phsiswa`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'phsiswa', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `phsiswa`
--

INSERT INTO `phsiswa` (`replid`, `idpresensi`, `nis`, `hadir`, `ijin`, `sakit`, `cuti`, `alpa`, `keterangan`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(7, 3, '123/123/654', 1, 0, 0, 0, 0, '', NULL, NULL, NULL, '2013-06-16 11:19:00', 14632, 0),
(8, 4, '123/123/654', 1, 0, 0, 0, 0, '', NULL, NULL, NULL, '2013-06-16 11:19:22', 23480, 0),
(9, 5, '123/123/654', 3, 1, 1, 0, 0, '', NULL, NULL, NULL, '2013-06-16 11:21:33', 3960, 0),
(10, 6, '123/123/654', 0, 1, 0, 0, 0, '', NULL, NULL, NULL, '2013-06-16 11:22:22', 36873, 0),
(11, 7, '111/555/888', 1, 0, 0, 0, 0, '', NULL, NULL, NULL, '2013-06-16 11:23:26', 4115, 0),
(12, 7, '123/456/789', 0, 1, 0, 0, 0, '', NULL, NULL, NULL, '2013-06-16 11:23:26', 29433, 0),
(13, 7, '147/258/369', 0, 1, 0, 0, 0, '', NULL, NULL, NULL, '2013-06-16 11:23:26', 3762, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ppsiswa`
--

CREATE TABLE IF NOT EXISTS `ppsiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpp` int(10) unsigned NOT NULL DEFAULT '0',
  `nis` varchar(20) NOT NULL,
  `statushadir` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 Hadir; 1 Sakit; 2 Ijin; 3 Alpa; 4 Cuti',
  `catatan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_ppsiswa_presensipelajaran` (`idpp`),
  KEY `FK_ppsiswa_siswa` (`nis`),
  KEY `IX_ppsiswa_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Presensi kehadiran siswa dalam pelajaran' AUTO_INCREMENT=1 ;

--
-- Triggers `ppsiswa`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_ppsiswa_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_ppsiswa_100` BEFORE INSERT ON `jbsakad`.`ppsiswa`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`trins_ppsiswa_ppsiswahadir_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`trins_ppsiswa_ppsiswahadir_100` AFTER INSERT ON `jbsakad`.`ppsiswa`
 FOR EACH ROW BEGIN
	DECLARE xidkelas INT;
	DECLARE xidsemester INT;
	DECLARE xidpelajaran INT;
	DECLARE xgurupelajaran VARCHAR(20);
	DECLARE xbulan INT;
	DECLARE xtahun INT;
	DECLARE xcount INT;
	
	IF @DISABLE_TRIGER IS NULL THEN
	
		IF NEW.statushadir = 0 THEN
		
			SELECT idkelas, idsemester, idpelajaran, gurupelajaran, MONTH(tanggal), YEAR(tanggal)
			  INTO xidkelas, xidsemester, xidpelajaran, xgurupelajaran, xbulan, xtahun
			  FROM jbsakad.presensipelajaran WHERE replid = NEW.idpp;

			INSERT INTO jbsakad.ppsiswahadir 
			SET nis = NEW.nis, idkelas = xidkelas, idsemester = xidsemester,
				idpelajaran = xidpelajaran, gurupelajaran = xgurupelajaran, bulan = xbulan, tahun = xtahun, 
				hadir = 1, token = FLOOR(1 + (RAND() * 65530))
			ON DUPLICATE KEY
			UPDATE hadir = hadir + 1, issync = 0, ts = CURRENT_TIMESTAMP;
		
		END IF;
	END IF;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_ppsiswa_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_ppsiswa_100` BEFORE UPDATE ON `jbsakad`.`ppsiswa`
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
DROP TRIGGER IF EXISTS `jbsakad`.`trupd_ppsiswa_ppsiswahadir_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`trupd_ppsiswa_ppsiswahadir_100` AFTER UPDATE ON `jbsakad`.`ppsiswa`
 FOR EACH ROW BEGIN
	DECLARE xidkelas INT;
	DECLARE xidsemester INT;
	DECLARE xidpelajaran INT;
	DECLARE xgurupelajaran VARCHAR(20);
	DECLARE xbulan INT;
	DECLARE xtahun INT;
	DECLARE xcount INT;
	
	IF @DISABLE_TRIGER IS NULL THEN
	
		IF NEW.statushadir = 0 AND OLD.statushadir <> 0 THEN
		
			SELECT idkelas, idsemester, idpelajaran, gurupelajaran, MONTH(tanggal), YEAR(tanggal)
			  INTO xidkelas, xidsemester, xidpelajaran, xgurupelajaran, xbulan, xtahun
				FROM jbsakad.presensipelajaran WHERE replid = NEW.idpp;

			INSERT INTO jbsakad.ppsiswahadir 
			SET nis = NEW.nis, idkelas = xidkelas, idsemester = xidsemester,
				idpelajaran = xidpelajaran, gurupelajaran = xgurupelajaran, bulan = xbulan, tahun = xtahun, 
				hadir = 1, token = FLOOR(1 + (RAND() * 65530))
			ON DUPLICATE KEY
			UPDATE hadir = hadir + 1, issync = 0, ts = CURRENT_TIMESTAMP;
			
		ElSEIF NEW.statushadir <> 0 AND OLD.statushadir = 0 THEN
		
			SELECT idkelas, idsemester, idpelajaran, gurupelajaran, MONTH(tanggal), YEAR(tanggal)
			  INTO xidkelas, xidsemester, xidpelajaran, xgurupelajaran, xbulan, xtahun
				FROM jbsakad.presensipelajaran WHERE replid = NEW.idpp;
			
			UPDATE jbsakad.ppsiswahadir SET hadir = hadir - 1, issync = 0, ts = CURRENT_TIMESTAMP
			  WHERE nis = NEW.nis AND idkelas = xidkelas AND 
			    idsemester = xidsemester AND idpelajaran = xidpelajaran AND
			    gurupelajaran = xgurupelajaran AND bulan = xbulan AND tahun = xtahun;
				
		END IF;
	END IF;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`trdel_ppsiswa_ppsiswahadir_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`trdel_ppsiswa_ppsiswahadir_100` AFTER DELETE ON `jbsakad`.`ppsiswa`
 FOR EACH ROW BEGIN
	DECLARE xidkelas INT;
	DECLARE xidsemester INT;
	DECLARE xidpelajaran INT;
	DECLARE xgurupelajaran VARCHAR(20);
	DECLARE xbulan INT;
	DECLARE xtahun INT;
	DECLARE xcount INT;
	
	IF @DISABLE_TRIGER IS NULL THEN
		IF OLD.statushadir = 0 THEN
			SELECT idkelas, idsemester, idpelajaran, gurupelajaran, MONTH(tanggal), YEAR(tanggal)
			  INTO xidkelas, xidsemester, xidpelajaran, xgurupelajaran, xbulan, xtahun
				FROM jbsakad.presensipelajaran WHERE replid = OLD.idpp;
			
			UPDATE jbsakad.ppsiswahadir SET hadir = hadir - 1, issync = 0, ts = CURRENT_TIMESTAMP
			  WHERE nis = OLD.nis AND idkelas = xidkelas AND 
			    idsemester = xidsemester AND idpelajaran = xidpelajaran AND
			    gurupelajaran = xgurupelajaran AND bulan = xbulan AND tahun = xtahun;							
		END IF;
		
		INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), 
			dbname = 'jbsakad', tablename = 'ppsiswa', dataid = OLD.replid, datatoken = OLD.token;
	END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `ppsiswa`
--


-- --------------------------------------------------------

--
-- Table structure for table `ppsiswahadir`
--

CREATE TABLE IF NOT EXISTS `ppsiswahadir` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `idkelas` int(10) unsigned NOT NULL,
  `idsemester` int(10) unsigned NOT NULL,
  `idpelajaran` int(10) unsigned NOT NULL,
  `gurupelajaran` varchar(20) NOT NULL,
  `bulan` tinyint(1) unsigned NOT NULL,
  `tahun` smallint(5) unsigned NOT NULL,
  `hadir` smallint(5) unsigned NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  UNIQUE KEY `UX_ppsiswahadir` (`nis`,`idkelas`,`idsemester`,`idpelajaran`,`gurupelajaran`,`bulan`,`tahun`),
  KEY `FK_ppsiswahadir_siswa` (`nis`),
  KEY `FK_ppsiswahadir_kelas` (`idkelas`),
  KEY `FK_ppsiswahadir_semester` (`idsemester`),
  KEY `FK_ppsiswahadir_pelajaran` (`idpelajaran`),
  KEY `FK_ppsiswahadir_pegawai` (`gurupelajaran`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ppsiswahadir`
--


-- --------------------------------------------------------

--
-- Table structure for table `presensiharian`
--

CREATE TABLE IF NOT EXISTS `presensiharian` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkelas` int(10) unsigned NOT NULL,
  `idsemester` int(10) unsigned NOT NULL,
  `tanggal1` date NOT NULL,
  `tanggal2` date NOT NULL,
  `hariaktif` int(10) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_presensiharian_semester` (`idsemester`),
  KEY `IX_presensiharian_tanggal1` (`tanggal1`),
  KEY `IX_presensiharian_tanggal2` (`tanggal2`),
  KEY `FK_presensiharian_kelas` (`idkelas`),
  KEY `IX_presensiharian_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Triggers `presensiharian`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_presensiharian_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_presensiharian_100` BEFORE INSERT ON `jbsakad`.`presensiharian`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_presensiharian_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_presensiharian_100` BEFORE UPDATE ON `jbsakad`.`presensiharian`
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
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_presensiharian_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_presensiharian_100` AFTER DELETE ON `jbsakad`.`presensiharian`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'presensiharian', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `presensiharian`
--

INSERT INTO `presensiharian` (`replid`, `idkelas`, `idsemester`, `tanggal1`, `tanggal2`, `hariaktif`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(3, 49, 20, '2013-06-16', '2013-06-16', 1, NULL, NULL, NULL, '2013-06-16 11:19:00', 26444, 0),
(4, 49, 20, '2013-06-15', '2013-06-15', 1, NULL, NULL, NULL, '2013-06-16 11:19:22', 61449, 0),
(5, 49, 20, '2013-06-10', '2013-06-14', 5, NULL, NULL, NULL, '2013-06-16 11:21:33', 16327, 0),
(6, 49, 20, '2013-06-05', '2013-06-05', 1, NULL, NULL, NULL, '2013-06-16 11:22:22', 54482, 0),
(7, 48, 20, '2013-06-14', '2013-06-14', 1, NULL, NULL, NULL, '2013-06-16 11:23:26', 62576, 0);

-- --------------------------------------------------------

--
-- Table structure for table `presensipelajaran`
--

CREATE TABLE IF NOT EXISTS `presensipelajaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkelas` int(10) unsigned NOT NULL DEFAULT '0',
  `idsemester` int(10) unsigned NOT NULL DEFAULT '0',
  `idpelajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `jam` time NOT NULL DEFAULT '00:00:00',
  `gurupelajaran` varchar(15) NOT NULL DEFAULT '',
  `keterangan` varchar(255) DEFAULT NULL,
  `materi` varchar(1000) NOT NULL DEFAULT '',
  `objektif` varchar(255) DEFAULT NULL,
  `refleksi` varchar(255) DEFAULT NULL,
  `rencana` varchar(255) DEFAULT NULL,
  `keterlambatan` tinyint(4) DEFAULT NULL,
  `jumlahjam` decimal(4,2) NOT NULL DEFAULT '0.00',
  `jenisguru` int(10) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_presensipelajaran_semester` (`idsemester`),
  KEY `FK_presensipelajaran_jenisguru` (`jenisguru`),
  KEY `FK_presensipelajaran_pelajaran` (`idpelajaran`),
  KEY `FK_presensipelajaran_pegawai` (`gurupelajaran`),
  KEY `FK_presensipelajaran_kelas` (`idkelas`),
  KEY `IX_presensipelajaran_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informasi presensi kehadiran guru dan siswa per mata pelajar' AUTO_INCREMENT=1 ;

--
-- Triggers `presensipelajaran`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_presensipelajaran_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_presensipelajaran_100` BEFORE INSERT ON `jbsakad`.`presensipelajaran`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_presensipelajaran_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_presensipelajaran_100` BEFORE UPDATE ON `jbsakad`.`presensipelajaran`
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
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_presensipelajaran_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_presensipelajaran_100` AFTER DELETE ON `jbsakad`.`presensipelajaran`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'presensipelajaran', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `presensipelajaran`
--


-- --------------------------------------------------------

--
-- Table structure for table `prosespenerimaansiswa`
--

CREATE TABLE IF NOT EXISTS `prosespenerimaansiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `proses` varchar(100) NOT NULL,
  `kodeawalan` varchar(5) NOT NULL,
  `departemen` varchar(20) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_prosespenerimaansiswa_departemen` (`departemen`),
  KEY `IX_prosespenerimaansiswa_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `prosespenerimaansiswa`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_prosespenerimaansiswa_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_prosespenerimaansiswa_100` BEFORE INSERT ON `jbsakad`.`prosespenerimaansiswa`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_prosespenerimaansiswa_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_prosespenerimaansiswa_100` BEFORE UPDATE ON `jbsakad`.`prosespenerimaansiswa`
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
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_prosespenerimaansiswa_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_prosespenerimaansiswa_100` AFTER DELETE ON `jbsakad`.`prosespenerimaansiswa`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'prosespenerimaansiswa', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `prosespenerimaansiswa`
--


-- --------------------------------------------------------

--
-- Table structure for table `ratauk`
--

CREATE TABLE IF NOT EXISTS `ratauk` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkelas` int(10) unsigned NOT NULL DEFAULT '0',
  `idsemester` int(10) unsigned NOT NULL DEFAULT '0',
  `idujian` int(10) unsigned NOT NULL DEFAULT '0',
  `nilaiRK` decimal(10,2) NOT NULL DEFAULT '0.00',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_ratauk_idsemester` (`idsemester`),
  KEY `FK_ratauk_idujian` (`idujian`),
  KEY `FK_ratauk_kelas` (`idkelas`),
  KEY `IX_ratauk_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Triggers `ratauk`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_ratauk_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_ratauk_100` BEFORE INSERT ON `jbsakad`.`ratauk`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_ratauk_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_ratauk_100` BEFORE UPDATE ON `jbsakad`.`ratauk`
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
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_ratauk_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_ratauk_100` AFTER DELETE ON `jbsakad`.`ratauk`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'ratauk', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `ratauk`
--

INSERT INTO `ratauk` (`replid`, `idkelas`, `idsemester`, `idujian`, `nilaiRK`, `keterangan`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(1, 48, 20, 1, 75.00, NULL, NULL, NULL, NULL, '2013-07-03 20:14:43', 39386, 0),
(2, 48, 20, 2, 60.00, NULL, NULL, NULL, NULL, '2013-07-02 22:17:07', 37283, 0),
(3, 48, 20, 3, 80.00, NULL, NULL, NULL, NULL, '2013-07-03 12:05:20', 63961, 0);

-- --------------------------------------------------------

--
-- Table structure for table `rataus`
--

CREATE TABLE IF NOT EXISTS `rataus` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `idsemester` int(10) unsigned NOT NULL DEFAULT '0',
  `idkelas` int(10) unsigned DEFAULT NULL,
  `idjenis` int(10) unsigned NOT NULL DEFAULT '0',
  `rataUS` decimal(10,2) NOT NULL DEFAULT '0.00',
  `keterangan` varchar(255) DEFAULT NULL,
  `idpelajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `idaturan` int(10) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_rataus_nis` (`nis`),
  KEY `FK_rataus_idsemester` (`idsemester`),
  KEY `FK_rataus_jenis` (`idjenis`),
  KEY `FK_rataus_idpelajaran` (`idpelajaran`),
  KEY `FK_rataus_kelas` (`idkelas`),
  KEY `IX_rataus_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Triggers `rataus`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_rataus_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_rataus_100` BEFORE INSERT ON `jbsakad`.`rataus`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_rataus_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_rataus_100` BEFORE UPDATE ON `jbsakad`.`rataus`
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
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_rataus_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_rataus_100` AFTER DELETE ON `jbsakad`.`rataus`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'rataus', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `rataus`
--

INSERT INTO `rataus` (`replid`, `nis`, `idsemester`, `idkelas`, `idjenis`, `rataUS`, `keterangan`, `idpelajaran`, `idaturan`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(1, '111/555/888', 20, 48, 109, 60.00, NULL, 47, 223, NULL, NULL, NULL, '2013-06-19 22:19:43', 61999, 0),
(2, '123/456/789', 20, 48, 109, 70.00, NULL, 47, 223, NULL, NULL, NULL, '2013-07-03 20:14:43', 60777, 0),
(3, '147/258/369', 20, 48, 109, 80.00, NULL, 47, 223, NULL, NULL, NULL, '2013-07-03 20:14:43', 52356, 0),
(4, '111/555/888', 20, 48, 110, 50.00, NULL, 47, 224, NULL, NULL, NULL, '2013-06-16 11:37:56', 18193, 0),
(5, '123/456/789', 20, 48, 110, 60.00, NULL, 47, 224, NULL, NULL, NULL, '2013-07-02 22:17:07', 44646, 0),
(6, '147/258/369', 20, 48, 110, 70.00, NULL, 47, 224, NULL, NULL, NULL, '2013-07-02 22:17:07', 37592, 0),
(7, '111/555/888', 20, 48, 111, 90.00, NULL, 47, 225, NULL, NULL, NULL, '2013-06-16 11:38:53', 39561, 0),
(8, '123/456/789', 20, 48, 111, 80.00, NULL, 47, 225, NULL, NULL, NULL, '2013-07-03 12:05:20', 5919, 0),
(9, '147/258/369', 20, 48, 111, 70.00, NULL, 47, 225, NULL, NULL, NULL, '2013-07-03 12:05:20', 41971, 0),
(10, '1101', 20, 48, 109, 90.00, NULL, 47, 223, NULL, NULL, NULL, '2013-07-03 20:14:43', 44830, 0),
(11, '1101', 20, 48, 110, 0.00, NULL, 47, 224, NULL, NULL, NULL, '2013-07-02 22:17:07', 58266, 0),
(12, '1101', 20, 48, 111, 0.00, NULL, 47, 225, NULL, NULL, NULL, '2013-07-03 12:05:20', 28662, 0);

-- --------------------------------------------------------

--
-- Table structure for table `riwayatdeptsiswa`
--

CREATE TABLE IF NOT EXISTS `riwayatdeptsiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `mulai` date NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '0 -> Baru, 1 -> Siswa Pindah Departemen',
  `keterangan` varchar(255) DEFAULT NULL,
  `nislama` varchar(20) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_riwayatdeptsiswa_departemen` (`departemen`),
  KEY `FK_riwayatdeptsiswa_siswa` (`nis`),
  KEY `IX_riwayatdeptsiswa_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Triggers `riwayatdeptsiswa`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_riwayatdeptsiswa_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_riwayatdeptsiswa_100` BEFORE INSERT ON `jbsakad`.`riwayatdeptsiswa`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_riwayatdeptsiswa_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_riwayatdeptsiswa_100` BEFORE UPDATE ON `jbsakad`.`riwayatdeptsiswa`
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
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_riwayatdeptsiswa_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_riwayatdeptsiswa_100` AFTER DELETE ON `jbsakad`.`riwayatdeptsiswa`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'riwayatdeptsiswa', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `riwayatdeptsiswa`
--

INSERT INTO `riwayatdeptsiswa` (`replid`, `nis`, `departemen`, `mulai`, `aktif`, `status`, `keterangan`, `nislama`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(1, '321/321/221', 'SMK Negeri 12 Malang', '2013-05-27', 1, 0, NULL, NULL, NULL, NULL, NULL, '2013-05-27 22:39:14', 18749, 0),
(2, '111/555/888', 'SMK Negeri 12 Malang', '2013-05-28', 1, 0, NULL, NULL, NULL, NULL, NULL, '2013-05-28 14:01:28', 49252, 0),
(3, '123/456/789', 'SMK Negeri 12 Malang', '2013-05-28', 1, 0, NULL, NULL, NULL, NULL, NULL, '2013-05-28 14:02:54', 9261, 0),
(4, '147/258/369', 'SMK Negeri 12 Malang', '2013-05-28', 1, 0, NULL, NULL, NULL, NULL, NULL, '2013-05-28 14:08:09', 5087, 0),
(5, '123/123/456', 'SMK Negeri 12 Malang', '2013-05-28', 1, 0, NULL, NULL, NULL, NULL, NULL, '2013-05-28 14:09:39', 51196, 0),
(6, '333/333/333', 'SMK Negeri 12 Malang', '2013-05-28', 1, 0, NULL, NULL, NULL, NULL, NULL, '2013-05-28 14:10:37', 9567, 0),
(7, '111/444/777', 'SMK Negeri 12 Malang', '2013-05-28', 1, 0, NULL, NULL, NULL, NULL, NULL, '2013-05-28 14:13:36', 3554, 0),
(8, '111/555/777', 'SMK Negeri 12 Malang', '2013-05-28', 1, 0, NULL, NULL, NULL, NULL, NULL, '2013-05-28 14:15:15', 35755, 0),
(9, '112/221/121', 'SMK Negeri 12 Malang', '2013-05-28', 1, 0, NULL, NULL, NULL, NULL, NULL, '2013-05-28 14:16:17', 36927, 0),
(10, '123/123/654', 'SMK Negeri 12 Malang', '2013-05-28', 1, 0, NULL, NULL, NULL, NULL, NULL, '2013-05-28 14:17:34', 61538, 0),
(11, '1101', 'SMK Negeri 12 Malang', '2013-06-18', 1, 0, NULL, NULL, NULL, NULL, NULL, '2013-06-18 15:15:08', 11809, 0);

-- --------------------------------------------------------

--
-- Table structure for table `riwayatkelassiswa`
--

CREATE TABLE IF NOT EXISTS `riwayatkelassiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `idkelas` int(10) unsigned NOT NULL,
  `mulai` date NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '0 -> Baru, 1 -> Naik, 2 -> Tidak Naik, 3-> Pindah',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_riwayatkelassiswa_siswa` (`nis`),
  KEY `FK_riwayatkelassiswa_kelas` (`idkelas`),
  KEY `IX_riwayatkelassiswa_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Triggers `riwayatkelassiswa`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_riwayatkelassiswa_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_riwayatkelassiswa_100` BEFORE INSERT ON `jbsakad`.`riwayatkelassiswa`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_riwayatkelassiswa_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_riwayatkelassiswa_100` BEFORE UPDATE ON `jbsakad`.`riwayatkelassiswa`
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
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_riwayatkelassiswa_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_riwayatkelassiswa_100` AFTER DELETE ON `jbsakad`.`riwayatkelassiswa`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'riwayatkelassiswa', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `riwayatkelassiswa`
--

INSERT INTO `riwayatkelassiswa` (`replid`, `nis`, `idkelas`, `mulai`, `aktif`, `status`, `keterangan`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(1, '321/321/221', 47, '2013-05-27', 1, 0, NULL, NULL, NULL, NULL, '2013-05-27 22:39:14', 62555, 0),
(2, '111/555/888', 48, '2013-05-28', 0, 0, NULL, NULL, NULL, NULL, '2013-06-20 20:36:18', 4934, 0),
(3, '123/456/789', 48, '2013-05-28', 1, 0, NULL, NULL, NULL, NULL, '2013-05-28 14:02:54', 55487, 0),
(4, '147/258/369', 48, '2013-05-28', 1, 0, NULL, NULL, NULL, NULL, '2013-05-28 14:08:09', 239, 0),
(5, '123/123/456', 47, '2013-05-28', 1, 0, NULL, NULL, NULL, NULL, '2013-05-28 14:09:39', 65430, 0),
(6, '333/333/333', 47, '2013-05-28', 1, 0, NULL, NULL, NULL, NULL, '2013-05-28 14:10:37', 15886, 0),
(7, '111/444/777', 46, '2013-05-28', 1, 0, NULL, NULL, NULL, NULL, '2013-05-28 14:13:36', 37821, 0),
(8, '111/555/777', 46, '2013-05-28', 1, 0, NULL, NULL, NULL, NULL, '2013-05-28 14:15:15', 20347, 0),
(9, '112/221/121', 46, '2013-05-28', 0, 0, NULL, NULL, NULL, NULL, '2013-06-20 20:36:57', 8039, 0),
(10, '123/123/654', 49, '2013-05-28', 1, 0, NULL, NULL, NULL, NULL, '2013-05-28 14:17:34', 37879, 0),
(11, '1101', 48, '2013-06-18', 1, 0, NULL, NULL, NULL, NULL, '2013-06-18 15:15:08', 15537, 0),
(12, '111/555/888', 50, '2013-06-20', 1, 1, '', NULL, NULL, NULL, '2013-06-20 20:36:18', 23126, 0),
(13, '112/221/121', 50, '2013-06-20', 1, 1, '', NULL, NULL, NULL, '2013-06-20 20:36:57', 5820, 0);

-- --------------------------------------------------------

--
-- Table structure for table `rpp`
--

CREATE TABLE IF NOT EXISTS `rpp` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idtingkat` int(10) unsigned NOT NULL,
  `idsemester` int(10) unsigned NOT NULL,
  `idpelajaran` int(10) unsigned NOT NULL,
  `koderpp` varchar(20) NOT NULL,
  `rpp` varchar(255) NOT NULL,
  `deskripsi` text,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_rpp_tingkat` (`idtingkat`),
  KEY `FK_rpp_semester` (`idsemester`),
  KEY `FK_rpp_pelajaran` (`idpelajaran`),
  KEY `IX_rpp_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Triggers `rpp`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_rpp_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_rpp_100` BEFORE INSERT ON `jbsakad`.`rpp`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_rpp_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_rpp_100` BEFORE UPDATE ON `jbsakad`.`rpp`
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
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_rpp_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_rpp_100` AFTER DELETE ON `jbsakad`.`rpp`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'rpp', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `rpp`
--

INSERT INTO `rpp` (`replid`, `idtingkat`, `idsemester`, `idpelajaran`, `koderpp`, `rpp`, `deskripsi`, `aktif`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(1, 26, 20, 46, '1122', 'pantun', '', 1, NULL, NULL, NULL, '2013-05-27 23:17:22', 51246, 0),
(2, 26, 20, 47, '2211', 'reading', '', 1, NULL, NULL, NULL, '2013-05-28 13:43:16', 47546, 0);

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE IF NOT EXISTS `semester` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `semester` varchar(50) NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_semester_departemen` (`departemen`),
  KEY `IX_semester_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Triggers `semester`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_semester_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_semester_100` BEFORE INSERT ON `jbsakad`.`semester`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_semester_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_semester_100` BEFORE UPDATE ON `jbsakad`.`semester`
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
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_semester_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_semester_100` AFTER DELETE ON `jbsakad`.`semester`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'semester', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`replid`, `semester`, `departemen`, `aktif`, `keterangan`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(20, 'Semester I', 'SMK Negeri 12 Malang', 1, '', NULL, NULL, NULL, '2013-07-02 20:47:46', 6418, 0),
(21, 'Semester II', 'SMK Negeri 12 Malang', 0, '', NULL, NULL, NULL, '2013-05-28 13:42:23', 838, 0);

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE IF NOT EXISTS `siswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `panggilan` varchar(30) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `tahunmasuk` int(10) unsigned NOT NULL,
  `idangkatan` int(10) unsigned NOT NULL,
  `idkelas` int(10) unsigned NOT NULL,
  `suku` varchar(20) NOT NULL,
  `agama` varchar(20) NOT NULL,
  `status` varchar(100) NOT NULL,
  `kondisi` varchar(100) NOT NULL,
  `kelamin` varchar(1) NOT NULL,
  `tmplahir` varchar(50) NOT NULL,
  `tgllahir` date NOT NULL,
  `warga` varchar(5) DEFAULT NULL,
  `anakke` tinyint(2) unsigned DEFAULT '0',
  `jsaudara` tinyint(2) unsigned DEFAULT '0',
  `bahasa` varchar(60) DEFAULT NULL,
  `berat` decimal(4,1) unsigned DEFAULT '0.0',
  `tinggi` decimal(4,1) unsigned DEFAULT '0.0',
  `darah` varchar(2) DEFAULT NULL,
  `foto` mediumblob,
  `alamatsiswa` varchar(255) DEFAULT NULL,
  `kodepossiswa` varchar(8) DEFAULT NULL,
  `telponsiswa` varchar(20) DEFAULT NULL,
  `hpsiswa` varchar(20) DEFAULT NULL,
  `emailsiswa` varchar(100) DEFAULT NULL,
  `kesehatan` varchar(255) DEFAULT NULL,
  `asalsekolah` varchar(100) DEFAULT NULL,
  `ketsekolah` varchar(255) DEFAULT NULL,
  `namaayah` varchar(100) DEFAULT NULL,
  `namaibu` varchar(100) DEFAULT NULL,
  `almayah` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `almibu` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pendidikanayah` varchar(20) DEFAULT NULL,
  `pendidikanibu` varchar(20) DEFAULT NULL,
  `pekerjaanayah` varchar(100) DEFAULT NULL,
  `pekerjaanibu` varchar(100) DEFAULT NULL,
  `wali` varchar(100) DEFAULT NULL,
  `penghasilanayah` int(10) unsigned DEFAULT '0',
  `penghasilanibu` int(10) unsigned DEFAULT '0',
  `alamatortu` varchar(100) DEFAULT NULL,
  `telponortu` varchar(20) DEFAULT NULL,
  `hportu` varchar(20) DEFAULT NULL,
  `emailayah` varchar(100) DEFAULT NULL,
  `alamatsurat` varchar(100) DEFAULT NULL,
  `keterangan` text,
  `frompsb` tinyint(1) unsigned DEFAULT '0',
  `ketpsb` varchar(255) DEFAULT NULL,
  `statusmutasi` int(10) unsigned DEFAULT NULL,
  `alumni` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 bukan alumni, 1 alumni',
  `pinsiswa` varchar(25) NOT NULL,
  `pinortu` varchar(25) NOT NULL,
  `pinortuibu` varchar(25) NOT NULL,
  `emailibu` varchar(100) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nis`),
  UNIQUE KEY `UX_siswa_replid` (`replid`),
  KEY `FK_siswa_angkatan` (`idangkatan`),
  KEY `FK_siswa_suku` (`suku`),
  KEY `FK_siswa_agama` (`agama`),
  KEY `FK_siswa_status` (`status`),
  KEY `FK_siswa_kondisi` (`kondisi`),
  KEY `FK_siswa_pendidikanayah` (`pendidikanayah`),
  KEY `FK_siswa_pendidikanibu` (`pendidikanibu`),
  KEY `FK_siswa_pekerjaanayah` (`pekerjaanayah`),
  KEY `FK_siswa_pekerjaanibu` (`pekerjaanibu`),
  KEY `FK_siswa_statusmutasi` (`statusmutasi`),
  KEY `FK_siswa_kelas` (`idkelas`),
  KEY `FK_siswa_asalsekolah` (`asalsekolah`),
  KEY `IX_siswa_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Triggers `siswa`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_siswa_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_siswa_100` BEFORE INSERT ON `jbsakad`.`siswa`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_siswa_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_siswa_100` BEFORE UPDATE ON `jbsakad`.`siswa`
 FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
     IF NEW.nis <> OLD.nis THEN 
         INSERT INTO jbsclient.pkchanges SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'siswa', dataid = OLD.replid, datatoken = OLD.token, newpk = NEW.nis, oldpk = OLD.nis;
     END IF;
  END IF;
  END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_siswa_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_siswa_100` AFTER DELETE ON `jbsakad`.`siswa`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'siswa', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`replid`, `nis`, `nama`, `panggilan`, `aktif`, `tahunmasuk`, `idangkatan`, `idkelas`, `suku`, `agama`, `status`, `kondisi`, `kelamin`, `tmplahir`, `tgllahir`, `warga`, `anakke`, `jsaudara`, `bahasa`, `berat`, `tinggi`, `darah`, `foto`, `alamatsiswa`, `kodepossiswa`, `telponsiswa`, `hpsiswa`, `emailsiswa`, `kesehatan`, `asalsekolah`, `ketsekolah`, `namaayah`, `namaibu`, `almayah`, `almibu`, `pendidikanayah`, `pendidikanibu`, `pekerjaanayah`, `pekerjaanibu`, `wali`, `penghasilanayah`, `penghasilanibu`, `alamatortu`, `telponortu`, `hportu`, `emailayah`, `alamatsurat`, `keterangan`, `frompsb`, `ketpsb`, `statusmutasi`, `alumni`, `pinsiswa`, `pinortu`, `pinortuibu`, `emailibu`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(12, '1101', 'Klepon', 'Klepon', 1, 2012, 19, 48, 'Jawa', 'Islam', 'Reguler', 'Berkecukupan', 'l', 'aaaa', '1988-02-01', 'WNI', 1, 1, '', 0.0, 0.0, '', '', '', NULL, '', '', '', '', NULL, '', '', '', 0, 0, NULL, NULL, NULL, NULL, '', 0, 0, '', '', '', '', '', '', 0, NULL, NULL, 0, '66210', '82597', '40183', '', NULL, NULL, NULL, '2013-06-18 15:16:18', 14502, 0),
(8, '111/444/777', 'miranda', '', 1, 2012, 19, 46, 'Jawa', 'Katolik', 'Reguler', 'Berkecukupan', 'p', 'malanbg', '1995-08-08', 'WNI', 1, 1, '', 0.0, 0.0, '', '', '', NULL, '', '', '', '', NULL, '', '', '', 0, 0, NULL, NULL, NULL, NULL, '', 0, 0, '', '', '', '', '', '', 0, NULL, NULL, 0, '69673', '48232', '54625', '', NULL, NULL, NULL, '2013-05-28 14:13:36', 58846, 0),
(9, '111/555/777', 'nina', '', 1, 2012, 19, 46, 'Jawa', 'Islam', 'Reguler', 'Berkecukupan', 'l', 'malang', '1996-05-04', 'WNI', 1, 1, '', 0.0, 0.0, '', '', '', NULL, '', '', '', '', NULL, '', '', '', 0, 0, NULL, NULL, NULL, NULL, '', 0, 0, '', '', '', '', '', '', 0, NULL, NULL, 0, '69328', '39023', '66026', '', NULL, NULL, NULL, '2013-05-28 14:15:15', 52809, 0),
(2, '111/555/888', 'amin', '', 1, 2012, 19, 50, 'Padang', 'Katolik', 'Eksklusif', 'Kurang Mampu', 'l', 'blitar', '1996-09-16', 'WNI', 1, 1, '', 0.0, 0.0, '', '', '', NULL, '', '', '', '', NULL, '', '', '', 0, 0, NULL, NULL, NULL, NULL, '', 0, 0, '', '', '', '', '', '', 0, NULL, NULL, 0, '15286', '37398', '51074', '', NULL, NULL, NULL, '2013-06-20 20:36:18', 14911, 0),
(10, '112/221/121', 'liza', '', 1, 2012, 19, 50, 'Jawa', 'Islam', 'Reguler', 'Berkecukupan', 'p', 'lumajang', '1996-03-30', 'WNI', 1, 1, '', 0.0, 0.0, '', '', '', NULL, '', '', '', '', NULL, '', '', '', 0, 0, NULL, NULL, NULL, NULL, '', 0, 0, '', '', '', '', '', '', 0, NULL, NULL, 0, '14819', '12562', '15436', '', NULL, NULL, NULL, '2013-06-20 20:36:57', 15178, 0),
(6, '123/123/456', 'willie', '', 1, 2012, 19, 47, 'Sunda', 'Islam', 'Eksklusif', 'Kurang Mampu', 'l', 'tarakan', '1995-12-19', 'WNI', 1, 1, '', 0.0, 0.0, '', '', '', NULL, '', '', '', '', NULL, '', '', '', 0, 0, NULL, NULL, NULL, NULL, '', 0, 0, '', '', '', '', '', '', 0, NULL, NULL, 0, '90613', '62604', '70008', '', NULL, NULL, NULL, '2013-05-28 14:09:39', 19830, 0),
(11, '123/123/654', 'mirza', '', 1, 2011, 19, 49, 'Jawa', 'Islam', 'Reguler', 'Berkecukupan', 'l', 'malang', '1995-12-12', 'WNI', 1, 1, '', 0.0, 0.0, '', '', '', NULL, '', '', '', '', NULL, '', '', '', 0, 0, NULL, NULL, NULL, NULL, '', 0, 0, '', '', '', '', '', '', 0, NULL, NULL, 0, '90474', '78390', '74204', '', NULL, NULL, NULL, '2013-05-28 14:17:34', 2563, 0),
(4, '123/456/789', 'lala', '', 1, 2012, 19, 48, 'Jawa', 'Islam', 'Reguler', 'Kurang Mampu', 'l', 'malang', '1996-07-09', 'WNI', 1, 1, '', 0.0, 0.0, '', '', '', NULL, '', '', '', '', NULL, '', '', '', 0, 0, NULL, NULL, NULL, NULL, '', 0, 0, '', '', '', '', '', '', 0, NULL, NULL, 0, '80865', '79821', '66379', '', NULL, NULL, NULL, '2013-05-28 14:02:54', 18783, 0),
(5, '147/258/369', 'nano', '', 1, 2012, 19, 48, 'Jawa', 'Islam', 'Reguler', 'Kurang Mampu', 'l', 'semarng', '1995-05-13', 'WNI', 1, 1, '', 0.0, 0.0, '', '', '', NULL, '', '', '', '', NULL, '', '', '', 0, 0, NULL, NULL, NULL, NULL, '', 0, 0, '', '', '', '', '', '', 0, NULL, NULL, 0, '75078', '13085', '86560', '', NULL, NULL, NULL, '2013-05-28 14:08:09', 30242, 0),
(1, '321/321/221', 'bruce', '', 1, 2012, 19, 47, 'Jawa', 'Islam', 'Reguler', 'Berkecukupan', 'l', 'yogya', '1999-01-01', 'WNI', 1, 1, '', 0.0, 0.0, '', 0x89504e470d0a1a0a0000000d494844520000004d00000078080200000038dce8f9, '', NULL, '', '', '', '', NULL, '', '', '', 0, 0, NULL, NULL, NULL, NULL, '', 0, 0, '', '', '', '', '', '', 0, NULL, NULL, 0, '36133', '57377', '42746', '', NULL, NULL, NULL, '2013-05-27 22:44:02', 10396, 0),
(7, '333/333/333', 'vije', '', 1, 2001, 19, 47, 'Jawa', 'Islam', 'Reguler', 'Berkecukupan', 'l', 'singosari', '1977-08-20', 'WNI', 1, 1, '', 0.0, 0.0, '', '', '', NULL, '', '', '', '', NULL, '', '', '', 0, 0, NULL, NULL, NULL, NULL, '', 0, 0, '', '', '', '', '', '', 0, NULL, NULL, 0, '23970', '54754', '97216', '', NULL, NULL, NULL, '2013-05-28 14:10:37', 54336, 0);

-- --------------------------------------------------------

--
-- Table structure for table `statusguru`
--

CREATE TABLE IF NOT EXISTS `statusguru` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`status`),
  UNIQUE KEY `UX_statusguru_replid` (`replid`),
  KEY `IX_statusguru_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Triggers `statusguru`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_statusguru_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_statusguru_100` BEFORE INSERT ON `jbsakad`.`statusguru`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_statusguru_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_statusguru_100` BEFORE UPDATE ON `jbsakad`.`statusguru`
 FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
     IF NEW.status <> OLD.status THEN 
         INSERT INTO jbsclient.pkchanges SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'statusguru', dataid = OLD.replid, datatoken = OLD.token, newpk = NEW.status, oldpk = OLD.status;
     END IF;
  END IF;
  END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_statusguru_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_statusguru_100` AFTER DELETE ON `jbsakad`.`statusguru`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'statusguru', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `statusguru`
--

INSERT INTO `statusguru` (`replid`, `status`, `keterangan`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(8, 'Asisten', '', NULL, NULL, NULL, '2013-07-02 21:38:52', 11638, 0),
(7, 'Guru Honorer', '', NULL, NULL, NULL, '2010-03-02 10:06:18', 52760, 0),
(6, 'Guru Tetap', '', NULL, NULL, NULL, '2013-07-02 21:39:24', 32293, 0);

-- --------------------------------------------------------

--
-- Table structure for table `statussiswa`
--

CREATE TABLE IF NOT EXISTS `statussiswa` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL,
  `urutan` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`status`),
  UNIQUE KEY `UX_statussiswa` (`replid`),
  KEY `IX_statussiswa_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Triggers `statussiswa`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_statussiswa_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_statussiswa_100` BEFORE INSERT ON `jbsakad`.`statussiswa`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_statussiswa_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_statussiswa_100` BEFORE UPDATE ON `jbsakad`.`statussiswa`
 FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
     IF NEW.status <> OLD.status THEN 
         INSERT INTO jbsclient.pkchanges SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'statussiswa', dataid = OLD.replid, datatoken = OLD.token, newpk = NEW.status, oldpk = OLD.status;
     END IF;
  END IF;
  END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_statussiswa_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_statussiswa_100` AFTER DELETE ON `jbsakad`.`statussiswa`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'statussiswa', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `statussiswa`
--

INSERT INTO `statussiswa` (`replid`, `status`, `urutan`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(7, 'Eksklusif', 2, NULL, NULL, NULL, '2010-03-02 10:06:18', 3185, 0),
(6, 'Reguler', 1, NULL, NULL, NULL, '2010-03-02 10:06:18', 50107, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tahunajaran`
--

CREATE TABLE IF NOT EXISTS `tahunajaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` varchar(50) NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `tglmulai` date NOT NULL,
  `tglakhir` date NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_tahunajaran_departemen` (`departemen`),
  KEY `IX_tahunajaran_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Triggers `tahunajaran`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_tahunajaran_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_tahunajaran_100` BEFORE INSERT ON `jbsakad`.`tahunajaran`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_tahunajaran_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_tahunajaran_100` BEFORE UPDATE ON `jbsakad`.`tahunajaran`
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
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_tahunajaran_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_tahunajaran_100` AFTER DELETE ON `jbsakad`.`tahunajaran`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'tahunajaran', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `tahunajaran`
--

INSERT INTO `tahunajaran` (`replid`, `tahunajaran`, `departemen`, `tglmulai`, `tglakhir`, `aktif`, `keterangan`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(20, '2012/2013', 'SMK Negeri 12 Malang', '2012-06-07', '2013-07-30', 1, '', NULL, NULL, NULL, '2013-05-28 14:43:07', 44390, 0),
(21, '2013/2014', 'SMK Negeri 12 Malang', '2013-06-28', '2014-07-28', 0, '', NULL, NULL, NULL, '2013-05-28 14:43:07', 11613, 0),
(22, '2014/2015', 'SMK Negeri 12 Malang', '2014-06-28', '2015-07-28', 0, '', NULL, NULL, NULL, '2013-05-28 14:43:07', 15449, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tingkat`
--

CREATE TABLE IF NOT EXISTS `tingkat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tingkat` varchar(50) NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `urutan` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_tingkat_departemen` (`departemen`),
  KEY `IX_tingkat_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Triggers `tingkat`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_tingkat_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_tingkat_100` BEFORE INSERT ON `jbsakad`.`tingkat`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_tingkat_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_tingkat_100` BEFORE UPDATE ON `jbsakad`.`tingkat`
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
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_tingkat_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_tingkat_100` AFTER DELETE ON `jbsakad`.`tingkat`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'tingkat', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `tingkat`
--

INSERT INTO `tingkat` (`replid`, `tingkat`, `departemen`, `aktif`, `keterangan`, `urutan`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(26, '10', 'SMK Negeri 12 Malang', 1, 'kelas 10', 1, NULL, NULL, NULL, '2013-07-02 20:45:03', 6098, 0),
(27, '11', 'SMK Negeri 12 Malang', 1, 'kelas 11', 2, NULL, NULL, NULL, '2013-07-02 20:45:12', 28378, 0),
(28, '12', 'SMK Negeri 12 Malang', 1, 'kelas 12', 3, NULL, NULL, NULL, '2013-07-02 20:45:19', 58064, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ujian`
--

CREATE TABLE IF NOT EXISTS `ujian` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpelajaran` int(10) unsigned NOT NULL DEFAULT '0',
  `idkelas` int(10) unsigned NOT NULL DEFAULT '0',
  `idsemester` int(10) unsigned NOT NULL DEFAULT '0',
  `idjenis` int(10) unsigned NOT NULL DEFAULT '0',
  `deskripsi` varchar(100) NOT NULL,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `tglkirimSMS` date DEFAULT NULL,
  `idaturan` int(10) unsigned NOT NULL,
  `idrpp` int(10) unsigned DEFAULT NULL,
  `kode` varchar(20) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_ujian_idpelajaran` (`idpelajaran`),
  KEY `FK_ujian_idsemester` (`idsemester`),
  KEY `FK_ujian_idjenis` (`idjenis`),
  KEY `FK_ujian_idaturan` (`idaturan`),
  KEY `FK_ujian_rpp` (`idrpp`),
  KEY `FK_ujian_kelas` (`idkelas`),
  KEY `IX_ujian_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Triggers `ujian`
--
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trins_ujian_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trins_ujian_100` BEFORE INSERT ON `jbsakad`.`ujian`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trupd_ujian_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trupd_ujian_100` BEFORE UPDATE ON `jbsakad`.`ujian`
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
DROP TRIGGER IF EXISTS `jbsakad`.`fsync_trdel_ujian_100`;
DELIMITER //
CREATE TRIGGER `jbsakad`.`fsync_trdel_ujian_100` AFTER DELETE ON `jbsakad`.`ujian`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsakad', tablename = 'ujian', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `ujian`
--

INSERT INTO `ujian` (`replid`, `idpelajaran`, `idkelas`, `idsemester`, `idjenis`, `deskripsi`, `tanggal`, `tglkirimSMS`, `idaturan`, `idrpp`, `kode`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(1, 47, 48, 20, 109, 'reading paragraph', '2013-06-16', NULL, 223, 2, '', NULL, NULL, NULL, '2013-06-16 11:36:59', 23399, 0),
(2, 47, 48, 20, 110, 'reading paragraph', '2013-06-16', NULL, 224, 2, '', NULL, NULL, NULL, '2013-06-16 11:37:55', 18006, 0),
(3, 47, 48, 20, 111, 'UAS Structure', '2013-06-16', NULL, 225, NULL, '', NULL, NULL, NULL, '2013-06-16 11:38:52', 18668, 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aktivitaskalender`
--
ALTER TABLE `aktivitaskalender`
  ADD CONSTRAINT `FK_aktivitaskalender_kalenderakademik` FOREIGN KEY (`idkalender`) REFERENCES `kalenderakademik` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `alumni`
--
ALTER TABLE `alumni`
  ADD CONSTRAINT `FK_alumni_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_alumni_kelas` FOREIGN KEY (`klsakhir`) REFERENCES `kelas` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_alumni_siswa` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_alumni_tingkat` FOREIGN KEY (`tktakhir`) REFERENCES `tingkat` (`replid`) ON UPDATE CASCADE;

--
-- Constraints for table `angkatan`
--
ALTER TABLE `angkatan`
  ADD CONSTRAINT `FK_angkatan_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `aturangrading`
--
ALTER TABLE `aturangrading`
  ADD CONSTRAINT `FK_aturangrading_dasarpenilaian` FOREIGN KEY (`dasarpenilaian`) REFERENCES `dasarpenilaian` (`dasarpenilaian`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_aturangrading_pegawai` FOREIGN KEY (`nipguru`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_aturangrading_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_aturangrading_tingkat` FOREIGN KEY (`idtingkat`) REFERENCES `tingkat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `aturannhb`
--
ALTER TABLE `aturannhb`
  ADD CONSTRAINT `FK_aturannhb_dasarpenilaian` FOREIGN KEY (`dasarpenilaian`) REFERENCES `dasarpenilaian` (`dasarpenilaian`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_aturannhb_jenisujian` FOREIGN KEY (`idjenisujian`) REFERENCES `jenisujian` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_aturannhb_pegawai` FOREIGN KEY (`nipguru`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_aturannhb_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_aturannhb_tingkat` FOREIGN KEY (`idtingkat`) REFERENCES `tingkat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bobotnau`
--
ALTER TABLE `bobotnau`
  ADD CONSTRAINT `FK_bobotnau_infobobot` FOREIGN KEY (`idinfo`) REFERENCES `infobobotnau` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_bobotnau_ujian` FOREIGN KEY (`idujian`) REFERENCES `ujian` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `calonsiswa`
--
ALTER TABLE `calonsiswa`
  ADD CONSTRAINT `FK_calonsiswa_agama` FOREIGN KEY (`agama`) REFERENCES `jbsumum`.`agama` (`agama`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_calonsiswa_asalsekolah` FOREIGN KEY (`asalsekolah`) REFERENCES `asalsekolah` (`sekolah`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_calonsiswa_jenispekerjaan` FOREIGN KEY (`pekerjaanayah`) REFERENCES `jbsumum`.`jenispekerjaan` (`pekerjaan`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_calonsiswa_jenispekerjaanibu` FOREIGN KEY (`pekerjaanibu`) REFERENCES `jbsumum`.`jenispekerjaan` (`pekerjaan`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_calonsiswa_kelompokcalonsiswa` FOREIGN KEY (`idkelompok`) REFERENCES `kelompokcalonsiswa` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_calonsiswa_kondisisiswa` FOREIGN KEY (`kondisi`) REFERENCES `kondisisiswa` (`kondisi`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_calonsiswa_prosespenerimaansiswa` FOREIGN KEY (`idproses`) REFERENCES `prosespenerimaansiswa` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_calonsiswa_statussiswa` FOREIGN KEY (`status`) REFERENCES `statussiswa` (`status`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_calonsiswa_suku` FOREIGN KEY (`suku`) REFERENCES `jbsumum`.`suku` (`suku`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_calonsiswa_tingkatpendidikan` FOREIGN KEY (`pendidikanayah`) REFERENCES `jbsumum`.`tingkatpendidikan` (`pendidikan`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_calonsiswa_tingkatpendidikanibu` FOREIGN KEY (`pendidikanibu`) REFERENCES `jbsumum`.`tingkatpendidikan` (`pendidikan`) ON UPDATE CASCADE;

--
-- Constraints for table `departemen`
--
ALTER TABLE `departemen`
  ADD CONSTRAINT `FK_departemen_pegawai` FOREIGN KEY (`nipkepsek`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE;

--
-- Constraints for table `guru`
--
ALTER TABLE `guru`
  ADD CONSTRAINT `FK_guru_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_guru_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_guru_statusguru` FOREIGN KEY (`statusguru`) REFERENCES `statusguru` (`status`) ON UPDATE CASCADE;

--
-- Constraints for table `infobobotnau`
--
ALTER TABLE `infobobotnau`
  ADD CONSTRAINT `FK_infobobotnau_ujian` FOREIGN KEY (`idujian`) REFERENCES `ujian` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `infobobotujian`
--
ALTER TABLE `infobobotujian`
  ADD CONSTRAINT `FK_infobobotujian_idjenis` FOREIGN KEY (`idjenisujian`) REFERENCES `jenisujian` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_infobobotujian_idpelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_infobobotujian_idsemester` FOREIGN KEY (`idsemester`) REFERENCES `semester` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_infobobotujian_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `infojadwal`
--
ALTER TABLE `infojadwal`
  ADD CONSTRAINT `FK_infojadwal_tahunajaran` FOREIGN KEY (`idtahunajaran`) REFERENCES `tahunajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `infonap`
--
ALTER TABLE `infonap`
  ADD CONSTRAINT `FK_infonap_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_infonap_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_infonap_semester` FOREIGN KEY (`idsemester`) REFERENCES `semester` (`replid`) ON UPDATE CASCADE;

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `FK_jadwal_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_jadwal_infojadwal` FOREIGN KEY (`infojadwal`) REFERENCES `infojadwal` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_jadwal_jam` FOREIGN KEY (`idjam1`) REFERENCES `jam` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_jadwal_jam2` FOREIGN KEY (`idjam2`) REFERENCES `jam` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_jadwal_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_jadwal_pegawai` FOREIGN KEY (`nipguru`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_jadwal_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON UPDATE CASCADE;

--
-- Constraints for table `jam`
--
ALTER TABLE `jam`
  ADD CONSTRAINT `FK_jam_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jenisujian`
--
ALTER TABLE `jenisujian`
  ADD CONSTRAINT `FK_jenisujian_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kalenderakademik`
--
ALTER TABLE `kalenderakademik`
  ADD CONSTRAINT `FK_kalenderakademik_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_kalenderakademik_tahunajaran` FOREIGN KEY (`idtahunajaran`) REFERENCES `tahunajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `FK_kelas_pegawai` FOREIGN KEY (`nipwali`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_kelas_tahunajaran` FOREIGN KEY (`idtahunajaran`) REFERENCES `tahunajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_kelas_tingkat` FOREIGN KEY (`idtingkat`) REFERENCES `tingkat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kelompokcalonsiswa`
--
ALTER TABLE `kelompokcalonsiswa`
  ADD CONSTRAINT `FK_kelompokcalonsiswa_prosespenerimaansiswa` FOREIGN KEY (`idproses`) REFERENCES `prosespenerimaansiswa` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `komennap`
--
ALTER TABLE `komennap`
  ADD CONSTRAINT `FK_komennap_infonap` FOREIGN KEY (`idinfo`) REFERENCES `infonap` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_komennap_siswa` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON UPDATE CASCADE;

--
-- Constraints for table `mutasisiswa`
--
ALTER TABLE `mutasisiswa`
  ADD CONSTRAINT `FK_mutasisiswa_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_mutasisiswa_jenismutasi` FOREIGN KEY (`jenismutasi`) REFERENCES `jenismutasi` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_mutasisiswa_siswa` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nap`
--
ALTER TABLE `nap`
  ADD CONSTRAINT `FK_nap_aturannhb` FOREIGN KEY (`idaturan`) REFERENCES `aturannhb` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_nap_infonap` FOREIGN KEY (`idinfo`) REFERENCES `infonap` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_nap_siswa` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON UPDATE CASCADE;

--
-- Constraints for table `nau`
--
ALTER TABLE `nau`
  ADD CONSTRAINT `FK_nau_idaturan` FOREIGN KEY (`idaturan`) REFERENCES `aturannhb` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_nau_idjenis` FOREIGN KEY (`idjenis`) REFERENCES `jenisujian` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_nau_idpelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_nau_idsemester` FOREIGN KEY (`idsemester`) REFERENCES `semester` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_nau_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_nau_nis` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON UPDATE CASCADE;

--
-- Constraints for table `nilaiujian`
--
ALTER TABLE `nilaiujian`
  ADD CONSTRAINT `FK_nilaiujian_idujian` FOREIGN KEY (`idujian`) REFERENCES `ujian` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_nilaiujian_nis` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON UPDATE CASCADE;

--
-- Constraints for table `pelajaran`
--
ALTER TABLE `pelajaran`
  ADD CONSTRAINT `FK_pelajaran_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `phsiswa`
--
ALTER TABLE `phsiswa`
  ADD CONSTRAINT `FK_phsiswa_presensiharian` FOREIGN KEY (`idpresensi`) REFERENCES `presensiharian` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_phsiswa_siswa` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON UPDATE CASCADE;

--
-- Constraints for table `ppsiswa`
--
ALTER TABLE `ppsiswa`
  ADD CONSTRAINT `FK_ppsiswa_presensipelajaran` FOREIGN KEY (`idpp`) REFERENCES `presensipelajaran` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ppsiswa_siswa` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON UPDATE CASCADE;

--
-- Constraints for table `ppsiswahadir`
--
ALTER TABLE `ppsiswahadir`
  ADD CONSTRAINT `FK_ppsiswahadir_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ppsiswahadir_pegawai` FOREIGN KEY (`gurupelajaran`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ppsiswahadir_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ppsiswahadir_semester` FOREIGN KEY (`idsemester`) REFERENCES `semester` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ppsiswahadir_siswa` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `presensiharian`
--
ALTER TABLE `presensiharian`
  ADD CONSTRAINT `FK_presensiharian_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_presensiharian_semester` FOREIGN KEY (`idsemester`) REFERENCES `semester` (`replid`) ON UPDATE CASCADE;

--
-- Constraints for table `presensipelajaran`
--
ALTER TABLE `presensipelajaran`
  ADD CONSTRAINT `FK_presensipelajaran_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_presensipelajaran_pegawai` FOREIGN KEY (`gurupelajaran`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_presensipelajaran_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_presensipelajaran_semester` FOREIGN KEY (`idsemester`) REFERENCES `semester` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_presensipelajaran_statusguru` FOREIGN KEY (`jenisguru`) REFERENCES `statusguru` (`replid`) ON UPDATE CASCADE;

--
-- Constraints for table `prosespenerimaansiswa`
--
ALTER TABLE `prosespenerimaansiswa`
  ADD CONSTRAINT `FK_prosespenerimaansiswa_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ratauk`
--
ALTER TABLE `ratauk`
  ADD CONSTRAINT `FK_ratauk_idsemester` FOREIGN KEY (`idsemester`) REFERENCES `semester` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ratauk_idujian` FOREIGN KEY (`idujian`) REFERENCES `ujian` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ratauk_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON UPDATE CASCADE;

--
-- Constraints for table `rataus`
--
ALTER TABLE `rataus`
  ADD CONSTRAINT `FK_rataus_idpelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_rataus_idsemester` FOREIGN KEY (`idsemester`) REFERENCES `semester` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_rataus_jenis` FOREIGN KEY (`idjenis`) REFERENCES `jenisujian` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_rataus_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_rataus_nis` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON UPDATE CASCADE;

--
-- Constraints for table `riwayatdeptsiswa`
--
ALTER TABLE `riwayatdeptsiswa`
  ADD CONSTRAINT `FK_riwayatdeptsiswa_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_riwayatdeptsiswa_siswa` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `riwayatkelassiswa`
--
ALTER TABLE `riwayatkelassiswa`
  ADD CONSTRAINT `FK_riwayatkelassiswa_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_riwayatkelassiswa_siswa` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rpp`
--
ALTER TABLE `rpp`
  ADD CONSTRAINT `FK_rpp_pelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_rpp_semester` FOREIGN KEY (`idsemester`) REFERENCES `semester` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_rpp_tingkat` FOREIGN KEY (`idtingkat`) REFERENCES `tingkat` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `semester`
--
ALTER TABLE `semester`
  ADD CONSTRAINT `FK_semester_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `FK_siswa_agama` FOREIGN KEY (`agama`) REFERENCES `jbsumum`.`agama` (`agama`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_siswa_angkatan` FOREIGN KEY (`idangkatan`) REFERENCES `angkatan` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_siswa_asalsekolah` FOREIGN KEY (`asalsekolah`) REFERENCES `asalsekolah` (`sekolah`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_siswa_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_siswa_kondisi` FOREIGN KEY (`kondisi`) REFERENCES `kondisisiswa` (`kondisi`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_siswa_pekerjaanayah` FOREIGN KEY (`pekerjaanayah`) REFERENCES `jbsumum`.`jenispekerjaan` (`pekerjaan`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_siswa_pekerjaanibu` FOREIGN KEY (`pekerjaanibu`) REFERENCES `jbsumum`.`jenispekerjaan` (`pekerjaan`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_siswa_pendidikanayah` FOREIGN KEY (`pendidikanayah`) REFERENCES `jbsumum`.`tingkatpendidikan` (`pendidikan`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_siswa_pendidikanibu` FOREIGN KEY (`pendidikanibu`) REFERENCES `jbsumum`.`tingkatpendidikan` (`pendidikan`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_siswa_status` FOREIGN KEY (`status`) REFERENCES `statussiswa` (`status`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_siswa_statusmutasi` FOREIGN KEY (`statusmutasi`) REFERENCES `jenismutasi` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_siswa_suku` FOREIGN KEY (`suku`) REFERENCES `jbsumum`.`suku` (`suku`) ON UPDATE CASCADE;

--
-- Constraints for table `tahunajaran`
--
ALTER TABLE `tahunajaran`
  ADD CONSTRAINT `FK_tahunajaran_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tingkat`
--
ALTER TABLE `tingkat`
  ADD CONSTRAINT `FK_tingkat_departemen` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`departemen`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ujian`
--
ALTER TABLE `ujian`
  ADD CONSTRAINT `FK_ujian_idaturan` FOREIGN KEY (`idaturan`) REFERENCES `aturannhb` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ujian_idjenis` FOREIGN KEY (`idjenis`) REFERENCES `jenisujian` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ujian_idpelajaran` FOREIGN KEY (`idpelajaran`) REFERENCES `pelajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ujian_idsemester` FOREIGN KEY (`idsemester`) REFERENCES `semester` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ujian_kelas` FOREIGN KEY (`idkelas`) REFERENCES `kelas` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ujian_rpp` FOREIGN KEY (`idrpp`) REFERENCES `rpp` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;
