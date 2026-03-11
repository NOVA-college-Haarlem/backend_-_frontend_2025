# Hoofdstuk 5 - Eigen REST API Bouwen

## Introductie

In de vorige hoofdstukken heb je **andermans API's geconsumeerd**: je haalde data op van OpenWeatherMap en CoinGecko. Maar wat als jij de aanbieder bent? Wat als een andere applicatie - een mobiele app, een React frontend, of een andere website - jouw data wil gebruiken?

Dan bouw je een **eigen REST API**.

Een REST API is niets meer dan een set URL's (endpoints) die JSON teruggeven in plaats van HTML. De regels zijn simpel:

| HTTP methode | Actie | Voorbeeld |
|---|---|---|
| `GET` | Data ophalen | `GET /api/coins` → lijst van coins |
| `GET` | Eén item ophalen | `GET /api/coins/bitcoin` → details van Bitcoin |
| `POST` | Nieuw item aanmaken | `POST /api/coins` → coin toevoegen |
| `PUT` / `PATCH` | Item bijwerken | `PUT /api/coins/bitcoin` → coin aanpassen |
| `DELETE` | Item verwijderen | `DELETE /api/coins/bitcoin` → coin verwijderen |

**Wat gaan we bouwen?**

We bouwen een REST API op het **Crypto Dashboard** uit Hoofdstuk 3 en 4. De API geeft de coindata terug als JSON. Andere applicaties kunnen deze data dan gebruiken - zonder dat ze iets weten van onze database of Laravel-code.

Aan het einde van dit hoofdstuk kun je je eigen API testen in Postman.

---

## Opdracht 1: `routes/api.php` vs `routes/web.php`

**Doel:** Begrijpen hoe API routes werken in Laravel

### 1.1 Het verschil uitgelegd

Laravel heeft twee aparte routebestanden:

| | `routes/web.php` | `routes/api.php` |
|---|---|---|
| **Geeft terug** | HTML (views) | JSON |
| **URL prefix** | geen | `/api/...` |
| **Sessies** | Ja (voor `@csrf`, login) | Nee |
| **Authenticatie** | Via sessie/cookies | Via tokens (headers) |
| **Gebruikt door** | Browsers | Apps, andere backends |

Alle routes in `routes/api.php` krijgen automatisch het prefix `/api/`. Een route `/coins` wordt dus bereikbaar als `/api/coins`.

### 1.2 Project openen

Open je **cryptodashboard** project uit Hoofdstuk 3 in VS Code.

Controleer of het project werkt:
```bash
php artisan route:list
```

Je ziet alle bestaande routes, waaronder `/coins` en `/coins/refresh`.

### 1.3 Eerste API route aanmaken

Open `routes/api.php`. In een nieuw Laravel project ziet dit bestand er zo uit:

```php
<?php

use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');
```

Vervang de inhoud door:

```php
<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\CoinApiController;

Route::get('/coins', [CoinApiController::class, 'index']);
```

**Checkpoint:** De route bestaat nu. We maken de controller in de volgende opdracht.

---

## Opdracht 2: API Controller aanmaken

**Doel:** Een aparte controller voor de API aanmaken die JSON teruggeeft

### 2.1 Waarom een aparte controller?

Je hebt al een `CoinController` voor de webpagina's. We maken een **aparte** controller voor de API. Dit is een best practice: de webcontroller regelt de HTML-views, de API-controller regelt de JSON-responses. Ze hebben ander gedrag nodig.

API controllers worden in Laravel standaard in de map `app/Http/Controllers/Api/` gezet.

### 2.2 Controller aanmaken

```bash
php artisan make:controller Api/CoinApiController
```

Dit maakt het bestand `app/Http/Controllers/Api/CoinApiController.php` aan.

### 2.3 Index methode toevoegen

Open het bestand en voeg de `index` methode toe:

```php
<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Coin;

class CoinApiController extends Controller
{
    public function index()
    {
        $coins = Coin::orderBy('market_cap_rank')->get();

        return response()->json($coins);
    }
}
```

### 2.4 Uitleg: `response()->json()`

`response()->json()` is de Laravel-manier om JSON terug te geven:

```php
return response()->json($coins);
```

