
<?php
//Connect COnfiguration file
$hostname="localhost"; //local server name default localhost
$mysql_username="root";  //mysql username default is root.
$mysql_password="daniel123";       
$database="msh_db";  

//API login Credentials
$username="mshexchange";
$password="Mshexchange1#@!";

$con=mysql_connect($hostname,$mysql_username,$mysql_password);
if(!$con)
{
        die('Connection Failed'.mysql_error());
}

mysql_select_db($database,$con);

?>