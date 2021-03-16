<?php
require_once("../Modelo/pelicula.php");
$objPelicula=new Pelicula;
switch($_POST['opcion'])
{
	case 'consultar':
		$datos=$objPelicula->ObtenerTodos();
		$img = "";
		$card = "";
		foreach($datos as $fila)
		{
			$card .= "<div class='card m-4' style='width: 18rem;'><img class='card-img-top' src='img peliculas/".$fila['titulo'].".jpg' alt='Card image cap'><div class='card-body'><h5 class='card-title'>".$fila['titulo']."</h5><a href='pelicula.html?Id=".$fila['Id']."' class='btn btn-primary'>Ver mas</a></div></div>";
			$img.= "<a href='pelicula.html?Id=".$fila['Id']."' class='col-3 py-3'><img class='w-100' src='img peliculas/".$fila['titulo'].".jpg' alt='...'></a>";
		}
		echo $card;
		break;
	case 'consultaxcodigo':
		$filtro['Id']=$_POST['codigo'];
		echo json_encode($datos=$objPelicula->ObtenerFiltro($filtro));
		break;
}
?>
