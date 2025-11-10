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

---

## Opdracht 1: Project Aanmaken

1. Maak gebruik van Laravel Herd.
2. Kies voor het gebruik van Laravel Breeze voor authenticatie.
3. Noem het project "todolist".
4. Kies Blade voor de frontend.
5. Testing Framework: PHPUnit.
6. Target location: _hoef je niet te kiezen_.
7. Ga naar http://todolist.test om te controleren of het project werkt.

**Verwacht resultaat:** Je ziet de Laravel welkomstpagina op http://todolist.test

---

## Opdracht 2: Project bekijken

1. Open de project in je code editor. VS Code is hierbij aanbevolen.
2. Bekijk de mappenstructuur
3. Wijzig tekst op de pagina welcome.blade.php
4. Sla de pagina op en open deze in je browser.

---

## Opdracht 3: Routes aanpassen 

We gaan nu een nieuwe route toevoegen. Deze route zal naar de pagina "about" verwijzen.
1. Open het bestand `routes/web.php`
2. Voeg de volgende route toe:
    ```php
    Route::get('/about', function () {
        return view('about');
    });
    ```
3. Sla de wijzigingen op en open de pagina `/about` in je browser.

---

### Opdracht 3.1: Nog een route toevoegen

1. Open het bestand `routes/web.php`
2. Voeg de volgende route toe:
    ```php
    Route::get('/contact', function () {
        return view('contact');
    });
    ```
3. Sla de wijzigingen op en open de pagina `/contact` in je browser.    

---

## Opdracht 4: Statische pagina's aanmaken

1. Maak een nieuwe pagina aan met de naam "about.blade.php"
2. Voeg de volgende tekst toe:
    ```html
    <h1>About</h1>
    <p>This is the about page.</p>
    ```
3. Sla de pagina op en open deze in je browser.

--- 

### Opdracht 4.1: Contact pagina aanpassen
1. Open het bestand `resources/views/contact.blade.php`
2. Voeg de volgende tekst toe:
    ```html
    <h1>Contact</h1>
    <p>This is the contact page.</p>
    ```
3. Sla de pagina op en open deze in je browser.

---

### Opdracht 5: Nieuwe homepagina maken

1. Maak een nieuwe pagina aan met de naam "home.blade.php"
2. Vraag ChatGPT om een mooie homepagina te maken met Tailwind CSS versie 4.
3. Sla de pagina op en open deze in je browser.

---

### Opdracht 6: Routes aanpassen
1. Bekijk de reeds bestaande routes in het bestand `routes/web.php`
2. Pas de routes aan zodat de homepagina naar de nieuwe homepagina verwijst.

---

### Opdracht 7: Menu aanpassen
1. Open het bestand `resources/views/layouts/app.blade.php`
2. Pas het menu aan zodat de nieuwe homepagina naar de nieuwe homepagina verwijst.

---


## Opdracht 5: Models en Migrations Aanmaken

### Opdracht 3.1: Task Model
1. Maak een nieuw model aan met de naam "Task" inclusief migration, controller en seeder:
    ```bash
    php artisan make:model Task -m -c -s
    ```
2. Dit commando maakt de volgende bestanden aan:
   - `app/Models/Task.php` (het model)
   - `database/migrations/xxxx_xx_xx_create_tasks_table.php` (de migration)
   - `app/Http/Controllers/TaskController.php` (de controller)
   - `database/seeders/TaskSeeder.php` (de seeder)

### Opdracht 3.2: Category Model
1. Maak een nieuw model aan met de naam "Category":
    ```bash
    php artisan make:model Category -m -c -s
    ```

**Vraag:** Wat betekenen de flags `-m -c -s` bij het make:model commando?

---

## Opdracht 6: Migrations Aanpassen

### Opdracht 6.1: Tasks Migration
1. Open het bestand `database/migrations/xxxx_xx_xx_create_tasks_table.php`
2. Pas de `up()` methode aan met de volgende velden:
    ```php
    public function up()
    {
        Schema::create('tasks', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->text('description')->nullable();
            $table->boolean('completed')->default(false);
            $table->date('due_date')->nullable();
            $table->timestamps();
        });
    }
    ```

