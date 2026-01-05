# Week 6


## Les 1 - Herhaling Project: De Regenboog School

In deze les gaan we alle geleerde concepten van week 1 t/m 5 herhalen in één nieuw project. Je gaat een website bouwen voor basisschool "De Regenboog" met twee losse entiteiten: **klassen** en **leerlingen**.

### Projectomschrijving
Basisschool De Regenboog wil een website waar bezoekers informatie kunnen bekijken over:
- Alle klassen op de school (groep 1 t/m groep 8)
- Alle leerlingen die op school zitten

### Wat ga je oefenen?
- Project setup met Docker
- Database aanmaken en vullen
- Database connectie maken
- SELECT queries uitvoeren
- Data tonen in overzichten (tabellen/cards)
- Detail pagina's maken met GET parameters
- Navigatie bouwen
- Filtering implementeren

---

### Database Schema

#### Tabel 1: `klassen`
```sql
CREATE TABLE klassen (
    id INT AUTO_INCREMENT PRIMARY KEY,
    naam VARCHAR(50) NOT NULL,
    lokaal VARCHAR(10) NOT NULL,
    juf_meester VARCHAR(100) NOT NULL,
    aantal_leerlingen INT NOT NULL,
    verdieping INT NOT NULL
);
```

#### Tabel 2: `leerlingen`
```sql
CREATE TABLE leerlingen (
    id INT AUTO_INCREMENT PRIMARY KEY,
    voornaam VARCHAR(50) NOT NULL,
    achternaam VARCHAR(50) NOT NULL,
    geboortedatum DATE NOT NULL,
    klas VARCHAR(50) NOT NULL,
    woonplaats VARCHAR(100) NOT NULL,
    hobby VARCHAR(100)
);
-- Data voor klassen
INSERT INTO klassen (naam, lokaal, juf_meester, aantal_leerlingen, verdieping) VALUES
('Groep 1A', 'A101', 'Juf Emma van der Berg', 24, 1),
('Groep 2A', 'A102', 'Juf Sophie de Vries', 22, 1),
('Groep 3A', 'B201', 'Meester Lucas Janssen', 26, 2),
('Groep 4A', 'B202', 'Juf Anna Bakker', 25, 2),
('Groep 5A', 'C301', 'Meester Tim Visser', 28, 3),
('Groep 6A', 'C302', 'Juf Lisa Smit', 27, 3),
('Groep 7A', 'D401', 'Meester David de Jong', 24, 4),
('Groep 8A', 'D402', 'Juf Maria Mulder', 26, 4);

-- Data voor leerlingen
INSERT INTO leerlingen (voornaam, achternaam, geboortedatum, klas, woonplaats, hobby) VALUES
('Noah', 'Jansen', '2017-03-15', 'Groep 1A', 'Haarlem', 'Voetbal'),
('Emma', 'de Boer', '2017-07-22', 'Groep 1A', 'Haarlem', 'Tekenen'),
('Liam', 'Visser', '2017-01-10', 'Groep 1A', 'Heemstede', 'Lego'),
('Sophie', 'Bakker', '2016-05-18', 'Groep 2A', 'Haarlem', 'Dansen'),
('Lucas', 'Hendriks', '2016-09-30', 'Groep 2A', 'Bloemendaal', 'Zwemmen'),
('Mila', 'van Dijk', '2016-11-12', 'Groep 2A', 'Haarlem', 'Paardrijden'),
('Sem', 'Mulder', '2015-04-25', 'Groep 3A', 'Haarlem', 'Gamen'),
('Julia', 'Smit', '2015-08-08', 'Groep 3A', 'Heemstede', 'Zingen'),
('Daan', 'de Groot', '2015-02-14', 'Groep 3A', 'Haarlem', 'Voetbal'),
('Fleur', 'Bos', '2014-10-03', 'Groep 4A', 'Haarlem', 'Lezen'),
('Finn', 'Vermeer', '2014-06-20', 'Groep 4A', 'Bloemendaal', 'Skaten'),
('Lisa', 'de Vries', '2014-12-17', 'Groep 4A', 'Haarlem', 'Ballet'),
('Max', 'Kok', '2013-03-09', 'Groep 5A', 'Haarlem', 'Voetbal'),
('Anna', 'Peters', '2013-07-28', 'Groep 5A', 'Heemstede', 'Tekenen'),
('Bram', 'Dijkstra', '2013-11-05', 'Groep 5A', 'Haarlem', 'Muziek'),
('Eva', 'Willems', '2012-04-12', 'Groep 6A', 'Haarlem', 'Hockey'),
('Thijs', 'Janssen', '2012-09-22', 'Groep 6A', 'Bloemendaal', 'Voetbal'),
('Noa', 'van Leeuwen', '2012-01-30', 'Groep 6A', 'Haarlem', 'Dansen'),
('Sam', 'de Wit', '2011-05-15', 'Groep 7A', 'Haarlem', 'Programmeren'),
('Luna', 'Schouten', '2011-10-08', 'Groep 7A', 'Heemstede', 'Volleybal'),
('Jesse', 'Brouwer', '2011-02-19', 'Groep 7A', 'Haarlem', 'Basketbal'),
('Zoë', 'van den Berg', '2010-06-25', 'Groep 8A', 'Haarlem', 'Atletiek'),
('Milan', 'Dekker', '2010-08-14', 'Groep 8A', 'Bloemendaal', 'Tennis'),
('Sara', 'Prins', '2010-12-02', 'Groep 8A', 'Haarlem', 'Gitaar');
```

