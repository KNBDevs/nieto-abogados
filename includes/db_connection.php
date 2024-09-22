<!-- MECANICA PARA REALIZAR LA CONEXIÓN CON LA BASE DE DATOS -->

<?php
// Configuración de la conexión a la base de datos
$servername = "localhost";
$username = "root";
$password = "password";
$dbname = "nietodb";
$port = 3307;

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname, $port);

// Verificar la conexión
if ($conn->connect_error) {
    die("La conexión falló: " . $conn->connect_error);
}
?>
