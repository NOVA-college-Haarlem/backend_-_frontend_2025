# Blok 4

## Week 5 - Zoeken in Formula1

In deze les ga je zoeken in de database en filters toepassen in je project Formula1.

Deze versie is een invul-les: je krijgt per opdracht een startpunt, maar je moet de kern zelf afmaken.

Start het project op:
1. Open het project in VS Code.
2. Start de database met `docker compose up -d`.
3. Open in je browser: `http://localhost:8000`.

---

## Leerdoelen

Na deze les kun je:
- een zoekformulier maken met `GET`;
- zoeken met `LIKE` in de database;
- zoeken op verschillende kolommen;
- resultaten sorteren;
- werken met eenvoudige validatie en feedback voor de gebruiker.

---

## Werkwijze

- Vul in elke opdracht alle `TODO`-regels in.
- Laat je code eerst werken voordat je naar de volgende opdracht gaat.
- Beantwoord per opdracht de controlevraag.
- Je mag code hergebruiken uit eerdere opdrachten, maar niet direct kopieren uit de einduitkomst van iemand anders.

---

### Opdracht 1 - Basis zoeken op naam

1. Maak een nieuw bestand aan: `search.php`.
2. Plaats dit formulier in het bestand en vul de TODO in:

```php
<form action="search_process.php" method="GET">
    <label for="zoekterm">Zoek op naam</label>
    <input type="text" name="zoekterm" id="zoekterm" placeholder="TODO: bedenk een voorbeeldzoekterm" required>
    <button type="submit">Zoek</button>
</form>
```

3. Maak een nieuw bestand aan: `search_process.php`.
4. Voeg onderstaande startercode toe en vul alle TODO's in:

```php
<?php
// TODO 1: Controleer of zoekterm is meegestuurd en niet leeg is.
if (/* TODO */) {
    // TODO 2: Haal zoekterm op en trim spaties.
    $zoekterm = /* TODO */;

    require 'database.php';

    // TODO 3: Maak de SQL query af.
    // Zoek op voornaam OF achternaam, met LIKE en een wildcard aan het einde.
    $sql = "SELECT *
            FROM drivers
            WHERE /* TODO */";

    // Voorbeeld (uitgewerkt met LIKE, fictieve tabel):
    // $sql = "SELECT *
    //         FROM superheros
    //         WHERE hero_name LIKE '$zoekterm%'
    //            OR city LIKE '$zoekterm%'";

    $result = mysqli_query($conn, $sql);
    $drivers = mysqli_fetch_all($result, MYSQLI_ASSOC);

    // TODO 4: Toon forename en surname per resultaat.
    foreach ($drivers as $driver) {
        echo /* TODO */;
    }
} else {
    echo "Voer een zoekterm in.";
    exit;
}
```

Controlevraag:
- Wat is het verschil tussen `'$zoekterm%'` en `'%$zoekterm%'`?

---

### Opdracht 2 - Zoeken op specifieke kolommen

Pas het formulier in `search.php` aan zodat je kunt kiezen waarop je zoekt. Vul de TODO's in.

```php
<form action="search_process.php" method="GET">
    <label for="zoekterm">Zoekterm</label>
    <input type="search" name="zoekterm" id="zoekterm" required>

    <div>
        <input type="radio" name="soort" id="voornaam" value="TODO" checked>
        <label for="voornaam">Voornaam</label>
    </div>

    <div>
        <input type="radio" name="soort" id="achternaam" value="TODO">
        <label for="achternaam">Achternaam</label>
    </div>

    <button type="submit">Zoek</button>
</form>
```

Controlevraag:
- Waarom gebruik je bij radio-buttons dezelfde `name` maar een andere `value`?

---

### Opdracht 3 - search_process.php aanpassen voor kolomkeuze

Werk `search_process.php` bij zodat de gekozen kolom wordt gebruikt.

```php
<?php
if (isset($_GET['zoekterm']) && !empty(trim($_GET['zoekterm']))) {
    $zoekterm = trim($_GET['zoekterm']);
    $soort = isset($_GET['soort']) ? $_GET['soort'] : 'voornaam';

    // TODO 1: Zet voornaam/achternaam om naar databasekolom met if/elseif/else.
    if ($soort === 'voornaam') {
        $kolom = /* TODO */;
    } elseif ($soort === 'achternaam') {
        $kolom = /* TODO */;
    } else {
        $kolom = /* TODO */;
    }

    require 'database.php';

    // TODO 2: Gebruik de gekozen kolom in je query.
    $sql = "SELECT *
            FROM drivers
            WHERE /* TODO */";

    $result = mysqli_query($conn, $sql);
    $drivers = mysqli_fetch_all($result, MYSQLI_ASSOC);

    // TODO 3: Toon de resultaten in divs.
    foreach ($drivers as $driver) {
        echo "<div>";
        echo /* TODO */;
        echo "</div>";
    }
} else {
    echo "Voer een zoekterm in.";
    exit;
}
```

Controlevraag:
- Waarom zetten we `soort` eerst om naar een toegestane kolomnaam via `if/elseif/else`?

---

### Opdracht 4 - Verbeterde validatie en feedback

Breid `search_process.php` uit:
1. Zoekterm moet minimaal 2 karakters zijn.
2. Toon het aantal resultaten.
3. Toon een melding als er geen resultaten zijn.

