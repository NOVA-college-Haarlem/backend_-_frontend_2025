<?php

if(!isset($_POST['email_form'])){
    echo "Geen email veld gevonden";
    exit;
}

if(!isset($_POST['password_form'])){
    echo "Geen wachtwoord veld gevonden";
    exit;
}

if(empty($_POST['email_form'])){
    echo "Geen email ingevuld";
    exit;
}

if(empty($_POST['password_form'])){
    echo "Geen wachtwoord ingevuld";
    exit;
}

$email = $_POST['email_form'];
$password = $_POST['password_form'];


require 'database_connection.php';

$sql = "SELECT * FROM users WHERE email = '$email'";
$result = mysqli_query($conn, $sql);

$user = mysqli_fetch_assoc($result);

if(is_array($user)){

    if($password == $user['password']){

        session_start();
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['user_email'] = $user['email'];
        $_SESSION['firstname'] = $user['firstname'];
        $_SESSION['role'] = $user['role'];


        if($user['role'] == 'admin'){
            header('Location: admin-dashboard.php');
            exit;
        }
        
        if($user['role'] == 'user'){
            header('Location: user-dashboard.php');
            exit;
        }

        exit;
    }
}


header('Location: login.php?error=wrong');
exit;

$var = NULL;

if(is_null($var)){
    echo "De variabele is null";
} else {
    echo "De variabele is niet null";
}

echo $var ?? "De variabele is null";