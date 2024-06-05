<?php
define('DB_HOST', 'localhost');
define('DB_USER', 'id21297521_userdata');
define('DB_PASS', '23April2003_');
define('DB_NAME', 'id21297521_data');

$conn = new mysqli(DB_HOST,DB_USER,DB_PASS,DB_NAME);
if(mysqli_connect_errno()){
	echo "Failed to connect to MySQL Server"
		.mysqli_connect_error();
	die();
}
?>
