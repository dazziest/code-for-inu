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
$awal="<br><div align='center'><font color='#FFFFFF'><strong><em>";
$akhir="</em></strong></font></div>";
$hint=$_REQUEST[hint];
switch ($hint){
	case 1 :
		$page=$awal."Cek validasi user staf buat penilaian<br> DONE......<br>Buat kesiswaan + calon siswa blom".$akhir;
		break;
	case 2 :
		$page=$awal."Untuk melakukan proses <br>pendataan Angkatan".$akhir;
		break;
	case 3 :
		$page=$awal."Untuk melakukan proses <br>pendataan Tingkat".$akhir;
		break;
	case 4 :
		$page=$awal."Untuk melakukan proses <br>pendataan Tahun Ajaran".$akhir;
		break;
	case 5 :
		$page=$awal."Untuk melakukan proses <br>pendataan Semester".$akhir;
		break;
	case 6 :
		$page=$awal."Untuk melakukan proses <br>pendataan Kelas".$akhir;
		break;
	case 7 :
		$page=$awal."Untuk melakukan proses <br>pendataan Kepegawaian".$akhir;
		break;
	case 8 :
		$page=$awal."Culip Kasep".$akhir;
		break;
	case 9 :
		$page=$awal."Culip Gendut".$akhir;
		break;
	case 10 :
		$page=$awal."Sweetie Culip".$akhir;
		break;
	case 11 :
		$page=$awal."".$akhir;
		break;
	case 12 :
		$page=$awal."".$akhir;
		break;
	case 13 :
		$page=$awal."".$akhir;
		break;
	case 14 :
		$page=$awal."".$akhir;
		break;
	case 15 :
		$page=$awal."".$akhir;
		break;
	case 16 :
		$page=$awal."".$akhir;
		break;
	case 17 :
		$page=$awal."".$akhir;
		break;
	case 18 :
		$page=$awal."".$akhir;
		break;
	case 19 :
		$page=$awal."".$akhir;
		break;
	case 20 :
		$page=$awal."".$akhir;
		break;
	case 21 :
		$page=$awal."".$akhir;
		break;
	case 22 :
		$page=$awal."".$akhir;
		break;
	case 23 :
		$page=$awal."".$akhir;
		break;
	case 24 :
		$page=$awal."".$akhir;
		break;
	case 25 :
		$page=$awal."".$akhir;
		break;
	case 26 :
		$page=$awal."".$akhir;
		break;
	case 27 :
		$page=$awal."".$akhir;
		break;
	case 28 :
		$page=$awal."".$akhir;
		break;
	case 29 :
		$page=$awal."".$akhir;
		break;
		
	case '' :
		$page="";
		break;						
}
if ($page<>""){
?>
<style type="text/css">
<!--
.style2 {
	color: #FFFFFF;
	font-weight: bold;
	font-size: 36px;
}
-->
</style>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="35" height="54" style="background-image:url(images_slice/hint_01.jpg); background-repeat:no-repeat">&nbsp;</td>
    <td style="background-image:url(images_slice/hint_02.jpg); background-repeat:repeat-x">&nbsp;</td>
    <td width="54" style="background-image:url(images_slice/hint_04.jpg); background-repeat:no-repeat">&nbsp;</td>
  </tr>
  <tr>
    <td width="35" height="14" style="background-image:url(images_slice/hint_05.jpg); background-repeat:repeat-y">&nbsp;</td>
    <td bgcolor="#3A3A44"><?=$page?><br /></td>
    <td style="background-image:url(images_slice/hint_07.jpg); background-repeat:repeat-y">&nbsp;</td>
  </tr>
  <tr>
    <td width="35" height="44" style="background-image:url(images_slice/hint_10.jpg); background-repeat:no-repeat">&nbsp;</td>
    <td style="background-image:url(images_slice/hint_11.jpg); background-repeat:repeat-x">&nbsp;</td>
    <td style="background-image:url(images_slice/hint_12.jpg); background-repeat:no-repeat">&nbsp;</td>
  </tr>
</table>
<?
}
?>