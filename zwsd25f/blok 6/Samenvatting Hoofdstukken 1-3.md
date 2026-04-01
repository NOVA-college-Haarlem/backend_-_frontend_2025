# Samenvatting Blok 6 — Hoofdstukken 1 t/m 3

Deze samenvatting geeft een overzicht van de belangrijkste concepten en commando's uit de eerste drie hoofdstukken van het Laravel Spelshop project.

---

## Hoofdstuk 1 — Project Setup en Basis Functionaliteit

### Wat hebben we gedaan?
We hebben een nieuw Laravel-project opgezet met Laravel Herd en de eerste statische pagina's gemaakt. Daarna zijn we begonnen met het MVC-patroon door een Model, Migration, Seeder en Controller voor categorieën te maken.

### Kernbegrippen

| Begrip | Uitleg |
|--------|--------|
| **MVC** | Model-View-Controller: scheiding van data, weergave en logica |
| **Route** | Een URL-adres binnen de applicatie, gedefinieerd in `routes/web.php` |
| **View** | Een Blade-sjabloon in `resources/views/` dat HTML toont |
| **Controller** | PHP-klasse die de logica regelt tussen model en view |
| **Model** | PHP-klasse die een databasetabel vertegenwoordigt |
| **Migration** | Bestand dat de structuur van een databasetabel definieert |
| **Seeder** | Bestand dat testdata in de database plaatst |

### Belangrijke commando's

```bash
# Nieuw model aanmaken
php artisan make:model Category

# Migration aanmaken
php artisan make:migration create_categories_table

# Seeder aanmaken
php artisan make:seeder CategoriesSeeder

# Controller aanmaken
php artisan make:controller CategoryController

# Migrations uitvoeren en database vullen met testdata
php artisan migrate:fresh --seed

# Tests uitvoeren
php artisan test --group=StaticRoutesTest
php artisan test --group=CategoriesIndex
```

### Codepatroon: route → controller → view

```php
// routes/web.php
Route::get('/categories', [CategoryController::class, 'index']);

// app/Http/Controllers/CategoryController.php
public function index()
{
    $categories = Category::all();
    return view('categories.index', compact('categories'));
}
```

```html
{{-- resources/views/categories/index.blade.php --}}
@foreach($categories as $category)
    <h2>{{ $category->name }}</h2>
@endforeach
```

---

## Hoofdstuk 2 — Models en Relaties

### Wat hebben we gedaan?
We hebben de volledige datastructuur van de spelshop opgezet volgens het ERD. Alle modellen, migrations en seeders zijn aangemaakt en de Eloquent-relaties zijn gedefinieerd. Daarnaast hebben we geleerd wat eager loading is en waarom het het N+1 probleem oplost.

### Kernbegrippen

| Begrip | Uitleg |
|--------|--------|
| **ERD** | Entity Relationship Diagram: visuele weergave van de databasestructuur |
| **Foreign key** | Een kolomverwijzing naar de primaire sleutel van een andere tabel |
| **`$fillable`** | Lijst van kolommen die via mass assignment ingevuld mogen worden |
| **One-to-many** | Één record heeft meerdere gerelateerde records (bijv. categorie → producten) |
| **Many-to-many** | Meerdere records aan meerdere records gekoppeld (bijv. producten ↔ orders) |
| **Pivot table** | Tussentabel voor een many-to-many relatie (bijv. `orderrows`) |
| **Eager loading** | Relaties vooraf inladen om N+1 queries te voorkomen |
| **N+1 probleem** | Bij elk record een extra query uitvoeren — erg inefficiënt bij veel data |

### Relaties in Eloquent

```php
// Één-op-veel: categorie heeft veel producten
// Category.php
public function products() {
    return $this->hasMany(Product::class);
}

// Veel-op-één: product hoort bij een categorie
// Product.php
public function category() {
    return $this->belongsTo(Category::class);
}
```

### Eager loading vs. N+1

```php
// SLECHT: N+1 probleem (1 query voor producten + 1 per product voor categorie)
$products = Product::all();
foreach ($products as $product) {
    echo $product->category->name; // Extra query per product!
}

// GOED: Eager loading (2 queries totaal)
$products = Product::with('category')->get();
foreach ($products as $product) {
    echo $product->category->name; // Geen extra query
}
```

### Overzicht van de datastructuur

```
users ──────────── orders ──── orderrows ──── products ──── categories
  │                  │                          │
  └── reviews ───────┘                          └── prices
```

### Belangrijke commando's

```bash
# Model met migration aanmaken in één stap
php artisan make:model Product -m

# Pivot table migration aanmaken
php artisan make:migration create_orderrows_table

# Seeder aanmaken
php artisan make:seeder ProductsSeeder

# Tests uitvoeren
php artisan test --group=CheckModelExistsTest
php artisan test --group=CheckMigrationExists
php artisan test --group=ModelsRelations
```

---

## Hoofdstuk 3 — CRUD Formulieren en Validatie

### Wat hebben we gedaan?
We hebben de volledige CRUD-functionaliteit voor producten gebouwd. Met een resource controller maken we producten aan, bekijken we de details, bewerken we de gegevens en verwijderen we producten. Formulieren zijn beveiligd met CSRF en gebruikersinvoer wordt gevalideerd. Daarnaast hebben we flash messages toegevoegd en een zoekfunctie gebouwd.

