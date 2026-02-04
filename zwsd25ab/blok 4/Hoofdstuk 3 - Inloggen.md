# Hoofdstuk 2 - Inloggen en Sessions


## Inloggen

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

## Sessions

In deze les gaan we sessies toevoegen aan onze website.

Sessies zijn een manier om data tussen verschillende pagina's te delen. We kunnen bijvoorbeeld gebruiken om te controleren of een gebruiker is ingelogd.

De levensduur van een sessie is meerdere pagina's. In PHP wordt de sessie gestart met de functie `session_start()`. We kunnen de sessie stoppen met de functie `session_destroy()`.

Als we eenmaal een sessie hebben gestart, kunnen we de sessiegegevens opslaan. De gegevens van een sessie mogen we zelf bepalen. We slaan deze gegevens op in een array. De Sessie Array wordt dan ook genaamd `$_SESSION`.

Bijvoorbeeld zo:
```php
$_SESSION['user_id'] = $user['id'];
$_SESSION['email'] = $user['email'];
$_SESSION['firstname'] = $user['firstname'];
$_SESSION['lastname'] = $user['lastname'];
```

We kunnen deze gegevens later ook weer ophalen. Bijvoorbeeld zo:
```php
echo $_SESSION['user_id'];
```

We kunnen nu logica toevoegen aan onze website. Bijvoorbeeld zo:
```php
if(isset($_SESSION['user_id'])){
    echo "Je bent ingelogd";
} else {
    echo "Je bent niet ingelogd";
}
```

Dit gaan we toepassen in onze website. We maken een apart bestand aan genaamd `session_check.php`. In dit bestand gaan we de sessie controleren.

```php
<?php
session_start();

if(empty($_SESSION['user_id'])){
    echo "Je bent niet ingelogd";
    echo "<a href='login.php'>Login hier in</a>";
    exit;
}
```

Dit bestand checkt of de gebruiker is ingelogd. Als de gebruiker niet ingelogd is, dan wordt een link getoond om naar de login pagina te gaan.

We kunnen nu deze sessie controle toevoegen aan onze website. Bijvoorbeeld zo:
```php
<?php
require 'session_check.php';
```

### Opdracht 4

1. Maak een nieuw bestand aan genaamd `dashboard.php`.
2. Voeg de volgende code toe:
```php
<?php
require 'session_check.php';
```

Nu we op een sessie controleren moeten er ook voor zorgen dat de sessie correct aangemaakt wordt. We doen dit in het bestand `login_process.php`. 

### Opdracht 5

1. Op inlog_process.php moeten we de sessie aanmaken. En dat doen we op het moment dat we de gebruiker hebben geverfieerd. Dus na het controleren van het wachtwoord. 
```php
<?php
session_start();
$_SESSION['user_id'] = $user['id'];
$_SESSION['email'] = $user['email'];
$_SESSION['firstname'] = $user['firstname'];
$_SESSION['lastname'] = $user['lastname'];
```

2. We kunnen nu de gebruiker doorgestuurd naar de dashboard pagina.
```php
header("location: dashboard.php");
exit;
``` 

### Opdracht 6

Breng een sessie check toe aan de tool_create.php pagina. Het is immers zo dat dat alleen ingelogde gebruikers toegang hebben tot deze pagina.
