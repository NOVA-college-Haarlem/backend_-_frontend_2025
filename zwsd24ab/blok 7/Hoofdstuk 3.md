# Hoofdstuk 3 - API Caching: Crypto Dashboard

## Introductie

In de vorige hoofdstukken heb je geleerd hoe je data ophaalt van een externe API en deze direct toont op je website. Maar wat als je pagina 100 bezoekers per uur heeft? Dan doe je 100 API calls per uur - terwijl de data misschien maar elke 10 minuten verandert.

**Caching** betekent: data ophalen van een API en opslaan in je eigen database. Als een bezoeker je pagina opent, kijk je eerst in je eigen database. Alleen als de data "verlopen" is (te oud), haal je nieuwe data op van de API.

**Waarom cachen?**
- **Snelheid**: je eigen database is sneller dan een API call over het internet
- **Rate limits**: veel API's beperken het aantal requests dat je mag doen (bijvoorbeeld 30 per minuut)
- **Betrouwbaarheid**: als de API even down is, heb je nog steeds data om te tonen
- **Kosten**: sommige API's rekenen kosten per request

**Wat gaan we bouwen?**

Een Crypto Dashboard dat de top 10 cryptomunten toont (Bitcoin, Ethereum, etc.) met actuele prijzen. We gebruiken de **CoinGecko API** - een gratis API die geen API key nodig heeft.

De data wordt opgeslagen in onze eigen database en alleen ververst als deze ouder is dan 10 minuten.

---

## Opdracht 1: CoinGecko API verkennen

**Doel:** De API leren kennen via Postman

### 1.1 Ping test

Open Postman en test of de API bereikbaar is. Maak een GET request naar:

```
https://api.coingecko.com/api/v3/ping
```

Je krijgt als response:

```json
{
    "gecko_says": "(V3) To the Moon!"
}
```

Dit bevestigt dat de API werkt.

### 1.2 Top 10 cryptomunten ophalen

Maak een GET request naar:

```
https://api.coingecko.com/api/v3/coins/markets?vs_currency=eur&order=market_cap_desc&per_page=10&page=1
```

Bekijk de response. Je krijgt een array met 10 objecten. Elk object bevat informatie over een cryptomunt:

```json
[
    {
        "id": "bitcoin",
        "symbol": "btc",
        "name": "Bitcoin",
        "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png",
        "current_price": 82345.67,
        "market_cap": 1623456789012,
        "market_cap_rank": 1,
        "price_change_percentage_24h": 2.45,
        "last_updated": "2025-01-29T12:00:00.000Z"
    },
    {
        "id": "ethereum",
        "symbol": "eth",
        "name": "Ethereum",
        ...
    }
]
```

**Lees de response goed door.** Welke velden zijn er? Welke gaan we gebruiken?

### 1.3 Query parameters begrijpen

De URL bevat query parameters. Dit zijn de instellingen voor de API:

| Parameter | Waarde | Betekenis |
|-----------|--------|-----------|
| `vs_currency` | `eur` | Prijzen in euro's |
| `order` | `market_cap_desc` | Gesorteerd op marktkapitalisatie (hoogste eerst) |
| `per_page` | `10` | 10 resultaten per pagina |
| `page` | `1` | Eerste pagina |

**Opdracht:** Pas de parameters aan in Postman. Wat gebeurt er als je `per_page=5` gebruikt? Of `vs_currency=usd`?

---

## Opdracht 2: Laravel project opzetten

**Doel:** Nieuw project aanmaken

### 2.1 Project aanmaken

1. Open Laravel Herd. Ga naar Sites en klik op Add.
2. Kies "No starter kit".
3. Geef project name "cryptodashboard".
4. Check het vinkje bij "Initialize a git repository". Maak het project aan.
5. Open het project in VS Code.
6. Ga naar http://cryptodashboard.test om te controleren of het project werkt.

**Verwacht resultaat:** Je ziet de Laravel welkomstpagina.

### 2.2 GitHub repository

1. Ga naar github.com en klik op "New".
2. Vul bij "repository name" de projectnaam "cryptodashboard" in en klik op "Create repository".
3. Kopieer de instructies bij "…or push an existing repository from the command line". Open de Terminal (Ctrl+J) in je VS Code-project en voer de instructies uit.
4. Ververs de pagina op github.com. De code moet nu zichtbaar zijn.

### 2.3 Database configuratie

Controleer de databaseconfiguratie in je `.env` bestand. Standaard gebruikt Laravel Herd SQLite:

