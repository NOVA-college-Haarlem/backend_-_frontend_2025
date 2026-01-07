<?php 

//schrijf validatie met empty() voor alle velden

//check of voornaam en achternaam minstens 3 karakters hebben.

//Check of rol overeenkomst met de enum waardes uit de database.



if( empty($_POST['email_form']) || 
    empty($_POST['password_form']) || 
    empty($_POST['firstname_form']) ||
    empty($_POST['lastname_form']) ||
    empty($_POST['role_form'])
    ){
        echo "Een van de velden is leeg";
    exit;
}

if( strlen($_POST['email_form']) < 3 ||
    strlen($_POST['firstname_form']) < 3 ||
    strlen($_POST['lastname_form']) < 3

){
    echo "Voor elk veld moet er minstens drie karakters opgegeven worden";
    exit;
}

if(    strlen($_POST['password_form']) < 8 ){
    echo "wachtwoord moet minstens 8 karakters hebben";
    exit;
}

if (!filter_var($_POST['email_form'], FILTER_VALIDATE_EMAIL)) {
    echo "Vul een geldig emailadres in";
    exit;
}

require 'database.php';


$email = $_POST['email_form'];
$password = $_POST['password_form'];
$firstname = $_POST['firstname_form'];
$lastname = $_POST['lastname_form'];
$role = $_POST['role_form'];


$sql = "INSERT INTO users (email, password, firstname, lastname, role) 
                VALUES ('$email', '$password', '$firstname', '$lastname', '$role')";


$result = mysqli_query($conn, $sql);

if($result){
    echo 'gebruiker is aangemaakt';
}
else{
    echo 'er is iets fout gegaan';
}







