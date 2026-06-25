# Hoofdstuk 8 — Authenticatie en Middleware

In dit hoofdstuk leer je hoe je bepaalt wie mag inloggen en wie welke acties mag uitvoeren in je webapp.

- **Laravel Breeze** is een kant-en-klaar startpakket voor inloggen, registreren, uitloggen en wachtwoordfunctionaliteit.
- **Middleware** is een controlelaag voor je routes. Die checkt bijvoorbeeld eerst of iemand is ingelogd, voordat een pagina wordt geopend.
- **Inlogstatus** betekent: is een gebruiker op dit moment ingelogd (**ja**) of niet (**nee**).

We controleren eerst of Breeze al aanwezig is (en installeren het indien nodig). Daarna beveiligen we routes met middleware, tonen we andere content voor ingelogde en niet-ingelogde gebruikers, en geven we beheerders extra rechten voor het beheren van producten.

### Waar zie je dit terug in je project?

| Onderdeel | Type bestand | Locatie in je project | Wat gebeurt daar? |
|---|---|---|---|
| Breeze-routes | PHP routebestand | `routes/auth.php` | Login, registratie, logout en wachtwoordroutes |
| Website-routes | PHP routebestand | `routes/web.php` | Hier koppel je middleware zoals `auth` aan routes |
| Auth-controllers | PHP controllers | `app/Http/Controllers/Auth/` | Logica voor inloggen, registreren, wachtwoord reset |
| User-model | PHP model | `app/Models/User.php` | Ingelogde gebruiker, rollen en helpers zoals `isAdmin()` |
| Middleware | PHP classes | `app/Http/Middleware/` | Extra controles voordat de route/controller wordt uitgevoerd |
| Login/register pagina's | Blade views | `resources/views/auth/` | Formulieren voor inloggen en registreren |
| Layout en navigatie | Blade views | `resources/views/components/layout.blade.php` + `resources/views/components/auth-menubar.blade.php` | Bestaande layout blijft; auth-menubar wordt apart ingeladen |

Kort samengevat:
- **Models** (zoals `User.php`) bevatten data en hulpfuncties.
- **Views** (in `resources/views`) tonen wat de gebruiker ziet.
- **Controllers** verwerken acties van formulieren en routes.
- **Routes + middleware** bepalen wie welke pagina/methode mag gebruiken.

