# Week 2 — Data tonen met arrays

**Kernconcept:** array & associatief array · loop (`foreach`) · conditie (`if`)
**Context:** vorige week toonde je losse variabelen. Een echte catalogus heeft een *lijst*. Deze week tonen we meerdere games met een loop.

## Leerdoelen

Na deze week kan de student:
- het verschil uitleggen tussen een gewone array en een associatief array;
- een lijst met data tonen met een `foreach`-loop;
- met een `if` bepalen of iets wel/niet getoond wordt;
- voorspellen hoe vaak een loop draait en wat hij oplevert.

## Activerende start (10 min)
"Stel je hebt 50 games. Ga je 50 keer een `$game1`, `$game2`… variabele maken?" Nee → een **array** is een lijst in één variabele. En een **`foreach`** doet iets "voor elk item".

## PRIMM

### Predict (10 min) — *AI uit*
Deel `playlist.php` uit. Studenten voorspellen: *hoeveel kaartjes verschijnen er, en wat staat erin?*

```php
<?php
$games = [
    ["titel" => "Zelda",      "genre" => "Adventure", "uitgespeeld" => true],
    ["titel" => "Minecraft",  "genre" => "Sandbox",   "uitgespeeld" => false],
    ["titel" => "FIFA 26",    "genre" => "Sport",     "uitgespeeld" => true],
];
?>
<!DOCTYPE html>
<html lang="nl">
<head><title>PlayList</title></head>
<body>
    <h1>Mijn PlayList</h1>
    <?php foreach ($games as $game): ?>
        <div class="card">
            <h2><?= $game["titel"] ?></h2>
            <p>Genre: <?= $game["genre"] ?></p>
            <?php if ($game["uitgespeeld"]): ?>
                <span>✅ Uitgespeeld</span>
            <?php else: ?>
                <span>🎮 Nog bezig</span>
            <?php endif; ?>
        </div>
    <?php endforeach; ?>
</body>
</html>
```

### Run (10 min)
Draaien. Drie kaartjes. Voorspelling kloppen? Bekijk paginabron: één `<div class="card">` in de PHP, **drie** in de output → *de loop heeft het herhaald.*

### Investigate (20 min) — live coding, *AI uit*
- "Wat is `$games`? En wat is één `$game`?" → array vs item; **associatief** (`"titel" =>`) vs index.
- "Hoe vaak draait de `foreach`? Hoe weet PHP dat?" → één keer per item.
- "Wat doet de `if ($game["uitgespeeld"])`?" → boolean, conditie. Voeg live een 4e game toe → kaartje verschijnt vanzelf. Mijlpaalgevoel: *data en weergave zijn nu gescheiden.*
- Veelgemaakte fout demonstreren: `$game["titl"]` (typo) → undefined key.

### Modify (20 min) — *AI mag*
- **Basis:** voeg 2 games toe aan de array. Voeg een veld `"rating"` toe en toon het.
- **Uitbreiding:** toon onder de lijst "Aantal games: X" (tel met `count($games)`).
- **Expert:** toon alleen de uitgespeelde games (een `if` die `continue` gebruikt, óf filter).

### Make (30 min) — *AI mag, mits verantwoordbaar*
Breid je eigen PlayList uit: minimaal **5 items** in een associatieve array, getoond met een `foreach`, met minstens één `if`-conditie die de weergave verandert. Hergebruik je CSS uit Blok 1-4 voor de kaartjes!

## "Debug deze AI-output" (optioneel, 10 min)
Geef een AI-snippet met een bewuste fout (bv. `foreach ($game as $games)` omgedraaid, of een `;` na de `foreach`). Wie vindt de fout? Bespreek klassikaal.

## Afsluiting (10 min)
Exit-vraag: *"Wat zou er gebeuren als de array leeg is `[]`?"* (Niets verschijnt — de loop draait 0 keer.)

## Huiswerk / check
- Eigen PlayList toont ≥5 items via een loop, gepusht naar Git.