Laravel doet automatisch:
1. De PHP-array of Eloquent-collectie omzetten naar JSON
2. De HTTP header `Content-Type: application/json` instellen
3. De juiste HTTP statuscode meesturen (standaard 200 OK)

### 2.5 Testen in Postman

Maak in Postman een nieuw request aan:
- **Methode:** GET
- **URL:** `http://cryptodashboard.test/api/coins`

Klik op **Send**.

Je ziet een JSON array met alle coins uit je database. Als je database leeg is, zie je een lege array `[]`. Open dan eerst `http://cryptodashboard.test/coins` in je browser om de database te vullen.

**Checkpoint:** Postman geeft een JSON array terug met de coins./

**Vraag:** Wat valt je op aan de JSON die je terugkrijgt? Zijn er velden bij die je liever niet deelt met de buitenwereld (denk aan `created_at`, `updated_at`, `id`)?

---

## Opdracht 3: API Resource aanmaken

**Doel:** Bepalen welke velden de API teruggeeft met een API Resource

### 3.1 Het probleem met directe JSON

Op dit moment geef je het volledige Eloquent model terug. Dat betekent dat **alle** databasekolommen zichtbaar zijn: `id`, `created_at`, `updated_at`, `fetched_at`. Dit is niet ideaal:

- Je onthult de interne structuur van je database
- Velden als `fetched_at` zijn interne caching-details, niet relevant voor de consument
- Als je je database aanpast, verandert automatisch de API-output (breaking change)

Een **API Resource** geeft jou controle over welke velden de API teruggeeft.

### 3.2 API Resource aanmaken

```bash
php artisan make:resource CoinResource
```

Dit maakt het bestand `app/Http/Resources/CoinResource.php` aan.

### 3.3 Resource invullen

Open `app/Http/Resources/CoinResource.php` en pas de `toArray` methode aan:

```php
<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class CoinResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'rank'          => $this->market_cap_rank,
            'id'            => $this->coin_id,
            'name'          => $this->name,
            'symbol'        => strtoupper($this->symbol),
            'price_eur'     => $this->current_price,
            'change_24h'    => $this->price_change_percentage_24h,
            'market_cap'    => $this->market_cap,
            'image'         => $this->image,
        ];
    }
}
```

**Uitleg:**

| Wat we doen | Waarom |
|---|---|
| `'id' => $this->coin_id` | We hernoemen het veld: buiten heet het `id`, intern `coin_id` |
| `'price_eur' => $this->current_price` | Duidelijke naam + eenheid (`_eur`) voor de API-consument |
| `strtoupper($this->symbol)` | Altijd hoofdletters, consistent |
| `fetched_at` weglaten | Intern caching detail, niet relevant voor de consument |
| `created_at` / `updated_at` weglaten | Interne Eloquent tijdstempels |

### 3.4 Resource gebruiken in de controller

Open `app/Http/Controllers/Api/CoinApiController.php` en pas de `index` methode aan:

```php
<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\CoinResource;
use App\Models\Coin;

class CoinApiController extends Controller
{
    public function index()
    {
        $coins = Coin::orderBy('market_cap_rank')->get();

        return CoinResource::collection($coins);
    }
}
```

`CoinResource::collection()` past de Resource toe op elke coin in de collectie.

### 3.5 Testen in Postman

Stuur opnieuw een GET request naar `http://cryptodashboard.test/api/coins`.

Je ziet nu een nettere JSON-structuur:

```json
{
    "data": [
        {
            "rank": 1,
            "id": "bitcoin",
            "name": "Bitcoin",
            "symbol": "BTC",
            "price_eur": 82345.67,
            "change_24h": 2.45,
            "market_cap": 1623456789012,
            "image": "https://..."
        },
        ...
    ]
}
```

**Let op:** Laravel wikkelt de data automatisch in een `"data"` sleutel. Dit is standaard gedrag van API Resources en een veelgebruikte conventie.

**Checkpoint:** De API geeft alleen de velden terug die jij hebt gedefinieerd.

---

## Opdracht 4: Detail endpoint (`GET /api/coins/{id}`)

**Doel:** Een endpoint bouwen voor één specifieke coin

