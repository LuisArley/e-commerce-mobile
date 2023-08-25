<?php
    $db = mysqli_connect('');
    $username = $_POST['username'];
    $password = $_POST['password'];
    $sql = "SELECT * FROM users WHERE username = '".$username. "' AND password = '".$password."'";


    $result = mysqli_query($db, $slq);
    $count = mysqli_num_rows($result);
    if($count == 1){
        echo json_encode("success");
    }
    else{
        echo json_encode("full");
    }


?>