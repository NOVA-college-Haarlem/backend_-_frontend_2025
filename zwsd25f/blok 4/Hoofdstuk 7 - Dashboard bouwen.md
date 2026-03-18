# Hoofdstuk 6 - Dashboard data

In deze les gaan we de data uit de database halen en tonen op het dashboard.

#### Opdracht 1 - Aantal drivers in db

Toon het aantal drivers in db

Hiervoor hebben we een database connectie nodig.
Met behulp van de COUNT function kunnen we het aantal drivers in de database halen. Omdat het in ons geval om 1 getal gaat gebruiken we mysqli_fetch_assoc() om het resultaat te halen. En we maken gebruik van de alias 'number_of_drivers'.


```php

require 'database.php';

$sql = "SELECT COUNT(*) AS number_of_drivers FROM drivers";
$result = mysqli_query($conn, $sql);
$count = mysqli_fetch_assoc($result);
```

#### Opdracht 2 - Aantal drivers uit Duitsland in db

Met behulp van de COUNT function kunnen we het aantal drivers in de database halen. Omdat het in ons geval om 1 getal gaat gebruiken we mysqli_fetch_assoc() om het resultaat te halen. En we maken gebruik van de alias 'number_of_drivers'.
En we maken gebruik van de WHERE clause om de drivers te filteren op de nationaliteit 'German'.
```php

require 'database.php';

$sql = "SELECT COUNT(*) AS number_of_drivers FROM drivers WHERE nationality = 'German'";
$result = mysqli_query($conn, $sql);
$count_germany = mysqli_fetch_assoc($result);

echo "Het aantal drivers is " . $count['number_of_drivers'] . "<br>";
```

#### Opdracht 3 - Hoogtste positie behaald door het team RENAULT (constructor_standing tabel)

Met behulp van de MAX function kunnen we de hoogtste positie behaald door het team RENAULT halen. Omdat het in ons geval om 1 getal gaat gebruiken we mysqli_fetch_assoc() om het resultaat te halen. En we maken gebruik van de alias 'highest_position'.
En we maken gebruik van de JOIN clause om de constructors te filteren op de naam 'RENAULT'.
```php

require 'database.php';

$sql = "SELECT MAX(position) as highest_position FROM constructor_standing 
                    JOIN constructors ON constructors.constructorId = constructor_standing.constructorId
                    WHERE constructors.name = 'RENAULT'";
$result = mysqli_query($conn, $sql);
$standings = mysqli_fetch_assoc($result);

var_dump($standings['highest_position']);
die;