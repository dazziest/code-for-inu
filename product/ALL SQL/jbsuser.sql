-- phpMyAdmin SQL Dump
-- version 3.1.3.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 05, 2013 at 12:57 AM
-- Server version: 5.1.33
-- PHP Version: 5.2.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jbsuser`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminsiswa`
--

CREATE TABLE IF NOT EXISTS `adminsiswa` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `isnew` varchar(45) NOT NULL DEFAULT '1',
  `haschange` varchar(45) NOT NULL DEFAULT '0',
  `password` varchar(100) NOT NULL DEFAULT '',
  `lastlogin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `info1` varchar(50) DEFAULT NULL,
  `info2` varchar(50) DEFAULT NULL,
  `info3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `adminsiswa`
--


-- --------------------------------------------------------

--
-- Table structure for table `hakakses`
--

CREATE TABLE IF NOT EXISTS `hakakses` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(20) NOT NULL,
  `modul` varchar(100) NOT NULL,
  `tingkat` tinyint(1) unsigned NOT NULL,
  `departemen` varchar(50) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `theme` tinyint(2) unsigned DEFAULT '1',
  `lastlogin` datetime DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(50) DEFAULT NULL,
  `info2` varchar(50) DEFAULT NULL,
  `info3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `hakakses`
--

INSERT INTO `hakakses` (`clientid`, `region`, `location`, `replid`, `login`, `modul`, `tingkat`, `departemen`, `keterangan`, `theme`, `lastlogin`, `aktif`, `info1`, `info2`, `info3`) VALUES
(NULL, NULL, NULL, 20, '101', 'SIMAKA', 1, NULL, '', 1, '2010-03-05 14:00:05', 1, NULL, NULL, NULL),
(NULL, NULL, NULL, 21, '101', 'KEUANGAN', 1, NULL, '', 1, '2010-03-05 14:00:29', 1, NULL, NULL, NULL),
(NULL, NULL, NULL, 22, '101', 'SIMTAKA', 1, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL),
(NULL, NULL, NULL, 23, '101', 'INFOGURU', 1, NULL, NULL, 1, '2010-04-16 10:01:22', 1, NULL, NULL, NULL),
(NULL, NULL, NULL, 24, '190', 'SIMAKA', 2, 'SMK Negeri 12 Malang', '', 1, '2013-06-15 12:01:20', 1, NULL, NULL, NULL),
(NULL, NULL, NULL, 25, '12312312', 'SIMAKA', 2, 'SMK Negeri 12 Malang', '', 1, NULL, 1, NULL, NULL, NULL),
(NULL, NULL, NULL, 26, '109', 'SIMAKA', 2, 'SMK Negeri 12 Malang', '', 1, '2013-06-19 22:01:23', 1, NULL, NULL, NULL),
(NULL, NULL, NULL, 27, '12345678', 'SIMAKA', 2, 'SMK Negeri 12 Malang', '', 1, NULL, 1, NULL, NULL, NULL),
(NULL, NULL, NULL, 28, '112233', 'SIMAKA', 2, 'SMK Negeri 12 Malang', '', 1, NULL, 1, NULL, NULL, NULL),
(NULL, NULL, NULL, 29, '007', 'SIMAKA', 1, NULL, '', 1, NULL, 1, NULL, NULL, NULL),
(NULL, NULL, NULL, 30, 'klepon', 'SIMAKA', 1, NULL, '', 1, NULL, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hakaksesinfosiswa`
--

