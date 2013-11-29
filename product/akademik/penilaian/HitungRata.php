<?
/**[N]**
 * JIBAS Road To Community
 * Jaringan Informasi Bersama Antar Sekolah
 * 
 * @version: 2.4.1 (January 7, 2011)
 * @notes: JIBAS Education Community will be managed by Yayasan Indonesia Membaca (http://www.indonesiamembaca.net)
 * 
 * Copyright (C) 2009 PT.Galileo Mitra Solusitama (http://www.galileoms.com)
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 **[N]**/ ?>
<?
require_once('../include/sessioninfo.php');
require_once('../include/common.php');
require_once('../include/config.php');
require_once('../include/db_functions.php');
OpenDb();
function HitungRataSiswa($idkelas,$idsemester,$idaturan,$nis){
	$sql	= "SELECT replid,idpelajaran,idjenis FROM ujian WHERE idkelas=$idkelas AND idsemester=$idsemester AND idaturan=$idaturan";
	$result	= QueryDb($sql);
	$cnt	= 0;
	while ($row	= @mysql_fetch_row($result)){
		$idujian= $row[0];
		$idpelajaran= $row[1];
		$idjenis= $row[2];

		$sql2	= "SELECT nilaiujian FROM nilaiujian WHERE idujian='$idujian' AND nis='$nis'";
		$result2= QueryDb($sql2);
		$row2	= @mysql_fetch_row($result2);
		$nilai	+= $row2[0];
		$cnt++;
	}
	$rataus = round($nilai/$cnt,2);
	$sql = "SELECT * FROM rataus WHERE idsemester='$idsemester' AND idkelas='$idkelas' AND idjenis='$idjenis' AND idpelajaran='$idpelajaran'  AND idaturan='$idaturan' AND nis='$nis'";
	$result = QueryDb($sql);
	$num = @mysql_num_rows($result);
	if ($num==0){
		$sql2 = "INSERT INTO rataus SET idsemester='$idsemester', idkelas='$idkelas', idjenis='$idjenis', idpelajaran='$idpelajaran', idaturan='$idaturan', nis='$nis', rataUS='$rataus'";
	} else {
		$sql2 = "UPDATE rataus SET rataUS='$rataus' WHERE idsemester='$idsemester' AND idkelas='$idkelas' AND idjenis='$idjenis' AND idpelajaran='$idpelajaran'  AND idaturan='$idaturan' AND nis='$nis'";
	}
	QueryDb($sql2);
}
function HitungRataKelas($idkelas,$idsemester,$idaturan){
	$sql	= "SELECT replid,idpelajaran,idjenis FROM ujian WHERE idkelas=$idkelas AND idsemester=$idsemester AND idaturan=$idaturan";
	$result	= QueryDb($sql);
	while ($row	= @mysql_fetch_row($result)){
		$idujian= $row[0];
		$sql2	= "SELECT nilaiujian FROM nilaiujian WHERE idujian='$idujian'";
		$result2= QueryDb($sql2);
		$i		= 0;
		$nilai  = 0;
		while ($row2 = @mysql_fetch_row($result2)){
			$nilai	+= $row2[0];
			$i++;
		}
		$ratauk = round($nilai/$i,2);
		
		$sql2 = "SELECT * FROM ratauk WHERE idsemester='$idsemester' AND idkelas='$idkelas' AND idujian='$idujian'";
		$result2 = QueryDb($sql2);
		$num2 = @mysql_num_rows($result2);
		if ($num2==0){
			$sql3 = "INSERT INTO ratauk SET idsemester='$idsemester', idkelas='$idkelas', idujian='$idujian', nilaiRK='$ratauk'";
		} else {
			$sql3 = "UPDATE ratauk SET nilaiRK='$ratauk' WHERE idsemester='$idsemester' AND idkelas='$idkelas' AND idujian='$idujian'";
		}
		QueryDb($sql3);
	}
}
function GetRataKelas($idkelas,$idsemester,$idujian){
	$sql	= "SELECT nilaiRK FROM ratauk WHERE idsemester='$idsemester' AND idkelas='$idkelas' AND idujian='$idujian'";
	$result = QueryDb($sql);
	$num	= @mysql_num_rows($result);
	$row	= @mysql_fetch_row($result);
	if ($num==0)
		echo '0';
	else
		echo round($row[0],2);
}
function GetRataSiswa($idkelas,$idsemester,$idaturan,$nis){
	$sql	= "SELECT replid,idpelajaran,idjenis FROM ujian WHERE idkelas=$idkelas AND idsemester=$idsemester AND idaturan=$idaturan";
	$result	= QueryDb($sql);
	$cnt	= 0;
	while ($row	= @mysql_fetch_row($result)){
		$idujian= $row[0];
		$idpelajaran= $row[1];
		$idjenis= $row[2];

		$sql2	= "SELECT nilaiujian FROM nilaiujian WHERE idujian='$idujian' AND nis='$nis'";
		$result2= QueryDb($sql2);
		$row2	= @mysql_fetch_row($result2);
		$nilai	+= (int)$row2[0];
		$cnt++;
	}
	$rataus = $nilai/$cnt;
	$sql = "SELECT rataUS FROM rataus WHERE idsemester='$idsemester' AND idkelas='$idkelas' AND idjenis='$idjenis' AND idpelajaran='$idpelajaran'  AND idaturan='$idaturan' AND nis='$nis'";
	$result = QueryDb($sql);
	$num = @mysql_num_rows($result);
	$row	= @mysql_fetch_row($result);
	if ($num==0)
		echo '0';
	else
		echo round($row[0],2);
}
?>