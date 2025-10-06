# Week 5

## Les 1 - Herhaling

We gaan nu hetzelfde doen als in de vorige les. We gaan nu de data van de circuits tonen. Vorige week hebben we een overzicht gemaakt van teams. We gaan nu de data van de circuits tonen.

### Opdracht 1

1. Voeg data van circuits toe aan de database.
2. Gebruik het bestand `circuits.sql` in de assets folder.
3. Importeer de data in de database via het tabblad SQL in PHPMyAdmin.

### Opdracht 2

1. Maak een nieuw bestand aan genaamd `circuits.php`
2. Voeg de volgende code toe:
```php
<?php

$query = "SELECT * FROM circuits";
$result = mysqli_query($conn, $query);
$circuits = mysqli_fetch_all($result, MYSQLI_ASSOC);
var_dump($circuits);
?>
```
3. Test je code in de browser.
4. De data van de circuits wordt nu getoond in de circuits pagina.

### Opdracht 3

1. Pas het bestand `circuits.php` aan zodat de data van de circuits wordt getoond in een tabel.

### Opdracht 4
1. We gaan nu een link toevoegen naar de detail pagina van de circuits.
2. Voeg de volgende code toe:
```html
<a href="circuit-profile.php?id=<?php echo $circuit['circuitId'] ?>" class="text-blue-500 hover:underline">View Profile</a>
```
3. Test je code in de browser.
4. De link naar de detail pagina van de circuits werkt nu.
5. De detail pagina van de circuits werkt nog niet. Maak een nieuw bestand aan genaamd `circuit-detail.php`.
6. We gaan nu de detail pagina van de circuits maken.
7. Voeg de volgende code toe:
```php
<?php
$circuitId = $_GET['id'];
$query = "SELECT * FROM circuits WHERE circuitId = $circuitId";
$result = mysqli_query($conn, $query);
$circuit = mysqli_fetch_assoc($result);
?>
```

### Opdracht 5

1. Pas het bestand `circuit-detail.php` aan zodat de data netjes wordt getoond zoals de rest van de pagina's.


## Les 2 - Images in PHP

In deze les gaan we images toevoegen aan onze applicatie.
We gaan gebruik maken van de `images` folder in de root van de project.

### Opdracht 1

1. We voegen een kolom toe aan de drivers tabel. Deze kolom heet `image`.
2. Je kunt dit op twee manieren doen:
    - Via PHPMyAdmin en de GUI
    - Via het tabblad SQL
3. Voer de volgende code uit:
```sql
ALTER TABLE drivers ADD COLUMN image VARCHAR(255) NULL;
```

### Opdracht 2

1. Zoek nu op internet voor een image van een driver en voeg deze toe aan de `images` folder in de root van de project.
2. Voeg de naam van de image toe aan de drivers tabel.
3. Echo de naam van de image in de driver-profile.php pagina.
4. Test je code in de browser.
5. De image wordt nu getoond in de driver-profile.php pagina.

### Opdracht 3

1. We doen nu hetzelfde voor de teams tabel.
2. Zoek op internet voor een image van een team en voeg deze toe aan de `images` folder in de root van de project.
3. Voeg de kolom `image` toe aan de teams tabel.
```sql
ALTER TABLE constructors ADD COLUMN image VARCHAR(255) NULL;
```
4. Voer de naam van de afbeelding toe aan de teams tabel.
5. Echo de naam van de image in de team-profile.php pagina.
6. Test je code in de browser.
7. De image wordt nu getoond in de team-profile.php pagina.

### Opdracht 4

1. We doen nu hetzelfde voor de circuits tabel.
2. Zoek op internet voor een image van een circuit en voeg deze toe aan de `images` folder in de root van de project.
3. Voeg de kolom `image` toe aan de circuits tabel.
```sql
ALTER TABLE circuits ADD COLUMN image VARCHAR(255) NULL;
```
1. Voer de naam van de afbeelding toe aan de circuits tabel.
2. Echo de naam van de image in the circuit-detail.php pagina.
3. Test je code in de browser.
4. De image wordt nu getoond in the circuit-detail.php pagina.

### Opdracht 5.

1. Aangezien we heel veel drivers hebben is dit een hele omslachtige wijze om afbeeldingen toe te voegen.
2. We gaan het nu op een andere manier doen. We gaan gebruik maken van een API.
3. Wat is een API?
4. Een API is een interface die gebruikt wordt om data te verkrijgen van een server.
5. Wij maken gebruik van de API van Wikipedia.
6. In de assets folder staat een nieuw bestand genaamd `api.php`.
7. Open het bestand `api.php` en bestudeer de code.
8. Dit bestand hebben we nodig in de driver-profile.php pagina. Hiervoor gebruiken we `include`.

## Les 3 - Filter

We gaan op de pagina drivers-table.php een filter toevoegen. We beperken ons met een GET request

### Opdracht 1

1. We gaan een filter toevoegen op de pagina drivers-table.php.
2. Voeg de volgende code toe:
```php
<?php
if(isset($_GET['filter'])){
    $filter = $_GET['filter'];
}
?>
```

