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

$cards = mysqli_fetch_all($result, MYSQLI_ASSOC);

foreach($cards as $card):

    echo $card["id"];
    echo $card["name"];
    echo $card["type"];

endforeach;

?>
```

Wil je nou HTML en CSS toevoegen? Dan kan dat door bijvoorbeeld classes toe te voegen:

```php

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

1. We gaan nu het bovenstaande deel toepassen op de index.php pagina met behoud van de opmaak die er al was.
2. Open de index.php pagina in VS code
3. Kopeer de gegevens van een pokemon kaart die er al staat.

```html
 <!-- Pokemon Card 1 -->
<div class="bg-white rounded-lg shadow-lg overflow-hidden">
    <img src="https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png" alt="Pikachu"
        class="w-full h-64 object-cover">
    <div class="p-6">
        <h3 class="text-xl font-bold mb-2">Pikachu</h3>
        <p class="text-gray-600 mb-4">Elektrisch type Pokémon</p>
        <a href="#" class="text-blue-600 hover:text-blue-800">Meer informatie →</a>
    </div>
</div>
```

Voor nu willen we de titel en type dynamisch invullen. Uiteraard moeten we een loop gebruiken

```html
    <!-- Pokemon Grid -->
    <div class="max-w-7xl mx-auto px-8 py-12">
        <h2 class="text-3xl font-bold mb-8">Mijn Favoriete Pokémon</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            <?php foreach($cards as $card): ?>
            <!-- Pokemon Card 1 -->
            <div class="bg-white rounded-lg shadow-lg overflow-hidden">
                <img src="https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png" alt="Pikachu"
                    class="w-full h-64 object-cover">
                <div class="p-6">
                    <h3 class="text-xl font-bold mb-2"><?php echo $card["name"]; ?></h3>
                    <p class="text-gray-600 mb-4"><?php echo $card["type"]; ?></p>
                    <a href="#" class="text-blue-600 hover:text-blue-800">Meer informatie →</a>
                </div>
            </div>
            <?php endforeach; ?>
        </div>
    </div>
```

6. Test je code in de browser

### OPDRACHT 15: Overige kaaten

1. De overige kaarten kunnen we verwijderen.

### OPDRACHT 16: POKEMON Afbeelding

1. Nu moeten we de afbeelding ook dynamisch invullen.
2. We maken gebruik van een externe site waarbij we een afbeelding kunnen ophalen op basis van het nummer (pokedex_number) van de pokemon.
3. Dit nummer moeten we ook opslaan in de database.
4. We gaan een extra kolom aanmaken in de database: `pokedex_number`.
5. En we gaan alle afbeeldingen updaten met het juiste nummer:

- 'Pikachu', 025
- 'Charmander', 004
- 'Squirtle', 007
- 'Bulbasaur', 001
- 'Mewtwo', 150
- 'Charizard', 006
- 'Blastoise', 009
- 'Venusaur', 003
- 'Articuno', 144

Nu kunnen we ook de image url dynamisch invullen door het getal te vervangen door de pokedex_number:

Dit:
```html
<img src="https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png" alt="Pikachu" class="w-full h-64 object-cover">
```
wordt dan dit:
```html
<img src="https://assets.pokemon.com/assets/cms2/img/pokedex/full/<?php echo $card['pokedex_number']; ?>.png" alt="Pikachu" class="w-full h-64 object-cover">
```
en aangezien de url van pokemon.com voor rest statisch blijft kunnen we het ook als volgt schrijven:

```php
<?php $pokemon_default_url = "https://assets.pokemon.com/assets/cms2/img/pokedex/full/"; ?>
```

en dan kunnen we de url ook dynamisch invullen:

```php
<img src="<?php echo $pokemon_default_url . $card['pokedex_number']; ?>.png" alt="Pikachu" class="w-full h-64 object-cover">
```

6. Test je code in de browser
