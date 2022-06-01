$(document).ready(function(){
	$('#formularioDiscos').validate({
		submitHandler: function(){
		$.post("alta_discos.php",
			{
				titulo: $("#titulo").val(),
				grupo_id: $("#grupo_id").val(),
				anio: $("#anio").val(),
				genero: $("#genero").val(),
				disquera_id: $("#disquera_id").val(),
				productor_id: $("#productor_id").val(),
				costo: $("#costo").val(),
			},
			function(data, status){
				alert(data);
				$("#formularioDiscos").trigger("reset");
			});
		},

		rules: {
			titulo: {
				required: true,
				minlength: 2,
				maxlength: 50
			},
			grupo_id: {
                                required: true,
                                minlength: 1,
                                maxlength: 10
                        },
			anio: {
                                required: true
                        },
			genero: {
                                required: true,
                                minlength: 2,
                                maxlength: 50
                        },
			disquera_id: {
                                required: true,
                                minlength: 1,
                                maxlength: 10
                        },
			productor_id: {
                                required: true,
                                minlength: 1,
                                maxlength: 10
                        },
			costo: {
                                required: true,
				number: true,
                                minlength: 2,
                                maxlength: 7
                        }
		},

		messagges: {
			titulo: {
				required: "Campo obligatorio",
				minlenght: "Titulo debe tener minimo 2 caracteres",
				maxlenght: "Titulo debe tener maximo 50 caracteres"
			},
			grupo_id: {
                                required: "Campo obligatorio",
                                minlenght: "Grupo debe tener minimo 1 numero",
                                maxlenght: "Grupo Paterno tener maximo 10 numeros"
                        },
			anio: {
                                required: "Campo obligatorio"
                        },
			genero: {
                                required: "Campo obligatorio",
                                minlenght: "Genero debe tener minimo 2 caracteres",
                                maxlenght: "Genero debe tener maximo 50 caracteres"
                        },
			disquera_id: {
                                required: "Campo obligatorio",
                                minlenght: "Disquera debe tener minimo 1 numero",
                                maxlenght: "Disquera debe tener maximo 10 numeros"
                        },
			productor_id: {
                                required: "Campo obligatorio",
                                minlenght: "Productor debe tener minimo 1 numero",
                                maxlenght: "Productor debe tener maximo 10 numeros"
                        },
			costo: {
                                required: "Campo obligatorio",
                                minlenght: "Costo debe tener minimo 2 caracteres",
                                maxlenght: "Costo debe tener maximo 7 caracteres"
                        }
		}
	});

});
