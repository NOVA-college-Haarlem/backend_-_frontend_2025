# Week 3 — Data uit de database (PDO)

**Kernconcept:** database & tabel · query (`SELECT`) · koppeling code ↔ database
**Context:** je array stond in je code — bij elke wijziging moet je de code aanpassen. Een echte app bewaart data in een **database**. Deze week haalt PlayList de games uit MySQL.

## Leerdoelen

Na deze week kan de student:
- uitleggen waarom je data in een database bewaart i.p.v. in je code;
- een tabel herkennen (rijen = records, kolommen = velden);
- een eenvoudige `SELECT`-query lezen en uitvoeren via PDO;
- de opgehaalde data tonen met de `foreach` van vorige week.

## Activerende start (10 min)
"Vorige week stond je lijst in de code. Wat als een gebruiker zelf een game wil toevoegen? Moet die dan jouw `.php` aanpassen?" → Nee. Data hoort in een **database**. Toon de tabel `games` visueel in **DB Browser/phpMyAdmin**: rijen en kolommen, net een Excel-blad. *De structuur lijkt op de associatieve array van vorige week — dat is bewust.*

> **Voorbereiding docent:** lever een kant-en-klaar `database.sql`-script mee dat de tabel `games` aanmaakt en vult. Studenten importeren dit — niet zelf SQL schrijven deze week.

## PRIMM

### Predict (10 min) — *AI uit*
Deel `playlist.php` uit. *Welke games verschijnen — en waar komen ze nu vandaan?*

```php
<?php
// 1. Verbinden met de database
$pdo = new PDO("mysql:host=localhost;dbname=playlist", "root", "");

// 2. Data ophalen
$query = $pdo->query("SELECT * FROM games");
$games = $query->fetchAll();
?>
<!DOCTYPE html>
<html lang="nl">
<head><title>PlayList</title></head>
<body>
    <h1>Mijn PlayList (uit de database)</h1>
    <?php foreach ($games as $game): ?>
        <div class="card">
            <h2><?= $game["titel"] ?></h2>
            <p>Genre: <?= $game["genre"] ?></p>
        </div>
    <?php endforeach; ?>
</body>
</html>
```

### Run (10 min)
Importeer `database.sql`, draai de pagina. Voorspelling kloppen? **Voeg nu in DB Browser handmatig een rij toe en ververs de pagina** → de nieuwe game verschijnt zonder de code aan te raken. Dít is de koppeling — vier dit moment.

### Investigate (20 min) — live coding, *AI uit*
- "Welke regel praat met de database? Wat doet `new PDO(...)`?" → de **verbinding** (host, dbnaam, gebruiker, wachtwoord).
- "Wat is `$games` nu?" → exact dezelfde structuur als de array van vorige week, maar nu **uit de database**. Daarom werkt de `foreach` ongewijzigd. (Koppel terug naar week 2 — spiraal!)
- "Wat doet `SELECT * FROM games`?" → "geef alle kolommen van alle rijen uit tabel games". Laat live in DB Browser dezelfde query draaien → zelfde resultaat.
- "Wat als de tabelnaam fout is?" → toon de PDO-foutmelding, leer hem lezen.

### Modify (20 min) — *AI mag*
- **Basis:** voeg in de database (niet de code!) 2 games toe; ze verschijnen vanzelf.
- **Uitbreiding:** pas de query aan naar `SELECT * FROM games ORDER BY titel` → gesorteerd.
- **Expert:** `SELECT * FROM games WHERE genre = 'Sport'` → alleen sportgames. Bespreek wat `WHERE` doet.

### Make (30 min) — *AI mag, mits verantwoordbaar*
Zet je **eigen PlayList** over naar een database: maak een eigen tabel (mag via DB Browser, geen handmatige SQL nodig), vul ≥5 records, en toon ze op je pagina via PDO + `foreach`. Push naar Git (let op: **geen wachtwoorden** in publieke repo — bespreek kort).

## Afsluiting (10 min)
Exit-vraag: *"Noem één voordeel van data in een database t.o.v. in je code."*

## Huiswerk / check
- Eigen PlayList haalt data uit een database. Repo bijgewerkt.
- **Volgende week projectweek** — onderwerp alvast kiezen.
