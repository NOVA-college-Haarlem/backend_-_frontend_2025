# Hoofdstuk 2 - Inloggen

In deze les gaan we een login functionaliteit toevoegen aan onze website.

Een login functionaliteit bestaat uit twee delen:
1. Een login formulier.
2. Een login proces.

#### Opdracht 1

1. importeer `users.sql` in de database.
2. Controleer of de gebruikers correct zijn ingevoegd.


#### Opdracht 2

1. Maak een nieuw bestand aan genaamd `login.php`
2. Maak in dit bestand een form aan voor het inloggen van een gebruiker.
3. Gebruik de volgende velden:
    - email
    - password
4. Zorg ervoor dat de gebruiker weet welke velden hij moet invullen.
5. Zorg ervoor dat de `name`-attributen dezelfde namen hebben als de kolommen in de tabel `users`.

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
</head>
<body>
    <h1>Login</h1>
    <form action="login_process.php" method="post">
        <div class="form-group">
            <label for="email_form">Email</label>
            <input type="text" name="email_form" id="email_form">
        </div>
        <div class="form-group">
            <label for="password_form">Wachtwoord</label>
            <input type="text" name="password_form" id="password_form">
        </div>
        <button type="submit">Login!</button>

       
    </form>
</body>
</html>
```

#### Opdracht 3

1. Maak een nieuw bestand aan genaamd `login_process.php`
2. Schrijf hier code waarmee je de data uit het formulier kunt valideren.

```php
<?php

$email = $_POST['email_form'];
$password = $_POST['password_form'];

require 'database_connection.php';

$sql = "SELECT * FROM users WHERE email = '$email'";
$result = mysqli_query($conn, $sql);

$user = mysqli_fetch_assoc($result);

if(is_array($user)){
    if($password == $user['password']){
        header("location: dashboard.php");
        exit;
    }
} else {
    
    echo "Email is bij ons onbekend";

    exit;
}
```

