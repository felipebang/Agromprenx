<?php 
include('../Modelo/conexion.php'); 
include('../Modelo/config.php');
session_start();
if (isset($_SESSION['usuario']) != "admin") {
  header("location:../vista/V-products.php");
}


?>

<?php
if(isset($_POST['submit'])){
    //print_r($_GET);
    $id = $_POST['id'];
    $nombre = $_POST['nombre'];
    $image = $_POST['img'];
    $descrip = $_POST['descrip'];
    $precio = $_POST['precio'];
    //print_r($image);
}
?>

<?php
if (isset($_POST['editarProduct'])) {
    $identificar = $_POST['id'];
    $newNombre = $_POST['newName'];
    $newDescrip = $_POST['newDescrip'];
    $valor = $_POST['valor'];

   /* $validar = mysqli_query($conn, "SELECT * FROM `proyectos` WHERE nombre = '$newNombre'") or die('query failed');

    if(mysqli_num_rows($validar ) > 0){
        echo "<script>
        alert('¡Este nombre de producto ya existente!');
        window.location= '../vista/V-admin-table.php'
    </script>";
    }else{*/
        
        //Eliminar imagen de la carpeta imagenes
        $objconexion = new conexion();
        $imagen = $objconexion->consultar("SELECT imagen FROM `proyectos` WHERE id= $identificar");
        unlink("../imagenes/" . $imagen[0]['imagen']);

        //Guardar nueva imagen en la carpeta imagenes
        $fecha = new DateTime();
        $imagen_guardad = $fecha->getTimestamp() . "_" . $_FILES['archivo']['name'];
        $imagen_temporal = $_FILES['archivo']['tmp_name'];
        move_uploaded_file($imagen_temporal, "../imagenes/" . $imagen_guardad);

        //Ejecutamos Datos actualizados
        $objconexion = new conexion();
        $sql = "UPDATE `proyectos` SET `nombre` = '$newNombre', `imagen` = '$imagen_guardad', `descripcion` = '$newDescrip',  `precio` = '$valor' WHERE `proyectos`.`id` = $identificar;";
        $objconexion->ejecutar($sql);
        
        echo "<script>
        alert('Producto modificado con éxito');
        window.location= '../vista/V-admin-table.php'
        </script>";
    //}

}


?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificar</title>
    <link rel="stylesheet" href="../CSS/admin-style.css">
      <!--Favicon-->
  <link rel="shortcut icon" href="../IMG/media.png" type="image/x-icon">

    
</head>

<body>
    <br><br>
    <section class="form-editar">
        <form action="./C-admin-editar.php" method="post" enctype="multipart/form-data">
            <h2 class="form-title">Modificar producto</h2>

            <input type="hidden" name="id" value="<?php echo $id; ?>">

            <label>Modificar nombre</label>
            <input type="text" name="newName" value="<?php echo $nombre; ?>">

            <label>Modificar nombre</label>
            <img src="../imagenes/<?php echo $image; ?>" alt="">
            <input type="file" required name="archivo" id="" value="<?php echo $image; ?>" >

            <input type="hidden" name="imgBorrar" id=""  value="<?php echo $image; ?>">


            <label>Modificar precio</label>
            <input type="number" name="valor" id=""  value="<?php echo $precio; ?>">

            <label class="label-editar">Modificar descripción</label>
            <textarea class="descrip-editar" type="text" cols="30" rows="5" name="newDescrip"><?php echo $descrip; ?>
            </textarea>



            <input class="form-btn" type="submit" value="Actualizar" name="editarProduct">
        </form>
    </section>
</body>

</html>