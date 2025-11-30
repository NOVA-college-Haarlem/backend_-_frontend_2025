# Blok 9 - Laravel Todo List Project

## Week 2 - CRUD Uitbreiden en Relaties

### Introductie
In week 1 hebben we een basis todo list gebouwd met create en read functionaliteit. Deze week gaan we de applicatie uitbreiden met edit en delete functionaliteit, categories koppelen aan tasks, en filters implementeren.

### Leerdoelen
- Complete CRUD operaties implementeren (Edit & Delete)
- Eloquent relaties opzetten (One-to-Many)
- Foreign keys en migrations aanpassen
- Form validation uitbreiden
- Flash messages gebruiken
- Toggle functionaliteit bouwen

---

## Opdracht 1: Edit Functionaliteit

### Opdracht 1.1: Edit Method in Controller
1. Open `app/Http/Controllers/TaskController.php`
2. Voeg de `edit()` method toe:
    ```php
    public function edit(Task $task)
    {
        return view('tasks.edit', compact('task'));
    }
    ```

### Opdracht 1.2: Update Method in Controller
Voeg de `update()` method toe:
```php
public function update(Request $request, Task $task)
{
    $validated = $request->validate([
        'title' => 'required|max:255',
        'description' => 'nullable',
        'due_date' => 'nullable|date',
        'completed' => 'boolean',
    ]);

    $task->update($validated);

    return redirect()->route('tasks.index')->with('success', 'Taak succesvol bijgewerkt!');
}
```

**Vraag:** Waarom gebruiken we `$task->update()` in plaats van `Task::create()`?

### Opdracht 1.3: Edit View Maken
Maak een nieuw bestand `resources/views/tasks/edit.blade.php`:

```blade
@extends('layouts.app')

@section('title', 'Taak Bewerken')

@section('content')
    <div class="bg-white rounded-lg shadow p-6 max-w-2xl">
        <h2 class="text-xl font-semibold mb-4">Taak Bewerken</h2>

        <form action="{{ route('tasks.update', $task) }}" method="POST">
            @csrf
            @method('PUT')

            <div class="mb-4">
                <label for="title" class="block text-gray-700 font-medium mb-2">Titel *</label>
                <input
                    type="text"
                    name="title"
                    id="title"
                    value="{{ old('title', $task->title) }}"
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
                >{{ old('description', $task->description) }}</textarea>
            </div>

            <div class="mb-4">
                <label for="due_date" class="block text-gray-700 font-medium mb-2">Deadline</label>
                <input
                    type="date"
                    name="due_date"
                    id="due_date"
                    value="{{ old('due_date', $task->due_date?->format('Y-m-d')) }}"
                    class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                >
            </div>

            <div class="mb-4">
                <label class="flex items-center">
                    <input
                        type="checkbox"
                        name="completed"
                        value="1"
                        {{ old('completed', $task->completed) ? 'checked' : '' }}
                        class="mr-2"
                    >
                    <span class="text-gray-700">Taak voltooid</span>
                </label>
            </div>

            <div class="flex gap-3">
                <button
                    type="submit"
                    class="bg-blue-500 hover:bg-blue-600 text-white px-6 py-2 rounded-lg"
                >
                    Bijwerken
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

**Vraag:** Wat doet `@method('PUT')` in het formulier?

---

## Opdracht 2: Delete Functionaliteit

### Opdracht 2.1: Destroy Method in Controller
Voeg toe aan `TaskController.php`:
```php
public function destroy(Task $task)
{
    $task->delete();

    return redirect()->route('tasks.index')->with('success', 'Taak succesvol verwijderd!');
}
```

### Opdracht 2.2: Delete Button Toevoegen
Update `resources/views/tasks/index.blade.php` om een delete knop toe te voegen.

Vervang de div met de "Bewerken" link door:
```blade
<div class="flex gap-2 ml-4">
    <a href="{{ route('tasks.edit', $task) }}" class="text-blue-500 hover:text-blue-700">
        Bewerken
    </a>
    <form action="{{ route('tasks.destroy', $task) }}" method="POST" class="inline">
        @csrf
        @method('DELETE')
        <button
            type="submit"
            onclick="return confirm('Weet je zeker dat je deze taak wilt verwijderen?')"
            class="text-red-500 hover:text-red-700"
        >
            Verwijderen
        </button>
    </form>
