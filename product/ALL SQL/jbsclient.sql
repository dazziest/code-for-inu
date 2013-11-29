-- phpMyAdmin SQL Dump
-- version 3.1.3.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 05, 2013 at 12:54 AM
-- Server version: 5.1.33
-- PHP Version: 5.2.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jbsclient`
--

-- --------------------------------------------------------

--
-- Table structure for table `deleteddata`
--

CREATE TABLE IF NOT EXISTS `deleteddata` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dbname` varchar(50) NOT NULL,
  `tablename` varchar(50) NOT NULL,
  `dataid` varchar(50) NOT NULL,
  `datatoken` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_DELETEDDATA_SYNC` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=107 ;

--
-- Dumping data for table `deleteddata`
--

INSERT INTO `deleteddata` (`replid`, `ts`, `token`, `issync`, `dbname`, `tablename`, `dataid`, `datatoken`) VALUES
(1, '2010-03-25 13:48:18', 5658, 0, 'jbsakad', 'aktivitaskalender', '22', 34108),
(2, '2010-03-25 13:48:18', 7810, 0, 'jbsakad', 'aktivitaskalender', '23', 28647),
(3, '2010-03-25 13:48:18', 22076, 0, 'jbsakad', 'aktivitaskalender', '24', 40910),
(4, '2010-03-25 13:48:18', 21419, 0, 'jbsakad', 'aktivitaskalender', '25', 53077),
(5, '2010-03-25 13:49:15', 38621, 0, 'jbsakad', 'kalenderakademik', '7', 25060),
(6, '2010-04-16 08:55:26', 58779, 0, 'jbsakad', 'jenisujian', '111', 17544),
(7, '2010-04-16 08:55:28', 31150, 0, 'jbsakad', 'jenisujian', '107', 23010),
(8, '2010-04-16 08:55:33', 60068, 0, 'jbsakad', 'jenisujian', '112', 57288),
(9, '2010-04-16 08:55:36', 6649, 0, 'jbsakad', 'jenisujian', '110', 31986),
(10, '2010-04-16 08:55:40', 11824, 0, 'jbsakad', 'jenisujian', '109', 25619),
(11, '2010-04-16 08:55:43', 43871, 0, 'jbsakad', 'jenisujian', '114', 14239),
(12, '2010-04-16 08:55:45', 57947, 0, 'jbsakad', 'jenisujian', '113', 37221),
(15, '2010-04-16 08:58:56', 6755, 0, 'jbsakad', 'riwayatkelassiswa', '197', 55546),
(16, '2010-04-16 08:58:56', 44160, 0, 'jbsakad', 'riwayatkelassiswa', '198', 46602),
(17, '2010-04-16 08:58:56', 3943, 0, 'jbsakad', 'riwayatkelassiswa', '199', 52620),
(18, '2010-04-16 08:58:56', 18297, 0, 'jbsakad', 'riwayatkelassiswa', '200', 38274),
(19, '2010-04-16 08:58:56', 14123, 0, 'jbsakad', 'riwayatkelassiswa', '201', 23956),
(20, '2010-04-16 08:59:04', 15726, 0, 'jbsakad', 'riwayatdeptsiswa', '101', 17142),
(21, '2010-04-16 08:59:04', 36259, 0, 'jbsakad', 'riwayatdeptsiswa', '102', 15833),
(22, '2010-04-16 08:59:04', 3057, 0, 'jbsakad', 'riwayatdeptsiswa', '103', 56165),
(23, '2010-04-16 08:59:04', 37569, 0, 'jbsakad', 'riwayatdeptsiswa', '104', 22380),
(24, '2010-04-16 08:59:04', 47613, 0, 'jbsakad', 'riwayatdeptsiswa', '105', 42401),
(25, '2010-04-16 08:59:59', 59827, 0, 'jbsakad', 'rataus', '2', 59421),
(26, '2010-04-16 08:59:59', 25234, 0, 'jbsakad', 'rataus', '3', 37687),
(27, '2010-04-16 08:59:59', 12220, 0, 'jbsakad', 'rataus', '4', 10172),
(28, '2010-04-16 08:59:59', 50929, 0, 'jbsakad', 'rataus', '5', 3326),
(29, '2010-04-16 08:59:59', 21391, 0, 'jbsakad', 'rataus', '6', 51646),
(30, '2010-04-16 09:01:53', 19700, 0, 'jbsfina', 'penerimaanjtt', '2', 50609),
(31, '2010-04-16 09:01:53', 34326, 0, 'jbsfina', 'penerimaanjtt', '3', 9657),
(32, '2010-04-16 09:01:53', 46998, 0, 'jbsfina', 'penerimaanjtt', '4', 29725),
(33, '2010-04-16 09:01:53', 954, 0, 'jbsfina', 'penerimaanjtt', '5', 37226),
(34, '2010-04-16 09:01:53', 60365, 0, 'jbsfina', 'penerimaanjtt', '6', 19728),
(35, '2010-04-16 09:02:11', 36844, 0, 'jbsfina', 'besarjtt', '2', 4176),
(36, '2010-04-16 09:02:11', 3123, 0, 'jbsfina', 'besarjtt', '3', 60304),
(37, '2010-04-16 09:02:11', 36142, 0, 'jbsfina', 'besarjtt', '4', 38692),
(38, '2010-04-16 09:02:11', 40280, 0, 'jbsfina', 'besarjtt', '5', 38347),
(39, '2010-04-16 09:02:11', 27443, 0, 'jbsfina', 'besarjtt', '6', 61566),
(40, '2010-04-16 09:03:03', 16377, 0, 'jbsfina', 'penerimaaniuran', '2', 24628),
(41, '2010-04-16 09:03:03', 65086, 0, 'jbsfina', 'penerimaaniuran', '3', 62596),
(42, '2010-04-16 09:03:03', 14176, 0, 'jbsfina', 'penerimaaniuran', '4', 14835),
(43, '2010-04-16 09:03:03', 6682, 0, 'jbsfina', 'penerimaaniuran', '5', 37850),
(44, '2010-04-16 09:03:03', 56413, 0, 'jbsfina', 'penerimaaniuran', '6', 7311),
(45, '2010-04-16 09:03:29', 65427, 0, 'jbsakad', 'siswa', '86', 32697),
(46, '2010-04-16 09:03:29', 26835, 0, 'jbsakad', 'siswa', '89', 40840),
(47, '2010-04-16 09:03:29', 3423, 0, 'jbsakad', 'siswa', '85', 53741),
(48, '2010-04-16 09:03:29', 2141, 0, 'jbsakad', 'siswa', '87', 54224),
(49, '2010-04-16 09:09:07', 437, 0, 'jbsfina', 'penerimaaniuran', '1', 61178),
(50, '2010-04-16 09:09:41', 61290, 0, 'jbsakad', 'siswa', '88', 24542),
(51, '2010-04-16 09:14:23', 43017, 0, 'jbsfina', 'penerimaanjtt', '1', 8559),
(52, '2010-04-16 09:14:33', 31216, 0, 'jbsfina', 'penerimaanjttcalon', '1', 43166),
(53, '2010-04-16 09:14:33', 27028, 0, 'jbsfina', 'penerimaanjttcalon', '2', 59527),
(54, '2010-08-03 18:18:36', 60813, 0, 'jbsfina', 'penerimaanjttcalon', '3', 47442),
(55, '2010-08-03 18:18:36', 36610, 0, 'jbsfina', 'penerimaanjtt', '7', 54970),
(56, '2010-08-03 18:18:36', 612, 0, 'jbsfina', 'besarjttcalon', '1', 11175),
(57, '2010-08-03 18:18:36', 24291, 0, 'jbsfina', 'besarjtt', '1', 8773),
(58, '2010-08-03 18:18:37', 54085, 0, 'jbsakad', 'jadwal', '114', 46696),
(59, '2010-08-03 18:18:37', 964, 0, 'jbsakad', 'jadwal', '115', 25279),
(60, '2010-08-03 18:18:37', 39152, 0, 'jbsakad', 'jadwal', '117', 51836),
(61, '2010-08-03 18:18:37', 61808, 0, 'jbsakad', 'infojadwal', '16', 3870),
(62, '2010-08-03 18:18:37', 60526, 0, 'jbsakad', 'kalenderakademik', '8', 36608),
(63, '2010-08-03 18:18:37', 51674, 0, 'jbsakad', 'calonsiswa', '48', 32492),
(64, '2010-08-03 18:18:37', 11262, 0, 'jbsakad', 'kelompokcalonsiswa', '26', 10096),
(65, '2010-08-03 18:18:37', 32348, 0, 'jbsakad', 'kelompokcalonsiswa', '27', 64842),
(66, '2010-08-03 18:18:37', 62423, 0, 'jbsakad', 'kelompokcalonsiswa', '28', 31801),
(67, '2010-08-03 18:18:37', 18479, 0, 'jbsakad', 'nau', '1', 10476),
(68, '2010-08-03 18:18:37', 36187, 0, 'jbsakad', 'nilaiujian', '1', 45317),
(69, '2010-08-03 18:18:37', 59969, 0, 'jbsakad', 'phsiswa', '1', 16120),
(70, '2010-08-03 18:18:37', 60222, 0, 'jbsakad', 'presensiharian', '1', 32373),
(71, '2010-08-03 18:18:37', 55672, 0, 'jbsakad', 'prosespenerimaansiswa', '11', 31124),
(72, '2010-08-03 18:18:37', 32164, 0, 'jbsakad', 'ratauk', '1', 61559),
(73, '2010-08-03 18:18:37', 59333, 0, 'jbsakad', 'rataus', '1', 46522),
(74, '2010-08-03 18:18:37', 3581, 0, 'jbsakad', 'riwayatdeptsiswa', '100', 64803),
(75, '2010-08-03 18:18:37', 36498, 0, 'jbsakad', 'riwayatkelassiswa', '196', 34052),
(76, '2010-08-03 18:18:37', 40685, 0, 'jbsakad', 'ujian', '1', 11590),
(77, '2010-08-03 18:18:37', 28402, 0, 'jbsakad', 'rpp', '63', 41381),
(78, '2010-08-03 18:18:37', 19952, 0, 'jbsakad', 'rpp', '64', 39218),
(79, '2010-08-03 18:18:37', 14553, 0, 'jbsakad', 'siswa', '84', 45497),
(80, '2010-08-03 18:18:37', 12911, 0, 'jbsperpus', 'pinjam', '1', 11272),
(81, '2010-08-03 18:18:37', 20893, 0, 'jbsperpus', 'daftarpustaka', '3', 59217),
(82, '2010-08-03 18:18:37', 203, 0, 'jbsperpus', 'daftarpustaka', '4', 62618),
(83, '2010-08-03 18:18:37', 3867, 0, 'jbsperpus', 'pustaka', '1', 46139),
(84, '2010-08-03 18:18:37', 18724, 0, 'jbsperpus', 'penulis', '1', 17595),
(85, '2010-08-03 18:18:37', 16488, 0, 'jbsperpus', 'penerbit', '1', 18955),
(86, '2013-05-27 22:46:17', 22863, 0, 'jbsakad', 'guru', '46', 21497),
(87, '2013-05-27 23:32:46', 57355, 0, 'jbsumum', 'identitas', '5', 55385),
(88, '2013-06-16 11:12:59', 58922, 0, 'jbsakad', 'phsiswa', '1', 24754),
(89, '2013-06-16 11:12:59', 2287, 0, 'jbsakad', 'phsiswa', '2', 58868),
(90, '2013-06-16 11:12:59', 31257, 0, 'jbsakad', 'phsiswa', '3', 23490),
(91, '2013-06-16 11:12:59', 18363, 0, 'jbsakad', 'presensiharian', '1', 65320),
(92, '2013-06-16 11:23:26', 47407, 0, 'jbsakad', 'phsiswa', '4', 664),
(93, '2013-06-16 11:23:26', 3243, 0, 'jbsakad', 'phsiswa', '5', 9185),
(94, '2013-06-16 11:23:26', 5056, 0, 'jbsakad', 'phsiswa', '6', 43933),
(95, '2013-06-16 11:23:26', 15549, 0, 'jbsakad', 'presensiharian', '2', 63575),
(96, '2013-06-17 20:58:02', 43047, 0, 'jbsakad', 'departemen', '12', 22390),
(97, '2013-06-17 21:07:02', 12311, 0, 'jbsakad', 'departemen', '13', 14850),
(98, '2013-07-03 12:06:02', 56346, 0, 'jbsakad', 'nap', '1', 6046),
(99, '2013-07-03 12:06:02', 14333, 0, 'jbsakad', 'nap', '2', 52408),
(100, '2013-07-03 12:06:02', 33687, 0, 'jbsakad', 'nap', '3', 23920),
(101, '2013-07-03 12:06:05', 26575, 0, 'jbsakad', 'nap', '4', 59905),
(102, '2013-07-03 12:06:05', 32683, 0, 'jbsakad', 'nap', '5', 1873),
(103, '2013-07-03 12:06:05', 18159, 0, 'jbsakad', 'nap', '6', 26242),
(104, '2013-07-03 12:06:05', 58276, 0, 'jbsakad', 'nap', '7', 60059),
(105, '2013-07-03 12:06:05', 40313, 0, 'jbsakad', 'nap', '8', 24976),
(106, '2013-07-03 12:06:05', 26736, 0, 'jbsakad', 'nap', '9', 10236);

-- --------------------------------------------------------

--
-- Table structure for table `exporthistory`
--

CREATE TABLE IF NOT EXISTS `exporthistory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transferid` varchar(15) NOT NULL,
  `synctype` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `synctime` datetime NOT NULL,
  `syncfile` varchar(255) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `exporthistory`
--


-- --------------------------------------------------------

--
-- Table structure for table `liveupdate`
--

CREATE TABLE IF NOT EXISTS `liveupdate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `liveupdateid` int(10) unsigned NOT NULL,
  `info` varchar(255) NOT NULL,
  `tipe` varchar(3) NOT NULL,
  `versi` varchar(5) NOT NULL,
  `tanggal` date NOT NULL,
  `repl_targetfile` varchar(255) DEFAULT NULL,
  `repl_varname` varchar(255) DEFAULT NULL,
  `repl_searchstr` varchar(255) DEFAULT NULL,
  `repl_replacestr` varchar(255) DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 Disable, 1 Enable',
  PRIMARY KEY (`liveupdateid`),
  UNIQUE KEY `UX_liveupdate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `liveupdate`
--


-- --------------------------------------------------------

--
-- Table structure for table `liveupdateconfig`
--

CREATE TABLE IF NOT EXISTS `liveupdateconfig` (
  `tipe` varchar(20) NOT NULL,
  `nilai` varchar(45) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tipe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `liveupdateconfig`
--

INSERT INTO `liveupdateconfig` (`tipe`, `nilai`, `keterangan`) VALUES
('MIN_UPDATE_ID', '29', 'Please Don''t Change This Value');

-- --------------------------------------------------------

--
-- Table structure for table `liveupdatefile`
--

CREATE TABLE IF NOT EXISTS `liveupdatefile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `liveupdateid` int(10) unsigned NOT NULL,
  `berkas` varchar(255) NOT NULL,
  `targetdir` varchar(255) DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0 Disable 1 Enable',
  `tipe` varchar(4) NOT NULL DEFAULT 'DOWN' COMMENT 'DOWN | EXEC',
  PRIMARY KEY (`liveupdateid`),
  UNIQUE KEY `UX_liveupdatefile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `liveupdatefile`
--


-- --------------------------------------------------------

--
-- Table structure for table `pkchanges`
--

CREATE TABLE IF NOT EXISTS `pkchanges` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dbname` varchar(50) CHARACTER SET latin1 NOT NULL,
  `tablename` varchar(50) CHARACTER SET latin1 NOT NULL,
  `dataid` int(10) unsigned NOT NULL,
  `datatoken` smallint(5) unsigned NOT NULL,
  `newpk` varchar(100) CHARACTER SET latin1 NOT NULL,
  `oldpk` varchar(100) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_PKCHANGES_SYNC` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=11 ;

--
-- Dumping data for table `pkchanges`
--

INSERT INTO `pkchanges` (`replid`, `ts`, `token`, `issync`, `dbname`, `tablename`, `dataid`, `datatoken`, `newpk`, `oldpk`) VALUES
(1, '2010-03-19 09:24:56', 54079, 0, 'jbsakad', 'siswa', 85, 53741, '120', '111'),
(2, '2010-03-19 09:25:37', 51125, 0, 'jbsakad', 'siswa', 85, 53741, '1212', '120'),
(3, '2010-03-19 09:29:47', 52117, 0, 'jbsakad', 'siswa', 85, 53741, '144', '1212'),
(4, '2013-05-27 20:12:57', 24716, 0, 'jbssdm', 'pegawai', 23, 4536, '102', '101'),
(5, '2013-05-27 20:13:28', 32534, 0, 'jbssdm', 'pegawai', 23, 4536, '1024', '102'),
(6, '2013-05-27 22:24:28', 44220, 0, 'jbsakad', 'departemen', 11, 34486, 'SMK12', 'SMA'),
(7, '2013-05-28 13:38:41', 22217, 0, 'jbsakad', 'departemen', 11, 34486, 'SMK Negeri 12 Malang', 'SMK12'),
(8, '2013-05-28 13:38:57', 23, 0, 'jbsakad', 'departemen', 12, 22390, 'SMK12', 'SMKN 12 Malang'),
(9, '2013-06-18 13:41:35', 61572, 0, 'jbssdm', 'pegawai', 29, 38185, 'klepon', '007'),
(10, '2013-07-02 21:39:24', 29947, 0, 'jbsakad', 'statusguru', 6, 32293, 'Guru Tetap', 'Guru Pelajaran');

-- --------------------------------------------------------

--
-- Table structure for table `vcontrol`
--

CREATE TABLE IF NOT EXISTS `vcontrol` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `c` varchar(5) NOT NULL,
  `v` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `vcontrol`
--


-- --------------------------------------------------------

--
-- Table structure for table `version`
--

CREATE TABLE IF NOT EXISTS `version` (
  `version` varchar(10) NOT NULL,
  `builddate` datetime NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `version`
--

INSERT INTO `version` (`version`, `builddate`) VALUES
('2.0.0', '2010-03-21 00:00:00');
