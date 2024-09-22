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
include 'db_connection.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Verificar si se recibieron todos los datos del formulario y si no están vacíos
    if (isset($_POST['nombre'], $_POST['apellido'], $_POST['email'], $_POST['usuario'], $_POST['pass']) &&
        !empty($_POST['nombre']) && !empty($_POST['apellido']) && !empty($_POST['email']) && !empty($_POST['usuario']) && !empty($_POST['pass'])) {

        $nombre = $_POST['nombre'];
        $apellido = $_POST['apellido'];
        $email = $_POST['email'];
        $usuario = $_POST['usuario'];
        $password = password_hash($_POST['pass'], PASSWORD_BCRYPT); // Hash de contraseña

        // Llamar al procedimiento almacenado InsertarMiembro
        $stmt = $conn->prepare("CALL InsertarMiembro(?, ?, ?, ?, ?)");
        $stmt->bind_param("sssss", $nombre, $apellido, $email, $usuario, $password);

        // Ejecutar el procedimiento almacenado
        try {
            if ($stmt->execute()) {
                echo '<div class="notification success">';
                echo '<strong>Usuario registrado exitosamente</strong>';
                echo '</div>';
            } else {
                echo '<div class="notification error">';
                echo '<strong>Error al registrar usuario</strong>';
                echo '</div>';
            }
        } catch (mysqli_sql_exception $e) {
            if ($e->getCode() == 1062) { // Código de error para clave duplicada
                echo '<div class="notification error">';
                echo '<strong>Ya existe el usuario o el correo electrónico</strong>';
                echo '</div>';
            } else {
                echo '<div class="notification error">';
                echo '<strong>Error al registrar usuario: </strong>' . $e->getMessage();
                echo '</div>';
            }
        }

        // Cerrar la conexión
        $stmt->close();
    } else {
        echo '<div class="notification error">';
        echo '<strong>Por favor, complete todos los campos</strong>';
        echo '</div>';
    }
}

$conn->close();
?>



<!-- Botón de redirección -->
<button class="back-button" onclick="history.back();">Página Anterior</button>
<button class="redirect-button" onclick="window.location.href='../public/consulta.html';">Volver al Inicio</button>

</body>
</html>
