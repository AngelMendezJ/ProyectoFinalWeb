<?php
	include 'conexion.php';
	$nombre = strip_tags($_POST['nombre']);
	$pais_origen = strip_tags($_POST['pais_origen']);


	if(preg_match('/[A-Za-z áéíóúñ]{2,50}/i', $nombre)){
		if(preg_match('/[A-Za-z áéíóúñ]{2,50}/i', $pais_origen)){
                        $insercion= "insert into bdrecords.grupos(nombre,pais_origen) values('$nombre','$pais_origen')";
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
