
# Blok 4

## Week 1 - Les 1

### Herhaling Blok 3

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

In deze les gaan we dit herhalen om daarna de applicatie uit te breiden.

We maken tijdens deze les gebruik van het onderstaande project:

https://github.com/NOVA-college-Haarlem/formula1-new.git

### Opdracht 1

1. Fork het project
2. Open een terminal
3. Clone het project naar je projecten map (C:\projecten) `git clone https://github.com/NOVA-college-Haarlem/formula1-new.git`
4. Open het project in je code editor
5. Open de terminal in je code editor
6. Start de servers met `docker compose up -d`
7. Open de browser en ga naar `http://localhost`
8. Open de browser en ga naar `http://localhost:8000`

### Opdracht 2

1. Kopieer de data uit het bestand formula1.sql in de map sql naar de database formula1
2. Open PHPMyAdmin
3. Gebruik het tabblad SQL en voer de volgende query uit die je zojuist hebt gekopieerd

### Opdracht 3

1. Open het bestand `index.php`
2. Zorg ervoord dat je gebruik maakt van de database connectie: `require_once 'database.php';`
3. We gaan een paar kolommen uit de database tonen: number, forename, surname en nationality:

```php
$query = "SELECT number, forename, surname, nationality FROM drivers";
$result = mysqli_query($conn, $query);
$drivers = mysqli_fetch_all($result, MYSQLI_ASSOC);
```

4. Maak een loop aan die deze data uit de database haalt en in de browser toont in een tabel:

```html
?>
<body>
    <table>
        <tr>
            <th>Number</th>
            <th>Forename</th>
            <th>Surname</th>
            <th>Nationality</th>
        </tr>
        <?php foreach ($drivers as $driver): ?>
            <tr>
                <td><?php echo $driver['number']; ?></td>
                <td><?php echo $driver['forename']; ?></td>
                <td><?php echo $driver['surname']; ?></td>
                <td><?php echo $driver['nationality']; ?></td>
            </tr>
        <?php endforeach; ?>
    </table>
</body>
```

5. Sla de wijzigingen op
6. Open de browser en ga naar `http://localhost:8000`
7. Controleer of de data uit de database wordt getoond

### Opdracht 4

1. Open het bestand `index.php`
2. We gaan nu een link toevoegen zodat we naar een detail pagina kunnen gaan:

```html
<a href="driver_detail.php?id=<?php echo $driver['id']; ?>">Detail</a>
```

3. Er gaat iets mis met deze link. Je krijgt een foutmelding:

```
Notice: Undefined index: id in C:\projecten\formula1-new\driver_detail.php on line 1
```

Hoe kan dit?

4. We moeten de driverId meegeven aan deze link.

```html
<a href="driver_detail.php?id=<?php echo $driver['driverId']; ?>">Detail</a>
```

5. Er gaat nog steeds iets mis. Je krijgt de volgende foutmelding:

```
Notice: Undefined index: driverId in C:\projecten\formula1-new\driver_detail.php on line 1
```

We zijn vergeten om de driverId op te halen uit de database. We dienen de query aan te passen:

```php
//...
$query = "SELECT number, forename, surname, nationality, driverId FROM drivers";
//....
```

6. Controleer je werk.

### Opdracht 5

1. Open het bestand `driver_detail.php`
2. We gaan nu de driver detail pagina maken.
3. We moeten de driverId uit de URL halen:

```php
$driverId = $_GET['id'];
```

4. We moeten de driverId gebruiken om de driver te kunnen tonen:

```php
$query = "SELECT * FROM drivers WHERE driverId = $driverId";
$result = mysqli_query($conn, $query);
$driver = mysqli_fetch_assoc($result);
```

En dan kunnen we de driver detail pagina maken:

```html
<h1><?php echo $driver['forename'] . ' ' . $driver['surname']; ?></h1>
```

## Week 1 - Les 2

We gaan nu verder met de applicatie die we in het vorige blok hebben gemaakt.
We gaan verder met de pokemon applicatie. Maar om iedere student hetzelfde startpunt te bieden hebben we een nieuw project gemaakt. 
Deze dien je te forken en te clonen: https://github.com/NOVA-college-Haarlem/pokemon_blok4

#### Clone de repository

1. Open je terminal
2. Navigeer naar je projecten map
3. Clone de repository

```bash
git clone https://github.com/NOVA-college-Haarlem/pokemon_blok4.git
```

Open het project in je code editor

Open de terminal in je code editor

Start de servers met `docker compose up -d`

Open de browser en ga naar `http://localhost`

Via deze pagina kun je de pagina's bekijken die we hebben gemaakt. We doen een Get-Request naar de website en deze geeft een response terug in de vorm van HTML.

We kunnen ook op een link klikken en deze link is een Get-Request naar de website. Klik eens op de link van een pokemon en je zult zien dat deze pagina ook een Get-Request doet naar de website. We krijgen de details van deze pokemon terug in de vorm van HTML. We kunnen de link ook aanpassen:

### Opdracht 1

1. Open het bestand `index.php`
2. We gaan nu de index.php pagina aanpassen.
3. We passen de link aan die momenteel nog verwijst naar `pokemon_detail_simple.php` naar `pokemon_detail.php`

```php
<a href="pokemon_detail.php?id=<?php echo $pokemon['id']; ?>" class="text-blue-600 hover:text-blue-800">Meer informatie →</a>
```

4. Sla de wijzigingen op
5. Open de browser en ga naar `http://localhost`
6. Controleer of de link naar de detail pagina werkt

Wederom doen we een Get-Request naar de website en deze geeft een response terug in de vorm van HTML.

### Opdracht 2

1. Open het bestand `pokemon_detail.php`
2. Bekijk de code bovenaan de pagina. Je ziet dat we een query uitvoeren om de details van de pokemon te krijgen.

```php

$pokemon_id = $_GET['id']; //get the pokemon id from the url
$query = "SELECT * FROM cards WHERE id = $pokemon_id"; //query the database for the pokemon with the given id
$result = mysqli_query($conn, $query); //execute the query
$pokemon = mysqli_fetch_assoc($result); //fetch the result
```

Je ziet verder dat deze pagina mooi is gestyled met Tailwind CSS. Dit is een veel gebruikte library voor het stylen van HTML.


