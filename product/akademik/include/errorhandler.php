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
set_error_handler('errorHandler');

function errorHandler ($errno, $errstr, $errfile, $errline, $errcontext) 
{
   switch ($errno) 
   {
      case E_USER_WARNING:
      case E_USER_NOTICE:
      case E_WARNING:
      case E_NOTICE:
      case E_CORE_WARNING:
      case E_COMPILE_WARNING:
         break;
      case E_USER_ERROR:
      case E_ERROR:
      case E_PARSE:
      case E_CORE_ERROR:
      case E_COMPILE_ERROR:

		 session_name("jbsakad");
		 session_start();	  	 
		
		 $MYSQL_ERRNO = mysql_errno();
		 if ($MYSQL_ERRNO > 0) 
		 {
			$_SESSION['errtype'] = 1; //mysql
			$_SESSION['errno'] = $MYSQL_ERRNO;
			$_SESSION['errmsg'] = mysql_error();
		 } 
		 else 
		 {
			$errorstring = "<h3>" .date('Y-m-d H:i:s') ."</h3>\n";
			$errorstring .= "<p>Fatal Error (# $errno): $errstr .</p>\n";
		    $errorstring .= "<p>Error in line $errline of file '$errfile'.</p>\n";
            $errorstring .= "<p>Script: '{$_SERVER['PHP_SELF']}'.</p>\n";
			
			$_SESSION['errtype'] = 2; //php
			$_SESSION['errno'] = $errno;
			$_SESSION['errmsg'] = $errorstring;
		 } 
		
		 if (file_exists("displayerror.php"))
		 {
			 echo "<script language='javascript'>";
			 echo "document.location.href = 'displayerror.php';";
			 echo "</script>";
		 }
		 elseif (file_exists("include/displayerror.php"))
   		 {
			 echo "<script language='javascript'>";
			 echo "document.location.href = 'include/displayerror.php';";
			 echo "</script>";
		 }
		 elseif (file_exists("../include/displayerror.php"))
		 {
			 echo "<script language='javascript'>";
			 echo "document.location.href = '../include/displayerror.php';";
			 echo "</script>";
		 }
		 elseif (file_exists("../../include/displayerror.php"))
		 {
			 echo "<script language='javascript'>";
			 echo "document.location.href = '../../include/displayerror.php';";
			 echo "</script>";
		 }
			
      default:
         break;
   } // switch
} // errorHandler
?>