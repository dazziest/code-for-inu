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
//require_once('../include/errorhandler.php');
require_once('../include/sessioninfo.php');
require_once('../include/common.php');
require_once('../include/config.php');
require_once('../include/theme.php');
require_once('../include/db_functions.php');
require_once('../library/departemen.php');
/**/
header('Content-Type: application/vnd.ms-excel'); //IE and Opera  
header('Content-Type: application/x-msexcel'); // Other browsers  
header('Content-Disposition: attachment; filename=Penentuan_Rapor.xls');
header('Expires: 0');  
header('Cache-Control: must-revalidate, post-check=0, pre-check=0');

OpenDb();

//if(isset($_REQUEST["departemen"]))//2
	$departemen = $_REQUEST["departemen"];

//if(isset($_REQUEST["tingkat"]))//3
	$tingkat = $_REQUEST["tingkat"];

//if(isset($_REQUEST["pelajaran"]))//4
	$pelajaran = $_REQUEST["pelajaran"];

//if(isset($_REQUEST["nip"]))//4
	$nip = $_REQUEST["nip"];

//if(isset($_REQUEST["kelas"]))//6
	$kelas = $_REQUEST["kelas"];

//if(isset($_REQUEST["semester"]))//7
	$semester = $_REQUEST["semester"];

//if(isset($_REQUEST["tahun"]))//8
	$tahun = $_REQUEST["tahun"];


?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