</div>
```

**Vraag:** Waarom gebruiken we een POST formulier voor het verwijderen en niet een simpele link?

---

## Opdracht 3: Toggle Complete Functionaliteit

### Opdracht 3.1: Toggle Method in Controller
Voeg een nieuwe method toe aan `TaskController.php`:
```php
public function toggle(Task $task)
{
    $task->update([
        'completed' => !$task->completed
    ]);

    return redirect()->route('tasks.index')->with('success',
        $task->completed ? 'Taak voltooid!' : 'Taak weer geopend!'
    );
}
```

### Opdracht 3.2: Toggle Route
Voeg toe aan `routes/web.php`:
```php
Route::patch('/tasks/{task}/toggle', [TaskController::class, 'toggle'])->name('tasks.toggle');
```

### Opdracht 3.3: Toggle Button in Index View
Update de index view om een toggle knop toe te voegen. Voeg toe boven de "Bewerken" link:
```blade
<form action="{{ route('tasks.toggle', $task) }}" method="POST" class="inline">
    @csrf
    @method('PATCH')
    <button
        type="submit"
        class="text-sm {{ $task->completed ? 'text-green-600 hover:text-green-800' : 'text-gray-600 hover:text-gray-800' }}"
    >
        {{ $task->completed ? '✓ Voltooid' : '○ Markeer als voltooid' }}
    </button>
</form>
```

---

## Opdracht 4: Relaties Opzetten (Tasks en Categories)

### Opdracht 4.1: Migration Aanpassen voor Foreign Key
1. Maak een nieuwe migration aan om een foreign key toe te voegen:
    ```bash
    php artisan make:migration add_category_id_to_tasks_table
    ```
2. Open de nieuwe migration en voeg toe:
    ```php
    public function up()
    {
        Schema::table('tasks', function (Blueprint $table) {
            $table->foreignId('category_id')->nullable()->constrained()->onDelete('set null');
        });
    }

    public function down()
    {
        Schema::table('tasks', function (Blueprint $table) {
            $table->dropForeign(['category_id']);
            $table->dropColumn('category_id');
        });
    }
    ```
3. Voer de migration uit:
    ```bash
    php artisan migrate
    ```

**Vraag:** Wat betekent `onDelete('set null')`? Wat zijn andere opties?

### Opdracht 4.2: Eloquent Relaties Definiëren

#### In Task Model
Open `app/Models/Task.php` en voeg toe:
```php
// Voeg category_id toe aan fillable
protected $fillable = [
    'title',
    'description',
    'completed',
    'due_date',
    'category_id',
];

// Voeg de relatie toe
public function category()
{
    return $this->belongsTo(Category::class);
}
```

#### In Category Model
Open `app/Models/Category.php` en voeg toe:
```php
protected $fillable = ['name', 'color'];

public function tasks()
{
    return $this->hasMany(Task::class);
}
```

**Vraag:** Wat is het verschil tussen `belongsTo` en `hasMany`?

---

## Opdracht 5: Categories in Formulieren

### Opdracht 5.1: Update Create Method
Pas de `create()` method in `TaskController.php` aan:
```php
public function create()
{
    $categories = \App\Models\Category::all();
    return view('tasks.create', compact('categories'));
}
```

### Opdracht 5.2: Update Edit Method
Pas de `edit()` method aan:
```php
public function edit(Task $task)
{
    $categories = \App\Models\Category::all();
    return view('tasks.edit', compact('task', 'categories'));
}
```

### Opdracht 5.3: Category Dropdown in Create View
Voeg toe aan `create.blade.php` (na de description field):
```blade
<div class="mb-4">
    <label for="category_id" class="block text-gray-700 font-medium mb-2">Categorie</label>
    <select
        name="category_id"
        id="category_id"
        class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
    >
        <option value="">Geen categorie</option>
        @foreach($categories as $category)
            <option value="{{ $category->id }}" {{ old('category_id') == $category->id ? 'selected' : '' }}>
                {{ $category->name }}
            </option>
        @endforeach
    </select>
</div>
```

### Opdracht 5.4: Category Dropdown in Edit View
Voeg hetzelfde toe aan `edit.blade.php`, maar met de geselecteerde waarde van de task:
```blade
<div class="mb-4">
    <label for="category_id" class="block text-gray-700 font-medium mb-2">Categorie</label>
    <select
        name="category_id"
        id="category_id"
        class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
    >
        <option value="">Geen categorie</option>
        @foreach($categories as $category)
            <option value="{{ $category->id }}" {{ old('category_id', $task->category_id) == $category->id ? 'selected' : '' }}>
                {{ $category->name }}
            </option>
        @endforeach
    </select>
