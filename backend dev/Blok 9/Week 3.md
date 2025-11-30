# Blok 9 - Laravel Todo List Project

## Week 3 - Authenticatie en User-Specific Features

### Introductie
In week 1 en 2 hebben we een volledig functionele todo list gebouwd met CRUD operaties, categories en filters. Deze week gaan we authenticatie toevoegen zodat elke gebruiker zijn eigen taken kan beheren, en we voegen authorization toe met policies.

### Leerdoelen
- Laravel Breeze authenticatie gebruiken
- User-specific data implementeren
- Eloquent relaties tussen Users en Tasks
- Authorization met Policies
- Middleware gebruiken voor bescherming
- Multi-user applicatie bouwen

---

## Opdracht 1: Laravel Breeze Installeren

Laravel Breeze zou al geïnstalleerd moeten zijn van week 1. Als dat niet het geval is, volg dan deze stappen:

### Opdracht 1.1: Breeze Installatie Controleren
1. Controleer of Breeze al geïnstalleerd is:
    ```bash
    ls resources/views/auth
    ```
2. Als de auth directory bestaat, is Breeze al geïnstalleerd en kun je verder naar opdracht 2.

### Opdracht 1.2: Breeze Installeren (indien nodig)
Indien Breeze niet geïnstalleerd is:
```bash
composer require laravel/breeze --dev
php artisan breeze:install blade
npm install
npm run dev
php artisan migrate
```

### Opdracht 1.3: Test de Authenticatie
1. Ga naar http://todolist.test/register
2. Maak een nieuwe account aan
3. Log in met je nieuwe account
4. Verken de pagina's (dashboard, profile, etc.)

**Vraag:** Welke routes heeft Laravel Breeze automatisch aangemaakt?

---

## Opdracht 2: User Relatie met Tasks

### Opdracht 2.1: Migration voor User ID
1. Maak een nieuwe migration:
    ```bash
    php artisan make:migration add_user_id_to_tasks_table
    ```
2. Open de migration en voeg toe:
    ```php
    public function up()
    {
        Schema::table('tasks', function (Blueprint $table) {
            $table->foreignId('user_id')->nullable()->constrained()->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::table('tasks', function (Blueprint $table) {
            $table->dropForeign(['user_id']);
            $table->dropColumn('user_id');
        });
    }
    ```
3. Voer de migration uit:
    ```bash
    php artisan migrate
    ```

**Vraag:** Wat is het verschil tussen `onDelete('cascade')` en `onDelete('set null')`?

### Opdracht 2.2: Task Model Aanpassen
Open `app/Models/Task.php` en voeg toe:
```php
protected $fillable = [
    'title',
    'description',
    'completed',
    'due_date',
    'category_id',
    'user_id',
];

// Voeg de relatie toe
public function user()
{
    return $this->belongsTo(User::class);
}
```

### Opdracht 2.3: User Model Aanpassen
Open `app/Models/User.php` en voeg toe:
```php
public function tasks()
{
    return $this->hasMany(Task::class);
}
```

---

## Opdracht 3: Middleware Toepassen

### Opdracht 3.1: Routes Beschermen
Update `routes/web.php` om alle task routes te beschermen met auth middleware:

```php
use App\Http\Controllers\TaskController;

// Public routes
Route::get('/welcome', function () {
    return view('welcome');
});

// Protected routes
Route::middleware(['auth'])->group(function () {
    Route::get('/', [TaskController::class, 'index'])->name('tasks.index');
    Route::resource('tasks', TaskController::class)->except(['index']);
    Route::patch('/tasks/{task}/toggle', [TaskController::class, 'toggle'])->name('tasks.toggle');
});

require __DIR__.'/auth.php';
```

**Alternatief:** Je kunt ook middleware in de controller zelf definiëren:
```php
// In TaskController.php constructor
public function __construct()
{
    $this->middleware('auth');
}
```

**Vraag:** Wat is het verschil tussen middleware in routes en middleware in de controller?

---

## Opdracht 4: User-Specific Tasks