---

### Opdracht 1: Project Setup

1. Kloon en fork de repository https://github.com/NOVA-college-Haarlem/regenboog_school
3. Open de terminal in VS Code en voer uit: `docker compose up -d`
4. Ga naar http://localhost:8000 en importeer de tabellen en data in de database `regenboog_school`

---
### Opdracht 2: Database Connectie

1. Open het bestand `database.php`
2. Voeg de volgende code toe:

```php
<?php

$dbhost = 'mariadb';
$dbname = 'regenboog_school';
$dbuser = 'root';
$dbpass = 'password';

$conn = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
?>
```

3. Test de connectie door in `index.php` de volgende code toe te voegen:
```php
<?php
require 'database.php';
echo "Database connectie succesvol!";
?>
```

4. Ga naar http://localhost en controleer of de connectie werkt

---

### Opdracht 3: Navigatie Maken

1. Maak een nieuw bestand: `navbar.php`
2. Voeg deze navigatie toe aan `index.php` met `include 'navbar.php';`

---

### Opdracht 4: Homepage Maken

1. Pas `index.php` aan zodat het een mooie homepage wordt:


### Opdracht 5: Klassen Overzicht

1. Maak een nieuw bestand: `klassen.php`
2. Haal alle klassen op uit de database en toon ze in een tabel:


### Opdracht 6: Link naar de detail pagina

1. Voeg een link toe naar de detail pagina van de klas:

```html
<a href="klas-detail.php?id=<?php echo $klas['id']; ?>">View Profile</a>
```

### Opdracht 7: Klas Detail Pagina

1. Maak een nieuw bestand: `klas-detail.php`
2. Toon de details van één specifieke klas
3. 

### Opdracht 8: Leerlingen Overzicht

1. Maak een nieuw bestand: `leerlingen.php`
2. Toon alle leerlingen in een tabel (maak dit zelf met de kennis uit opdracht 5)
3. Kolommen die je moet tonen: voornaam, achternaam, geboortedatum, klas, woonplaats, hobby
4. Voeg een link toe naar een detail pagina: `leerling-detail.php?id=...`

---

### Opdracht 8: Leerling Detail Pagina

1. Maak een nieuw bestand: `leerling-detail.php`
2. Toon de details van één specifieke leerling (gebruik opdracht 6 als voorbeeld)
3. Toon alle informatie van de leerling

---

### Opdracht 9: Filter op Klas

1. Voeg bovenaan `leerlingen.php` een filter sectie toe met links:

```php
<div style="background: white; padding: 1rem; margin-bottom: 1rem; border-radius: 10px;">
    <strong>Filter op klas:</strong>
    <a href="leerlingen.php">Alle leerlingen</a> |
    <a href="leerlingen.php?filter=klas&value=Groep 1A">Groep 1A</a> |
    <a href="leerlingen.php?filter=klas&value=Groep 2A">Groep 2A</a> |
    <a href="leerlingen.php?filter=klas&value=Groep 3A">Groep 3A</a>
    <!-- Voeg meer klassen toe -->
</div>
```

