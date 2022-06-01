$(document).ready(function(){
	$('#formularioProductores').validate({
		submitHandler: function(){
		$.post("alta_productores.php",
			{
				nombre: $("#nombre").val(),
				apellido: $("#apellido").val(),
				fecha_nacimiento: $("#fecha_nacimiento").val(),
			},
			function(data, status){
				alert(data);
				$("#formularioProductores").trigger("reset");
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
			fecha_nacimiento: {
                                required: true,
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
			nacimiento: {
                                required: "Campo obligatorio",
                        }
		}
	});

});
