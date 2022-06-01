<?php
	include 'conexion.php';
	$nombre = strip_tags($_POST['nombre']);
	$apellido = strip_tags($_POST['apellido']);
	$fecha_nacimiento = strip_tags($_POST['fecha_nacimiento']);


	if(preg_match('/[A-Za-z áéíóúñ]{2,50}/i', $nombre)){
		if(preg_match('/[A-Za-z áéíóúñ]{2,50}/i', $apellido)){
                        $insercion= "insert into bdrecords.productores(nombre,apellido,fecha_nacimiento) values('$nombre','$apellido','$fecha_nacimiento')";
        		$query = pg_query($con,$insercion);
        		if($query){
                		echo "Se ha almacenado en la base de datos de forma correcta  ";
        		} else {
                		echo "  No se ha podido almacenar en la base de datos  ";
        		}
        		pg_close($con);
		}
	}
	else {
		echo "  Los datos no son validos  ";
	}
?>