**Uitleg van de velden:**
- `id()`: Primaire sleutel (auto-increment)
- `title`: De titel van de taak
- `description`: Optionele beschrijving van de taak
- `completed`: Boolean om aan te geven of de taak voltooid is (standaard false)
- `due_date`: Optionele vervaldatum
- `timestamps()`: Maakt automatisch `created_at` en `updated_at` velden

### Opdracht 4.2: Categories Migration
1. Open het bestand `database/migrations/xxxx_xx_xx_create_categories_table.php`
2. Pas de `up()` methode aan:
    ```php
    public function up()
    {
        Schema::create('categories', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('color')->default('#3B82F6');
            $table->timestamps();
        });
    }
    ```

**Uitleg:**
- `name`: Naam van de categorie (bijv. "Werk", "Persoonlijk", "Studie")
- `color`: Hexadecimale kleurcode voor visuele weergave (standaard blauw)

### Opdracht 4.3: Migraties Uitvoeren
1. Voer alle migraties uit:
    ```bash
    php artisan migrate
    ```
2. Controleer of de tabellen zijn aangemaakt door naar de database te kijken.

**Vraag:** Wat gebeurt er als je een fout maakt in een migration en deze al hebt uitgevoerd?

---

## Opdracht 5: Seeders Maken

### Opdracht 5.1: Category Seeder
1. Open het bestand `database/seeders/CategorySeeder.php`
2. Voeg de volgende code toe in de `run()` methode:
    ```php
    public function run()
    {
        $categories = [
            ['name' => 'Werk', 'color' => '#3B82F6'],
            ['name' => 'Persoonlijk', 'color' => '#10B981'],
            ['name' => 'Studie', 'color' => '#F59E0B'],
            ['name' => 'Hobby', 'color' => '#8B5CF6'],
        ];

        foreach ($categories as $category) {
            \App\Models\Category::create($category);
        }
    }
    ```

### Opdracht 5.2: Task Seeder
1. Open het bestand `database/seeders/TaskSeeder.php`
2. Voeg de volgende code toe:
    ```php
    public function run()
    {
        $tasks = [
            [
                'title' => 'Laravel cursus afmaken',
                'description' => 'Alle video\'s bekijken en opdrachten maken',
                'completed' => false,
                'due_date' => now()->addDays(7),
            ],
            [
                'title' => 'Boodschappen doen',
                'description' => 'Melk, brood, eieren en groenten',
                'completed' => false,
                'due_date' => now()->addDays(1),
            ],
            [
                'title' => 'Code review voor collega',
                'description' => 'Pull request #42 reviewen',
                'completed' => true,
                'due_date' => now()->subDays(1),
            ],
        ];

        foreach ($tasks as $task) {
            \App\Models\Task::create($task);
        }
    }
    ```

### Opdracht 5.3: DatabaseSeeder Aanpassen
1. Open `database/seeders/DatabaseSeeder.php`
2. Roep de seeders aan in de `run()` methode:
    ```php
    public function run()
    {
        $this->call([
            CategorySeeder::class,
            TaskSeeder::class,
        ]);
    }
    ```

### Opdracht 5.4: Seeders Uitvoeren
1. Voer de seeders uit:
    ```bash
    php artisan db:seed
    ```
2. Of voer migraties en seeders in één keer uit:
    ```bash
    php artisan migrate:fresh --seed
    ```

**Waarschuwing:** `migrate:fresh` verwijdert alle data uit de database!

---

## Opdracht 6: Routes Aanmaken

1. Open het bestand `routes/web.php`
2. Voeg de volgende routes toe:
    ```php
    use App\Http\Controllers\TaskController;

    Route::get('/', [TaskController::class, 'index'])->name('tasks.index');
    Route::get('/tasks/create', [TaskController::class, 'create'])->name('tasks.create');
    Route::post('/tasks', [TaskController::class, 'store'])->name('tasks.store');
    Route::get('/tasks/{task}', [TaskController::class, 'show'])->name('tasks.show');
    Route::get('/tasks/{task}/edit', [TaskController::class, 'edit'])->name('tasks.edit');
    Route::put('/tasks/{task}', [TaskController::class, 'update'])->name('tasks.update');
    Route::delete('/tasks/{task}', [TaskController::class, 'destroy'])->name('tasks.destroy');
    ```

