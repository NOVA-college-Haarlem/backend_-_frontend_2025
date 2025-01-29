## Migrations en Seeders voor CARS

Maak een migration aan voor de `cars` tabel:

- `php artisan make:migration create_cars_table`

Definieer de kolommen in de migration:

- `id` (staat er al)
- `make` (string)
- `model` (string)
- `year` (integer)
- `license_plate` (string)

Voer de migration uit:

- `php artisan migrate`

Maak een seeder aan voor de `cars` tabel:

- `php artisan make:seeder CarsTableSeeder`

Definieer de data in de seeder:

```php
public function run()
{
    DB::table('cars')->insert([
        'make' => 'Ford',
        'model' => 'Fiesta',
        'year' => 2010,
        'license_plate' => '12-AB-CD'
    ]);

    DB::table('cars')->insert([
        'make' => 'Volkswagen',
        'model' => 'Golf',
        'year' => 2015,
        'license_plate' => '34-EF-GH'
    ]);

    DB::table('cars')->insert([
        'make' => 'Audi',
        'model' => 'A3',
        'year' => 2018,
        'license_plate' => '56-IJ-KL'
    ]);
}
```

Bouw de database opnieuw op:

- `php artisan migrate:fresh --seed`

## Layout

Maak een Layout Component aan voor de basis layout van de website.

1. Open een terminal.
2. Maak een nieuw component aan met de naam `base-layout`:
   ```bash
   php artisan make:component BaseLayout
   ```
3. Open het bestand `resources/views/components/base-layout.blade.php`
4. Knip en plak alle HTML van `<!DOCTYPE>` tot en met `</nav>` (de regels 1 t/m 18) van `home.blade.php` naar `base-layout.blade.php`.
5. Knip en plak ook de onderste regels, de footer en de html en body sluit-tags van `home.blade.php` naar `base-layout.blade.php`. (regels 21 tot en met 96)
6. Voeg de volgende code toe aan `base-layout.blade.php` om de content van de pagina weer te geven. Precies na de regel met `<x-menu />`.
   ```php
   {{ $slot }}
   ```
7. Sla de wijzigingen op.

## Routes, Views en Controllers voor CARS

Maak routes aan voor de CARS functionaliteit in `web.php`. Voeg de volgende routes toe:

- `/cars` voor het tonen van alle auto's.

Maak de bijbehorende views aan in de map `resources/views/cars/index.blade.php`

> Let op dat de index.blade.php in de map `cars` staat.

Maak een `CarController` aan met de bijbehorende methode:

- `index()`

```php
public function index()
{
    $cars = DB::table('cars')->get();
    return view('cars.index', compact('cars'));
}
```

Maak ook de overige methodes aan voor de CRUD functionaliteit:

- `create()`
- `store()`
- `show()`
- `edit()`
- `update()`
- `destroy()`

*je hoeft geen code in de methodes te schrijven, dit komt later*






