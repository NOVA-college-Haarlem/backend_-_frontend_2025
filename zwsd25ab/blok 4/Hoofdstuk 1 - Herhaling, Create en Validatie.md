# Hoofdstuk 1 - Herhaling en Validatie

In blok 3 hebben we PHP een introductie gedaan. We hebben gekeken naar:

- Variabelen
- Data types
- Arrays
- Associative arrays
- Conditionals
- Loops
- Ingebouwde PHP functies
- Database connectie
- Request Response Cycle

#### Opdracht 0 - project setup

In deze les gaan we een nieuw project gebruiken. Dit is een school-systeem app.

#### Opdracht 1

1. Fork de repository [https://github.com/NOVA-college-Haarlem/regenboog_school](https://github.com/NOVA-college-Haarlem/regenboog_school).
2. Clone de repository naar je projecten map (C:\projecten) `git clone https://github.com/NOVA-college-Haarlem/regenboog_school.git`
3. Open het project in VS Code.
4. Open de terminal in VS Code en type `docker compose up -d` in.
5. Open de browser en ga naar `http://localhost:8000`.

#### Opdracht 1 - database

1. Maak een database aan genaamd `regenboog_school`.
2. Importeer het bestand `klassen.sql` in de database.
3. Controleer of de klassen correct zijn ingevoegd.

#### Opdracht 2 - database connectie

1. Maak een bestand aan genaamd `database.php`
2. Voeg de volgende code toe:
```php
<?php

$dbhost = 'mariadb';
$dbname = 'regenboog_school';
$dbuser = 'root';
$dbpass = 'password';

$conn = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

?>
```

#### Opdracht 3 - klassen overzicht

1. Maak een bestand aan genaamd `klassen.php`
2. Voeg de volgende code toe:
```php
<?php

require 'database.php';

$sql = "SELECT * FROM klassen";
$result = mysqli_query($conn, $sql);
$klassen = mysqli_fetch_all($result, MYSQLI_ASSOC);

?>
```

#### Opdracht 4 - klassen tabel

1. Voeg de volgende code toe:
```php
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        table,tr,td{
            border: 1px solid red;
        }
    </style>
</head>
<body>
    <table>
        <thead>
            <tr>
                <th>id</th>
                <th>naam</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach($klassen as $klas): ?>
                <tr>
                    <td><?php echo $klas['id'] ?></td>
                    <td><?php echo $klas['naam'] ?></td>
                    <td>
                        <a href="klas-detail.php?id=<?php echo $klas['id'] ?>">Detail</a>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</body>
</html>

```

### Les 2 - Formulier

### Opdracht 2

We gaan met behulp van een formulier een nieuwe klas aanmaken.

1. Maak het bestand `create_klas.php` in de www folder.
2. Maak een formulier aan dat een POST request verstuurt naar de server.
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
        label{
            width:140px;
            display: inline-block;
        }

        .form-group{
            margin:10px 0px;
        }

    </style>
</head>
<body>
    <h1>Maak klas</h1>
    <form action="create_klas_process.php" method="post">

        <div class="form-group">
            <label for="naam_klas">Naam klas</label>
            <input type="text" name="naam" id="naam_klas" placeholder="vb: zwsd25f ">
        </div>
        <div class="form-group">
            <label for="lokaal">Naam lokaal</label>
            <input type="text" name="lokaal" id="lokaal" placeholder="B222">
        </div>
             <div class="form-group">
            <label for="juf_meester">Naam juf of meester</label>
            <input type="text" name="juf_meester" id="juf_meester" placeholder="Konings">
        </div>
        <div class="form-group">
            <label for="aantal_l">Aantal leerlingen</label>
            <input type="number" name="aantal_l" id="aantal_l" placeholder="20">
        </div>
        <div class="form-group">
            <label for="verdiep">Verdieping</label>
            <input type="number" name="verdiep" id="verdiep" placeholder="2">
        </div>

        <button type="submit">Maak klas</button>
    
 
    </form>
</body>
</html>
```

We bestuderen dit formulieren. Wat zien we hier?

- de afbeelding is een input veld van het type text. Dit is niet correct. Dit gaan we later verbeteren.
- action: de url waar de data naartoe wordt verstuurd
- method: de methode waarmee de data naartoe wordt verstuurd
- div: de div waar de input velden in worden geplaatst
- button: de knop waarmee de data naartoe wordt verstuurd

De `name attribuut` is belangrijk. Deze wordt gebruikt om de data naar de server te sturen. 

#### Opdracht 3

1. Maak een nieuw bestand aan genaamd `create_klas_process.php`

## Data validatie

In deze les gaan we de data validatie toevoegen aan het formulier. We willen controleren of de data die we versturen voldoet aan de vereisten. Dit doen we met behulp van PHP in het bestand `create_klas_process.php`.

Ten eerste moeten we controleren of de naam is ingevuld.

```php
if(empty($_POST['naam'])){
    echo "Naam is required";
    exit;
}
```

#### Opdracht 4

1. Controleer of de naam minimaal 3 karakters heeft
```php
if(strlen($_POST['naam'])  < 3){{
    echo "Naam is too short";
    exit;
}
```

#### Opdracht 5

1. Controleer of de naam van de meester of juf langer is dan 3 karakters.

```php  
if( empty($_POST['juf_meester']) && strlen($_POST['juf_meester'] < 3) ){
        echo "juf meester veld moet volledig zijn";
        exit;
    }
``` 

#### Opdracht 6

1. Controleer of het aantal leerlingen een getal is.
```php
if(  ! is_numeric($_POST['aantal_l'])   ){
    echo "aantal leerlingen moet wel een getal zijn";
    exit;
}
```

#### Opdracht 7

1. Controleer of het aantal leerlingen niet groter is dan 30.
```php
if( $_POST['aantal_l'] > 30  ){
    echo "aantal leerlingen is te groot, verdeel de leerlingen over een andere klas";
    exit;
}
```

#### Opdracht 8

1. Controleer of de verdieping niet negatief is.
```php
if( $_POST['verdiep'] < 0  ){
    echo "verdieping moet wel een positief getal zijn";
    exit;
}
``` 

#### Opdracht 9

1. Controleer of de verdieping niet groter is dan 5.
```php
if( $_POST['verdiep'] > 5  ){
    echo "verdieping moet wel kleiner zijn dan 5";
    exit;
}
```

Als bovenstaande controles succesvol zijn, dan kunnen we de data opslaan in de database.

```php
$naam = $_POST['naam'];
$lokaal = $_POST['lokaal'];
$juf_meester = $_POST['juf_meester'];
$aantal_leerlingen = $_POST['aantal_l'];
$verdieping = $_POST['verdiep'];

$query = "INSERT INTO klas (naam, lokaal, juf_meester, aantal_l, verdiep) VALUES ('$naam', '$lokaal', '$juf_meester', '$aantal_leerlingen', '$verdieping')";
$result = mysqli_query($conn, $query);

if($result){
    echo "Klas aangemaakt";
} else {
    echo "Klas niet aangemaakt";
}
```

of je stuurt de gebruiker naar de index pagina.

```php
if($result){
    header("location: klassen.php");
    exit;
}
```