### Opdracht 4.1: Store Method Aanpassen
Update de `store()` method in `TaskController.php`:
```php
public function store(StoreTaskRequest $request)
{
    $task = Task::create([
        ...$request->validated(),
        'user_id' => auth()->id(),
    ]);

    return redirect()->route('tasks.index')->with('success', 'Taak succesvol aangemaakt!');
}
```

**Alternatief met relatie:**
```php
public function store(StoreTaskRequest $request)
{
    auth()->user()->tasks()->create($request->validated());
    return redirect()->route('tasks.index')->with('success', 'Taak succesvol aangemaakt!');
}
```

**Vraag:** Wat is het verschil tussen beide methoden?

### Opdracht 4.2: Index Method Aanpassen
Update de `index()` method om alleen taken van de ingelogde gebruiker te tonen:
```php
public function index(Request $request)
{
    $query = auth()->user()->tasks()->with('category');

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

    // Handle null due_dates by sorting them last
    if ($sortBy === 'due_date') {
        $query->orderByRaw('CASE WHEN due_date IS NULL THEN 1 ELSE 0 END, due_date ' . $sortDirection);
    } else {
        $query->orderBy($sortBy, $sortDirection);
    }

    $tasks = $query->get();
    $categories = \App\Models\Category::all();

    return view('tasks.index', compact('tasks', 'categories'));
}
```

---

## Opdracht 5: Authorization met Policies

### Opdracht 5.1: Policy Aanmaken
1. Maak een policy voor Task:
    ```bash
    php artisan make:policy TaskPolicy --model=Task
    ```
2. Open `app/Policies/TaskPolicy.php` en implementeer de methods:
    ```php
    <?php

    namespace App\Policies;

    use App\Models\Task;
    use App\Models\User;

    class TaskPolicy
    {
        public function viewAny(User $user)
        {
            return true;
        }

        public function view(User $user, Task $task)
        {
            return $user->id === $task->user_id;
        }

        public function create(User $user)
        {
            return true;
        }

        public function update(User $user, Task $task)
        {
            return $user->id === $task->user_id;
        }

        public function delete(User $user, Task $task)
        {
            return $user->id === $task->user_id;
        }
    }
    ```

**Vraag:** Wat is het verschil tussen `view` en `viewAny` policies?

### Opdracht 5.2: Policy Registreren
Laravel registreert policies automatisch als ze de naming convention volgen. Controleer `app/Providers/AuthServiceProvider.php`:
```php
protected $policies = [
    Task::class => TaskPolicy::class,
];
```

### Opdracht 5.3: Policy Gebruiken in Controller
Update de controller methods om authorization te gebruiken:

```php
public function edit(Task $task)
{
    $this->authorize('update', $task);

    $categories = \App\Models\Category::all();
    return view('tasks.edit', compact('task', 'categories'));
}

public function update(UpdateTaskRequest $request, Task $task)
{
    $this->authorize('update', $task);

    $task->update($request->validated());
    return redirect()->route('tasks.index')->with('success', 'Taak succesvol bijgewerkt!');
}

public function destroy(Task $task)
{
    $this->authorize('delete', $task);

    $task->delete();
    return redirect()->route('tasks.index')->with('success', 'Taak succesvol verwijderd!');
}

public function toggle(Task $task)
{
    $this->authorize('update', $task);

    $task->update([
        'completed' => !$task->completed
    ]);

    return redirect()->route('tasks.index')->with('success',
        $task->completed ? 'Taak voltooid!' : 'Taak weer geopend!'
    );
}
```

**Vraag:** Wat gebeurt er als een gebruiker probeert een taak van een andere gebruiker te bewerken?

---

## Opdracht 6: Layout Updaten

