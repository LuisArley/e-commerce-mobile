<?php


include 'db.php';
    // require("db.php");


    $query = $link->query("SELECT * FROM usuarios");
    $results = array();

    // $results = ();


    while($rowData = $query->fetch_assoc()){
        $results[] = $rowData;
    }

    echo json_encode($results);



?>