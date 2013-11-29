-- phpMyAdmin SQL Dump
-- version 3.1.3.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 05, 2013 at 12:34 AM
-- Server version: 5.1.33
-- PHP Version: 5.2.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jbscad`
--

-- --------------------------------------------------------

--
-- Table structure for table `cad01`
--

CREATE TABLE IF NOT EXISTS `cad01` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num1` int(10) unsigned DEFAULT NULL,
  `num2` int(10) unsigned DEFAULT NULL,
  `num3` int(10) unsigned DEFAULT NULL,
  `float1` float DEFAULT NULL,
  `float2` float DEFAULT NULL,
  `float3` float DEFAULT NULL,
  `flag1` tinyint(3) unsigned DEFAULT NULL,
  `flag2` tinyint(3) unsigned DEFAULT NULL,
  `flag3` tinyint(3) unsigned DEFAULT NULL,
  `string1` varchar(1000) DEFAULT NULL,
  `string2` varchar(1000) DEFAULT NULL,
  `string3` varchar(1000) DEFAULT NULL,
  `text1` text,
  `text2` text,
  `text3` text,
  `blob1` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_cad01_ts` (`ts`,`issync`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Triggers `cad01`
--
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trins_cad01`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trins_cad01` BEFORE INSERT ON `jbscad`.`cad01`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trupd_cad01`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trupd_cad01` BEFORE UPDATE ON `jbscad`.`cad01`
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
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trdel_cad01`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trdel_cad01` AFTER DELETE ON `jbscad`.`cad01`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbscad', tablename = 'cad01', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `cad01`
--


-- --------------------------------------------------------

--
-- Table structure for table `cad02`
--

CREATE TABLE IF NOT EXISTS `cad02` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num1` int(10) unsigned DEFAULT NULL,
  `num2` int(10) unsigned DEFAULT NULL,
  `num3` int(10) unsigned DEFAULT NULL,
  `float1` float DEFAULT NULL,
  `float2` float DEFAULT NULL,
  `float3` float DEFAULT NULL,
  `flag1` tinyint(3) unsigned DEFAULT NULL,
  `flag2` tinyint(3) unsigned DEFAULT NULL,
  `flag3` tinyint(3) unsigned DEFAULT NULL,
  `string1` varchar(1000) DEFAULT NULL,
  `string2` varchar(1000) DEFAULT NULL,
  `string3` varchar(1000) DEFAULT NULL,
  `text1` text,
  `text2` text,
  `text3` text,
  `blob1` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_cad02_ts` (`ts`,`issync`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Triggers `cad02`
--
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trins_cad02`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trins_cad02` BEFORE INSERT ON `jbscad`.`cad02`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trupd_cad02`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trupd_cad02` BEFORE UPDATE ON `jbscad`.`cad02`
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
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trdel_cad02`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trdel_cad02` AFTER DELETE ON `jbscad`.`cad02`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbscad', tablename = 'cad02', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `cad02`
--


-- --------------------------------------------------------

--
-- Table structure for table `cad03`
--

CREATE TABLE IF NOT EXISTS `cad03` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num1` int(10) unsigned DEFAULT NULL,
  `num2` int(10) unsigned DEFAULT NULL,
  `num3` int(10) unsigned DEFAULT NULL,
  `float1` float DEFAULT NULL,
  `float2` float DEFAULT NULL,
  `float3` float DEFAULT NULL,
  `flag1` tinyint(3) unsigned DEFAULT NULL,
  `flag2` tinyint(3) unsigned DEFAULT NULL,
  `flag3` tinyint(3) unsigned DEFAULT NULL,
  `string1` varchar(1000) DEFAULT NULL,
  `string2` varchar(1000) DEFAULT NULL,
  `string3` varchar(1000) DEFAULT NULL,
  `text1` text,
  `text2` text,
  `text3` text,
  `blob1` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_cad03_ts` (`ts`,`issync`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Triggers `cad03`
--
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trins_cad03`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trins_cad03` BEFORE INSERT ON `jbscad`.`cad03`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trupd_cad03`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trupd_cad03` BEFORE UPDATE ON `jbscad`.`cad03`
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
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trdel_cad03`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trdel_cad03` AFTER DELETE ON `jbscad`.`cad03`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbscad', tablename = 'cad03', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `cad03`
--


-- --------------------------------------------------------

--
-- Table structure for table `cad04`
--

CREATE TABLE IF NOT EXISTS `cad04` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num1` int(10) unsigned DEFAULT NULL,
  `num2` int(10) unsigned DEFAULT NULL,
  `num3` int(10) unsigned DEFAULT NULL,
  `float1` float DEFAULT NULL,
  `float2` float DEFAULT NULL,
  `float3` float DEFAULT NULL,
  `flag1` tinyint(3) unsigned DEFAULT NULL,
  `flag2` tinyint(3) unsigned DEFAULT NULL,
  `flag3` tinyint(3) unsigned DEFAULT NULL,
  `string1` varchar(1000) DEFAULT NULL,
  `string2` varchar(1000) DEFAULT NULL,
  `string3` varchar(1000) DEFAULT NULL,
  `text1` text,
  `text2` text,
  `text3` text,
  `blob1` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_cad04_ts` (`ts`,`issync`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Triggers `cad04`
--
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trins_cad04`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trins_cad04` BEFORE INSERT ON `jbscad`.`cad04`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trupd_cad04`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trupd_cad04` BEFORE UPDATE ON `jbscad`.`cad04`
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
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trdel_cad04`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trdel_cad04` AFTER DELETE ON `jbscad`.`cad04`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbscad', tablename = 'cad04', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `cad04`
--


-- --------------------------------------------------------

--
-- Table structure for table `cad05`
--

CREATE TABLE IF NOT EXISTS `cad05` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num1` int(10) unsigned DEFAULT NULL,
  `num2` int(10) unsigned DEFAULT NULL,
  `num3` int(10) unsigned DEFAULT NULL,
  `float1` float DEFAULT NULL,
  `float2` float DEFAULT NULL,
  `float3` float DEFAULT NULL,
  `flag1` tinyint(3) unsigned DEFAULT NULL,
  `flag2` tinyint(3) unsigned DEFAULT NULL,
  `flag3` tinyint(3) unsigned DEFAULT NULL,
  `string1` varchar(1000) DEFAULT NULL,
  `string2` varchar(1000) DEFAULT NULL,
  `string3` varchar(1000) DEFAULT NULL,
  `text1` text,
  `text2` text,
  `text3` text,
  `blob1` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_cad05_ts` (`ts`,`issync`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Triggers `cad05`
--
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trins_cad05`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trins_cad05` BEFORE INSERT ON `jbscad`.`cad05`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trupd_cad05`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trupd_cad05` BEFORE UPDATE ON `jbscad`.`cad05`
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
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trdel_cad05`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trdel_cad05` AFTER DELETE ON `jbscad`.`cad05`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbscad', tablename = 'cad05', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `cad05`
--


-- --------------------------------------------------------

--
-- Table structure for table `cad06`
--

CREATE TABLE IF NOT EXISTS `cad06` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num1` int(10) unsigned DEFAULT NULL,
  `num2` int(10) unsigned DEFAULT NULL,
  `num3` int(10) unsigned DEFAULT NULL,
  `float1` float DEFAULT NULL,
  `float2` float DEFAULT NULL,
  `float3` float DEFAULT NULL,
  `flag1` tinyint(3) unsigned DEFAULT NULL,
  `flag2` tinyint(3) unsigned DEFAULT NULL,
  `flag3` tinyint(3) unsigned DEFAULT NULL,
  `string1` varchar(1000) DEFAULT NULL,
  `string2` varchar(1000) DEFAULT NULL,
  `string3` varchar(1000) DEFAULT NULL,
  `text1` text,
  `text2` text,
  `text3` text,
  `blob1` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_cad06_ts` (`ts`,`issync`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Triggers `cad06`
--
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trins_cad06`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trins_cad06` BEFORE INSERT ON `jbscad`.`cad06`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trupd_cad06`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trupd_cad06` BEFORE UPDATE ON `jbscad`.`cad06`
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
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trdel_cad06`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trdel_cad06` AFTER DELETE ON `jbscad`.`cad06`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbscad', tablename = 'cad06', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `cad06`
--


-- --------------------------------------------------------

--
-- Table structure for table `cad07`
--

CREATE TABLE IF NOT EXISTS `cad07` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num1` int(10) unsigned DEFAULT NULL,
  `num2` int(10) unsigned DEFAULT NULL,
  `num3` int(10) unsigned DEFAULT NULL,
  `float1` float DEFAULT NULL,
  `float2` float DEFAULT NULL,
  `float3` float DEFAULT NULL,
  `flag1` tinyint(3) unsigned DEFAULT NULL,
  `flag2` tinyint(3) unsigned DEFAULT NULL,
  `flag3` tinyint(3) unsigned DEFAULT NULL,
  `string1` varchar(1000) DEFAULT NULL,
  `string2` varchar(1000) DEFAULT NULL,
  `string3` varchar(1000) DEFAULT NULL,
  `text1` text,
  `text2` text,
  `text3` text,
  `blob1` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_cad07_ts` (`ts`,`issync`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Triggers `cad07`
--
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trins_cad07`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trins_cad07` BEFORE INSERT ON `jbscad`.`cad07`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trupd_cad07`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trupd_cad07` BEFORE UPDATE ON `jbscad`.`cad07`
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
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trdel_cad07`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trdel_cad07` AFTER DELETE ON `jbscad`.`cad07`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbscad', tablename = 'cad07', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `cad07`
--


-- --------------------------------------------------------

--
-- Table structure for table `cad08`
--

CREATE TABLE IF NOT EXISTS `cad08` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num1` int(10) unsigned DEFAULT NULL,
  `num2` int(10) unsigned DEFAULT NULL,
  `num3` int(10) unsigned DEFAULT NULL,
  `float1` float DEFAULT NULL,
  `float2` float DEFAULT NULL,
  `float3` float DEFAULT NULL,
  `flag1` tinyint(3) unsigned DEFAULT NULL,
  `flag2` tinyint(3) unsigned DEFAULT NULL,
  `flag3` tinyint(3) unsigned DEFAULT NULL,
  `string1` varchar(1000) DEFAULT NULL,
  `string2` varchar(1000) DEFAULT NULL,
  `string3` varchar(1000) DEFAULT NULL,
  `text1` text,
  `text2` text,
  `text3` text,
  `blob1` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_cad08_ts` (`ts`,`issync`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Triggers `cad08`
--
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trins_cad08`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trins_cad08` BEFORE INSERT ON `jbscad`.`cad08`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trupd_cad08`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trupd_cad08` BEFORE UPDATE ON `jbscad`.`cad08`
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
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trdel_cad08`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trdel_cad08` AFTER DELETE ON `jbscad`.`cad08`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbscad', tablename = 'cad08', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `cad08`
--


-- --------------------------------------------------------

--
-- Table structure for table `cad09`
--

CREATE TABLE IF NOT EXISTS `cad09` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num1` int(10) unsigned DEFAULT NULL,
  `num2` int(10) unsigned DEFAULT NULL,
  `num3` int(10) unsigned DEFAULT NULL,
  `float1` float DEFAULT NULL,
  `float2` float DEFAULT NULL,
  `float3` float DEFAULT NULL,
  `flag1` tinyint(3) unsigned DEFAULT NULL,
  `flag2` tinyint(3) unsigned DEFAULT NULL,
  `flag3` tinyint(3) unsigned DEFAULT NULL,
  `string1` varchar(1000) DEFAULT NULL,
  `string2` varchar(1000) DEFAULT NULL,
  `string3` varchar(1000) DEFAULT NULL,
  `text1` text,
  `text2` text,
  `text3` text,
  `blob1` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_cad09_ts` (`ts`,`issync`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Triggers `cad09`
--
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trins_cad09`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trins_cad09` BEFORE INSERT ON `jbscad`.`cad09`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trupd_cad09`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trupd_cad09` BEFORE UPDATE ON `jbscad`.`cad09`
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
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trdel_cad09`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trdel_cad09` AFTER DELETE ON `jbscad`.`cad09`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbscad', tablename = 'cad09', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `cad09`
--


-- --------------------------------------------------------

--
-- Table structure for table `cad10`
--

CREATE TABLE IF NOT EXISTS `cad10` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num1` int(10) unsigned DEFAULT NULL,
  `num2` int(10) unsigned DEFAULT NULL,
  `num3` int(10) unsigned DEFAULT NULL,
  `float1` float DEFAULT NULL,
  `float2` float DEFAULT NULL,
  `float3` float DEFAULT NULL,
  `flag1` tinyint(3) unsigned DEFAULT NULL,
  `flag2` tinyint(3) unsigned DEFAULT NULL,
  `flag3` tinyint(3) unsigned DEFAULT NULL,
  `string1` varchar(1000) DEFAULT NULL,
  `string2` varchar(1000) DEFAULT NULL,
  `string3` varchar(1000) DEFAULT NULL,
  `text1` text,
  `text2` text,
  `text3` text,
  `blob1` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_cad10_ts` (`ts`,`issync`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Triggers `cad10`
--
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trins_cad10`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trins_cad10` BEFORE INSERT ON `jbscad`.`cad10`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trupd_cad10`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trupd_cad10` BEFORE UPDATE ON `jbscad`.`cad10`
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
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trdel_cad10`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trdel_cad10` AFTER DELETE ON `jbscad`.`cad10`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbscad', tablename = 'cad10', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `cad10`
--


-- --------------------------------------------------------

--
-- Table structure for table `cad11`
--

CREATE TABLE IF NOT EXISTS `cad11` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num1` int(10) unsigned DEFAULT NULL,
  `num2` int(10) unsigned DEFAULT NULL,
  `num3` int(10) unsigned DEFAULT NULL,
  `float1` float DEFAULT NULL,
  `float2` float DEFAULT NULL,
  `float3` float DEFAULT NULL,
  `flag1` tinyint(3) unsigned DEFAULT NULL,
  `flag2` tinyint(3) unsigned DEFAULT NULL,
  `flag3` tinyint(3) unsigned DEFAULT NULL,
  `string1` varchar(1000) DEFAULT NULL,
  `string2` varchar(1000) DEFAULT NULL,
  `string3` varchar(1000) DEFAULT NULL,
  `text1` text,
  `text2` text,
  `text3` text,
  `blob1` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_cad11_ts` (`ts`,`issync`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Triggers `cad11`
--
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trins_cad11`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trins_cad11` BEFORE INSERT ON `jbscad`.`cad11`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trupd_cad11`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trupd_cad11` BEFORE UPDATE ON `jbscad`.`cad11`
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
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trdel_cad11`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trdel_cad11` AFTER DELETE ON `jbscad`.`cad11`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbscad', tablename = 'cad11', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `cad11`
--


-- --------------------------------------------------------

--
-- Table structure for table `cad12`
--

CREATE TABLE IF NOT EXISTS `cad12` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num1` int(10) unsigned DEFAULT NULL,
  `num2` int(10) unsigned DEFAULT NULL,
  `num3` int(10) unsigned DEFAULT NULL,
  `float1` float DEFAULT NULL,
  `float2` float DEFAULT NULL,
  `float3` float DEFAULT NULL,
  `flag1` tinyint(3) unsigned DEFAULT NULL,
  `flag2` tinyint(3) unsigned DEFAULT NULL,
  `flag3` tinyint(3) unsigned DEFAULT NULL,
  `string1` varchar(1000) DEFAULT NULL,
  `string2` varchar(1000) DEFAULT NULL,
  `string3` varchar(1000) DEFAULT NULL,
  `text1` text,
  `text2` text,
  `text3` text,
  `blob1` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_cad12_ts` (`ts`,`issync`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Triggers `cad12`
--
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trins_cad12`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trins_cad12` BEFORE INSERT ON `jbscad`.`cad12`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trupd_cad12`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trupd_cad12` BEFORE UPDATE ON `jbscad`.`cad12`
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
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trdel_cad12`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trdel_cad12` AFTER DELETE ON `jbscad`.`cad12`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbscad', tablename = 'cad12', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `cad12`
--


-- --------------------------------------------------------

--
-- Table structure for table `cad13`
--

CREATE TABLE IF NOT EXISTS `cad13` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num1` int(10) unsigned DEFAULT NULL,
  `num2` int(10) unsigned DEFAULT NULL,
  `num3` int(10) unsigned DEFAULT NULL,
  `float1` float DEFAULT NULL,
  `float2` float DEFAULT NULL,
  `float3` float DEFAULT NULL,
  `flag1` tinyint(3) unsigned DEFAULT NULL,
  `flag2` tinyint(3) unsigned DEFAULT NULL,
  `flag3` tinyint(3) unsigned DEFAULT NULL,
  `string1` varchar(1000) DEFAULT NULL,
  `string2` varchar(1000) DEFAULT NULL,
  `string3` varchar(1000) DEFAULT NULL,
  `text1` text,
  `text2` text,
  `text3` text,
  `blob1` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_cad13_ts` (`ts`,`issync`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Triggers `cad13`
--
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trins_cad13`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trins_cad13` BEFORE INSERT ON `jbscad`.`cad13`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trupd_cad13`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trupd_cad13` BEFORE UPDATE ON `jbscad`.`cad13`
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
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trdel_cad13`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trdel_cad13` AFTER DELETE ON `jbscad`.`cad13`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbscad', tablename = 'cad13', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `cad13`
--


-- --------------------------------------------------------

--
-- Table structure for table `cad14`
--

CREATE TABLE IF NOT EXISTS `cad14` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num1` int(10) unsigned DEFAULT NULL,
  `num2` int(10) unsigned DEFAULT NULL,
  `num3` int(10) unsigned DEFAULT NULL,
  `float1` float DEFAULT NULL,
  `float2` float DEFAULT NULL,
  `float3` float DEFAULT NULL,
  `flag1` tinyint(3) unsigned DEFAULT NULL,
  `flag2` tinyint(3) unsigned DEFAULT NULL,
  `flag3` tinyint(3) unsigned DEFAULT NULL,
  `string1` varchar(1000) DEFAULT NULL,
  `string2` varchar(1000) DEFAULT NULL,
  `string3` varchar(1000) DEFAULT NULL,
  `text1` text,
  `text2` text,
  `text3` text,
  `blob1` blob,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_cad14_ts` (`ts`,`issync`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Triggers `cad14`
--
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trins_cad14`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trins_cad14` BEFORE INSERT ON `jbscad`.`cad14`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trupd_cad14`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trupd_cad14` BEFORE UPDATE ON `jbscad`.`cad14`
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
DROP TRIGGER IF EXISTS `jbscad`.`fsync_trdel_cad14`;
DELIMITER //
CREATE TRIGGER `jbscad`.`fsync_trdel_cad14` AFTER DELETE ON `jbscad`.`cad14`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbscad', tablename = 'cad14', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `cad14`
--

