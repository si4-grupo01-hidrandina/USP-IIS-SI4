<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title></title>
</head>
<body>
	<?php
		$serverName = "DESKTOP-BSPKEE5\SQLEXPRESS";
		$connectionInfo = array( "Database"=>"BDTFH", "UID"=>"epsb", "PWD"=>"end12345");
		$conn = sqlsrv_connect( $serverName, $connectionInfo);
	?>
</body>
</html>