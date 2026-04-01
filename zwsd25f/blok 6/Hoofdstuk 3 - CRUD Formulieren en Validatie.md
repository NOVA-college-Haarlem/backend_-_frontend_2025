# Hoofdstuk 3 - CRUD Formulieren en Validatie

In dit hoofdstuk bouwen we de volledige CRUD-functionaliteit voor producten. We maken formulieren om producten toe te voegen, te bewerken en te verwijderen. Daarnaast leren we hoe we gebruikersinvoer valideren en foutmeldingen tonen.

## Inhoudsopgave
- [Hoofdstuk 3 - CRUD Formulieren en Validatie](#hoofdstuk-3---crud-formulieren-en-validatie)
  - [Inhoudsopgave](#inhoudsopgave)
  - [Leerdoelen](#leerdoelen)
  - [Opdracht 1: Resource Controller](#opdracht-1-resource-controller)
    - [Opdracht 1.1: Resource routes](#opdracht-11-resource-routes)
    - [Opdracht 1.2: Test de routes](#opdracht-12-test-de-routes)
  - [Opdracht 2: Layout met Blade](#opdracht-2-layout-met-blade)
  - [Opdracht 3: Producten aanmaken (Create)](#opdracht-3-producten-aanmaken-create)
    - [Opdracht 3.1: Formulier view](#opdracht-31-formulier-view)
    - [Opdracht 3.2: Store methode met validatie](#opdracht-32-store-methode-met-validatie)
    - [Opdracht 3.3: Test aanmaken](#opdracht-33-test-aanmaken)
  - [Opdracht 4: Product detail (Show)](#opdracht-4-product-detail-show)
  - [Opdracht 5: Producten bewerken (Edit/Update)](#opdracht-5-producten-bewerken-editupdate)
    - [Opdracht 5.1: Edit formulier](#opdracht-51-edit-formulier)
    - [Opdracht 5.2: Update methode](#opdracht-52-update-methode)
  - [Opdracht 6: Producten verwijderen (Delete)](#opdracht-6-producten-verwijderen-delete)
  - [Opdracht 7: Flash messages](#opdracht-7-flash-messages)
  - [Opdracht 8: Zoekfunctie](#opdracht-8-zoekfunctie)
  - [Opdracht 9: Tests](#opdracht-9-tests)
  - [Afronding / Reflectie](#afronding--reflectie)

## Leerdoelen
- Een resource controller aanmaken en gebruiken.
- Formulieren bouwen in Blade met CSRF-beveiliging.
- Gebruikersinvoer valideren met Laravel validation rules.
- Foutmeldingen weergeven bij formuliervelden.
- Flash messages tonen na een actie.
- Gegevens bewerken en verwijderen via formulieren.
- Een zoekfunctie bouwen met Eloquent.

---

## Opdracht 1: Resource Controller

In Laravel bestaat een resource controller uit zeven standaard methoden die samen de volledige CRUD-cyclus dekken:

| Methode   | HTTP verb | URL                    | Actie                        |
|-----------|-----------|------------------------|------------------------------|
| index     | GET       | /products              | Lijst van producten          |
| create    | GET       | /products/create       | Formulier voor nieuw product |
| store     | POST      | /products              | Nieuw product opslaan        |
| show      | GET       | /products/{id}         | Eén product tonen            |
| edit      | GET       | /products/{id}/edit    | Formulier voor bewerken      |
| update    | PUT/PATCH | /products/{id}         | Product bijwerken            |
| destroy   | DELETE    | /products/{id}         | Product verwijderen          |

1. Maak een resource controller aan:
   ```bash
   php artisan make:controller ProductController --resource
   ```
2. Open `app/Http/Controllers/ProductController.php` en bekijk de zeven methoden.

### Opdracht 1.1: Resource routes

In plaats van elke route apart te definiëren, gebruik je één regel voor alle resource routes:

1. Open `routes/web.php`.
2. Vervang de losse `/products`-route door:
   ```php
   use App\Http\Controllers\ProductController;

   Route::resource('products', ProductController::class);
   ```
3. Controleer alle gegenereerde routes met:
   ```bash
   php artisan route:list --path=products
   ```

### Opdracht 1.2: Test de routes

```bash
php artisan test --group=ProductRoutesTest
```

---

## Opdracht 2: Layout met Blade

We maken een gedeelde layout zodat alle pagina's dezelfde navigatie en stijl hebben.

1. Maak een layout-bestand aan:
   ```bash
   php artisan make:view layouts.app
   ```
2. Vul `resources/views/layouts/app.blade.php` in:
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
               <div class="navbar-nav">
                   <a class="nav-link" href="{{ route('products.index') }}">Producten</a>
               </div>
           </div>
       </nav>

       <div class="container">
           @if(session('success'))
               <div class="alert alert-success">{{ session('success') }}</div>
           @endif

           @yield('content')
       </div>
   </body>
   </html>
   ```
3. Pas `resources/views/products/index.blade.php` aan om de layout te gebruiken:
   ```html
   @extends('layouts.app')

   @section('title', 'Producten')

   @section('content')
       <div class="d-flex justify-content-between align-items-center mb-3">
           <h1>Producten</h1>
           <a href="{{ route('products.create') }}" class="btn btn-primary">+ Nieuw product</a>
       </div>

       @if($products->isEmpty())
           <p>Geen producten gevonden.</p>
       @else
           <table class="table table-striped">
               <thead>
                   <tr>
                       <th>Naam</th>
                       <th>Categorie</th>
                       <th>Prijs</th>
                       <th>Acties</th>
                   </tr>
               </thead>
               <tbody>
                   @foreach($products as $product)
                       <tr>
                           <td>{{ $product->name }}</td>
                           <td>{{ $product->category->name ?? 'Onbekend' }}</td>
                           <td>
                               {{ optional($product->prices->first())->price
                                   ? '€ ' . number_format($product->prices->first()->price / 100, 2, ',', '.')
                                   : 'n.v.t.' }}
                           </td>
                           <td>
                               <a href="{{ route('products.show', $product) }}" class="btn btn-sm btn-info">Bekijk</a>
                               <a href="{{ route('products.edit', $product) }}" class="btn btn-sm btn-warning">Bewerk</a>
                           </td>
                       </tr>
                   @endforeach
               </tbody>
           </table>
       @endif
   @endsection
   ```

---

## Opdracht 3: Producten aanmaken (Create)

### Opdracht 3.1: Formulier view

1. Maak de view aan:
   ```bash
   php artisan make:view products.create
   ```
2. Vul `resources/views/products/create.blade.php` in:
   ```html
   @extends('layouts.app')

   @section('title', 'Nieuw product')

   @section('content')
       <h1>Nieuw product toevoegen</h1>

       <form action="{{ route('products.store') }}" method="POST">
           @csrf

           <div class="mb-3">
               <label for="name" class="form-label">Naam</label>
               <input type="text"
                      class="form-control @error('name') is-invalid @enderror"
                      id="name"
                      name="name"
                      value="{{ old('name') }}">
               @error('name')
                   <div class="invalid-feedback">{{ $message }}</div>
               @enderror
           </div>

           <div class="mb-3">
               <label for="description" class="form-label">Omschrijving</label>
               <textarea class="form-control @error('description') is-invalid @enderror"
                         id="description"
                         name="description"
                         rows="3">{{ old('description') }}</textarea>
               @error('description')
                   <div class="invalid-feedback">{{ $message }}</div>
               @enderror
           </div>

           <div class="mb-3">
               <label for="category_id" class="form-label">Categorie</label>
               <select class="form-select @error('category_id') is-invalid @enderror"
                       id="category_id"
                       name="category_id">
                   <option value="">-- Kies een categorie --</option>
                   @foreach($categories as $category)
                       <option value="{{ $category->id }}"
                               {{ old('category_id') == $category->id ? 'selected' : '' }}>
                           {{ $category->name }}
                       </option>
                   @endforeach
               </select>
               @error('category_id')
                   <div class="invalid-feedback">{{ $message }}</div>
               @enderror
           </div>

           <div class="mb-3">
               <label for="price" class="form-label">Prijs (in euro's)</label>
               <input type="number"
                      class="form-control @error('price') is-invalid @enderror"
                      id="price"
                      name="price"
                      step="0.01"
                      min="0"
                      value="{{ old('price') }}">
               @error('price')
                   <div class="invalid-feedback">{{ $message }}</div>
               @enderror
           </div>

           <button type="submit" class="btn btn-primary">Opslaan</button>
           <a href="{{ route('products.index') }}" class="btn btn-secondary">Annuleren</a>
       </form>
   @endsection
   ```

> **Let op `@csrf`**: Laravel vereist een CSRF-token bij elk POST-formulier. Dit beschermt je applicatie tegen aanvallen waarbij kwaadaardige websites acties namens de gebruiker uitvoeren. Zonder `@csrf` geeft Laravel een 419-fout.

### Opdracht 3.2: Store methode met validatie

1. Open `app/Http/Controllers/ProductController.php`.
2. Pas de `create`-methode aan:
   ```php
   public function create()
   {
       $categories = \App\Models\Category::all();
       return view('products.create', compact('categories'));
   }
   ```
3. Pas de `store`-methode aan:
   ```php
   public function store(Request $request)
   {
       $validated = $request->validate([
           'name'        => 'required|string|max:255',
           'description' => 'nullable|string|max:1000',
           'category_id' => 'required|exists:categories,id',
           'price'       => 'required|numeric|min:0',
       ]);

       $product = Product::create([
           'name'        => $validated['name'],
           'description' => $validated['description'],
           'category_id' => $validated['category_id'],
       ]);

       // Prijs opslaan in cents
       $product->prices()->create([
           'price'          => (int) round($validated['price'] * 100),
           'in_effect_date' => now(),
       ]);

       return redirect()->route('products.index')
           ->with('success', 'Product succesvol aangemaakt!');
   }
   ```

> **Validatieregels uitgelegd:**
> - `required` → veld mag niet leeg zijn
> - `string|max:255` → moet tekst zijn, maximaal 255 tekens
> - `nullable` → veld mag leeg zijn
> - `exists:categories,id` → de waarde moet bestaan in de `categories` tabel kolom `id`
> - `numeric|min:0` → moet een getal zijn, minimaal 0

### Opdracht 3.3: Test aanmaken

```bash
php artisan test --group=ProductCreateTest
```

---

## Opdracht 4: Product detail (Show)

1. Pas de `show`-methode aan in de controller:
   ```php
   public function show(Product $product)
   {
       $product->load(['category', 'prices', 'reviews.user']);
       return view('products.show', compact('product'));
   }
   ```

2. Maak de view aan:
   ```bash
   php artisan make:view products.show
   ```

3. Vul `resources/views/products/show.blade.php` in:
   ```html
   @extends('layouts.app')

   @section('title', $product->name)

   @section('content')
       <a href="{{ route('products.index') }}" class="btn btn-secondary mb-3">← Terug</a>

       <h1>{{ $product->name }}</h1>
       <p class="text-muted">Categorie: {{ $product->category->name ?? 'Onbekend' }}</p>
       <p>{{ $product->description }}</p>

       <h4>Prijs:
           @if($product->prices->isNotEmpty())
               € {{ number_format($product->prices->sortByDesc('in_effect_date')->first()->price / 100, 2, ',', '.') }}
           @else
               n.v.t.
           @endif
       </h4>

       <hr>
       <h3>Reviews ({{ $product->reviews->count() }})</h3>
       @forelse($product->reviews as $review)
           <div class="card mb-2">
               <div class="card-body">
                   <strong>{{ $review->user->name }}</strong>
                   — Beoordeling: {{ $review->rating }}/5
                   <p>{{ $review->comment }}</p>
               </div>
           </div>
       @empty
           <p>Nog geen reviews.</p>
       @endforelse

       <div class="mt-3">
           <a href="{{ route('products.edit', $product) }}" class="btn btn-warning">Bewerken</a>
       </div>
   @endsection
   ```

---

## Opdracht 5: Producten bewerken (Edit/Update)

### Opdracht 5.1: Edit formulier

1. Pas de `edit`-methode aan:
   ```php
   public function edit(Product $product)
   {
       $categories = \App\Models\Category::all();
       $currentPrice = $product->prices()->latest('in_effect_date')->first();
       return view('products.edit', compact('product', 'categories', 'currentPrice'));
   }
   ```

2. Maak de view aan:
   ```bash
   php artisan make:view products.edit
   ```

3. Vul `resources/views/products/edit.blade.php` in:
   ```html
   @extends('layouts.app')

   @section('title', 'Bewerken: ' . $product->name)

   @section('content')
       <h1>Product bewerken: {{ $product->name }}</h1>

       <form action="{{ route('products.update', $product) }}" method="POST">
           @csrf
           @method('PUT')

           <div class="mb-3">
               <label for="name" class="form-label">Naam</label>
               <input type="text"
                      class="form-control @error('name') is-invalid @enderror"
                      id="name"
                      name="name"
                      value="{{ old('name', $product->name) }}">
               @error('name')
                   <div class="invalid-feedback">{{ $message }}</div>
               @enderror
           </div>

           <div class="mb-3">
               <label for="description" class="form-label">Omschrijving</label>
               <textarea class="form-control @error('description') is-invalid @enderror"
                         id="description"
                         name="description"
                         rows="3">{{ old('description', $product->description) }}</textarea>
               @error('description')
                   <div class="invalid-feedback">{{ $message }}</div>
               @enderror
           </div>

           <div class="mb-3">
               <label for="category_id" class="form-label">Categorie</label>
               <select class="form-select @error('category_id') is-invalid @enderror"
                       id="category_id"
                       name="category_id">
                   <option value="">-- Kies een categorie --</option>
                   @foreach($categories as $category)
                       <option value="{{ $category->id }}"
                               {{ old('category_id', $product->category_id) == $category->id ? 'selected' : '' }}>
                           {{ $category->name }}
                       </option>
                   @endforeach
               </select>
               @error('category_id')
                   <div class="invalid-feedback">{{ $message }}</div>
               @enderror
           </div>

           <div class="mb-3">
               <label for="price" class="form-label">Nieuwe prijs (in euro's)</label>
               <input type="number"
                      class="form-control @error('price') is-invalid @enderror"
                      id="price"
                      name="price"
                      step="0.01"
                      min="0"
                      value="{{ old('price', $currentPrice ? $currentPrice->price / 100 : '') }}">
               @error('price')
                   <div class="invalid-feedback">{{ $message }}</div>
               @enderror
           </div>

           <button type="submit" class="btn btn-primary">Opslaan</button>
           <a href="{{ route('products.show', $product) }}" class="btn btn-secondary">Annuleren</a>
       </form>
   @endsection
   ```

> **`@method('PUT')`**: HTML-formulieren ondersteunen alleen GET en POST. Laravel gebruikt een verborgen `_method` veld om PUT, PATCH en DELETE te simuleren. Zonder `@method('PUT')` herkent Laravel de update-route niet.

### Opdracht 5.2: Update methode

1. Pas de `update`-methode aan:
   ```php
   public function update(Request $request, Product $product)
   {
       $validated = $request->validate([
           'name'        => 'required|string|max:255',
           'description' => 'nullable|string|max:1000',
           'category_id' => 'required|exists:categories,id',
           'price'       => 'required|numeric|min:0',
       ]);

       $product->update([
           'name'        => $validated['name'],
           'description' => $validated['description'],
           'category_id' => $validated['category_id'],
       ]);

       // Nieuwe prijs toevoegen als historisch record
       $product->prices()->create([
           'price'          => (int) round($validated['price'] * 100),
           'in_effect_date' => now(),
       ]);

       return redirect()->route('products.show', $product)
           ->with('success', 'Product succesvol bijgewerkt!');
   }
   ```

---

## Opdracht 6: Producten verwijderen (Delete)

1. Voeg een verwijderknop toe in de `show`-view na de bewerkknop:
   ```html
   <form action="{{ route('products.destroy', $product) }}"
         method="POST"
         onsubmit="return confirm('Weet je zeker dat je dit product wilt verwijderen?')">
       @csrf
       @method('DELETE')
       <button type="submit" class="btn btn-danger">Verwijderen</button>
   </form>
   ```

2. Pas de `destroy`-methode aan in de controller:
   ```php
   public function destroy(Product $product)
   {
       $product->delete();

       return redirect()->route('products.index')
           ->with('success', 'Product succesvol verwijderd.');
   }
   ```

> **`onsubmit="return confirm(...)"`**: Dit toont een bevestigingsvenster voordat het formulier verstuurd wordt. Als de gebruiker op "Annuleren" klikt, wordt het formulier niet verstuurd.

---

## Opdracht 7: Flash messages

Flash messages zijn berichten die eenmalig getoond worden na een actie (zoals opslaan of verwijderen). Ze worden opgeslagen in de sessie en verdwijnen na het vernieuwen van de pagina.

We hebben de flash message al verwerkt in de layout (stap 2). Controleer of je de volgende code in `layouts/app.blade.php` hebt staan:

```html
@if(session('success'))
    <div class="alert alert-success">{{ session('success') }}</div>
@endif
```

1. Test of de flash message werkt door een product aan te maken en te controleren of het bericht verschijnt.
2. Voeg ook een foutmelding toe voor situaties die fout gaan:
   ```html
   @if(session('error'))
       <div class="alert alert-danger">{{ session('error') }}</div>
   @endif
   ```

---

## Opdracht 8: Zoekfunctie

We voegen een zoekfunctie toe aan het producten-overzicht zodat gebruikers kunnen filteren op naam of categorie.

1. Pas de `index`-methode aan in de controller:
   ```php
   public function index(Request $request)
   {
       $query = Product::with([
           'category',
           'prices' => fn($q) => $q->latest('in_effect_date')->limit(1),
       ]);

       if ($request->filled('zoek')) {
           $query->where('name', 'like', '%' . $request->zoek . '%');
       }

       if ($request->filled('categorie')) {
           $query->where('category_id', $request->categorie);
       }

       $products = $query->get();
       $categories = \App\Models\Category::all();

       return view('products.index', compact('products', 'categories'));
   }
   ```

2. Voeg een zoekformulier toe bovenaan de `index`-view:
   ```html
   <form method="GET" action="{{ route('products.index') }}" class="row g-2 mb-4">
       <div class="col-md-5">
           <input type="text"
                  name="zoek"
                  class="form-control"
                  placeholder="Zoek op naam..."
                  value="{{ request('zoek') }}">
       </div>
       <div class="col-md-4">
           <select name="categorie" class="form-select">
               <option value="">-- Alle categorieën --</option>
               @foreach($categories as $category)
                   <option value="{{ $category->id }}"
                           {{ request('categorie') == $category->id ? 'selected' : '' }}>
                       {{ $category->name }}
                   </option>
               @endforeach
           </select>
       </div>
       <div class="col-md-3">
           <button type="submit" class="btn btn-primary w-100">Zoeken</button>
       </div>
   </form>
   ```

> **`$request->filled('zoek')`** controleert of het veld aanwezig én niet leeg is. Dit is handiger dan `$request->has()`, dat ook een lege string accepteert.

---

## Opdracht 9: Tests

```bash
php artisan test --group=ProductCrudTest
```

Controleer dat de volgende scenario's werken:
- Een product aanmaken met geldige data slaagt.
- Een product aanmaken zonder naam geeft een validatiefout.
- Een product bewerken slaat de nieuwe naam op.
- Een product verwijderen haalt het uit de database.
- De zoekfunctie filtert correct op naam.

---

## Afronding / Reflectie

In dit hoofdstuk heb je:
- Een resource controller gebruikt voor overzichtelijke CRUD-routes.
- Formulieren gebouwd met CSRF-beveiliging en `@method()`.
- Gebruikersinvoer gevalideerd met Laravel validation rules.
- Foutmeldingen per veld getoond met `@error`.
- Flash messages toegevoegd om de gebruiker feedback te geven.
- Een zoekfunctie gebouwd met Eloquent query-methoden.

**Volgende stap:** Authenticatie met Laravel Breeze toepassen zodat alleen ingelogde beheerders producten kunnen aanmaken, bewerken en verwijderen.
