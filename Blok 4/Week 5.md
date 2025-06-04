# Blok 4

## Week 5

### Les 1 - Search   

In deze les gaan we een zoek-formulier maken. We gaan deze gebruiken om een pokemon te zoeken.

#### Opdracht 1

Maak een zoek-formulier op `pokemon_search.php`.

1. include de `header.php` en de `navbar.php` bovenaan de pagina.
2. Maak een formulier met een inputveld en een knop.
3. Wanneer de gebruiker op de knop klikt, wordt de gebruiker doorgestuurd naar dezelfde pagina, dus de action blijft leeg.
4. De methode moet GET zijn.
5. De inputveld moet een naam hebben, bijvoorbeeld `zoek_term`.
5. De inputveld moet een placeholder hebben, bijvoorbeeld `Voer een naam in`.
6. De knop moet een naam hebben, bijvoorbeeld `Zoek!`.

Bijvoorbeeld:
```html
    <form action="" method="GET" class="bg-white p-6 rounded-lg shadow-md w-full max-w-md">
        <label for="zoekveld" class="block text-gray-700 font-bold mb-2">Zoek op naam</label>
        <input 
            type="text" 
            name="zoek_term" 
            id="zoekveld" 
            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
            placeholder="Voer een naam in"
        >
        <button  
            type="submit" 
            name="submit"
            class="mt-4 w-full bg-blue-500 text-white py-2 px-4 rounded-lg hover:bg-blue-600 transition duration-300"
        >
            Zoek!
        </button>
    </form>
```

7. Onderaan de pagina moet de `footer.php` worden toegevoegd.

#### Opdracht 2

1. Zodra er op de knop klikt, wordt de gebruiker doorgestuurd naar dezelfde pagina, dus de action blijft leeg.
2. De methode moet GET zijn. Dat zie je ook in het voorbeeld.
3. Bovenaan de pagina gaan we het verwerken van het formulier afhandelen. Dit kunnen we doen met een `if` statement.
4. We controleren of de gebruiker op de knop heeft geklikt.
5. We controleren of het veld zoek_term bestaat.
6. We controleren of het veld zoek_term niet leeg is.
7. We controleren of het veld minstens 3 karakters bevat.


#### Opdracht 3

1. Dan maken we een connectie met de database.
2. We maken een query om de data uit de database te halen.
3. We tonen de data in een tabel.


Dit kan er dan zo uit zien:

```php
<?php

include 'header.php';
include 'navbar.php';

if(isset($_GET['submit'])) {//Als er op de knop gedrukt is

    //check if field zoek_term exists
    if(isset($_GET['zoek_term'])) {


        if(!empty($_GET['zoek_term'])){
            //Opdracht 4: controlleer of de zoekterm minimaal 3 karakters lang is

            if(strlen($_GET['zoek_term']) >= 3){
                $zoek_term = $_GET['zoek_term'];
                require "database_connection.php";
                $sql = "SELECT name, type FROM cards WHERE name LIKE '%$zoek_term%'";
                $result = mysqli_query($conn, $sql);
                $cards = mysqli_fetch_all($result, MYSQLI_ASSOC);
            }
        }
    }
}
?>

```

#### Opdracht 4

1. De resultaten die gevonden worden moeten worden getoond. Bijvoorbeeld:

```php
 <?php if(isset($cards)): ?>
        <div class="zoekresultaten">
            <?php foreach($cards as $card): ?>
                <div class="card">
                    <h2><?php echo $card['name']; ?></h2>
                    <p><?php echo $card['type']; ?></p>
                </div>
            <?php endforeach; ?>
        </div>
    <?php endif; ?>
```

### Les 2 - Dashboard data

In deze les gaan we de data uit de database halen en tonen op het dashboard.

#### Opdracht 1

1. Pas het bestand `admin-dashboard.php` aan: 
2. We maken een connectie met de database.
3. We maken een query om de data uit de database te halen.
4. Toon het aantal gebruikers uit de database op het scherm:


```php
// Query data
$sql = "SELECT COUNT(*) as total_users FROM users";
$result = mysqli_query($conn, $sql);
$total_users = mysqli_fetch_assoc($result)['total_users'];
?>

<div class="bg-blue-500 text-white p-6 rounded-lg shadow-md text-center">
    <h2 class="text-4xl font-bold"><?php echo $total_users; ?></h2>
    <p class="mt-2">Totaal aantal gebruikers</p>
</div>
```

#### Opdracht 2

1. Pas het bestand `admin-dashboard.php` aan: 
2. We maken een connectie met de database.
3. We maken een query om de data uit de database te halen.
4. Toon het aantal kaarten uit de database op het scherm:


```php
// Query data
$sql = "SELECT COUNT(*) as total_cards FROM cards";
$result = mysqli_query($conn, $sql);
$total_cards = mysqli_fetch_assoc($result)['total_cards'];
?>
 <div class="bg-green-500 text-white p-6 rounded-lg shadow-md text-center">
    <h2 class="text-4xl font-bold"><?php echo $total_cards; ?></h2>
    <p class="mt-2">Totaal aantal kaarten</p>
</div>
```

#### Opdracht 3

1. Pas het bestand `admin-dashboard.php` aan: 
2. We maken een connectie met de database.
3. We maken een query om de data uit de database te halen.
4. Toon het aantal normale gebruikers uit de database op het scherm:

### Les 3 - Meerdere tabellen

In deze les gaan we meerdere tabellen in de database gebruiken. We maken gebruik van een one-to-one relatie. 

#### Opdracht 1

1. We importeren een nieuwe tabel in de database.

```sql
CREATE TABLE user_settings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    theme ENUM('light', 'dark', 'auto') DEFAULT 'light',
    cards_per_page INT DEFAULT 12,
    default_sort ENUM('name', 'type', 'hp', 'attack') DEFAULT 'name',
    show_card_stats BOOLEAN DEFAULT TRUE,
    email_notifications BOOLEAN DEFAULT TRUE,
    two_factor_enabled BOOLEAN DEFAULT FALSE,
    last_login_ip VARCHAR(45),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    UNIQUE KEY unique_user_settings (user_id)
);

INSERT INTO user_settings (user_id, theme, cards_per_page, default_sort, email_notifications) VALUES
(1, 'dark', 24, 'hp', TRUE),
(2, 'light', 12, 'name', FALSE),
(4, 'auto', 18, 'type', TRUE);
```

#### Opdracht 2

1. We maken een nieuwe pagina aan genaamd `profile.php`.
2. Deze pagina mag alleen worden bekeken als de gebruiker is ingelogd.
3. De code hiervoor staat elders in de applicatie.   

#### Opdracht 3

1. Haal de data van de ingelogde gebruiker op.
2. Toon de data het formulier.



