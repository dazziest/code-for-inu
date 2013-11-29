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
require_once('../include/common.php');
require_once('../include/config.php');
require_once('../include/theme.php');
require_once('../include/db_functions.php');
require_once('../library/departemen.php');
require_once('../cek.php');

OpenDb();

if(isset($_REQUEST["tahun"]))
	$tahun = $_REQUEST["tahun"];
if(isset($_REQUEST["departemen"]))
	$departemen = $_REQUEST["departemen"];
if(isset($_REQUEST["tingkat"]))
	$tingkat = $_REQUEST["tingkat"];
if(isset($_REQUEST["pelajaran"]))
	$pelajaran = $_REQUEST["pelajaran"];
if(isset($_REQUEST["nip"]))
	$nip = $_REQUEST["nip"];
if(isset($_REQUEST["kelas"]))
	$kelas = $_REQUEST["kelas"];
if(isset($_REQUEST["semester"]))
	$semester = $_REQUEST["semester"];
//echo "Pel = ".$pelajaran;
if (isset($_REQUEST["Simpan"])){
	$konter=1;
	$numdata=$_REQUEST["numdata"];
	$nilaimin=$_REQUEST["nilaimin"];
	$Simpan=$_REQUEST["Simpan"];
	
	if ($Simpan=="Ubah"){
		$replid=$_REQUEST["replid"];
		$sql_insert_infonap="UPDATE jbsakad.infonap SET nilaimin='$nilaimin' WHERE replid='$replid'";
		$result_insert_infonap=QueryDb($sql_insert_infonap);
		//echo "1".$replid;
	} elseif ($Simpan=="Simpan"){
		$sql_insert_infonap="INSERT INTO jbsakad.infonap SET idpelajaran='$pelajaran',idsemester='$semester',idkelas='$kelas',nilaimin='$nilaimin'";
		$result_insert_infonap=QueryDb($sql_insert_infonap);
		
		//$sql_get_lastid="SELECT LAST_INSERT_ID(replid) as replid FROM jbsakad.infonap ORDER BY replid DESC LIMIT 1";
		$sql_get_lastid="SELECT LAST_INSERT_ID(replid) as replid FROM jbsakad.infonap ORDER BY replid DESC LIMIT 1";
		$result_get_lastid=QueryDb($sql_get_lastid);
		$row_get_lastid=@mysql_fetch_array($result_get_lastid);
		$replid=$row_get_lastid[replid];
		//echo "2".$replid;
	}
	
	//echo $sql_insert_infonap."<br>";
	
	$sql_delete_nap="DELETE FROM jbsakad.nap WHERE idinfo='$replid'";
	$result_delete_nap=QueryDb($sql_delete_nap);
	?><!--<script language="JavaScript">alert('Hapus nap');</script>--><?	
	//if ($result_delete_nap)
	//echo "1.".$sql_delete_nap."<hr>";
	//echo "2.".$sql_get_lastid."<hr>";

	while ($konter<=$numdata){
		$nis=$_REQUEST["nis_".$konter];
		$p=$_REQUEST["P_".$konter];
		$pk=$_REQUEST["PK_".$konter];
		$gp=$_REQUEST["G_P_".$konter];
		$gpk=$_REQUEST["G_PK_".$konter];
		$predikat=$_REQUEST["predikat_".$konter];
		$sql_get_daspen_praktik="SELECT a.replid as replidpraktik FROM jbsakad.aturannhb a, kelas k WHERE a.nipguru='$nip' AND a.idtingkat=k.idtingkat AND k.replid = $kelas AND a.idpelajaran=$pelajaran AND a.dasarpenilaian='Praktik' ORDER BY a.replid ASC LIMIT 1";
		$result_get_daspen_praktik=QueryDb($sql_get_daspen_praktik);
		$row_get_daspen_praktik=@mysql_fetch_array($result_get_daspen_praktik);
		$idpraktik=$row_get_daspen_praktik[replidpraktik];
		
		//echo "3-".$konter.".".$sql_get_daspen_praktik."<hr>";
		
		if ($idpraktik!="") {
			$sql_insert_nap_praktik="INSERT INTO jbsakad.nap SET nis='$nis',idinfo='$replid',idaturan='$idpraktik',nilaiangka='$p',nilaihuruf='$gp'";
			$result_insert_nap_praktik=QueryDb($sql_insert_nap_praktik);
			//if ($result_insert_nap_praktik)
			//echo "4-".$konter.".".$sql_insert_nap_praktik."<hr>";
		}
		
	
		$sql_get_daspen_pemkonsep="SELECT a.replid as replidpemkonsep FROM jbsakad.aturannhb a, jbsakad.kelas k WHERE a.nipguru='$nip' AND a.idtingkat=k.idtingkat AND k.replid = $kelas AND a.idpelajaran=$pelajaran AND a.dasarpenilaian='Pemahaman Konsep' ORDER BY a.replid ASC LIMIT 1";
		$result_get_daspen_pemkonsep=QueryDb($sql_get_daspen_pemkonsep);
		$row_get_daspen_pemkonsep=@mysql_fetch_array($result_get_daspen_pemkonsep);
		$idpemkonsep=$row_get_daspen_pemkonsep[replidpemkonsep];
	
		//echo "5-".$konter.".".$sql_get_daspen_pemkonsep."<hr>";
		if ($idpemkonsep!="") {
			$sql_insert_nap_pemkonsep="INSERT INTO jbsakad.nap SET nis='$nis',idinfo='$replid',idaturan='$idpemkonsep',nilaiangka='$pk',nilaihuruf='$gpk'";
			$result_insert_nap_pemkonsep=QueryDb($sql_insert_nap_pemkonsep);
			//echo "5a-".$konter.".".$sql_insert_nap_pemkonsep."<hr>";
		}
		
		if ($Simpan=="Simpan"){
			if ($predikat<>0){
				$sql_insert_komennap="INSERT INTO jbsakad.komennap SET nis='$nis',idinfo='$replid',predikat='$predikat',komentar=''";
			} else {
				$sql_insert_komennap="INSERT INTO jbsakad.komennap SET nis='$nis',idinfo='$replid',komentar=''";
			}
				
			$result_insert_komennap=QueryDb($sql_insert_komennap);
		} else if ($Simpan=="Ubah"){
			if ($predikat<>0){
				$sql_insert_komennap="UPDATE jbsakad.komennap SET predikat='$predikat' WHERE nis='$nis' AND idinfo='$replid'";
				$result_insert_komennap=QueryDb($sql_insert_komennap);
			} else {
				$sql_insert_komennap="UPDATE jbsakad.komennap SET predikat='$predikat' WHERE nis='$nis' AND idinfo='$replid'";
				$result_insert_komennap=QueryDb($sql_insert_komennap);
			}
			//echo($sql_insert_komennap."<br>");
			$result_insert_komennap=QueryDb($sql_insert_komennap);
		}
	if ($result_insert_komennap)	
	//echo "6-".$konter.".".$sql_insert_komennap."<hr>";
		$konter++;
	}
	//exit;
	if ($result_insert_infonap){
	?>
	<script language="JavaScript">
		//document.location.href="penentuan_content.php?departemen=<?=$departemen?>&tingkat=<?=$tingkat?>&pelajaran=<?=$pelajaran?>&kelas=<?=$kelas?>&semester=<?=$semester?>&nip=<?=$nip?>&tingkat=<?=$tingkat?>&departemen=<?=$departemen?>&tahun=<?=$tahun?>";
	</script>
	<?
	}
}