### Opdracht 6.1: Navigation Updaten
Update `resources/views/layouts/app.blade.php` om de Breeze navigation te gebruiken:

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
                <div class="flex items-center gap-8">
                    <h1 class="text-2xl font-bold text-gray-800">
                        <a href="{{ route('tasks.index') }}">Todo List</a>
                    </h1>
                    @auth
                        <div class="text-sm text-gray-600">
                            Welkom, {{ auth()->user()->name }}
                        </div>
                    @endauth
                </div>

                <div class="flex items-center gap-4">
                    @auth
                        <a href="{{ route('tasks.create') }}" class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded">
                            Nieuwe Taak
                        </a>
                        <a href="{{ route('profile.edit') }}" class="text-gray-600 hover:text-gray-800">
                            Profiel
                        </a>
                        <form method="POST" action="{{ route('logout') }}" class="inline">
                            @csrf
                            <button type="submit" class="text-gray-600 hover:text-gray-800">
                                Uitloggen
                            </button>
                        </form>
                    @else
                        <a href="{{ route('login') }}" class="text-gray-600 hover:text-gray-800">
                            Inloggen
                        </a>
                        <a href="{{ route('register') }}" class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded">
                            Registreren
                        </a>
                    @endauth
                </div>
            </div>
        </div>
    </nav>

    <main class="max-w-7xl mx-auto px-4 py-8">
        @if(session('success'))
            <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-4">
                {{ session('success') }}
            </div>
        @endif

        @if(session('error'))
            <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4">
                {{ session('error') }}
            </div>
        @endif

        @yield('content')
    </main>
</body>
</html>
```

---

## Opdracht 7: Seeders Updaten voor Multi-User

### Opdracht 7.1: User Seeder
Maak een user seeder:
```bash
php artisan make:seeder UserSeeder
```

Open `database/seeders/UserSeeder.php`:
```php
<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    public function run()
    {
        $users = [
            [
                'name' => 'Jan de Vries',
                'email' => 'jan@example.com',
                'password' => Hash::make('password'),
            ],
            [
                'name' => 'Sarah Bakker',
                'email' => 'sarah@example.com',
                'password' => Hash::make('password'),
            ],
        ];

        foreach ($users as $userData) {
            \App\Models\User::create($userData);
        }
    }
}
```

### Opdracht 7.2: Task Seeder Updaten
Update `database/seeders/TaskSeeder.php` om taken toe te wijzen aan users:
```php
public function run()
{
    $user1 = \App\Models\User::where('email', 'jan@example.com')->first();
    $user2 = \App\Models\User::where('email', 'sarah@example.com')->first();

    $tasks = [
        [
            'title' => 'Laravel cursus afmaken',
            'description' => 'Alle video\'s bekijken en opdrachten maken',
            'completed' => false,
            'due_date' => now()->addDays(7),
            'category_id' => 3,
            'user_id' => $user1->id,
        ],
        [
            'title' => 'Boodschappen doen',
            'description' => 'Melk, brood, eieren en groenten',
            'completed' => false,
            'due_date' => now()->addDays(1),
            'category_id' => 2,
            'user_id' => $user1->id,
        ],
        [
            'title' => 'Presentatie voorbereiden',
            'description' => 'Slides maken voor maandag',
            'completed' => false,
            'due_date' => now()->addDays(3),
            'category_id' => 1,
            'user_id' => $user2->id,
        ],
        [
            'title' => 'Yoga sessie',
            'description' => 'Wekelijkse yoga op woensdag',
            'completed' => true,
            'due_date' => now()->subDays(2),
            'category_id' => 4,
            'user_id' => $user2->id,
        ],
    ];

    foreach ($tasks as $task) {
        \App\Models\Task::create($task);
    }
}
```

### Opdracht 7.3: Database Seeder Updaten
Update `database/seeders/DatabaseSeeder.php`:
```php
public function run()
{
    $this->call([
        UserSeeder::class,
        CategorySeeder::class,
        TaskSeeder::class,
    ]);
}
```

### Opdracht 7.4: Database Opnieuw Seeden
```bash
php artisan migrate:fresh --seed
```

**Login credentials voor testen:**
- Email: jan@example.com / Password: password
- Email: sarah@example.com / Password: password

---

## Opdracht 8: Dashboard Statistics

### Opdracht 8.1: Statistics Toevoegen aan Index
Update `resources/views/tasks/index.blade.php` om statistics boven de filters toe te voegen:

```blade
@extends('layouts.app')

