# Hoofdstuk 6 - Full Stack App: Esports Platform

## Introductie

In de vorige hoofdstukken heb je een eigen REST API gebouwd op een bestaand project. Nu gaan we een stap verder: je bouwt een **full stack applicatie** van nul. Dat betekent:

- Een **Laravel backend** die data uit een database serveert via een eigen API
- Een **frontend** (HTML + JavaScript) die die API aanroept en de data toont aan de gebruiker

Het project: een **Esports Platform**. Denk aan teams, games en wedstrijden — zoals bij echte esports-competities. De database staat al klaar in de map `Extra API`.

**Wat ga je bouwen?**

| Laag     | Wat                                  | Technologie               |
| -------- | ------------------------------------ | ------------------------- |
| Database | Esports data (games, matches, teams) | MySQL                     |
| Backend  | REST API die JSON teruggeeft         | Laravel 11                |
| Frontend | Webpagina die de API aanroept        | HTML + JavaScript (fetch) |

**Wat ga je leren?**

- Een nieuw Laravel project opzetten en koppelen aan een database
- API-ondersteuning installeren met `php artisan install:api`
- Models en controllers aanmaken voor `games` en `matches`
- Een **API Resource** gebruiken om JSON-responses te formatteren
- Een frontend bouwen die jouw eigen API aanroept

---

## Opdracht 1: Nieuw Laravel project aanmaken

**Doel:** Een vers Laravel project opzetten als basis voor je esports API.

### 1.1 Project aanmaken

Open je terminal en navigeer naar de map waar je projecten staan. Maak een nieuw Laravel project met Herd. Noem dit project "esports-api".



### 1.2 Controleer of het werkt

Ga naar `http://localhost:8000` in je browser. Je ziet de standaard Laravel welkomstpagina. Goed, het project werkt.

---

## Opdracht 2: Database aanmaken en koppelen

**Doel:** De esports database aanmaken en koppelen aan je Laravel project.

### 2.1 Database aanmaken in MySQL

Om Mysql te gebruiken maken we gebruik van docker. Clone de repository `docker-template` van github. en start de containers met `docker compose up -d`.

Open **phpMyAdmin** of je MySQL-tool en maak een nieuwe database aan, noem deze "esports_platform".

> Je kunt ook gewoon op "Nieuwe database" klikken in phpMyAdmin en de naam `esports_platform` invullen.

### 2.2 SQL-bestanden inladen

In de map `Extra API` staan twee bestanden:
- `esports_schema.sql` — de tabelstructuur (CREATE TABLE statements)
- `esports_seed.sql` — de testdata (INSERT INTO statements)

Importeer ze in deze volgorde via phpMyAdmin (of via de terminal):

**Via phpMyAdmin:**
1. Klik op de database `esports_platform`
2. Kies het tabblad **Importeren**
3. Importeer eerst `esports_schema.sql`
4. Importeer daarna `esports_seed.sql`

**Via de terminal (alternatief):**
```bash
mysql -u root -p esports_platform < "pad/naar/esports_schema.sql"
mysql -u root -p esports_platform < "pad/naar/esports_seed.sql"
```

Controleer in phpMyAdmin of de tabellen er staan: `users`, `games`, `teams`, `matches`, enzovoort.

### 2.3 .env koppelen

