# Blok 9 - Laravel Todo List Project

## Week 1 - Project Setup en Basis Functionaliteit

### Introductie
We gaan een todo list applicatie bouwen met Laravel. In dit project leren we de basis van Laravel en maken we een volledig functionele todo list met taken, categorieën en gebruikersbeheer.

### Leerdoelen
- Een Laravel project opzetten met Laravel Herd
- Models, migrations en seeders aanmaken
- Basis CRUD operaties implementeren
- Routes en controllers gebruiken
- Blade templates maken voor de frontend

## Project starten

### Opdracht 1: Project Aanmaken

1. Maak gebruik van Laravel Herd.
2. Kies voor het gebruik van Laravel Breeze voor authenticatie.
3. Noem het project "todolist".
4. Kies Blade voor de frontend.
5. Testing Framework: PHPUnit.
6. Target location: _hoef je niet te kiezen_.
7. Ga naar http://todolist.test om te controleren of het project werkt.

**Verwacht resultaat:** Je ziet de Laravel welkomstpagina op http://todolist.test



### Opdracht 2: Project bekijken

1. Open de project in je code editor. VS Code is hierbij aanbevolen.
2. Bekijk de mappenstructuur
3. Wijzig tekst op de pagina welcome.blade.php
4. Sla de pagina op en open deze in je browser.



## Routes

### Opdracht 3.1: Routes aanpassen 

We gaan nu een nieuwe route toevoegen. Deze route zal naar de pagina "about" verwijzen.
1. Open het bestand `routes/web.php`
2. Voeg de volgende route toe:
    ```php
    Route::get('/about', function () {
        return view('about');
    });
    ```
3. Sla de wijzigingen op en open de pagina `/about` in je browser. 


#### Opdracht 3.2: Nog een route toevoegen

1. Open het bestand `routes/web.php`
2. Voeg de volgende route toe:
    ```php
    Route::get('/contact', function () {
        return view('contact');
    });
    ```
3. Sla de wijzigingen op en open de pagina `/contact` in je browser.    



## Views

### Opdracht 4.1: Statische pagina's aanmaken

1. Maak een nieuwe pagina aan met de naam "about.blade.php"
2. Voeg de volgende tekst toe:
    ```html
    <h1>About</h1>
    <p>This is the about page.</p>
    ```
3. Sla de pagina op en open deze in je browser.

 

#### Opdracht 4.2: Contact pagina aanpassen
1. Open het bestand `resources/views/contact.blade.php`
2. Voeg de volgende tekst toe:
    ```html
    <h1>Contact</h1>
    <p>This is the contact page.</p>
    ```
3. Sla de pagina op en open deze in je browser.



## Homepagina

### Opdracht 5: Nieuwe homepagina maken

1. Maak een nieuwe pagina aan met de naam "home.blade.php"
2. Vraag ChatGPT om een mooie homepagina te maken met Tailwind CSS versie 4.
3. Sla de pagina op en open deze in je browser.



### Opdracht 6: Routes aanpassen
1. Bekijk de reeds bestaande routes in het bestand `routes/web.php`
2. Pas de routes aan zodat de homepagina naar de nieuwe homepagina verwijst.

## Layout Component maken

Met behulp van een Layout Component kunnen we de layout van onze website op een gemakkelijke manier aanpassen. 
We kunnen de code van dit component hergebruiken op alle pagina's van onze website.

### Opdracht 7.1: Layout Component maken
1. Maak met behulp van de terminal een nieuwe component aan met de naam `BaseLayout`:
    ```bash
    php artisan make:component BaseLayout
    ```
2. Open het bestand `resources/views/components/base-layout.blade.php`

### Opdracht 7.2: Layout maken
1. Maak een nieuwe layout voor een todo list website.
2. Vraag ChatGPT om een mooie layout te maken met Tailwind CSS versie 4 voor een todo list website.
3. Sla een deel van de layout op in het bestand `resources/views/components/base-layout.blade.php`
4. Kopieer alleen de bovenkant en onderkant van de code naar het bestand `resources/views/components/base-layout.blade.php`
5. Het main gedeelte zetten we neer in home.blade.php

### Opdracht 7.3: Layout component gebruiken
1. Open het bestand `resources/views/home.blade.php`
2. Voeg de volgende code toe:
    ```php
    <x-base-layout>
        <h1>Home</h1>
    </x-base-layout>
    ```
