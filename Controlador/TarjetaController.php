<?php
require_once("../modelo/Tarjeta.php");
$objTarjeta=new Tarjeta;
switch($_POST['opcion'])
{
	case 'consultar':
		$datos=$objTarjeta->ObtenerTodos();
		$tabla="";
		foreach($datos as $fila)
		{
			$tabla.="<tr>";
			$tabla.="<th scope='row'>".$fila['id_tarjeta']."</th>";
			$tabla.="<td>".$fila['numero_tarjeta']."</td>";
			$tabla.="<td>".$fila['codigo']."</td>";
			$tabla.="<td>".$fila['fecha_caducidad']."</td>";
			$tabla.="<td><button type='button' class='btn btn-outline-dark' onclick='editar(".$fila['id_tarjeta'].")'>Editar</button></td>";
			$tabla.="<tr>";
		}
		echo $tabla;
		break;

	case 'ingresar':
		$datos['numero_tarjeta']=$_POST['numero_tarjeta'];
		$datos['codigo']=$_POST['codigo'];
		$datos['fecha_caducidad']=$_POST['fecha_caducidad'];
			if($objTarjeta->nuevo($datos))
			{
				echo "Registro ingresado";
			}
			else
			{
				echo "Error al registrar".$objTarjeta->geterror();
			}
		break;
	case 'actualizar':
		$filtro['id_tarjeta']=$_POST['id_tarjeta'];
		$datos['numero_tarjeta']=$_POST['numero_tarjeta'];
		$datos['codigo']=$_POST['codigo'];
		$datos['fecha_caducidad']=$_POST['fecha_caducidad'];
		echo $datos=$objTarjeta->Guardar($datos,$filtro);
		break;
	case 'consultaxcodigo':
		$filtro['id_tarjeta']=$_POST['id_tarjeta'];
		echo json_encode($datos=$objTarjeta->ObtenerFiltro($filtro));
		break;

}
?>