</div>
```

### Opdracht 5.5: Update Validatie
Voeg `category_id` toe aan de validatie in zowel `store()` als `update()` methods:
```php
$validated = $request->validate([
    'title' => 'required|max:255',
    'description' => 'nullable',
    'due_date' => 'nullable|date',
    'completed' => 'boolean',
    'category_id' => 'nullable|exists:categories,id',
]);
```

**Vraag:** Wat doet de `exists:categories,id` validatie regel?

---

## Opdracht 6: Categories Tonen in Index

Update `resources/views/tasks/index.blade.php` om de categorie te tonen:

Voeg toe na de description:
```blade
@if($task->category)
    <span class="inline-block px-2 py-1 text-xs rounded-full mt-2" style="background-color: {{ $task->category->color }}20; color: {{ $task->category->color }}">
        {{ $task->category->name }}
    </span>
@endif
```

---

## Opdracht 7: Filters Implementeren

### Opdracht 7.1: Filter Method in Controller
Update de `index()` method in `TaskController.php`:
```php
public function index(Request $request)
{
    $query = Task::query()->with('category');

    // Filter op status
    if ($request->has('status')) {
        if ($request->status === 'completed') {
            $query->where('completed', true);
        } elseif ($request->status === 'active') {
            $query->where('completed', false);
        }
    }

    // Filter op categorie
    if ($request->has('category') && $request->category !== '') {
        $query->where('category_id', $request->category);
    }

    // Sorteer
    $sortBy = $request->get('sort', 'due_date');
    $sortDirection = $request->get('direction', 'asc');
    $query->orderBy($sortBy, $sortDirection);

    $tasks = $query->get();
    $categories = \App\Models\Category::all();

    return view('tasks.index', compact('tasks', 'categories'));
}
```

**Vraag:** Wat doet de `with('category')` method? (Hint: Eager Loading)

### Opdracht 7.2: Filter UI in Index View
Voeg toe boven de tasks lijst in `index.blade.php`:
```blade
<div class="bg-white rounded-lg shadow p-4 mb-4">
    <form method="GET" action="{{ route('tasks.index') }}" class="flex gap-4 flex-wrap">
        <div>
            <label for="status" class="block text-sm font-medium text-gray-700 mb-1">Status</label>
            <select name="status" id="status" class="px-3 py-2 border rounded-lg">
                <option value="">Alle</option>
                <option value="active" {{ request('status') === 'active' ? 'selected' : '' }}>Actief</option>
                <option value="completed" {{ request('status') === 'completed' ? 'selected' : '' }}>Voltooid</option>
            </select>
        </div>

        <div>
            <label for="category" class="block text-sm font-medium text-gray-700 mb-1">Categorie</label>
            <select name="category" id="category" class="px-3 py-2 border rounded-lg">
                <option value="">Alle</option>
                @foreach($categories as $category)
                    <option value="{{ $category->id }}" {{ request('category') == $category->id ? 'selected' : '' }}>
                        {{ $category->name }}
                    </option>
                @endforeach
            </select>
        </div>

        <div>
            <label for="sort" class="block text-sm font-medium text-gray-700 mb-1">Sorteer op</label>
            <select name="sort" id="sort" class="px-3 py-2 border rounded-lg">
                <option value="due_date" {{ request('sort') === 'due_date' ? 'selected' : '' }}>Deadline</option>
                <option value="title" {{ request('sort') === 'title' ? 'selected' : '' }}>Titel</option>
                <option value="created_at" {{ request('sort') === 'created_at' ? 'selected' : '' }}>Aanmaakdatum</option>
            </select>
        </div>

        <div class="flex items-end gap-2">
            <button type="submit" class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded-lg">
                Filteren
            </button>
            <a href="{{ route('tasks.index') }}" class="bg-gray-300 hover:bg-gray-400 text-gray-800 px-4 py-2 rounded-lg">
                Reset
            </a>
        </div>
    </form>
