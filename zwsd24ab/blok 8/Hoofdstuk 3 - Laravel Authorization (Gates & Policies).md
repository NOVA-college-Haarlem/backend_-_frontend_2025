# Hoofdstuk 3

## Laravel Authorization — Gates & Policies

> **Nice to have**: Dit hoofdstuk is niet verplicht, maar wordt sterk aanbevolen. In bijna elk project heb je meerdere gebruikersrollen. Met Gates & Policies regel je netjes wie wat mag — zonder een wirwar van if-statements in je controllers.

---

## 3.1 Theorie

### Authenticatie vs. Autorisatie

Je kent al **authenticatie**: controleren *wie* iemand is. Laravel Breeze regelt dit voor je — login, registratie, sessies.

**Autorisatie** gaat een stap verder: controleren *wat* iemand mag doen.

Voorbeeld: een admin mag alle tickets verwijderen, een gewone gebruiker alleen zijn eigen tickets.

Zonder autorisatie zou je dit schrijven:

```php
public function destroy(Ticket $ticket)
{
    if (auth()->user()->role !== 'admin' && auth()->id() !== $ticket->user_id) {
        abort(403);
    }
    $ticket->delete();
}
```

Met autorisatie wordt dit:

```php
public function destroy(Ticket $ticket)
{
    $this->authorize('delete', $ticket);
    $ticket->delete();
}
```

Veel leesbaarder, en de logica staat op één plek.

---

### Gates

Een Gate is een simpele autorisatiecheck voor acties die niet aan een specifiek model gekoppeld zijn. Je definieert gates in `app/Providers/AppServiceProvider.php`.

```php
use Illuminate\Support\Facades\Gate;

public function boot(): void
{
    Gate::define('access-admin', function (User $user) {
        return $user->role === 'admin';
    });
}
```

Gebruik in een controller:

```php
if (!Gate::allows('access-admin')) {
    abort(403);
}
```

Of als middleware op een route:

```php
Route::get('/admin', [AdminController::class, 'index'])->middleware('can:access-admin');
```

Gebruik in een Blade-template:

```blade
@can('access-admin')
    <a href="/admin">Beheer</a>
@endcan
```

---

### Policies

Een Policy is een klasse die autorisatieregels bundelt voor één specifiek model. Dit gebruik je wanneer je per actie (view, create, update, delete) wilt bepalen wie iets mag.

**Policy aanmaken:**

```bash
php artisan make:policy TicketPolicy --model=Ticket
```

Dit maakt het bestand `app/Policies/TicketPolicy.php` aan met methodes voor de standaard CRUD-acties.

**Voorbeeld Policy:**

```php
class TicketPolicy
{
    // Mag de gebruiker alle tickets zien?
    public function viewAny(User $user): bool
    {
        return $user->role === 'admin' || $user->role === 'medewerker';
    }

    // Mag de gebruiker dit specifieke ticket zien?
    public function view(User $user, Ticket $ticket): bool
    {
        return $user->id === $ticket->user_id || $user->role === 'admin';
    }

    // Mag de gebruiker een ticket aanmaken?
    public function create(User $user): bool
    {
        return true; // Iedereen mag een ticket aanmaken
    }

    // Mag de gebruiker dit ticket aanpassen?
    public function update(User $user, Ticket $ticket): bool
    {
        return $user->id === $ticket->user_id || $user->role === 'admin';
    }

    // Mag de gebruiker dit ticket verwijderen?
    public function delete(User $user, Ticket $ticket): bool
    {
        return $user->role === 'admin';
    }
}
```

**Policy registreren** (Laravel doet dit automatisch als je de conventie volgt — model `Ticket` → policy `TicketPolicy`). Check of het model is gekoppeld in `app/Providers/AuthServiceProvider.php` als het niet werkt.

**Policy gebruiken in controller:**

```php
public function update(Request $request, Ticket $ticket)
{
    $this->authorize('update', $ticket);
    // ... rest van de logica
}
```