### 4.1 Route toevoegen

Voeg een tweede route toe in `routes/api.php`:

```php
Route::get('/coins', [CoinApiController::class, 'index']);
Route::get('/coins/{coin_id}', [CoinApiController::class, 'show']);
```

### 4.2 Show methode toevoegen

Voeg de `show` methode toe aan `CoinApiController`:

```php
public function show($coin_id)
{
    $coin = Coin::where('coin_id', $coin_id)->first();

    if (!$coin) {
        return response()->json([
            'error' => 'Coin niet gevonden'
        ], 404);
    }

    return new CoinResource($coin);
}
```

### 4.3 HTTP statuscodes

Bij het bouwen van een API geef je altijd de juiste HTTP statuscode mee:

| Code | Betekenis | Wanneer gebruiken |
|---|---|---|
| `200` | OK | Alles goed (standaard) |
| `201` | Created | Na een succesvolle POST |
| `400` | Bad Request | Fout in de request van de client |
| `404` | Not Found | Resource bestaat niet |
| `422` | Unprocessable Entity | Validatiefout |
| `500` | Server Error | Fout aan jouw kant |

De `404` geef je mee als tweede argument aan `response()->json()`:

```php
return response()->json(['error' => 'Coin niet gevonden'], 404);
```

### 4.4 Testen in Postman

Test twee requests:

**Bestaande coin:**
- GET `http://cryptodashboard.test/api/coins/bitcoin`
- Verwacht: 200 + JSON met Bitcoin-data

**Niet-bestaande coin:**
- GET `http://cryptodashboard.test/api/coins/bestaatniet`
- Verwacht: 404 + `{"error": "Coin niet gevonden"}`

Kijk in Postman ook naar de **Status** rechtsboven het response-paneel. Je ziet `200 OK` of `404 Not Found`.

**Checkpoint:** Het detail endpoint werkt voor bestaande en niet-bestaande coins.

---

## Opdracht 5: POST endpoint (coin toevoegen)

**Doel:** Een endpoint bouwen waarmee je via Postman een coin kunt toevoegen

### 5.1 Route toevoegen

```php
Route::get('/coins', [CoinApiController::class, 'index']);
Route::get('/coins/{coin_id}', [CoinApiController::class, 'show']);
Route::post('/coins', [CoinApiController::class, 'store']);
```

### 5.2 Store methode

Voeg de `store` methode toe aan `CoinApiController`:

```php
public function store(Request $request)
{
    $coin = Coin::create([
        'coin_id'                    => $request->input('coin_id'),
        'symbol'                     => $request->input('symbol'),
        'name'                       => $request->input('name'),
        'current_price'              => $request->input('current_price'),
        'market_cap'                 => $request->input('market_cap'),
        'market_cap_rank'            => $request->input('market_cap_rank'),
        'price_change_percentage_24h'=> $request->input('price_change_percentage_24h'),
        'fetched_at'                 => now(),
    ]);

    return response()->json(new CoinResource($coin), 201);
}
```

De `201` statuscode betekent: de resource is aangemaakt.

> **Let op:** Deze code accepteert nu alle input zonder te controleren of het klopt. In opdracht 6 voegen we validatie toe om dit veilig te maken. Sla die opdracht dus niet over!

### 5.3 Testen via Postman

Maak een nieuw request aan in Postman:

- **Methode:** POST
- **URL:** `http://cryptodashboard.test/api/coins`

Ga naar het tabblad **Body**, kies **raw** en stel het formaat in op **JSON**. Voer het volgende in:

```json
{
    "coin_id": "dogecoin",
    "symbol": "doge",
    "name": "Dogecoin",
    "current_price": 0.18,
    "market_cap": 25000000000,
    "market_cap_rank": 11,
    "price_change_percentage_24h": 1.23,
    "image": "https://assets.coingecko.com/coins/images/5/large/dogecoin.png"
}
```

Klik op **Send**.

Je krijgt een `201 Created` response terug met de nieuwe coin.

Controleer daarna in je browser via `http://cryptodashboard.test/api/coins` of Dogecoin nu in de lijst staat.

**Checkpoint:** Je kunt via Postman een nieuwe coin toevoegen aan de database.

