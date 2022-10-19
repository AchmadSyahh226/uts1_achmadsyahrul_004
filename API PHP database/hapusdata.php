<?php

	include 'conn.php';

	$nosantri = $_POST['nosantri'];
	
	$connect->query("DELETE FROM tb_pesertasantri WHERE no_santri='".$nosantri."' ")
	
?>