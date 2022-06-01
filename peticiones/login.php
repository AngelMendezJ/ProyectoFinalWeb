<?php
	require_once '../conexion.php';
	$username = $_POST['username'];
	$contrasena = $_POST['contrasena'];

	if(preg_match('/[A-Za-z áéíóúñ]{2,50}/i', $username)){
        	if(preg_match('/[A-Za-z áéíóúñ]{2,50}/i', $contrasena)){
			$sql = "SELECT * FROM bdrecords.usuarios WHERE username = '$username';";
			$result = pg_query($con, $sql);
			if($result){
				$user = pg_fetch_all($result, PGSQL_ASSOC);

				if(password_verify($contrasena, $user[0]['contrasena'])){
					session_start();
					$_SESSION['usuario'] = $user[0];
					echo true;
				}else{
					echo 'La contraseña es incorrecta';
				}
			}else{
				echo 'El nombre de usuario es incorrecto';
			}
		}
	}

?>
