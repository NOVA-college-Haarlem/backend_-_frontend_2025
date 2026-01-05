<?php

$email = $_POST['email_form'];
$password = $_POST['password_form'];

if(empty($email)){
    echo "Email mag niet leeg zijn";
    exit;
}

if(empty($password)){
    echo "Wachtwoord mag niet leeg zijn";
    exit;
}

require 'database.php';

$sql = "SELECT * FROM users WHERE email = '$email' ";

$result = mysqli_query($conn, $sql);

$user = mysqli_fetch_assoc($result);// 1 gebruiker halen wij op uit db.

if(is_array($user)){ //een gebruiker is gevonden op basis van email

    if($password  == $user['password']){ //check wachtwoord_form met wachtwoord db
        //gebruiker is succesvol ingelogd!!!!

        session_start();
        
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['email'] = $user['email'];
        $_SESSION['firstname'] = $user['firstname'];
        $_SESSION['lastname'] = $user['lastname'];
        
        header("location: dashboard.php");
        exit;
    }
}

echo "Email is bij ons onbekend";