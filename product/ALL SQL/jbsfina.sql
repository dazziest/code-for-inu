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
-- Database: `jbsfina`
--

-- --------------------------------------------------------

--
-- Table structure for table `auditbesarjtt`
--

CREATE TABLE IF NOT EXISTS `auditbesarjtt` (
  `statusdata` tinyint(1) NOT NULL,
  `idaudit` int(10) unsigned NOT NULL,
  `replid` int(10) unsigned NOT NULL,
  `nis` varchar(20) NOT NULL,
  `idpenerimaan` int(10) unsigned NOT NULL,
  `besar` decimal(15,0) NOT NULL,
  `lunas` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `pengguna` varchar(100) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `FK_auditbesarjtt_auditinfo` (`idaudit`),
  KEY `IX_auditbesarjtt_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auditbesarjtt`
--


-- --------------------------------------------------------

--
-- Table structure for table `auditbesarjttcalon`
--

CREATE TABLE IF NOT EXISTS `auditbesarjttcalon` (
  `statusdata` tinyint(1) NOT NULL,
  `idaudit` int(10) unsigned NOT NULL,
  `replid` int(10) unsigned NOT NULL,
  `idcalon` int(10) unsigned NOT NULL,
  `idpenerimaan` int(10) unsigned NOT NULL,
  `besar` decimal(15,0) NOT NULL,
  `lunas` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `pengguna` varchar(100) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `FK_auditbesarjttcalon_auditinfo` (`idaudit`),
  KEY `IX_auditbesarjttcalon_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auditbesarjttcalon`
--


-- --------------------------------------------------------

--
-- Table structure for table `auditinfo`
--

CREATE TABLE IF NOT EXISTS `auditinfo` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sumber` varchar(100) NOT NULL,
  `idsumber` int(10) unsigned NOT NULL,
  `tanggal` datetime NOT NULL,
  `petugas` varchar(100) NOT NULL,
  `departemen` varchar(25) NOT NULL,
  `alasan` varchar(500) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_auditinfo_departemen` (`departemen`),
  KEY `IX_auditinfo_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auditinfo`
--


-- --------------------------------------------------------

--
-- Table structure for table `auditjurnal`
--

CREATE TABLE IF NOT EXISTS `auditjurnal` (
  `status` tinyint(1) unsigned NOT NULL,
  `replid` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `transaksi` varchar(255) NOT NULL,
  `petugas` varchar(100) NOT NULL,
  `nokas` varchar(100) NOT NULL,
  `idtahunbuku` int(10) unsigned NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `sumber` varchar(40) NOT NULL,
  `idaudit` int(10) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `FK_auditjurnal_auditinfo` (`idaudit`),
  KEY `IX_auditjurnal_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `auditjurnal`
--


-- --------------------------------------------------------

--
-- Table structure for table `auditjurnaldetail`
--

CREATE TABLE IF NOT EXISTS `auditjurnaldetail` (
  `status` tinyint(1) unsigned NOT NULL,
  `idaudit` int(10) unsigned NOT NULL,
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idjurnal` int(10) unsigned NOT NULL,
  `koderek` varchar(15) NOT NULL,
  `debet` decimal(15,0) NOT NULL DEFAULT '0',
  `kredit` decimal(15,0) NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_auditjurnaldetail_auditinfo` (`idaudit`),
  KEY `IX_auditjurnaldetail_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auditjurnaldetail`
--


-- --------------------------------------------------------

--
-- Table structure for table `auditpenerimaaniuran`
--

CREATE TABLE IF NOT EXISTS `auditpenerimaaniuran` (
  `statusdata` tinyint(1) unsigned NOT NULL,
  `idaudit` int(10) unsigned NOT NULL,
  `replid` int(10) unsigned NOT NULL,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `petugas` varchar(100) DEFAULT NULL,
  `idpenerimaan` int(10) unsigned NOT NULL,
  `nis` varchar(20) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `FK_auditpenerimaaniuran_auditinfo` (`idaudit`),
  KEY `IX_auditpenerimaaniuran_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auditpenerimaaniuran`
--


-- --------------------------------------------------------

--
-- Table structure for table `auditpenerimaaniurancalon`
--

CREATE TABLE IF NOT EXISTS `auditpenerimaaniurancalon` (
  `statusdata` tinyint(1) unsigned NOT NULL,
  `idaudit` int(10) unsigned NOT NULL,
  `replid` int(10) unsigned NOT NULL,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `petugas` varchar(100) DEFAULT NULL,
  `idpenerimaan` int(10) unsigned NOT NULL,
  `idcalon` int(10) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `FK_auditpenerimaaniurancalon_audit` (`idaudit`),
  KEY `IX_auditpenerimaaniurancalon_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auditpenerimaaniurancalon`
--


-- --------------------------------------------------------

--
-- Table structure for table `auditpenerimaanjtt`
--

CREATE TABLE IF NOT EXISTS `auditpenerimaanjtt` (
  `statusdata` tinyint(1) NOT NULL,
  `idaudit` int(10) unsigned NOT NULL,
  `replid` int(10) unsigned NOT NULL,
  `idbesarjtt` int(10) unsigned NOT NULL,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `petugas` varchar(100) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `FK_auditpenerimaanjtt_auditinfo` (`idaudit`),
  KEY `IX_auditpenerimaanjtt_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auditpenerimaanjtt`
--


-- --------------------------------------------------------

--
-- Table structure for table `auditpenerimaanjttcalon`
--

CREATE TABLE IF NOT EXISTS `auditpenerimaanjttcalon` (
  `statusdata` tinyint(1) NOT NULL,
  `idaudit` int(10) unsigned NOT NULL,
  `replid` int(10) unsigned NOT NULL,
  `idbesarjttcalon` int(10) unsigned NOT NULL,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `petugas` varchar(100) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `FK_auditpenerimaanjttcalon_auditinfo` (`idaudit`),
  KEY `IX_auditpenerimaanjttcalon_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auditpenerimaanjttcalon`
--


-- --------------------------------------------------------

--
-- Table structure for table `auditpenerimaanlain`
--

CREATE TABLE IF NOT EXISTS `auditpenerimaanlain` (
  `statusdata` tinyint(1) unsigned NOT NULL,
  `idaudit` int(10) unsigned NOT NULL,
  `replid` int(10) unsigned NOT NULL,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `petugas` varchar(100) DEFAULT NULL,
  `idpenerimaan` int(10) unsigned NOT NULL,
  `sumber` varchar(100) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `FK_auditpenerimaanlain_auditinfo` (`idaudit`),
  KEY `IX_auditpenerimaanlain_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auditpenerimaanlain`
--


-- --------------------------------------------------------

--
-- Table structure for table `auditpengeluaran`
--

CREATE TABLE IF NOT EXISTS `auditpengeluaran` (
  `statusdata` tinyint(1) unsigned NOT NULL,
  `idaudit` int(10) unsigned NOT NULL,
  `replid` int(10) unsigned NOT NULL,
  `idpengeluaran` int(10) unsigned NOT NULL,
  `keperluan` varchar(255) NOT NULL,
  `jenispemohon` tinyint(1) unsigned NOT NULL,
  `nip` varchar(20) DEFAULT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `pemohonlain` int(10) unsigned DEFAULT NULL,
  `penerima` varchar(100) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `tanggalkeluar` datetime NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `petugas` varchar(45) DEFAULT NULL,
  `idjurnal` int(10) unsigned NOT NULL,
  `keterangan` text,
  `namapemohon` varchar(100) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `FK_auditpengeluaran_auditinfo` (`idaudit`),
  KEY `IX_auditpengeluaran_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auditpengeluaran`
--


-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE IF NOT EXISTS `barang` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idkelompok` int(10) unsigned NOT NULL,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kondisi` varchar(255) DEFAULT NULL,
  `jumlah` int(10) NOT NULL DEFAULT '0',
  `tglperolehan` date NOT NULL DEFAULT '0000-00-00',
  `foto` blob,
  `keterangan` varchar(255) DEFAULT NULL,
  `satuan` varchar(20) DEFAULT 'unit',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_barang_kelompok` (`idkelompok`),
  KEY `IX_barang_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

--
-- Triggers `barang`
--
DROP TRIGGER IF EXISTS `jbsfina`.`fsync_trins_barang_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`fsync_trins_barang_100` BEFORE INSERT ON `jbsfina`.`barang`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsfina`.`fsync_trupd_barang_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`fsync_trupd_barang_100` BEFORE UPDATE ON `jbsfina`.`barang`
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
DROP TRIGGER IF EXISTS `jbsfina`.`fsync_trdel_barang_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`fsync_trdel_barang_100` AFTER DELETE ON `jbsfina`.`barang`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'barang', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `barang`
--


-- --------------------------------------------------------

--
-- Table structure for table `besarjtt`
--

CREATE TABLE IF NOT EXISTS `besarjtt` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `idpenerimaan` int(10) unsigned NOT NULL,
  `besar` decimal(15,0) NOT NULL,
  `cicilan` decimal(15,0) NOT NULL DEFAULT '0',
  `lunas` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `pengguna` varchar(100) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_pembayaranjtt_siswa` (`nis`),
  KEY `FK_pembayaranjtt_penerimaan` (`idpenerimaan`),
  KEY `IX_besarjtt_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `besarjtt`
--
DROP TRIGGER IF EXISTS `jbsfina`.`fsync_trins_besarjtt_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`fsync_trins_besarjtt_100` BEFORE INSERT ON `jbsfina`.`besarjtt`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsfina`.`fsync_trupd_besarjtt_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`fsync_trupd_besarjtt_100` BEFORE UPDATE ON `jbsfina`.`besarjtt`
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
DROP TRIGGER IF EXISTS `jbsfina`.`trupd_besarjtt_101`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`trupd_besarjtt_101` AFTER UPDATE ON `jbsfina`.`besarjtt`
 FOR EACH ROW BEGIN
    DECLARE xidaudit int;
	DECLARE xdepartemen varchar(25); 
	
	IF (@DISABLE_TRIGGERS IS NULL) AND (@DISABLE_TRIGER IS NULL) THEN
		SELECT p.departemen INTO xdepartemen
		  FROM besarjtt b, datapenerimaan p
		 WHERE b.idpenerimaan = p.replid AND b.replid = NEW.replid;
		 
		INSERT INTO auditinfo SET departemen=xdepartemen, sumber='besarjtt', idsumber=new.replid, tanggal=now(), petugas=new.pengguna, alasan=new.info3;
		
		SELECT last_insert_id() INTO xidaudit;
		
		INSERT INTO auditbesarjtt SET statusdata=0, idaudit=xidaudit, replid=OLD.replid, nis=OLD.nis, 
			idpenerimaan=OLD.idpenerimaan, besar=OLD.besar, lunas=OLD.lunas, keterangan=OLD.keterangan, pengguna=OLD.pengguna, info1=OLD.info1, info2=OLD.info2;
		
		INSERT INTO auditbesarjtt SET statusdata=1, idaudit=xidaudit, replid=NEW.replid, nis=NEW.nis, 
			idpenerimaan=NEW.idpenerimaan, besar=NEW.besar, lunas=NEW.lunas, keterangan=NEW.keterangan, pengguna=NEW.pengguna, info1=NEW.info1, info2=NEW.info2;
	END IF;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsfina`.`fsync_trdel_besarjtt_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`fsync_trdel_besarjtt_100` AFTER DELETE ON `jbsfina`.`besarjtt`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'besarjtt', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `besarjtt`
--


-- --------------------------------------------------------

--
-- Table structure for table `besarjttcalon`
--

CREATE TABLE IF NOT EXISTS `besarjttcalon` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idcalon` int(10) unsigned NOT NULL,
  `idpenerimaan` int(10) unsigned NOT NULL,
  `besar` decimal(15,0) NOT NULL,
  `cicilan` decimal(15,0) NOT NULL DEFAULT '0',
  `lunas` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `pengguna` varchar(100) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_besarjttcalon_penerimaan` (`idpenerimaan`),
  KEY `FK_besarjttcalon_calonsiswa` (`idcalon`),
  KEY `IX_besarjttcalon_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `besarjttcalon`
--
DROP TRIGGER IF EXISTS `jbsfina`.`fsync_trins_besarjttcalon_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`fsync_trins_besarjttcalon_100` BEFORE INSERT ON `jbsfina`.`besarjttcalon`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsfina`.`fsync_trupd_besarjttcalon_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`fsync_trupd_besarjttcalon_100` BEFORE UPDATE ON `jbsfina`.`besarjttcalon`
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
DROP TRIGGER IF EXISTS `jbsfina`.`trupd_besarjttcalon_101`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`trupd_besarjttcalon_101` AFTER UPDATE ON `jbsfina`.`besarjttcalon`
 FOR EACH ROW BEGIN
    DECLARE xidaudit int;
	DECLARE xdepartemen varchar(25); 
	
	IF (@DISABLE_TRIGGERS IS NULL) AND (@DISABLE_TRIGER IS NULL) THEN
		SELECT p.departemen INTO xdepartemen
		FROM besarjttcalon b, datapenerimaan p
		WHERE b.idpenerimaan = p.replid AND b.replid = NEW.replid;
		 
		INSERT INTO auditinfo SET departemen=xdepartemen, sumber='besarjttcalon', idsumber=new.replid, tanggal=now(), petugas=new.pengguna, alasan=new.info3;
		
		SELECT last_insert_id() INTO xidaudit;
		
		INSERT INTO auditbesarjttcalon SET statusdata=0, idaudit=xidaudit, replid=OLD.replid, idcalon=OLD.idcalon, 
			idpenerimaan=OLD.idpenerimaan, besar=OLD.besar, lunas=OLD.lunas, keterangan=OLD.keterangan, pengguna=OLD.pengguna, info1=OLD.info1, info2=OLD.info2;
		
		INSERT INTO auditbesarjttcalon SET statusdata=1, idaudit=xidaudit, replid=NEW.replid, idcalon=NEW.idcalon, 
			idpenerimaan=NEW.idpenerimaan, besar=NEW.besar, lunas=NEW.lunas, keterangan=NEW.keterangan, pengguna=NEW.pengguna, info1=NEW.info1, info2=NEW.info2;
	END IF;		
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsfina`.`fsync_trdel_besarjttcalon_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`fsync_trdel_besarjttcalon_100` AFTER DELETE ON `jbsfina`.`besarjttcalon`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'besarjttcalon', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `besarjttcalon`
--


-- --------------------------------------------------------

--
-- Table structure for table `datadsp`
--

CREATE TABLE IF NOT EXISTS `datadsp` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `dsp` decimal(15,0) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `operator` varchar(50) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_datadsp_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `datadsp`
--


-- --------------------------------------------------------

--
-- Table structure for table `datapenerimaan`
--

CREATE TABLE IF NOT EXISTS `datapenerimaan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `besar` decimal(15,0) DEFAULT NULL,
  `idkategori` varchar(15) NOT NULL,
  `rekkas` varchar(15) NOT NULL,
  `rekpendapatan` varchar(15) NOT NULL,
  `rekpiutang` varchar(15) DEFAULT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `departemen` varchar(50) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_datapenerimaan_rekakun_kas` (`rekkas`),
  KEY `FK_datapenerimaan_rekakun_pendapatan` (`rekpendapatan`),
  KEY `FK_datapenerimaan_rekakun_piutang` (`rekpiutang`),
  KEY `FK_datapenerimaan_kategoripenerimaan` (`idkategori`),
  KEY `FK_datapenerimaan_departemen` (`departemen`),
  KEY `IX_datapenerimaan_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Triggers `datapenerimaan`
--
DROP TRIGGER IF EXISTS `jbsfina`.`fsync_trins_datapenerimaan_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`fsync_trins_datapenerimaan_100` BEFORE INSERT ON `jbsfina`.`datapenerimaan`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsfina`.`fsync_trupd_datapenerimaan_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`fsync_trupd_datapenerimaan_100` BEFORE UPDATE ON `jbsfina`.`datapenerimaan`
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
DROP TRIGGER IF EXISTS `jbsfina`.`fsync_trdel_datapenerimaan_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`fsync_trdel_datapenerimaan_100` AFTER DELETE ON `jbsfina`.`datapenerimaan`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'datapenerimaan', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `datapenerimaan`
--

INSERT INTO `datapenerimaan` (`replid`, `nama`, `besar`, `idkategori`, `rekkas`, `rekpendapatan`, `rekpiutang`, `aktif`, `keterangan`, `departemen`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(9, 'SPP Bulanan', NULL, 'JTT', '111', '411', '150', 1, 'Sekedar contoh. Menu ini mengatur setiap jenis penerimaan yang mungkin diterima sekolah. Anda harus menentukan rekening Kas, Pendapatan dan Piutang untuk setiap transaksi penerimaan.', 'SMK Negeri 12 Malang', NULL, NULL, NULL, '2010-03-02 10:06:52', 41237, 0),
(11, 'Dana Sumbangan Pendidikan', NULL, 'CSWJB', '111', '412', '152', 1, 'Sekedar contoh. Menu ini mengatur setiap jenis penerimaan yang mungkin diterima sekolah. Anda harus menentukan rekening Kas, Pendapatan dan Piutang untuk setiap transaksi penerimaan.', 'SMK Negeri 12 Malang', NULL, NULL, NULL, '2010-08-03 18:18:36', 12756, 0),
(12, 'Sumbangan BOS', NULL, 'LNN', '113', '414', '152', 1, 'Sekedar contoh. Menu ini mengatur setiap jenis penerimaan yang mungkin diterima sekolah. Anda harus menentukan rekening Kas, Pendapatan dan Piutang untuk setiap transaksi penerimaan.', 'SMK Negeri 12 Malang', NULL, NULL, NULL, '2010-03-02 10:06:52', 5601, 0),
(13, 'Tabungan Siswa', NULL, 'SKR', '112', '413', '150', 1, 'Sekedar contoh. Menu ini mengatur setiap jenis penerimaan yang mungkin diterima sekolah. Anda harus menentukan rekening Kas, Pendapatan dan Piutang untuk setiap transaksi penerimaan.', 'SMK Negeri 12 Malang', NULL, NULL, NULL, '2010-03-02 10:06:52', 55264, 0),
(14, 'Sumbangan Pendidikan', NULL, 'CSSKR', '112', '413', '152', 1, 'Sekedar contoh. Menu ini mengatur setiap jenis penerimaan yang mungkin diterima sekolah. Anda harus menentukan rekening Kas, Pendapatan dan Piutang untuk setiap transaksi penerimaan.', 'SMK Negeri 12 Malang', NULL, NULL, NULL, '2010-03-02 10:06:52', 62929, 0);

-- --------------------------------------------------------

--
-- Table structure for table `datapengeluaran`
--

CREATE TABLE IF NOT EXISTS `datapengeluaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `rekdebet` varchar(15) NOT NULL,
  `rekkredit` varchar(15) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `besar` decimal(15,0) NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_datapengeluaran_departemen` (`departemen`),
  KEY `FK_datapengeluaran_rekakun` (`rekdebet`),
  KEY `FK_datapengeluaran_rekakun2` (`rekkredit`),
  KEY `IX_datapengeluaran_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `datapengeluaran`
--

INSERT INTO `datapengeluaran` (`replid`, `departemen`, `nama`, `rekdebet`, `rekkredit`, `aktif`, `keterangan`, `besar`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(4, 'SMK Negeri 12 Malang', 'Bayar Listrik', '501', '111', 1, 'Sekedar contoh. Menu ini mengatur setiap jenis pengeluaran yang mungkin dikeluarkan sekolah. Anda harus menentukan rekening Kas dan Beban untuk setiap transaksi pengeluaran.', 0, NULL, NULL, NULL, '2010-03-02 10:06:52', 17792, 0);

-- --------------------------------------------------------

--
-- Table structure for table `groupbarang`
--

CREATE TABLE IF NOT EXISTS `groupbarang` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keterangan` varchar(45) DEFAULT NULL,
  `namagroup` varchar(45) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_groupbarang_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

--
-- Triggers `groupbarang`
--
DROP TRIGGER IF EXISTS `jbsfina`.`fsync_trins_groupbarang_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`fsync_trins_groupbarang_100` BEFORE INSERT ON `jbsfina`.`groupbarang`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsfina`.`fsync_trupd_groupbarang_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`fsync_trupd_groupbarang_100` BEFORE UPDATE ON `jbsfina`.`groupbarang`
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
DROP TRIGGER IF EXISTS `jbsfina`.`fsync_trdel_groupbarang_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`fsync_trdel_groupbarang_100` AFTER DELETE ON `jbsfina`.`groupbarang`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'groupbarang', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `groupbarang`
--


-- --------------------------------------------------------

--
-- Table structure for table `jurnal`
--

CREATE TABLE IF NOT EXISTS `jurnal` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `transaksi` varchar(255) NOT NULL,
  `petugas` varchar(100) NOT NULL,
  `nokas` varchar(100) NOT NULL,
  `idtahunbuku` int(10) unsigned NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `sumber` varchar(40) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_jurnal_tahunbuku` (`idtahunbuku`),
  KEY `IX_jurnal_tanggal` (`tanggal`),
  KEY `IX_jurnal_idtahunbuku` (`idtahunbuku`),
  KEY `IX_jurnal_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jurnal`
--


-- --------------------------------------------------------

--
-- Table structure for table `jurnaldetail`
--

CREATE TABLE IF NOT EXISTS `jurnaldetail` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idjurnal` int(10) unsigned NOT NULL,
  `koderek` varchar(15) NOT NULL,
  `debet` decimal(15,0) NOT NULL DEFAULT '0',
  `kredit` decimal(15,0) NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_jurnaldetail_jurnal` (`idjurnal`),
  KEY `IX_jurnaldetail_koderek` (`koderek`),
  KEY `IX_jurnaldetail_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jurnaldetail`
--


-- --------------------------------------------------------

--
-- Table structure for table `kategoripenerimaan`
--

CREATE TABLE IF NOT EXISTS `kategoripenerimaan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `urutan` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siswa` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`kode`),
  UNIQUE KEY `Index_1` (`replid`),
  KEY `IX_kategoripenerimaan_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Triggers `kategoripenerimaan`
--
DROP TRIGGER IF EXISTS `jbsfina`.`fsync_trins_kategoripenerimaan_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`fsync_trins_kategoripenerimaan_100` BEFORE INSERT ON `jbsfina`.`kategoripenerimaan`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsfina`.`fsync_trupd_kategoripenerimaan_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`fsync_trupd_kategoripenerimaan_100` BEFORE UPDATE ON `jbsfina`.`kategoripenerimaan`
 FOR EACH ROW BEGIN 
  IF @DISABLE_TRIGER IS NULL THEN
      IF OLD.issync = 1 THEN 
          SET NEW.issync = 0; 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
      IF OLD.issync = 0 AND NEW.issync = 0 THEN 
          SET NEW.ts = CURRENT_TIMESTAMP; 
      END IF; 
     IF NEW.kode <> OLD.kode THEN 
         INSERT INTO jbsclient.pkchanges SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'kategoripenerimaan', dataid = OLD.replid, datatoken = OLD.token, newpk = NEW.kode, oldpk = OLD.kode;
     END IF;
  END IF;
  END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsfina`.`fsync_trdel_kategoripenerimaan_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`fsync_trdel_kategoripenerimaan_100` AFTER DELETE ON `jbsfina`.`kategoripenerimaan`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'kategoripenerimaan', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `kategoripenerimaan`
--

INSERT INTO `kategoripenerimaan` (`replid`, `kode`, `kategori`, `urutan`, `siswa`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(4, 'CSSKR', 'Iuran Sukarela Calon Siswa', 4, 1, NULL, NULL, NULL, '2010-03-02 10:06:52', 31230, 0),
(3, 'CSWJB', 'Iuran Wajib Calon Siswa', 3, 1, NULL, NULL, NULL, '2010-03-02 10:06:52', 37247, 0),
(1, 'JTT', 'Iuran Wajib Siswa', 1, 1, NULL, NULL, NULL, '2010-03-02 10:06:52', 27011, 0),
(5, 'LNN', 'Penerimaan Lainnya', 5, 1, NULL, NULL, NULL, '2010-03-02 10:06:52', 23315, 0),
(2, 'SKR', 'Iuran Sukarela Siswa', 2, 1, NULL, NULL, NULL, '2010-03-02 10:06:52', 35541, 0);

-- --------------------------------------------------------

--
-- Table structure for table `katerekakun`
--

CREATE TABLE IF NOT EXISTS `katerekakun` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kategori` varchar(100) NOT NULL,
  `urutan` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`kategori`),
  UNIQUE KEY `Index_1` (`replid`),
  KEY `IX_katerekakun_ts` (`ts`,`issync`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `katerekakun`
--

INSERT INTO `katerekakun` (`replid`, `kategori`, `urutan`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
(7, 'BIAYA', 7, NULL, NULL, NULL, '2010-03-02 10:06:52', 42231, 0),
(1, 'HARTA', 1, NULL, NULL, NULL, '2010-03-02 10:06:52', 38999, 0),
(3, 'INVENTARIS', 3, NULL, NULL, NULL, '2010-03-02 10:06:52', 2775, 0),
(5, 'MODAL', 5, NULL, NULL, NULL, '2010-03-02 10:06:52', 27935, 0),
(6, 'PENDAPATAN', 6, NULL, NULL, NULL, '2010-03-02 10:06:52', 289, 0),
(2, 'PIUTANG', 2, NULL, NULL, NULL, '2010-03-02 10:06:52', 48701, 0),
(4, 'UTANG', 4, NULL, NULL, NULL, '2010-03-02 10:06:52', 46047, 0);

-- --------------------------------------------------------

--
-- Table structure for table `kelompokbarang`
--

CREATE TABLE IF NOT EXISTS `kelompokbarang` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompok` varchar(255) NOT NULL,
  `keterangan` varchar(45) DEFAULT NULL,
  `idgroup` int(10) unsigned NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_kelompokbarang_group` (`idgroup`),
  KEY `IX_kelompokbarang_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

--
-- Triggers `kelompokbarang`
--
DROP TRIGGER IF EXISTS `jbsfina`.`fsync_trins_kelompokbarang_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`fsync_trins_kelompokbarang_100` BEFORE INSERT ON `jbsfina`.`kelompokbarang`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsfina`.`fsync_trupd_kelompokbarang_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`fsync_trupd_kelompokbarang_100` BEFORE UPDATE ON `jbsfina`.`kelompokbarang`
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
DROP TRIGGER IF EXISTS `jbsfina`.`fsync_trdel_kelompokbarang_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`fsync_trdel_kelompokbarang_100` AFTER DELETE ON `jbsfina`.`kelompokbarang`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'kelompokbarang', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `kelompokbarang`
--


-- --------------------------------------------------------

--
-- Table structure for table `pemohonlain`
--

CREATE TABLE IF NOT EXISTS `pemohonlain` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `IX_pemohonlain_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `pemohonlain`
--


-- --------------------------------------------------------

--
-- Table structure for table `penerimaaniuran`
--

CREATE TABLE IF NOT EXISTS `penerimaaniuran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `petugas` varchar(100) DEFAULT NULL,
  `idpenerimaan` int(10) unsigned NOT NULL,
  `nis` varchar(20) NOT NULL,
  `alasan` varchar(500) DEFAULT '" "',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_pembayaraniuran_jurnal` (`idjurnal`),
  KEY `FK_pembayaraniuran_datapenerimaan` (`idpenerimaan`),
  KEY `FK_pembayaraniuran_siswa` (`nis`),
  KEY `IX_penerimaaniuran_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `penerimaaniuran`
--
DROP TRIGGER IF EXISTS `jbsfina`.`fsync_trins_penerimaaniuran_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`fsync_trins_penerimaaniuran_100` BEFORE INSERT ON `jbsfina`.`penerimaaniuran`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsfina`.`trins_penerimaaniuran_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`trins_penerimaaniuran_100` AFTER INSERT ON `jbsfina`.`penerimaaniuran`
 FOR EACH ROW BEGIN
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xdepartemen varchar(25);
	
    select transaksi, nokas, idtahunbuku, keterangan 
    	into xinfo, xnokas, xidtahunbuku, xketerangan 
    	from jurnal where replid = new.idjurnal;
    
    select departemen into xdepartemen
    	from datapenerimaan
    	where replid = new.idpenerimaan; 
		
    insert into transaksilog set sumber='penerimaaniuran', idsumber=new.replid, 
    	tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
    	idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=new.jumlah, kredit=0, departemen=xdepartemen;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsfina`.`fsync_trupd_penerimaaniuran_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`fsync_trupd_penerimaaniuran_100` BEFORE UPDATE ON `jbsfina`.`penerimaaniuran`
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
DROP TRIGGER IF EXISTS `jbsfina`.`trupd_penerimaaniuran_101`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`trupd_penerimaaniuran_101` AFTER UPDATE ON `jbsfina`.`penerimaaniuran`
 FOR EACH ROW BEGIN
	declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xidaudit int;
    declare xdepartemen varchar(25);
	
	IF @DISABLE_TRIGER IS NULL THEN
	
		select transaksi, nokas, idtahunbuku, keterangan 
			into xinfo, xnokas, xidtahunbuku, xketerangan 
			from jurnal where replid = new.idjurnal;
		
		select departemen into xdepartemen
			from datapenerimaan
			where replid = new.idpenerimaan; 
			
		update transaksilog set tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
			idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=new.jumlah, kredit=0 
			where sumber='penerimaaniuran' and idsumber=new.replid;
		
		IF new.tanggal <> old.tanggal THEN
			update jurnal set tanggal = new.tanggal where replid = new.idjurnal;
		END IF;	
		
		insert into auditinfo set departemen=xdepartemen, sumber='penerimaaniuran', idsumber=new.replid, tanggal=now(), petugas=new.petugas, alasan=new.alasan;
		
		select last_insert_id() into xidaudit;
		
		insert into auditpenerimaaniuran set statusdata=0, idaudit=xidaudit, replid=old.replid, idjurnal=old.idjurnal, 
			tanggal=old.tanggal, jumlah=old.jumlah, keterangan=old.keterangan, petugas=old.petugas, idpenerimaan=old.idpenerimaan,
			nis=old.nis;
		
		insert into auditpenerimaaniuran set statusdata=1, idaudit=xidaudit, replid=new.replid, idjurnal=new.idjurnal, 
			tanggal=new.tanggal, jumlah=new.jumlah, keterangan=new.keterangan, petugas=new.petugas, idpenerimaan=new.idpenerimaan,
			nis=new.nis;
		
	END IF;
	
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsfina`.`fsync_trdel_penerimaaniuran_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`fsync_trdel_penerimaaniuran_100` AFTER DELETE ON `jbsfina`.`penerimaaniuran`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'penerimaaniuran', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `penerimaaniuran`
--


-- --------------------------------------------------------

--
-- Table structure for table `penerimaaniurancalon`
--

CREATE TABLE IF NOT EXISTS `penerimaaniurancalon` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `petugas` varchar(100) DEFAULT NULL,
  `idpenerimaan` int(10) unsigned NOT NULL,
  `idcalon` int(10) unsigned NOT NULL,
  `alasan` varchar(500) DEFAULT '" "',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_penerimaaniurancalon_datapenerimaan` (`idpenerimaan`),
  KEY `FK_penerimaaniurancalon_calon` (`idcalon`),
  KEY `FK_penerimaaniurancalon_jurnal` (`idjurnal`),
  KEY `IX_penerimaaniurancalon_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `penerimaaniurancalon`
--
DROP TRIGGER IF EXISTS `jbsfina`.`fsync_trins_penerimaaniurancalon_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`fsync_trins_penerimaaniurancalon_100` BEFORE INSERT ON `jbsfina`.`penerimaaniurancalon`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsfina`.`trins_penerimaaniurancalon_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`trins_penerimaaniurancalon_100` AFTER INSERT ON `jbsfina`.`penerimaaniurancalon`
 FOR EACH ROW BEGIN
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xdepartemen varchar(25);
	
    select transaksi, nokas, idtahunbuku, keterangan 
    	into xinfo, xnokas, xidtahunbuku, xketerangan 
    	from jurnal where replid = new.idjurnal;
    
    select departemen into xdepartemen
    	from datapenerimaan
    	where replid = new.idpenerimaan; 
		
    insert into transaksilog set sumber='penerimaaniurancalon', idsumber=new.replid, 
    	tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
    	idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=new.jumlah, kredit=0, departemen=xdepartemen;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsfina`.`fsync_trupd_penerimaaniurancalon_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`fsync_trupd_penerimaaniurancalon_100` BEFORE UPDATE ON `jbsfina`.`penerimaaniurancalon`
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
DROP TRIGGER IF EXISTS `jbsfina`.`trupd_penerimaaniurancalon_101`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`trupd_penerimaaniurancalon_101` AFTER UPDATE ON `jbsfina`.`penerimaaniurancalon`
 FOR EACH ROW BEGIN
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xidaudit int;
    declare xdepartemen varchar(25);
	
	IF @DISABLE_TRIGER IS NULL THEN
	
		select transaksi, nokas, idtahunbuku, keterangan 
			into xinfo, xnokas, xidtahunbuku, xketerangan 
			from jurnal where replid = new.idjurnal;
		
		select departemen into xdepartemen
			from datapenerimaan
			where replid = new.idpenerimaan; 
			
		update transaksilog set tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
			idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=new.jumlah, kredit=0 
			where sumber='penerimaaniurancalon' and idsumber=new.replid;
			
		IF new.tanggal <> old.tanggal THEN
			update jurnal set tanggal = new.tanggal where replid = new.idjurnal;
		END IF;	
		
		insert into auditinfo set departemen=xdepartemen, sumber='penerimaaniurancalon', idsumber=new.replid, tanggal=now(), petugas=new.petugas, alasan=new.alasan;
		
		select last_insert_id() into xidaudit;
		
		insert into auditpenerimaaniurancalon set statusdata=0, idaudit=xidaudit, replid=old.replid, idjurnal=old.idjurnal, 
			tanggal=old.tanggal, jumlah=old.jumlah, keterangan=old.keterangan, petugas=old.petugas, idpenerimaan=old.idpenerimaan,
			idcalon=old.idcalon;
		
		insert into auditpenerimaaniurancalon set statusdata=1, idaudit=xidaudit, replid=new.replid, idjurnal=new.idjurnal, 
			tanggal=new.tanggal, jumlah=new.jumlah, keterangan=new.keterangan, petugas=new.petugas, idpenerimaan=new.idpenerimaan,
			idcalon=new.idcalon;
	
	END IF;	
    		
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsfina`.`fsync_trdel_penerimaaniurancalon_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`fsync_trdel_penerimaaniurancalon_100` AFTER DELETE ON `jbsfina`.`penerimaaniurancalon`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'penerimaaniurancalon', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `penerimaaniurancalon`
--


-- --------------------------------------------------------

--
-- Table structure for table `penerimaanjtt`
--

CREATE TABLE IF NOT EXISTS `penerimaanjtt` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idbesarjtt` int(10) unsigned NOT NULL,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `petugas` varchar(100) DEFAULT NULL,
  `alasan` varchar(500) DEFAULT ' ',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_pembayaranjtt_besatjtt` (`idbesarjtt`),
  KEY `FK_pembayaranjtt_jurnal` (`idjurnal`),
  KEY `IX_penerimaanjtt_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `penerimaanjtt`
--
DROP TRIGGER IF EXISTS `jbsfina`.`fsync_trins_penerimaanjtt_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`fsync_trins_penerimaanjtt_100` BEFORE INSERT ON `jbsfina`.`penerimaanjtt`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsfina`.`trins_penerimaanjtt_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`trins_penerimaanjtt_100` AFTER INSERT ON `jbsfina`.`penerimaanjtt`
 FOR EACH ROW BEGIN
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xdepartemen varchar(25);
    
    select transaksi, nokas, idtahunbuku, keterangan 
    	into xinfo, xnokas, xidtahunbuku, xketerangan 
    	from jurnal where replid = new.idjurnal;
    
    select p.departemen into xdepartemen
    	from besarjtt b, datapenerimaan p
    	where b.idpenerimaan = p.replid and b.replid = new.idbesarjtt;
    
    insert into transaksilog set sumber='penerimaanjtt', idsumber=new.replid, 
    	tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
    	idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=new.jumlah, kredit=0, departemen=xdepartemen;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsfina`.`fsync_trupd_penerimaanjtt_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`fsync_trupd_penerimaanjtt_100` BEFORE UPDATE ON `jbsfina`.`penerimaanjtt`
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
DROP TRIGGER IF EXISTS `jbsfina`.`trupd_penerimaanjtt_101`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`trupd_penerimaanjtt_101` AFTER UPDATE ON `jbsfina`.`penerimaanjtt`
 FOR EACH ROW BEGIN
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xidaudit int;
    declare xdepartemen varchar(25);
	
	IF @DISABLE_TRIGER IS NULL THEN
	
		select transaksi, nokas, idtahunbuku, keterangan 
			into xinfo, xnokas, xidtahunbuku, xketerangan
			from jurnal where replid = new.idjurnal;
			
		select p.departemen into xdepartemen
			from besarjtt b, datapenerimaan p
			where b.idpenerimaan = p.replid and b.replid = new.idbesarjtt;
			
		update transaksilog set tanggal = new.tanggal, transaksi = xinfo, petugas = new.petugas, nokas = xnokas, 
			idtahunbuku = xidtahunbuku, keterangan = xketerangan, debet = new.jumlah, kredit = 0 
			where sumber='penerimaanjtt' and idsumber=new.replid;
			
		IF new.tanggal <> old.tanggal THEN
			update jurnal set tanggal = new.tanggal where replid = new.idjurnal;
		END IF;
			
		insert into auditinfo set departemen=xdepartemen, sumber='penerimaanjtt', idsumber=new.replid, tanggal=now(), petugas=new.petugas, alasan=new.alasan;
		
		select last_insert_id() into xidaudit;
		
		insert into auditpenerimaanjtt set statusdata=0, idaudit=xidaudit, replid=old.replid, idbesarjtt=old.idbesarjtt, 
			idjurnal=old.idjurnal, tanggal=old.tanggal, jumlah=old.jumlah, keterangan=old.keterangan, petugas=old.petugas;
			
		insert into auditpenerimaanjtt set statusdata=1, idaudit=xidaudit, replid=new.replid, idbesarjtt=new.idbesarjtt, 
			idjurnal=new.idjurnal, tanggal=new.tanggal, jumlah=new.jumlah, keterangan=new.keterangan, petugas=new.petugas;
		
	END IF;		
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsfina`.`fsync_trdel_penerimaanjtt_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`fsync_trdel_penerimaanjtt_100` AFTER DELETE ON `jbsfina`.`penerimaanjtt`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'penerimaanjtt', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `penerimaanjtt`
--


-- --------------------------------------------------------

--
-- Table structure for table `penerimaanjttcalon`
--

CREATE TABLE IF NOT EXISTS `penerimaanjttcalon` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idbesarjttcalon` int(10) unsigned NOT NULL,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `petugas` varchar(100) DEFAULT NULL,
  `alasan` varchar(500) DEFAULT '" "',
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_penerimaanjttcalon_jurnal` (`idjurnal`),
  KEY `FK_penerimaanjttcalon_besarjtt` (`idbesarjttcalon`),
  KEY `IX_penerimaanjttcalon_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `penerimaanjttcalon`
--
DROP TRIGGER IF EXISTS `jbsfina`.`fsync_trins_penerimaanjttcalon_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`fsync_trins_penerimaanjttcalon_100` BEFORE INSERT ON `jbsfina`.`penerimaanjttcalon`
 FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsfina`.`trins_penerimaanjttcalon_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`trins_penerimaanjttcalon_100` AFTER INSERT ON `jbsfina`.`penerimaanjttcalon`
 FOR EACH ROW BEGIN
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xdepartemen varchar(25);
    
    select transaksi, nokas, idtahunbuku, keterangan 
    	into xinfo, xnokas, xidtahunbuku, xketerangan 
    	from jurnal where replid = new.idjurnal;
    
    select p.departemen into xdepartemen
    	from besarjttcalon b, datapenerimaan p
    	where b.idpenerimaan = p.replid and b.replid = new.idbesarjttcalon;
    
    insert into transaksilog set sumber='penerimaanjttcalon', idsumber=new.replid, 
    	tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
    	idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=new.jumlah, kredit=0, departemen=xdepartemen;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsfina`.`fsync_trupd_penerimaanjttcalon_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`fsync_trupd_penerimaanjttcalon_100` BEFORE UPDATE ON `jbsfina`.`penerimaanjttcalon`
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
DROP TRIGGER IF EXISTS `jbsfina`.`trupd_penerimaanjttcalon_101`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`trupd_penerimaanjttcalon_101` AFTER UPDATE ON `jbsfina`.`penerimaanjttcalon`
 FOR EACH ROW BEGIN
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xidaudit int;
    declare xdepartemen varchar(25);
	
	IF @DISABLE_TRIGER IS NULL THEN
	
		select transaksi, nokas, idtahunbuku, keterangan 
			into xinfo, xnokas, xidtahunbuku, xketerangan
			from jurnal where replid = new.idjurnal;
			
		select p.departemen into xdepartemen
			from besarjttcalon b, datapenerimaan p
			where b.idpenerimaan = p.replid and b.replid = new.idbesarjttcalon;
			
		update transaksilog set tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
			idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=new.jumlah, kredit=0 
			where sumber='penerimaanjttcalon' and idsumber=new.replid;
		
		IF new.tanggal <> old.tanggal THEN
			update jurnal set tanggal = new.tanggal where replid = new.idjurnal;
		END IF;
			
		insert into auditinfo set departemen=xdepartemen, sumber='penerimaanjttcalon', idsumber=new.replid, tanggal=now(), petugas=  new.petugas, alasan=new.alasan;
		
		select last_insert_id() into xidaudit;
		
		insert into auditpenerimaanjttcalon set statusdata=0, idaudit=xidaudit, replid=old.replid, idbesarjttcalon=old.idbesarjttcalon, idjurnal=old.idjurnal, tanggal=old.tanggal, jumlah=old.jumlah, keterangan=old.keterangan, petugas=old.petugas;
		
		insert into auditpenerimaanjttcalon set statusdata=1, idaudit=xidaudit, replid=new.replid, idbesarjttcalon=new.idbesarjttcalon, idjurnal=new.idjurnal, tanggal=new.tanggal, jumlah=new.jumlah, keterangan=new.keterangan, petugas=new.petugas;

	END IF;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsfina`.`fsync_trdel_penerimaanjttcalon_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`fsync_trdel_penerimaanjttcalon_100` AFTER DELETE ON `jbsfina`.`penerimaanjttcalon`
 FOR EACH ROW BEGIN
  IF @DISABLE_TRIGER IS NULL THEN
     INSERT INTO jbsclient.deleteddata SET token = FLOOR(1 + (RAND() * 65530)), dbname = 'jbsfina', tablename = 'penerimaanjttcalon', dataid = OLD.replid, datatoken = OLD.token;
  END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `penerimaanjttcalon`
--


-- --------------------------------------------------------

--
-- Table structure for table `penerimaanlain`
--

CREATE TABLE IF NOT EXISTS `penerimaanlain` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idjurnal` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `petugas` varchar(100) DEFAULT NULL,
  `idpenerimaan` int(10) unsigned NOT NULL,
  `sumber` varchar(100) NOT NULL,
  `alasan` varchar(500) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_pembayaranlain_jurnal` (`idjurnal`),
  KEY `FK_pembayaranlain_datapenerimaan` (`idpenerimaan`),
  KEY `IX_penerimaanlain_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `penerimaanlain`
--
DROP TRIGGER IF EXISTS `jbsfina`.`trins_penerimaanlain_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`trins_penerimaanlain_100` AFTER INSERT ON `jbsfina`.`penerimaanlain`
 FOR EACH ROW BEGIN
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xdepartemen varchar(25);
	
    select transaksi, nokas, idtahunbuku, keterangan 
    	into xinfo, xnokas, xidtahunbuku, xketerangan 
    	from jurnal where replid = new.idjurnal;
    
    select departemen into xdepartemen
    	from datapenerimaan
    	where replid = new.idpenerimaan; 
		
    insert into transaksilog set sumber='penerimaanlain', idsumber=new.replid, 
    	tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
    	idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=new.jumlah, kredit=0, departemen=xdepartemen;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsfina`.`trupd_penerimaanlain_101`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`trupd_penerimaanlain_101` AFTER UPDATE ON `jbsfina`.`penerimaanlain`
 FOR EACH ROW BEGIN
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xidaudit int;
    declare xdepartemen varchar(25);
	
	IF @DISABLE_TRIGER IS NULL THEN
	
		select transaksi, nokas, idtahunbuku, keterangan 
			into xinfo, xnokas, xidtahunbuku, xketerangan 
			from jurnal where replid = new.idjurnal;
			
		select departemen into xdepartemen
			from datapenerimaan
			where replid = new.idpenerimaan; 
			
		update transaksilog set tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
			idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=new.jumlah, kredit=0 
			where sumber='penerimaanlain' and idsumber=new.replid;
		
		IF new.tanggal <> old.tanggal THEN
			update jurnal set tanggal = new.tanggal where replid = new.idjurnal;
		END IF;	
		
		insert into auditinfo set departemen=xdepartemen, sumber='penerimaanlain', idsumber=new.replid, tanggal=now(), petugas=new.petugas, alasan=new.alasan;
		
		select last_insert_id() into xidaudit;
		
		insert into auditpenerimaanlain set statusdata=0, idaudit=xidaudit, replid=old.replid, idjurnal=old.idjurnal, 
			tanggal=old.tanggal, jumlah=old.jumlah, keterangan=old.keterangan, petugas=old.petugas, idpenerimaan=old.idpenerimaan,
			sumber=old.sumber;
			
		insert into auditpenerimaanlain set statusdata=1, idaudit=xidaudit, replid=new.replid, idjurnal=new.idjurnal, 
			tanggal=new.tanggal, jumlah=new.jumlah, keterangan=new.keterangan, petugas=new.petugas, idpenerimaan=new.idpenerimaan,
			sumber=new.sumber;
		
	END IF;
END
//
DELIMITER ;

--
-- Dumping data for table `penerimaanlain`
--


-- --------------------------------------------------------

--
-- Table structure for table `pengeluaran`
--

CREATE TABLE IF NOT EXISTS `pengeluaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpengeluaran` int(10) unsigned NOT NULL,
  `keperluan` varchar(255) NOT NULL,
  `jenispemohon` tinyint(1) unsigned NOT NULL,
  `nip` varchar(20) DEFAULT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `pemohonlain` int(10) unsigned DEFAULT NULL,
  `penerima` varchar(100) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `tanggalkeluar` datetime NOT NULL,
  `jumlah` decimal(15,0) NOT NULL,
  `petugas` varchar(45) DEFAULT NULL,
  `idjurnal` int(10) unsigned NOT NULL,
  `keterangan` text,
  `namapemohon` varchar(100) NOT NULL,
  `alasan` varchar(500) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_pengeluaran_nis` (`nis`),
  KEY `FK_pengeluaran_nip` (`nip`),
  KEY `FK_pengeluaran_jurnal` (`idjurnal`),
  KEY `FK_pengeluaran_pemohonlain` (`pemohonlain`),
  KEY `IX_pengeluaran_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `pengeluaran`
--
DROP TRIGGER IF EXISTS `jbsfina`.`trins_pengeluaran_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`trins_pengeluaran_100` AFTER INSERT ON `jbsfina`.`pengeluaran`
 FOR EACH ROW BEGIN
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xdepartemen varchar(25);
	
    select transaksi, nokas, idtahunbuku, keterangan 
    	into xinfo, xnokas, xidtahunbuku, xketerangan 
    	from jurnal where replid = new.idjurnal;
    
    select departemen into xdepartemen
    	from datapengeluaran
    	where replid = new.idpengeluaran;
		
    insert into transaksilog set sumber='pengeluaran', idsumber=new.replid, 
    	tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
    	idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=0, kredit=new.jumlah, departemen=xdepartemen;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `jbsfina`.`trupd_pengeluaran_100`;
DELIMITER //
CREATE TRIGGER `jbsfina`.`trupd_pengeluaran_100` AFTER UPDATE ON `jbsfina`.`pengeluaran`
 FOR EACH ROW BEGIN
    declare xinfo varchar(255);
    declare xnokas varchar(100);
    declare xidtahunbuku int;
    declare xketerangan varchar(255);
    declare xidaudit int;
    declare xdepartemen varchar(25);
	
    select transaksi, nokas, idtahunbuku, keterangan 
    	into xinfo, xnokas, xidtahunbuku, xketerangan 
    	from jurnal where replid = new.idjurnal;
    	
    select departemen into xdepartemen
    	from datapengeluaran
    	where replid = new.idpengeluaran;
		
    update transaksilog set tanggal=new.tanggal, transaksi=xinfo, petugas=new.petugas, nokas=xnokas, 
    	idtahunbuku=xidtahunbuku, keterangan=xketerangan, debet=0, kredit=new.jumlah
    	where sumber='pengeluaran' and idsumber=new.replid;
	
	IF new.tanggal <> old.tanggal THEN
        update jurnal set tanggal = new.tanggal where replid = new.idjurnal;
    END IF;	
    
    insert into auditinfo set departemen=xdepartemen, sumber='pengeluaran', idsumber=new.replid, tanggal=now(), petugas=new.petugas, alasan=new.alasan;
    
    select last_insert_id() into xidaudit;
    
    insert into auditpengeluaran set statusdata=0, idaudit=xidaudit, replid=old.replid, idpengeluaran=old.idpengeluaran, 
    	keperluan=old.keperluan, jenispemohon=old.jenispemohon, nip=old.nip, nis=old.nis, pemohonlain=old.pemohonlain, 
    	penerima=old.penerima, tanggal=old.tanggal, tanggalkeluar=old.tanggalkeluar, jumlah=old.jumlah, petugas=old.petugas,
    	idjurnal=old.idjurnal, keterangan=old.keterangan, namapemohon=old.namapemohon;
    
    insert into auditpengeluaran set statusdata=1, idaudit=xidaudit, replid=new.replid, idpengeluaran=new.idpengeluaran, 
    	keperluan=new.keperluan, jenispemohon=new.jenispemohon, nip=new.nip, nis=new.nis, pemohonlain=new.pemohonlain, 
    	penerima=new.penerima, tanggal=new.tanggal, tanggalkeluar=new.tanggalkeluar, jumlah=new.jumlah, petugas=new.petugas,
    	idjurnal=new.idjurnal, keterangan=new.keterangan, namapemohon=new.namapemohon;
    		
END
//
DELIMITER ;

--
-- Dumping data for table `pengeluaran`
--


-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE IF NOT EXISTS `pengguna` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(20) NOT NULL,
  `tingkat` tinyint(1) unsigned NOT NULL,
  `departemen` varchar(50) CHARACTER SET latin1 NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_pengguna_pegawai` (`nip`),
  KEY `IX_pengguna_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `pengguna`
--


-- --------------------------------------------------------

--
-- Table structure for table `rekakun`
--

CREATE TABLE IF NOT EXISTS `rekakun` (
  `kode` varchar(15) NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`kode`),
  KEY `FK_rekakun_katerekakun` (`kategori`),
  KEY `IX_rekakun_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rekakun`
--

INSERT INTO `rekakun` (`kode`, `kategori`, `nama`, `keterangan`, `info1`, `info2`, `info3`, `ts`, `token`, `issync`) VALUES
('111', 'HARTA', 'Kas', 'Kas yang ada disekolah', NULL, NULL, NULL, '2010-03-02 10:06:53', 18600, 0),
('112', 'HARTA', 'Kas Bank', 'Kas yang ada di bank yang digunakan sekolah', NULL, NULL, NULL, '2010-03-02 10:06:53', 20390, 0),
('113', 'HARTA', 'Kas BOS', 'Kas yang diterima dari sumbangan Bantuan Operasional Sekolah', NULL, NULL, NULL, '2010-03-02 10:06:53', 46147, 0),
('150', 'PIUTANG', 'Piutang Siswa', 'Piutang siswa kepada sekolah', NULL, NULL, NULL, '2010-03-02 10:06:53', 38508, 0),
('151', 'PIUTANG', 'Piutang Karyawan', 'Piutang karyawan kepada sekolah', NULL, NULL, NULL, '2010-03-02 10:06:53', 54096, 0),
('152', 'PIUTANG', 'Piutang Usaha', 'Piutang yang lain kepada sekolah', NULL, NULL, NULL, '2010-03-02 10:06:53', 23895, 0),
('411', 'PENDAPATAN', 'Pendapatan SPP', 'Pendapatan dari pembayaran SPP siswa', NULL, NULL, NULL, '2010-03-02 10:06:53', 22719, 0),
('412', 'PENDAPATAN', 'Pendapatan DSP', 'Pendapatan dari pembayaran DSP siswa', NULL, NULL, NULL, '2010-03-02 10:06:53', 41907, 0),
('413', 'PENDAPATAN', 'Pendapatan Sukarela', 'Pendapatan dari perolehan dana sukarela', NULL, NULL, NULL, '2010-03-02 10:06:53', 10317, 0),
('414', 'PENDAPATAN', 'Pendapatan BOS', 'Pendaptan dari penerimaan sumbangan Bantuan Operasional Sekolah (BOS)', NULL, NULL, NULL, '2010-03-02 10:06:53', 56924, 0),
('500', 'BIAYA', 'Beban Transportasi', 'Beban yang dikeluarkan untuk pembiayaan transportasi', NULL, NULL, NULL, '2010-03-02 10:06:53', 57077, 0),
('501', 'BIAYA', 'Beban Listrik', 'Beban yang dikeluarkan untuk melunasi tagihan PLN', NULL, NULL, NULL, '2010-03-02 10:06:53', 49084, 0),
('502', 'BIAYA', 'Beban Telpon', 'Beban yang dikeluarkan untuk pembiayaan tagihan telpon', NULL, NULL, NULL, '2010-03-02 10:06:53', 8658, 0),
('503', 'BIAYA', 'Beban Internet', 'Beban yang dikeluarkan untuk pembiayaan taghan Internet', NULL, NULL, NULL, '2010-03-02 10:06:53', 27097, 0),
('504', 'BIAYA', 'Beban ATK', 'Beban yang dikeluarkan untuk pembelian rutin ATK', NULL, NULL, NULL, '2010-03-02 10:06:53', 43981, 0),
('611', 'INVENTARIS', 'Peralatan Mengajar', 'Inventaris alat-alat kegiatan belajar mengajar', NULL, NULL, NULL, '2010-03-02 10:06:53', 7554, 0),
('612', 'INVENTARIS', 'Kendaraan', 'Inventaris kendaraan sekolah', NULL, NULL, NULL, '2010-03-02 10:06:53', 36888, 0),
('700', 'MODAL', 'Modal Usaha', 'Modal yang ditanamkan oleh pemodal kepada sekolah', NULL, NULL, NULL, '2010-03-02 10:06:53', 30715, 0),
('900', 'UTANG', 'Utang Usaha', 'Utang sekolah kepada kreditur', NULL, NULL, NULL, '2010-03-02 10:06:53', 42913, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tahunbuku`
--

CREATE TABLE IF NOT EXISTS `tahunbuku` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunbuku` varchar(100) NOT NULL,
  `awalan` varchar(5) NOT NULL,
  `aktif` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `cacah` bigint(20) unsigned NOT NULL DEFAULT '0',
  `departemen` varchar(50) NOT NULL,
  `tanggalmulai` date NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_tahunbuku_departemen` (`departemen`),
  KEY `IX_tahunbuku_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `tahunbuku`
--


-- --------------------------------------------------------

--
-- Table structure for table `transaksilog`
--

CREATE TABLE IF NOT EXISTS `transaksilog` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sumber` varchar(45) NOT NULL,
  `idsumber` int(10) unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `transaksi` varchar(255) NOT NULL,
  `petugas` varchar(100) NOT NULL,
  `nokas` varchar(100) NOT NULL,
  `idtahunbuku` int(10) unsigned NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `debet` decimal(15,0) NOT NULL DEFAULT '0',
  `kredit` decimal(15,0) NOT NULL DEFAULT '0',
  `departemen` varchar(25) NOT NULL,
  `info1` varchar(255) DEFAULT NULL,
  `info2` varchar(255) DEFAULT NULL,
  `info3` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` smallint(5) unsigned NOT NULL DEFAULT '0',
  `issync` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `FK_transaksilog_departemen` (`departemen`),
  KEY `IX_transaksilog_ts` (`ts`,`issync`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `transaksilog`
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `auditbesarjtt`
--
ALTER TABLE `auditbesarjtt`
  ADD CONSTRAINT `FK_auditbesarjtt_auditinfo` FOREIGN KEY (`idaudit`) REFERENCES `auditinfo` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auditbesarjttcalon`
--
ALTER TABLE `auditbesarjttcalon`
  ADD CONSTRAINT `FK_auditbesarjttcalon_auditinfo` FOREIGN KEY (`idaudit`) REFERENCES `auditinfo` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auditinfo`
--
ALTER TABLE `auditinfo`
  ADD CONSTRAINT `FK_auditinfo_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE;

--
-- Constraints for table `auditjurnal`
--
ALTER TABLE `auditjurnal`
  ADD CONSTRAINT `FK_auditjurnal_auditinfo` FOREIGN KEY (`idaudit`) REFERENCES `auditinfo` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auditjurnaldetail`
--
ALTER TABLE `auditjurnaldetail`
  ADD CONSTRAINT `FK_auditjurnaldetail_auditinfo` FOREIGN KEY (`idaudit`) REFERENCES `auditinfo` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auditpenerimaaniuran`
--
ALTER TABLE `auditpenerimaaniuran`
  ADD CONSTRAINT `FK_auditpenerimaaniuran_auditinfo` FOREIGN KEY (`idaudit`) REFERENCES `auditinfo` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auditpenerimaaniurancalon`
--
ALTER TABLE `auditpenerimaaniurancalon`
  ADD CONSTRAINT `FK_auditpenerimaaniurancalon_audit` FOREIGN KEY (`idaudit`) REFERENCES `auditinfo` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auditpenerimaanjtt`
--
ALTER TABLE `auditpenerimaanjtt`
  ADD CONSTRAINT `FK_auditpenerimaanjtt_auditinfo` FOREIGN KEY (`idaudit`) REFERENCES `auditinfo` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auditpenerimaanjttcalon`
--
ALTER TABLE `auditpenerimaanjttcalon`
  ADD CONSTRAINT `FK_auditpenerimaanjttcalon_auditinfo` FOREIGN KEY (`idaudit`) REFERENCES `auditinfo` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auditpenerimaanlain`
--
ALTER TABLE `auditpenerimaanlain`
  ADD CONSTRAINT `FK_auditpenerimaanlain_auditinfo` FOREIGN KEY (`idaudit`) REFERENCES `auditinfo` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auditpengeluaran`
--
ALTER TABLE `auditpengeluaran`
  ADD CONSTRAINT `FK_auditpengeluaran_auditinfo` FOREIGN KEY (`idaudit`) REFERENCES `auditinfo` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `FK_barang_kelompok` FOREIGN KEY (`idkelompok`) REFERENCES `kelompokbarang` (`replid`) ON UPDATE CASCADE;

--
-- Constraints for table `besarjtt`
--
ALTER TABLE `besarjtt`
  ADD CONSTRAINT `FK_besarjtt_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_pembayaranjtt_penerimaan` FOREIGN KEY (`idpenerimaan`) REFERENCES `datapenerimaan` (`replid`) ON UPDATE CASCADE;

--
-- Constraints for table `besarjttcalon`
--
ALTER TABLE `besarjttcalon`
  ADD CONSTRAINT `FK_besarjttcalon_calonsiswa` FOREIGN KEY (`idcalon`) REFERENCES `jbsakad`.`calonsiswa` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_besarjttcalon_penerimaan` FOREIGN KEY (`idpenerimaan`) REFERENCES `datapenerimaan` (`replid`) ON UPDATE CASCADE;

--
-- Constraints for table `datapenerimaan`
--
ALTER TABLE `datapenerimaan`
  ADD CONSTRAINT `FK_datapenerimaan_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_datapenerimaan_kategoripenerimaan` FOREIGN KEY (`idkategori`) REFERENCES `kategoripenerimaan` (`kode`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_datapenerimaan_rekakun_kas` FOREIGN KEY (`rekkas`) REFERENCES `rekakun` (`kode`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_datapenerimaan_rekakun_pendapatan` FOREIGN KEY (`rekpendapatan`) REFERENCES `rekakun` (`kode`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_datapenerimaan_rekakun_piutang` FOREIGN KEY (`rekpiutang`) REFERENCES `rekakun` (`kode`) ON UPDATE CASCADE;

--
-- Constraints for table `datapengeluaran`
--
ALTER TABLE `datapengeluaran`
  ADD CONSTRAINT `FK_datapengeluaran_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_datapengeluaran_rekakun` FOREIGN KEY (`rekdebet`) REFERENCES `rekakun` (`kode`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_datapengeluaran_rekakun2` FOREIGN KEY (`rekkredit`) REFERENCES `rekakun` (`kode`) ON UPDATE CASCADE;

--
-- Constraints for table `jurnal`
--
ALTER TABLE `jurnal`
  ADD CONSTRAINT `FK_jurnal_tahunbuku` FOREIGN KEY (`idtahunbuku`) REFERENCES `tahunbuku` (`replid`) ON UPDATE CASCADE;

--
-- Constraints for table `jurnaldetail`
--
ALTER TABLE `jurnaldetail`
  ADD CONSTRAINT `FK_jurnaldetail_jurnal` FOREIGN KEY (`idjurnal`) REFERENCES `jurnal` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kelompokbarang`
--
ALTER TABLE `kelompokbarang`
  ADD CONSTRAINT `FK_kelompokbarang_group` FOREIGN KEY (`idgroup`) REFERENCES `groupbarang` (`replid`) ON UPDATE CASCADE;

--
-- Constraints for table `penerimaaniuran`
--
ALTER TABLE `penerimaaniuran`
  ADD CONSTRAINT `FK_pembayaraniuran_datapenerimaan` FOREIGN KEY (`idpenerimaan`) REFERENCES `datapenerimaan` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_pembayaraniuran_jurnal` FOREIGN KEY (`idjurnal`) REFERENCES `jurnal` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_pembayaraniuran_siswa` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE;

--
-- Constraints for table `penerimaaniurancalon`
--
ALTER TABLE `penerimaaniurancalon`
  ADD CONSTRAINT `FK_penerimaaniurancalon_calon` FOREIGN KEY (`idcalon`) REFERENCES `jbsakad`.`calonsiswa` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_penerimaaniurancalon_datapenerimaan` FOREIGN KEY (`idpenerimaan`) REFERENCES `datapenerimaan` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_penerimaaniurancalon_jurnal` FOREIGN KEY (`idjurnal`) REFERENCES `jurnal` (`replid`) ON UPDATE CASCADE;

--
-- Constraints for table `penerimaanjtt`
--
ALTER TABLE `penerimaanjtt`
  ADD CONSTRAINT `FK_pembayaranjtt_besatjtt` FOREIGN KEY (`idbesarjtt`) REFERENCES `besarjtt` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_pembayaranjtt_jurnal` FOREIGN KEY (`idjurnal`) REFERENCES `jurnal` (`replid`) ON UPDATE CASCADE;

--
-- Constraints for table `penerimaanjttcalon`
--
ALTER TABLE `penerimaanjttcalon`
  ADD CONSTRAINT `FK_penerimaanjttcalon_besarjttcalon` FOREIGN KEY (`idbesarjttcalon`) REFERENCES `besarjttcalon` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_penerimaanjttcalon_jurnal` FOREIGN KEY (`idjurnal`) REFERENCES `jurnal` (`replid`) ON UPDATE CASCADE;

--
-- Constraints for table `penerimaanlain`
--
ALTER TABLE `penerimaanlain`
  ADD CONSTRAINT `FK_pembayaranlain_datapenerimaan` FOREIGN KEY (`idpenerimaan`) REFERENCES `datapenerimaan` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_pembayaranlain_jurnal` FOREIGN KEY (`idjurnal`) REFERENCES `jurnal` (`replid`) ON UPDATE CASCADE;

--
-- Constraints for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD CONSTRAINT `FK_pengeluaran_jurnal` FOREIGN KEY (`idjurnal`) REFERENCES `jurnal` (`replid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_pengeluaran_nip` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_pengeluaran_nis` FOREIGN KEY (`nis`) REFERENCES `jbsakad`.`siswa` (`nis`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_pengeluaran_pemohonlain` FOREIGN KEY (`pemohonlain`) REFERENCES `pemohonlain` (`replid`) ON UPDATE CASCADE;

--
-- Constraints for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD CONSTRAINT `FK_pengguna_pegawai` FOREIGN KEY (`nip`) REFERENCES `jbssdm`.`pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rekakun`
--
ALTER TABLE `rekakun`
  ADD CONSTRAINT `FK_rekakun_katerekakun` FOREIGN KEY (`kategori`) REFERENCES `katerekakun` (`kategori`) ON UPDATE CASCADE;

--
-- Constraints for table `tahunbuku`
--
ALTER TABLE `tahunbuku`
  ADD CONSTRAINT `FK_tahunbuku_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE;

--
-- Constraints for table `transaksilog`
--
ALTER TABLE `transaksilog`
  ADD CONSTRAINT `FK_transaksilog_departemen` FOREIGN KEY (`departemen`) REFERENCES `jbsakad`.`departemen` (`departemen`) ON UPDATE CASCADE;