---

## Opdracht 6: Validatie voor de API

**Doel:** Voorkomen dat ongeldige data de database in gaat

### 6.1 Het probleem zonder validatie

Wat als iemand een POST request stuurt zonder `coin_id`? Of met een negatieve prijs? Dan crasht de applicatie of sla je ongeldige data op.

Bij een webformulier stuur je de gebruiker terug naar het formulier met foutmeldingen. Bij een API stuur je een `422` response terug met JSON.

### 6.2 Validatie toevoegen aan de store methode

Zorg dat `use Illuminate\Http\Request;` bovenaan je bestand staat (bij de andere `use`-statements). Vervang daarna de `store` methode door:

```php
public function store(Request $request)
{
    $validated = $request->validate([
        'coin_id'      => 'required|string|unique:coins,coin_id',
        'symbol'       => 'required|string|max:10',
        'name'         => 'required|string|max:100',
        'current_price'=> 'required|numeric|min:0',
        'market_cap'   => 'nullable|integer|min:0',
        'market_cap_rank' => 'nullable|integer|min:1',
        'price_change_percentage_24h' => 'nullable|numeric',
    ]);

    $validated['fetched_at'] = now();

    $coin = Coin::create($validated);

    return response()->json(new CoinResource($coin), 201);
}
```

### 6.3 Hoe werkt validatie bij een API?

Bij een API request detecteert Laravel automatisch dat de request JSON verwacht (via de `Accept: application/json` header). Als de validatie mislukt, geeft Laravel automatisch een `422` response terug in JSON-formaat:

```json
{
    "message": "The coin_id field is required.",
    "errors": {
        "coin_id": [
            "The coin_id field is required."
        ],
        "current_price": [
            "The current_price field is required."
        ]
    }
}
```

Geen extra code nodig — Laravel regelt dit zelf.

### 6.4 Testen in Postman

**Test 1: Lege body sturen**
- POST `http://cryptodashboard.test/api/coins`
- Body: `{}`
- Voeg header toe: `Accept: application/json`
- Verwacht: `422 Unprocessable Content` met foutmeldingen per veld

**Test 2: Coin die al bestaat**
- POST met `coin_id: "bitcoin"` (bestaat al in je database)
- Verwacht: `422` met melding dat `coin_id` al in gebruik is

**Tip:** Voeg in Postman de header `Accept: application/json` toe. Ga naar het tabblad **Headers** en voeg toe:

| Key | Value |
|---|---|
| `Accept` | `application/json` |

Zonder deze header stuurt Laravel bij validatiefouten een HTML-redirect in plaats van JSON.

**Checkpoint:** Ongeldige requests worden afgewezen met duidelijke foutmeldingen.

---

## Opdracht 7: DELETE endpoint

**Doel:** Een coin verwijderen via de API

### 7.1 Route toevoegen

```php
Route::get('/coins', [CoinApiController::class, 'index']);
Route::get('/coins/{coin_id}', [CoinApiController::class, 'show']);
Route::post('/coins', [CoinApiController::class, 'store']);
Route::delete('/coins/{coin_id}', [CoinApiController::class, 'destroy']);
```

### 7.2 Destroy methode

Voeg toe aan `CoinApiController`:

```php
public function destroy($coin_id)
{
    $coin = Coin::where('coin_id', $coin_id)->first();

    if (!$coin) {
        return response()->json([
            'error' => 'Coin niet gevonden'
        ], 404);
    }

    $coin->delete();

    return response()->json(null, 204);
}
```

`204 No Content` is de juiste statuscode bij een geslaagde DELETE: de actie is uitgevoerd, er is geen inhoud om terug te geven.

### 7.3 Testen in Postman

- **Methode:** DELETE
- **URL:** `http://cryptodashboard.test/api/coins/dogecoin`
- Verwacht: `204 No Content` (lege response body)

Controleer daarna via GET `/api/coins` of Dogecoin weg is.

**Checkpoint:** Coins kunnen via de API worden verwijderd.

---

## Opdracht 8: `Route::apiResource` gebruiken

**Doel:** Alle routes samenvatten met één regel

### 8.1 apiResource