if (isset($_REQUEST["op"])){
	$replid=$_REQUEST["replid"];
	$sql_delete="DELETE FROM jbsakad.nap WHERE idinfo='$replid'";
	//echo $sql_delete;
	$result_delete=QueryDb($sql_delete);
	if ($result_delete)
		//echo "Udah dihapus NAPnya<br>";
	$sql_delete="DELETE FROM jbsakad.infonap WHERE replid='$replid'";
	//echo $sql_delete;
	$result_delete=QueryDb($sql_delete);
	if ($result_delete)
		//echo "Udah dihapus INFONAPnya<br>";
	//exit;
	if ($result_delete){
?>
	<script language="JavaScript">
        alert ('Berhasil Menghapus Data');
	document.location.href="penentuan_content.php?departemen=<?=$departemen?>&tingkat=<?=$tingkat?>&pelajaran=<?=$pelajaran?>&kelas=<?=$kelas?>&semester=<?=$semester?>&nip=<?=$nip?>&tahun=<?=$tahun?>";
    </script>
<?
	}
}
//Cek keberadaan infonap
$sql_cek_infonap="SELECT nilaimin,replid FROM jbsakad.infonap WHERE idpelajaran='$pelajaran' AND idsemester='$semester' AND idkelas='$kelas'";
$result_cek_infonap=QueryDb($sql_cek_infonap);
$row_cek_infonap=@mysql_fetch_array($result_cek_infonap);
$infonap_ada=@mysql_num_rows($result_cek_infonap);

//Cari replidinfonap
$sql_get_idinfo = "SELECT replid FROM jbsakad.infonap WHERE idpelajaran=$pelajaran AND idsemester=$semester AND idkelas=$kelas";
$result_get_idinfo = QueryDb($sql_get_idinfo);
$r_get_idinfo = @mysql_fetch_array($result_get_idinfo);
$idinfo = $r_get_idinfo[replid];
//echo $sql_get_idinfo;

//Hitung jumlah bobot Pemahaman konsep
$sql_get_jum_bbt_PK="SELECT SUM(bobot) as bobotPK FROM jbsakad.aturannhb a, kelas k WHERE a.nipguru='$nip' AND a.idtingkat= k.idtingkat AND k.replid = $kelas AND a.idpelajaran=$pelajaran AND a.dasarpenilaian='Pemahaman Konsep' AND a.aktif=1";
$result_get_jum_bbt_PK=QueryDb($sql_get_jum_bbt_PK);
$jum_bbt_PK=@mysql_fetch_array($result_get_jum_bbt_PK);
$bobot_PK=$jum_bbt_PK[bobotPK];