Open het bestand `.env` in de root van je project. Pas de database-instellingen aan:

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3307
DB_DATABASE=esports_platform
DB_USERNAME=root
DB_PASSWORD=password
```

> Vul bij `DB_PASSWORD` je eigen MySQL-wachtwoord in. Op veel lokale installaties is dit leeg.

Test de verbinding:
```bash
php artisan db:show
```

Je ziet de tabellen van je database als het werkt. Krijg je een foutmelding? Controleer je `.env` instellingen.

---

## Opdracht 3: API-ondersteuning installeren

**Doel:** Laravel klaarmaken voor het afhandelen van API-verzoeken.

In Laravel 11 is API-ondersteuning niet meer standaard ingebouwd. Je installeert het met één commando:

```bash
php artisan install:api
```

Laravel vraagt of je **Laravel Sanctum** wilt installeren. Sanctum is een pakket voor API-authenticatie (inloggen via tokens). Typ `yes` en druk op Enter.

Daarna voert Laravel automatisch de benodigde migraties uit.

**Wat heeft dit commando gedaan?**

- Het bestand `routes/api.php` is aangemaakt — hier komen jouw API-routes
- Sanctum is geïnstalleerd voor (toekomstige) authenticatie
- De `api`-middleware is geconfigureerd

Controleer of het bestand bestaat:
```bash
cat routes/api.php
```

Je ziet een leeg routebestand met een voorbeeld. Goed, de API-laag staat klaar.

---

## Opdracht 4: Het Game model

**Doel:** Een Eloquent model aanmaken voor de `games` tabel.

### 4.1 Wat is een model?

Een **model** in Laravel is een PHP-klasse die één tabel in de database vertegenwoordigt. Via het model kun je data ophalen, aanmaken, aanpassen en verwijderen — zonder zelf SQL te schrijven.

De tabel `games` ziet er zo uit:

| Kolom       | Type    | Omschrijving                             |
| ----------- | ------- | ---------------------------------------- |
| `id`        | BIGINT  | Uniek ID                                 |
| `name`      | VARCHAR | Naam van het spel (bijv. "Valorant")     |
| `slug`      | VARCHAR | URL-vriendelijke naam (bijv. "valorant") |
| `genre`     | VARCHAR | Genre (bijv. "Tactical Shooter")         |
| `cover_url` | VARCHAR | Link naar een afbeelding                 |
| `is_active` | TINYINT | Is het spel actief (1) of niet (0)?      |

### 4.2 Model aanmaken

```bash
php artisan make:model Game
```

Open het aangemaakte bestand `app/Models/Game.php`. Pas het aan:

```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Game extends Model
{
    protected $table = 'games';

    protected $fillable = [
        'name',
        'slug',
        'genre',
        'cover_url',
        'is_active',
    ];

    protected $casts = [
        'is_active' => 'boolean',
    ];
}
```

**Wat doet dit?**

| Eigenschap  | Uitleg                                                          |
| ----------- | --------------------------------------------------------------- |
| `$table`    | Vertelt Laravel welke tabel bij dit model hoort                 |
| `$fillable` | De kolommen die je mag invullen via de API                      |
| `$casts`    | Laravel converteert `is_active` automatisch naar `true`/`false` |

### 4.3 GameController aanmaken

Een **controller** bevat de logica: wat moet er gebeuren als iemand een API-verzoek stuurt?

```bash
php artisan make:controller GameController --api
```

De vlag `--api` genereert automatisch de standaard methodes: `index`, `show`, `store`, `update` en `destroy`.

Open `app/Http/Controllers/GameController.php` en vul de methodes `index` en `show` in:

```php
<?php

namespace App\Http\Controllers;

use App\Models\Game;
use Illuminate\Http\JsonResponse;

class GameController extends Controller
{
    /**
     * Alle games ophalen.
     * GET /api/games
     */
    public function index(): JsonResponse
    {
        $games = Game::all();

        return response()->json($games);
    }

    /**
     * Één game ophalen op ID.
     * GET /api/games/{id}
     */
    public function show(Game $game): JsonResponse
    {
        return response()->json($game);
    }

    public function store() {}
    public function update() {}
    public function destroy() {}
}
```

> **Route Model Binding**: Doordat de parameter `Game $game` heet, zoekt Laravel automatisch het juiste record op via het `id` in de URL. Je hoeft zelf geen `Game::find($id)` te schrijven.

### 4.4 Routes toevoegen

Open `routes/api.php` en voeg de routes toe:

```php
<?php

use App\Http\Controllers\GameController;
use Illuminate\Support\Facades\Route;

Route::get('/games', [GameController::class, 'index']);
Route::get('/games/{game}', [GameController::class, 'show']);
```

### 4.5 Testen in de browser

Start de server:
```bash
php artisan serve
```

Ga naar:
- `http://localhost:8000/api/games` → je ziet alle games als JSON
- `http://localhost:8000/api/games/1` → je ziet alleen Valorant

Voorbeeld van wat je ziet bij `/api/games/1`:

```json
{
    "id": 1,
    "name": "Valorant",
    "slug": "valorant",
    "genre": "Tactical Shooter",
    "cover_url": "https://picsum.photos/seed/valorant/400/200",
    "is_active": true,
    "created_at": "...",
    "updated_at": "..."
}
```

---

## Opdracht 5: Het MatchGame model

**Doel:** Een model aanmaken voor de `matches` tabel.

### 5.1 Waarom "MatchGame" en niet "Match"?

