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
$departemen = $_REQUEST['departemen'];
$proses = $_REQUEST['proses'];
$kelompok = $_REQUEST['kelompok'];
$urut = $_REQUEST['urut'];
$urutan = $_REQUEST['urutan'];
$varbaris = $_REQUEST['varbaris'];	
$page = $_REQUEST['page'];
$total = $_REQUEST['total'];

OpenDb();
$sql = "SELECT p.proses, k.kelompok, k.keterangan FROM kelompokcalonsiswa k, prosespenerimaansiswa p WHERE k.idproses = $proses AND k.replid = $kelompok";
$result = QueryDb($sql);
$row =@mysql_fetch_array($result);
$namaproses = $row['proses'];
$namakelompok = $row['kelompok'];
$keterangan = $row['keterangan'];

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="../style/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>JIBAS SIMAKA [Cetak Calon Siswa]</title>
</head>

<body>
<table border="0" cellpadding="10" cellpadding="5" width="780" align="left">
<tr><td align="left" valign="top">

<?=getHeader($departemen)?>

<center>
  <font size="4"><strong>DATA CALON SISWA</strong></font><br />
 </center><br /><br />
 <table width="100%">    
	<tr>
		<td width="20%"><strong>Departemen</strong> </td> 
		<td width="*"><strong>:&nbsp;<?=$departemen?></strong></td>
	</tr>
    <tr>
		<td><strong>Proses Penerimaan </strong></td>
		<td><strong>:&nbsp;<?=$namaproses?></strong></td>        		
    </tr>
    <tr>
		<td><strong>Kelompok Calon Siswa</strong></td>
		<td><strong>:&nbsp;<?=$namakelompok?></strong></td>        		
    </tr>
    <tr>
		<td><strong>Keterangan</strong></td>
		<td><strong>:&nbsp;<?=$keterangan?></strong></td>        		
    </tr>
	</table>
<br />
<table border="1" width="100%" id="table" class="tab" bordercolor="#000000">
<tr>		
	<td height="30" align="center" class="header" width="4%">No</td>
	<td height="30" align="center" class="header" width="15%">No Pendaftaran</td>
	<td height="30" align="center" class="header" width="*">Nama</td>
    <td height="30" align="center" class="header" width="15%">Asal Sekolah</td>
    <td height="30" align="center" class="header" width="22%">Tempat Tanggal Lahir</td>
    <td height="30" align="center" class="header" width="20%">Status</td>   
</tr>
	<? 
	OpenDb();
	/*
	$sql = "SELECT nopendaftaran,nama,asalsekolah,tmplahir,DAY(tgllahir),MONTH(tgllahir),YEAR(tgllahir),". 
		   "c.aktif,c.replid,replidsiswa FROM calonsiswa c, kelompokcalonsiswa k, prosespenerimaansiswa p ".
		   "WHERE c.idproses = $proses AND c.idkelompok = $kelompok AND k.idproses = p.replid ".
		   "AND c.idproses = p.replid AND c.idkelompok = k.replid ORDER BY $urut $urutan LIMIT ".(int)$page*(int)$varbaris.",$varbaris";
	*/
	$sql = "SELECT nopendaftaran,nama,asalsekolah,tmplahir,DAY(tgllahir),MONTH(tgllahir),YEAR(tgllahir),". 
		   "c.aktif,c.replid,replidsiswa FROM calonsiswa c, kelompokcalonsiswa k, prosespenerimaansiswa p ".
		   "WHERE c.idproses = $proses AND c.idkelompok = $kelompok AND k.idproses = p.replid ".
		   "AND c.idproses = p.replid AND c.idkelompok = k.replid ORDER BY $urut $urutan ";
	$result = QueryDb($sql);
	CloseDb();
	if ($page==0)
		$cnt = 0;
	else
		$cnt = (int)$page*(int)$varbaris;
	while ($row = @mysql_fetch_row($result)) {
		$siswa = "";
		if ($row[9] <> 0) {
			OpenDb();
			$sql3 = "SELECT nis FROM jbsakad.siswa WHERE replid = $row[9]";
			$result3 = QueryDb($sql3);
			CloseDb();
			$row3 = @mysql_fetch_array($result3);
			$siswa = "<br>NIS Siswa: <b>".$row3['nis']."</b>";
		}
	?>	
    
<tr>        			
		<td height="25" align="center"><?=++$cnt?></td>
		<td height="25" align="center"><?=$row[0]?></td>
  		<td height="25"><?=$row[1]?></td>
        <td height="25"><?=$row[2]?></td>
    	<td height="25"><?=$row[3].', '.$row[4].' '.namabulan($row[5]).' '.$row[6]?></td>
        <td height="25" align="center">
		<?	if ($row[7] == 1) 
           		echo 'Aktif'.$siswa; 
			else
			echo 'Tidak Aktif'.$siswa;			
		?></td>
	  </tr>
	<?		}		?>			
	</table>
	</td>
</tr>
<!--<tr>
   	<td align="right">Halaman <strong><?=$page+1?></strong> dari <strong><?=$total?></strong> halaman</td>
</tr>-->
<!-- END TABLE CENTER -->  
</table>
</body>
<script language="javascript">
window.print();
</script>
</html>