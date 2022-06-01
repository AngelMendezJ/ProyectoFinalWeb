$(document).ready(function(){
	$('#formularioGrupos').validate({
		submitHandler: function(){
		$.post("alta_grupos.php",
			{
				nombre: $("#nombre").val(),
				pais_origen: $("#pais_origen").val(),
			},
			function(data, status){
				alert(data);
				$("#formularioGrupos").trigger("reset");
			});
		},

		rules: {
			nombre: {
				required: true,
				minlength: 2,
				maxlength: 50
			},
			pais_origen: {
                                required: true,
				minlength: 2,
				maxlength: 50,
                        }
		},

		messagges: {
			nombre: {
				required: "Campo obligatorio",
				minlenght: "Nombre debe tener minimo 2 caracteres",
				maxlenght: "Nombre debe tener maximo 50 caracteres"
			},
			pais_origen: {
                                required: "Campo obligatorio",
                                minlenght: "Pais de origen debe tener minimo 2 caracteres",
                                maxlenght: "pais de origen debe tener maximo 50 caracteres"
                        }
		}
	});

});
