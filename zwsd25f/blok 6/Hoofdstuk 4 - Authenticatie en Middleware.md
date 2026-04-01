# Hoofdstuk 4 — Authenticatie en Middleware

In dit hoofdstuk zetten we de authenticatie aan die bij het opstarten al meegeleverd was via Laravel Breeze. We beveiligen routes met middleware, tonen content op basis van of iemand is ingelogd, en geven beheerders extra rechten voor het beheren van producten.

## Inhoudsopgave
- [Hoofdstuk 4 — Authenticatie en Middleware](#hoofdstuk-4--authenticatie-en-middleware)
  - [Inhoudsopgave](#inhoudsopgave)
  - [Leerdoelen](#leerdoelen)
  - [Opdracht 1: Breeze verkennen](#opdracht-1-breeze-verkennen)
    - [Opdracht 1.1: Wat heeft Breeze aangemaakt?](#opdracht-11-wat-heeft-breeze-aangemaakt)
    - [Opdracht 1.2: Registreren en inloggen](#opdracht-12-registreren-en-inloggen)
  - [Opdracht 2: De layout koppelen aan Breeze](#opdracht-2-de-layout-koppelen-aan-breeze)
  - [Opdracht 3: Routes beveiligen met middleware](#opdracht-3-routes-beveiligen-met-middleware)
    - [Opdracht 3.1: Test de beveiliging](#opdracht-31-test-de-beveiliging)
  - [Opdracht 4: Auth::user() gebruiken in views](#opdracht-4-authuser-gebruiken-in-views)
  - [Opdracht 5: Adminrol instellen](#opdracht-5-adminrol-instellen)
    - [Opdracht 5.1: Admin-controle in de controller](#opdracht-51-admin-controle-in-de-controller)
    - [Opdracht 5.2: Admin-knop in de navigatie verbergen](#opdracht-52-admin-knop-in-de-navigatie-verbergen)
  - [Opdracht 6: Gate gebruiken voor autorisatie](#opdracht-6-gate-gebruiken-voor-autorisatie)
    - [Opdracht 6.1: Gate toepassen in de view](#opdracht-61-gate-toepassen-in-de-view)
    - [Opdracht 6.2: Gate toepassen in de controller](#opdracht-62-gate-toepassen-in-de-controller)
  - [Opdracht 7: Tests](#opdracht-7-tests)
  - [Afronding / Reflectie](#afronding--reflectie)

## Leerdoelen
- Begrijpen wat Laravel Breeze heeft aangemaakt in het project.
- Routes beveiligen met de `auth`-middleware.
- De ingelogde gebruiker ophalen met `Auth::user()` en `auth()`.
- Content tonen of verbergen op basis van inlogstatus.
- Een eenvoudig rolsysteem implementeren met de `role`-kolom.
- Autorisatie toepassen met Laravel Gates.

---

## Opdracht 1: Breeze verkennen

Bij het aanmaken van het spelshop-project in Hoofdstuk 1 hebben we gekozen voor Laravel Breeze. Breeze heeft automatisch een compleet authenticatiesysteem aangemaakt. Laten we bekijken wat er is meegeleverd.

### Opdracht 1.1: Wat heeft Breeze aangemaakt?

Bekijk de volgende bestanden en mappen in VS Code:

| Locatie | Wat staat er? |
|---------|---------------|
| `routes/auth.php` | Routes voor login, registratie, wachtwoord vergeten |
| `app/Http/Controllers/Auth/` | Controllers voor elke auth-actie |
| `resources/views/auth/` | Views voor login, registratie etc. |
| `resources/views/layouts/` | Breeze-layouts (`app.blade.php`, `guest.blade.php`) |
| `database/migrations/` | De `users`-tabel was al aanwezig |

1. Open `routes/auth.php` en bekijk welke routes er zijn.
2. Zoek de route voor `login` en `register`.
3. Open `app/Http/Controllers/Auth/RegisteredUserController.php` en lees de `store`-methode. Wat gebeurt er als iemand zich registreert?

> **Let op**: Breeze heeft een eigen `layouts/app.blade.php` aangemaakt. In Hoofdstuk 3 hebben wij ook een layout aangemaakt. We gaan beide samenvoegen in de volgende opdracht.

### Opdracht 1.2: Registreren en inloggen

1. Ga naar `http://spelshop.test/register`.
2. Registreer een account met je eigen naam en e-mailadres.
3. Je wordt automatisch ingelogd en doorgestuurd naar het dashboard.
4. Ga naar `http://spelshop.test/logout` of klik op "Log out" om uit te loggen.
5. Log opnieuw in via `http://spelshop.test/login`.

**Verwacht resultaat:** Je kunt registreren, inloggen en uitloggen.

---

## Opdracht 2: De layout koppelen aan Breeze

Breeze gebruikt `resources/views/layouts/app.blade.php` als standaard layout voor ingelogde pagina's. We passen onze eigen layout aan zodat de navigatiebalk de Breeze-navigatie gebruikt en een login/logout-knop toont.

1. Open `resources/views/layouts/app.blade.php` (onze eigen layout uit Hoofdstuk 3).
2. Vervang de inhoud volledig met:

```html
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Spelshop - @yield('title', 'Home')</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
        <div class="container">
            <a class="navbar-brand" href="/">Spelshop</a>
            <div class="navbar-nav me-auto">
                <a class="nav-link" href="{{ route('products.index') }}">Producten</a>
            </div>

            <div class="navbar-nav">
                @auth
                    <span class="navbar-text text-light me-3">
                        Welkom, {{ Auth::user()->name }}
                    </span>
                    <form action="{{ route('logout') }}" method="POST" class="d-inline">
                        @csrf
                        <button type="submit" class="btn btn-outline-light btn-sm">Uitloggen</button>
                    </form>
                @else
                    <a class="nav-link" href="{{ route('login') }}">Inloggen</a>
                    <a class="nav-link" href="{{ route('register') }}">Registreren</a>
                @endauth
            </div>
        </div>
    </nav>

    <div class="container">
        @if(session('success'))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                {{ session('success') }}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        @endif

        @if(session('error'))
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                {{ session('error') }}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        @endif

        @yield('content')
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
```

> **`@auth` en `@guest`**: Dit zijn Blade-directives die controleren of iemand ingelogd is.
> - `@auth` → content wordt alleen getoond aan ingelogde gebruikers
> - `@guest` → content wordt alleen getoond aan niet-ingelogde gebruikers
> - `@else` mag tussen beide gebruikt worden

3. Herlaad de pagina. Je ziet nu "Welkom, [naam]" als je ingelogd bent, of "Inloggen / Registreren" als je dat niet bent.

---

## Opdracht 3: Routes beveiligen met middleware

Op dit moment kan iedereen — ook zonder account — producten aanmaken, bewerken en verwijderen. Dat willen we niet. We beveiligen de "schrijf"-routes met de `auth`-middleware.

Middleware is een filter dat wordt uitgevoerd vóórdat een route-actie plaatsvindt. De `auth`-middleware controleert of de gebruiker is ingelogd. Zo niet, dan wordt de gebruiker doorgestuurd naar de loginpagina.

1. Open `routes/web.php`.
2. Splits de resource-route op in een publiek deel (lezen) en een beveiligd deel (schrijven):

```php
use App\Http\Controllers\ProductController;

// Publiek: iedereen mag producten bekijken
Route::get('/products', [ProductController::class, 'index'])->name('products.index');
Route::get('/products/{product}', [ProductController::class, 'show'])->name('products.show');

// Beveiligd: alleen ingelogde gebruikers
Route::middleware('auth')->group(function () {
    Route::get('/products/create', [ProductController::class, 'create'])->name('products.create');
    Route::post('/products', [ProductController::class, 'store'])->name('products.store');
    Route::get('/products/{product}/edit', [ProductController::class, 'edit'])->name('products.edit');
    Route::put('/products/{product}', [ProductController::class, 'update'])->name('products.update');
    Route::delete('/products/{product}', [ProductController::class, 'destroy'])->name('products.destroy');
});
```

> **`Route::middleware('auth')->group(...)`**: Alle routes binnen deze groep vereisen een ingelogde gebruiker. Als iemand niet is ingelogd, stuurt Laravel die automatisch door naar `/login`.

### Opdracht 3.1: Test de beveiliging

1. Log uit.
2. Ga naar `http://spelshop.test/products/create`.
3. Je wordt doorgestuurd naar de loginpagina.
4. Log in en probeer opnieuw — nu werkt het wel.

```bash
php artisan test --group=AuthMiddlewareTest
```

---

## Opdracht 4: Auth::user() gebruiken in views

Nu we weten wie er is ingelogd, kunnen we de gebruikersinformatie tonen in views en gebruiken in de controller.

1. Open de `show`-view (`resources/views/products/show.blade.php`).
2. Voeg onderaan de pagina een conditieblok toe voor de reviewknop:

```html
@auth
    <div class="mt-4">
        <h4>Schrijf een review</h4>
        <p>Je bent ingelogd als <strong>{{ Auth::user()->name }}</strong>.</p>
        <a href="#" class="btn btn-primary">Review schrijven</a>
        {{-- In Hoofdstuk 5 bouwen we dit verder uit --}}
    </div>
@else
    <div class="mt-4 alert alert-info">
        <a href="{{ route('login') }}">Log in</a> om een review te schrijven.
    </div>
@endauth
```

3. Open de `index`-view en verberg de "Nieuw product"-knop voor gasten:

```html
@auth
    <a href="{{ route('products.create') }}" class="btn btn-primary">+ Nieuw product</a>
@endauth
```

4. Verberg ook de "Bewerk"- en "Verwijder"-knoppen in de tabel voor gasten:

```html
<td>
    <a href="{{ route('products.show', $product) }}" class="btn btn-sm btn-info">Bekijk</a>
    @auth
        <a href="{{ route('products.edit', $product) }}" class="btn btn-sm btn-warning">Bewerk</a>
    @endauth
</td>
```

> In de controller checken we later op rol — hier verbergen we alleen de knoppen in de UI. Iemand die de URL direct intypt, wordt nog steeds geblokkeerd door de middleware uit opdracht 3.

---

## Opdracht 5: Adminrol instellen

In het ERD hebben we een `roles`-tabel en een `role_id` op de `users`-tabel. We gebruiken dit om een onderscheid te maken tussen gewone gebruikers en beheerders.

1. Open de seeder voor rollen. Maak hem aan als hij nog niet bestaat:
   ```bash
   php artisan make:seeder RolesSeeder
   ```

2. Vul `database/seeders/RolesSeeder.php` in:
   ```php
   use App\Models\Role;

   public function run()
   {
       Role::insert([
           ['name' => 'admin'],
           ['name' => 'klant'],
       ]);
   }
   ```

3. Voeg de seeder toe aan `DatabaseSeeder.php` vóór de andere seeders:
   ```php
   $this->call([
       RolesSeeder::class,
       CategoriesSeeder::class,
       ProductsSeeder::class,
       PricesSeeder::class,
       ReviewsSeeder::class,
   ]);
   ```

4. Pas de `UsersSeeder` aan (of maak hem aan) om een admin-account toe te voegen:
   ```bash
   php artisan make:seeder UsersSeeder
   ```

   ```php
   use App\Models\User;
   use Illuminate\Support\Facades\Hash;

   public function run()
   {
       User::create([
           'name'     => 'Admin',
           'email'    => 'admin@spelshop.nl',
           'password' => Hash::make('password'),
           'role_id'  => 1, // admin
       ]);
   }
   ```

5. Voeg de UsersSeeder toe aan DatabaseSeeder:
   ```php
   $this->call([
       RolesSeeder::class,
       UsersSeeder::class,
       CategoriesSeeder::class,
       ...
   ]);
   ```

6. Draai alles opnieuw:
   ```bash
   php artisan migrate:fresh --seed
   ```

7. Log in met `admin@spelshop.nl` / `password`.

### Opdracht 5.1: Admin-controle in de controller

We voegen een hulpfunctie toe aan het `User`-model om eenvoudig te controleren of iemand admin is:

1. Open `app/Models/User.php`.
2. Voeg de volgende methode toe:
   ```php
   public function isAdmin(): bool
   {
       return $this->role?->name === 'admin';
   }
   ```

3. Open de `ProductController`. Voeg bovenaan in de `store`, `update` en `destroy`-methoden een controle toe:
   ```php
   public function store(Request $request)
   {
       if (!Auth::user()->isAdmin()) {
           abort(403, 'Alleen beheerders mogen producten aanmaken.');
       }

       // rest van de methode...
   }
   ```

   Doe hetzelfde voor `update` en `destroy`.

> **`abort(403)`**: Gooit een HTTP 403 Forbidden fout. Laravel toont automatisch een foutpagina. Dit is een vangnet naast de UI-aanpassingen.

### Opdracht 5.2: Admin-knop in de navigatie verbergen

Pas de layout aan zodat de "Nieuw product"-knop alleen voor admins zichtbaar is:

```html
@auth
    @if(Auth::user()->isAdmin())
        <a href="{{ route('products.create') }}" class="btn btn-primary">+ Nieuw product</a>
    @endif
@endauth
```

Doe hetzelfde voor de "Bewerk"- en "Verwijder"-knoppen in de views.

---

## Opdracht 6: Gate gebruiken voor autorisatie

Laravel Gates zijn een nettere manier om autorisatielogica centraal te definiëren. In plaats van `isAdmin()`-checks overal in de code, definiëren we één Gate die we overal kunnen hergebruiken.

1. Open `app/Providers/AppServiceProvider.php`.
2. Voeg bovenaan de imports toe:
   ```php
   use Illuminate\Support\Facades\Gate;
   use App\Models\User;
   ```
3. Definieer een Gate in de `boot`-methode:
   ```php
   public function boot(): void
   {
       Gate::define('beheer-producten', function (User $user) {
           return $user->isAdmin();
       });
   }
   ```

### Opdracht 6.1: Gate toepassen in de view

```html
@can('beheer-producten')
    <a href="{{ route('products.create') }}" class="btn btn-primary">+ Nieuw product</a>
@endcan
```

> **`@can`**: Blade-directive die de Gate-definitie aanroept voor de ingelogde gebruiker. Veel leesbaarder dan geneste `@auth`-`@if`-blokken.

### Opdracht 6.2: Gate toepassen in de controller

Vervang de handmatige `isAdmin()`-check in de controller door:

```php
public function store(Request $request)
{
    Gate::authorize('beheer-producten');

    // rest van de methode...
}
```

`Gate::authorize()` gooit automatisch een 403 als de Gate-check faalt — je hoeft geen `abort()` meer te schrijven.

Pas dit toe in `store`, `update` en `destroy`.

---

## Opdracht 7: Tests

```bash
php artisan test --group=AuthMiddlewareTest
php artisan test --group=AdminAuthTest
```

Controleer dat de volgende scenario's werken:
- Een niet-ingelogde gebruiker die `/products/create` bezoekt, wordt doorgestuurd naar `/login`.
- Een ingelogde gebruiker zonder adminrol krijgt een 403 bij het opslaan van een product.
- Een admin kan producten aanmaken, bewerken en verwijderen.
- De "Nieuw product"-knop is verborgen voor gasten en gewone gebruikers.

---

## Afronding / Reflectie

In dit hoofdstuk heb je:
- Geleerd wat Laravel Breeze heeft aangemaakt en hoe het authenticatiesysteem werkt.
- Routes beveiligd met `auth`-middleware zodat niet-ingelogde gebruikers worden doorgestuurd.
- De ingelogde gebruiker gebruikt via `Auth::user()` en de `@auth`-directive.
- Een eenvoudig rolsysteem gebouwd met de `roles`-tabel en `isAdmin()`.
- Autorisatielogica gecentraliseerd met een Laravel Gate en `@can`.

**Verschil authenticatie vs. autorisatie:**
- **Authenticatie**: Ben jij wie je zegt dat je bent? (inloggen)
- **Autorisatie**: Mag jij dit doen? (rechten controleren)

**Volgende stap:** Reviews toevoegen als ingelogde klant.
