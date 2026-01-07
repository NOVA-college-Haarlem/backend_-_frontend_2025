# Hoofdstuk 5 - JOINS gebruiken

In deze les gaan we JOINS gebruiken om de data uit de database te halen.


#### Opdracht 1 - Overzicht standings

Eerder hebben we al een driver overzicht gemaakt. Nu gaan we de standings tonen in een overzicht.

1. Maak een nieuw bestand aan genaamd `standings.php`.
2. Voeg de volgende code toe:

```php
<?php

require 'database.php';

$sql = "SELECT * FROM standings";
$result = mysqli_query($conn, $sql);
$standings = mysqli_fetch_all($result, MYSQLI_ASSOC);

```

Dit is code die we gewend zijn. Als w dit op het scherm zouden tonen dan zien we heel veel getallen.

```sql
INSERT INTO `driver_standing` (`driverStandingsId`, `raceId`, `driverId`, `points`, `position`, `positionText`, `wins`) VALUES
(1, 18, 1, 10, 1, '1', 1),
(2, 18, 2, 8, 2, '2', 0),
(3, 18, 3, 6, 3, '3', 0),
(4, 18, 4, 5, 4, '4', 0),
(5, 18, 5, 4, 5, '5', 0),
(6, 18, 6, 3, 6, '6', 0);
```

We willen de standings table niet op deze manier tonen maar we willen de namen van de driver ERBIJ. 

We gaan deze JOIN gebruiken. Met een JOIN kunnen we overeenkomende rijen tussen twee tabellen koppelen. We maken gebruik van de driverId kolom om de overeenkomende rijen te koppelen. Dit is de primaire key van de drivers tabel en de foreign key van de driver_standings tabel.

```php
require 'database.php';

$sql = "SELECT * FROM driver_standings 
            JOIN drivers 
                ON drivers.driverId = driver_standing.driverId ORDER BY position ASC";

$result = mysqli_query($conn, $sql);
$standings = mysqli_fetch_all($result, MYSQLI_ASSOC);
```

Nu hebbben we de data opgehaald va twee tabellen en we willen de data tonen in een overzicht.

```php
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php foreach($standings as $standing):?>
        <div>
            <h1>Position: <?php echo $standing['position']; ?></h1>
            <h2><?php echo $standing['forename'] . ' ' . $standing['surname']; ?></h2>
            <p>Points: <?php echo $standing['points']; ?></p>
        </div>
    <?php endforeach; ?>
</body>
</html>
```
