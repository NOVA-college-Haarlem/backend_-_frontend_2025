# Hoofdstuk 7 - CRUD Formulieren en Validatie

In dit hoofdstuk bouwen we de volledige CRUD-functionaliteit voor producten. We maken formulieren om producten toe te voegen, te bewerken en te verwijderen. Daarnaast leren we hoe we gebruikersinvoer valideren en foutmeldingen tonen.

## Inhoudsopgave
- [Hoofdstuk 7 - CRUD Formulieren en Validatie](#hoofdstuk-7---crud-formulieren-en-validatie)
  - [Inhoudsopgave](#inhoudsopgave)
  - [Leerdoelen](#leerdoelen)
    - [Resource controller (overzicht)](#resource-controller-overzicht)
    - [Opdracht 1: Producten aanmaken (Create)](#opdracht-1-producten-aanmaken-create)
        - [Opdracht 1.1: Formulier view](#opdracht-11-formulier-view)
        - [Opdracht 1.2: Store methode met validatie](#opdracht-12-store-methode-met-validatie)
    - [Opdracht 2: Producten bewerken (Edit/Update)](#opdracht-2-producten-bewerken-editupdate)
        - [Opdracht 2.1: Edit formulier](#opdracht-21-edit-formulier)
        - [Opdracht 2.2: Update methode](#opdracht-22-update-methode)
    - [Opdracht 3: Producten verwijderen (Delete)](#opdracht-3-producten-verwijderen-delete)
    - [Opdracht 4: Flash messages](#opdracht-4-flash-messages)
    - [Opdracht 5: Zoekfunctie](#opdracht-5-zoekfunctie)
  - [Afronding / Reflectie](#afronding--reflectie)

## Leerdoelen
- Een resource controller herkennen en gebruiken.
- Formulieren bouwen in Blade met CSRF-beveiliging.
- Gebruikersinvoer valideren met Laravel validation rules.
- Foutmeldingen weergeven bij formuliervelden.
- Flash messages tonen na een actie.
- Gegevens bewerken en verwijderen via formulieren.
- Een zoekfunctie bouwen met Eloquent.

---

## Resource controller (overzicht)

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

Deze tabel is bedoeld als naslag. In dit hoofdstuk werken we verder in de bestaande `ProductController` en voegen we de nodige methodes handmatig toe.

### Routes opnieuw toevoegen

Dit hoofdstuk steunt op resource-routes. Je voegt hem als volgt toe:

1. Open `routes/web.php`.
2. Verwijder bestaande losse `index`- en `show`-routes voor `products` (die zitten straks in de resource-route).
3. Voeg toe:
    ```php
    Route::resource('products', ProductController::class);
    ```
4. Controleer met:
    ```bash
    php artisan route:list --path=products
    ```

---

## Opdracht 1: Producten aanmaken (Create)

In deze opdracht werk je in de bestaande `ProductController` en voeg je de benodigde methodes handmatig toe of werk je ze bij.

### Opdracht 1.1: Formulier view

1. Maak de view aan:
   ```bash
   php artisan make:view products.create
   ```
2. Vul `resources/views/products/create.blade.php` in:
   ```html
    <x-layout title="Nieuw product">
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
   </x-layout>
   ```

| Onderdeel | Korte uitleg |
|-----------|--------------|
| `@csrf` | Voegt een CSRF-token toe: een unieke, tijdelijke code die Laravel vergelijkt met de sessie van de gebruiker. Zonder dit token wordt een POST-aanvraag geweigerd (419-fout). |
| `@error('veld')` | Toont een foutmelding voor dat specifieke veld als validatie faalt. |
| `route('naam')` | Bouwt automatisch de juiste URL op basis van een routenaam, bijvoorbeeld `products.store`. |
| `old('veld')` | Zet eerder ingevulde invoer terug in het formulier na een validatiefout. |

### Opdracht 1.2: Store methode met validatie

1. Open `app/Http/Controllers/ProductController.php`.
2. Voeg bovenaan de controller de juiste imports toe:
    ```php
    use App\Models\Category;
    use App\Models\Product;
    use Illuminate\Http\Request;
    ```
3. Pas de `create`-methode aan:
   ```php
   public function create()
   {
       $categories = Category::all();
       
       return view('products.create', compact('categories'));
   }
   ```
4. Pas de `store`-methode aan:
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

| Onderdeel | Korte uitleg |
|-----------|--------------|
| `$validated` | Bevat alleen de velden die door de validatie zijn goedgekeurd. Je gebruikt deze array om veilig data op te slaan. |
| `$product->prices()->create([...])` | Maakt naast het product ook een nieuw record in de `prices` tabel via de relatie. Zo wordt de prijs als apart (historisch) prijsrecord opgeslagen. |
| `->with('success', '...')` | Voegt een flash message toe aan de sessie bij de redirect. Die melding kun je op de volgende pagina één keer tonen. |


---

## Opdracht 2: Producten bewerken (Edit/Update)

### Opdracht 2.1: Edit formulier

1. Pas de `edit`-methode aan:
   ```php
   public function edit(Product $product)
   {
       $categories = Category::all();
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
    <x-layout :title="'Bewerken: ' . $product->name">
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
   </x-layout>
   ```

> **`@method('PUT')`**: HTML-formulieren ondersteunen alleen GET en POST. Laravel gebruikt een verborgen `_method` veld om PUT, PATCH en DELETE te simuleren. Zonder `@method('PUT')` herkent Laravel de update-route niet.

### Opdracht 2.2: Update methode

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

       $newPriceInCents = (int) round($validated['price'] * 100);
       $currentPrice = $product->prices()->latest('in_effect_date')->first();

       // Alleen een nieuw prijsrecord toevoegen als de prijs gewijzigd is
       if (! $currentPrice || $currentPrice->price !== $newPriceInCents) {
           $product->prices()->create([
               'price'          => $newPriceInCents,
               'in_effect_date' => now(),
           ]);
       }

       return redirect()->route('products.show', $product)
           ->with('success', 'Product succesvol bijgewerkt!');
   }
   ```

---

## Opdracht 3: Producten verwijderen (Delete)

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

## Opdracht 4: Flash messages

Flash messages zijn berichten die eenmalig getoond worden na een actie (zoals opslaan of verwijderen). Ze worden opgeslagen in de sessie en verdwijnen na het vernieuwen van de pagina.

We hebben de flash message al verwerkt in de layout. Controleer of je de volgende code in `components/layout.blade.php` hebt staan:

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

## Opdracht 5: Zoekfunctie

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

## Afronding / Reflectie

In dit hoofdstuk heb je:
- Een resource controller gebruikt voor overzichtelijke CRUD-routes.
- Formulieren gebouwd met CSRF-beveiliging en `@method()`.
- Gebruikersinvoer gevalideerd met Laravel validation rules.
- Foutmeldingen per veld getoond met `@error`.
- Flash messages toegevoegd om de gebruiker feedback te geven.
- Een zoekfunctie gebouwd met Eloquent query-methoden.

**Volgende stap:** Authenticatie met Laravel Breeze toepassen zodat alleen ingelogde beheerders producten kunnen aanmaken, bewerken en verwijderen.