Laravel heeft een handige shortcut voor REST API routes. In plaats van elke route handmatig te schrijven:

```php
Route::get('/coins', [CoinApiController::class, 'index']);
Route::get('/coins/{coin_id}', [CoinApiController::class, 'show']);
Route::post('/coins', [CoinApiController::class, 'store']);
Route::delete('/coins/{coin_id}', [CoinApiController::class, 'destroy']);
```

Schrijf je:

```php
Route::apiResource('coins', CoinApiController::class);
```

Dit genereert automatisch de volgende routes:

| Methode | URL | Controller methode | Naam |
|---|---|---|---|
| GET | `/api/coins` | `index` | `coins.index` |
| POST | `/api/coins` | `store` | `coins.store` |
| GET | `/api/coins/{coin}` | `show` | `coins.show` |
| PUT/PATCH | `/api/coins/{coin}` | `update` | `coins.update` |
| DELETE | `/api/coins/{coin}` | `destroy` | `coins.destroy` |

### 8.2 Routes aanpassen

Vervang de losse routes in `routes/api.php` door:

```php
<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\CoinApiController;

Route::apiResource('coins', CoinApiController::class);
```

### 8.3 Controleren

Voer uit in de terminal:

```bash
php artisan route:list --path=api
```

Je ziet alle API routes overzichtelijk weergegeven.

**Let op:** `apiResource` gebruikt `{coin}` als parameter (de naam van het model). Je `show` en `destroy` methodes gebruiken nu `$coin` als parameter in plaats van `$coin_id`. Pas dit aan:

```php
public function show($coin)
{
    $record = Coin::where('coin_id', $coin)->first();

    if (!$record) {
        return response()->json(['error' => 'Coin niet gevonden'], 404);
    }

    return new CoinResource($record);
}

public function destroy($coin)
{
    $record = Coin::where('coin_id', $coin)->first();

    if (!$record) {
        return response()->json(['error' => 'Coin niet gevonden'], 404);
    }

    $record->delete();

    return response()->json(null, 204);
}
```

**Checkpoint:** Alle routes werken nog steeds. De code is nu compacter en consistenter.

---

## Opdracht 9: API documenteren met commentaar

**Doel:** De API begrijpelijk maken voor anderen

Een API zonder documentatie is onbruikbaar. In een professionele omgeving gebruik je tools zoals Swagger of Postman Collections. Voor nu documenteren we de API direct in de controller als commentaar.

Open `app/Http/Controllers/Api/CoinApiController.php` en voeg commentaar toe:

```php
<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\CoinResource;
use App\Models\Coin;
use Illuminate\Http\Request;

/**
 * Crypto Dashboard API
 *
 * Base URL: /api
 *
 * Endpoints:
 *   GET    /coins          - Lijst van alle coins (gesorteerd op rank)
 *   GET    /coins/{id}     - Details van één coin (bijv. /coins/bitcoin)
 *   POST   /coins          - Nieuwe coin toevoegen (JSON body vereist)
 *   DELETE /coins/{id}     - Coin verwijderen
 *
 * Alle responses zijn JSON.
 * Voeg de header "Accept: application/json" toe aan elk request.
 */
class CoinApiController extends Controller
{
    // ... methodes
}
```

Exporteer ook je Postman requests als **Collection** zodat je ze kunt delen:
1. Klik in Postman op **Collections** (linkerpaneel)
2. Maak een nieuwe Collection aan: "Crypto Dashboard API"
3. Voeg al je requests toe aan deze collection
4. Klik op de drie puntjes → **Export** → sla op als `CoinAPI.postman_collection.json`

**Checkpoint:** De API is gedocumenteerd en de Postman collection is geëxporteerd.

---

## Bonusopdracht A: API beveiligen met een token

Voeg een eenvoudige tokenbeveiliging toe zodat niet iedereen willekeurig data kan toevoegen of verwijderen.

### Stap 1: Token instellen in `.env`

Voeg toe aan je `.env` bestand:

```
API_TOKEN=mijn_geheime_sleutel_123
```

### Stap 2: Middleware aanmaken

```bash
php artisan make:middleware CheckApiToken
```

Open `app/Http/Middleware/CheckApiToken.php`:

