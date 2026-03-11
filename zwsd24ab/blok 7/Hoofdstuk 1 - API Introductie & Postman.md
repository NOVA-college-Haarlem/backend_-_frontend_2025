# Hoofdstuk 1

## API

In dit blok gaan we leren om met API's te werken. API's zijn applicatie programming interfaces. API's zijn een manier om applicaties te communiceren met elkaar. Eigenlijk zijn het andermans databases (bronnen) waar je data uit kunt halen. Soms kun je ook data aan deze databases toevoegen. Een CRUD op afstand als het ware.

Er zijn veel open source API's die je kunt gebruiken. Deze API's zijn gratis en openbaar beschikbaar. Je kunt deze API's gebruiken in je eigen applicaties.

## API key

Om API's te gebruiken heb je een API key nodig. API keys zijn unieke codes die je kunt gebruiken om toegang te krijgen tot de API. Je kunt deze API keys vinden op de website van de API provider. 

## Postman

Postman is een programma dat je kunt gebruiken om API's te testen. Je kunt deze API's gebruiken in je eigen applicaties.


## Opdracht 1.

1. Installeer het programma van Postman: https://www.postman.com/downloads/
2. Registreer je als student en open het programma.


## Opdracht 2. 

Wij gaan de API van de OpenWeatherMap gebruiken. Deze API geeft de weerberichten van verschillende steden terug. Je krijgt van je docent een unieke API key. Deze dien je in te vullen in de request.

De documentatie van de OpenWeatherMap API is te vinden op https://openweathermap.org/api

In de documentatie staat hoe je de API kunt gebruiken. Je kunt de API krijgen door een GET request te sturen naar de API URL.

Een voorbeeld van een request is:
https://api.openweathermap.org/data/2.5/forecast?q={city name}&appid={YOUR_API_KEY}

De API key is: YOUR_API_KEY

Als we de variabelen invullen krijgen we:
https://api.openweathermap.org/data/2.5/forecast?q=Beverwijk&appid={YOUR_API_KEY}

De API key krijg je van je docent.

Als alles goed is gegaan zie je de volgende response (JSON):

```json
{
    "cod": "200",
    "message": 0,
    "cnt": 40,
    "list": [
        {
            "dt": 1738108800,
            "main": {
                "temp": 273.63,
                "feels_like": 270.12,
                "temp_min": 273.4,
                "temp_max": 273.63,
                "pressure": 1000,
                "sea_level": 1000,
                "grnd_level": 1001,
                "humidity": 70,
                "temp_kf": 0.23
```

De temperatuur is in Kelvin. We moeten deze omrekenen naar Celsius. Om dit om te rekenen gebruiken we de volgende formule:
C = K - 273.15

Deze formule gebruiken we om de temperatuur in Celsius te berekenen.

De temperatuur in Celsius is:
273.63 - 273.15 = 0.48

De `dt` is de tijd in Unix timestamp (aantal seconden sinds 1-1-1970). In PHP kun je dit direct omzetten naar een leesbare datum met de `date()` functie.

Voorbeeld met `date()`:

```php
$dt = 1738108800;
echo date('Y-m-d H:i:s', $dt); // 2025-01-29 12:00:00
```

Zo zie je dat je een database dat door een ander beheerd wordt,kunt gebruiken. Je kunt de data uit deze database halen en in je eigen applicatie gebruiken.

Met Postman kunnen we de API testen. We kunnen de API key invullen en de API URL invullen. We kunnen de request testen en de response bekijken.

## Opdracht 3 - Laravel

We maken een nieuwe Laravel applicatie aan om de API van de OpenWeatherMap te gebruiken en de temperatuur van vandaag te tonen op je site.

### 3.1 Aanmaken nieuwe Laravelapplicatie

1. Open Laravel Herd. Ga naar Sites en klik op Add.
2. Kies "No starter kit".
3. Geef project name "Weerapp".
4. Check het vinkje bij "Initialize a git repository". Maak het project aan.
5. Open het project in VS Code.

### 3.2 Project aanmaken op Github.

1. Ga naar github.com en klik op "New".
2. Vul bij "repository name" de projectnaam "weerapp" in en klik op "Create repository".
3. Kopieer de instructies bij "…or push an existing repository from the command line". Open de Terminal (Ctrl+J) in je VS Code-project. Controleer of de terminal op het juiste pad van je project staat en voer de instructies uit.
4. Ververs de pagina op github.com. De code van het weerapp-project moet nu zichtbaar zijn.

### 3.3. Maak de Laravel-service aan

In Laravel hebben daarvoor een service nodig. Maak een nieuw service aan genaamed `WeatherService.php` in de folder `app/Services`.

In dit bestand voeg je de volgende code toe:

```php
<?php

namespace App\Services;

class WeatherService
{
    protected $apiKey;
    protected $baseUrl = 'https://api.openweathermap.org/data/2.5/';

    public function __construct()
    {
        $this->apiKey = config('services.weather.api_key');
    }

    public function getCurrentWeather($city)
    {
        $url = $this->baseUrl . 'weather?q=' . urlencode($city) . '&appid=' . $this->apiKey;
        $response = file_get_contents($url);
        $data = json_decode($response, true);
        return [
            'location' => $data['name'],
            'temperature' => round($data['main']['temp'] - 273.15, 2), // Convert from Kelvin to Celsius
            'condition' => $data['weather'][0]['description'],
        ];
    }
}
```

Deze code zorgt ervoor dat je de API van de OpenWeatherMap kunt gebruiken.

Nu moet je nog twee configuraties aanpassen in de `config/services.php` file.

```php
<?php

return [
    'weather' => [
        'api_key' => env('WEATHER_API_KEY'),
    ],
];
```

En ook in de .env file moet je de API key toevoegen:
```
WEATHER_API_KEY=YOUR_API_KEY
```

### 3.4 Gebruik de WeatherService

Nu kunnen we de WeatherService gebruiken in onze controller.

Je mag zelf kiezen welke controller je gebruikt. Als je bijvoorbeeld in de PostController de weather wilt tonen, dan voeg je de volgende code toe:

```php
<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use App\Services\WeatherService;

class PostController extends Controller
{
    public function index()
    {
        $weatherService = new WeatherService();
        $weather = $weatherService->getCurrentWeather('Beverwijk');
        return view('posts.index', compact('weather'));
    }
}
```

Deze code zorgt ervoor dat je de API van de OpenWeatherMap kunt gebruiken.