@section('title', 'Alle Taken')

@section('content')
    {{-- Statistics Cards --}}
    <div class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-6">
        <div class="bg-white rounded-lg shadow p-6">
            <div class="text-gray-500 text-sm">Totaal Taken</div>
            <div class="text-3xl font-bold text-gray-800">{{ $tasks->count() }}</div>
        </div>
        <div class="bg-white rounded-lg shadow p-6">
            <div class="text-gray-500 text-sm">Actief</div>
            <div class="text-3xl font-bold text-blue-600">{{ $tasks->where('completed', false)->count() }}</div>
        </div>
        <div class="bg-white rounded-lg shadow p-6">
            <div class="text-gray-500 text-sm">Voltooid</div>
            <div class="text-3xl font-bold text-green-600">{{ $tasks->where('completed', true)->count() }}</div>
        </div>
        <div class="bg-white rounded-lg shadow p-6">
            <div class="text-gray-500 text-sm">Verlopen</div>
            <div class="text-3xl font-bold text-red-600">
                {{ $tasks->where('completed', false)->filter(function($task) {
                    return $task->due_date && $task->due_date->isPast();
                })->count() }}
            </div>
        </div>
    </div>

    {{-- Rest van de bestaande code... --}}
@endsection
```

---

## Opdracht 9: Overdue Tasks Markeren

### Opdracht 9.1: Helper Method in Task Model
Voeg een helper method toe aan `app/Models/Task.php`:
```php
public function isOverdue()
{
    return !$this->completed
        && $this->due_date
        && $this->due_date->isPast();
}
```

### Opdracht 9.2: Visual Indicator in Index View
Update de task weergave in `index.blade.php`:
```blade
<div class="border rounded-lg p-4 hover:bg-gray-50 transition
    {{ $task->completed ? 'bg-gray-100' : '' }}
    {{ $task->isOverdue() ? 'border-red-300 bg-red-50' : '' }}">
    <div class="flex items-start justify-between">
        <div class="flex-1">
            <div class="flex items-center gap-2">
                <h3 class="font-semibold {{ $task->completed ? 'line-through text-gray-500' : 'text-gray-800' }}">
                    {{ $task->title }}
                </h3>
                @if($task->isOverdue())
                    <span class="text-xs bg-red-500 text-white px-2 py-1 rounded">
                        VERLOPEN
                    </span>
                @endif
            </div>
            {{-- Rest van de task content... --}}
```

---

## Opdracht 10: Scopes voor Queries

### Opdracht 10.1: Query Scopes Toevoegen
Voeg scopes toe aan `app/Models/Task.php`:
```php
// Query Scopes
public function scopeActive($query)
{
    return $query->where('completed', false);
}

public function scopeCompleted($query)
{
    return $query->where('completed', true);
}

public function scopeOverdue($query)
{
    return $query->where('completed', false)
                 ->whereNotNull('due_date')
                 ->where('due_date', '<', now());
}

public function scopeForUser($query, $userId)
{
    return $query->where('user_id', $userId);
}

