# Hoofdstuk 7 - Dashboard bouwen

In deze les ga je meerdere query's combineren op een dashboard. Je gebruikt wat je in eerdere hoofdstukken hebt geleerd: database connectie, validatie, JOINS en het tonen van resultaten.

## Leerdoelen

Na deze les kun je:

- Met `COUNT`, `MAX` en `SUM` kerncijfers ophalen uit de database.
- Data uit meerdere tabellen combineren met een `JOIN`.
- Resultaten netjes tonen in een dashboard met duidelijke blokken.
- Foutafhandeling toevoegen als een query mislukt.

## Opdracht 1 - Voorbereiding dashboard

1. Maak een nieuw bestand aan genaamd `dashboard.php`.
2. Voeg onderaan dit bestand HTML toe waarin je straks de resultaten toont.
3. Vergeet niet de database connectie te laden.

```php
<?php
require 'database.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>F1 Dashboard</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; }
        .cards { display: grid; grid-template-columns: repeat(auto-fit, minmax(220px, 1fr)); gap: 16px; }
        .card { border: 1px solid #ddd; border-radius: 10px; padding: 16px; }
        h2 { margin-top: 0; font-size: 18px; }
        .value { font-size: 28px; font-weight: bold; }
    </style>
</head>
<body>
    <h1>Formula 1 Dashboard</h1>
    <div class="cards">
        <!-- Cards komen hier -->
    </div>
</body>
</html>
```

## Opdracht 2 - Aantal drivers in de database

Gebruik `COUNT(*)` om het totaal aantal drivers op te halen.

```php
$sql = "SELECT COUNT(*) AS number_of_drivers FROM drivers";
$result = mysqli_query($conn, $sql);

if (!$result) {
    die("Query mislukt: " . mysqli_error($conn));
}

$count = mysqli_fetch_assoc($result);
```

Toon de waarde in een card:

```php
<div class="card">
    <h2>Totaal aantal drivers</h2>
    <p class="value"><?php echo $count['number_of_drivers']; ?></p>
</div>
```

## Opdracht 3 - Aantal Duitse drivers

Filter op nationaliteit met een `WHERE` clause.

```php
$sql = "SELECT COUNT(*) AS number_of_german_drivers
        FROM drivers
        WHERE nationality = 'German'";
$result = mysqli_query($conn, $sql);

if (!$result) {
    die("Query mislukt: " . mysqli_error($conn));
}

$count_germany = mysqli_fetch_assoc($result);
```

Toon deze waarde ook in een card.

## Opdracht 4 - Beste positie van team RENAULT

We willen weten wat de beste klassering van team `RENAULT` was in de tabel `constructor_standings`. Let op: in dit soort tabellen is positie `1` de beste positie, dus gebruiken we `MIN(position)`.

```php
$sql = "SELECT MIN(constructor_standings.position) AS best_position
        FROM constructor_standings
        JOIN constructors
            ON constructors.constructorId = constructor_standings.constructorId
        WHERE constructors.name = 'RENAULT'";

$result = mysqli_query($conn, $sql);

if (!$result) {
    die("Query mislukt: " . mysqli_error($conn));
}

$renault = mysqli_fetch_assoc($result);
```

Toon dit in de dashboard card.

## Opdracht 5 - Extra dashboard statistiek

Voeg zelf 1 extra statistiek toe. Kies er een:

- Totaal aantal constructors.
- Aantal verschillende nationaliteiten bij drivers.
- Gemiddeld puntenaantal in `driver_standings`.

Voorbeeld (verschillende nationaliteiten):

```php
$sql = "SELECT COUNT(DISTINCT nationality) AS total_nationalities FROM drivers";
$result = mysqli_query($conn, $sql);

if (!$result) {
    die("Query mislukt: " . mysqli_error($conn));
}

$nationalities = mysqli_fetch_assoc($result);
```

## Opdracht 6 - Dashboard netjes maken

Werk je dashboard af:

1. Voeg een titel en korte uitleg toe.
2. Toon minimaal 4 cards met statistieken.
3. Zorg dat je pagina bruikbaar blijft op mobiel.
4. Gebruik duidelijke labels en waarden.