```php
<?php
if (isset($_GET['zoekterm']) && !empty(trim($_GET['zoekterm']))) {
    $zoekterm = trim($_GET['zoekterm']);

    // TODO 1: Maak de minimumlengte-check af.
    if (/* TODO */) {
        echo "Voer minimaal 2 karakters in.";
        exit;
    }

    $soort = isset($_GET['soort']) ? $_GET['soort'] : 'voornaam';

    switch ($soort) {
        case 'voornaam':
            $kolom = 'forename';
            break;
        case 'achternaam':
            $kolom = 'surname';
            break;
        default:
            $kolom = 'forename';
            break;
    }

    require 'database.php';

    // TODO 2: Zorg dat overal in de waarde gezocht wordt.
    $sql = "SELECT *
            FROM drivers
            WHERE /* TODO */";

    $result = mysqli_query($conn, $sql);
    $drivers = mysqli_fetch_all($result, MYSQLI_ASSOC);

    // TODO 3: Bereken aantal resultaten.
    $aantal = /* TODO */;
    echo "<p>Aantal gevonden resultaten: $aantal</p>";

    // TODO 4: Toon resultaten of een melding.
    if ($aantal > 0) {
        foreach ($drivers as $driver) {
            echo $driver['forename'] . " " . $driver['surname'] . "<br>";
        }
    } else {
        echo /* TODO */;
    }
} else {
    echo "Voer een zoekterm in.";
    exit;
}
```

Controlevraag:
- Welke feedback ziet een gebruiker als hij 1 karakter invoert?

---

### Opdracht 5 - Zoeken in meerdere velden

Breid de zoekfunctie uit zodat je ook zoekt op:
- nationaliteit;
- geboortedatum (jaar).

```php
// TODO: Vul minimaal 4 OR-voorwaarden in.
$sql = "SELECT *
        FROM drivers
        WHERE /* TODO */";
```

Extra uitdaging:
- Zoek ook op constructornaam met een JOIN.

```php
// TODO: Maak de joins en where-voorwaarden zelf af.
$sql = "SELECT drivers.*, constructors.name AS constructor_name
        FROM /* TODO */
        LEFT JOIN /* TODO */
        LEFT JOIN /* TODO */
        WHERE /* TODO */
        GROUP BY /* TODO */";
```

Controlevraag:
- Waarom gebruiken we hier `LEFT JOIN` in plaats van `JOIN`?

---

### Opdracht 6 - Sorteren van resultaten

1. Voeg in `search.php` een dropdown toe en vul de TODO's in:

```php
<select name="sorteer">
    <option value="TODO">Naam (A-Z)</option>
    <option value="TODO">Nationaliteit</option>
    <option value="TODO">Geboortedatum (oudste eerst)</option>
</select>
```

2. Pas in `search_process.php` de sortering toe:

```php
$sorteer = isset($_GET['sorteer']) ? $_GET['sorteer'] : 'naam';

// TODO 1: Maak alle ORDER BY regels af.
switch ($sorteer) {
    case 'naam':
        $orderBy = /* TODO */;
        break;
    case 'nationaliteit':
        $orderBy = /* TODO */;
        break;
    case 'geboortedatum':
        $orderBy = /* TODO */;
        break;
    default:
        $orderBy = /* TODO */;
        break;
}

// TODO 2: Voeg $orderBy toe aan je query.
$sql = "SELECT *
        FROM drivers
        WHERE forename LIKE '%$zoekterm%'
           OR surname LIKE '%$zoekterm%'
        /* TODO */";
```

Controlevraag:
- Wat gebeurt er als je geen default in de switch gebruikt?

---

### Opdracht 7 - Betere HTML structuur

Toon de resultaten in een tabel.

```php
if ($aantal > 0) {
    echo "<table border='1'>";
    echo "<tr><th>Voornaam</th><th>Achternaam</th><th>Nationaliteit</th><th>Geboortedatum</th></tr>";

    // TODO: Vul de tabelrijen af.
    foreach ($drivers as $driver) {
        echo "<tr>";
        echo "<td>" . /* TODO */ . "</td>";
        echo "<td>" . /* TODO */ . "</td>";
        echo "<td>" . /* TODO */ . "</td>";
        echo "<td>" . /* TODO */ . "</td>";
        echo "</tr>";
    }

    echo "</table>";
}
```

Controlevraag:
- Waarom is een tabel hier beter leesbaar dan losse regels tekst?

---

### Opdracht 8 - Eenvoudige lijst met zoekopdrachten (sessie)

Gebruik een sessie om zoekopdrachten op te slaan en als lijst te tonen.

Doel:
- Je gebruikt `session_start()`.
- Elke uitgevoerde zoekterm wordt toegevoegd aan een array in de sessie.
- Onder de zoekresultaten toon je een simpele lijst met eerder gezochte termen.

```php
session_start();

// TODO 1: Maak de sessie-array aan als die nog niet bestaat.
if (!isset($_SESSION['zoekgeschiedenis'])) {
    /* TODO */;
}

// TODO 2: Voeg de huidige zoekterm toe aan de sessie-array.
// Tip: dit doe je pas nadat je hebt gecontroleerd dat zoekterm niet leeg is.
/* TODO */;

// TODO 3: Toon de lijst met zoekopdrachten.
echo "<h3>Eerder gezocht</h3>";
echo "<ul>";
foreach ($_SESSION['zoekgeschiedenis'] as $historie) {
    echo /* TODO */;
}
echo "</ul>";
```

Controlevraag:
- Waarom moet `session_start()` bovenaan staan, voordat je met `$_SESSION` werkt?

---

## Afronding checklist

Je bent klaar als:
- zoeken op voornaam en achternaam werkt;
- zoeken op minimaal twee extra velden werkt;
- sorteren werkt;
- je feedback toont bij 0 resultaten;
- je resultaten in een nette tabel staan;
- je een lijst met eerdere zoekopdrachten via sessie toont.

Extra check voor begrip:
- Kun je in je eigen woorden uitleggen wat elke stap doet in je `search_process.php`?
