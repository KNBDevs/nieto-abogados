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
    <img class="logo" src="../images/logo.png" alt="Logo" onclick="window.location.href='../public/cita.html';">
</div>

<?php
include 'db_connection.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre = $_POST['nombre'];
    $apellido = $_POST['apellido'];
    $email = $_POST['email'];
    $telefono = $_POST['telefono'];
    $id_provincia = $_POST['provincia'];
    $detalles = $_POST['detalles'];
    $plazo = $_POST['plazo'];
    $id_motivo = $_POST['motivo'];
    $fecha_cita = $_POST['fecha_cita'];
    $hora_cita = $_POST['hora_cita'];

    // PROCEDIMIENTO:
    // Llamar al procedimiento almacenado InsertarCita
    $stmt = $conn->prepare("CALL InsertarCita(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("ssssisssss", $nombre, $apellido, $email, $telefono, $id_provincia, $detalles, $plazo, $id_motivo, $fecha_cita, $hora_cita);

    // Ejecutar el procedimiento almacenado
    if ($stmt->execute()) {
        echo '<div class="notification success">';
        echo '<strong>Cita solicitada correctamente. Nos pondremos en contacto para determinar la hora exacta.</strong>';
        echo '</div>';
    } else {
        echo '<div class="notification error">';
        echo '<strong>Error al crear la cita: </strong>' . $conn->error;
        echo '</div>';
    }

    // Cerrar la conexión
    $stmt->close();
    $conn->close();
}
?>

<!-- Botón de redirección -->
<button class="back-button" onclick="history.back();">Página Anterior</button>
<button class="redirect-button" onclick="window.location.href='../public/index.html';">Volver al Inicio</button>

</body>
</html>
