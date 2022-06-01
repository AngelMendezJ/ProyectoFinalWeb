$(document).ready(function(){
	$('#formularioCanciones').validate({
		submitHandler: function(){
		$.post("alta_canciones.php",
			{
				titulo: $("#titulo").val(),
			},
			function(data, status){
				alert(data);
				$("#formularioCanciones").trigger("reset");
			});
		},

		rules: {
			titulo: {
				required: true,
				minlength: 2,
				maxlength: 50
			}
		},

		messagges: {
			titulo: {
				required: "Campo obligatorio",
				minlenght: "Nombre debe tener minimo 2 caracteres",
				maxlenght: "Nombre debe tener maximo 50 caracteres"
			}
		}
	});

});