```
DB_CONNECTION=sqlite
```

Dit is voldoende voor ons project.

---

## Opdracht 3: Database opzetten

**Doel:** Model en migration aanmaken voor de coins tabel

### 3.1 Model en migration genereren

Open de terminal in VS Code en voer uit:

```bash
php artisan make:model Coin -m
```

Dit maakt twee bestanden aan:
- `app/Models/Coin.php` - het model
- `database/migrations/xxxx_xx_xx_create_coins_table.php` - de migration

### 3.2 Migration invullen

Open het migration bestand in `database/migrations/` (het bestand dat eindigt op `_create_coins_table.php`).

Vervang de `up` methode:

```php
public function up(): void
{
    Schema::create('coins', function (Blueprint $table) {
        $table->id();
        $table->string('coin_id')->unique();
        $table->string('symbol');
        $table->string('name');
        $table->string('image')->nullable();
        $table->decimal('current_price', 16, 2);
        $table->bigInteger('market_cap')->nullable();
        $table->integer('market_cap_rank')->nullable();
        $table->decimal('price_change_percentage_24h', 8, 2)->nullable();
        $table->timestamp('fetched_at');
        $table->timestamps();
    });
}
```

**Uitleg van de kolommen:**

| Kolom | Type | Waarom |
|-------|------|--------|
| `coin_id` | string, unique | Unieke naam van de coin ("bitcoin", "ethereum") |
| `symbol` | string | Afkorting ("btc", "eth") |
| `name` | string | Volledige naam ("Bitcoin") |
| `image` | string, nullable | URL naar het logo |
| `current_price` | decimal(16,2) | Prijs in euro's |
| `market_cap` | bigInteger | Totale marktwaarde (kan miljarden zijn!) |
| `market_cap_rank` | integer | Positie in de ranking |
| `price_change_percentage_24h` | decimal(8,2) | Prijsverandering afgelopen 24 uur in % |
| `fetched_at` | timestamp | Wanneer we deze data voor het laatst hebben opgehaald |

Het veld `fetched_at` is essentieel voor onze cache-logica. Hiermee bepalen we of de data "verlopen" is.

### 3.3 Model invullen

Open `app/Models/Coin.php` en voeg de `$fillable` property toe:

```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Coin extends Model
{
    protected $fillable = [
        'coin_id',
        'symbol',
        'name',
        'image',
        'current_price',
        'market_cap',
        'market_cap_rank',
        'price_change_percentage_24h',
        'fetched_at',
    ];
}
```

De `$fillable` array geeft aan welke kolommen we mogen vullen via mass assignment. Dit ken je al uit blok 6.

### 3.4 Migration uitvoeren

Voer de migration uit:

```bash
php artisan migrate
```

**Checkpoint:** Je ziet "Running migrations" en de coins tabel is aangemaakt.

---

## Opdracht 4: CoinGeckoService aanmaken

**Doel:** Een service die de CoinGecko API aanroept

### 4.1 Service bestand aanmaken

Maak de map `app/Services` aan (als deze nog niet bestaat). Maak daarin het bestand `CoinGeckoService.php`:

```php
<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;

class CoinGeckoService
{
    protected $baseUrl = 'https://api.coingecko.com/api/v3/';

    public function getTopCoins($perPage = 10)
    {
        $response = Http::get($this->baseUrl . 'coins/markets', [
            'vs_currency' => 'eur',
            'order' => 'market_cap_desc',
            'per_page' => $perPage,
            'page' => 1,
        ]);

        if ($response->failed()) {
            return [];
        }

        return $response->json();
    }
}
```

**Uitleg:**
- `Http::get()` is Laravel's HTTP client. Dit ken je al uit Hoofdstuk 2.
- De query parameters zijn dezelfde als in Postman.
- Bij een fout geven we een lege array terug.

**Checkpoint:** Dit bestand hoef je nog niet te testen. Dat doen we in de volgende opdracht.

---

## Opdracht 5: Controller en routes

**Doel:** Data ophalen van de API, opslaan in de database en tonen in een view

### 5.1 Controller aanmaken

```bash
php artisan make:controller CoinController
```

### 5.2 Controller code

Open `app/Http/Controllers/CoinController.php` en vul in:

