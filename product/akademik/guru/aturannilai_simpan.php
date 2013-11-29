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
require_once('../include/errorhandler.php');
require_once('../include/sessioninfo.php');
require_once('../include/theme.php');
require_once('../include/common.php');
require_once('../include/config.php');
require_once('../include/db_functions.php');

if (isset($_REQUEST['idtingkat']))
	$idtingkat = $_REQUEST['idtingkat'];
if (isset($_REQUEST['nip']))
	$nip = $_REQUEST['nip'];
if (isset($_REQUEST['id']))
	$id = $_REQUEST['id'];	
if (isset($_REQUEST['aspek']))
	$aspek = $_REQUEST['aspek'];

BeginTrans();	
$success=0;
if ($_REQUEST['action'] == 'Update') {
	OpenDb();
	$sql = "DELETE FROM aturangrading WHERE idpelajaran = $id AND nipguru = '$nip' AND idtingkat = $idtingkat AND dasarpenilaian = '$aspek'";
	$result = QueryDbTrans($sql,$success);	
} else {	
	OpenDb();
	$sql = "SELECT * FROM guru g, pelajaran j, dasarpenilaian d, tingkat t, aturangrading a WHERE a.nipguru=g.nip AND a.idpelajaran = j.replid AND a.dasarpenilaian = d.dasarpenilaian AND a.idtingkat = t.replid AND a.idpelajaran = $id AND a.nipguru = '$nip' AND a.idtingkat = $idtingkat AND a.dasarpenilaian = '$aspek'"; 
	
	$result = QueryDbTrans($sql,$success);
	//$result = QueryDb($sql);
	
	if (mysql_num_rows($result) > 0) {
		CloseDb();		
		?>
		<script language="javascript">
			//alert ('Aturan sudah digunakan, silakan Gunakan menu "Ubah/Edit"');
			alert ('Aspek <?=$aspek?> sudah digunakan!');
			window.self.history.back();
			//opener.document.location.href="aturannilai_content.php?id=<?=$id?>&nip=<?=$nip?>";
			//window.close();
		</script>
		<?
		exit;
	} 
} 		

CloseDb();

for ($i=1;$i<=10;$i++) {
	$nmin = $_REQUEST['nmin'.$i];
	$nmax = $_REQUEST['nmax'.$i];
	$grade = strtoupper($_REQUEST['grade'.$i]);

	if (strlen($nmin) > 0 && strlen($nmax) > 0 && strlen($grade) > 0) {

	OpenDb();
	$sql1 = "INSERT INTO aturangrading SET nipguru='$nip',idtingkat=$idtingkat,idpelajaran=$id,dasarpenilaian='$aspek',nmin=$nmin,nmax=$nmax,grade='$grade'";
	//echo $sql1."<br>";
	if ($success)
		QueryDbTrans($sql1,$success);
	
	CloseDb();
	}
}

if ($success) { 
	CommitTrans();
	?>
	<script language="javascript">
        //alert ('Bisa geuning');
        opener.document.location.href="aturannilai_content.php?id=<?=$id?>&nip=<?=$nip?>";
        window.close();
    </script>
<?	
} else { 
	RollbackTrans();
?>
	<script language="javascript">
        alert ('Data gagal disimpan !');
        //opener.document.location.href="aturannilai_content.php?id=<?=$id?>&nip=<?=$nip?>";
        window.close();
    </script>
<?
}
CloseDb();
?>