public function scopeInCategory($query, $categoryId)
{
    return $query->where('category_id', $categoryId);
}
```

### Opdracht 10.2: Scopes Gebruiken in Controller
Update de `index()` method om scopes te gebruiken:
```php
public function index(Request $request)
{
    $query = Task::forUser(auth()->id())->with('category');

    // Filter op status met scopes
    if ($request->has('status')) {
        if ($request->status === 'completed') {
            $query->completed();
        } elseif ($request->status === 'active') {
            $query->active();
        } elseif ($request->status === 'overdue') {
            $query->overdue();
        }
    }

    // Filter op categorie met scope
    if ($request->has('category') && $request->category !== '') {
        $query->inCategory($request->category);
    }

    // Sorteer
    $sortBy = $request->get('sort', 'due_date');
    $sortDirection = $request->get('direction', 'asc');

    if ($sortBy === 'due_date') {
        $query->orderByRaw('CASE WHEN due_date IS NULL THEN 1 ELSE 0 END, due_date ' . $sortDirection);
    } else {
        $query->orderBy($sortBy, $sortDirection);
    }

    $tasks = $query->get();
    $categories = \App\Models\Category::all();

    return view('tasks.index', compact('tasks', 'categories'));
}
```

**Vraag:** Wat zijn de voordelen van query scopes?

---

## Opdracht 11: Shared Categories

### Opdracht 11.1: Global Categories of User-Specific?
Op dit moment zijn categories gedeeld tussen alle gebruikers. Bespreek met je docent:
- Moeten categories user-specific zijn?
- Of blijven ze global?

### Opdracht 11.2: (Optioneel) User-Specific Categories
Als je user-specific categories wilt:

1. Voeg `user_id` toe aan categories migration
2. Update CategorySeeder om categories per user aan te maken
3. Filter categories in de controller:
```php
$categories = auth()->user()->categories;
```

---

## Opdracht 12: Testing

### Opdracht 12.1: Feature Test Maken
Maak een test voor task CRUD operaties:
```bash
php artisan make:test TaskTest
```

Open `tests/Feature/TaskTest.php`:
```php
<?php

namespace Tests\Feature;

use App\Models\Task;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class TaskTest extends TestCase
{
    use RefreshDatabase;

    public function test_user_can_view_their_tasks()
    {
        $user = User::factory()->create();
        $task = Task::factory()->create(['user_id' => $user->id]);

        $response = $this->actingAs($user)->get(route('tasks.index'));

        $response->assertStatus(200);
        $response->assertSee($task->title);
    }

    public function test_user_cannot_view_other_users_tasks()
    {
        $user1 = User::factory()->create();
        $user2 = User::factory()->create();

        $task = Task::factory()->create(['user_id' => $user2->id]);

        $response = $this->actingAs($user1)->get(route('tasks.index'));

        $response->assertStatus(200);
        $response->assertDontSee($task->title);
    }

    public function test_user_can_create_task()
    {
        $user = User::factory()->create();

        $response = $this->actingAs($user)->post(route('tasks.store'), [
            'title' => 'Test Task',
            'description' => 'Test Description',
        ]);

        $response->assertRedirect(route('tasks.index'));
        $this->assertDatabaseHas('tasks', [
            'title' => 'Test Task',
            'user_id' => $user->id,
        ]);
    }

    public function test_user_cannot_delete_other_users_task()
    {
        $user1 = User::factory()->create();
        $user2 = User::factory()->create();

        $task = Task::factory()->create(['user_id' => $user2->id]);

        $response = $this->actingAs($user1)->delete(route('tasks.destroy', $task));

        $response->assertStatus(403); // Forbidden
    }
}
```

### Opdracht 12.2: Factory Aanmaken
Maak een factory voor Task:
```bash
php artisan make:factory TaskFactory
```

Open `database/factories/TaskFactory.php`:
```php
<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

class TaskFactory extends Factory
{
    public function definition()
    {
        return [
            'title' => $this->faker->sentence(),
            'description' => $this->faker->paragraph(),
            'completed' => $this->faker->boolean(30), // 30% voltooid
            'due_date' => $this->faker->optional()->dateTimeBetween('now', '+30 days'),
            'user_id' => User::factory(),
        ];
    }
}
```

### Opdracht 12.3: Tests Uitvoeren
```bash
php artisan test
```

**Vraag:** Waarom is automated testing belangrijk?

---

## Extra Uitdagingen

1. **Email Notifications**: Stuur een email wanneer een taak bijna verlopen is
2. **Task Sharing**: Sta gebruikers toe om taken met andere gebruikers te delen
3. **API Endpoints**: Maak een REST API voor de todo list
4. **Export Functionaliteit**: Exporteer taken naar CSV of PDF
5. **Recurring Tasks**: Voeg ondersteuning toe voor terugkerende taken
6. **Tags System**: Implementeer een tag systeem naast categories
7. **Dark Mode**: Voeg een dark mode toggle toe
8. **Task Templates**: Maak templates voor veelvoorkomende taken

---

## Opdracht 13: API Endpoints (Bonus)

### Opdracht 13.1: API Routes
Maak `routes/api.php` aan met API routes:
```php
use App\Http\Controllers\Api\TaskApiController;