3. Sla de wijzigingen op en open de pagina `/` in je browser.


### Opdracht 7.4: Layout component gebruiken
1. Open het bestand `resources/views/about.blade.php`
2. Voeg de volgende code toe:
    ```php
    <x-base-layout>
        <h1>About</h1>
    </x-base-layout>
    ```
3. Sla de wijzigingen op en open de pagina `/about` in je browser.


### Opdracht 7.5: Layout component gebruiken
1. Open het bestand `resources/views/contact.blade.php`
2. Voeg de volgende code toe:
    ```php
    <x-base-layout>
        <h1>Contact</h1>
    </x-base-layout>
    ```
3. Sla de wijzigingen op en open de pagina `/contact` in je browser.



## Controller

In Laravel is een controller een PHP-klasse die de logica van je website bevat. In een controller kan je bijvoorbeeld de gegevens uit de database halen en doorgeven aan de view. Een controller kan je vergelijken met een chef-kok in een restaurant. De chef-kok bereidt het eten en geeft het door aan de serveerster, die het eten aan de klant serveert.

### Opdracht 8.1: Controller maken
1. Maak een nieuwe controller aan met de naam `PageController`
   ```bash
   php artisan make:controller PageController
   ```

## Methode 

In een controller kan je verschillende methodes toevoegen. Een methode is een functie die je in de controller definieert. Een methode kan je vergelijken met een recept in een restaurant. Een recept is een reeks stappen die je moet volgen om een gerecht te bereiden.

### Opdracht 8.2: Methode toevoegen aan de controller
1. Open de controller `app/Http/Controllers/PageController.php`
2. Voeg de volgende methode toe:
    ```php
    public function about()
    {
        return view('about');
    }
    ```

Deze methode zal de view `about` weergeven.


### Opdracht 8.3: Methode toevoegen aan de controller
1. Open de controller `app/Http/Controllers/PageController.php`
2. Voeg de volgende methode toe:
    ```php
    public function contact()
    {
        return view('contact');
    }
    ```
3. Sla de wijzigingen op en open de pagina `/contact` in je browser.  

Deze methode zal de view `contact` weergeven.

## Data doorgeven aan de view

In Laravel kan je data doorgeven aan de view met de `compact` functie.

### Opdracht 9: Data doorgeven aan de view
1. Open de controller `app/Http/Controllers/PageController.php`
2. Pas de methode `about` aan met de volgende code:
    ```php
    public function about()
    {
        $title = 'Over mij';
        $description = 'Dit is de about pagina';
        return view('about', compact('title', 'description'));
    }
    ```
3. Sla de wijzigingen op en open de pagina `/about` in je browser.

Deze methode zal de view `about` weergeven met de variabele $title en $description.

Dit kunnen we natuurlijk ook doen met de andere methode:

### Opdracht 9.1: Data doorgeven aan de view
1. Open de controller `app/Http/Controllers/PageController.php`
2. Voeg de volgende code toe:
    ```php
    public function contact()
    {
        $title = 'Contact';
        $description = 'Dit is de contact pagina';
        return view('contact', compact('title', 'description'));
    }
    ```
3. Sla de wijzigingen op en open de pagina `/contact` in je browser.

Deze methode zal de view `contact` weergeven met de variabele $title en $description.

## Task Controller, index method en view aanmaken

Aangezien we een todo list website gaan bouwen, moeten we een controller maken voor de tasks.
We gaan de CRUD functionaliteit toevoegen aan de controller.

### Opdracht 10: Controller maken
1. Maak een nieuwe controller aan met de naam `TaskController`
   ```bash
   php artisan make:controller TaskController
   ```

2. Open de controller `app/Http/Controllers/TaskController.php`
3. Voeg de volgende methode toe:
    ```php
    public function index()
    {
        return view('tasks.index');
    }
    ```
4. Sla de wijzigingen op en open de pagina `/tasks` in je browser.
Deze methode zal de view `tasks.index` weergeven. Echter is de view nog niet aangemaakt

### Opdracht 10.1: View aanmaken
1. Maak een nieuwe view aan met de naam `tasks.index.blade.php`
2. Dit kan ook met de terminal: 
```bash
    php artisan make:view tasks.index
```
4. Voeg de volgende code toe:
    ```php
    <h1>Tasks</h1>
    ```
