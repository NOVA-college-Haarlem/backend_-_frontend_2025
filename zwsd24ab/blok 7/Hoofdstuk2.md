# Les: Werken met API's in Laravel


## Opdracht 1: Config opzetten
Heb je in de vorige les een API key gekregen? En heb je deze al toegevoegd aan je config? Zo nee, volg de stappen hieronder.

**Doel:** API key veilig opslaan

**Stappen:**

Voeg toe aan je `.env` bestand (of controleer of je dit al hebt van Hoofdstuk 1):

```
WEATHER_API_KEY=jouw_key_hier
```

Voeg toe aan `config/services.php` (of controleer of je dit al hebt van Hoofdstuk 1):

```php
'weather' => [
    'api_key' => env('WEATHER_API_KEY'),
],
```

**Checkpoint:** Studenten kunnen `config('services.weather.api_key')` testen met tinker.

---

## Opdracht 2: Basis route en controller

**Doel:** Controller aanmaken en view tonen

**Stappen:**

Maak controller:

```bash
php artisan make:controller MapController
```

Voeg route toe in `routes/web.php`:

```php
use App\Http\Controllers\MapController;

Route::get('/map', [MapController::class, 'index']);
```

Maak de index method:

```php
public function index()
{
    return view('map');
}
```

Maak `resources/views/map.blade.php`:

```html
<!DOCTYPE html>
<html>
<head>
    <title>Weer Kaart</title>
</head>
<body>
    <h1>Weer Kaart</h1>
    <p>De kaart komt hier...</p>
</body>
</html>
```

**Checkpoint:** Bezoek `/map` en zie de pagina.

---

## Opdracht 3: Leaflet kaart toevoegen

**Doel:** Een werkende kaart in de browser

**Stappen:**

Vervang de inhoud van `map.blade.php`:

```html
<!DOCTYPE html>
<html>
<head>
    <title>Weer Kaart</title>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
    <style>
        #map { height: 500px; width: 100%; }
    </style>
</head>
<body>
    <h1>Weer Kaart</h1>
    <div id="map"></div>

    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
    <script>
        const map = L.map('map').setView([52.1, 5.1], 7);

        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '© OpenStreetMap'
        }).addTo(map);
    </script>
</body>
</html>
```

**Checkpoint:** Je ziet een kaart van Nederland.

**Bonusvraag:** Wat doet `setView([52.1, 5.1], 7)`?

---

## Opdracht 4: API route voor weer ophalen

**Doel:** Backend endpoint maken die weer data ophaalt

**Stappen:**

Voeg route toe:

```php
Route::get('/api/weather/{city}', [MapController::class, 'getWeather']);
```

Voeg method toe aan MapController:

```php
use Illuminate\Support\Facades\Http;

public function getWeather($city)
{
    $response = Http::get('https://api.openweathermap.org/data/2.5/weather', [
        'q' => $city,
        'units' => 'metric',
        'lang' => 'nl',
        'appid' => config('services.weather.api_key'),
    ]);

    return $response->json();
}
```

**Checkpoint:** Bezoek `/api/weather/Amsterdam` in je browser. Je ziet JSON data.

**Vraag:** Welke informatie zie je allemaal in de response?

---

## Opdracht 5: Zoekfunctie bouwen

**Doel:** Stad zoeken en op kaart tonen

**Stappen:**

Update `map.blade.php` - voeg zoekbalk toe boven de kaart:

```html
<div style="padding: 20px;">
    <input type="text" id="city" placeholder="Voer een stad in...">
    <button onclick="searchCity()">Zoeken</button>
</div>
```

Voeg JavaScript toe (onder de bestaande script):

```javascript
let marker = null;

async function searchCity() {
    const city = document.getElementById('city').value;

    const response = await fetch(`/api/weather/${city}`);
    const data = await response.json();

    console.log(data); // Bekijk in DevTools

    // Verwijder oude marker
    if (marker) {
        map.removeLayer(marker);
    }

    // Nieuwe marker plaatsen
    marker = L.marker([data.coord.lat, data.coord.lon]).addTo(map);
    marker.bindPopup(`<strong>${data.name}</strong>`).openPopup();

    // Zoom naar locatie
    map.setView([data.coord.lat, data.coord.lon], 10);
}
```

**Checkpoint:** Zoek een stad, marker verschijnt op de kaart.

Houd er rekening mee dat bij steden als  "New York" de URL een spatie vevat en dus wij nog een klein stukje JS code moeten toevoegen om de spatie te vervangen. Zoek uit wat je moet doen!

---

## Opdracht 6: Weer info in popup

**Doel:** Meer informatie tonen in de popup

**Stappen:**

Pas de popup content aan:

