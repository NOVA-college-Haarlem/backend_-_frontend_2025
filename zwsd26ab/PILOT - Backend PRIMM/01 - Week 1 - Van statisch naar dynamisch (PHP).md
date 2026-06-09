# Week 1 — Van statisch naar dynamisch (PHP)

**Kernconcept:** client vs server · variabele & datatype
**Context:** je PlayList-pagina toont nu vaste HTML. Deze week maakt PHP de inhoud *dynamisch*.

## Leerdoelen

Na deze week kan de student:
- in eigen woorden uitleggen wat het verschil is tussen client-side (HTML/CSS) en server-side (PHP);
- een PHP-variabele maken, vullen en met `echo` in een HTML-pagina tonen;
- voorspellen wat een stukje PHP-code op het scherm laat zien.

## Activerende start (10 min)

Toon twee identieke pagina's: één `.html`, één `.php`. "Wat is het verschil? Waar 'gebeurt' de PHP-versie?" Korte uitleg: de browser ziet nooit PHP — de server maakt er HTML van en stuurt dát op. Teken het: **Browser → request → Server (PHP draait) → HTML → Browser**.

## PRIMM

### Predict (10 min) — *AI uit*
Deel `playlist.php` uit (zie onder). Studenten lezen en schrijven op: *"Wat verschijnt er in de browser?"* Nog niet draaien.

```php
<?php
$titel = "PlayList";
$eigenaar = "Sam";
$aantalGames = 3;
?>
<!DOCTYPE html>
<html lang="nl">
<head><title><?= $titel ?></title></head>
<body>
    <h1><?= $titel ?> van <?= $eigenaar ?></h1>
    <p>Je hebt <?= $aantalGames ?> games in je lijst.</p>
</body>
</html>
```

### Run (10 min)
Bestand in `htdocs` zetten, `localhost/playlist.php` openen. Voorspelling kloppen? Bekijk **"paginabron"** in de browser: de `<?php ?>` is weg — alleen HTML. Dit is hét "aha"-moment: *de server heeft het verwerkt.*

### Investigate (20 min) — live coding, *AI uit*
Docent stelt vragen en past live aan:
- "Wat is `$titel`? Wat is het type van `$aantalGames` vs `$eigenaar`?" → introduceer **variabele**, **string** vs **int**.
- "Wat doet `<?= ... ?>`?" → korte vorm van `echo`.
- "Wat als ik `$eigenaar` leeg laat? Of de regel `$eigenaar = ...` weghaal?" → toon de foutmelding/`undefined variable`, normaliseer fouten.
- "Waarom staat de `<?php` blok bovenaan en niet in de `<body>`?" → scheiding logica/weergave (zaadje voor MVC later).

### Modify (20 min) — *AI mag*
Gelaagd:
- **Basis:** voeg een variabele `$jaar` toe en toon "© 2026" dynamisch in een footer.
- **Uitbreiding:** maak een variabele `$favoriet` en toon "Je favoriete game is …".
- **Expert:** reken iets uit met PHP, bv. `$aantalGames * 2`, en toon het.

### Make (30 min) — *AI mag, mits verantwoordbaar*
Studenten starten **hun eigen PlayList.php**: kies een onderwerp (games/films/muziek), maak minimaal 4 variabelen en toon een persoonlijke header + intro. Commit naar Git.

## Afsluiting (10 min)
Exit-vraag (mondeling, willekeurige student): *"Waarom ziet de browser de PHP-code nooit?"* — check op het kernconcept client/server.

## Huiswerk / check
- Repo aangemaakt en `playlist.php` gepusht.
- Eén zin opschrijven: "Het verschil tussen HTML en PHP is …".