5. Sla de wijzigingen op en open de pagina `/tasks` in je browser. We krijgen een 404 error.
6. Open het bestand `routes/web.php`
7. Voeg de volgende route toe:
    ```php
    Route::get('/tasks', [TaskController::class, 'index']);
    ```
8. Sla de wijzigingen op en open de pagina `/tasks` in je browser. We krijgen een 404 error.

Deze view zal de index pagina van de tasks weergeven.

### Opdracht 10.2: Methode aanpassen
1. Open de controller `app/Http/Controllers/TaskController.php`
2. Pas de methode `index` aan met de volgende code:
    ```php
    public function index()
    {
        $title = "Takenoverzicht";
        $tasks = ["Boodschappen doen", "Kamer opruimen"];

        return view('tasks.index', compact('tasks' , 'title'));
    }
    ```
3. Sla de wijzigingen op en open de pagina `/tasks` in je browser.

Deze methode zal de view `tasks.index` weergeven met de variabele $tasks en $title.

In de view `tasks.index.blade.php` kunnen we de data weergeven met de volgende code:
    ```php
    <h1>{{ $title }}</h1>
    <ul>
        @foreach ($tasks as $task)
            <li>{{ $task }}</li>
        @endforeach
    </ul>
    ```
3. Sla de wijzigingen op en open de pagina `/tasks` in je browser.

Deze view zal de takenoverzicht pagina weergeven met de variabele $tasks en $title. We zien de taken in een lijst.

## Category Controller, index method en view aanmaken

Aangezien we een todo list website gaan bouwen, moeten we een controller maken voor de categories.
We gaan de CRUD functionaliteit toevoegen aan de controller.

### Opdracht 11: Controller maken
1. Maak een nieuwe controller aan met de naam `CategoryController`
   ```bash
   php artisan make:controller CategoryController
   ```

2. Open de controller `app/Http/Controllers/CategoryController.php`
3. Voeg de volgende methode toe:
    ```php
    public function index()
    {
        return view('categories.index');
    }
    ```
4. Sla de wijzigingen op en open de pagina `/categories` in je browser.

Deze methode zal de view `categories.index` weergeven.  

### Opdracht 11.1: View aanmaken
1. Maak een nieuwe view aan met de naam `categories.index.blade.php`
2. Dit kan ook met de terminal: 
```bash
    php artisan make:view categories.index
```
3. Voeg de volgende code toe:
    ```php
    <h1>Categories</h1>
    ```
4. Sla de wijzigingen op en open de pagina `/categories` in je browser. We krijgen een 404 error.
5. Open het bestand `routes/web.php`
6. Voeg de volgende route toe:
    ```php
    Route::get('/categories', [CategoryController::class, 'index']);
    ```
7. Sla de wijzigingen op en open de pagina `/categories` in je browser. We krijgen een 404 error.

Deze view zal de index pagina van de categories weergeven.

### Opdracht 11.2: Methode aanpassen
1. Open de controller `app/Http/Controllers/CategoryController.php` 
2. Pas de methode `index` aan met de volgende code:
    ```php
    public function index()
    {
        $categories = ['prive', 'werk', ];
        return view('categories.index', compact('categories'));
    }
    ```
3. Sla de wijzigingen op en open de pagina `/categories` in je browser.

Deze methode zal de view `categories.index` weergeven met de variabele $categories.

In de view `categories.index.blade.php` kunnen we de data weergeven met de volgende code:
    ```php
    <h1>Categories</h1>
    <ul>
        @foreach ($categories as $category)
            <li>{{ $category }}</li>
        @endforeach
    </ul>
    ``` 
3. Sla de wijzigingen op en open de pagina `/categories` in je browser.

Deze view zal de categories pagina weergeven met de variabele $categories. We zien de categories in een lijst.

## Migrations aanmaken

In Laravel kan je migrations aanmaken met de `make:migration` command.

### Opdracht 12: Migration aanmaken
1. Maak een nieuwe migration aan met de naam `create_tasks_table`
   ```bash
   php artisan make:migration create_tasks_table
   ```
2. Open de migration `database/migrations/2025_11_11_123456_create_tasks_table.php`
3. Voeg de volgende code toe:
    ```php
    public function up()
    {
        Schema::create('tasks', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->text('description');
            $table->boolean('completed')->default(false);
            $table->date('due_date');
            $table->timestamps();
        });
    }
    ```