```javascript
const popupContent = `
    <strong>${data.name}</strong><br>
    ${data.weather[0].description}<br>
    🌡️ Temperatuur: ${Math.round(data.main.temp)}°C<br>
    💧 Luchtvochtigheid: ${data.main.humidity}%<br>
    💨 Wind: ${data.wind.speed} m/s
`;

marker.bindPopup(popupContent).openPopup();
```

**Checkpoint:** Popup toont nu alle weer informatie.

**Bonusopdracht:** Voeg ook `data.main.feels_like` (gevoelstemperatuur) toe.

---

## Opdracht 7: Error handling

**Doel:** Netjes omgaan met fouten

**Stappen:**

Update de controller.
Voeg alleen de validatie en de error-check toe. De rest van je searchCity() functie (marker, popup, enz.) blijft ongewijzigd.

```php
public function getWeather($city)
{
    $response = Http::get('https://api.openweathermap.org/data/2.5/weather', [
        'q' => $city,
        'units' => 'metric',
        'lang' => 'nl',
        'appid' => config('services.weather.api_key'),
    ]);

    if ($response->failed()) {
        return response()->json([
            'error' => 'Stad niet gevonden'
        ], 404);
    }

    return $response->json();
}
```

Update JavaScript:

```javascript
async function searchCity() {
    const city = document.getElementById('city').value;

    if (!city) {
        alert('Vul een stad in');
        return;
    }

    const response = await fetch(`/api/weather/${city}`);
    const data = await response.json();

    if (data.error) {
        alert(data.error);
        return;
    }

    // ... rest van de code
}
```

**Checkpoint:** Zoek op "asdfgh" - je krijgt een nette foutmelding.

---

## Opdracht 8: Tweede API - 5-daagse voorspelling

**Doel:** Extra API call toevoegen

**Stappen:**

Voeg nieuwe route toe:

```php
Route::get('/api/forecast/{city}', [MapController::class, 'getForecast']);
```

Voeg method toe:

```php
public function getForecast($city)
{
    $response = Http::get('https://api.openweathermap.org/data/2.5/forecast', [
        'q' => $city,
        'units' => 'metric',
        'lang' => 'nl',
        'cnt' => 8, // 24 uur (elke 3 uur)
        'appid' => config('services.weather.api_key'),
    ]);

    if ($response->failed()) {
        return response()->json(['error' => 'Stad niet gevonden'], 404);
    }

    return $response->json();
}
```

**Checkpoint:** Bezoek `/api/forecast/Amsterdam` - je ziet een list array met voorspellingen.

---

## Opdracht 9: Forecast weergeven

**Doel:** Voorspelling tonen onder de kaart

**Stappen:**

Voeg div toe aan HTML (onder de kaart):

```html
<div id="forecast" style="padding: 20px;"></div>
```

Maak nieuwe functie en roep aan na searchCity:

```javascript
async function loadForecast(city) {
    const response = await fetch(`/api/forecast/${city}`);
    const data = await response.json();

    if (data.error) return;

    let html = '<h3>Voorspelling komende 24 uur</h3><div style="display: flex; gap: 10px;">';

    data.list.forEach(item => {
        const time = new Date(item.dt * 1000).toLocaleTimeString('nl-NL', {
            hour: '2-digit',
            minute: '2-digit'
        });

        html += `
            <div style="border: 1px solid #ccc; padding: 10px; text-align: center;">
                <strong>${time}</strong><br>
                ${Math.round(item.main.temp)}°C<br>
                ${item.weather[0].description}
            </div>
        `;
    });

    html += '</div>';
    document.getElementById('forecast').innerHTML = html;
}
```

Roep aan in `searchCity()` (aan het einde):

```javascript
loadForecast(city);
```

**Checkpoint:** Na zoeken zie je een rij met voorspellingen.

---

## Bonusopdracht 10: Tweede API toevoegen

Kies één van deze opties:

**Optie A: REST Countries (geen key nodig)**  
Toon landinformatie bij de stad. De country code haal je uit `data.sys.country` van de weather response.

```php
// Route
Route::get('/api/country/{code}', [MapController::class, 'getCountry']);

// Method
public function getCountry($code)
{
    $response = Http::get("https://restcountries.com/v3.1/alpha/{$code}");
    return $response->json();
}
```

**Optie B: Unsplash (key nodig)**  
Toon een foto van de stad.

**Optie C: Air Pollution (zelfde API key)**  
Toon luchtkwaliteit. De lat/lon haal je uit `data.coord.lat` en `data.coord.lon` van de weather response.

```php
Route::get('/api/pollution/{lat}/{lon}', [MapController::class, 'getPollution']);

public function getPollution($lat, $lon)
{
    $response = Http::get('https://api.openweathermap.org/data/2.5/air_pollution', [
        'lat' => $lat,
        'lon' => $lon,
        'appid' => config('services.weather.api_key'),
    ]);

    return $response->json();
}
```