**Policy gebruiken in Blade:**

```blade
@can('update', $ticket)
    <a href="{{ route('tickets.edit', $ticket) }}">Bewerken</a>
@endcan

@can('delete', $ticket)
    <form method="POST" action="{{ route('tickets.destroy', $ticket) }}">
        @csrf @method('DELETE')
        <button type="submit">Verwijderen</button>
    </form>
@endcan
```

---

### Rollen bijhouden in je database

Voeg een `role`-kolom toe aan je `users`-tabel via een migration:

```bash
php artisan make:migration add_role_to_users_table --table=users
```

```php
public function up(): void
{
    Schema::table('users', function (Blueprint $table) {
        $table->string('role')->default('user'); // 'user', 'medewerker', 'admin'
    });
}
```

Je kunt ook een enum gebruiken voor extra veiligheid:

```php
$table->enum('role', ['user', 'medewerker', 'admin'])->default('user');
```

---

## Opdracht 1 – Rollen bepalen

1. Bekijk de gebruikersrollen in jouw project (zie de projectomschrijving).
2. Maak een tabel: welke rol mag welke actie uitvoeren?

Voorbeeld:

| Actie | Gast | Gebruiker | Medewerker | Admin |
|-------|------|-----------|------------|-------|
| Evenement bekijken | ✓ | ✓ | ✓ | ✓ |
| Evenement aanmaken | ✗ | ✗ | ✓ | ✓ |
| Aanmelding verwijderen | ✗ | Eigen | Alle | Alle |

3. Maak de migration aan voor de `role`-kolom in `users`.

---

## Opdracht 2 – Gates of Policies (kies wat past)

Kies minimaal **één model** in jouw project en implementeer daarvoor een Policy.

1. Maak de Policy aan met `php artisan make:policy`.
2. Implementeer de relevante methodes op basis van jouw rollenmatrix.
3. Gebruik `$this->authorize()` in de bijbehorende controller.
4. Verberg knoppen in Blade met `@can`.

Test het: log in als gebruiker met verschillende rollen en controleer of de juiste acties wel/niet beschikbaar zijn.

---

## Opdracht 3 – Bonus: Middleware voor admin-pagina's

Wil je een hele groep routes afschermen voor niet-admins? Gebruik een Gate als middleware:

```php
Route::middleware(['auth', 'can:access-admin'])->group(function () {
    Route::get('/admin/users', [AdminController::class, 'users']);
    Route::get('/admin/dashboard', [AdminController::class, 'dashboard']);
});
```

Implementeer dit voor de beheerpagina's in jouw project.

---

## 3.2 Practicum: Autorisatie in de Todo List

In blok 6 heb je de **Todo List** gebouwd — een Laravel-app met taken, categorieën en authenticatie via Breeze. Die app breiden we nu uit met autorisatie.

**Doel**: aan het einde van dit practicum geldt het volgende:
- Gewone gebruikers kunnen alleen hun eigen taken bewerken en verwijderen
- Admins kunnen alle taken beheren
- Alleen admins mogen categorieën aanmaken, bewerken en verwijderen
- Knoppen in de interface worden automatisch verborgen voor wie geen toegang heeft

Open je `todolist`-project in VS Code en volg de stappen hieronder.

---

### Stap 1 – `user_id` toevoegen aan taken

Taken horen bij een gebruiker. Zonder deze koppeling kunnen we niet controleren wie de eigenaar is.

**Migration aanmaken:**

```bash
php artisan make:migration add_user_id_to_tasks_table --table=tasks
```

Open de migration en voeg de kolom toe:

```php
public function up(): void
{
    Schema::table('tasks', function (Blueprint $table) {
        $table->foreignId('user_id')->after('id')->constrained()->cascadeOnDelete();
    });
}

public function down(): void
{
    Schema::table('tasks', function (Blueprint $table) {
        $table->dropForeignIdFor(\App\Models\User::class);
    });
}
```