**Alternatief:** Je kunt ook een resource route gebruiken:
```php
Route::resource('tasks', TaskController::class);
```

**Vraag:** Wat is het verschil tussen bovenstaande individuele routes en een resource route?

---

## Opdracht 7: Controller Methods

### Opdracht 7.1: Index Method
Open `app/Http/Controllers/TaskController.php` en voeg de volgende code toe:

```php
<?php

namespace App\Http\Controllers;

use App\Models\Task;
use Illuminate\Http\Request;

class TaskController extends Controller
{
    public function index()
    {
        $tasks = Task::orderBy('due_date', 'asc')->get();
        return view('tasks.index', compact('tasks'));
    }
}
```

### Opdracht 7.2: Create Method
Voeg toe aan de TaskController:
```php
public function create()
{
    return view('tasks.create');
}
```

### Opdracht 7.3: Store Method
Voeg toe aan de TaskController:
```php
public function store(Request $request)
{
    $validated = $request->validate([
        'title' => 'required|max:255',
        'description' => 'nullable',
        'due_date' => 'nullable|date',
    ]);

    Task::create($validated);

    return redirect()->route('tasks.index')->with('success', 'Taak succesvol aangemaakt!');
}
```

**Vraag:** Waarom valideren we de input voordat we deze opslaan in de database?

---

## Opdracht 8: Views Maken

### Opdracht 8.1: Directory Structuur
1. Maak een nieuwe directory aan: `resources/views/tasks`
2. Maak de volgende bestanden aan in deze directory:
   - `index.blade.php`
   - `create.blade.php`

### Opdracht 8.2: Layout Template
Maak een basis layout in `resources/views/layouts/app.blade.php`:

```blade
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Todo List - @yield('title')</title>
    @vite(['resources/css/app.css', 'resources/js/app.js'])
</head>
<body class="bg-gray-100">
    <nav class="bg-white shadow-lg">
        <div class="max-w-7xl mx-auto px-4 py-4">
            <div class="flex justify-between items-center">
                <h1 class="text-2xl font-bold text-gray-800">Todo List</h1>
                <a href="{{ route('tasks.create') }}" class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded">
                    Nieuwe Taak
                </a>
            </div>
        </div>
    </nav>

    <main class="max-w-7xl mx-auto px-4 py-8">
        @if(session('success'))
            <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-4">
                {{ session('success') }}
            </div>
        @endif

        @yield('content')
    </main>
</body>
</html>
```

### Opdracht 8.3: Index View
Maak `resources/views/tasks/index.blade.php`:

```blade
@extends('layouts.app')

@section('title', 'Alle Taken')

@section('content')
    <div class="bg-white rounded-lg shadow p-6">
        <h2 class="text-xl font-semibold mb-4">Mijn Taken</h2>

        @if($tasks->isEmpty())
            <p class="text-gray-500">Geen taken gevonden. Maak je eerste taak aan!</p>
        @else
            <div class="space-y-3">
                @foreach($tasks as $task)
                    <div class="border rounded-lg p-4 hover:bg-gray-50 transition {{ $task->completed ? 'bg-gray-100' : '' }}">
                        <div class="flex items-start justify-between">
                            <div class="flex-1">
                                <h3 class="font-semibold {{ $task->completed ? 'line-through text-gray-500' : 'text-gray-800' }}">
                                    {{ $task->title }}
                                </h3>
                                @if($task->description)
                                    <p class="text-gray-600 text-sm mt-1">{{ $task->description }}</p>
                                @endif
                                @if($task->due_date)
                                    <p class="text-gray-500 text-xs mt-2">
                                        Deadline: {{ \Carbon\Carbon::parse($task->due_date)->format('d-m-Y') }}
                                    </p>
                                @endif
                            </div>
                            <div class="flex gap-2 ml-4">
                                <a href="{{ route('tasks.edit', $task) }}" class="text-blue-500 hover:text-blue-700">
                                    Bewerken
                                </a>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        @endif
    </div>
@endsection
```