2. Pas de query aan om te filteren:

```php
<?php
if(isset($_GET['filter']) && isset($_GET['value'])){
    $filter = $_GET['filter'];
    $value = $_GET['value'];
    $query = "SELECT * FROM leerlingen WHERE $filter = '$value'";
} else {
    $query = "SELECT * FROM leerlingen";
}
$result = mysqli_query($conn, $query);
$leerlingen = mysqli_fetch_all($result, MYSQLI_ASSOC);
?>
```

---

### Opdracht 10: Filter op Woonplaats

1. Voeg ook een filter toe voor woonplaats op de `leerlingen.php` pagina
2. Leerlingen kunnen gefilterd worden op: Haarlem, Heemstede, Bloemendaal

---

### Opdracht 11: Extra - Statistieken

1. Maak een nieuwe pagina: `statistieken.php`
2. Toon interessante statistieken, bijvoorbeeld:
   - Totaal aantal klassen: `SELECT COUNT(*) as totaal FROM klassen`
   - Totaal aantal leerlingen: `SELECT COUNT(*) as totaal FROM leerlingen`
   - Gemiddeld aantal leerlingen per klas
   - Aantal leerlingen per woonplaats

Voorbeeldcode voor statistieken:
```php
<?php
require 'database.php';

// Totaal aantal klassen
$query1 = "SELECT COUNT(*) as totaal FROM klassen";
$result1 = mysqli_query($conn, $query1);
$totaalKlassen = mysqli_fetch_assoc($result1)['totaal'];

// Totaal aantal leerlingen
$query2 = "SELECT COUNT(*) as totaal FROM leerlingen";
$result2 = mysqli_query($conn, $query2);
$totaalLeerlingen = mysqli_fetch_assoc($result2)['totaal'];

// Toon de statistieken
echo "<h2>Totaal klassen: " . $totaalKlassen . "</h2>";
echo "<h2>Totaal leerlingen: " . $totaalLeerlingen . "</h2>";
?>
```

---

### Checklist voor afronding

- [ ] Project draait op http://localhost
- [ ] Database is aangemaakt en gevuld
- [ ] Navigatie werkt op alle pagina's
- [ ] Klassen overzicht toont alle klassen
- [ ] Klas detail pagina werkt met GET parameter
- [ ] Leerlingen overzicht toont alle leerlingen
- [ ] Leerling detail pagina werkt met GET parameter
- [ ] Filter op klas werkt
- [ ] Filter op woonplaats werkt
- [ ] Code is netjes en gebruikt `include` voor herhaalde delen

---

### Bonusopdrachten

1. **Styling verbeteren**: Gebruik Tailwind CSS of eigen CSS om de pagina's mooier te maken
2. **Zoekfunctie**: Maak een zoekbalk waar je leerlingen kunt zoeken op naam
3. **Sorteren**: Voeg sorteer functionaliteit toe (bijvoorbeeld op achternaam)
4. **Leeftijd berekenen**: Bereken de leeftijd van leerlingen op basis van geboortedatum
5. **Breadcrumbs**: Voeg breadcrumb navigatie toe (Home > Leerlingen > Details)

## Les 2 - Samenvatting Blok 3 - Overzicht Week 1 t/m 5

### Week 1: Introductie PHP & Basis Concepten

**Kernonderwerpen:**
- **PHP & SQL Introductie**: Kennismaking met dynamische websites waarbij gebruikers kunnen inloggen, registreren en data kunnen opslaan
- **Request-Response Cycle**: Begrip van hoe webservers werken en pagina's serveren aan gebruikers
- **Docker Setup**: Lokale ontwikkelomgeving opzetten met docker-compose (webserver + database)
- **Git Workflow**: Repositories forken en clonen naar lokale machine