<title>Menu</title>
<style type="text/css">
<!--
.style5 {color: #FFFFFF}
.style7 {color: #FFFFFF; font-weight: bold; }
.style9 {
	color: #FFFFFF;
	font-size: 16px;
	font-weight: bold;
}
.style10 {color: #FFFF00}
.style11 {color: #FFFF00; font-weight: bold; }
.style12 {color: #00FFFF; font-weight: bold; }
-->
</style>
</head>
<body>
<div align="center"><strong>
    <?
//echo "Dep=".$departemen.", Tkt=".$tingkat.", Kls=".$kelas.", Pelajaran=".$pelajaran.", Semester=".$semester.", Thn AJaran=".$tahun;	
//Hitung jumlah bobot Pemahaman konsep
$sql_get_jum_bbt_PK="SELECT SUM(bobot) as bobotPK FROM jbsakad.aturannhb WHERE nipguru='$nip' AND idtingkat='$tingkat' AND idpelajaran='$pelajaran' AND dasarpenilaian='Pemahaman Konsep' AND aktif=1";
$result_get_jum_bbt_PK=QueryDb($sql_get_jum_bbt_PK);
$jum_bbt_PK=@mysql_fetch_array($result_get_jum_bbt_PK);
//dapet deh jumlah bobotnya
$bobot_PK=$jum_bbt_PK[bobotPK];
//Hitung jumlah bobot Praktik
$sql_get_jum_bbt_P="SELECT SUM(bobot) as bobotP FROM jbsakad.aturannhb WHERE nipguru='$nip' AND idtingkat='$tingkat' AND idpelajaran='$pelajaran' AND dasarpenilaian='Praktik' AND aktif=1";
//echo $sql_get_jum_bbt_P;
$result_get_jum_bbt_P=QueryDb($sql_get_jum_bbt_P);
$jum_bbt_P=@mysql_fetch_array($result_get_jum_bbt_P);
//dapet deh jumlah bobotnya6/9/2008
$bobot_P=$jum_bbt_P[bobotP];
//
$sql_get_jum_nhb="SELECT * FROM jbsakad.aturannhb WHERE nipguru='$nip' AND idtingkat='$tingkat' AND idpelajaran='$pelajaran' AND aktif=1";
$result_get_jum_nhb=QueryDb($sql_get_jum_nhb);
$jum_nhb=@mysql_num_rows($result_get_jum_nhb);

$field = array("tingkat","nama","kelas","tahunajaran","semester","nama");
$tabel = array("jbsakad.tingkat","jbsakad.pelajaran","jbsakad.kelas","jbsakad.tahunajaran","jbsakad.semester","jbssdm.pegawai");
$kondisi = array("replid=$tingkat","replid=$pelajaran","replid=$kelas","replid=$tahun","replid=$semester","nip='$nip'");
$hasil = array("namatingkat","namapelajaran","namakelas","namatahunajaran","namasemester","namapegawai");
for ($i=0;$i<count($field);$i++){
	$sql="SELECT $field[$i] FROM $tabel[$i] WHERE $kondisi[$i]";
	$result=QueryDb($sql);
	$row=@mysql_fetch_row($result);	
	$hasil[$i]=$row[0];
}
/*
$sql="SELECT tingkat FROM jbsakad.tingkat WHERE replid=$tingkat";
$result=QueryDb($sql);
$row=@mysql_fetch_row($result);
$namatingkat = $row[0];

$sql="SELECT nama FROM jbsakad.pelajaran WHERE replid=$pelajaran";
$result=QueryDb($sql);
$row=@mysql_fetch_row($result);

$sql="SELECT kelas FROM jbsakad.kelas WHERE replid=$kelas";
$result=QueryDb($sql);
$row=@mysql_fetch_row($result);

$sql="SELECT tahunajaran FROM jbsakad.tahunajaran WHERE replid=$tahun";
$result=QueryDb($sql);
$row=@mysql_fetch_array($result);

$sql="SELECT semester FROM jbsakad.semester WHERE replid=$semester";
$result=QueryDb($sql);
$row=@mysql_fetch_array($result5);

$sql="SELECT nama FROM jbssdm.pegawai WHERE nip='$nip'";
$result=QueryDb($sql);
$row=@mysql_fetch_array($result);	
*/
?>
    </strong>
    </div>
<form action="penentuan_content.php" method="POST" onSubmit="return cek()">
	<div align="left">
    <table width="100%" border="0">
  <tr>
    <td colspan="9" bgcolor="#666666"><div align="center"><span class="style9">Data Penentuan Nilai Rapor</span></div></td>
    </tr>
  <tr>
    <td>&nbsp;Sekolah</td>
    <td>&nbsp;<?=$departemen?></td>
  </tr>
  <tr>
    <td>&nbsp;Tingkat</td>
    <td>&nbsp;<?=$hasil[0]?></td>
  </tr>
  <tr>
    <td>&nbsp;Pelajaran</td>
    <td>&nbsp;<?=$hasil[1]?></td>
  </tr>
  <tr>
    <td>&nbsp;Kelas</td>
    <td>&nbsp;<?=$hasil[2]?></td>
  </tr>
  <tr>
    <td>&nbsp;Tahun Ajaran</td>
    <td>&nbsp;<?=$hasil[3]?></td>
  </tr>
  <tr>
    <td>&nbsp;Semester</td>
    <td>&nbsp;<?=$hasil[4]?></td>
  </tr>
  <tr>
    <td>&nbsp;Guru</td>
    <td>&nbsp;<?=$hasil[5]?></td>
  </tr>
</table>

  	  <input type="hidden" name="departemen" id="departemen" value="<?=$departemen?>">
	  <input type="hidden" name="tingkat" id="tingkat" value="<?=$tingkat?>">
	  <input type="hidden" name="pelajaran" id="pelajaran" value="<?=$pelajaran?>">
	  <input type="hidden" name="nip" id="nip" value="<?=$nip?>">
	  <input type="hidden" name="kelas" id="kelas" value="<?=$kelas?>">
	  <input type="hidden" name="tahun" id="tahun" value="<?=$tahun?>">
	  <input type="hidden" name="semester" id="semester" value="<?=$semester?>">
	 </div>
	<table width="100%" border="1" class="tab" id="table">  
  <tr >
    <td rowspan="2" align="center" valign="middle" bgcolor="#666666"><span class="style7">No</span></td>
    <td rowspan="2" align="center" valign="middle" bgcolor="#666666"><span class="style7">NIS</span></td>
    <td rowspan="2" align="center" valign="middle" bgcolor="#666666"><span class="style7">Nama</span></td>
  
    <td height="25" colspan="<?=$jum_nhb?>" bgcolor="#666666"><div align="center" class="style7">Nilai Akhir</div></td>
    <?	if ($bobot_PK!=""){ ?>
	<td height="25" colspan="2" bgcolor="#666666"><div align="center" class="style11">Nilai  Konsep</div></td>
    <?	}	?>
	<?	if ($bobot_P!=""){ ?>
	<td height="25" colspan="2" bgcolor="#666666"><div align="center" class="style12">Nilai Praktik</div></td>
    <?	}	?>
	<td rowspan="2" valign="middle" bgcolor="#666666"><div align="center" class="style7">Predikat</div></td>
  </tr>
  <tr>
  	<?
    $i=0;
	while ($row_nhb=@mysql_fetch_array($result_get_jum_nhb)){
	$replid[$i]=array($row_nhb[replid],$row_nhb[bobot],$row_nhb[idjenisujian],$row_nhb[dasarpenilaian]);
	//$bobot[$i]=$row_nhb[bobot];
	$sql_get_jenis="SELECT * FROM jbsakad.jenisujian WHERE replid='$row_nhb[idjenisujian]'";
	$result_get_jenis=QueryDb($sql_get_jenis);
	$row_get_jenis=@mysql_fetch_array($result_get_jenis);
	?>
    <td height="20" bgcolor="#666666"><div align="center" class="style7">
	<?
		if ($row_nhb[dasarpenilaian]=="Pemahaman Konsep"){
		?>
		<span class="style11">
		<? } elseif ($row_nhb[dasarpenilaian]=="Praktik"){
			?>
			<span class="style12">
			<?
				}
	?>
	<?=$row_get_jenis[jenisujian]?> (<?=$row_nhb[bobot]?>)</span></div></td>
  <?
		$i++;
  }
  ?>
  <?	if ($bobot_PK!=""){ ?>
    <td  height="20" bgcolor="#666666"><div align="center" class="style11">Angka</div></td>
    <td height="20" bgcolor="#666666"><div align="center" class="style11">Huruf</div></td>
  <?	}	?>
  <?	if ($bobot_P!=""){ ?>  
	<td height="20" bgcolor="#666666"><div align="center" class="style12">Angka</div></td>
    <td  height="20" bgcolor="#666666"><div align="center" class="style12">Huruf</div></td>
  <?	}	?>
  </tr>
  <?
  $sql_siswa="SELECT * FROM jbsakad.siswa WHERE idkelas='$kelas' AND aktif=1 ORDER BY nama";
  $result_siswa=QueryDb($sql_siswa);
  $cnt=1;
  while ($row_siswa=@mysql_fetch_array($result_siswa)){
	  //Mulai perulangan siswa
    ?>
  <tr>
    <td height="25" align="center"><?=$cnt?></td>
    <td height="25" align="left"><?=$row_siswa[nis]?></td>
    <td height="25" align="left"><?=$row_siswa[nama]?></td>
  <?
  foreach ($replid as $value){
	?>
    <td><div align="center">
	<?
	//sql lama, rada ngaco
	//$sql_get_nilai="SELECT n.nilaiujian as nilaiujian FROM jbsakad.nilaiujian n, jbsakad.ujian u WHERE u.idaturan='$value[0]' AND u.replid=n.idujian AND n.nis='$row_siswa[nis]'";
	//sql baru
	$sql_get_nilai="SELECT n.nilaiAU as nilaiujian FROM jbsakad.nau n, jbsakad.aturannhb a WHERE n.idkelas='$kelas' AND n.nis='$row_siswa[nis]' AND n.idsemester='$semester' AND n.idkelas='$kelas' AND n.idjenis='$value[2]' AND n.idaturan=a.replid AND a.replid='$value[0]'";
	$result_get_nilai=QueryDb($sql_get_nilai);
	$row_get_nilai=@mysql_fetch_array($result_get_nilai);
	echo $row_get_nilai[nilaiujian];
	?></div>	</td>
  <?
  }
  ?>
  <?	if ($bobot_PK!=""){ ?>
    <td height="25"><div align="center">
	<strong>
	<?
    //$sql_get_nap_pemkonsep="SELECT n.nilaihuruf,n.nilaiangka,i.nilaimin FROM jbsakad.nap n,jbsakad.aturannhb a,jbsakad.infonap i WHERE n.nis='$row_siswa[nis]' AND n.idaturan=a.replid AND n.idinfo=i.replid AND a.dasarpenilaian='Pemahaman Konsep' AND a.aktif=1 AND i.idpelajaran='$pelajaran'";
	$sql_get_nap_pemkonsep="SELECT n.nilaihuruf,n.nilaiangka,i.nilaimin FROM jbsakad.nap n,jbsakad.aturannhb a,jbsakad.infonap i WHERE n.nis='$row_siswa[nis]' AND n.idaturan=a.replid AND n.idinfo=i.replid AND a.dasarpenilaian='Pemahaman Konsep' AND i.idpelajaran='$pelajaran'";
	$result_get_nap_pemkonsep=QueryDb($sql_get_nap_pemkonsep);
	$nilaiangka_pemkonsep=@mysql_num_rows($result_get_nap_pemkonsep);
	$row_get_nap_pemkonsep=@mysql_fetch_row($result_get_nap_pemkonsep);
	if ($nilaiangka_pemkonsep==0){
		//Kalo lom ada di database
	$jumlah=0;
	foreach ($replid as $value){		
		if ($value[3]=="Pemahaman Konsep"){
			$sql_get_nau="SELECT n.nilaiAU FROM jbsakad.nau n, jbsakad.aturannhb a WHERE n.idkelas='$kelas' AND n.nis='$row_siswa[nis]' AND n.idsemester='$semester' AND n.idkelas='$kelas' AND n.idjenis='$value[2]' AND n.idaturan=a.replid AND a.dasarpenilaian='Pemahaman Konsep'";
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
	$nilakhirpk=round($jumlah/$bobot_PK,2);
	//echo $nilakhirpk;
	?>
	<!--<input type="text" name="PK_<?=$cnt?>" id="PK_<?=$cnt?>" value="<?=$nilakhirpk?>" size="5" >-->
	<?=$nilakhirpk?>
	<?
	} else {
		//kalo dah ada di dbase
		//echo $sql_get_nap_pemkonsep;
		$nilakhirpk=$row_get_nap_pemkonsep[1];
	if ($nilakhirpk<$row_get_nap_pemkonsep[2]){
			$warna="<font color='red'>";
			$warna2="</font>";
	} else {
			$warna="";
		}

	?>
	<!--<input type="text" name="PK_<?=$cnt?>" id="PK_<?=$cnt?>" value="<?=$nilakhirpk?>" size="5" <?=$warna?>>-->
	<?=$warna.$nilakhirpk.$warna2?>
	<?
	}
	//echo $nilakhirpk;
	?>
	</strong></div></td>
	<?
	$sql_get_all_grade="SELECT grade FROM aturangrading WHERE idpelajaran='$pelajaran' AND idtingkat='$tingkat' AND dasarpenilaian='Praktik' AND nipguru='$nip' ORDER BY nmin ASC";
			  $result_get_grade=QueryDb($sql_get_all_grade);
			  $cntgrad=0;
			  while ($row_get_all_grade=@mysql_fetch_array($result_get_grade)){
			  $grading[$cntgrad]=$row_get_all_grade[grade];
			  $cntgrad++;
			  }
			  ?>
	<!-- Grading Pemahaman konsep -->
    <td height="25"><div align="center"><strong>
	<?    
		  if ($nilaiangka_pemkonsep==0){ 	

		  $sql_get_grade_PK="SELECT grade FROM aturangrading WHERE idpelajaran='$pelajaran' AND idtingkat='$tingkat' AND dasarpenilaian='Pemahaman Konsep' AND nipguru='$nip' AND $nilakhirpk BETWEEN nmin AND nmax";
		  //echo $sql_get_grade_PK;
		  $result_get_grade_PK=QueryDb($sql_get_grade_PK);
		  $row_get_grade_PK=@mysql_fetch_array($result_get_grade_PK);
		  //echo "<STRONG>".$row_get_grade_PK[grade]."</STRONG>";
		  $grade_PK=$row_get_grade_PK[grade];
	} else {
		 $grade_PK=$row_get_nap_pemkonsep[0];
	}
		  ?>
	<!--
	<select name="G_PK_<?=$cnt?>" id="G_PK_<?=$cnt?>">
	<?
			  $cntgrad1=0;  
			  foreach ($grading as $valgrade){
				  ?>
				  <option value="<?=$valgrade?>" <?=StringIsSelected($valgrade,$grade_PK)?>><?=$valgrade?></option>
				  <?
					  $cntgrad1++;

			  }
			  
			  ?>
	</select>-->
	<?=$grade_PK?>
<!--<input type="hidden" name="G_PK_<?=$cnt?>" id="G_PK_<?=$cnt?>" value="<?=$grade_PK?>" size="5">-->
	</strong></div></td>
	<?	}	?>
	<?	if ($bobot_P!=""){ ?>	

    <td height="25"><div align="center"><strong>
<?
	//$sql_get_nap_praktik="SELECT n.nilaihuruf,n.nilaiangka,i.nilaimin FROM jbsakad.nap n,jbsakad.aturannhb a,jbsakad.infonap i WHERE n.nis='$row_siswa[nis]' AND n.idaturan=a.replid AND n.idinfo=i.replid AND a.dasarpenilaian='Praktik' AND a.aktif=1 AND i.idpelajaran='$pelajaran'";
	$sql_get_nap_praktik="SELECT n.nilaihuruf,n.nilaiangka,i.nilaimin FROM jbsakad.nap n,jbsakad.aturannhb a,jbsakad.infonap i WHERE n.nis='$row_siswa[nis]' AND n.idaturan=a.replid AND n.idinfo=i.replid AND a.dasarpenilaian='Praktik' AND i.idpelajaran='$pelajaran'";
	
	$result_get_nap_praktik=QueryDb($sql_get_nap_praktik);
	$nilaiangka_praktik=@mysql_num_rows($result_get_nap_praktik);
	$row_get_nap_praktik=@mysql_fetch_row($result_get_nap_praktik);
	if ($nilaiangka_praktik<>0){
	$nilakhirprak=$row_get_nap_praktik[1];
	//echo $sql_get_nap_praktik;
		if ($row_get_nap_praktik[1]<$row_get_nap_praktik[2]){
			$warna="<font color='red'>";
			$warna2="</font>";
		} else {
			$warna="";
		}
		?>
		<!--<input type="text" name="P_<?=$cnt?>" id="P_<?=$cnt?>" value="<?=$row_get_nap_praktik[1]?>" size="5" <?=$warna?>>-->
		<?=$warna.$row_get_nap_praktik[1].$warna2?>
	<?
	} else {
	$jumlah=0;
	foreach ($replid as $value){		
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
	//echo "<STRONG>".$nilakhirprak."</STRONG>";
	?>
	<?=$nilakhirprak?>
	<?
	}
	?>
	
	</strong></div></td>
    <td height="25"><div align="center">
<?
		if ($nilaiangka_praktik<>0){
			$grade_P=$row_get_nap_praktik[0];
		} else {
		  $sql_get_grade_P="SELECT grade FROM aturangrading WHERE idpelajaran='$pelajaran' AND idtingkat='$tingkat' AND dasarpenilaian='Praktik' AND nipguru='$nip' AND $nilakhirprak BETWEEN nmin AND nmax";
		  //echo $sql_get_grade_P;
		  $result_get_grade_P=QueryDb($sql_get_grade_P);
		  $row_get_grade_P=@mysql_fetch_array($result_get_grade_P);
		  $grade_P=$row_get_grade_P[grade];
		  //echo "<STRONG>".$row_get_grade_P[grade]."</STRONG>";
		}
		  ?>
	<strong>
	<!--
	<select name="G_P_<?=$cnt?>" id="G_P_<?=$cnt?>">
	<?
			  $cntgrad1=0;  
			  foreach ($grading as $valgrade){
				  ?>
				  <option value="<?=$valgrade?>" <?=StringIsSelected($valgrade,$grade_P)?>><?=$valgrade?></option>
				  <?
					  $cntgrad1++;

			  }
			  
			  ?>
	</select>
--><?=$grade_P?>
</strong><!--<input type="hidden" name="G_P_<?=$cnt?>" id="G_P_<?=$cnt?>" value="<?=$grade_P?>" size="5">--></div></td>
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
			  //echo $pred;
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
		  }

			 
       if ($pred>3 && $pred<=4)
	  { echo "Istimewa"; }
	   elseif ($pred>2 && $pred<=3)
	  { echo "Baik"; }
	   elseif ($pred>1 && $pred<=2)
	  { echo "Cukup"; }
	   elseif ($pred>=0 && $pred<=1)
	  { echo "Kurang"; }
	   elseif ($pred=="")
      { echo "-"; }
		  ?>

	<input type="hidden" name="nis_<?=$cnt?>" id="nis_<?=$cnt?>" value="<?=$row_siswa[nis]?>">	</td>
  </tr>
  <?
		  $cnt++;
  }
	$sql_cek_infonap="SELECT nilaimin,replid FROM jbsakad.infonap WHERE idpelajaran='$pelajaran' AND idsemester='$semester' AND idkelas='$kelas'";
	$result_cek_infonap=QueryDb($sql_cek_infonap);
	$row_cek_infonap=@mysql_fetch_array($result_cek_infonap);
	$infonap_ada=@mysql_num_rows($result_cek_infonap);
	$rs = $jum_nhb+4;
	if ($bobot_PK!="")
		$rs+=2;
	if ($bobot_P!="")
		$rs+=2;
	?>
      <tr><td bgcolor="#666666" colspan="<?=$rs; ?>"><span class="style5"><strong>
	  <?
	  if ($infonap_ada>0){
	  ?>
&nbsp;&nbsp;&nbsp;Nilai Standar Kelulusan :</strong> 
            <strong>
	<?=$row_cek_infonap[nilaimin]?>
	<?
			
	} else {
		echo "Belum ada nilai standar kelulusan";
	}
	?>
	        </strong>
        <input type="hidden" size="10" maxlength="5" name="numdata" id="numdata" value="<?=$cnt-1?>"/>
    &nbsp;
	        </span></td>
	</tr>
</table>
</form>

<? //echo "Bobot PK=".$bobot_PK?><br>
<? //echo "Bobot P=".$bobot_P?><br>
</body>
</html>
<?
CloseDb();
?>