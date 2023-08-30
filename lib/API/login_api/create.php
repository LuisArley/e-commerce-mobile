<?php
$db = mysqli_connect('localhost', 'root', '', 'usuario');

if (!$db) {
    die("Error de conexión: " . mysqli_connect_error());
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['username']) && isset($_POST['password'])) {
        $username = mysqli_real_escape_string($db, $_POST['username']);
        $password = mysqli_real_escape_string($db, $_POST['password']);

        $sql = "SELECT * FROM usuarios WHERE usuario = '$username' AND password = '$password'";
        $result = mysqli_query($db, $sql);

        if (!$result) {
            die("Error en la consulta: " . mysqli_error($db));
        }

        $count = mysqli_num_rows($result);

        if ($count == 1) {
            echo json_encode("Success");
        } else {
            echo json_encode("Error");
        }
    } else {
        echo json_encode("Campos incompletos");
    }
} else {
    echo json_encode("Método no válido");
}

mysqli_close($db);
?>

