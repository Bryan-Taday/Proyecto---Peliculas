<?php
require_once("../Modelo/usuario.php");
$objUsuario=new Usuario;
session_start();
switch($_POST['opcion'])
{
	case 'Admin_Or_Client':
	if ($_POST['pagina'] == $_SESSION['tipo_usuario']) {
		$boo = false;
	}else {
		$boo = true;
	}
	echo $boo;
	break;
	case 'consultar':
		$datos=$objUsuario->ObtenerTodos();
    foreach($datos as $fila)
		{
			if ($fila['Id']==1/*$_SESSION['usuario']*/) {
				echo $fila['Nombre']." ".$fila['Apellido'];
				exit;
			}
		}
		break;
	case 'close':
		session_destroy();
		echo "Sesion cerrada";
		break;
	case 'usuario':
		echo $_SESSION['usuario'];
		break;
	case 'ingresar':
		$datos['nombre']=$_POST['Nombre'];
		$datos['apellido']=$_POST['Apellido'];
		$datos['email']=$_POST['email'];
		$datos['pass']=$_POST['pass'];
			if($objUsuario->nuevo($datos))
			{
				echo "Registro ingresado";
			}
			else
			{
				echo "Error al registrar".$objUsuario->geterror();
			}
		break;
}
?>
