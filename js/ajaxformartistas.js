$(document).ready(function(){
	$('#formularioArtistas').validate({
		submitHandler: function(){
		$.post("alta_artistas.php",
			{
				nombre: $("#nombre").val(),
				apellido: $("#apellido").val(),
				pais_nacimiento: $("#pais_nacimiento").val(),
				fecha_nacimiento: $("#fecha_nacimiento").val(),
				nombre_artistico: $("#nombre_artistico").val(),
			},
			function(data, status){
				alert(data);
				$("#formularioArtistas").trigger("reset");
			});
		},

		rules: {
			nombre: {
				required: true,
				minlength: 2,
				maxlength: 50
			},
			apellido: {
                                required: true,
                                minlength: 2,
                                maxlength: 50
                        },
			pais_nacimiento: {
                                required: true,
				minlength: 2,
				maxlength: 50
                        },
			fecha_nacimiento: {
                                required: true,
                        },
			nombre_artistico: {
                                required: true,
                                minlength: 2,
                                maxlength: 50
                        }
		},

		messagges: {
			nombre: {
				required: "Campo obligatorio",
				minlenght: "Nombre debe tener minimo 2 caracteres",
				maxlenght: "Nombre debe tener maximo 50 caracteres"
			},
			apellido: {
                                required: "Campo obligatorio",
                                minlenght: "Apellido debe tener minimo 2 caracteres",
                                maxlenght: "Apellido Paterno tener maximo 50 caracteres"
                        },
			pais_nacimiento: {
                                required: "Campo obligatorio",
                                minlenght: "Pais debe tener minimo 2 caracteres",
                                maxlenght: "Pais debe tener maximo 50 caracteres"
                        },
			fecha_nacimiento: {
                                required: "Campo obligatorio",
                        },
			nombre_artistico: {
                                required: "Campo obligatorio",
                                minlenght: "Nombre artistico debe tener minimo 2 caracteres",
                                maxlenght: "Nombre artistico debe tener maximo 50 caracteres"
                        }
		}
	});

});
