<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Notificación | Nieto Abogados</title>
<style>
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        height: 100vh;
        background-color: rgb(181, 151, 129);
    }

    .header {
        margin-bottom: 50px;
    }

    .logo {
        width: 200px;
        cursor: pointer;
    }

    .notification {
        background-color: #ffc107;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        padding: 20px;
        max-width: 400px;
        text-align: center;
    }

    .notification.success {
        color: #28a745;
    }

    .notification.error {
        color: #dc3545;
    }

    .redirect-button, .delete-button, .back-button {
        margin-top: 20px;
        padding: 10px 20px;
        background-color: #333;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        width: 200px;
    }

    .redirect-button:hover, .delete-button:hover, .back-button:hover {
        background-color: #695d03;
        transition: ease .1s;
    }

</style>

<link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon">

</head>
<body>

<!-- Cabecera con el logo -->
<div class="header">
    <img class="logo" src="../images/logo.png" alt="Logo" onclick="window.location.href='../public/index.html';">
</div>

<?php
// Incluir el archivo de conexión a la base de datos
include 'db_connection.php';

// Verificar si se está enviando el formulario por POST y asegurarse de que los campos requeridos no estén vacíos
if ($_SERVER["REQUEST_METHOD"] == "POST" && !empty($_POST['nombre']) && !empty($_POST['email']) && !empty($_POST['telefono']) && !empty($_POST['mensaje'])) {
    $nombre_completo = $_POST['nombre'];
    $email = $_POST['email'];
    $telefono = $_POST['telefono'];
    $mensaje = $_POST['mensaje'];

    // Llamar al procedimiento almacenado InsertarMensajeContacto
    $stmt = $conn->prepare("CALL InsertarMensajeContacto(?, ?, ?, ?)");
    $stmt->bind_param("ssss", $nombre_completo, $email, $telefono, $mensaje);

    // Ejecutar el procedimiento almacenado
    if ($stmt->execute()) {
        echo '<div class="notification success">';
        echo '<strong>Mensaje de contacto enviado exitosamente</strong>';
        echo '</div>';
    } else {
        echo '<div class="notification error">';
        echo '<strong>Error al enviar mensaje de contacto: </strong>' . $conn->error;
        echo '</div>';
    }

    // Cerrar la conexión
    $stmt->close();
    $conn->close();
} else {
    // Si alguno de los campos requeridos está vacío, mostrar un mensaje de error
    echo '<div class="notification error">';
    echo '<strong>Por favor, complete todos los campos del formulario</strong>';
    echo '</div>';
}
?>


<!-- Botón de redirección -->
<div>
    <button class="back-button" onclick="history.back();">Página Anterior</button>
    <button class="redirect-button" onclick="window.location.href='../public/index.html';">Volver al Inicio</button>
</div>

</body>
</html>