Route::middleware('auth:sanctum')->group(function () {
    Route::apiResource('tasks', TaskApiController::class);
});
```

### Opdracht 13.2: API Controller
Maak een API controller:
```bash
php artisan make:controller Api/TaskApiController --api
```

Implementeer de methods:
```php
<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Task;
use Illuminate\Http\Request;

class TaskApiController extends Controller
{
    public function index()
    {
        return Task::where('user_id', auth()->id())
            ->with('category')
            ->get();
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|max:255',
            'description' => 'nullable',
            'due_date' => 'nullable|date',
            'category_id' => 'nullable|exists:categories,id',
        ]);

        $task = auth()->user()->tasks()->create($validated);

        return response()->json($task, 201);
    }

    public function show(Task $task)
    {
        $this->authorize('view', $task);
        return $task->load('category');
    }

    public function update(Request $request, Task $task)
    {
        $this->authorize('update', $task);

        $validated = $request->validate([
            'title' => 'required|max:255',
            'description' => 'nullable',
            'due_date' => 'nullable|date',
            'completed' => 'boolean',
            'category_id' => 'nullable|exists:categories,id',
        ]);

        $task->update($validated);

        return response()->json($task);
    }

    public function destroy(Task $task)
    {
        $this->authorize('delete', $task);
        $task->delete();

        return response()->json(null, 204);
    }
}
```

### Opdracht 13.3: API Testen met Postman
Test de API endpoints met Postman of cURL.

---

## Reflectie Vragen

1. Hoe werkt Laravel's authentication systeem?
2. Wat is het verschil tussen authentication en authorization?
3. Wat zijn policies en wanneer gebruik je ze?
4. Hoe voorkom je dat gebruikers elkaars data kunnen zien/bewerken?
5. Wat zijn query scopes en wat zijn hun voordelen?
6. Waarom is automated testing belangrijk voor een multi-user applicatie?
7. Wat is het verschil tussen `auth()->user()` en `Auth::user()`?

---

## Project Afronden

### Eindopdracht: Complete Feature Set
Zorg ervoor dat je applicatie de volgende features heeft:

**Core Features:**
- [x] User registratie en login
- [x] CRUD operaties voor tasks
- [x] Categories systeem
- [x] Filter en sorteer functionaliteit
- [x] Toggle complete status
- [x] User-specific data
- [x] Authorization met policies
- [x] Overdue task indicators

**Bonus Features (kies minstens 2):**
- [ ] Statistics dashboard
- [ ] Search functionaliteit
- [ ] Priority levels
- [ ] Task sharing
- [ ] Email notifications
- [ ] API endpoints
- [ ] Automated tests

### Code Quality Checklist
- [ ] Alle routes zijn beschermd met auth middleware
- [ ] Policies zijn geïmplementeerd voor alle task operaties
- [ ] Validatie is aanwezig op alle forms
- [ ] Error messages zijn gebruiksvriendelijk
- [ ] Code is georganiseerd en leesbaar
- [ ] Database queries zijn geoptimaliseerd (eager loading)
- [ ] Flash messages worden getoond na acties

---

## Conclusie

Gefeliciteerd! Je hebt een complete Laravel todo list applicatie gebouwd met:
- Multi-user support met authenticatie
- Complete CRUD functionaliteit
- Eloquent relaties (User, Task, Category)
- Authorization met policies
- Filters, zoeken en sorteren
- Clean code met Form Requests en Query Scopes
- (Optioneel) API endpoints en testing

Je hebt nu een solide basis in Laravel en bent klaar om complexere applicaties te bouwen!

### Volgende Stappen
- Bestudeer Laravel documentation voor geavanceerde features
- Bouw je eigen project met Laravel
- Leer over Laravel packages en ecosysteem
- Verdiep je in testing en deployment
