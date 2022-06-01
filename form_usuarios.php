<?php require_once 'templates/header.php'; ?>
<body class="flex flex-col justify-center items-center">
        <script src="js/jquery-3.6.0.js"></script>
        <script src="js/ajaxformusuarios.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>
	<div class="rounded shadow-lg overflow-hidden w-6/12 flex flex-col p-5 mt-5 mb-5">
		<h1 class="uppercase text-indigo-600 font-bold text-4xl mb-5">Formulario para registro de usuarios</h1>
		<form id="formularioUsuarios">
			<div class="w-full flex flex-col mb-5">
				<label for="username" class="text-gray-700 uppercase font-bold">Nombre de usuario: </label>
				<input type="text" name="username" id="username" class="border-2 w-full p-2 mt-2 placeholder-gray-400 rounded-md">
			</div>
			<div class="w-full flex flex-col mb-5">
				<label for="nombre" class="text-gray-700 uppercase font-bold">Nombre: </label>
				<input type="text" name="nombre" id="nombre" class="border-2 w-full p-2 mt-2 placeholder-gray-400 rounded-md">
			</div>
			<div class="w-full flex flex-col mb-5">
				<label for="apaterno" class="text-gray-700 uppercase font-bold">Apellido Paterno: </label>
				<input type="text" name="apaterno" id="apaterno" class="border-2 w-full p-2 mt-2 placeholder-gray-400 rounded-md">
			</div>
			<div class="w-full flex flex-col mb-5">
				<label for="amaterno" class="text-gray-700 uppercase font-bold">Apellido Materno: </label>
				<input type="text" name="amaterno" id="amaterno" class="border-2 w-full p-2 mt-2 placeholder-gray-400 rounded-md">
			</div>
			<div class="w-full flex flex-col mb-5">
				<label for="contrasena" class="text-gray-700 uppercase font-bold">Contraseña: </label>
				<input type="password" name="contrasena" id="contrasena" class="border-2 w-full p-2 mt-2 placeholder-gray-400 rounded-md">
			</div>

			<button type="submit" id="enviar" class="bg-indigo-700 w-full py-3 px-10 rounded-xl text-white uppercase font-bold mt-5 hover: cursor-pointer hover:bg-indigo-800 md:w-auto">Confirmar</button>
		</form>
	</div>
<?php require_once 'templates/footer.php'; ?>