//Hitung jumlah bobot Praktik
$sql_get_jum_bbt_P="SELECT SUM(bobot) as bobotP FROM jbsakad.aturannhb a, kelas k WHERE a.nipguru='$nip' AND a.idtingkat=k.idtingkat AND k.replid = $kelas AND a.idpelajaran=$pelajaran AND a.dasarpenilaian='Praktik' AND a.aktif=1";
//echo $sql_get_jum_bbt_P;
$result_get_jum_bbt_P=QueryDb($sql_get_jum_bbt_P);
$jum_bbt_P=@mysql_fetch_array($result_get_jum_bbt_P);
$bobot_P=$jum_bbt_P[bobotP];

$sql_get_jum_nhb="SELECT * FROM jbsakad.aturannhb a, kelas k WHERE a.nipguru='$nip' AND a.idtingkat=k.idtingkat AND k.replid = $kelas AND a.idpelajaran=$pelajaran AND a.aktif=1";
//echo $sql_get_jum_nhb;
$result_get_jum_nhb=QueryDb($sql_get_jum_nhb);
$jum_nhb=@mysql_num_rows($result_get_jum_nhb);

$sql_get_aturan_PK="SELECT j.jenisujian as jenisujian, a.bobot as bobot, a.replid, a.idjenisujian FROM jbsakad.aturannhb a, jbsakad.jenisujian j, kelas k WHERE a.idtingkat=k.idtingkat AND k.replid = $kelas AND a.nipguru='$nip' AND a.idpelajaran=$pelajaran AND a.dasarpenilaian='Pemahaman Konsep' AND a.idjenisujian=j.replid AND a.aktif = 1 ORDER BY a.replid";
//echo "<br>".$sql_get_aturan_PK;
$result_get_aturan_PK=QueryDb($sql_get_aturan_PK);
$jum_PK=@mysql_num_rows($result_get_aturan_PK);

$sql_get_aturan_P="SELECT j.jenisujian as jenisujian, a.bobot as bobot, a.replid, a.idjenisujian FROM jbsakad.aturannhb a, jbsakad.jenisujian j, kelas k WHERE a.idtingkat=k.idtingkat AND k.replid = $kelas AND a.nipguru='$nip' AND a.idpelajaran=$pelajaran AND a.dasarpenilaian='Praktik' AND a.idjenisujian=j.replid AND a.aktif=1 ORDER BY a.replid";
$result_get_aturan_P=QueryDb($sql_get_aturan_P);
$jum_P=@mysql_num_rows($result_get_aturan_P);

//echo "<br>".$sql_get_aturan_P;
//Ambil nilai grading Pemahaman Konsep
$sql_get_all_grade="SELECT grade FROM aturangrading a, kelas k WHERE a.idpelajaran=$pelajaran AND a.idtingkat=k.idtingkat AND k.replid = $kelas AND a.dasarpenilaian='Pemahaman Konsep' AND a.nipguru='$nip' ORDER BY nmin DESC";
$result_get_grade=QueryDb($sql_get_all_grade);
$cntgrad=0;
while ($row_get_all_grade=@mysql_fetch_array($result_get_grade)){
	$grading[$cntgrad]=$row_get_all_grade['grade'];
	$cntgrad++;
}

//Ambil nilai grading Praktik
$sql_get_grade_praktik="SELECT grade FROM aturangrading a, kelas k WHERE a.idpelajaran=$pelajaran AND a.idtingkat=k.idtingkat AND k.replid = $kelas AND a.dasarpenilaian='Praktik' AND a.nipguru='$nip' ORDER BY nmin DESC";
$result_get_grade_praktik=QueryDb($sql_get_grade_praktik);
$cntgrad1=0;
while ($row_get_grade_praktik=@mysql_fetch_array($result_get_grade_praktik)){
	$grading1[$cntgrad1]=$row_get_grade_praktik['grade'];
	$cntgrad1++;
}

//echo "bobot_PK=".$bobot_PK."<br>";
//echo "bobot_P=".$bobot_P."<br>";
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Perhitungan Rapor [Content]</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../style/style.css">
<link rel="stylesheet" type="text/css" href="../style/tooltips.css">
<script src="../script/SpryValidationSelect.js" type="text/javascript"></script>
<link href="../script/SpryValidationSelect.css" rel="stylesheet" type="text/css" />
<script src="../script/SpryValidationTextField.js" type="text/javascript"></script>
<link href="../script/SpryValidationTextField.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../script/tooltips.js"></script>
<script language="JavaScript" src="../script/tools.js"></script>
<script language="JavaScript" src="../script/tables.js"></script>
<script language="JavaScript">

