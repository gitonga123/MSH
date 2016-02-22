<?php

$hostname="localhost"; //local server name default localhost
$mysql_username="root";  //mysql username default is root.
$mysql_password="ironlionzion";       
$database="Lab_db";  

//API login Credentials
//$username="mshexchange";
//$password="Mshexchange1#@!";
$username="Bootcamp";
$password="Bootcamp2015";
$con=mysql_connect($hostname,$mysql_username,$mysql_password);
if(!$con)
{
        die('Connection Failed'.mysql_error());
}

mysql_select_db($database,$con);

?>