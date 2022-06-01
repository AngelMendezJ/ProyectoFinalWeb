<?php 
	session_start();
	if(isset($_SESSION) && isset($_SESSION['usuario'])){
		header("Location: catalogo_discos.php");
	}
?>
<?php require_once 'templates/header.php'; ?>
    <body class="login">

		<div class="container-login">
		  <div class="brand-logo"></div>
		  <div class="brand-title">INICIAR SESIÓN</div>
		  <div class="inputs">

		  	<form id="login-form" class="form" action="./peticiones/login.php" method="post">
		    
		        <label for="username">USUARIO:</label>
		        <input type="text" name="username" id="username" placeholder="Usuario">
		        
				<label for="contrasena">CONTRASEÑA:</label>
		        <input type="password" name="contrasena" id="contrasena" placeholder="Min 6 caracteres">
		        
		        <button type="submit">LOGIN</button>
		       
			</form>
		  </div>

		  <a class="button-reg" href="./form_usuarios.php">Registrate aquí</a>
		  <a class="credits" href="creditos.html">CRÉDITOS</a>
		</div>
<?php require_once 'templates/footer.php'; ?>>