`Match` is een **gereserveerd woord** in PHP — je kunt geen klasse `Match` aanmaken. Daarom noemen we het model `MatchGame`. We vertellen Laravel vervolgens expliciet dat dit model naar de tabel `matches` wijst.

De tabel `matches` ziet er zo uit:

| Kolom            | Omschrijving                               |
| ---------------- | ------------------------------------------ |
| `id`             | Uniek ID                                   |
| `tournament_id`  | Welk toernooi                              |
| `team_home_id`   | Het thuisteam                              |
| `team_away_id`   | Het uitteam                                |
| `round`          | Speelronde                                 |
| `score_home`     | Score thuisteam (NULL = nog niet gespeeld) |
| `score_away`     | Score uitteam (NULL = nog niet gespeeld)   |
| `winner_team_id` | Winnend team (NULL = nog niet beslist)     |
| `played_at`      | Wanneer gespeeld                           |

### 5.2 Model aanmaken

```bash
php artisan make:model MatchGame
```

Open `app/Models/MatchGame.php` en vul het in:

```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MatchGame extends Model
{
    protected $table = 'matches';

    protected $fillable = [
        'tournament_id',
        'team_home_id',
        'team_away_id',
        'round',
        'score_home',
        'score_away',
        'winner_team_id',
        'played_at',
    ];

    protected $casts = [
        'played_at' => 'datetime',
    ];

    // Relatie: match hoort bij een tournament
    public function tournament()
    {
        return $this->belongsTo(Tournament::class);
    }

    // Relatie: thuisteam
    public function homeTeam()
    {
        return $this->belongsTo(Team::class, 'team_home_id');
    }

    // Relatie: uitteam
    public function awayTeam()
    {
        return $this->belongsTo(Team::class, 'team_away_id');
    }
}
```

> De `casts` zorgen ervoor dat `played_at` automatisch als datum-object wordt teruggegeven in plaats van een ruwe string.

### 5.3 MatchController aanmaken

```bash
php artisan make:controller MatchController --api
```

Open `app/Http/Controllers/MatchController.php`:

```php
<?php

namespace App\Http\Controllers;

use App\Models\MatchGame;
use App\Http\Resources\MatchGameResource;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;

class MatchController extends Controller
{
    /**
     * Alle matches ophalen.
     * GET /api/matches
     */
    public function index(): AnonymousResourceCollection
    {
         //haal alle matches op uit de database met teamnamen
        $matches = \App\Models\MatchGame::with('home_team', 'away_team')->get();

        return response()->json(MatchGameResource::collection($matches)->resolve());
    }

    /**
     * Één match ophalen op ID.
     * GET /api/matches/{id}
     */
    public function show(MatchGame $matchGame): MatchGameResource
    {
        return new MatchGameResource($matchGame);
    }

    public function store() {}
    public function update() {}
    public function destroy() {}
}
```

> Merk op: de `MatchController` gebruikt een **API Resource** (`MatchGameResource`) in plaats van `response()->json()`. Dat is het onderwerp van de volgende opdracht.

### 5.4 Route toevoegen

Voeg de match-routes toe aan `routes/api.php`:

```php
use App\Http\Controllers\GameController;
use App\Http\Controllers\MatchController;
use Illuminate\Support\Facades\Route;

Route::get('/games', [GameController::class, 'index']);
Route::get('/games/{game}', [GameController::class, 'show']);

Route::get('/matches', [MatchController::class, 'index']);
Route::get('/matches/{matchGame}', [MatchController::class, 'show']);
```

---

## Opdracht 6: API Resource aanmaken

**Doel:** De JSON-output van de `matches` endpoint zelf bepalen met een Resource.

### 6.1 Wat is een API Resource?

Tot nu toe gaf je met `response()->json($model)` alle kolommen terug — ook kolommen die je misschien niet wil tonen (wachtwoorden, interne velden, of lelijke timestamps).

Een **API Resource** is een klasse die bepaalt welke velden in de JSON-response komen en hoe ze heten. Je hebt volledige controle over de output.

### 6.2 Resource aanmaken

```bash
php artisan make:resource MatchGameResource
```

Open `app/Http/Resources/MatchGameResource.php` en vul het in:

