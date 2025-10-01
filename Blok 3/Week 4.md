# Week 4

## Les 1 - Detail pagina

Op een detail pagina kunnen we alle data van een driver tonen en niet alleen de drie attributen die we eerder hebben getoond.
Om een detail pagina te maken hebben we een query nodig die alle data van een driver ophaalt maar wel data van een specifieke driver.

### Opdracht 1
1. We gaan nu de details van de driver tonen in het bestand `driver-profile.php`.
2. Voeg de volgende code toe:
```php
<?php

$query = "SELECT * FROM drivers WHERE driverId = 1";
$result = mysqli_query($conn, $query);
$driver = mysqli_fetch_assoc($result);
?>
```
4. Met een `var_dump` kunnen we de data van de driver bekijken.
```php
<?php
var_dump($driver);
?>
```
5. Test je code in de browser.
6. De data van de driver wordt nu getoond in de profielpagina.
7. Dit gaan we later nog stijlen.

### Opdracht 2
1. We gaan nu de data van de driver tonen in een mooi overzicht.
2. Voeg de volgende code toe:
```php
<?php
echo $driver['driverRef'];
echo $driver['driverId'];
echo $driver['code'];
echo $driver['forename'] . ' ' . $driver['surname'];
echo $driver['nationality'];
echo $driver['dob'];
echo $driver['url'];
?>
```
3. Test je code in de browser.

### Opdracht 3
1. We willen er nu voor zorgen dat de data van de aangeklikte driver wordt getoond.
2. In de drivers-table.php maken we een link naar de driver-profile.php pagina.
```html
<td><a href="driver-profile.php?id=<?php echo $driver['driverId'] ?>" class="text-blue-500 hover:underline">View Profile</a></td>
```

3. Zodra we op de link klikken wordt de driver-profile.php pagina getoond.
4. Zodra we op de link klikken wordt er een parameter meegegeven aan de driver-profile.php pagina.
5. Deze parameter is de `id` van de de driver.
6. We kunnen deze parameter gebruiken om de data van de driver te ophalen.
7. Voeg de volgende code toe aan de driver-profile.php pagina:
```php
<?php
$driverId = $_GET['id'];
$query = "SELECT * FROM drivers WHERE driverId = $driverId";
$result = mysqli_query($conn, $query);
$driver = mysqli_fetch_assoc($result);
```

8. Test je code in de browser.
9. De data van de driver wordt nu getoond in de profielpagina.


### Opdracht 4
1. Laten we AI gebruiken om de stijl van de pagina te verbeteren.


### Opdracht 5

1. We gaan nu de data van de constructors (teams) tonen.
2. Daarvoor hebben we data nodig in de database.
3. Deze data kun je vinden in het bestand `constructors.sql` in de map `assets`.

### Opdracht 6

4. We gaan ook data van constructors (teams) tonen. Daarvoor moeten we eerst het menu aanpassen.
5. Pas het bestand `navbar.php` aan.
6. Voeg de volgende code toe:
```html
<a href="teams.php">Teams</a>
```

### Opdracht 7

1. Voeg data in de database toe. Gebruik het bestand `constructors.sql` in de map `assets`.
2. Importeer de data in de database.
3. Test je code in de browser.
4. De data van de teams wordt nu getoond in de teams pagina.

### Opdracht 8

1. Maak het bestand `teams.php` aan.
2. Voeg de volgende code toe:
```php

$query = "SELECT constructorId, name FROM constructors";
$result = mysqli_query($conn, $query);
$teams = mysqli_fetch_all($result, MYSQLI_ASSOC);
```
3. Test je code in de browser.
4. De data van de teams wordt nu getoond in de teams pagina.

### Opdracht 9
1. Voeg een link toe naar de detail pagina van de teams.
2. Voeg de volgende code toe:
```html
<a href="team-profile.php?id=<?php echo $team['constructorId'] ?>" class="text-blue-500 hover:underline">View Profile</a>
```


### Opdracht 10
1. Pas de stijling aan met behulp van AI.
2. Zet alle data (contructorId, name) die we hebben in een tabel.

### Opdracht 11
1. Maak een detail pagina voor de teams.
2. Voeg de volgende code toe:
```php

$constructorId = $_GET['id'];
$query = "SELECT * FROM constructors WHERE constructorId = $constructorId";
$result = mysqli_query($conn, $query);
$constructor = mysqli_fetch_assoc($result);
```
3. Test je code in de browser.
4. De data van de team wordt nu getoond in de detail pagina. Toon nu alle data die we ophalen uit de database.



## Les 2 - Images in PHP

In deze les gaan we images toevoegen aan onze applicatie.
We gaan gebruik maken van de `images` folder in de root van de project.
We gaan gebruik maken van de `image` kolom in de `drivers` tabel.
We gaan gebruik maken van de `image` kolom in de `drivers` tabel.



