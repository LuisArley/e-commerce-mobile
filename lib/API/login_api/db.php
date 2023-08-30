<?php
    $hotsname = 'localhost';
    $username = 'root';
    $pass = '';
    $dbname = 'usuario';

    $link = new mysqli($hotsname, $username, $pass, $dbname);


    if($link->connect_error){
        printf('fallo la conexion', $link->connect_error);
        exit();
    }

?>