```php
<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class CheckApiToken
{
    public function handle(Request $request, Closure $next)
    {
        $token = $request->header('X-API-Token');

        if ($token !== config('app.api_token')) {
            return response()->json(['error' => 'Ongeldig of ontbrekend token'], 401);
        }

        return $next($request);
    }
}
```

### Stap 3: Token beschikbaar maken via config

Voeg toe aan `config/app.php` (in het `return` array):

```php
'api_token' => env('API_TOKEN'),
```

### Stap 3b: Middleware registreren (Laravel 11)

In Laravel 11 moet je middlewares zelf registreren in `bootstrap/app.php`. Voeg toe aan de `withMiddleware` sectie:

```php
->withMiddleware(function (Middleware $middleware) {
    $middleware->alias([
        'check.api.token' => \App\Http\Middleware\CheckApiToken::class,
    ]);
})
```

### Stap 4: Middleware toepassen op schrijfroutes

In `routes/api.php`:

```php
Route::get('/coins', [CoinApiController::class, 'index']);
Route::get('/coins/{coin}', [CoinApiController::class, 'show']);

Route::middleware('check.api.token')->group(function () {
    Route::post('/coins', [CoinApiController::class, 'store']);
    Route::delete('/coins/{coin}', [CoinApiController::class, 'destroy']);
});
```

Nu zijn GET requests vrij toegankelijk, maar POST en DELETE vereisen de token.

### Stap 5: Testen in Postman

Voeg bij een POST request de header toe:

| Key | Value |
|---|---|
| `X-API-Token` | `mijn_geheime_sleutel_123` |

Zonder de juiste token krijg je een `401 Unauthorized`.

---

## Bonusopdracht B: Fetch API gebruiken in de view

Je eigen API kun je ook aanroepen vanuit JavaScript in je eigen views. Verwijder de `@foreach` uit de Blade view en laad de coins dynamisch via `fetch()`:

```html
<div id="coins-container">
    <p>Laden...</p>
</div>

<script>
    fetch('/api/coins')
        .then(response => response.json())
        .then(json => {
            const coins = json.data;
            let html = '<table>...';

            coins.forEach(coin => {
                html += `<tr>
                    <td>${coin.rank}</td>
                    <td>${coin.name}</td>
                    <td>€${coin.price_eur}</td>
                </tr>`;
            });

            html += '</table>';
            document.getElementById('coins-container').innerHTML = html;
        });
</script>
```

Dit is hoe moderne webapplicaties werken: de backend levert een API, de frontend haalt de data op via JavaScript.

---

## Samenvatting

In dit hoofdstuk heb je geleerd hoe je zelf een REST API bouwt in Laravel.

| Concept | Wat je hebt geleerd |
|---|---|
| **`routes/api.php`** | Aparte routebestand voor API endpoints, automatisch prefix `/api/` |
| **`response()->json()`** | JSON teruggeven met de juiste statuscode |
| **API Resource** | Controle over welke velden de API teruggeeft |
| **HTTP statuscodes** | 200, 201, 204, 404, 422 op de juiste momenten gebruiken |
| **POST endpoint** | Data ontvangen via de request body |
| **Validatie** | Ongeldige data afwijzen met automatische JSON foutmeldingen |
| **DELETE endpoint** | Resources verwijderen via de API |
| **`Route::apiResource`** | Alle REST routes in één regel samenvatten |
| **API token** | Schrijfoperaties beveiligen met een token in de header |

**Het verschil tussen een webapplicatie en een API:**

| | Webapplicatie | REST API |
|---|---|---|
| **Geeft terug** | HTML (voor browsers) | JSON (voor applicaties) |
| **Routes** | `routes/web.php` | `routes/api.php` |
| **Authenticatie** | Sessie + cookies | Token in header |
| **Foutafhandeling** | Redirect naar formulier | JSON met statuscode |
| **Consument** | Browser van een gebruiker | App, ander systeem, JavaScript |

Je hebt nu zowel geleerd hoe je een API **consumeert** (Hoofdstuk 1-4) als hoe je er een **bouwt** (dit hoofdstuk). Dit is de complete cyclus van API-ontwikkeling.
