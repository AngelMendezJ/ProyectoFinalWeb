<?php
	include 'conexion.php';
	$username = strip_tags($_POST['username']);
	$nombre = strip_tags($_POST['nombre']);
	$apaterno = strip_tags($_POST['apaterno']);
	$amaterno = strip_tags($_POST['amaterno']);
	$contrasena = strip_tags($_POST['contrasena']);

	if(preg_match('/[A-Za-z áéíóúñ]{2,50}/i', $username)){
	if(preg_match('/[A-Za-z áéíóúñ]{2,50}/i', $nombre)){
		if(preg_match('/[A-Za-z áéíóúñ]{2,50}/i', $apaterno)){
            if(preg_match('/[A-Za-z áéíóúñ]{2,50}/i', $amaterno)){
				if(preg_match('/[A-Za-z áéíóúñ]{2,50}/i', $contrasena)){

						$sql = "SELECT * FROM bdrecords.usuarios WHERE username = '$username';";
						$result = pg_query($con,$sql);
						if(!empty(pg_fetch_all($result, PGSQL_ASSOC))){

							echo 'Ya existe ese nombre de usuario, prueba con otro';
						}else{

							$contrasena = password_hash($contrasena, PASSWORD_DEFAULT);
							$insercion= "insert into bdrecords.usuarios(nombre,username,apaterno,amaterno,contrasena) values('$nombre','$username','$apaterno','$amaterno','$contrasena')";
							$query = pg_query($con,$insercion);
							if($query){
									echo true;
							} else {
									echo "  No se ha podido almacenar en la base de datos  ";
							}
							pg_close($con);
						}
					
                }
	        }
        }
	}
	}else {
		echo "  Los datos no son validos  ";
	}
?>
