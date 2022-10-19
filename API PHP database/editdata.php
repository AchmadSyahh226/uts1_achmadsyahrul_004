<?php

	include 'conn.php';
	

	$nosantri = $_POST['nosantri'];
	$namasantri = $_POST['namasantri'];
	$asalsantri = $_POST['asalsantri'];
	$notelpsantri = $_POST['notelpsantri'];

	$connect->query("UPDATE tb_pesertasantri SET nama_santri='".$namasantri."', asal_santri='".$asalsantri."', no_telp_santri='".$notelpsantri."' WHERE no_santri='".$nosantri."' ")
	
?>