**Technische Vaardigheden:**
- Project opzetten met `docker compose up -d`
- HTML bestanden converteren naar PHP (`.html` → `.php`)
- Werken met arrays en associatieve arrays
  ```php
  $menuItems = [
      'home' => 'index.php',
      'about' => 'about.php',
      'contact' => 'contact.php'
  ];
  ```
- **DRY Principe**: Code hergebruik met `include` statements
- **Foreach loops**: Dynamisch menu's genereren
  ```php
  foreach($menuItems as $key => $value):
      echo '<a href="' . $value . '">' . $key . '</a>';
  endforeach;
  ```

**Project:** Pokémon Verzameling website

---

### Week 2: Database Integratie

**Kernonderwerpen:**
- **Database connecties** met MySQLi
- Data ophalen uit databases en tonen op webpagina's
- Social media links dynamisch genereren
- HTML/CSS integreren met PHP loops

**Technische Vaardigheden:**
- Database connectie maken (`mysqli_connect`)
  ```php
  $conn = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);
  ```
- SQL queries uitvoeren
  ```php
  $sql = "SELECT * FROM pokemon";
  $result = mysqli_query($conn, $sql);
  $cards = mysqli_fetch_all($result, MYSQLI_ASSOC);
  ```
- Data loopen en tonen in HTML structuren
- Dynamische afbeeldingen met externe URL's
  ```php
  $pokemon_default_url = "https://assets.pokemon.com/assets/cms2/img/pokedex/full/";
  ```

