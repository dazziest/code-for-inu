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
require_once('../include/db_functions.php');
require_once('../include/getheader.php');
OpenDb();

$semester = $_REQUEST['semester'];
$kelas = $_REQUEST['kelas'];
$nip = $_REQUEST['nip'];
$pelajaran = $_REQUEST['pelajaran'];

OpenDb();
$sql = "SELECT k.kelas AS namakelas, s.semester AS namasemester, a.tahunajaran, a.departemen, l.nama, t.tingkat, t.replid AS idtingkat, p.nama AS guru, s.departemen as dep FROM kelas k, semester s, tahunajaran a, pelajaran l, tingkat t, jbssdm.pegawai p WHERE k.replid = $kelas AND s.replid = $semester AND  k.idtahunajaran = a.replid AND t.replid = k.idtingkat AND l.replid = $pelajaran AND p.nip = '$nip'";

$result = QueryDb($sql);
CloseDb();
$row = mysql_fetch_array($result);

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="../style/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Akademik [Cetak Form Pengisian Nilai Rapor Siswa]</title>
<style type="text/css">
<!--
.style27 {color: #FF9900}
.style28 {color: #009900}
-->
</style>
</head>
<body>
<table border="0" cellpadding="10" cellpadding="5" width="780" align="left">
<tr><td align="left" valign="top">
<?=getHeader($row[dep])?>
<center>
  <font size="4"><strong>FORM PENGISIAN NILAI RAPOR SISWA</strong></font><br />
 </center><br /><br />
<br />
<table>
<tr>
    <td width="22%"><strong>Sekolah</strong></td>
    <td width="45%"><strong>: <?=$row['departemen'] ?></strong></td>
    <td width="15%"><strong>Kelas</strong></td>
    <td><strong>: <?=$row['tingkat'].' - '. $row['namakelas'];?></strong></td>
</tr>
<tr>
    <td><strong>Tahun Ajaran</strong></td>
   	<td><strong>: <?=$row['tahunajaran']?></strong></td>
    <td><strong>Pelajaran</strong></td>
    <td><strong>: <?=$row['nama'];?></strong></td>
</tr>
<tr>
    <td><strong>Semester</strong></td>
    <td><strong>: <?=$row['namasemester']?></strong></td>
</tr>
</table>
<br />
 	 <?
OpenDb();
$sql_get_aturan_PK="SELECT j.jenisujian as jenisujian, a.bobot as bobot FROM jbsakad.aturannhb a, jbsakad.jenisujian j WHERE a.idtingkat=$row[idtingkat] AND a.nipguru='$nip' AND a.idpelajaran='$pelajaran' AND a.dasarpenilaian='Pemahaman Konsep' AND a.idjenisujian=j.replid AND a.aktif = 1 ORDER BY a.replid ";
$result_get_aturan_PK=QueryDb($sql_get_aturan_PK);
$jum_PK=@mysql_num_rows($result_get_aturan_PK);

$sql_get_aturan_P="SELECT j.jenisujian as jenisujian, a.bobot as bobot FROM jbsakad.aturannhb a, jbsakad.jenisujian j WHERE a.idtingkat=$row[idtingkat] AND a.nipguru='$nip' AND a.idpelajaran='$pelajaran' AND a.dasarpenilaian='Praktik' AND a.idjenisujian=j.replid AND a.aktif = 1 ORDER BY a.replid";
$result_get_aturan_P=QueryDb($sql_get_aturan_P);
$jum_P=@mysql_num_rows($result_get_aturan_P);


?>
	<table class="tab" id="table" border="1" style="border-collapse:collapse" width="100%" align="left">
  	<tr align="center">
    	<td rowspan="2" bgcolor="#000000" style="color: #FFFFFF; font-size: 12; font-weight: bold;">No</td>
    	<td rowspan="2" bgcolor="#000000" style="color: #FFFFFF; font-size: 12; font-weight: bold;">N I S</td>
    	<td rowspan="2" bgcolor="#000000" style="color: #FFFFFF; font-size: 12; font-weight: bold;">Nama</td>
   		<td colspan="<?=(int)$jum_P+$jum_PK?>" bgcolor="#000000" style="color: #FFFFFF; font-weight: bold;">Nilai Akhir</td> 
    	<? if ($jum_PK!=0){ ?>
		<td colspan="3" bgcolor="#000000" style="color: #00FF00; font-weight: bold; font-size: 12; "><span class="style28">Nilai Pemahaman Konsep</span></td>
    	<? } ?>
		<? if ($jum_P!=0){ ?>
		<td colspan="3" bgcolor="#000000" style="color: #FF9900; font-weight: bold; font-size: 12;"><span class="style27">Nilai Praktik</span></td>
    	<? } ?>
		<td rowspan="2" bgcolor="#000000" style="color: #FFFFFF; font-weight: bold;">Predikat</td>
  	</tr>
  
<!--<tr height="15">
	<td align="center" colspan="<?=(int)$jum_PK?>" class="headerlong">Nilai Ujian</td>
    <td colspan="2" align="center" class="headerlong">Nilai Akhir</td>
    <td align="center" colspan="<?=(int)$jum_P?>" class="headerlong">Nilai Ujian</td>
	<td colspan="2" align="center" class="headerlong">Nilai Akhir</td>
</tr>-->
	<tr height="15">
    	<?	while ($row_PK=@mysql_fetch_array($result_get_aturan_PK)){	?>
		<td width="7%" align="center" bgcolor="#000000" style="color: #009900">
		  <strong><?=$row_PK[jenisujian]." (".$row_PK[bobot].")"?></strong>
	    </td>
	  	<?	}	?>
		<?	while ($row_P=@mysql_fetch_array($result_get_aturan_P)){ ?>
	  	<td width="7%" align="center" bgcolor="#000000" style="color: #FF9900; font-weight: bold; font-size: 12;">
        	<?=$row_P[jenisujian]." (".$row_P[bobot].")"?>
	  	</td>
	  	<?	}	?>
		<? if ($jum_PK!=0){ ?>
        <td width="5%" align="center" bgcolor="#000000" style="color: #00FF00; font-weight: bold; font-size: 12;"><span class="style28">Nilai</span></td>
		<td width="5%" align="center" bgcolor="#000000" style="color: #00FF00; font-weight: bold; font-size: 12;"><span class="style28">Angka</span></td>
	  	<td width="5%" align="center" bgcolor="#000000" style="color: #00FF00; font-weight: bold; font-size: 12;"><span class="style28">Huruf</span></td>
	  	<? } ?>
		<? if ($jum_P!=0){ ?>
		<td width="5%" align="center" bgcolor="#000000" style="color: #FF9900; font-weight: bold; font-size: 12;"><span class="style27">Nilai</span></td>
		<td width="5%" align="center" bgcolor="#000000" style="color: #FF9900; font-weight: bold; font-size: 12;"><span class="style27">Angka</span></td>
	  	<td width="5%" align="center" bgcolor="#000000" style="color: #FF9900"><span class="style27"><strong>Huruf</strong></span></td>	
		<? } ?>
	</tr>
	  <?
  $sql_get_nis="SELECT nis,nama,aktif FROM jbsakad.siswa WHERE idkelas='$kelas' ORDER BY nama";
  //echo $sql_get_nis;
  $result_get_nis=QueryDb($sql_get_nis);

  $cntsiswa=1;
  while ($row_get_nis=@mysql_fetch_row($result_get_nis)){
  		$tanda = "";
        if ($row_get_nis[2] == 0) 
            $tanda = "*";
		$nilai_PK = 0;
		$nilai_P = 0;
		$bobot_PK = 0;
		$bobot_P = 0;
  ?>
	<tr height="25">
	  <td align="center"><?=$cntsiswa?></td>
	  <td align="center"><?=$row_get_nis[0]?><?=$tanda?></td>
	  <td><?=$row_get_nis[1]?></td>
	  <? if ($jum_PK!=0){ ?>
	  <?
	  $sql_get_PK_field="SELECT replid, bobot FROM jbsakad.aturannhb WHERE idtingkat=$row[idtingkat] AND nipguru='$nip' AND idpelajaran=$pelajaran AND dasarpenilaian='Pemahaman Konsep' AND aktif=1 ORDER BY replid";
	  $result_get_PK_field=QueryDb($sql_get_PK_field);
	  
	  while ($row_get_PK_field=@mysql_fetch_row($result_get_PK_field)){
	  	
		  $sql_get_nau_PK="SELECT nilaiAU FROM jbsakad.nau WHERE idpelajaran=$pelajaran AND idkelas=$kelas AND idsemester=$semester AND idaturan=$row_get_PK_field[0] AND nis='$row_get_nis[0]'";
		  $result_get_nau_PK=QueryDb($sql_get_nau_PK);
		  $row_get_nau_PK=@mysql_fetch_array($result_get_nau_PK);
		  $nau_PK=$row_get_nau_PK[nilaiAU];
		  
		  $nilai_PK = $nilai_PK + ($nau_PK*$row_get_PK_field[1]);
		  $bobot_PK = $bobot_PK+$row_get_PK_field[1];
	  ?>
	  <td align="center"><?=$nau_PK?></td>
	  <?
	  }
	  }
	  ?>
      <? if ($jum_P!=0){ ?>
	  <?
	  $sql_get_P_field="SELECT replid, bobot FROM jbsakad.aturannhb WHERE idtingkat=$row[idtingkat] AND nipguru='$nip' AND idpelajaran='$pelajaran' AND dasarpenilaian='Praktik' AND aktif=1 ORDER BY replid";
	  $result_get_P_field=QueryDb($sql_get_P_field);
	  while ($row_get_P_field=@mysql_fetch_row($result_get_P_field)){
		  $sql_get_nau_P="SELECT nilaiAU FROM jbsakad.nau WHERE idpelajaran='$pelajaran' AND idkelas='$kelas' AND idsemester='$semester' AND idaturan='$row_get_P_field[0]' AND nis='$row_get_nis[0]'";
		  $result_get_nau_P=QueryDb($sql_get_nau_P);
		  $row_get_nau_P=@mysql_fetch_array($result_get_nau_P);
		  $nau_P=$row_get_nau_P[nilaiAU];
		  
		  $nilai_P = $nilai_P + ($nau_P*$row_get_P_field[1]);
		  $bobot_P = $bobot_P + $row_get_P_field[1];
		  //echo $nilai_P." ".$bobot_P."<br>";
	  ?>
	  <td align="center" bgcolor="#CCCCCC"><?=$nau_P?></td>
	  <?
	  }
	  }
	  ?>
      <? if ($jum_PK!=0){ ?>
	  <td align="center">
	  <?
		  if (strlen($nilai_PK)!=0 && strlen($bobot_PK)!=0)
		  echo round($nilai_PK/$bobot_PK,2);
	  ?>
	  </td>
	  <td align="center">&nbsp;</td>
	  <td align="center">&nbsp;</td>
	  <? } ?>
	  <? if ($jum_P!=0){ ?>
	  <td align="center" bgcolor="#CCCCCC">
	  <?
		  if (strlen($nilai_P)!=0 && strlen($bobot_P)!=0)
		  echo round($nilai_P/$bobot_P,2);
	  ?>
	  </td>
	  <td align="center" bgcolor="#CCCCCC"></td>
      <td align="center" bgcolor="#CCCCCC">&nbsp;</td>
      <? } ?>
	  <td align="center">&nbsp;</td>
	  </tr>
	  <?
	  $cntsiswa++;
	
  } 
  ?>
	 </table>
	</td>
</tr>
<tr>
	<td><?="Ket: *Status siswa tidak aktif lagi"; ?></td>
</tr>
<tr>
	<td>
<table width="100%" border="0">
	<tr>
		<td width="80%" align="left"></td>
	    <td width="20%" align="center"><br><br>Guru</td>
	</tr>
	<tr>
		<td colspan="2" align="right">&nbsp;<br /><br /><br /><br /><br /></td>
	</tr>
	<tr>		
        <td></td>
	    <td valign="bottom" align="center"><strong><?=$row['guru']?></strong>
	    <br /><hr />
        <strong>NIP. <?=$nip?></strong>
	</tr>
</table>
</td>
</tr>
</table>  

</body>
<script language="javascript">
window.print();
</script>
</html>