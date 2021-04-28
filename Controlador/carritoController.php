<?php
require_once("../Modelo/carrito.php");
$objCarrito=new Carrito;
session_start();
switch($_POST['opcion'])
{
	case 'ingresar':
    $dato['id_persona']=$_SESSION['id'];
    $dato['id_pelicula']=$_POST['codigo'];
    echo $objCarrito->nuevo($dato);
	break;
	case 'consultar':
	$filtro=$_SESSION['id'];
	$carrito=$objCarrito->ObtenerCarrito($filtro);
	$etiqueta="";
	$i=1;
	$total=0;
	foreach ($carrito as $c) {
		$etiqueta.="<tr>
						<td>
							<button class='btn btn-danger' onclick='eliminarPelicula(".$c['Id_carrito'].")'>Eliminar</button>
						</td>
						<td>
							<img src='img peliculas/".$c['titulo'].".jpg' height='150'>
						</td>
						<td>".$c['titulo']."</td>
						<td>$".$c['precio']."</td>
					</tr>";
		// $etiqueta.="<div class='row'>	<div class='col-1 display-1 text-dark'>".$i."</div><img class='col-1 h1 text-dark' src='img peliculas/".$c['titulo'].".jpg' alt='...'><p class='col h1 text-dark'>".$c['titulo']."</p><p class='col-1 h1 text-dark'>$".$c['precio']."</p><div class='col-1'><button class='btn btn-outline-light' type='button' onclick='borrar(".$c['Id_carrito'].")'>Eliminar</button></div></div><hr class='bg-light'>";
		$i++;
		$total=$total+$c['precio'];
	}
	// $etiqueta.="<div class='row justify-content-between'><p class='col-6 text-light h3'>Total de alquiler</p><p class='col-2 text-light h5'>$".$total."</p></div>";
	$etiqueta.="<tr><td colspan='2'></td><td class='h3'>Total</td><td class='h3'>$".$total."</td></tr>";
	echo $etiqueta;
	break;
	case 'borrar':
	$id=$_POST['id'];
	echo $objCarrito->borrar($id);
	break;
}
?>