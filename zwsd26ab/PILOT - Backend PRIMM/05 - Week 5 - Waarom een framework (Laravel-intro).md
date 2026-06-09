# Week 5 — Waarom een framework? (Laravel-intro)

**Kernconcept:** routing · MVC-intro · framework vs los script
**Context:** je plain-PHP catalogus werkt. Maar alle logica en HTML staan door elkaar in één bestand. Deze week: waarom developers een **framework** gebruiken — en je eerste Laravel-pagina.

> **Belangrijk didactisch punt:** introduceer Laravel als **oplossing voor een pijn die studenten net zelf voelden**, niet als "nieuwe verplichte stof". Daarom komt het ná de plain-PHP weken.

## Leerdoelen

Na deze week kan de student:
- 2 problemen benoemen die een framework oplost (structuur, herhaling, veiligheid);
- de rol van een **route** uitleggen (URL → welke code draait);
- de drie letters van **MVC** benoemen op hoofdlijn;
- een bestaande Laravel-route en Blade-view lezen en aanpassen.

## Activerende start (15 min) — "voel de pijn"
Open een plain-PHP catalogus met 4 pagina's (lijst, detail, over, contact). Laat zien: database-verbinding staat in **elk** bestand gekopieerd. "Wat als het wachtwoord verandert?" → 4 plekken aanpassen. "Waar staat de logica en waar de HTML?" → door elkaar.
Dit is de **DRY-pijn**. Een framework lost dit op: één plek voor verbinding, gescheiden logica/weergave, kant-en-klare veiligheid.

> **Setup:** lever een werkend Laravel-startproject mee (`composer create-project` is vooraf gedaan). Studenten draaien `php artisan serve`. Installeren kost tijd — doe dit klassikaal/begeleid.

## PRIMM

### Predict (10 min) — *AI uit*
Toon `routes/web.php` en de view. *Welke URL toont welke tekst?*

```php
// routes/web.php
Route::get('/', function () {
    return view('welcome');
});

Route::get('/playlist', function () {
    $games = ['Zelda', 'Minecraft', 'FIFA 26'];
    return view('playlist', ['games' => $games]);
});
```

```blade
{{-- resources/views/playlist.blade.php --}}
<h1>Mijn PlayList</h1>
<ul>
    @foreach ($games as $game)
        <li>{{ $game }}</li>
    @endforeach
</ul>
```

### Run (10 min)
`php artisan serve`, open `localhost:8000/playlist`. Voorspelling kloppen? Vergelijk met je plain-PHP versie: *zelfde resultaat, andere structuur.*

### Investigate (20 min) — live coding, *AI uit*
- "Welke regel bepaalt dat `/playlist` deze code draait?" → de **route**. Verander de URL naar `/mijn-lijst` → leg de koppeling URL↔code.
- "Waar komt de data binnen in de view?" → de `['games' => $games]` geeft data door; in Blade is `@foreach` gewoon onze `foreach` van week 2 (spiraal — herken het!).
- "Wat is `{{ $game }}`?" → Blade's manier van `echo`, maar **automatisch veilig** (vooruitblik op XSS). Vergelijk met `<?= ?>`.
- Benoem **MVC** licht: Route → (Controller) → Model (data) → View (Blade). Nu nog zonder controller; dat komt week 6.

### Modify (20 min) — *AI mag*
- **Basis:** voeg een route `/over` toe met een eigen Blade-view.
- **Uitbreiding:** maak de `$games` een array van associatieve arrays (titel + genre) en toon beide in Blade.
- **Expert:** voeg een `@if` in Blade toe die "uitgespeeld" toont.

### Make (30 min) — *AI mag, mits verantwoordbaar*
Zet je eigen PlayList-lijst (hardcoded array mag deze week) over naar Laravel: een eigen route + Blade-view die je items toont met `@foreach`. Volgende week komt de echte database erbij.

## Afsluiting (10 min)
Exit-vraag: *"Noem één ding dat Laravel voor je regelt dat je in plain PHP zelf moest doen."*

## Huiswerk / check
- Laravel draait lokaal, eigen route + view werkt, gepusht naar Git.
