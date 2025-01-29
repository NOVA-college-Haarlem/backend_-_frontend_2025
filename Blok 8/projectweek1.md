# Week 1 - Introductie Taxi Pro

Deze week gaan we met de projectlessen verder met de informatie die we in de lessen gedaan hebben.

We gaan een webapplicatie bouwen voor een taxi centrale.

## Installeren Node JS

Om dat te kunnen doen, moeten we eerst nog Node.js installeren. Google dit en installeer het.

## Nieuw Laravel Project

Daarna maken we via Herd een nieuw Laravel project aan genaamd Taxi Pro.

## Uitbouwen bestaand project

We gaan een bestaande site uitbouwen. Daarvoor gaan we gebruik maken van de repository [https://github.com/nova-college-haarlem/taxi-pro](https://github.com/nova-college-haarlem/taxi-pro). Fork het project en kloon deze in de Herd directory.

> Als het clonen __niet__ lukt mag je onderdelen van het project ook kopiëren:
>
> - Alle bestanden in de map `resources/views` dien je te kopiëren in het project `taxi-pro`.
> - Ook de afbeeldingen dien je te kopiëren op de juiste plek.

## Frontend inladen

Door gebruik te maken van een Package Manager (die tegelijkertijd met Node.js geïnstalleerd is) kunnen we gebruik maken van allerlei frontend assets (CSS en JS) van andere developers.

Open een terminal in VS Code binnen je project en type het volgende commando in: `npm install`. Als dit klaar is, type je `npm run dev` in. Deze terminal NIET sluiten.

## Nieuwe homepagina

Pas de homepagina aan door de route aan te passen. Deze staat nu nog op `welcome`, maar dit wordt `home`. Kortom, de root route wordt verwezen naar `home.blade.php`.

## Routes maken

Maak voor alle navigatieonderdelen routes aan in `web.php`.

Bijvoorbeeld voor `/services`, `/about`, `/contact` en `/cars`:

```php
Route::get('/services', function () {
    return view('services');
});
```
