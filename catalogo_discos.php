<?php require_once 'templates/header.php'; ?>

<?php 
  if(!isUser()){

    header('Location: index.php');
  }
?>

  <body>

    <?php require_once 'templates/menu.php'; ?>
      <div class="flex flex-col justify-center items-center mt-5 mb-5">
        <div class="rounded shadow-lg overflow-hidden w-6/12 flex flex-col p-4">
          <h1 class="uppercase text-indigo-600 font-bold text-4xl mb-5">Catálogo de discos</h1>
          <button id="agregar" class="bg-indigo-700 w-full py-3 px-10 rounded-xl text-white uppercase font-bold mt-5 hover: cursor-pointer hover:bg-indigo-800 md:w-auto">Agregar disco</button>

          </br>
          </br>
          <table class="neumorphic">
            <thead>
              <tr>
                <th>Disco</th>
                <th>Grupo</th>
                <th>Edit</th>
                <th>Delete</th>
              </tr>
            </thead>
            <tbody>
              <!--Hacer un ciclo for para la tabla-->
              <tr>
                <td class="items-center">disco 1aaaaaaaaaaaaaaaaaaaaaaaa</td>
                <td class="items-center">grupo 1aaaaaaaaaaaaaaaaaaaaaaa</td>
                <td class="items-center" style="cursor: pointer;"><i class="bi bi-pencil-square"></i></td>
                <td class="items-center" style="cursor: pointer;"><i class="bi bi-trash-fill"></i></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
  <?php require_once 'templates/footer.php'; ?>