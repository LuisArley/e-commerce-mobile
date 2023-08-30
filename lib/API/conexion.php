<?php

$connect = new mysqli("localhost","root","","");

if ($connect) {
    # code...
} else {
    # code...
    echo "fallo";
    exit();
}
