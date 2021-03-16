<?php
require_once("conexion.php");
Class Tarjeta
{
	public function ObtenerTodos()
	{	$conexion=new Conexion;
		$tarjeta=$conexion->consultar('tarjeta');
		return $tarjeta;
	}
	public function nuevo($datos)
	{	$conexion=new Conexion;
		$tarjeta=$conexion->insertar('tarjeta',$datos);
		return $tarjeta;
	}
	public function Guardar($datos,$filtro)
	{	$conexion=new Conexion;
		$tarjeta=$conexion->actualizar('tarjeta',$datos,$filtro);
		return $tarjeta;
	}

	public function ObtenerFiltro($filtro)
	{
		$conexion=new Conexion;
		$tarjeta=$conexion->consultarFiltro('tarjeta',$filtro);
		return $tarjeta;
	}
}
?>
