# Week 6 — Eloquent & Models

**Kernconcept:** Model · Controller · Eloquent (herframing van de `SELECT`-query)
**Context:** vorige week stond je lijst hardcoded in de route. Deze week haalt Laravel je games uit de database — met **Eloquent**, een nettere manier dan de PDO-query van week 3.

## Leerdoelen

Na deze week kan de student:
- uitleggen wat een **Model** is (een klasse die één tabel vertegenwoordigt);
- uitleggen wat een **Controller** doet (logica tussen route en view);
- `Game::all()` koppelen aan de `SELECT * FROM games` die ze al kennen;
- data uit de database tonen in een Blade-view via een controller.

## Activerende start (10 min)
Terugkoppeling week 3: "Hoe haalden we data op in plain PHP?" → `$pdo->query("SELECT * FROM games")`. "In Laravel schrijf je: `Game::all()`. Zelfde resultaat, leesbaarder, en je hoeft de verbinding niet meer te regelen." Eloquent = de Laravel-vertaling van SQL.

> **Setup:** lever mee — migration + model `Game` + seeder die de `games`-tabel vult. Studenten draaien `php artisan migrate --seed`. Migrations/seeders zelf schrijven komt later; deze week **lezen en gebruiken** ze die.

## PRIMM

### Predict (10 min) — *AI uit*
Toon model, controller en route. *Welke games verschijnen, en welke regel haalt ze op?*

```php
// app/Models/Game.php
class Game extends Model {
    protected $fillable = ['titel', 'genre', 'uitgespeeld'];
}
```
```php
// app/Http/Controllers/GameController.php
class GameController extends Controller {
    public function index() {
        $games = Game::all();
        return view('games.index', ['games' => $games]);
    }
}
```
```php
// routes/web.php
Route::get('/games', [GameController::class, 'index']);
```
```blade
{{-- resources/views/games/index.blade.php --}}
<h1>Mijn PlayList</h1>
@foreach ($games as $game)
    <div class="card">
        <h2>{{ $game->titel }}</h2>
        <p>{{ $game->genre }}</p>
    </div>
@endforeach
```

### Run (10 min)
`php artisan migrate --seed`, open `/games`. Voeg in DB Browser een rij toe → verschijnt na refresh. Bekende koppeling, nieuwe techniek.

### Investigate (20 min) — live coding, *AI uit*
- "Welke regel haalt de data op? Waar is de `SELECT` gebleven?" → `Game::all()` *is* de SELECT; Eloquent schrijft de SQL voor je.
- "Wat is het verschil tussen `$game["titel"]` (week 3) en `$game->titel` (nu)?" → array vs **object**. Introduceer object-notatie rustig.
- "Wat doet de Controller dat de route vorige week zelf deed?" → logica is **verhuisd** naar een nette plek. Dat is de C van MVC.
- "Waar staat dat `Game` bij de tabel `games` hoort?" → Laravel-conventie (model `Game` → tabel `games`). Benoem: framework = afspraken.

### Modify (20 min) — *AI mag*
- **Basis:** toon een extra veld (`rating`) in de kaart.
- **Uitbreiding:** `Game::orderBy('titel')->get()` i.p.v. `all()` → gesorteerd. Koppel aan `ORDER BY` van week 3.
- **Expert:** voeg een tweede controller-methode `show($id)` + route toe die één game toont (`Game::find($id)`). Detailpagina!

### Make (30 min) — *AI mag, mits verantwoordbaar*
Zet je eigen PlayList over op Eloquent: eigen Model + Controller + Blade die jouw items uit de database toont. Push naar Git.

## "Debug deze AI-output" (10 min)
Geef AI-code met `$game['titel']` (array-notatie) op een Eloquent-object → fout. Laat studenten de oorzaak vinden: object vs array.

## Afsluiting (10 min)
Exit-vraag: *"`Game::all()` doet hetzelfde als welke SQL-query?"*

## Huiswerk / check
- Eigen PlayList toont database-data via Model + Controller + Blade.
