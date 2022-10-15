<?php

	include 'conn.php';
	
	$nosantri = $_POST['nosantri'];
	$namasantri = $_POST['namasantri'];
	$asalsantri = $_POST['asalsantri'];
	$notelpsantri = $_POST['notelpsantri'];
	
	$connect->query("INSERT INTO tb_pesertasantri (no_santri,nama_santri,asal_santri,no_telp_santri) VALUES ('".$nosantri."','".$namasantri."','".$asalsantri."','".$notelpsantri."')");

?>