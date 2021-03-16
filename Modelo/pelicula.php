<?php
require_once("conexion.php");
Class Pelicula
{
	public function ObtenerTodos()
	{	$conexion=new Conexion;
		$obj=$conexion->consultar('pelicula');
		return $obj;
	}
	public function nuevo($datos)
	{	$conexion=new Conexion;
		$obj=$conexion->insertar('pelicula',$datos);
		return $obj;
	}
	public function Guardar($datos,$filtro)
	{	$conexion=new Conexion;
		$obj=$conexion->actualizar('pelicula',$datos,$filtro);
		return $obj;
	}
	public function ObtenerFiltro($filtro)
	{
		$conexion=new Conexion;
		$obj=$conexion->consultarFiltro('pelicula',$filtro);
		return $obj;
	}
}
?>
