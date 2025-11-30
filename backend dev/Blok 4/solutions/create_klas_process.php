<?php 


//VALIDATIE
if(!isset($_POST['naam'])){
    echo "naam moet bestaan in POST";
    exit;
}

if(empty($_POST['naam'])){
    echo "Naam mag niet leeg zijn";
    exit;
}   

if(strlen($_POST['naam'])  < 3){
    echo "naam moet minstens drie karakters hebben";
    exit;
}


        ///TRUE && TRUE
if( empty($_POST['juf_meester']) && strlen($_POST['juf_meester'] < 3) ){
    echo "juf meester veld moet volledig zijn";
    exit;
}


if(  ! is_numeric($_POST['aantal_l'])   ){
    echo "aantal leerlingen moet wel een getal zijn";
    exit;
}

if(  ! is_numeric($_POST['verdiep'])   ){
    echo "Verdieping moet wel een getal zijn";
    exit;
}

if( $_POST['aantal_l'] > 30  ){
    echo "aantal leerlingen is te groot, verdeel de leerlingen over een andere klas";
    exit;
}





$naam = $_POST['naam'];
$lokaal = $_POST['lokaal'];
$juf_meester = $_POST['juf_meester'];
$aantal_leerlingen = $_POST['aantal_l'];
$verdieping = $_POST['verdiep'];



require 'database.php';

$sql = "INSERT INTO klassen (naam, lokaal, juf_meester, aantal_leerlingen, verdieping) 
            VALUES ('$naam', '$lokaal', '$juf_meester', '$aantal_leerlingen', '$verdieping')";

if(mysqli_query($conn, $sql)){
    header("location: klassen.php");
    exit;
}