4. Sla de wijzigingen op en open de pagina `/tasks` in je browser.

Deze migration zal de tabel `tasks` aanmaken met de kolommen title, description, completed en due_date.

## Seeder aanmaken

In Laravel kan je seeder aanmaken met de `make:seeder` command.

### Opdracht 13: Seeder aanmaken
1. Maak een nieuwe seeder aan met de naam `TasksSeeder`
   ```bash
   php artisan make:seeder TasksSeeder
   ```
2. Open de seeder `database/seeders/TasksSeeder.php`
3. Voeg de volgende code toe:
    ```php
    public function run()
    {
        $tasks = [
            [
                'title' => 'Task 1',
                'description' => 'Description 1',
                'completed' => false,
                'due_date' => '2025-11-11',
            ],
            [
                'title' => 'Task 2',
                'description' => 'Description 2',
                'completed' => false,
                'due_date' => '2025-11-12',
            ],
            [
                'title' => 'Task 3',
                'description' => 'Description 3',
                'completed' => false,
                'due_date' => '2025-11-13',
            ],
            [
                'title' => 'Task 4',
                'description' => 'Description 4',
                'completed' => false,
                'due_date' => '2025-11-14',
            ],
        ];

        Task::insert($tasks); //Hier wordt het model gebruikt om de data in de database te inserten.
    }   
    ```

Deze seeder zal de tabel `tasks` vullen met de data uit de array $tasks. We zien de taken in de database.

## Model aanmaken
In Laravel kan je models aanmaken met de `make:model` command.

### Opdracht 14: Model aanmaken
1. Maak een nieuwe model aan met de naam `Task`
   ```bash
   php artisan make:model Task
2. Het model is aangemaakt. Dit model representeert de tabel `tasks` in de database.
3. Open het bestand `app/Models/Task.php` om de code te bekijken.

## Category Migration aanmaken
1. Maak een nieuwe migration aan met de naam `create_categories_table`
   ```bash
   php artisan make:migration create_categories_table
   ```
2. Open de migration `database/migrations/2025_11_11_123456_create_categories_table.php`
3. Voeg de volgende code toe:
    ```php
    public function up()
    {
        Schema::create('categories', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->timestamps();
        });
    }
    ```
4. Sla de wijzigingen op en open de pagina `/categories` in je browser.

Deze migration zal de tabel `categories` aanmaken met de kolommen name en color.

## Category Seeder aanmaken
1. Maak een nieuwe seeder aan met de naam `CategoriesSeeder`
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
                'name' => 'Prive'
            ],
            [
                'name' => 'Werk'
            ],
            
        ];

        Category::insert($categories);
    }
    ```
4. Sla de wijzigingen op en open de pagina `/categories` in je browser.

Deze seeder zal de tabel `categories` vullen met de data uit de array $categories. We zien de categories in de database.

Deze seeder zal de tabel `categories` vullen met de data uit de array $categories. We zien de categories in de database.

## Model toevoegen
1. Maak een nieuwe model aan met de naam `Category`
   ```bash
   php artisan make:model Category
   ```
2. Open het bestand `app/Models/Category.php`

## DatabaseSeeder

De database seeder is de eerste seeder die wordt uitgevoerd bij het migreren van de database.

Om de eerder gemaakte seeders te kunnen uitvoeren, moeten we dit toevoegen aan de DatabaseSeeder.php.

1. Open het bestand `database/seeders/DatabaseSeeder.php`
2. Voeg de volgende code toe:
    ```php
    public function run()
    {
        $this->call([
            TasksSeeder::class,
            CategoriesSeeder::class,
        ]);
    }
    ```
3. Om dan de seeder uit te voeren, moeten we het volgende commando uitvoeren:
    ```bash
    php artisan db:seed
    ```
4. Het kan zijn dat je een error krijgt. Dit komt omdat de DatabaseSeeder gebruikt maakt van de UserFactory. Deze probeert een gebruiker aan te maken maar waarschijnlijk bestaat deze al.

> We bouwen de database opnieuw op. Dit kan je voorkomen door het volgende commando uit te voeren:
    ```bash
    php artisan migrate:fresh --seed
    ```

Dit zal de database wissen en opnieuw migreren en de seeders uitvoeren.



