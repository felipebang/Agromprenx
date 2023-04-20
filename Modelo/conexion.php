<?php
class conexion{
    private $servidor="localhost";
    private $usuario="root";

    private $contrasenia="";
    private  $database = 'shop_db';
 

    public function __construct(){
        try{
            $this->database = new PDO("mysql:host=$this->servidor;database=shop_db",$this->usuario,$this->contrasenia);
            $this->database ->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
        }catch( PDOException $e){   
        return "falla de database ".$e;

        }
    }
    public function ejecutar($sql){
        $this->database ->exec($sql);
        return $this->database ->lastInsertId();
    }
    public function consultar($sql){
        $sentencia=$this->conexion->prepare($sql);
        $sentencia->execute();
        return $sentencia->fetchAll();
    }
}
?>