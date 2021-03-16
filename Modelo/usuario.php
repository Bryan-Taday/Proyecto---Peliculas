<?php
require_once("conexion.php");
Class Usuario
{
	public function ObtenerTodos()
	{	$conexion=new Conexion;
		$obj=$conexion->consultar('usuario');
		return $obj;
	}
	public function obtenerSesionUsuario($correo)
	{	$conexion=new Conexion;
		$obj=$conexion->consultarUsuario('usuario', $correo);
		return $obj;
	}
	public function nuevo($datos)
	{	$conexion=new Conexion;
		$obj=$conexion->insertar('usuario',$datos);
		return $obj;
	}
	public function Guardar($datos,$filtro)
	{	$conexion=new Conexion;
		$obj=$conexion->actualizar('usuario',$datos,$filtro);
		return $obj;
	}
	public function ObtenerFiltro($filtro)
	{
		$conexion=new Conexion;
		$obj=$conexion->consultarFiltro('usuario',$filtro);
		return $obj;
	}
}
?>
