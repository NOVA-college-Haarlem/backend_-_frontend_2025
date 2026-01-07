<?php

session_start();

if(empty($_SESSION['email'])){
    echo "Je bent niet correct ingelogd";
    echo "<a href='login.php'> Login hier in </a>";
    exit;
}