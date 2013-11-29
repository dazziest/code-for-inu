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
require_once('../include/common.php');
require_once('../include/config.php');
require_once('../include/db_functions.php');

header('Content-Type: application/vnd.ms-excel'); //IE and Opera  
header('Content-Type: application/x-msexcel'); // Other browsers  
header('Content-Disposition: attachment; filename=Data_Calon_Siswa.xls');
header('Expires: 0');  
header('Cache-Control: must-revalidate, post-check=0, pre-check=0');

$departemen=$_REQUEST[departemen];
$proses=$_REQUEST[proses];
$kelompok=$_REQUEST[kelompok];
$urut= $_REQUEST[urut];
$urutan = $_REQUEST[urutan];

OpenDb();

$sql = "SELECT c.nopendaftaran as nopendaftaran,c.nama as nama,c.asalsekolah as asalsekolah,c.tmplahir as tmplahir,c.tgllahir as tgllahir,". 
		 "c.aktif as aktif,c.replid,replidsiswa FROM calonsiswa c, kelompokcalonsiswa k, prosespenerimaansiswa p ".
		  "WHERE c.idproses = $proses AND c.idkelompok = $kelompok AND k.idproses = p.replid ".
		  "AND c.idproses = p.replid AND c.idkelompok = k.replid ORDER BY $urut $urutan";
		$result = QueryDb($sql);
		
if (@mysql_num_rows($result)<>0){
?>
<html>
<head>
<title>
Data Siswa per Kelas
</title>
<style type="text/css">
<!--
.style1 {color: #FFFFFF}
.style2 {font-size: 14px}
-->
</style>
</head>
<body>
<table width="700" border="0">
  <tr>
    <td>
    <table width="100%" border="0">
  <tr>
    <td colspan="2"><div align="center">Data Siswa per Kelas</div></td>
    </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
  <?
  	$sql_proses = "SELECT proses FROM prosespenerimaansiswa where replid='$proses'";
	$result_proses = QueryDb($sql_proses);
	$row_proses = @mysql_fetch_array($result_proses);
  ?>
    <td width="24%">Departemen</td>
    <td width="76%"><strong>:</strong>&nbsp;<?=$departemen?></td>
  </tr>
  <tr>
    <td>Proses Penerimaan</td>
    <td><strong>:</strong>&nbsp;
    <?=$row_proses['proses'];
	?>    </td>
  </tr>
  <tr>
    <td>Kelompok Calon Siswa</td>
    <td><strong>:</strong>&nbsp;<?
	$sql_kel = "SELECT kelompok FROM kelompokcalonsiswa WHERE replid='$kelompok'";
	$result_kel = QueryDb($sql_kel);
	$row_kel=@mysql_fetch_array($result_kel);
	echo $row_kel[kelompok];
	?></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

    </td>
  </tr>
  <tr>
    <td><table border="1">
<tr height="30">
<td width="3" valign="middle" bgcolor="#666666"><div align="center" class="style1">No.</div></td>
<td width="20" valign="middle" bgcolor="#666666"><div align="center" class="style1">No. Pendaftaran</div></td>
<td valign="middle" bgcolor="#666666"><div align="center" class="style1">Nama</div></td>
<td valign="middle" bgcolor="#666666"><div align="center" class="style1">Asal Sekolah</div></td>
<td valign="middle" bgcolor="#666666"><div align="center" class="style1">Tempat, Tanggal Lahir</div></td>
<td valign="middle" bgcolor="#666666"><div align="center" class="style1">Status Aktif</div></td>
</tr>
<?
	$cnt=1;
	while ($row=@mysql_fetch_array($result)){
		$siswa = "";
		if ($row['replidsiswa'] <> 0) {
			OpenDb();
			$sql3 = "SELECT nis FROM jbsakad.siswa WHERE replid = $row[replidsiswa]";
			$result3 = QueryDb($sql3);
			CloseDb();
			$row3 = @mysql_fetch_array($result3);
			$siswa = "<br>NIS Siswa: <b>".$row3['nis']."</b>";
		}
	?>
	<tr height="25">
	<td width="3" align="center"><?=$cnt?></td>
	<td align="left"><?=$row[nopendaftaran]?></td>
	<td align="left"><?=$row[nama]?></td>
	<td align="left"><?=$row[asalsekolah]?></td>
	<td align="left"><?=$row[tmplahir]?>, <?=format_tgl($row[tgllahir])?></td>
	<td align="center"><?
		
	if ($row[aktif]==1)
	echo "Aktif".$siswa;
	if ($row[aktif]==0)
	echo "Tidak aktif".$siswa;
	?></td>
	</tr>
	<?
		$cnt++;
}
	?>
</table></td>
  </tr>
</table>


</body>
</html>
<?
}
CloseDb();
?>