<?php
	include 'conexion.php';
	$titulo = strip_tags($_POST['titulo']);


	if(preg_match('/[A-Z a-z áéíóúñ]{2,50}/i', $titulo)){
		$insercion= "insert into bdrecords.canciones(titulo) values('$titulo')";
        	$query = pg_query($con,$insercion);
        	if($query){
                	echo "Se ha almacenado en la base de datos de forma correcta  ";
        	} else {
                	echo "  No se ha podido almacenar en la base de datos  ";
        	}
        	pg_close($con);
	}
	else {
		echo "  Los datos no son validos  ";
	}
?>
