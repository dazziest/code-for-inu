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

if ($_REQUEST['action'] <> "manual") {	
	BeginTrans();
	$success=0;	

	$sql="SELECT * FROM jbsakad.ujian WHERE idkelas=$_REQUEST[kelas] AND idsemester=$_REQUEST[semester] AND idaturan=$_REQUEST[idaturan] ORDER by tanggal ASC";
	$result_get_ujian=QueryDbTrans($sql,$success);
	//echo $sql." - ".$success."<br>";
	
	for ($i=1;$i<=$_REQUEST['jumujian'];$i++) {
		$ujian = $_REQUEST['ujian'.$i];
		$bobot = $_REQUEST['bobot'.$i];
		$id = $_REQUEST['replid'.$i];
				
		if ($ujian && $bobot) {
			if ($id) {
				$sql1 = "UPDATE bobotnau SET bobot=$bobot WHERE replid = $id";				
				QueryDbTrans($sql1,$success);				
			} else {				
				$sql1 = "INSERT INTO bobotnau SET ".
						"idujian=$ujian, bobot=$bobot, idaturan=$_REQUEST[idaturan]";	
				//echo $sql1." - ".$success."<br>";
				QueryDbTrans($sql1,$success);
			}
		} 

	}
}

///Ambil nis dari siswa berdasarkan kelas
$sql="SELECT idpelajaran, idjenisujian FROM jbsakad.aturannhb WHERE replid=$_REQUEST[idaturan]";
$result=QueryDb($sql);
//echo $sql."<br>";
$row = mysql_fetch_array($result);
$jenis = $row['idjenisujian'];
$pelajaran = $row['idpelajaran'];

$sql_get_nis_siswa="SELECT nis FROM jbsakad.siswa WHERE idkelas=$_REQUEST[kelas] AND aktif = 1 ORDER BY nama ASC ";
$result_get_nis_siswa=QueryDbTrans($sql_get_nis_siswa,$success);
//echo $sql_get_nis_siswa." - ".$success."<br>";

while ($row_get_nis_siswa=@mysql_fetch_array($result_get_nis_siswa)){
	if ($_REQUEST['action'] <> "manual") {	
		//Ambil idujian
		$sql_get_ujian="SELECT replid FROM jbsakad.ujian WHERE idkelas=$_REQUEST[kelas] AND idsemester=$_REQUEST[semester] AND idaturan=$_REQUEST[idaturan]";
		$result_get_ujian=QueryDbTrans($sql_get_ujian,$success);
		
		//echo $sql_get_ujian." - ".$success."<br>";
		$ujian_culip=0;
		$nilai = 0;
		$bobot = 0;
		while ($row_get_ujian=@mysql_fetch_array($result_get_ujian)){			
			//Ambil bobot
			$sql_get_bobot="SELECT bobot FROM jbsakad.bobotnau WHERE idujian='$row_get_ujian[replid]'";
			$result_get_bobot=QueryDbTrans($sql_get_bobot,$success);
			//echo $sql_get_bobot." - ".$success."<br>";
			
			$row_get_bobot=@mysql_fetch_array($result_get_bobot);
			//Ambil nilai ujian
			$sql_get_nilai="SELECT nilaiujian FROM jbsakad.nilaiujian WHERE idujian='$row_get_ujian[replid]' AND nis='$row_get_nis_siswa[nis]'";
			$result_get_nilai=QueryDbTrans($sql_get_nilai,$success);
			//echo $sql_get_nilai." - ".$success."<br>";
			
			$row_get_nilai=@mysql_fetch_array($result_get_nilai);
			//Hitung NA
			$nilai = $nilai + ((int)$row_get_bobot['bobot']*(int)$row_get_nilai['nilaiujian']);
			$bobot = $bobot + (int)$row_get_bobot['bobot'];
					
			$ujian_culip++;
		}		
		$ratabulat = round(($nilai/$bobot),2);	
	 
	
		$sql_get_nau_per_nis="SELECT nilaiAU,replid,keterangan FROM jbsakad.nau WHERE nis='$row_get_nis_siswa[nis]' AND idkelas=$_REQUEST[kelas] AND idsemester=$_REQUEST[semester] AND idaturan=$_REQUEST[idaturan]";
		$result_nau = QueryDb($sql_get_nau_per_nis);
	
		if (mysql_num_rows($result_nau) > 0) {	
			$sql_hapus_nau="DELETE FROM jbsakad.nau WHERE nis='$row_get_nis_siswa[nis]' AND idkelas=$_REQUEST[kelas] AND idsemester=$_REQUEST[semester] AND idaturan=$_REQUEST[idaturan]";
			QueryDbTrans($sql_hapus_nau,$success);
			//echo $sql_hapus_nau." - ".$success."<br>";
		}
		
		$sql_insert_nau="INSERT INTO jbsakad.nau SET nis='$row_get_nis_siswa[nis]',idkelas=$_REQUEST[kelas],idsemester=$_REQUEST[semester],idjenis=$jenis,idpelajaran=$pelajaran, nilaiAU='$ratabulat',idaturan=$_REQUEST[idaturan]";
	
	} else {
		foreach($_REQUEST['nau'] as $key => $value) {			
			if ($key == $row_get_nis_siswa['nis']) {
				if ($value[1]) { 				
					$sql_insert_nau="UPDATE jbsakad.nau SET nilaiAU=$value[0], keterangan = 'Manual' WHERE replid = $value[1]";
				} else { 
					$sql_insert_nau="INSERT INTO jbsakad.nau SET nis='$key',idkelas=$_REQUEST[kelas],idsemester=$_REQUEST[semester],idjenis=$jenis,idpelajaran=$pelajaran, nilaiAU=$value[0],idaturan=$_REQUEST[idaturan],keterangan='Manual'";				
				}
			}		
		}
	}	
	QueryDbTrans($sql_insert_nau,$success);
			
}
	
	if ($success) {
		CommitTrans();			
		?>
		<script language="javascript">
			parent.nilai_pelajaran_content.location.href="nilai_pelajaran_content.php?kelas=<?=$_REQUEST['kelas']?>&semester=<?=$_REQUEST['semester']?>&idaturan=<?=$_REQUEST['idaturan']?>";						
		</script>
		<? 	
	} else {		
		RollbackTrans();		
		?>
		<script language="javascript">
			alert ('Data gagal disimpan');
		</script>
		<? 
	}	
	//Ngoprek...
//}
?>