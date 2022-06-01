$(document).ready(function(){
	$('#login-form').validate({
		submitHandler: function(){
		$.post("peticiones/login.php",
			{
				username: $("#username").val(),
				contrasena: $("#contrasena").val(),
			},
			function(data, status){
				$("#formulario").trigger("reset");
				if(data == "1"){
					window.location.href = "index.php";
				}else{
					alert(data);
				}
			});
		},

		rules: {
			username: {
                                required: true,
				minlength: 3,
				maxlength: 50
			},
			contrasena: {
                                required: true,
				minlength: 8,
				maxlength: 15
                        },
		},

		messagges: {
			username: {
                                required: "Campo obligatorio",
                                minlength: "Nombre de usuario debe tener minimo 2 caracteres",
                                maxlength: "Nombre debe tener maximo 50 caracteres"
                        },
			contrasena: {
                                required: "Campo obligatorio",
				minlength: "Contraseña debe de ser de minimo 8 caracteres",
				maxlength: "Contraseña debe de ser de maximo 15 caracteres"
                      	}
		}
	});

});

