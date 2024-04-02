<?php

$conexion = null;

function conectar() {
    global $conexion;
    $conexion = mysqli_connect('localhost', 'root', '', 'intranet');
}

function getTodasCategorias() {
    global $conexion;
    $respuesta = mysqli_query($conexion, "SELECT * FROM categorias");
    return $respuesta -> fetch_all();
}

function getCategoriasPorUser(){
    global $conexion;
    $respuesta = mysqli_query($conexion, "SELECT C.categoria, C.descripcion, C.ruta FROM permisos P INNER JOIN categorias C ON P.ID_Categoria = C.ID_Categoria WHERE usuario = '".$_SESSION['usuario']."'");
    return $respuesta->fetch_all();
}

function getUsuarios(){
    global $conexion;
    $respuesta = mysqli_query($conexion, "SELECT * FROM usuarios WHERE admin<>1");
    return $respuesta->fetch_all();

}

function validarLogin($usuario, $clave) {
    global $conexion;
    $consulta = "SELECT * FROM usuarios WHERE usuario = '".$usuario."' AND clave='".$clave."'";
    $respuesta = mysqli_query($conexion, $consulta);

    if( $fila = mysqli_fetch_row($respuesta)) {
        session_start();
        $_SESSION['usuario'] = $usuario;
        $_SESSION['admin'] = $fila[2];
        return true;
    }
    return false;
}

function haIniciadoSesion(){
    session_start();
    return isset($_SESSION['usuario']);
}

function esAdmin(){
    return $_SESSION['admin'];
}

function desconectar() {
    global $conexion;
    mysqli_close($conexion);
}

?>