### Opdracht 8.4: Create View
Maak `resources/views/tasks/create.blade.php`:

```blade
@extends('layouts.app')

@section('title', 'Nieuwe Taak')

@section('content')
    <div class="bg-white rounded-lg shadow p-6 max-w-2xl">
        <h2 class="text-xl font-semibold mb-4">Nieuwe Taak Aanmaken</h2>

        <form action="{{ route('tasks.store') }}" method="POST">
            @csrf

            <div class="mb-4">
                <label for="title" class="block text-gray-700 font-medium mb-2">Titel *</label>
                <input
                    type="text"
                    name="title"
                    id="title"
                    value="{{ old('title') }}"
                    class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 @error('title') border-red-500 @enderror"
                    required
                >
                @error('title')
                    <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
                @enderror
            </div>

            <div class="mb-4">
                <label for="description" class="block text-gray-700 font-medium mb-2">Beschrijving</label>
                <textarea
                    name="description"
                    id="description"
                    rows="4"
                    class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                >{{ old('description') }}</textarea>
            </div>

            <div class="mb-4">
                <label for="due_date" class="block text-gray-700 font-medium mb-2">Deadline</label>
                <input
                    type="date"
                    name="due_date"
                    id="due_date"
                    value="{{ old('due_date') }}"
                    class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                >
            </div>

            <div class="flex gap-3">
                <button
                    type="submit"
                    class="bg-blue-500 hover:bg-blue-600 text-white px-6 py-2 rounded-lg"
                >
                    Opslaan
                </button>
                <a
                    href="{{ route('tasks.index') }}"
                    class="bg-gray-300 hover:bg-gray-400 text-gray-800 px-6 py-2 rounded-lg"
                >
                    Annuleren
                </a>
            </div>
        </form>
    </div>
@endsection
```

---

## Opdracht 9: Model Configuration

### Opdracht 9.1: Mass Assignment Protection
1. Open `app/Models/Task.php`
2. Voeg de fillable fields toe:
    ```php
    <?php

    namespace App\Models;

    use Illuminate\Database\Eloquent\Model;

    class Task extends Model
    {
        protected $fillable = [
            'title',
            'description',
            'completed',
            'due_date',
        ];

        protected $casts = [
            'completed' => 'boolean',
            'due_date' => 'date',
        ];
    }
    ```

**Vraag:** Wat is het verschil tussen `$fillable` en `$guarded`?

---

## Opdracht 10: Test Je Applicatie

1. Start de development server (indien nog niet actief):
    ```bash
    npm run dev
    ```
2. Ga naar http://todolist.test
3. Test de volgende functionaliteit:
   - Bekijk de lijst met taken
   - Maak een nieuwe taak aan
   - Controleer of de validatie werkt (probeer een taak zonder titel aan te maken)

---

## Extra Uitdagingen

Als je klaar bent met bovenstaande opdrachten, probeer dan:

1. **Delete Functionaliteit**: Voeg een delete knop toe aan elke taak
2. **Toggle Complete**: Maak een knop om taken als voltooid/niet voltooid te markeren
3. **Styling**: Verbeter de styling met Tailwind CSS
4. **Sorteer Opties**: Voeg mogelijkheid toe om te sorteren op datum of titel

---

## Reflectie Vragen

1. Wat is de rol van migrations in Laravel?
2. Waarom gebruiken we seeders?
3. Wat is het verschil tussen een GET en POST request?
4. Waarom is input validatie belangrijk?
5. Wat zijn de voordelen van het gebruik van Blade templates?

---

## Volgende Week

In week 2 gaan we:
- Edit en delete functionaliteit toevoegen
- Categories koppelen aan tasks
- Status updates implementeren
- Filters en zoekfunctionaliteit bouwen