**Migration uitvoeren:**

```bash
php artisan migrate
```

**Relatie toevoegen aan het Task-model** (`app/Models/Task.php`):

```php
public function user(): BelongsTo
{
    return $this->belongsTo(User::class);
}
```

**Relatie toevoegen aan het User-model** (`app/Models/User.php`):

```php
public function tasks(): HasMany
{
    return $this->hasMany(Task::class);
}
```

**`store`-methode aanpassen** in `TaskController` zodat de ingelogde gebruiker automatisch als eigenaar wordt opgeslagen:

```php
public function store(Request $request)
{
    $validated = $request->validate([
        'title'       => 'required|string|max:255',
        'description' => 'nullable|string',
        'due_date'    => 'nullable|date',
    ]);

    $validated['user_id'] = auth()->id();

    Task::create($validated);

    return redirect()->route('tasks.index')->with('success', 'Taak aangemaakt!');
}
```

---

### Stap 2 – Rollen toevoegen aan gebruikers

**Migration aanmaken:**

```bash
php artisan make:migration add_role_to_users_table --table=users
```

```php
public function up(): void
{
    Schema::table('users', function (Blueprint $table) {
        $table->enum('role', ['user', 'admin'])->default('user')->after('email');
    });
}

public function down(): void
{
    Schema::table('users', function (Blueprint $table) {
        $table->dropColumn('role');
    });
}
```

```bash
php artisan migrate
```

---

### Stap 3 – Testgebruikers aanmaken via de seeder

Open `database/seeders/DatabaseSeeder.php` en voeg twee vaste testgebruikers toe:

```php
use App\Models\User;

public function run(): void
{
    User::factory()->create([
        'name'     => 'Admin Gebruiker',
        'email'    => 'admin@todolist.test',
        'password' => bcrypt('password'),
        'role'     => 'admin',
    ]);

    User::factory()->create([
        'name'     => 'Gewone Gebruiker',
        'email'    => 'user@todolist.test',
        'password' => bcrypt('password'),
        'role'     => 'user',
    ]);

    $this->call([
        TasksSeeder::class,
        CategoriesSeeder::class,
    ]);
}
```

Database opnieuw opbouwen met testdata:

```bash
php artisan migrate:fresh --seed
```

Je kunt nu inloggen als `admin@todolist.test` (wachtwoord: `password`) of als `user@todolist.test` om het verschil te testen.

---

### Stap 4 – Gate aanmaken voor categorieënbeheer

Categorieën zijn globale data — ze horen niet bij één specifiek record. Dat is precies waar een **Gate** voor is.

Open `app/Providers/AppServiceProvider.php` en voeg de Gate toe in de `boot`-methode:

```php
use Illuminate\Support\Facades\Gate;
use App\Models\User;

public function boot(): void
{
    Gate::define('manage-categories', function (User $user) {
        return $user->role === 'admin';
    });
}
```

**Routes afschermen** in `routes/web.php`:

```php
Route::middleware(['auth', 'can:manage-categories'])->group(function () {
    Route::get('/categories/create', [CategoryController::class, 'create'])->name('categories.create');
    Route::post('/categories',       [CategoryController::class, 'store'])->name('categories.store');
    Route::get('/categories/{category}/edit', [CategoryController::class, 'edit'])->name('categories.edit');
    Route::put('/categories/{category}',      [CategoryController::class, 'update'])->name('categories.update');
    Route::delete('/categories/{category}',   [CategoryController::class, 'destroy'])->name('categories.destroy');
});
```

> De `can:manage-categories`-middleware stuurt niet-admins automatisch naar een 403-foutpagina als ze de URL direct proberen te bereiken.

**Knop verbergen in Blade** (`resources/views/categories/index.blade.php`):

```blade
@can('manage-categories')
    <a href="{{ route('categories.create') }}">Nieuwe categorie</a>
@endcan
```

