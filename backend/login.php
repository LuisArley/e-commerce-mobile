<?php
require_once 'conexion.php';

// Recibir datos del formulario
$db = mysqli_connect('localhost' , 'root' , 'userdata');
$username = $_POST['username'];
$password = $_POST['password'];

// Consulta SQL para verificar las credenciales
$sql = "SELECT id FROM usuarios WHERE username = '$username' AND password = '$password'";

$result = mysqli_query($db,$sql);
$count = mysqli_num_rows($result);
if ($count == 1) {
    echo json_encode('success');
}
else {
    echo json_encode('error');
}


// $result = $conn->query($sql);

// $response = array();

// if ($result->num_rows > 0) {
//     // Inicio de sesión exitoso
//     $response['success'] = true;
//     $response['message'] = "Inicio de sesión exitoso";
// } else {
//     // Credenciales incorrectas
//     $response['success'] = false;
//     $response['message'] = "Credenciales incorrectas";
// }

// // Cerrar la conexión
// $conn->close();

// echo json_encode($response);
?>