</div>
```

---

## Opdracht 8: Seeder Updaten

Update de `TaskSeeder` om categories toe te wijzen:
```php
public function run()
{
    $tasks = [
        [
            'title' => 'Laravel cursus afmaken',
            'description' => 'Alle video\'s bekijken en opdrachten maken',
            'completed' => false,
            'due_date' => now()->addDays(7),
            'category_id' => 3, // Studie
        ],
        [
            'title' => 'Boodschappen doen',
            'description' => 'Melk, brood, eieren en groenten',
            'completed' => false,
            'due_date' => now()->addDays(1),
            'category_id' => 2, // Persoonlijk
        ],
        [
            'title' => 'Code review voor collega',
            'description' => 'Pull request #42 reviewen',
            'completed' => true,
            'due_date' => now()->subDays(1),
            'category_id' => 1, // Werk
        ],
        [
            'title' => 'Gitaar oefenen',
            'description' => 'Nieuwe akkoorden oefenen',
            'completed' => false,
            'due_date' => now()->addDays(3),
            'category_id' => 4, // Hobby
        ],
    ];

    foreach ($tasks as $task) {
        \App\Models\Task::create($task);
    }
}
```

Voer de seeders opnieuw uit:
```bash
php artisan migrate:fresh --seed
```

---

## Opdracht 9: Request Validation Classes

### Opdracht 9.1: Form Request Aanmaken
1. Maak een Form Request class:
    ```bash
    php artisan make:request StoreTaskRequest
    php artisan make:request UpdateTaskRequest
    ```

### Opdracht 9.2: StoreTaskRequest
Open `app/Http/Requests/StoreTaskRequest.php`:
```php
<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreTaskRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'title' => 'required|max:255',
            'description' => 'nullable|string',
            'due_date' => 'nullable|date|after_or_equal:today',
            'category_id' => 'nullable|exists:categories,id',
        ];
    }

    public function messages()
    {
        return [
            'title.required' => 'De titel is verplicht.',
            'title.max' => 'De titel mag maximaal 255 tekens bevatten.',
            'due_date.after_or_equal' => 'De deadline moet vandaag of in de toekomst zijn.',
        ];
    }
}
```

### Opdracht 9.3: UpdateTaskRequest
Open `app/Http/Requests/UpdateTaskRequest.php`:
```php
<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateTaskRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'title' => 'required|max:255',
            'description' => 'nullable|string',
            'due_date' => 'nullable|date',
            'completed' => 'boolean',
            'category_id' => 'nullable|exists:categories,id',
        ];
    }

    public function messages()
    {
        return [
            'title.required' => 'De titel is verplicht.',
            'title.max' => 'De titel mag maximaal 255 tekens bevatten.',
        ];
    }
}
```

### Opdracht 9.4: Controller Updaten
Update de `store()` en `update()` methods in `TaskController.php`:
```php
use App\Http\Requests\StoreTaskRequest;
use App\Http\Requests\UpdateTaskRequest;

public function store(StoreTaskRequest $request)
{
    Task::create($request->validated());
    return redirect()->route('tasks.index')->with('success', 'Taak succesvol aangemaakt!');
}

public function update(UpdateTaskRequest $request, Task $task)
{
    $task->update($request->validated());
    return redirect()->route('tasks.index')->with('success', 'Taak succesvol bijgewerkt!');
}
```

**Vraag:** Wat zijn de voordelen van Form Request classes boven inline validatie?

---

## Opdracht 10: Test Je Applicatie

Test de volgende functionaliteit:
1. Bewerk een bestaande taak
2. Verwijder een taak
3. Toggle de status van een taak
4. Wijs een categorie toe aan een taak
5. Filter taken op status en categorie
6. Sorteer taken op verschillende velden

---

## Extra Uitdagingen

1. **Bulk Actions**: Voeg de mogelijkheid toe om meerdere taken tegelijk te verwijderen
2. **Search Functionaliteit**: Implementeer een zoekbalk om te zoeken in titels en beschrijvingen
3. **Priority Field**: Voeg een priority veld toe (low, medium, high)
4. **Statistics**: Toon statistieken zoals aantal voltooide taken, aantal openstaande taken per categorie
5. **Due Date Warnings**: Markeer taken met een verlopen deadline in rood

---

## Reflectie Vragen

1. Wat is het verschil tussen `hasMany` en `belongsTo` relaties?
2. Waarom is eager loading belangrijk? (Hint: N+1 query probleem)
3. Wat is het voordeel van Form Request classes?
4. Hoe werkt de `onDelete('set null')` constraint in de database?
5. Wat is het verschil tussen `PUT`, `PATCH` en `DELETE` HTTP methods?

---

## Volgende Week

In week 3 gaan we:
- Authenticatie implementeren met Laravel Breeze
- User-specific tasks bouwen
- Authorization toevoegen (policies)
- Email notifications instellen
- API endpoints maken voor de todo list
