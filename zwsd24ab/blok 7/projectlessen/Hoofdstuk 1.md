# Hoofdstuk 1

## API

In dit blok gaan we leren om met API's te werken. API's zijn applicatie programming interfaces. API's zijn een manier om applicaties te communiceren met elkaar. Eigenlijk zijn het andermans databases (bronnen) waar je data uit kunt halen. Soms kun je ook data aan deze databases toevoegen. Een CRUD op afstand als het ware.

Er zijn veel open source API's die je kunt gebruiken. Deze API's zijn gratis en openbaar beschikbaar. Je kunt deze API's gebruiken in je eigen applicaties.

## API key

Om API's te gebruiken heb je een API key nodig. API keys zijn unieke codes die je kunt gebruiken om toegang te krijgen tot de API. Je kunt deze API keys vinden op de website van de API provider. 

## Postman

Postman is een programma dat je kunt gebruiken om API's te testen. Je kunt deze API's gebruiken in je eigen applicaties.


## Opdracht 1.

1. Installeer het programma van Postman.
2. Open het programma.


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

De `dt` is de tijd in Unix timestamp. We moeten deze omrekenen naar een datum. Om dit om te rekenen gebruiken we de volgende formule:
datum = Unix timestamp * 1000

De datum is:
1738108800 * 1000 = 2025-01-29 12:00:00

Zo zie je dat je een database dat door een ander beheerd wordt,kunt gebruiken. Je kunt de data uit deze database halen en in je eigen applicatie gebruiken.

Met Postman kunnen we de API testen. We kunnen de API key invullen en de API URL invullen. We kunnen de request testen en de response bekijken.

## Opdracht 3.

Gebruik je huidige applicatie en probeer eens de API van de OpenWeatherMap te gebruiken door het temperatuur van vandaag te tonen op je site.

In PHP hebben daarvoor een apart bestand nodig. Maak een nieuw bestand aan genaamd `weather.php`.

In dit bestand voeg je de volgende code toe:

```php
<?php

require 'database.php';

$apiKey = 'YOUR_API_KEY';
$city = 'Beverwijk'; //of een stad naar keuze
$url = "https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apiKey";
$response = file_get_contents($url);
$data = json_decode($response, true);
$temp = $data['main']['temp'];
echo $temp;

?>
```

Deze code zorgt ervoor dat je de API van de OpenWeatherMap kunt gebruiken.