# Week 6


## Les 1 - Herhaling Project: Tools4Ever

In deze les gaan we alle geleerde concepten van week 1 t/m 5 herhalen in één nieuw project. Je gaat een website bouwen voor Kluswinkel "Tools4Ever" met twee losse entiteiten: **tools** en **brands**, **users**.

### Projectomschrijving
Tools4Ever wil een website waar bezoekers informatie kunnen bekijken over:
- Alle tools op de website
- Alle brands op de website
- Alle users op de website

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

### Opdracht 1:De repository

De repository is te vinden op https://github.com/NOVA-college-Haarlem/tools4ever

Deze kun je forken en clonen naar je projecten map (C:\projecten)

---
### Opdracht 2: Database Connectie

1. Open het bestand `database.php`
2. Voeg de volgende code toe:

```php
<?php

$dbhost = 'mariadb';
$dbname = 'tools4ever';
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


### Opdracht 5: Tools Overzicht

1. Maak een nieuw bestand: `tools_index.php`
2. Haal alle tools op uit de database en toon ze in een tabel:


### Opdracht 6: Link naar de detail pagina

1. Voeg een link toe naar de detail pagina van de tool: `tool_detail.php?id=...`

```html
<a href="tools_detail.php?id=<?php echo $tool['tool_id']; ?>">Bekijk gereedschap</a>
```

### Opdracht 7: Tool Detail Pagina

1. Maak een nieuw bestand: `tools_detail.php`
2. Toon de details van één specifieke tool
3. Toon alle informatie van de tool

### Opdracht 8: Merken Overzicht

1. Maak een nieuw bestand: `brands_index.php`
2. Toon alle brands in een tabel (maak dit zelf met de kennis uit opdracht 5)
3. Kolommen die je moet tonen: naam
4. Voeg een link toe naar een detail pagina: `brand_detail.php?id=...`

### Opdracht 9: Gebruikers Overzicht

1. Maak een nieuw bestand: `users_index.php`
2. Toon alle users in een tabel (maak dit zelf met de kennis uit opdracht 5)
3. Kolommen die je moet tonen: voornaam, achternaam, email

### Opdracht 10: Gebruiker Detail Pagina

1. Voeg een link toe naar een detail pagina: `user_detail.php?id=...`
2. De detail pagina moet de volgende informatie tonen: voornaam, achternaam, email, telefoonnummer, adres, postcode, woonplaats, status van de gebruiker (actief, inactief en de rol van de gebruiker (admin, user, etc.)



### Opdracht 9: Filter op Tool Brand

1. Voeg bovenaan `tools_index.php` een filter sectie toe met links:

```php
<div style="background: white; padding: 1rem; margin-bottom: 1rem; border-radius: 10px;">
    <strong>Filter op tool brand:</strong>
    <a href="leerlingen.php">Alle leerlingen</a> |
    <a href="tools_index.php?filter=brand&value=brand1">brand1</a> |
    <a href="tools_index.php?filter=brand&value=brand2">brand2</a> |
    <a href="tools_index.php?filter=brand&value=brand3">brand3</a>
    <!-- Voeg meer klassen toe -->
</div>
```

2. Pas de query aan om te filteren:

```php
<?php
if(isset($_GET['filter']) && isset($_GET['value'])){
    $filter = $_GET['filter'];
    $value = $_GET['value'];
    $query = "SELECT * FROM tools WHERE $filter = '$value'";
} else {
    $query = "SELECT * FROM tools";
}
$result = mysqli_query($conn, $query);
$tools = mysqli_fetch_all($result, MYSQLI_ASSOC);
?>
```

---

### Opdracht 11: Extra - Statistieken

1. Maak een nieuwe pagina: `statistieken.php`
2. Toon interessante statistieken, bijvoorbeeld:
   - Totaal aantal tools: `SELECT COUNT(*) as totaal FROM tools`
   - Totaal aantal brands: `SELECT COUNT(*) as totaal FROM brands`
   - Totaal aantal users: `SELECT COUNT(*) as totaal FROM users`

Voorbeeldcode voor statistieken:
```php
<?php
require 'database.php';

// Totaal aantal klassen
$query1 = "SELECT COUNT(*) as totaal FROM tools";
$result1 = mysqli_query($conn, $query1);
$totaalTools = mysqli_fetch_assoc($result1)['totaal'];

// Totaal aantal brands
$query2 = "SELECT COUNT(*) as totaal FROM brands";
$result2 = mysqli_query($conn, $query2);
$totaalBrands = mysqli_fetch_assoc($result2)['totaal'];

// Toon de statistieken
echo "<h2>Totaal tools: " . $totaalTools . "</h2>";
echo "<h2>Totaal brands: " . $totaalBrands . "</h2>";
echo "<h2>Totaal users: " . $totaalUsers . "</h2>";
?>
```

---

### Checklist voor afronding

- [ ] Project draait op http://localhost
- [ ] Database is aangemaakt en gevuld
- [ ] Navigatie werkt op alle pagina's
- [ ] Tools overzicht toont alle tools
- [ ] Tool detail pagina werkt met GET parameter
- [ ] Brands overzicht toont alle brands
- [ ] Brand detail pagina werkt met GET parameter
- [ ] Users overzicht toont alle users
- [ ] User detail pagina werkt met GET parameter
- [ ] Filter op tool brand werkt
- [ ] Code is netjes en gebruikt `include` voor herhaalde delen

---

## Samenvatting Blok 3 - Overzicht Week 1 t/m 5

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
