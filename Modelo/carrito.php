<?php
require_once("conexion.php");
Class Carrito
{
	public function ObtenerTodos()
	{	$conexion=new Conexion;
		$obj=$conexion->consultar('carrito');
		return $obj;
	}
	public function nuevo($datos)
	{	$conexion=new Conexion;
		$obj=$conexion->insertar('carrito',$datos);
		return $obj;
	}
	public function Guardar($datos,$filtro)
	{	$conexion=new Conexion;
		$obj=$conexion->actualizar('carrito',$datos,$filtro);
		return $obj;
	}
	public function ObtenerFiltro($filtro)
	{
		$conexion=new Conexion;
		$obj=$conexion->consultarFiltro('carrito',$filtro);
		return $obj;
	}
	public function ObtenerCarrito($filtro)
	{
		$conexion=new Conexion;
		$obj=$conexion->consultarInner('carrito',$filtro);
		return $obj;
	}
	public function borrar($filtro)
	{
		$conexion=new Conexion;
		$obj=$conexion->eliminar('carrito',$filtro);
		return $obj;
	}
}
?>
