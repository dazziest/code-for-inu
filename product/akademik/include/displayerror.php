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
session_name("jbsakad");
session_start();

//echo "Hello<br>";
//	echo $_SESSION['errtype'] . "<br>";
//	echo $_SESSION['errno'] . "<br>";
//	echo $_SESSION['errmsg'] . "<br>";
//	exit();

if ($_SESSION['errno'] != 0) 
{
	$rel = "./";
	if (file_exists("../style/style.css"))
		$rel = "../";
	elseif (file_exists("../../style/style.css"))
		$rel = "../../";
	
	$html1  = "<html><head><link rel='stylesheet' type='text/css' href='". $rel ."style/style.css'></head><body>";
	$html1 .= "<table border='0' width='100%' height='100%'>";
	$html1 .= "<tr height='400'><td align='center' valign='middle' background='". $rel ."images/ico/b_warning.png' style='margin:0;padding:0;background-repeat:no-repeat;'>";
	$html1 .= "<table border='0' width='457' cellpadding='0' cellspacing='0' align='center' background='". $rel ."images/ico/bk_message.jpg'>";
	$html1 .= "<tr height='287'><td align='center' valign='middle'><table border='0' width='85%'><tr><td align='center'>";
	$html2  = "</td></tr></table></td></tr></table></td></tr></table></body></html>";
	
	if ($_SESSION['errtype'] == 1) 
	{
		if ($_SESSION['errno'] == 1451) 
		{
			$errstr  = "<br><br><br><br><br><br><font familiy='arial' color='red' size='3' style='text-decoration:none'><strong>Maaf, anda tidak bisa menghapus data ini karena sedang digunakan!</strong></font><br><br>";
			//$errstr .= "<input class='but' type=\"button\" name=\"Kembali\" value=\"Kembali\" onClick=\"window.history.go(-1);\">";
		}
		else
		{
			$errstr = "<span style='font-family:Calibri; color:#FF0000; font-size:16px'><strong>This system is temporarily unavailable</strong><br>The following error has been reported to the administrator:<br>".$_SESSION['errmsg']."</span><br><br>";
			//$errstr .= "<input class='but' type=\"button\" name=\"Kembali\" value=\"Kembali\" onClick=\"window.history.go(-1);\">";
		}
	} 
	else 
	{
		$errstr  = "<h2>This system is temporarily unavailable</h2>\n";
        $errstr .= "<p>The following has been reported to the administrator:</p>\n";
        $errstr .= "<b><font color='red'>\n" . $_SESSION['errmsg'] . "\n</b></font><br><br>";
		//$errstr .= "<input class='but' type=\"button\" name=\"Kembali\" value=\"Kembali\" onClick=\"window.history.go(-1);\">";
	}
	echo $html1 . $errstr . $html2;
	
    //Dont not display error message again 
	$_SESSION['errno'] = 0;
}
?>