---

### Stap 5 – TaskPolicy aanmaken

Een Policy bundelt alle autorisatieregels voor het `Task`-model op één plek.

```bash
php artisan make:policy TaskPolicy --model=Task
```

Open `app/Policies/TaskPolicy.php` en vul de methodes in:

```php
class TaskPolicy
{
    // Mag de gebruiker alle taken zien? (bijv. een admin-overzicht)
    public function viewAny(User $user): bool
    {
        return $user->role === 'admin';
    }

    // Mag de gebruiker deze taak zien?
    public function view(User $user, Task $task): bool
    {
        return $user->id === $task->user_id || $user->role === 'admin';
    }

    // Mag de gebruiker een taak aanmaken? Iedereen die is ingelogd.
    public function create(User $user): bool
    {
        return true;
    }

    // Mag de gebruiker deze taak bewerken?
    public function update(User $user, Task $task): bool
    {
        return $user->id === $task->user_id || $user->role === 'admin';
    }

    // Mag de gebruiker deze taak verwijderen?
    public function delete(User $user, Task $task): bool
    {
        return $user->id === $task->user_id || $user->role === 'admin';
    }
}
```

---

### Stap 6 – Policy gebruiken in de controller

Open `app/Http/Controllers/TaskController.php` en voeg `$this->authorize()` toe aan de relevante methodes:

```php
public function edit(Task $task)
{
    $this->authorize('update', $task);
    return view('tasks.edit', compact('task'));
}

public function update(Request $request, Task $task)
{
    $this->authorize('update', $task);

    $task->update($request->validate([
        'title'       => 'required|string|max:255',
        'description' => 'nullable|string',
        'due_date'    => 'nullable|date',
        'completed'   => 'boolean',
    ]));

    return redirect()->route('tasks.index')->with('success', 'Taak bijgewerkt!');
}

public function destroy(Task $task)
{
    $this->authorize('delete', $task);
    $task->delete();

    return redirect()->route('tasks.index')->with('success', 'Taak verwijderd!');
}
```

> Als iemand zonder toestemming toch de URL direct probeert te bereiken, gooit Laravel automatisch een 403-fout. Je hoeft dit niet zelf af te vangen.

---

### Stap 7 – Knoppen verbergen in Blade

Pas de takenlijst aan (`resources/views/tasks/index.blade.php`) zodat bewerk- en verwijderknoppen alleen zichtbaar zijn als de gebruiker er recht op heeft:

```blade
@foreach ($tasks as $task)
    <div>
        <p>{{ $task->title }}</p>

        @can('update', $task)
            <a href="{{ route('tasks.edit', $task) }}">Bewerken</a>
        @endcan

        @can('delete', $task)
            <form method="POST" action="{{ route('tasks.destroy', $task) }}">
                @csrf
                @method('DELETE')
                <button type="submit">Verwijderen</button>
            </form>
        @endcan
    </div>
@endforeach
```

---

### Controleren of het werkt

Log in als `user@todolist.test` en maak een taak aan. Probeer daarna de taak van iemand anders te bewerken via de URL (`/tasks/1/edit`). Je krijgt een 403-fout.

Log in als `admin@todolist.test`. Je kunt alle taken bewerken en verwijderen, en je ziet de knop "Nieuwe categorie" in het categorieoverzicht.

| Wat te testen | Ingelogd als | Verwacht resultaat |
|---|---|---|
| Eigen taak bewerken | user | ✓ Toegestaan |
| Taak van een ander bewerken (via URL) | user | ✗ 403 |
| Alle taken bewerken | admin | ✓ Toegestaan |
| "Nieuwe categorie"-knop zichtbaar | user | ✗ Verborgen |
| "Nieuwe categorie"-knop zichtbaar | admin | ✓ Zichtbaar |
| `/categories/create` direct bezoeken | user | ✗ 403 |