### Kernbegrippen

| Begrip | Uitleg |
|--------|--------|
| **CRUD** | Create, Read, Update, Delete — de vier basisbewerkingen op data |
| **Resource controller** | Controller met zeven standaard methoden voor CRUD |
| **CSRF** | Cross-Site Request Forgery: beveiligingstoken vereist bij POST-formulieren |
| **Validatie** | Controleren of gebruikersinvoer correct en compleet is |
| **Flash message** | Eenmalig bericht in de sessie dat na een actie getoond wordt |
| **`@method('PUT')`** | Simuleert PUT/DELETE in HTML-formulieren (HTML ondersteunt alleen GET/POST) |
| **`old()`** | Vult een veld in met de eerder ingevoerde waarde na een validatiefout |
| **`@error`** | Toont een foutmelding voor een specifiek formulierveld |

### Resource controller methoden

| Methode   | HTTP     | URL                    | Doel                         |
|-----------|----------|------------------------|------------------------------|
| `index`   | GET      | /products              | Lijst van alle producten     |
| `create`  | GET      | /products/create       | Formulier voor nieuw product |
| `store`   | POST     | /products              | Nieuw product opslaan        |
| `show`    | GET      | /products/{id}         | Eén product tonen            |
| `edit`    | GET      | /products/{id}/edit    | Formulier voor bewerken      |
| `update`  | PUT      | /products/{id}         | Product bijwerken            |
| `destroy` | DELETE   | /products/{id}         | Product verwijderen          |

### Codepatronen

**Formulier met CSRF en validatiefouten:**
```html
<form action="{{ route('products.store') }}" method="POST">
    @csrf
    <input type="text"
           name="name"
           class="form-control @error('name') is-invalid @enderror"
           value="{{ old('name') }}">
    @error('name')
        <div class="invalid-feedback">{{ $message }}</div>
    @enderror
</form>
```

**Validatie in de controller:**
```php
$validated = $request->validate([
    'name'        => 'required|string|max:255',
    'category_id' => 'required|exists:categories,id',
    'price'       => 'required|numeric|min:0',
]);
```

**Flash message doorsturen:**
```php
return redirect()->route('products.index')
    ->with('success', 'Product succesvol aangemaakt!');
```

**Flash message tonen in de view:**
```html
@if(session('success'))
    <div class="alert alert-success">{{ session('success') }}</div>
@endif
```

**Bewerken met `@method('PUT')`:**
```html
<form action="{{ route('products.update', $product) }}" method="POST">
    @csrf
    @method('PUT')
    ...
</form>
```

**Verwijderen met bevestiging:**
```html
<form action="{{ route('products.destroy', $product) }}"
      method="POST"
      onsubmit="return confirm('Weet je zeker dat je dit wilt verwijderen?')">
    @csrf
    @method('DELETE')
    <button type="submit" class="btn btn-danger">Verwijderen</button>
</form>
```

**Zoekfunctie met Eloquent:**
```php
$query = Product::with('category');

if ($request->filled('zoek')) {
    $query->where('name', 'like', '%' . $request->zoek . '%');
}

$products = $query->get();
```

### Belangrijke commando's

```bash
# Resource controller aanmaken
php artisan make:controller ProductController --resource

# Alle routes controleren
php artisan route:list --path=products

# Views aanmaken
php artisan make:view products.create
php artisan make:view products.show
php artisan make:view products.edit
php artisan make:view layouts.app

# Tests uitvoeren
php artisan test --group=ProductRoutesTest
php artisan test --group=ProductCreateTest
php artisan test --group=ProductCrudTest
```

---

## Overzicht van alle leerdoelen

### Hoofdstuk 1
- [x] Laravel Herd installeren en een nieuw project opstarten
- [x] De mappenstructuur van Laravel begrijpen
- [x] Routes, controllers en views aanmaken
- [x] Het MVC-patroon toepassen
- [x] Een model, migration en seeder aanmaken voor categorieën

### Hoofdstuk 2
- [x] Models met `$fillable` instellen
- [x] Migrations invullen volgens het ERD (met foreign keys)
- [x] One-to-many en many-to-many relaties implementeren in Eloquent
- [x] Seeders schrijven voor basisdata
- [x] Eager loading gebruiken om het N+1 probleem te voorkomen
- [x] Producten tonen met categorie, prijs en reviews

### Hoofdstuk 3
- [x] Een resource controller gebruiken voor CRUD
- [x] Formulieren bouwen met CSRF-beveiliging
- [x] Gebruikersinvoer valideren met Laravel validation rules
- [x] Foutmeldingen per veld tonen met `@error`
- [x] Flash messages tonen na een actie
- [x] Producten aanmaken, bewerken en verwijderen
- [x] Een zoekfunctie bouwen met Eloquent

---

## Wat komt hierna? (Hoofdstuk 4 en verder)

- **Authenticatie** met Laravel Breeze (login, registratie, middleware)
- **Autorisatie**: alleen beheerders mogen producten beheren
- **Reviews** toevoegen als ingelogde gebruiker
- **Bestellingen** afhandelen
- **Paginatie** voor lange lijsten
