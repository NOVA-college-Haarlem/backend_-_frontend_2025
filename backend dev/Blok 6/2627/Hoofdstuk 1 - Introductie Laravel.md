# Blok 6 - Laravel Spelshop Project

## Introductie
We gaan een spelshop applicatie bouwen met Laravel. In dit project leren we de basis van Laravel en maken we een volledig functionele spelshop met spellen, categorieën en reviews.

Hierbij kunnen gebruikers:
• Spellen bekijken
• Details van een spel bekijken
• Review achterlaten over een spel
• Een spel kopen

## inhoudsopgave

- [Blok 6 - Laravel Spelshop Project](#blok-6---laravel-spelshop-project)
  - [Introductie](#introductie)
  - [inhoudsopgave](#inhoudsopgave)
    - [Leerdoelen hoofdstuk 1](#leerdoelen-hoofdstuk-1)
  - [Hoofdstuk 1 - Project Setup en Basis Functionaliteit](#hoofdstuk-1---project-setup-en-basis-functionaliteit)
    - [Leerdoelen hoofdstuk 1](#leerdoelen-hoofdstuk-1-1)
  - [Project starten](#project-starten)
    - [Opdracht 1: Project Aanmaken](#opdracht-1-project-aanmaken)
    - [Opdracht 2: Project verkennen](#opdracht-2-project-verkennen)
    - [Opdracht 3: Eerste routes voor de webshop](#opdracht-3-eerste-routes-voor-de-webshop)
    - [Opdracht 4: Test de routes](#opdracht-4-test-de-routes)
  - [CRUD maken](#crud-maken)
    - [opdracht 5: Model maken](#opdracht-5-model-maken)
    - [opdracht 6: Migration maken](#opdracht-6-migration-maken)
    - [opdracht 7: Seeder maken](#opdracht-7-seeder-maken)
    - [opdracht 8: Controller maken](#opdracht-8-controller-maken)
    - [opdracht 8.1: Methode aanpassen](#opdracht-81-methode-aanpassen)
    - [opdracht 9: Route maken](#opdracht-9-route-maken)
    - [opdracht 10: View maken](#opdracht-10-view-maken)
    - [opdracht 11: Test je code](#opdracht-11-test-je-code)


### Leerdoelen hoofdstuk 1
- Een Laravel project opzetten met Laravel Herd
- Laravel Herd installeren en gebruiken om een nieuw Laravel project te starten.
- Mappenstructuur van Laravel verkennen.
- Eenvoudige routes, controllers en views maken.

## Hoofdstuk 1 - Project Setup en Basis Functionaliteit

### Leerdoelen hoofdstuk 1
- Een Laravel project opzetten met Laravel Herd
- Laravel Herd installeren en gebruiken om een nieuw Laravel project te starten.
- Mappenstructuur van Laravel verkennen.
- Eenvoudige routes, controllers en views maken.

## Project starten

### Opdracht 1: Project Aanmaken

1. Maak gebruik van Laravel Herd.
2. Kies voor het gebruik van Laravel Breeze voor authenticatie.
3. Noem het project "spelshop".
4. Kies Blade voor de frontend.
5. Testing Framework: PHPUnit.
6. Target location: _hoef je niet te kiezen_.
7. Ga naar http://spelshop.test om te controleren of het project werkt.

**Verwacht resultaat:** Je ziet de Laravel welkomstpagina op http://spelshop.test

### Opdracht 2: Project verkennen
1. Open het project spelshop in VS Code.
2. Bekijk de mappen app, routes, resources, database.
3. Open `resources/views/welcome.blade.php` en verander de titel of tekst.
4. Herlaad de pagina in de browser.

### Opdracht 3: Eerste routes voor de webshop
We maken statische pagina’s voor de webshop.
1. Open `routes/web.php`.
2. Voeg een route toe voor de homepage van de webshop:
    ```php
    Route::get('/', function () {
        return view('home');
    });
    //hieronder nog routes toevoegen voor /over en /contact
    ```
3. Voeg routes toe voor:
    - `/over` (informatie over de webshop)
    - `/contact` (contactpagina)
    ```php
    Route::get('/over', function () {
        return view('over');
    });
    Route::get('/contact', function () {
        return view('contact');
    });
    ```
4. Herlaad de pagina in de browser.
5. Open de pagina `/over` en `/contact` in je browser.
6. Je krijgt een foutmelding omdat de views nog niet bestaan.
7. Maak de views aan in de map `resources/views`.
8. Maak een nieuwe pagina aan met de naam `over.blade.php`.
9. Voeg de volgende tekst toe:
    ```html
    <h1>Over</h1>
    <p>Dit is de over de spelshop pagina.</p>
    ```
10. Maak een nieuwe pagina aan met de naam `contact.blade.php`.
11. Voeg de volgende tekst toe:
    ```html
    <h1>Contact</h1>
    <p>Dit is de contactpagina.</p>
    ```
12. Herlaad de pagina in de browser.

### Opdracht 4: Test de routes

1. We gaan gebruik maken van automatisch testing.
2. Deze zijn al aangeleverd in het project.
3. Open de terminal en voer de volgende commando uit:
    ```bash
    php artisan test --group="StaticRoutes"
    ```
4. Je ziet de test resultaten.

Er ontstaat een foutmelding omdat de routes nog niet bestaan.
Om een test te draaien waarbij de test stop op het moment van falen dan dien je de volgende commando op te geven:
    ```bash
    php artisan test --group=StaticRoutes --stop-on-failure 
    ```

## CRUD maken
We gaan een CRUD voor categorieën maken. (CREATE, READ, UPDATE, DELETE)
We zorgen eerst voor een overzicht van de categorieën. Om dit te doen gaan we volledig gebruik maken van het MVC (Model View Controller) patroon. 

> - Een controller is als een verkeerstoren op een vliegveld. Hij regelt de verkeer op de weg. In de controller regelen we de logica van de website..
> - In de model zorgen we voor de data, dit is vaak een representatie van de data in de database. 
> - In de view weergeven we de data.

### opdracht 5: Model maken

1. Om data uit de database te halen, moeten we een model maken.
   ```bash
   php artisan make:model Category
   ```
2. Open de model `app/Models/Category.php`
3. Voeg de volgende code toe:
    ```php
    protected $fillable = ['name'];
    ```
4. Sla de wijzigingen op.

### opdracht 6: Migration maken

Daarnaast moeten we ook een migration maken voor de categorieën. Dit is een bestand dat de database schema aanpast.
   ```bash
   php artisan make:migration create_categories_table
   ```
1. Open de migration `database/migrations/2025_11_11_123456_create_categories_table.php`
2. Voeg de volgende code toe:
    ```php
    public function up()
    {
        Schema::create('categories', function (Blueprint $table) {  
            $table->id();
            $table->string('name');
            $table->string('description')->nullable();
            $table->timestamps();
        });
    }
    ```
3. Sla de wijzigingen op.

### opdracht 7: Seeder maken

Daarnaas moeten we ook een seeder maken voor de categorieën. Een seeder is een bestand dat de database data aanpast.
   ```bash
   php artisan make:seeder CategoriesSeeder
   ```
2. Open de seeder `database/seeders/CategoriesSeeder.php`
3. Voeg de volgende code toe:
    ```php
    public function run()
    {
        $categories = [
            [
                'name' => 'Bordspellen',
                'description' => 'Alle soorten bordspellen'
            ],
            [
                'name' => 'Kaartspellen',
                'description' => 'Kaartspellen voor verzamelen en spelen'
            ],
            [
                'name' => 'Puzzels',
                'description' => 'Legpuzzels en breinbrekers'
            ]
        ];

        Category::insert($categories);
    }
    ```
4. Sla de wijzigingen op.

### opdracht 8: Controller maken

Een controller is als een verkeerstoren op een vliegveld. Hij regelt de verkeer op de weg. In de controller regelen we de logica van de website.

5. Maak een nieuwe controller aan met de naam `CategoryController`.
   ```bash
   php artisan make:controller CategoryController
   ```

### opdracht 8.1: Methode aanpassen
1. Open de controller `app/Http/Controllers/CategoryController.php`
2. Pas de methode `index` aan met de volgende code:
    ```php
   public function index()
    {
        // Lijst alle categorieën ophalen
        $categories = Category::all();
        return view('categories.index', compact('categories'));
    }
    ```
3. Sla de wijzigingen op.

### opdracht 9: Route maken

1. Maak een nieuwe route aan voor de categorieën.
   ```php
   Route::get('/categories', [CategoryController::class, 'index']);
   ```

### opdracht 10: View maken
7. Maak een nieuwe view aan voor de categorieën.
   ```php
   php artisan make:view categories.index
   ```
In de view `categories.index.blade.php` kunnen we de data weergeven met de volgende code:
```php
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Categorieën overzicht</title>
</head>
<body>
    <h1>Categorieën overzicht</h1>
    
    @if($categories->isEmpty())
        <p>Geen categorieën gevonden.</p>
    @else
        <div class="categories-list">
            @foreach($categories as $category)
                <div class="category-item">
                    <h2>{{ $category->name }}</h2>
                    <p>{{ $category->description }}</p>
                </div>
            @endforeach
        </div>
    @endif
</body>
</html>
```

### opdracht 11: Test je code

```bash
php artisan test --group="CategoriesIndex"