```php
<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class MatchGameResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id'           => $this->id,
            'round'        => $this->round,
            'score_home'   => $this->score_home,
            'score_away'   => $this->score_away,
            'played_at'    => $this->played_at?->format('d-m-Y H:i'),
            'is_played'    => $this->played_at !== null,
            'winner_team_id' => $this->winner_team_id,
            'teams' => [
                'home' => $this->team_home_id,
                'away' => $this->team_away_id,
            ],
        ];
    }
}
```

**Wat is hier nieuw?**

| Veld                      | Uitleg                                                                              |
| ------------------------- | ----------------------------------------------------------------------------------- |
| `played_at?->format(...)` | Datum netjes formatteren. De `?->` betekent: alleen als het niet `null` is.         |
| `is_played`               | Een **extra veld** dat niet in de database zit, maar wel handig is voor de frontend |
| `teams`                   | De team-IDs zijn samengevoegd in een genest object                                  |

### 6.3 Testen

Ga naar `http://localhost:8000/api/matches/1`. De output ziet er nu zo uit:

```json
{
    "data": {
        "id": 1,
        "round": 1,
        "score_home": 13,
        "score_away": 7,
        "played_at": "01-03-2024 15:00",
        "is_played": true,
        "winner_team_id": 1,
        "teams": {
            "home": 1,
            "away": 2
        }
    }
}
```

> Laravel wikkelt een Resource automatisch in een `"data"` wrapper. Dat is standaard gedrag van API Resources.

Ga ook naar `/api/matches` voor de volledige lijst.

---

## Opdracht 7: Alle routes overzicht

**Doel:** Controleren of alle routes correct zijn geregistreerd.

Voer dit commando uit:
```bash
php artisan route:list --path=api
```

Je ziet zoiets:

```
GET  api/games              GameController@index
GET  api/games/{game}       GameController@show
GET  api/matches            MatchController@index
GET  api/matches/{matchGame} MatchController@show
```

Klopt dit? Dan zijn je endpoints klaar. Test ze allemaal in je browser of in Postman.

**Checklist:**

| Endpoint             | Verwacht resultaat                     |
| -------------------- | -------------------------------------- |
| `GET /api/games`     | JSON-lijst van alle 5 games            |
| `GET /api/games/1`   | JSON van Valorant                      |
| `GET /api/games/99`  | 404 foutmelding                        |
| `GET /api/matches`   | JSON-lijst van alle 8 matches          |
| `GET /api/matches/1` | JSON van match 1 via MatchGameResource |

---

## Opdracht 8: Frontend bouwen

**Doel:** Een HTML-pagina bouwen die jouw eigen API aanroept en de data toont.

### 8.1 Een Blade-view aanmaken

Maak het bestand `resources/views/esports.blade.php` aan:

```bash
touch resources/views/esports.blade.php
```

Open het bestand en voeg deze HTML in:

```html
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Esports Platform</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #0f0f1a;
            color: #e0e0e0;
            max-width: 900px;
            margin: 40px auto;
            padding: 0 20px;
        }
        h1 { color: #a855f7; }
        h2 { color: #7c3aed; border-bottom: 1px solid #333; padding-bottom: 8px; }
        .card {
            background: #1a1a2e;
            border: 1px solid #333;
            border-radius: 8px;
            padding: 16px;
            margin: 10px 0;
        }
        .badge {
            display: inline-block;
            background: #a855f7;
            color: white;
            padding: 2px 8px;
            border-radius: 4px;
            font-size: 12px;
        }
        .inactive { background: #555; }
        .score { font-size: 24px; font-weight: bold; color: #a855f7; }
        #loading { color: #888; font-style: italic; }
    </style>
</head>
<body>

    <h1>Esports Platform</h1>

    <h2>Games</h2>
    <div id="games-container">
        <p id="loading">Games laden...</p>
    </div>

    <h2>Wedstrijden</h2>
    <div id="matches-container">
        <p id="loading-matches">Wedstrijden laden...</p>
    </div>

    <script>
        // Games ophalen van onze eigen API
        fetch('/api/games')
            .then(response => response.json())
            .then(games => {
                const container = document.getElementById('games-container');
                container.innerHTML = '';

                games.forEach(game => {
                    const badge = game.is_active
                        ? '<span class="badge">Actief</span>'
                        : '<span class="badge inactive">Inactief</span>';

                    container.innerHTML += `
                        <div class="card">
                            <strong>${game.name}</strong> ${badge}
                            <br>
                            <small>Genre: ${game.genre} | Slug: ${game.slug}</small>
                        </div>
                    `;
                });
            })
            .catch(error => {
                document.getElementById('games-container').innerHTML =
                    '<p style="color:red;">Fout bij ophalen van games.</p>';
                console.error(error);
            });

        // Matches ophalen van onze eigen API
        fetch('/api/matches')
            .then(response => response.json())
            .then(result => {
                const container = document.getElementById('matches-container');
                container.innerHTML = '';

                result.data.forEach(match => {
                    const score = match.is_played
                        ? `<span class="score">${match.score_home} - ${match.score_away}</span>`
                        : '<span style="color:#888">Nog niet gespeeld</span>';

                    container.innerHTML += `
                        <div class="card">
                            <strong>Match #${match.id} — Ronde ${match.round}</strong><br>
                            Team ${match.teams.home} vs Team ${match.teams.away}<br>
                            ${score}<br>
                            <small>Gespeeld op: ${match.played_at ?? '-'}</small>
                        </div>
                    `;
                });
            })
            .catch(error => {
                document.getElementById('matches-container').innerHTML =
                    '<p style="color:red;">Fout bij ophalen van wedstrijden.</p>';
                console.error(error);
            });
    </script>

</body>
</html>
```