```php
<?php

namespace App\Http\Controllers;

use App\Models\Coin;
use App\Services\CoinGeckoService;

class CoinController extends Controller
{
    public function index()
    {
        $service = new CoinGeckoService();
        $apiCoins = $service->getTopCoins();

        foreach ($apiCoins as $apiCoin) {
            Coin::updateOrCreate(
                ['coin_id' => $apiCoin['id']],
                [
                    'symbol' => $apiCoin['symbol'],
                    'name' => $apiCoin['name'],
                    'image' => $apiCoin['image'],
                    'current_price' => $apiCoin['current_price'],
                    'market_cap' => $apiCoin['market_cap'],
                    'market_cap_rank' => $apiCoin['market_cap_rank'],
                    'price_change_percentage_24h' => $apiCoin['price_change_percentage_24h'],
                    'fetched_at' => now(),
                ]
            );
        }

        $coins = Coin::orderBy('market_cap_rank')->get();
        return view('coins.index', compact('coins'));
    }
}
```

### 5.3 Wat doet `updateOrCreate`?

Dit is een nieuwe Eloquent methode. Zo werkt het:

```php
Coin::updateOrCreate(
    ['coin_id' => 'bitcoin'],      // Zoek een coin met dit coin_id
    ['current_price' => 85000, ...] // Update deze velden (of maak nieuw aan)
);
```

1. Laravel zoekt een record waar `coin_id = 'bitcoin'`
2. **Gevonden?** → De bestaande rij wordt bijgewerkt met de nieuwe prijzen
3. **Niet gevonden?** → Er wordt een nieuw record aangemaakt

Dit is perfect voor ons: de eerste keer worden alle coins aangemaakt. Daarna worden ze bijgewerkt met nieuwe prijzen.

### 5.4 Route toevoegen

Open `routes/web.php` en voeg toe:

```php
use App\Http\Controllers\CoinController;

Route::get('/coins', [CoinController::class, 'index']);
```

**Checkpoint:** Ga naar http://cryptodashboard.test/coins. Je krijgt een foutmelding dat de view niet bestaat - dat klopt, die maken we in de volgende opdracht.

---

## Opdracht 6: View bouwen

**Doel:** De coins tonen in een overzichtelijke tabel

### 6.1 View aanmaken

Maak de map `resources/views/coins` aan. Maak daarin het bestand `index.blade.php`:

```html
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crypto Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
            background-color: #1a1a2e;
            color: #e0e0e0;
        }
        h1 {
            color: #f5c542;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #333;
        }
        th {
            background-color: #16213e;
            color: #f5c542;
        }
        tr:hover {
            background-color: #16213e;
        }
        .coin-info {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .coin-info img {
            width: 28px;
            height: 28px;
        }
        .coin-symbol {
            color: #888;
            font-size: 0.85em;
        }
        .positive {
            color: #00c853;
        }
        .negative {
            color: #ff1744;
        }
    </style>
</head>
<body>
    <h1>Crypto Dashboard</h1>

    <table>
        <thead>
            <tr>
                <th>#</th>
                <th>Coin</th>
                <th>Prijs</th>
                <th>24u %</th>
                <th>Marktkapitalisatie</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($coins as $coin)
                <tr>
                    <td>{{ $coin->market_cap_rank }}</td>
                    <td>
                        <div class="coin-info">
                            <img src="{{ $coin->image }}" alt="{{ $coin->name }}">
                            <span>{{ $coin->name }}</span>
                            <span class="coin-symbol">{{ strtoupper($coin->symbol) }}</span>
                        </div>
                    </td>
                    <td>&euro;{{ number_format($coin->current_price, 2, ',', '.') }}</td>
                    <td class="{{ $coin->price_change_percentage_24h >= 0 ? 'positive' : 'negative' }}">
                        {{ number_format($coin->price_change_percentage_24h, 2, ',', '.') }}%
                    </td>
                    <td>&euro;{{ number_format($coin->market_cap, 0, ',', '.') }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
</body>
</html>
```

### 6.2 Blade uitleg

Een paar dingen om op te letten:

- `number_format($coin->current_price, 2, ',', '.')` → formatteert het getal naar Europese notatie: `82.345,67`
- `strtoupper($coin->symbol)` → maakt de letters hoofdletters: `btc` wordt `BTC`
- De class `positive` of `negative` wordt dynamisch gekozen op basis van of de prijsverandering positief of negatief is

**Checkpoint:** Ga naar http://cryptodashboard.test/coins. Je ziet een tabel met de top 10 cryptomunten inclusief prijzen en logo's.

**Let op:** Elke keer als je de pagina ververst, wordt de API opnieuw aangeroepen. Dit is nog geen caching! Dat lossen we op in de volgende opdracht.

---
