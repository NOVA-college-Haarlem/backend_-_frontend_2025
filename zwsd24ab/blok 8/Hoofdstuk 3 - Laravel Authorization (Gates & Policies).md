# Hoofdstuk 3

## Laravel Authorization — Gates & Policies

> **Nice to have**: Dit hoofdstuk is niet verplicht, maar wordt sterk aanbevolen. In bijna elk project heb je meerdere gebruikersrollen. Met Gates & Policies regel je netjes wie wat mag — zonder een wirwar van if-statements in je controllers.

---

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
