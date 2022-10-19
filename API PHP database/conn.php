<?php

$connect = new mysqli("localhost","root","","my_app_crud");

if ($connect) {
	
}else {
	echo "Connection Failed";
	exit();
}
