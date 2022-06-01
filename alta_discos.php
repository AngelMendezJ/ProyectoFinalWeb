<?php
	include 'conexion.php';
	$titulo = strip_tags($_POST['titulo']);
	$grupo_id = strip_tags($_POST['grupo_id']);
	$anio = strip_tags($_POST['anio']);
	$genero = strip_tags($_POST['genero']);
	$disquera_id = strip_tags($_POST['disquera_id']);
	$productor_id = strip_tags($_POST['productor_id']);
	$costo = strip_tags($_POST['costo']);


	if(preg_match('/[A-Za-z áéíóúñ]{2,50}/i', $titulo)){
		if(preg_match('/^[1-9][0-9]{1,10}$/i', $grupo_id)){
                        if(preg_match('/[A-Za-z áéíóúñ]{2,50}/i', $genero)){
				if(preg_match('/^[1-9][0-9]{0,10}$/i', $disquera_id)){
                       			if(preg_match('/^[1-9][0-9]{0,10}$/i', $productor_id)){
                                		if(preg_match('/^-?(\d|[1-9]+\d*|\.\d+|0\.\d+|[1-9]+\d*\.\d+){2,7}$/', $costo)){
                        				$insercion= "insert into bdrecords.discos(titulo,grupo_id,año,genero,disquera_id,productor_id,costo) values('$titulo','$grupo_id','$anio','$genero','$disquera_id','$productor_id','$costo')";
        						$query = pg_query($con,$insercion);
        						if($query){
                						echo "Se ha almacenado en la base de datos de forma correcta  ";
        						} else {
                						echo "  No se ha podido almacenar en la base de datos  ";
        						}
        						pg_close($con);
                				}
	                		}
        			}
			}
		}
	}
	else {
		echo "  Los datos no son validos  ";
	}
?>
