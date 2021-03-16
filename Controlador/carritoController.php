<?php
require_once("../Modelo/carrito.php");
$objCarrito=new Carrito;
session_start();
switch($_POST['opcion'])
{
	case 'ingresar':
    $dato['id_persona']=$_SESSION['usuario'];
    $dato['id_pelicula']=$_POST['codigo'];
    echo $objCarrito->nuevo($dato);
	break;
	case 'consultar':
	$filtro=$_SESSION['usuario'];
	$carrito=$objCarrito->ObtenerCarrito($filtro);
	$etiqueta="";
	$i=1;
	$total=0;
	foreach ($carrito as $c) {
		$etiqueta.="<div class='row'>	<div class='col-1 display-1 text-light'>".$i."</div><img class='col-1 h1 text-light' src='img peliculas/".$c['titulo'].".jpg' alt='...'><p class='col h1 text-light'>".$c['titulo']."</p><p class='col-1 h1 text-light'>$".$c['precio']."</p><div class='col-1'><button class='btn btn-outline-light' type='button' onclick='borrar(".$c['Id_carrito'].")'>Eliminar</button></div></div><hr class='bg-light'>";
		$i++;
		$total=$total+$c['precio'];
	}
	$etiqueta.="<div class='row justify-content-between'><p class='col-6 text-light h3'>Total de alquiler</p><p class='col-2 text-light h5'>$".$total."</p></div>";
	echo $etiqueta;
	break;
	case 'borrar':
	$id=$_POST['id'];
	echo $objCarrito->borrar($id);
	break;
}
?>
