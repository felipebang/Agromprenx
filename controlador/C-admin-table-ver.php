<?php
include('../Modelo/config.php');

    

$resultado = mysqli_query($conn, "SELECT * FROM `proyectos`") or die('query failed');

/*if (mysqli_num_rows($resultado) > 0) {
  while ($fetch_cart = mysqli_fetch_assoc($resultado)) {
print_r($fetch_cart);

  }
}else{
    echo "No Hay productos";
  }*/
?>
