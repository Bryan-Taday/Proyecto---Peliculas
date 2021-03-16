<?php

require_once("../Modelo/usuario.php");
$objUsuario=new Usuario;

session_start();

$datos = $objUsuario->obtenerSesionUsuario($_POST['correo']);

if( empty($datos) ){
    header("Location: ../Vista/index.html?error=email");
    exit;
}else{
    foreach ($datos as $fila) {
        if($fila['pass'] == $_POST['contrasenia']){
            if( $fila['tipo_usuario'] == 'admin'){
                $_SESSION['id']= $fila['id'];
                $_SESSION['usuario']= $fila['nombre']+$fila['apellido'];
                $_SESSION['tipo_usuario']= $fila['tipo_usuario'];
                header("Location: ../Vista/administrador.html");
                exit;
            }else{
                $_SESSION['id']= $fila['id'];
                $_SESSION['usuario']= $fila['nombre']+$fila['apellido'];
                $_SESSION['tipo_usuario']= $fila['tipo_usuario'];
                header("Location: ../Vista/peliculas.html");
                exit;
            }
        }else{
            header("Location: ../Vista/index.html?error=pass");
            exit;
        }
    }
}
?>