## Inhoudsopgave
- [Hoofdstuk 8 — Authenticatie en Middleware](#hoofdstuk-8--authenticatie-en-middleware)
  - [Inhoudsopgave](#inhoudsopgave)
    - [Waar zie je dit terug in je project?](#waar-zie-je-dit-terug-in-je-project)
  - [Leerdoelen](#leerdoelen)
    - [Breeze installeren (indien nodig)](#breeze-installeren-indien-nodig)
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
    - [Opdracht 7: Controleren](#opdracht-7-controleren)
  - [Afronding / Reflectie](#afronding--reflectie)

## Leerdoelen
- Begrijpen wat Laravel Breeze heeft aangemaakt in het project.
- Routes beveiligen met de `auth`-middleware.
- De ingelogde gebruiker ophalen met `Auth::user()` en `auth()`.
- Content tonen of verbergen op basis van inlogstatus.
- Een eenvoudig rolsysteem implementeren met de `role`-kolom.
- Autorisatie toepassen met Laravel Gates.

---

## Breeze installeren (indien nodig)

Controleer eerst of Breeze al aanwezig is:

1. Kijk of `routes/auth.php` bestaat.
2. Controleer of routes zoals `login` en `register` beschikbaar zijn.
3. Gebruik dit check-commando:

```bash
php artisan route:list --name=login
php artisan route:list --name=register
```

Als Breeze nog niet aanwezig is, voer dan uit:

```bash
composer require laravel/breeze --dev
php artisan breeze:install blade
php artisan migrate
npm install
npm run build
```

Let op: Breeze overschrijft de `routes/web.php`. Zet de volgende inhoud weer terug in de aangepaste `web.php`:

```php
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\PriceController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ReviewController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('home');
});

Route::get('/over', function () {
    return view('over');
});

Route::get('/categories', [CategoryController::class, 'index']);
Route::get('/categories/{category}', [CategoryController::class, 'show']);

Route::resource('products', ProductController::class);

Route::get('/prices', [PriceController::class, 'index']);

Route::get('/reviews', [ReviewController::class, 'index']);
```

### Opdracht 0.1 Commit wijzigingen

Commit alle bestanden die bij de bovenstaande acties gewijzigd of aangemaakt zijn.
---

## Opdracht 1: Breeze verkennen

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

> **Let op**: Breeze heeft een eigen `layouts/app.blade.php` aangemaakt, maar in dit project werken we verder met onze bestaande `views/components/layout.blade.php`.

### Opdracht 1.2: Registreren en inloggen

1. Ga naar `http://spelshop.test/register`.
2. Registreer een account met je eigen naam en e-mailadres.
3. Je wordt automatisch ingelogd en doorgestuurd naar het dashboard.
4. Ga naar `http://spelshop.test/logout` of klik op "Log out" om uit te loggen.
5. Log opnieuw in via `http://spelshop.test/login`.

**Verwacht resultaat:** Je kunt registreren, inloggen en uitloggen.

---

## Opdracht 2: De layout koppelen aan Breeze

Breeze levert standaard een eigen layout, maar in dit project behouden we onze bestaande `views/components/layout.blade.php`. We voegen alleen een aparte auth-menubar toe en laden die in in de bestaande layout.

1. Maak een nieuw componentbestand aan: `resources/views/components/auth-menubar.blade.php`.
2. Zet daar deze inhoud in:

```html
<div class="navbar-nav ms-auto">
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
```

3. Open je bestaande layout: `resources/views/components/layout.blade.php`.
4. Voeg in de navbar (naast je bestaande links) alleen deze regel toe:

```html
<x-auth-menubar />
```

> **`@auth` en `@guest`**: Dit zijn Blade-directives die controleren of iemand ingelogd is.
> - `@auth` → content wordt alleen getoond aan ingelogde gebruikers
> - `@guest` → content wordt alleen getoond aan niet-ingelogde gebruikers
> - `@else` mag tussen beide gebruikt worden

6. Herlaad de pagina. Je ziet nu "Welkom, [naam]" als je ingelogd bent, of "Inloggen / Registreren" als je dat niet bent, zonder je bestaande layout te vervangen.

---

## Opdracht 3: Routes beveiligen met middleware

Op dit moment kan iedereen — ook zonder account — producten aanmaken, bewerken en verwijderen. Dat willen we niet. We beveiligen de "schrijf"-routes met de `auth`-middleware.

Middleware is een filter dat wordt uitgevoerd vóórdat een route-actie plaatsvindt. De `auth`-middleware controleert of de gebruiker is ingelogd. Zo niet, dan wordt de gebruiker doorgestuurd naar de loginpagina.

1. Open `routes/web.php`.
2. Splits de resource-route op in een publiek deel (lezen) en een beveiligd deel (schrijven):

```php
// Beveiligd: alleen ingelogde gebruikers (de overige 5 routes)
Route::middleware('auth')->group(function () {
    Route::resource('products', ProductController::class)
        ->except(['index', 'show']);
});

// Publiek: iedereen mag producten bekijken (2 van de 7 routes)
Route::resource('products', ProductController::class)
    ->only(['index', 'show']);
```

> **`Route::middleware('auth')->group(...)`**: Alle routes binnen deze groep vereisen een ingelogde gebruiker. Als iemand niet is ingelogd, stuurt Laravel die automatisch door naar `/login`.

### Opdracht 3.1: Test de beveiliging

1. Log uit.
2. Ga naar `http://spelshop.test/products/create`.
3. Je wordt doorgestuurd naar de loginpagina.
4. Log in en probeer opnieuw — nu werkt het wel.

---

## Opdracht 4: Auth::user() gebruiken in views

Nu we weten wie er is ingelogd, kunnen we de gebruikersinformatie tonen in views en gebruiken in de controller.

1. Open de `show`-view van producten (`resources/views/products/show.blade.php`).
2. Voeg onderaan de pagina een conditieblok toe voor de reviewknop:

```html
@auth
    <div class="mt-4">
        <h4>Schrijf een review</h4>
        <p>Je bent ingelogd als <strong>{{ Auth::user()->name }}</strong>.</p>
        <a href="#" class="btn btn-primary">Review schrijven</a>
        {{-- In Hoofdstuk 9 bouwen we dit verder uit --}}
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

> **Belangrijk**: `Role` hoort niet bij Laravel Breeze. Dit model en deze tabel maak je zelf op basis van je eigen ERD.

1. Heb je Hoofdstuk 6 gedaan? Gebruik dan diezelfde modeldefinitie en migrations. Je hoeft `Role` niet opnieuw aan te maken.

2. Controleer dat je modelrelaties uit Hoofdstuk 6 aanwezig zijn:
   ```php
   // app/Models/Role.php
   protected $fillable = ['name'];

   public function users()
   {
       return $this->hasMany(User::class);
   }
   ```

   ```php
   // app/Models/User.php
   public function role()
   {
       return $this->belongsTo(Role::class);
   }
   ```

3. Controleer ook dat `users.role_id` bestaat met een foreign key naar `roles.id`.

4. Als je iets hebt aangepast, draai dan:
   ```bash
   php artisan migrate
   ```

5. Open de seeder voor rollen. Maak hem aan als hij nog niet bestaat:
   ```bash
   php artisan make:seeder RolesSeeder
   ```

6. Vul `database/seeders/RolesSeeder.php` in:
   ```php
   use App\Models\Role;

   public function run()
   {
       Role::insert([
           ['name' => 'admin'],
           ['name' => 'medewerker'],
           ['name' => 'klant'],
       ]);
   }
   ```

7. Voeg de seeder toe aan `DatabaseSeeder.php` vóór de andere seeders:
   ```php
   $this->call([
       RolesSeeder::class,
       CategoriesSeeder::class,
       ProductsSeeder::class,
       PricesSeeder::class,
       ReviewsSeeder::class,
   ]);
   ```

8. Pas de `UsersSeeder` aan (of maak hem aan) om een admin-account toe te voegen:
   ```bash
   php artisan make:seeder UsersSeeder
   ```

   ```php
   use App\Models\Role;
   use App\Models\User;
   use Illuminate\Support\Facades\Hash;

   public function run()
   {
       User::create([
           'name'     => 'Admin',
           'email'    => 'admin@spelshop.nl',
           'password' => Hash::make('password'),
           'role_id'  => Role::where('name', 'admin')->value('id'),
       ]);
   }
   ```

9. Voeg de UsersSeeder toe aan DatabaseSeeder:
   ```php
   $this->call([
       RolesSeeder::class,
       UsersSeeder::class,
       CategoriesSeeder::class,
       ...
   ]);
   ```

10. Draai alles opnieuw:
   ```bash
   php artisan migrate:fresh --seed
   ```

11. Log in met `admin@spelshop.nl` / `password`.

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

 4.  Doe hetzelfde voor `update` en `destroy`. Test de functionaliteit door in te loggen als niet-admin-gebruiker.

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

## Opdracht 7: Controleren

Controleer handmatig dat de volgende scenario's werken:
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
