<?php
session_start();
if (isset($_SESSION['usuario']) != "admin") {
    header("location:./V-products.php");
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administracion</title>
    <link rel="stylesheet" href="../CSS/admin-style.css">
      <!--Favicon-->
  <link rel="shortcut icon" href="../IMG/media.png" type="image/x-icon">
</head>

<body>

    <div class="cont-dashboard">
        <div class="con-cerrar">
            <div class="con-user">
                <img src="../IMG/user-solid (1).svg" alt="">
                <a href="../controlador/C-admin-cerrar.php">Cerrar sesión</a>
            </div>
        </div>
        <nav>

            <ul>
                <li><a class="activo" href="#">Agregar productos</a></li>
                <li><a href="./V-admin-table.php">Tabla de acciones</a></li>
                <li><a href="./V-admin-listado.php">Lista de productos</a></li>
                <li><a href="./V-admin-ordenes.php">Ordenes de pedidos</a></li>
                <li><a href="./V-admin-gestionar-valores.php">Gestionar valores</a></li>
                <li><a href="./V-admin-ventas.php">Visualizar ventas</a></li>


            </ul>
            <!--  <a href="./cerrar.php">Cerrar Sesion</a>-->

        </nav>

        <section>
            <form action="../controlador/C-admin-insertar.php" method="post" enctype="multipart/form-data">
                <h2 class="form-title">Agregar Producto</h2>

                <label for="nombre">Nombre del producto</label>
                <input type="text" required name="nombre" id=""><br>


                <label for="archivo">Imagen del producto</label>
                <input class="file" type="file" required name="archivo" id=""><br>

                <label for="precio">Precio del producto</label>
                <input type="number" name="precio" id="">

                <label for="descripcion">Descripción del producto</label>
                <textarea name="descripcion" id="" required cols="30" rows="5"></textarea><br>

                <input class="form-btn" type="submit" name="agregar" value="Publicar">

            </form>
        </section>
    </div>

</body>

</html>