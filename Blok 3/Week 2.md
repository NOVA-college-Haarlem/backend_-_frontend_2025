# Week 2

## Foreach loop

### OPDRACHT 10: SOCIALS 

1. We gaan nu ook links naar social media toe te voegen.
2. We gaan ook een nieuwe pagina maken: `socials.php`
3. We voegen de volgende code toe:
```php
<?php
    $socials = [
        'Instagram' => 'https://instagram.com/',
        'Facebook' => 'https://facebook.com/',
        'Twitter' => 'https://twitter.com/'
    ];
    ?>
```

4. Loop door de socials array met een foreach loopen maak een link naar de social media platformen
5. We gaan nu het bestaande socials aanpassen in `socials.php`
6. We voegen wat HTML toe aan de socials.php:
```html
<div class="bg-white shadow p-4 flex justify-center space-x-6 mb-6">
   <!-- hier staat de foreach loop -->

    <!-- hier staat het einde vande foreach loop -->
</div>
```
7. Nu moeten we de socials.php in elke pagina toevoegen Door PHP te gebruiken: `include 'socials.php';`
8. Test je code in de browser   

## Werken met een database

### OPDRACHT 11: POKEMON INTO DB

1. We gaan in de volgende opdrachten werken met een database.
2. Daarvoor hebben we een database nodig.
3. Deze is al aangemaakt via Docker genaamd 'pokemon_db'.
4. Je kunt deze benaderen via PHPMyAdmin: http://localhost:8000
5. We gaan data in de database opslaan door middel van het bestand `pokemon-cards.sql`. Dit is een SQL file die je kan importeren in PHPMyAdmin. Het bestand kun je vinden in de map `sql`.
6. Importeer de data in de database door het tabblad SQL te selecteren
7. Kopiëer de volgende code en plak deze in het SQL tabblad:

### OPDRACHT 12: DATATBASE CONNECTION

1. Om te communiceren met de database hebben we een connectie nodig.
2. We gaan deze connectie maken in een nieuw bestand: `database.php`.
3. Open de pagina in VS code
4. Neem de volgende code over:
```php
<?php

$dbhost = 'mariadb';
$dbname = 'pokemon_db';
$dbuser = 'root';
$dbpass = 'password';

$conn = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
```

### OPDRACHT 13: POKEMON FROM DB
1. We gaan nu de data uit de database halen. En om de oefen met het tonen hiervan maken we een nieuwe pagina: `pokemon-cards.php`.
2. Maak een nieuwe pagina: `pokemon-cards.php`
3. Open de pagina in VS code
4. Neem de volgende code over:
```php

include 'database.php';

$sql = "SELECT * FROM pokemon"; // SQL query om alle pokemon uit de database te halen
$result = mysqli_query($conn, $sql);

$pokemon_cards = mysqli_fetch_all($result, MYSQLI_ASSOC);

// Loop door alle pokemon uit de database
foreach($pokemon_cards as $pokemon_card) {
    echo '<div class="pokemon-card">';
    echo '<h2>' . $pokemon_card['name'] . '</h2>';
    echo '<p>' . $pokemon_card['type'] . '</p>';
    echo '<img src="' . $pokemon_card['pokedex_number'] . '" alt="' . $pokemon_card['name'] . '">';
    echo '</div>';
}

?>
```
5. Bekijk het resultaat in de browser

### OPDRACHT 14: POKEMON INDEX

1. We gaan nu het bovenstaande deel toepassen op de index.php pagina.
2. Open de index.php pagina in VS code
3. Neem de volgende code over:
```php
<?php
include 'database.php';

$sql = "SELECT * FROM pokemon";
$result = mysqli_query($conn, $sql);
$pokemon_cards = mysqli_fetch_all($result, MYSQLI_ASSOC);

?>
```
4. Bekijk het resultaat in de browser


