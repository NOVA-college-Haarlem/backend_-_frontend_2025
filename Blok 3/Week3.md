# Blok 3

## Week 3

We gaan met een nieuw project hetzelfde doen als in de eerste twee weken. 
We maken gebruik van een website en een database met het onderwerp formula 1.

Ga naar: https://github.com/NOVA-college-Haarlem/formula1-2526

### Opdracht 1

1. Fork het project
2. Clone het project naar je projecten map (C:\projecten) `git clone https://github.com/NOVA-college-Haarlem/formula1-2526.git`
3. Open het project in je code editor
4. Open de terminal in je code editor
5. Start de servers met `docker compose up -d`
6. Open de browser en ga naar `http://localhost`
7. Open de browser en ga naar `http://localhost:8000`

### Opdracht 2

1. Open het bestand `index.html`
2. Verander de extensie van de index.html naar index.php
3. Verander de extensie van de driver-table.html naar driver-table.php


### Opdracht 3
1. De navigatie werkt niet goed. We gaan de navigatie aanpassen.
2. Zorg ervoor dat je een bestand maakt dat `navbar.php` heet.
3. Kopieer de navigatie uit de index.php naar de navbar.php
```html
<!-- Navigation -->
    <nav class="bg-black bg-opacity-90 fixed w-full z-50">
        <div class="container mx-auto px-6 py-4">
            <div class="flex justify-between items-center">
                <div class="flex items-center space-x-4">
                    <i data-feather="flag" class="text-red-600"></i>
                    <span
                        class="text-2xl font-bold bg-gradient-to-r from-red-600 to-red-400 bg-clip-text text-transparent">F1
                        PULSE</span>
                </div>
                <div class="hidden md:flex space-x-8">
                    <a href="index.php" class="hover:text-red-500 transition">Home</a>
                    <a href="#" class="hover:text-red-500 transition">News</a>
                    <a href="#" class="hover:text-red-500 transition">Calendar</a>
                    <a href="#" class="hover:text-red-500 transition">Teams</a>
                    <a href="#" class="hover:text-red-500 transition">Drivers</a>
                </div>
                <button class="md:hidden">
                    <i data-feather="menu"></i>
                </button>
            </div>
        </div>
    </nav>
```
4. Pas de link naar `Drivers` aan zodat je erop kan klikken: `href="#"` naar `href="drivers-table.php"`

### Opdracht 4
1. We gaan de tabel in het bestand `driver-table.php` aanpassen.
2. Haal alle content weg behalve de rij van Max Verstappen.
3. Voeg de volgende code toe:
```php
 <?php foreach($drivers as $driver): ?>
<tr class="border-b border-gray-700 hover:bg-gray-750">

//overige code
</tr>
<?php endforeach; ?>
```
4. Er komt nu een foutmelding. We moeten de array uit het bestand `drivers-array.php` toevoegen aan het bestand `driver-table.php`.
5. Voeg de volgende code toe ergens bovenaan het bestand `driver-table.php`:
```php
<?php
include 'drivers-array.php';
?>
```


### Opdracht 5
1. De naam van Max Verstappen wordt nu 25x herhaald. Dit is natuurlijk niet wat we willen.
2. We willen de content dynamisch maken.
3. In de loop schrijven we de volgende code op de plek van de naam:

```php
<?php echo $driver['name']; ?>
```

4. Doe dit ook voor de andere gegevens: position, wins, points, image
5. Test je code in de browser

### Opdracht 6
1. We gaan nu in plaats van de data uit een array, de data uit de database halen.
2. Hiervoor maken we gebruik van de data uit het bestand `formula1-drivers.sql`.
3. Ga naar PHPMyAdmin (http://localhost:8000) en kies de database `formula1`.
4. Kies het tabblad SQL.
5. Kopiëer de code uit het bestand `formula1-drivers.sql` en plak deze in het SQL tabblad:
6. Klik op Starten of Go.
7. De data is nu in de database geïmporteerd.

### Opdracht 7
1. We gaan nu de data uit de database halen in het bestand `driver-table.php`.
2. Daarvoor hebben we een database connectie nodig.
3. Maak een nieuw bestand aan met de naam `database.php`.
4. Voeg de volgende code toe:
```php
<?php
$dbhost = 'localhost';
$dbname = 'formula1';
$dbuser = 'root';
$dbpass = 'password';

$conn = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);
?>
```
5. Importeer de connectie in het bestand `driver-table.php`:
```php
<?php
require 'database.php';
?>
```
6. Maak een query om de data uit de database te halen:
```php
<?php
$query = "SELECT * FROM drivers";
$result = mysqli_query($conn, $query);
$drivers = mysqli_fetch_all($result, MYSQLI_ASSOC);
?>
```
7. Test je code in de browser. 

### Opdracht 8
1. De data komt niet overeen in de tabel
2. Dit gaan we fixen.

```html
 <tr class="border-b border-gray-700 hover:bg-gray-750">
    <td class="py-4 px-6 font-bold"><?php echo $driver['driverId'] ?></td>
    <td class="py-4 px-6 flex items-center">
        <span><?php echo $driver['forename'] ?> <?php echo $driver['surname'] ?></span>
    </td>
    <td class="py-4 px-6">
        <div class="flex items-center">
            <div class="w-3 h-3 bg-blue-600 rounded-full mr-2"></div>
            <?php echo $driver['nationality'] ?>        
        </div>
    </td>
    <td class="py-4 px-6 font-bold"><?php echo $driver['dob'] ?></td>
</tr>
```
3. Test je code in de browser.
4. De data komt nu overeen in de tabel.


