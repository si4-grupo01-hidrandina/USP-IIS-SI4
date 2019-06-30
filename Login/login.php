<!DOCTYPE html>
<?php
	include ('conexion.php');
?>
<html lang="es">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE-edge">
<meta name="viewport" content="width-device-with, initial-scaled-1">
<title>Login</title>
<!-- Boostracp core CSS -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
</head>
<body>
	<div class="col-md-8 col-md-offset-2">
		<h1>LOGIN TEST</h1>
		<form method="POST" action="index.php">
			<div class="form-group">
				<label>Usuario:</label>
				<input type="text" name="usuario" class="form-control" placeholder="Usuario">
			</div>
			<div class="form-group">
				<label>Contraseña:</label>
				<input type="text" name="password" class="form-control" placeholder="Contraseña">
			</div>
			<div class="form-group">
				<label>Correo Electrónico:</label>
				<input type="text" name="email" class="form-control" placeholder="Correo Electrónico">
			</div>
			<div class="form-group">
				<input type="submit" name="insert" class="btn btn-warning" value="Insertar Datos">
			</div>
		</form>
	</div>
<br /><br /><br />

	<?php
		if (isset($_POST['insert'])) {
			$usuario = $_POST['usuario'];
			$password = $_POST['password'];
			$email = $_POST['email'];

			$insertar = "INSERT INTO Usuario(usu_nombre, usu_password, usu_email) VALUES('$usuario', '$password', '$email')";
			$ejecutar = sqlsrv_query($conn, $insertar);
			if ($ejecutar) {
				echo "<h3>Insertado Correctamente</h3>";
			}
		}
	?>

	<div class="col-md-8 col-md-offset-2">
		<table class="table table-bordered table-responsive">
			<tr>
				<td>ID</td>
				<td>Usuario</td>
				<td>Password</td>
				<td>Email</td>
				<td>Acción</td>
				<td>Acción</td>
			</tr>
			<?php
				$consulta = "SELECT * FROM USUARIO";
				$ejecutar = sqlsrv_query($conn, $consulta);
				$i=0;
				while ($fila = sqlsrv_fetch_array($ejecutar)) {
					$id = $fila['usu_id'];
					$usuario = $fila['usu_nombre'];
					$password = $fila['usu_password'];
					$email = $fila['usu_email'];
					$i++;
				}
			?>
			<tr align="center">
				<td><?php echo $id; ?></td>
				<td><?php echo $usuario; ?></td>
				<td><?php echo $password; ?></td>
				<td><?php echo $email; ?></td>
				<td><a href="index.php?editar=<?php echo $id; ?>">Editar</a></td>
				<td><a href="index.php?eliminar=<?php echo $id; ?>">Eliminar</a></td>
			</tr>
		</table>
	</div>
</body>
</html>