function cek(){
	var nilaimin=document.getElementById("nilaimin").value;
	
	if (nilaimin.length==0){
		alert ('Anda harus memasukan Nilai Standar Kelulusan');
		document.getElementById("nilaimin").focus();
		return false;
	} else {	
		if (isNaN(nilaimin)){
			alert ('Nilai Standar Kelulusan berupa bilangan!');			
			document.getElementById("nilaimin").focus();
			return false;
		}
		if (parseInt(nilaimin)>100){
			alert ('Rentang Nilai antara 0 - 100!');
			document.getElementById("nilaimin").focus();
			return false;
		}
	}

	var numdata=document.getElementById("numdata").value;
	var counter=1;
	while (counter <= numdata){
		var nis=document.getElementById("nis_"+counter).value;
		var pk=document.getElementById("PK_"+counter).value;
		var gpk=document.getElementById("G_PK_"+counter).value;
		var p=document.getElementById("P_"+counter).value;
		var gp=document.getElementById("G_P_"+counter).value;
		//alert ('NIS='+nis+' ,Nil PK='+pk+' ,Grade PK='+gpk+' ,Nil P='+p+' ,Grade P='+gp);
		counter++;
	}
	return true;
}

function hapus(replid){
	if (confirm('Anda yakin akan menghapus data nilai dan komentar siswa di kelas ini?'))
		document.location.href="penentuan_content.php?op=dw984j5hx3vbdc&replid="+replid+"&pelajaran=<?=$pelajaran?>&departemen=<?=$departemen?>&kelas=<?=$kelas?>&nip=<?=$nip?>&semester=<?=$semester?>&tingkat=<?=$tingkat?>&tahun=<?=$tahun?>";
}

function cetak_excel(){
	newWindow('penentuan_cetak_excel.php?pelajaran=<?=$pelajaran?>&departemen=<?=$departemen?>&kelas=<?=$kelas?>&nip=<?=$nip?>&semester=<?=$semester?>&tingkat=<?=$tingkat?>&tahun=<?=$tahun?>','CetakExcel','100','100','resizable=1,scrollbars=1,status=0,toolbar=0');
}

function detail(replid){
	newWindow('../library/detail_siswa.php?replid='+replid, 'DetailSiswa','660','657','resizable=1,scrollbars=1,status=0,toolbar=0');
}

function focusNext(elemName, evt) {
    evt = (evt) ? evt : event;
    var charCode = (evt.charCode) ? evt.charCode :
        ((evt.which) ? evt.which : evt.keyCode);
    if (charCode == 13) {
		document.getElementById(elemName).focus();
        return false;
    }
    return true;
}

function panggil(elem, total){	
	var x, y, i, z, m, n, g;
	var lain = new Array();
	lain[0] = "nilaimin";
	for (x=1;x<=total;x++){
		//var z = parseInt(x)+1;
		lain[x] = "PK_"+x;
		y = parseInt(total) + 1 + x ;
		lain[y] = "G_PK_"+x;
		m = parseInt(total) + y;
		lain[m] = "P_"+x;
		n = parseInt(total) + m;
		lain[n] = "G_P_"+x;
		g = parseInt(total) + n;
		lain[g] = "predikat_"+x;
	}
	
	for (i=0;i<lain.length;i++) {
		if (lain[i] == elem) {
			document.getElementById(elem).style.background='#4cff15';
		} else {
			document.getElementById(lain[i]).style.background='#FFFFFF';
		}
	}
	
}

</script>