**Database:** PHPMyAdmin gebruiken voor database beheer (http://localhost:8000)

---

### Week 3: Nieuw Project - Formula 1

**Kernonderwerpen:**
- Nieuwe project setup met Formula 1 thema
- Navigatie systemen bouwen
- Databasetabellen aanmaken en vullen
- Data uit database omzetten naar tabel weergave

**Technische Vaardigheden:**
- Project structuur opzetten (forken, clonen, Docker starten)
- Navbar component maken (`navbar.php`)
- SQL data importeren via PHPMyAdmin
- Database query's voor specifieke tabellen (drivers tabel)
  ```php
  $query = "SELECT * FROM drivers";
  $result = mysqli_query($conn, $query);
  $drivers = mysqli_fetch_all($result, MYSQLI_ASSOC);
  ```
- Data correct mappen naar HTML tabellen
  ```php
  echo $driver['forename'] . ' ' . $driver['surname'];
  echo $driver['nationality'];
  echo $driver['dob'];
  ```

**Database Tabellen:** drivers, constructors, circuits

---

### Week 4: Detail Pagina's & Teams

**Kernonderwerpen:**
- Detail pagina's voor individuele drivers
- Query parameters gebruiken met `$_GET`
- Teams (constructors) overzicht en detail pagina's
- Links tussen overzichtspagina's en detail pagina's

**Technische Vaardigheden:**
- **GET Parameters** gebruiken voor specifieke data
  ```php
  $driverId = $_GET['id'];
  $query = "SELECT * FROM drivers WHERE driverId = $driverId";
  ```
- Link naar detail pagina met parameter
  ```html
  <a href="driver-profile.php?id=<?php echo $driver['driverId'] ?>">View Profile</a>
  ```
- Enkele rij ophalen met `mysqli_fetch_assoc()`
  ```php
  $driver = mysqli_fetch_assoc($result);
  ```
- Meerdere pagina's maken: overzichten en profielpagina's
- Teams data tonen: `teams.php` en `team-profile.php`

**Database Queries:** WHERE clausules voor specifieke records

---

### Week 5: Circuits, Images & Filtering

**Kernonderwerpen:**
- Circuits data toevoegen (herhaling van geleerde concepten)
- Afbeeldingen toevoegen aan database entries
- Werken met API's (Wikipedia API)
- Filtering implementeren met GET requests

**Technische Vaardigheden:**
- Database kolommen toevoegen met ALTER TABLE
  ```sql
  ALTER TABLE drivers ADD COLUMN image VARCHAR(255) NULL;
  ```
- Afbeeldingen opslaan in `images/` folder
- Images tonen vanuit database
  ```php
  <img src="images/<?php echo $driver['image']; ?>" alt="Driver">
  ```
- **API integratie** voor dynamische afbeeldingen (Wikipedia API)
- **Filtering met GET parameters**
  ```php
  if(isset($_GET['filter'])){
      $filter = $_GET['filter'];
      $value = $_GET['value'];
      $query = "SELECT * FROM drivers WHERE $filter = '$value'";
  }
  ```
- Filter links maken
  ```html
  <a href="drivers-table.php?filter=nationality&value=Dutch">Dutch</a>
  ```

**Nieuwe Skills:** API gebruik, dynamische filtering, database aanpassingen

---

## Belangrijkste Concepten Blok 3

### 1. PHP Basis
- Variabelen: `$variabelenaam`
- Arrays en loops: `foreach($array as $item)`
- Include statements: `include 'bestand.php'`
- Echo voor output: `echo $variabele`

### 2. Database Operaties
- **Connectie maken**: `mysqli_connect()`
- **Query uitvoeren**: `mysqli_query()`
- **Data ophalen**:
  - Meerdere rijen: `mysqli_fetch_all($result, MYSQLI_ASSOC)`
  - Enkele rij: `mysqli_fetch_assoc($result)`
- **SQL Queries**: SELECT, WHERE clausules, ALTER TABLE

### 3. Request-Response Cycle
- GET parameters: `$_GET['parameternaam']`
- Links met parameters: `pagina.php?id=1&filter=value`
- Data doorgeven tussen pagina's

### 4. Best Practices
- **DRY Principe**: Code niet herhalen (includes gebruiken)
- **Scheiding van concerns**: Database connectie in apart bestand
- **Herbruikbare components**: Menu, navbar, socials
- **Naamgeving**: Duidelijke bestandsnamen en variabelen

### 5. Project Structuur
```
project/
├── index.php (homepage)
├── menu.php (navigation)
├── database.php (connectie)
├── overzicht-paginas.php (tabellen)
├── detail-paginas.php (profiel weergave)
├── images/ (afbeeldingen folder)
└── assets/ (SQL bestanden)
```

---

## Geleerde Workflow

1. **Project Setup**
   - Repository forken op GitHub
   - Clonen naar lokale machine
   - Docker containers starten

2. **Database Setup**
   - SQL bestanden importeren via PHPMyAdmin
   - Tabellen en data controleren
   - Kolommen toevoegen indien nodig

3. **PHP Development**
   - Database connectie maken
   - Queries schrijven
   - Data ophalen en tonen
   - Links en navigatie toevoegen

4. **Testing**
   - Browser openen op `http://localhost`
   - Functionaliteit testen
   - Debugging met `var_dump()`

---

## Veelgebruikte Code Patterns

### Database Query Pattern
```php
<?php
require 'database.php';

$query = "SELECT * FROM tabel";
$result = mysqli_query($conn, $query);
$data = mysqli_fetch_all($result, MYSQLI_ASSOC);
?>
```

### Foreach Loop Pattern
```php
<?php foreach($items as $item): ?>
    <div>
        <h3><?php echo $item['naam']; ?></h3>
        <p><?php echo $item['beschrijving']; ?></p>
    </div>
<?php endforeach; ?>
```

### Detail Pagina Pattern
```php
<?php
$id = $_GET['id'];
$query = "SELECT * FROM tabel WHERE id = $id";
$result = mysqli_query($conn, $query);
$item = mysqli_fetch_assoc($result);
?>
```

### Filter Pattern
```php
<?php
if(isset($_GET['filter'])){
    $filter = $_GET['filter'];
    $value = $_GET['value'];
    $query = "SELECT * FROM tabel WHERE $filter = '$value'";
} else {
    $query = "SELECT * FROM tabel";
}
?>
```

---

## Tools & Technologieën

- **VS Code**: Code editor
- **Docker**: Lokale server omgeving
- **Git/GitHub**: Version control
- **PHP**: Server-side scripting
- **MySQL/MariaDB**: Database
- **PHPMyAdmin**: Database management tool
- **Tailwind CSS**: Styling framework

---

## Volgende Stappen

In de komende weken gaan we verder met:
- Formulieren en POST requests
- Data invoeren en opslaan
- Validatie en security
- Sessions en authenticatie
- CRUD operaties (Create, Read, Update, Delete)
