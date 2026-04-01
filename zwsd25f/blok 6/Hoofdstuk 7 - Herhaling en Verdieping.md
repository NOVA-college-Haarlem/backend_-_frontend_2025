# Hoofdstuk 7 — Herhaling en Verdieping

In dit laatste hoofdstuk consolideren we alles wat we hebben geleerd. We refactoren onze validatielogica naar FormRequest classes, voegen paginatie en filtering toe en bouwen zelfstandige oefeningen als voorbereiding op het eindproject.

## Inhoudsopgave
- [Hoofdstuk 7 — Herhaling en Verdieping](#hoofdstuk-7--herhaling-en-verdieping)
  - [Inhoudsopgave](#inhoudsopgave)
  - [Leerdoelen](#leerdoelen)
  - [Opdracht 1: FormRequest classes](#opdracht-1-formrequest-classes)
    - [Opdracht 1.1: ProductRequest aanmaken](#opdracht-11-productrequest-aanmaken)
    - [Opdracht 1.2: ReviewRequest aanmaken](#opdracht-12-reviewrequest-aanmaken)
    - [Opdracht 1.3: Foutmeldingen in het Nederlands](#opdracht-13-foutmeldingen-in-het-nederlands)
  - [Opdracht 2: Categorieën CRUD afronden](#opdracht-2-categorieën-crud-afronden)
  - [Opdracht 3: Zoekfunctie uitbreiden](#opdracht-3-zoekfunctie-uitbreiden)
  - [Opdracht 4: Overzicht van alle Laravel-concepten](#opdracht-4-overzicht-van-alle-laravel-concepten)
  - [Zelfstandige opdrachten (voorbereiding eindproject)](#zelfstandige-opdrachten-voorbereiding-eindproject)
    - [Opdracht A — Prijshistorie tonen](#opdracht-a--prijshistorie-tonen)
    - [Opdracht B — Admin bestellingenbeheer](#opdracht-b--admin-bestellingenbeheer)
    - [Opdracht C — Gebruikersprofiel](#opdracht-c--gebruikersprofiel)
    - [Opdracht D — Categorie-filter op productoverzicht](#opdracht-d--categorie-filter-op-productoverzicht)
    - [Opdracht E — Eindproject voorbereiding](#opdracht-e--eindproject-voorbereiding)
  - [Afronding van blok 6](#afronding-van-blok-6)

## Leerdoelen
- Validatielogica centraliseren in een FormRequest class.
- Foutmeldingen aanpassen naar het Nederlands.
- Bestaande CRUD-kennis zelfstandig toepassen op nieuwe modellen.
- Eenvoudige uitbreidingen bouwen op een bestaand Laravel-project.

---

## Opdracht 1: FormRequest classes

Tot nu toe schrijven we validatielogica direct in de controller. Bij grotere projecten wordt dit onoverzichtelijk. Een **FormRequest** is een aparte klasse die validatieregels en autorisatiecontroles bevat — buiten de controller.

**Voordelen:**
- Controller blijft klein en leesbaar.
- Validatielogica is herbruikbaar (bijv. dezelfde regels voor `store` en `update`).
- Autorisatiecheck staat op één plek.

### Opdracht 1.1: ProductRequest aanmaken

```bash
php artisan make:request ProductRequest
```

Open `app/Http/Requests/ProductRequest.php` en vul in:

```php
<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;

class ProductRequest extends FormRequest
{
    /**
     * Bepaal of de gebruiker gemachtigd is dit verzoek te doen.
     */
    public function authorize(): bool
    {
        return Auth::check() && Auth::user()->isAdmin();
    }

    /**
     * Validatieregels voor het verzoek.
     */
    public function rules(): array
    {
        return [
            'name'        => 'required|string|max:255',
            'description' => 'nullable|string|max:1000',
            'category_id' => 'required|exists:categories,id',
            'price'       => 'required|numeric|min:0',
        ];
    }

    /**
     * Aangepaste foutmeldingen (optioneel).
     */
    public function messages(): array
    {
        return [
            'name.required'        => 'De naam van het product is verplicht.',
            'category_id.required' => 'Kies een categorie voor het product.',
            'category_id.exists'   => 'De gekozen categorie bestaat niet.',
            'price.required'       => 'Voer een prijs in.',
            'price.min'            => 'De prijs mag niet negatief zijn.',
        ];
    }
}
```

Pas de `store`-methode in `ProductController` aan:

```php
// Voeg bovenaan de controller toe:
use App\Http\Requests\ProductRequest;

// Vervang:
public function store(Request $request)
{
    $validated = $request->validate([...]);
    Gate::authorize('beheer-producten');
    ...
}

// Door:
public function store(ProductRequest $request)
{
    // validate() en authorize() gebeuren automatisch via de FormRequest
    $product = Product::create([
        'name'        => $request->name,
        'description' => $request->description,
        'category_id' => $request->category_id,
    ]);

    $product->prices()->create([
        'price'          => (int) round($request->price * 100),
        'in_effect_date' => now(),
    ]);

    return redirect()->route('products.index')
        ->with('success', 'Product succesvol aangemaakt!');
}
```

Doe hetzelfde voor de `update`-methode:

```php
public function update(ProductRequest $request, Product $product)
{
    $product->update([
        'name'        => $request->name,
        'description' => $request->description,
        'category_id' => $request->category_id,
    ]);

    $product->prices()->create([
        'price'          => (int) round($request->price * 100),
        'in_effect_date' => now(),
    ]);

    return redirect()->route('products.show', $product)
        ->with('success', 'Product succesvol bijgewerkt!');
}
```

> **`authorize()` in FormRequest**: Als `authorize()` `false` teruggeeft, stuurt Laravel automatisch een 403-fout. Je hoeft `Gate::authorize()` niet meer in de controller te zetten.

### Opdracht 1.2: ReviewRequest aanmaken

Doe hetzelfde voor reviews:

```bash
php artisan make:request ReviewRequest
```

```php
public function authorize(): bool
{
    return Auth::check(); // elke ingelogde gebruiker mag een review schrijven
}

public function rules(): array
{
    return [
        'rating'  => 'required|integer|between:1,5',
        'comment' => 'required|string|min:10|max:1000',
    ];
}

public function messages(): array
{
    return [
        'rating.required'  => 'Kies een beoordeling.',
        'rating.between'   => 'De beoordeling moet tussen 1 en 5 sterren zijn.',
        'comment.required' => 'Schrijf een reactie bij je beoordeling.',
        'comment.min'      => 'Je review moet minimaal 10 tekens bevatten.',
    ];
}
```

Pas `ReviewController::store()` aan:

```php
use App\Http\Requests\ReviewRequest;

public function store(ReviewRequest $request, Product $product)
{
    $product->reviews()->create([
        'rating'  => $request->rating,
        'comment' => $request->comment,
        'user_id' => Auth::id(),
    ]);

    return redirect()
        ->route('products.show', $product)
        ->with('success', 'Je review is geplaatst. Bedankt!');
}
```

### Opdracht 1.3: Foutmeldingen in het Nederlands

Laravel toont standaard Engelstalige foutmeldingen. We kunnen dit aanpassen via het taalbestand.

1. Publiceer de taalbestanden:
   ```bash
   php artisan lang:publish
   ```
2. Open `lang/en/validation.php`.
3. Maak een kopie als `lang/nl/validation.php`.
4. Vertaal de berichten naar het Nederlands. Bijvoorbeeld:
   ```php
   'required' => 'Het veld :attribute is verplicht.',
   'min'      => [
       'string' => 'Het veld :attribute moet minimaal :min tekens bevatten.',
   ],
   'max'      => [
       'string' => 'Het veld :attribute mag maximaal :max tekens bevatten.',
   ],
   ```
5. Stel de taal in op Nederlands in `config/app.php`:
   ```php
   'locale' => 'nl',
   'fallback_locale' => 'en',
   ```

---

## Opdracht 2: Categorieën CRUD afronden

In Hoofdstuk 1 hebben we een basis `CategoryController` aangemaakt met alleen een `index`-methode. Nu ronden we de volledige CRUD af voor categorieën, inclusief FormRequest.

1. Maak een CategoryRequest aan:
   ```bash
   php artisan make:request CategoryRequest
   ```
   Definieer de regels: `name` is verplicht en maximaal 100 tekens, `description` is optioneel.

2. Breid `CategoryController` uit met `create`, `store`, `edit`, `update` en `destroy`.

3. Vervang de losse route door een resource-route in `web.php`:
   ```php
   Route::resource('categories', CategoryController::class)->except(['show']);
   Route::middleware('auth')->group(function () {
       // Schrijfacties beveiligd
       Route::resource('categories', CategoryController::class)->only(['create', 'store', 'edit', 'update', 'destroy']);
   });
   ```
   Of voeg de admin-check toe in de `CategoryRequest::authorize()`.

4. Maak de benodigde views aan:
   ```bash
   php artisan make:view categories.create
   php artisan make:view categories.edit
   ```

5. Voeg een link toe in de navigatie voor admins:
   ```html
   @can('beheer-producten')
       <a class="nav-link" href="{{ route('categories.index') }}">Categorieën beheren</a>
   @endcan
   ```

---

## Opdracht 3: Zoekfunctie uitbreiden

De zoekfunctie uit Hoofdstuk 3 filtert alleen op naam. We breiden hem uit.

1. Voeg sortering toe in de `index`-methode van `ProductController`:
   ```php
   $sorteer = $request->get('sorteer', 'name');
   $richting = $request->get('richting', 'asc');

   $toegestaanSorteer = ['name', 'created_at'];
   if (!in_array($sorteer, $toegestaanSorteer)) {
       $sorteer = 'name';
   }

   $query->orderBy($sorteer, $richting === 'desc' ? 'desc' : 'asc');
   ```

2. Voeg sorteerlinks toe in de view:
   ```html
   <th>
       <a href="{{ route('products.index', array_merge(request()->query(), ['sorteer' => 'name', 'richting' => request('richting') === 'asc' ? 'desc' : 'asc'])) }}">
           Naam
       </a>
   </th>
   ```

3. Voeg een "Alles wissen"-knop toe naast het zoekformulier:
   ```html
   @if(request()->hasAny(['zoek', 'categorie']))
       <a href="{{ route('products.index') }}" class="btn btn-outline-secondary">Wissen</a>
   @endif
   ```

---

## Opdracht 4: Overzicht van alle Laravel-concepten

Gebruik de onderstaande tabel als referentie voor alles wat je in dit blok hebt geleerd.

| Concept | Commando / Syntax | Hoofdstuk |
|---------|-------------------|-----------|
| Project aanmaken | Laravel Herd | H1 |
| Route definiëren | `Route::get('/pad', ...)` | H1 |
| Resource routes | `Route::resource('naam', Controller::class)` | H3 |
| Controller aanmaken | `php artisan make:controller NaamController` | H1 |
| Model aanmaken | `php artisan make:model Naam -m` | H2 |
| Migration uitvoeren | `php artisan migrate` | H2 |
| Database resetten | `php artisan migrate:fresh --seed` | H2 |
| Seeder aanmaken | `php artisan make:seeder NaamSeeder` | H1 |
| Relatie one-to-many | `hasMany()` / `belongsTo()` | H2 |
| Relatie many-to-many | `belongsToMany()` / pivot tabel | H6 |
| Eager loading | `Product::with('category')->get()` | H2 |
| Formulier beveiligen | `@csrf` | H3 |
| PUT/DELETE simuleren | `@method('PUT')` | H3 |
| Validatie in controller | `$request->validate([...])` | H3 |
| Validatie in FormRequest | `php artisan make:request NaamRequest` | H7 |
| Foutmeldingen tonen | `@error('veld')` | H3 |
| Flash message sturen | `->with('success', '...')` | H3 |
| Flash message tonen | `session('success')` | H3 |
| Auth middleware | `Route::middleware('auth')->group(...)` | H4 |
| Ingelogde gebruiker | `Auth::user()` / `Auth::id()` | H4 |
| Inlogcheck in Blade | `@auth` / `@guest` | H4 |
| Gate definiëren | `Gate::define('naam', fn)` | H4 |
| Gate gebruiken | `@can('naam')` / `Gate::authorize(...)` | H4 |
| Policy aanmaken | `php artisan make:policy NaamPolicy --model=Naam` | H5 |
| Policy gebruiken | `$this->authorize('delete', $model)` | H5 |
| Paginatie | `->paginate(10)` + `{{ $items->links() }}` | H6 |
| Gemiddelde berekenen | `->avg('kolom')` | H5 |
| Tijdsaanduiding | `->diffForHumans()` | H5 |
| attach / detach / sync | `$model->relatie()->attach($id)` | H6 |

---

## Zelfstandige opdrachten (voorbereiding eindproject)

De volgende opdrachten bouw je zelfstandig, zonder uitgewerkte stappen. Gebruik alles wat je in de vorige hoofdstukken hebt geleerd.

Eisen aan alle opdrachten:
- Gebruik een FormRequest class voor validatie.
- Gebruik Route Model Binding.
- Voeg flash messages toe.
- Beveilig schrijfacties met middleware of een Gate/Policy.

### Opdracht A — Prijshistorie tonen

Op de productdetailpagina tonen we nu alleen de huidige prijs. Bouw een prijshistorie:

1. Toon alle prijswijzigingen van een product, gesorteerd van nieuw naar oud.
2. Geef elk record de datum waarop de prijs is ingegaan.
3. Markeer de huidige (meest recente) prijs duidelijk.
4. Alleen admins zien de prijshistorie.

### Opdracht B — Admin bestellingenbeheer

Admins moeten alle bestellingen kunnen zien en de status kunnen wijzigen.

1. Maak een admin-only route `/admin/bestellingen`.
2. Toon alle bestellingen (alle gebruikers), gesorteerd op datum.
3. Voeg een dropdown toe waarmee de admin de status kan wijzigen (`ordered`, `delivered`, `canceled`).
4. Gebruik een FormRequest voor de statuswijziging.
5. Beveilig de route zodat alleen admins erbij kunnen.

### Opdracht C — Gebruikersprofiel

Geef gebruikers de mogelijkheid hun naam en e-mailadres te wijzigen.

1. Maak een `ProfielController` met `edit` en `update`.
2. Toon een formulier met de huidige naam en e-mailadres.
3. Valideer dat het e-mailadres uniek is (maar laat de huidige waarde toe met `Rule::unique(...)->ignore(Auth::id())`).
4. Toon een overzicht van de eigen reviews en bestellingen onderaan de profielpagina.

### Opdracht D — Categorie-filter op productoverzicht

Breid de productpagina uit met een filterbalk aan de linkerkant:

1. Toon alle categorieën als klikbare links.
2. Als een categorie geselecteerd is, worden alleen de producten van die categorie getoond.
3. Toon het aantal producten per categorie tussen haakjes.
4. De actieve categorie is visueel gemarkeerd.

### Opdracht E — Eindproject voorbereiding

Schrijf voor je eigen eindproject:

1. Een ERD met minimaal 4 tabellen en 2 relaties (waarvan minstens één many-to-many).
2. Een lijst van minstens 5 user stories in de vorm: *"Als [rol] wil ik [actie] zodat [doel]."*
3. Een overzicht van welke routes beveiligd moeten zijn en welke rol daarvoor nodig is.
4. Een schets van de belangrijkste views (papier of digitaal).

---

## Afronding van blok 6

Je hebt in dit blok een volledig functionele Laravel-applicatie gebouwd: de Spelshop.

**Wat heb je gebouwd:**
- Een spelshop met producten, categorieën en prijzen
- Volledig CRUD voor producten (alleen admins)
- Reviews door ingelogde klanten, met per-record autorisatie via Policies
- Bestellingen met een many-to-many relatie via een pivot tabel
- Authenticatie via Laravel Breeze
- Autorisatie via Gates en Policies
- Zoekfunctie en paginatie
- FormRequest classes voor herbruikbare validatie

**Laravel-commando's die je nu kent:**

```bash
php artisan make:model Naam -m        # Model + migration
php artisan make:controller Naam      # Controller
php artisan make:seeder Naam          # Seeder
php artisan make:request Naam         # FormRequest
php artisan make:policy Naam --model  # Policy
php artisan make:view naam.view       # View
php artisan migrate                   # Migrations uitvoeren
php artisan migrate:fresh --seed      # Reset + opnieuw vullen
php artisan route:list                # Alle routes tonen
php artisan test --group=NaamTest     # Specifieke tests draaien
php artisan tinker                    # Interactieve PHP-console
```

**Volgende stap:** Eindproject — bouw je eigen Laravel-applicatie van scratch.