<style type="text/css">
<!--
.style1 {color: #FFFF00}
.style3 {color: #00FFFF}
-->
</style>
</head>
<body topmargin="0" leftmargin="0" onLoad="document.getElementById('PK_1').focus()">
<form action="penentuan_content.php" method="get" onSubmit="return cek()">
<input type="hidden" name="pelajaran" id="pelajaran" value="<?=$pelajaran?>">
<input type="hidden" name="kelas" id="kelas" value="<?=$kelas?>">	 
<input type="hidden" name="semester" id="semester" value="<?=$semester?>">
<input type="hidden" name="nip" id="nip" value="<?=$nip?>">
<input type="hidden" name="tingkat" id="tingkat" value="<?=$tingkat?>">	 
<input type="hidden" name="departemen" id="departemen" value="<?=$departemen?>">
<input type="hidden" name="tahun" id="tahun" value="<?=$tahun?>">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td valign="top" background="" style="background-repeat:no-repeat; background-attachment:fixed">
    <table width="100%" border="0" height="100%">
	<tr>
    	<td align="right">
         <a href="#" style="cursor:pointer" onClick="document.location.reload()"><img src="../images/ico/refresh.png" border="0" onMouseOver="showhint('Refresh!', this, event, '50px')"/>&nbsp;Refresh</a>&nbsp;&nbsp;
         <a href="JavaScript:cetak_excel()"><img src="../images/ico/excel.png" border="0" onMouseOver="showhint('Cetak dalam format Excel!', this, event, '80px')"/>&nbsp;Cetak Excel</a>
    	</td>
   	</tr>
    </table>
    <br />    
	<table width="100%" border="1" class="tab" id="table" bordercolor="#000000">  
  	<tr align="center">
    	<td height="30" class="headerlong" width="4%" rowspan="2">No</td>
        <td height="30" class="headerlong" width="10%" rowspan="2">N I S</td>
        <td height="30" class="headerlong" width="*" rowspan="2">Nama</td>    	    
        <td height="15" colspan="<?=(int)$jum_P+$jum_PK?>" class="headerlong">Nilai Akhir</td>
        <?	if ($bobot_PK!=""){ ?>
		<td height="15" colspan="2" class="headerlong" width="13%"><span class="style1">Nilai Konsep</span>
        </td>
		<?	}	?>
		<?	if ($bobot_P!=""){ ?>
        <td height="15" colspan="2" class="headerlong" width="13%"><span class="style3">Nilai Praktik</span></td>
		<?	}	?>
        <td height="30" width="8%" class="headerlong" rowspan="2">Predikat</td>
    </tr>
    <tr height="15" class="header" align="center">
	<?	$i = 0;
        if ($bobot_PK!=""){
			while ($row_PK=@mysql_fetch_array($result_get_aturan_PK)){			
            $ujian[$i++]=array($row_PK['replid'],$row_PK['bobot'],$row_PK['idjenisujian'],'Pemahaman Konsep');
    ?>
    		<td width="8%" class="headerlong"><span class="style1"><?=$row_PK['jenisujian']." (".$row_PK['bobot'].")"?>
			</span></td>
    <?		} ?>
	<?	} ?>
	<?	if ($bobot_P!=""){ ?>
	<?		while ($row_P=@mysql_fetch_array($result_get_aturan_P)){ 
				$ujian[$i++]=array($row_P['replid'],$row_P['bobot'],$row_P['idjenisujian'],'Praktik');
	?>
    			<td width="8%" class="headerlong"><span class="style3"><?=$row_P[jenisujian]." (".$row_P[bobot].")"?>
				</span></td>
	<?		} ?>
	<?	}	?>
		<?	if ($bobot_PK!=""){ ?>
		<td align="center" class="headerlong"><span class="style1">Angka</span></td>
        <td align="center" class="headerlong"><span class="style1">Huruf</span></td>
		<?	}	?>
		<?	if ($bobot_P!=""){ ?>
        <td align="center" class="headerlong"><span class="style3">Angka</span></td>
        <td align="center" class="headerlong"><span class="style3">Huruf</span></td>
  		<? } ?>
	</tr>
<?	//Mulai perulangan siswa
	$sql_siswa="SELECT * FROM jbsakad.siswa WHERE idkelas='$kelas' AND aktif=1 ORDER BY nama";
  	$result_siswa=QueryDb($sql_siswa);
  	$cnt=1;
	$total = mysql_num_rows($result_siswa);
	
  	while ($row_siswa=@mysql_fetch_array($result_siswa)){
?>
  	<tr height="25">
    	<td align="center"><?=$cnt?></td>
    	<td align="center"><a href="#" onMouseOver="showhint('Lihat Detail Siswa', this, event, '80px')"  onClick="detail(<?=$row_siswa['replid']?>)"><?=$row_siswa['nis']?></a></td>
    	<td><?=$row_siswa['nama']?></td>
    
	<?	foreach ($ujian as $value){ 
			$sql_get_nilai="SELECT n.nilaiAU as nilaiujian FROM jbsakad.nau n, jbsakad.aturannhb a WHERE n.idkelas=$kelas AND n.nis='$row_siswa[nis]' AND n.idsemester=$semester AND n.idjenis=$value[2] AND n.idaturan=a.replid AND a.replid=$value[0]";
			$result_get_nilai=QueryDb($sql_get_nilai);
			$row_get_nilai=@mysql_fetch_array($result_get_nilai);
			echo "<td align='center'>".$row_get_nilai['nilaiujian']."</td>";
		}
  	?>
	<?	if ($bobot_PK!=""){	?>
    	<td align="center"><strong>
	<? 	
		$ext_idinfo = "";
		if ($idinfo!="")
			$ext_idinfo = " AND i.replid=$idinfo";
		//$sql_get_nap_pemkonsep="SELECT n.nilaihuruf,n.nilaiangka,i.nilaimin FROM jbsakad.nap n,jbsakad.aturannhb a,jbsakad.infonap i WHERE n.nis='$row_siswa[nis]' AND n.idaturan=a.replid AND n.idinfo=i.replid AND a.dasarpenilaian='Pemahaman Konsep' AND a.aktif=1 AND i.idpelajaran='$pelajaran' AND i.idsemester=$semester $ext_idinfo";
		$sql_get_nap_pemkonsep="SELECT n.nilaihuruf,n.nilaiangka,i.nilaimin FROM jbsakad.nap n,jbsakad.aturannhb a,jbsakad.infonap i WHERE n.nis='$row_siswa[nis]' AND n.idaturan=a.replid AND n.idinfo=i.replid AND a.dasarpenilaian='Pemahaman Konsep' AND i.idpelajaran='$pelajaran' AND i.idsemester=$semester $ext_idinfo";
		//echo $sql_get_nap_pemkonsep;
		$result_get_nap_pemkonsep=QueryDb($sql_get_nap_pemkonsep);
		$nilaiangka_pemkonsep=@mysql_num_rows($result_get_nap_pemkonsep);
		$row_get_nap_pemkonsep=@mysql_fetch_row($result_get_nap_pemkonsep);
		
		if ($nilaiangka_pemkonsep == 0){		//Belum ada data nilai di database
			//echo "Itung";
			$jumlah=0;
			foreach ($ujian as $value){		
				if ($value[3]=="Pemahaman Konsep"){
					$sql_get_nau="SELECT n.nilaiAU FROM jbsakad.nau n, jbsakad.aturannhb a WHERE n.idkelas=$kelas AND n.nis='$row_siswa[nis]' AND n.idsemester=$semester AND n.idjenis=$value[2] AND n.idaturan=a.replid AND a.dasarpenilaian='Pemahaman Konsep'";
					//echo $sql_get_nau;
					$result_get_nau=QueryDb($sql_get_nau);
					$row_get_nau=@mysql_fetch_array($result_get_nau);
					$nau=$row_get_nau[nilaiAU];
					$bobot=$value[1];
					$nap=$nau*$bobot;
					$jumlah = $jumlah + $nap;
					$nilpraktik[$praktik]=$nap;
					$praktik++;
				}
			}
			//echo "jum = ".$jumlah."_Bobot = ".$bobot_PK;
			$nilakhirpk=round($jumlah/$bobot_PK,2);	
	?>
			<input <?=$dis_text?> type="text" name="PK_<?=$cnt?>" id="PK_<?=$cnt?>" value="<?=$nilakhirpk?>" size="4" maxlength="5" onKeyPress="return focusNext('G_PK_<?=$cnt?>',event)" onFocus="panggil('PK_<?=$cnt?>',<?=$total?>)">
	<?
		} else { //Ada data nilai di database
			//echo "Db";	
			$nilakhirpk = $row_get_nap_pemkonsep[1];
			$warna = "";
			if ($nilakhirpk < $row_get_nap_pemkonsep[2])
				$warna="onMouseOver=\"showhint('Nilai di bawah nilai standar kelulusan', this, event, '100px')\" class='text_merah'";
				//$warna="title='Nilai dibawah nilai standar kelulusan' class='text_merah'";	

	?>
			<input <?=$dis_text?> type="text" name="PK_<?=$cnt?>" id="PK_<?=$cnt?>" value="<?=$nilakhirpk?>" size="4" <?=$warna?> maxlength="5" onKeyPress="return focusNext('G_PK_<?=$cnt?>',event)" onFocus="panggil('PK_<?=$cnt?>',<?=$total?>)">
	<? 	} ?>
			</strong>
    	</td>
        <!-- Grading Pemahaman konsep -->
        <td height="25" align="center"><strong>
	<?  if ($nilakhirpk == "") {
			$grade_PK = $grading[count($grading)-1];
		} else {
			if ($nilaiangka_pemkonsep == 0){ 
				$sql_get_grade_PK="SELECT grade FROM aturangrading a, kelas k WHERE a.idpelajaran=$pelajaran AND a.idtingkat=k.idtingkat AND k.replid = $kelas AND a.dasarpenilaian='Pemahaman Konsep' AND a.nipguru='$nip' AND $nilakhirpk BETWEEN a.nmin AND a.nmax";
				// echo $sql_get_grade_PK;
				$result_get_grade_PK=QueryDb($sql_get_grade_PK);
				$row_get_grade_PK=@mysql_fetch_array($result_get_grade_PK);
				$grade_PK=$row_get_grade_PK[grade];
			} else {
				 $grade_PK=$row_get_nap_pemkonsep[0];
			} 
		}	
	?>
   		<select <?=$dis?> name="G_PK_<?=$cnt?>" id="G_PK_<?=$cnt?>" onkeypress="return focusNext('P_<?=$cnt?>',event)" onFocus="panggil('G_PK_<?=$cnt?>',<?=$total?>)"> 
	<?	foreach ($grading as $valgrade){  ?>
			<option value="<?=$valgrade?>" <?=StringIsSelected($valgrade,$grade_PK)?>><?=$valgrade?></option>
	<?	}  ?>
		</select>
<!--<input type="hidden" name="G_PK_<?=$cnt?>" id="G_PK_<?=$cnt?>" value="<?=$grade_PK?>" size="5">-->
	</strong></td>
	<?	}	?>
	<?	if ($bobot_P!=""){	?>
    <td height="25" align="center"><strong>
	<? 	
		
		$ext_idinfo = "";
		if ($idinfo!="")
			$ext_idinfo = " AND i.replid=$idinfo";
		//$sql_get_nap_praktik="SELECT n.nilaihuruf,n.nilaiangka,i.nilaimin FROM jbsakad.nap n,jbsakad.aturannhb a,jbsakad.infonap i WHERE n.nis='$row_siswa[nis]' AND n.idaturan=a.replid AND n.idinfo=i.replid AND a.dasarpenilaian='Praktik' AND a.aktif=1 AND i.idpelajaran='$pelajaran' AND i.idsemester=$semester $ext_idinfo";
		$sql_get_nap_praktik="SELECT n.nilaihuruf,n.nilaiangka,i.nilaimin FROM jbsakad.nap n,jbsakad.aturannhb a,jbsakad.infonap i WHERE n.nis='$row_siswa[nis]' AND n.idaturan=a.replid AND n.idinfo=i.replid AND a.dasarpenilaian='Praktik' AND i.idpelajaran='$pelajaran' AND i.idsemester=$semester $ext_idinfo";
	
		$result_get_nap_praktik=QueryDb($sql_get_nap_praktik);
		$nilaiangka_praktik=@mysql_num_rows($result_get_nap_praktik);
		$row_get_nap_praktik=@mysql_fetch_row($result_get_nap_praktik);
		if ($nilaiangka_praktik <> 0){
			$nilakhirprak = $row_get_nap_praktik[1];
			$warna = "";
			if ($row_get_nap_praktik[1] < $row_get_nap_praktik[2])
				$warna="onMouseOver=\"showhint('Nilai di bawah nilai standar kelulusan', this, event, '100px')\" class='text_merah'";
			
	?>
		<input <?=$dis_text?> type="text" name="P_<?=$cnt?>" id="P_<?=$cnt?>" value="<?=$row_get_nap_praktik[1]?>" size="4" <?=$warna?> maxlength="5" onKeyPress="return focusNext('G_P_<?=$cnt?>',event)" onFocus="panggil('P_<?=$cnt?>',<?=$total?>)">
	<?
		} else {
			$jumlah=0;
			foreach ($ujian as $value){		
				if ($value[3]=="Praktik"){
					$sql_get_nau="SELECT n.nilaiAU FROM jbsakad.nau n, jbsakad.aturannhb a WHERE n.idkelas='$kelas' AND n.nis='$row_siswa[nis]' AND n.idsemester='$semester' AND n.idkelas='$kelas' AND n.idjenis='$value[2]' AND n.idaturan=a.replid AND a.dasarpenilaian='Praktik'";
					//echo $sql_get_nau;
					$result_get_nau=QueryDb($sql_get_nau);
					$row_get_nau=@mysql_fetch_array($result_get_nau);
					$nau=$row_get_nau[nilaiAU];
					$bobot=$value[1];
					$nap=$nau*$bobot;
					$jumlah = $jumlah + $nap;
					$nilpraktik[$praktik]=$nap;
					$praktik++;
				}
			}
			$nilakhirprak=round($jumlah/$bobot_P,2);
	//echo "<STRONG> praktik ".$nilakhirprak."</STRONG>";
	 
	?>
		<input <?=$dis_text?> name="P_<?=$cnt?>" type="text" id="P_<?=$cnt?>" value="<?=$nilakhirprak?>" size="4" maxlength="5" onKeyPress="return focusNext('G_P_<?=$cnt?>',event)" onFocus="panggil('P_<?=$cnt?>',<?=$total?>)">
	<? 	} ?>
	</strong></div>
	</td>
    <td height="25" align="center">
	<?
	if ($nilakhirprak == 0) {
			$grade_P = $grading1[count($grading1)-1];			
	} else { 		
		if ($nilaiangka_praktik<>0){
			$grade_P=$row_get_nap_praktik[0];
		} else {
		  $sql_get_grade_P="SELECT grade FROM aturangrading a, kelas k WHERE a.idpelajaran=$pelajaran AND a.idtingkat=k.idtingkat AND k.replid = $kelas AND a.dasarpenilaian='Praktik' AND a.nipguru='$nip' AND $nilakhirprak BETWEEN a.nmin AND a.nmax";
		  //echo $sql_get_grade_P;
		  $result_get_grade_P=QueryDb($sql_get_grade_P);
		  $row_get_grade_P=@mysql_fetch_array($result_get_grade_P);
		  $grade_P=$row_get_grade_P[grade];
		  //echo "<STRONG>".$row_get_grade_P[grade]."</STRONG>";
		}
	}
		  ?>
	<strong>
	
		<select <?=$dis?> name="G_P_<?=$cnt?>" id="G_P_<?=$cnt?>" onkeypress="return focusNext('predikat_<?=$cnt?>',event)" onFocus="panggil('G_P_<?=$cnt?>',<?=$total?>)">
	<? 	foreach ($grading1 as $valgrade){ ?>
		<option value="<?=$valgrade?>" <?=StringIsSelected($valgrade,$grade_P)?>><?=$valgrade?></option>
	<?  }  ?>
	</select>
	</strong><!--<input type="hidden" name="G_P_<?=$cnt?>" id="G_P_<?=$cnt?>" value="<?=$grade_P?>" size="5">-->
	</td>
	<?	}	?>
    <td height="25" align="center">
	<?
		  switch ($grade_PK){
			  case "A":$pred_PK=4;
			  break;
			  case "B":$pred_PK=3;
			  break;
			  case "C":$pred_PK=2;
			  break;
			  case "D":$pred_PK=1;
			  break;
			  case "E":$pred_PK=0;
			  break;
			  case "":$pred_PK="";
			  break;
		  }
		  
		  switch ($grade_P){
			  case "A":$pred_P=4;
			  break;
			  case "B":$pred_P=3;
			  break;
			  case "C":$pred_P=2;
			  break;
			  case "D":$pred_P=1;
			  break;
			  case "E":$pred_P=0;
			  break;
			  case "":$pred_P="";
			  break;
		  }
		  $sql_get_pred_persiswa="SELECT k.predikat AS predikat FROM jbsakad.komennap k, jbsakad.infonap i WHERE i.replid=k.idinfo AND i.idpelajaran='$pelajaran' AND i.idkelas='$kelas' AND i.idsemester='$semester' AND k.nis='$row_siswa[nis]'";
		 
		  $result_get_pred_persiswa=QueryDb($sql_get_pred_persiswa);
		  //echo $sql_get_pred_persiswa."<br>";
		  if (@mysql_num_rows($result_get_pred_persiswa)>0){
			  $row_get_pred_persiswa=@mysql_fetch_array($result_get_pred_persiswa);
			  $pred=$row_get_pred_persiswa[predikat];
			  //echo "DB".$pred;
		  } else {
			  if ($pred_P!=""){
				  if ($pred_PK!=""){
			  $pred=($pred_P+$pred_PK)/2;
				  } else {
						$pred=$pred_P/2;
				  }
			  } else {
				  if ($pred_PK!=""){
			  $pred=$pred_PK/2;
				  } else {
						$pred="";
				  }
			  }
			  //echo "Itung".$pred;
		  }

			  ?>
	<select <?=$dis?> name="predikat_<?=$cnt?>" id="predikat_<?=$cnt?>" <? if ($cnt!=$total) { ?> onKeyPress="return focusNext('PK_<?=(int)$cnt+1?>',event)" onfocus="panggil('predikat_<?=$cnt?>',<?=$total?>)"<? } else { ?> onkeypress="focusNext('nilaimin',event)" onfocus="panggil('predikat_<?=$cnt?>',<?=$total?>)" <? } ?>    >
	<option value="4" 
	<? if ($pred>3 && $pred<=4)
			  echo "selected='selected'"
		  ?>
	>Istimewa</option>
	<option value="3"
	<? if ($pred>2 && $pred<=3)
			  echo "selected='selected'"
		  ?>
	>Baik</option>
	<option value="2"
	<? if ($pred>1 && $pred<=2)
			  echo "selected='selected'"
		  ?>
	>Cukup</option>
	<option value="1"
	<? if ($pred>=0 && $pred<=1)
			  echo "selected='selected'"
		  ?>
	>Kurang</option>
	
	<option value="0"
	<? if ($pred=="")
			  echo "selected='selected'"
		  ?>
	>[Belum Ada]</option>
	</select>
	<input type="hidden" name="nis_<?=$cnt?>" id="nis_<?=$cnt?>" value="<?=$row_siswa[nis]?>">
	</td>
  </tr>
  <?
		  $cnt++;
  	}
	
	?>
      <tr height="25">
      	<td bgcolor="#996600" colspan="<?=$jum_nhb+8; ?>"><font color="#FFFFFF"><strong>&nbsp;&nbsp;&nbsp;Nilai Standar Kelulusan </strong></font> 
    <strong><input type="text" <?=$dis_text?> size="6" maxlength="5" name="nilaimin" id="nilaimin"
	<? if ($infonap_ada > 0) echo " value='".$row_cek_infonap[nilaimin]."' "; ?> onKeyPress="focusNext('simpan',event)" onFocus="panggil('nilaimin',<?=$total?>)"/>
    </strong>
    <input type="hidden" size="10" maxlength="5" name="numdata" id="numdata" value="<?=$cnt-1?>"/>
    &nbsp;
	<?
		if ($infonap_ada>0){
	?>
	<input type="hidden" size="6" maxlength="5" name="replid" id="replid" value="<?=$row_cek_infonap[replid]?>">
	<input <?=$dis?> class="but" type="submit" value="Ubah" name="Simpan" id="simpan" onFocus="panggil('simpan',<?=$total?>)"/>&nbsp;&nbsp;
    <a href="#" onClick="hapus('<?=$row_cek_infonap[replid]?>')"><img src="../images/ico/hapus.png" border="0"><font color="#FFFFFF">&nbsp;Hapus Nilai dan Komentar Rapor Kelas Ini</font></a>
    <? 	} else { ?>
	<input <?=$dis?> class="but" type="submit" value="Simpan" name="Simpan" id="simpan" onFocus="panggil('simpan',<?=$total?>)"/>
	<? 
		}
	?>
        </td>
	</tr>
</table>
</form>
<script language='JavaScript'>
            Tables('table', 1, 0);
    </script>
<? //echo "Bobot PK=".$bobot_PK?><br>
<? //echo "Bobot P=".$bobot_P?><br>
</body>
</html>
<?
CloseDb();
?>
<script language="javascript">
/*var sprytextfield1 = new Spry.Widget.ValidationTextField("nilaimin");
var numdata=document.getElementById("numdata").value;
var x;
for (x=1;x<=numdata;x++){
	var spryselect1 = new Spry.Widget.ValidationSelect("predikat_"+x);
	var sprytextfield2 = new Spry.Widget.ValidationTextField("P_"+x);
	var sprytextfield3 = new Spry.Widget.ValidationTextField("PK_"+x);
	var spryselect2 = new Spry.Widget.ValidationSelect("G_P_"+x);
	var spryselect3 = new Spry.Widget.ValidationSelect("G_PK_"+x);
}*/
</script>