CREATE TABLE IF NOT EXISTS `hakaksesinfosiswa` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `theme` tinyint(2) unsigned DEFAULT '1',
  `lastlogin` datetime DEFAULT NULL,
  `info1` varchar(50) DEFAULT NULL,
  `info2` varchar(50) DEFAULT NULL,
  `info3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_hakaksesinfosiswa_nis` (`nis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `hakaksesinfosiswa`
--


-- --------------------------------------------------------

--
-- Table structure for table `hakakseskeuangan`
--

CREATE TABLE IF NOT EXISTS `hakakseskeuangan` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(20) NOT NULL,
  `modul` varchar(100) NOT NULL,
  `tingkat` tinyint(1) unsigned NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `info1` varchar(50) DEFAULT NULL,
  `info2` varchar(50) DEFAULT NULL,
  `info3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `hakakseskeuangan`
--


-- --------------------------------------------------------

--
-- Table structure for table `hakaksessimaka`
--

CREATE TABLE IF NOT EXISTS `hakaksessimaka` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(20) NOT NULL,
  `modul` varchar(100) NOT NULL,
  `tingkat` tinyint(1) unsigned NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `info1` varchar(50) DEFAULT NULL,
  `info2` varchar(50) DEFAULT NULL,
  `info3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_hakakses_nip` (`login`),
  KEY `FK_hakakses_modul` (`modul`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `hakaksessimaka`
--


-- --------------------------------------------------------

--
-- Table structure for table `landlord`
--

CREATE TABLE IF NOT EXISTS `landlord` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `isnew` varchar(45) NOT NULL DEFAULT '1',
  `haschange` varchar(45) NOT NULL DEFAULT '0',
  `password` varchar(100) NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `info1` varchar(50) DEFAULT NULL,
  `info2` varchar(50) DEFAULT NULL,
  `info3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `landlord`
--

INSERT INTO `landlord` (`clientid`, `region`, `location`, `replid`, `isnew`, `haschange`, `password`, `lastlogin`, `info1`, `info2`, `info3`) VALUES
('GMS2', 'BD', 'AT', 1, '1', '0', '5f4dcc3b5aa765d61d8327deb882cf99', '2013-07-03 21:01:26', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(50) DEFAULT NULL,
  `info2` varchar(50) DEFAULT NULL,
  `info3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_login_nip` (`login`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`clientid`, `region`, `location`, `replid`, `login`, `password`, `keterangan`, `aktif`, `info1`, `info2`, `info3`) VALUES
(NULL, NULL, NULL, 7, '1024', '5f4dcc3b5aa765d61d8327deb882cf99', '', 1, NULL, NULL, NULL),
(NULL, NULL, NULL, 8, '190', '03f7f7198958ffbda01db956d15f134a', NULL, 1, NULL, NULL, NULL),
(NULL, NULL, NULL, 9, '12312312', '2eeecd72c567401e6988624b179d0b14', NULL, 1, NULL, NULL, NULL),
(NULL, NULL, NULL, 10, '109', '4eabe26187a9efcc64595554291bdb1b', NULL, 1, NULL, NULL, NULL),
(NULL, NULL, NULL, 11, '12345678', '25d55ad283aa400af464c76d713c07ad', NULL, 1, NULL, NULL, NULL),
(NULL, NULL, NULL, 12, '112233', 'd0970714757783e6cf17b26fb8e2298f', NULL, 1, NULL, NULL, NULL),
(NULL, NULL, NULL, 13, 'klepon', '0b1e50e1fd71c96bac94144cc59cff40', NULL, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `loginsiswa`
--

CREATE TABLE IF NOT EXISTS `loginsiswa` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(20) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `theme` tinyint(2) NOT NULL DEFAULT '1',
  `info1` varchar(50) DEFAULT NULL,
  `info2` varchar(50) DEFAULT NULL,
  `info3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`replid`),
  KEY `FK_loginsiswa_nis` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `loginsiswa`
--


-- --------------------------------------------------------

--
-- Table structure for table `lokasi`
--

CREATE TABLE IF NOT EXISTS `lokasi` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `isnew` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `haschange` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lokasi` varchar(45) NOT NULL DEFAULT '',
  `singkatan` varchar(3) NOT NULL DEFAULT '',
  `info1` varchar(50) DEFAULT NULL,
  `info2` varchar(50) DEFAULT NULL,
  `info3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `lokasi`
--


-- --------------------------------------------------------

--
-- Table structure for table `modul`
--

CREATE TABLE IF NOT EXISTS `modul` (
  `clientid` varchar(5) DEFAULT NULL,
  `region` varchar(5) DEFAULT NULL,
  `location` varchar(5) DEFAULT NULL,
  `isnew` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `haschange` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `modul` varchar(100) NOT NULL,
  `info1` varchar(50) DEFAULT NULL,
  `info2` varchar(50) DEFAULT NULL,
  `info3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`modul`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modul`
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `hakaksesinfosiswa`
--
ALTER TABLE `hakaksesinfosiswa`
  ADD CONSTRAINT `FK_hakaksesinfosiswa_nis` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hakaksessimaka`
--
ALTER TABLE `hakaksessimaka`
  ADD CONSTRAINT `FK_hakakses_modul` FOREIGN KEY (`modul`) REFERENCES `modul` (`modul`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_hakakses_nip` FOREIGN KEY (`login`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `FK_login_nip` FOREIGN KEY (`login`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `loginsiswa`
--
ALTER TABLE `loginsiswa`
  ADD CONSTRAINT `FK_loginsiswa_nis` FOREIGN KEY (`login`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE;
