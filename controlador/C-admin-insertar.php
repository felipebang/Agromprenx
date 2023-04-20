<?php
include('../Modelo/conexion.php');
include('../Modelo/config.php');


if (isset($_POST['agregar'])) {
    //print_r($_POST);
    $nombre = $_POST['nombre'];
    $descripcion = $_POST['descripcion'];
    $precio = $_POST['precio'];

    $validar = mysqli_query($conn, "SELECT * FROM `proyectos` WHERE nombre = '$nombre'") or die('query failed');

    if (mysqli_num_rows($validar) > 0) {
        echo "<script>
        alert('¡Este producto ya existente!');
        window.location= '../vista/V-admin-insertar.php'
    </script>";
    }
    // $resultado = $objconexion->consultar("SELECT * FROM `proyectos`");


    //print_r($_POST);

    else {
        $fecha = new DateTime();
        $imagen = $fecha->getTimestamp() . "_" . $_FILES['archivo']['name'];
        $imagen_temporal = $_FILES['archivo']['tmp_name'];
        move_uploaded_file($imagen_temporal, "../imagenes/" . $imagen);

        $objconexion = new conexion();
        $sql = "INSERT INTO `proyectos` (`id`, `nombre`, `imagen`, `descripcion`, `precio`) VALUES (NULL, '$nombre', '$imagen', '$descripcion', '$precio');";
        $objconexion->ejecutar($sql);
        echo "<script>
            alert('Producto Registrado con Éxito');
            window.location= '../vista/V-admin-insertar.php'
        </script>";
    }

    //header("location:portafolio.php");
} else {
    header("location:../vista/V-admin-table.php");
}
