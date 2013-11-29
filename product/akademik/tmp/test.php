<?
require_once("../include/errorhandler.php");
require_once("../include/config.php");
require_once("../include/common.php");
require_once("../include/db_functions.php");

OpenDb();
$sql = "SELECT NOW1()";
$res = QueryDb($sql);
$row = mysql_fetch_row($res);
echo $row[0];
CloseDb();
?>