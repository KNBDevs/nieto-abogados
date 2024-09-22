<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Resultados de la Búsqueda | Nieto Abogados</title>
<style>
    body {
        margin: 0;
        padding: 0;
        font-family: "Roboto", sans-serif !important;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        min-height: 100vh;
        background-color: rgb(181, 151, 129); /* Color de fondo */
        box-sizing: border-box;
        font-weight: bold;
    }

    .header {
        margin-bottom: 20px;
    }

    .logo {
        margin-top: 60px;
        width: 200px;
        cursor: pointer;
    }

    .contenedor_resultados {
        width: calc(100% - 60px);
        max-width: 1200px;
        margin: 20px;
        box-sizing: border-box;
        overflow-x: auto;
    }

    .table-wrapper {
        width: 100%;
        overflow-x: auto;
    }

    .styled-table {
        width: 100%;
        border-collapse: collapse;
        margin: 25px 0;
        font-size: 14px;
        text-align: left;
    }

    .styled-table thead tr {
        background-color: #333;
        color: #ffffff;
        text-align: left;
    }

    .styled-table th, .styled-table td {
        padding: 12px 15px;
    }

    .styled-table th.cita-id, .styled-table td.cita-id {
        min-width: 50px;
    }

    .styled-table th.nombre, .styled-table td.nombre,
    .styled-table th.apellido, .styled-table td.apellido,
    .styled-table th.email, .styled-table td.email,
    .styled-table th.telefono, .styled-table td.telefono {
        min-width: 90px;
        padding-left: 10px;
    }

    .styled-table th.id-provincia, .styled-table td.id-provincia,
    .styled-table th.id-motivo, .styled-table td.id-motivo {
        min-width: 70px;
        padding-left: 10px;
    }

    .styled-table th.detalles, .styled-table td.detalles {
        min-width: 180px; 
        padding-left: 10px;
    }

    .styled-table th.plazo, .styled-table td.plazo,
    .styled-table th.fecha-cita, .styled-table td.fecha-cita,
    .styled-table th.hora-cita, .styled-table td.hora-cita,
    .styled-table th.fecha-solicitud, .styled-table td.fecha-solicitud {
        min-width: 100px;
        padding-left: 10px;
    }

    .styled-table tbody tr {
        border-bottom: 1px solid #ccc;
    }

    .styled-table tbody tr:nth-of-type(even) {
        background-color: #555;
        color: white;
    }

    .styled-table tbody tr:last-of-type {
        border-bottom: 2px solid #333;
    }

    .no-results {
        background-color: #ffc107;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        padding: 20px;
        max-width: 400px;
        margin-top: 20px !important;
        text-align: center;
        color: #dc3545;
        margin: 0 auto;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
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

    .redirect-button,.back-button {
        margin-bottom: 60px;
    }

    .redirect-button:hover, .delete-button:hover, .back-button:hover {
        background-color: #695d03;
        transition: ease .1s;
    }
</style>
<link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon">
<script>
    function toggleSelectAll(source) {
        checkboxes = document.getElementsByName('delete[]');
        for (var i = 0, n = checkboxes.length; i < n; i++) {
            checkboxes[i].checked = source.checked;
        }
    }
</script>
</head>
<body>

<!-- Cabecera con el logo -->
<div class="header">
    <img class="logo" src="../images/logo.png" alt="Logo" onclick="window.location.href='../public/index.html';">
</div>

<div class="contenedor_resultados">
    <?php
    
    include 'db_connection.php';
    // Verificamos si se enviaron datos para eliminar registros
    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['delete'])) {
        $ids_to_delete = $_POST['delete'];
        if (!empty($ids_to_delete)) {
            $ids_string = implode(",", array_map('intval', $ids_to_delete));
            $delete_sql = "DELETE FROM Citas WHERE cita_id IN ($ids_string)";
            $conn->query($delete_sql);
        }
    }

    // Inicializamos la condición WHERE como una cadena vacía
    $where_clause = '';

    // Verificamos si se enviaron datos de búsqueda por el método POST
    if ($_SERVER["REQUEST_METHOD"] == "POST" && !isset($_POST['delete'])) {
        // Definimos los valores de búsqueda y los limpiamos
        $nombre = isset($_POST['nombre']) ? trim($_POST['nombre']) : '';
        $apellido = isset($_POST['apellido']) ? trim($_POST['apellido']) : '';
        $email = isset($_POST['email']) ? trim($_POST['email']) : '';
        $telefono = isset($_POST['telefono']) ? trim($_POST['telefono']) : '';
        $motivo = isset($_POST['motivo']) ? $_POST['motivo'] : '';
        $provincia = isset($_POST['provincia']) ? $_POST['provincia'] : '';
        $fecha_cita = isset($_POST['fecha_cita']) ? $_POST['fecha_cita'] : '';
        $hora_cita = isset($_POST['hora_cita']) ? $_POST['hora_cita'] : '';
        $plazo = isset($_POST['plazo']) ? trim($_POST['plazo']) : '';

        // Construimos la condición WHERE solo si se proporcionan criterios de búsqueda
        if (!empty($nombre)) {
            $where_clause .= " AND nombre LIKE '%$nombre%'";
        }
        if (!empty($apellido)) {
            $where_clause .= " AND apellido LIKE '%$apellido%'";
        }
        if (!empty($email)) {
            $where_clause .= " AND email LIKE '%$email%'";
        }
        if (!empty($telefono)) {
            $where_clause .= " AND telefono LIKE '%$telefono%'";
        }
        if (!empty($motivo)) {
            $where_clause .= " AND id_motivo = '$motivo'";
        }
        if (!empty($provincia)) {
            $where_clause .= " AND id_provincia = '$provincia'";
        }
        if (!empty($fecha_cita)) {
            $where_clause .= " AND fecha_cita = '$fecha_cita'";
        }
        if (!empty($hora_cita)) {
            $where_clause .= " AND hora_cita = '$hora_cita'";
        }
        if (!empty($plazo)) {
            $where_clause .= " AND plazo LIKE '%$plazo%'";
        }
    }

    // Construimos la consulta SQL
    $sql = "SELECT * FROM Citas WHERE 1=1 $where_clause";

    // Ejecutamos la consulta
    $result = $conn->query($sql);

    // Verificamos si hay resultados
    if ($result && $result->num_rows > 0) {
        echo "<form method='POST' action=''>";
        echo "<div class='table-wrapper'>";
        // Inicio de la tabla HTML con clase "styled-table"
        echo "<table class='styled-table'>";
        echo "<thead>";
        echo "<tr>";
        echo "<th class='cita-id'>Cita ID</th>";
        echo "<th class='nombre'>Nombre</th>";
        echo "<th class='apellido'>Apellido</th>";
        echo "<th class='email'>Email</th>";
        echo "<th class='telefono'>Teléfono</th>";
        echo "<th class='id-provincia'>ID Provincia</th>";
        echo "<th class='detalles'>Detalles</th>";
        echo "<th class='plazo'>Plazo</th>";
        echo "<th class='id-motivo'>ID Motivo</th>";
        echo "<th class='fecha-cita'>Fecha Cita</th>";
        echo "<th class='hora-cita'>Hora Cita</th>";
        echo "<th class='fecha-solicitud'>Fecha Solicitud</th>";
        echo "<th class='select'><input type='checkbox' onclick='toggleSelectAll(this)'></th>";
        echo "</tr>";
        echo "</thead>";
        echo "<tbody>";

        // Iteramos sobre los resultados y los agregamos a la tabla
        while ($row = $result->fetch_assoc()) {
            echo "<tr>";
            echo "<td class='cita-id'>".$row['cita_id']."</td>";
            echo "<td class='nombre'>".$row['nombre']."</td>";
            echo "<td class='apellido'>".$row['apellido']."</td>";
            echo "<td class='email'>".$row['email']."</td>";
            echo "<td class='telefono'>".$row['telefono']."</td>";
            echo "<td class='id-provincia'>".$row['id_provincia']."</td>";
            echo "<td class='detalles'>".$row['detalles']."</td>";
            echo "<td class='plazo'>".$row['plazo']."</td>";
            echo "<td class='id-motivo'>".$row['id_motivo']."</td>";
            echo "<td class='fecha-cita'>".$row['fecha_cita']."</td>";
            echo "<td class='hora-cita'>".$row['hora_cita']."</td>";
            echo "<td class='fecha-solicitud'>".$row['fecha_solicitud']."</td>";
            echo "<td class='select'><input type='checkbox' name='delete[]' value='".$row['cita_id']."'></td>";
            echo "</tr>";
        }

        // Cierre de la tabla HTML
        echo "</tbody>";
        echo "</table>";
        echo "</div>";
        echo "<button class='delete-button' type='submit'>Eliminar Seleccionados</button>";
        echo "</form>";
    } else {
        echo "<div class='no-results'>No se encontraron resultados</div>";
    }

    // Cerramos la conexión a la base de datos
    $conn->close();
    ?>
</div>

<!-- Botones de navegación -->
<div>
    <button class="back-button" onclick="history.back();">Página Anterior</button>
    <button class="redirect-button" onclick="window.location.href='../public/index.html';">Volver al Inicio</button>
</div>

</body>
</html>