### 8.2 Route aanmaken voor de frontend

Open `routes/web.php` en voeg een route toe:

```php
<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('esports');
});
```

### 8.3 Testen

Start de server en ga naar `http://localhost:8000`:

```bash
php artisan serve
```

Je ziet de esports-pagina met:
- Een lijst van alle games, met een badge of ze actief zijn
- Een lijst van alle wedstrijden met scores

> De pagina haalt de data op van je eigen API endpoints `/api/games` en `/api/matches`. Dit is precies hoe een full stack applicatie werkt: de frontend en backend communiceren via JSON.

---

## Uitbreiding (voor als je klaar bent)

Heb je alles werkend? Probeer een of meer van deze uitbreidingen:

### A. Alleen actieve games tonen

Pas de `index` methode in `GameController` aan zodat alleen games met `is_active = true` worden teruggegeven:

```php
$games = Game::where('is_active', true)->get();
```

### B. Gefilterde matches

Maak een extra endpoint dat alleen gespeelde wedstrijden teruggeeft (waar `played_at` niet `null` is):

```php
// In routes/api.php
Route::get('/matches/played', [MatchController::class, 'played']);
```

```php
// In MatchController.php
public function played(): AnonymousResourceCollection
{
    $matches = MatchGame::whereNotNull('played_at')->get();
    return MatchGameResource::collection($matches);
}
```

### C. Score bijwerken via de API

Voeg een `PATCH`-endpoint toe waarmee je de score van een wedstrijd kunt bijwerken:

```php
// In routes/api.php
Route::patch('/matches/{matchGame}', [MatchController::class, 'update']);
```

```php
// In MatchController.php
public function update(Request $request, MatchGame $matchGame): MatchGameResource
{
    $matchGame->update([
        'score_home' => $request->input('score_home'),
        'score_away' => $request->input('score_away'),
        'winner_team_id' => $request->input('winner_team_id'),
        'played_at' => now(),
    ]);

    return new MatchGameResource($matchGame);
}
```

Test dit in Postman met een `PATCH` verzoek naar `/api/matches/8` (de enige match die nog niet gespeeld is):

```json
{
    "score_home": 13,
    "score_away": 6,
    "winner_team_id": 1
}
```

---

## Samenvatting

In dit hoofdstuk heb je een volledige full stack applicatie gebouwd:

| Stap              | Wat je hebt gedaan                                                 |
| ----------------- | ------------------------------------------------------------------ |
| Project aanmaken  | `composer create-project`                                          |
| Database koppelen | `.env` configureren, SQL-bestanden importeren                      |
| API installeren   | `php artisan install:api`                                          |
| Game model        | Model voor de `games` tabel                                        |
| MatchGame model   | Model voor de `matches` tabel (niet `Match` vanwege PHP-beperking) |
| Controllers       | `GameController` en `MatchController` met `index` en `show`        |
| API Resource      | `MatchGameResource` om de JSON-output te formatteren               |
| Routes            | API-routes in `routes/api.php`                                     |
| Frontend          | Blade-view die de API aanroept met `fetch()`                       |

Je hebt nu het fundament van een full stack applicatie. De volgende stap is authenticatie toevoegen — zodat alleen ingelogde gebruikers bepaalde endpoints mogen aanroepen.
