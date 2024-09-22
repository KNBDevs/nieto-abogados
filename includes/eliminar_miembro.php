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
        margin-bottom: 20px;
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

// Verificar si se recibió el ID del miembro a eliminar y asegurarse de que no esté vacío
if (isset($_POST['miembro_id']) && !empty($_POST['miembro_id'])) {
    // Obtener el ID del miembro a eliminar
    $idMiembro = mysqli_real_escape_string($conn, $_POST['miembro_id']);

    // Consulta SQL para eliminar el miembro
    $sql = "DELETE FROM Miembros WHERE miembro_id = $idMiembro";

    // Ejecutar la consulta
    if ($conn->query($sql) === TRUE) {
        // Verificar si se eliminó alguna fila
        if ($conn->affected_rows > 0) {
            echo '<div class="notification success">';
            echo '<strong>Miembro eliminado exitosamente</strong>';
            echo '</div>';
        } else {
            echo '<div class="notification error">';
            echo '<strong>No se encontró ningún miembro con ese ID</strong>';
            echo '</div>';
        }
    } else {
        echo '<div class="notification error">';
        echo '<strong>Error al eliminar el miembro: </strong>' . $conn->error;
        echo '</div>';
    }
} else {
    echo '<div class="notification error">';
    echo '<strong>No se recibió el ID del miembro o el campo está vacío</strong>';
    echo '</div>';
}
?>


<!-- Botón de redirección -->
<button class="back-button" onclick="history.back();">Página Anterior</button>
<button class="redirect-button" onclick="window.location.href='../public/index.html';">Volver al Inicio</button>

</body>
</html>
