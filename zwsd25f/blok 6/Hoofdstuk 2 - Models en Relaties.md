# Hoofdstuk 2 - Models en Relaties

We werken de datastructuur uit volgens het ERD en koppelen alle modellen, migrations, seeders en relaties.  
![ERD](./images/erd.png)

## Inhoudsopgave
- [Hoofdstuk 2 - Models en Relaties](#hoofdstuk-2---models-en-relaties)
  - [Inhoudsopgave](#inhoudsopgave)
    - [Leerdoelen](#leerdoelen)
    - [Benodigdheden](#benodigdheden)
      - [Opdracht 1: Models \& migrations genereren](#opdracht-1-models--migrations-genereren)
        - [Opdracht 1.1 Test de models](#opdracht-11-test-de-models)
      - [Opdracht 2: Migrations invullen (volgens ERD)](#opdracht-2-migrations-invullen-volgens-erd)
        - [Opdracht 2.1 Test de migrations](#opdracht-21-test-de-migrations)
      - [Opdracht 3: Seeders](#opdracht-3-seeders)
  - [Opdracht 4: Relaties in de models](#opdracht-4-relaties-in-de-models)
  - [Opdracht 5: Controller \& route voor producten](#opdracht-5-controller--route-voor-producten)
  - [Opdracht 6: View voor producten](#opdracht-6-view-voor-producten)
  - [Opdracht 7: Eager loading vs N+1](#opdracht-7-eager-loading-vs-n1)
  - [Opdracht 8: Validatie \& mass assignment](#opdracht-8-validatie--mass-assignment)
  - [Opdracht 9: Tests](#opdracht-9-tests)
  - [Afronding / Reflectie](#afronding--reflectie)

### Leerdoelen
- Models maken en `$fillable` instellen.
- Migrations invullen volgens het ERD.
- Relaties implementeren (one-to-many, many-to-many via pivot).
- Seeders toevoegen voor basisdata.
- Eager loading gebruiken om N+1 te voorkomen.
- Basis tests draaien voor relaties en queries.

### Benodigdheden
- Werkend spelshop-project uit Hoofdstuk 1.
- Database connectie actief.
- Command-line gereed: `php artisan migrate:fresh --seed` mag gebruikt worden.

---

#### Opdracht 1: Models & migrations genereren
1. Maak de modellen met migrations:
   ```bash
   php artisan make:model Product -m
   php artisan make:model Price -m
   php artisan make:model Review -m
   php artisan make:model Order -m
   php artisan make:model Role -m
   ```
Een tussentabel (pivot table) is een tabel die gebruikt wordt om de relatie tussen twee modellen op te slaan. In ons geval is de tussentabel de tabel die gebruikt wordt om de relatie tussen producten en orders op te slaan. Hiervoor is geen model nodig.
```bash
php artisan make:migration create_orderrows_table
```

##### Opdracht 1.1 Test de models

1. Controleer met behulp van de aangeleverde test of de models gemaakt zijn:
```bash
php artisan test --group=CheckModelExistsTest
```

#### Opdracht 2: Migrations invullen (volgens ERD)
Vul per migration de kolommen + foreign keys in. Voorbeeld (products):
```php
public function up()
{
    Schema::create('products', function (Blueprint $table) {
        $table->id();
        $table->string('name');
        $table->mediumText('description')->nullable();
        $table->foreignId('category_id')->constrained()->cascadeOnDelete();
        $table->timestamps();
    });
}
```
Gebruik dit als leidraad voor de andere tabellen:
- `categories`: `name`
- `prices`: `price` (int, cents), `in_effect_date` (datetime), `product_id`
- `reviews`: `comment` (mediumtext), `rating` (int 1-5), `user_id`, `product_id`
- `orders`: `orderdate` (datetime), `user_id`, `status` (enum: ordered/delivered/canceled), `total_price` (int, cents)
- `orderrows`: `order_id`, `product_id`, `quantity`, `total_price` (int, cents)
- `roles`: `name`
- `users`: voeg `role_id` toe als foreign key (als dat nog niet in de migration stond)

Voer migrations uit:
```bash
php artisan migrate
```

##### Opdracht 2.1 Test de migrations
1. Controleer met behulp van de aangeleverde test of de seeders gemaakt zijn:
```bash
php artisan test --group=CheckMigrationExists
```

#### Opdracht 3: Seeders
1. Maak seeders:
   ```bash
   php artisan make:seeder CategoriesSeeder
   php artisan make:seeder ProductsSeeder
   php artisan make:seeder PricesSeeder
   php artisan make:seeder ReviewsSeeder
   ```
2. Voorbeeld `CategoriesSeeder`:
   ```php
   use App\Models\Category;

   public function run()
   {
       $categories = [
           ['name' => 'Bordspellen'],
           ['name' => 'Kaartspellen'],
           ['name' => 'Puzzels'],
       ];
       Category::insert($categories);
   }
   ```
3. Koppel alle seeders in `DatabaseSeeder`:
   ```php
   public function run()
   {
       $this->call([
           CategoriesSeeder::class,
           ProductsSeeder::class,
           PricesSeeder::class,
           ReviewsSeeder::class,
       ]);
   }
   ```
4. Draai seeding:
   ```bash
   php artisan db:seed
   ```

## Opdracht 4: Relaties in de models
Voeg `$fillable` en relaties toe:
```php
// Category.php
protected $fillable = ['name'];
public function products() { return $this->hasMany(Product::class); }

// Product.php
protected $fillable = ['name', 'description', 'category_id'];
public function category() { return $this->belongsTo(Category::class); }
public function prices() { return $this->hasMany(Price::class); }
public function reviews() { return $this->hasMany(Review::class); }
public function orderrows() { return $this->hasMany(Orderrow::class); }

// Price.php
protected $fillable = ['price', 'in_effect_date', 'product_id'];
public function product() { return $this->belongsTo(Product::class); }

// Review.php
protected $fillable = ['comment', 'rating', 'user_id', 'product_id'];
public function product() { return $this->belongsTo(Product::class); }
public function user() { return $this->belongsTo(User::class); }

// Order.php
protected $fillable = ['orderdate', 'user_id', 'status', 'total_price'];
public function user() { return $this->belongsTo(User::class); }
public function orderrows() { return $this->hasMany(Orderrow::class); }

// Orderrow.php
protected $fillable = ['order_id', 'product_id', 'quantity', 'total_price'];
public function order() { return $this->belongsTo(Order::class); }
public function product() { return $this->belongsTo(Product::class); }

// User.php
public function orders() { return $this->hasMany(Order::class); }
public function reviews() { return $this->hasMany(Review::class); }
public function role() { return $this->belongsTo(Role::class); }

// Role.php
protected $fillable = ['name'];
public function users() { return $this->hasMany(User::class); }
```

## Opdracht 5: Controller & route voor producten
1. Maak controller:
   ```bash
   php artisan make:controller ProductController
   ```
2. Methode `index`:
   ```php
   public function index()
   {
       // Laad categorie en laatste prijs per product
       $products = Product::with([
           'category',
           'prices' => fn($q) => $q->latest('in_effect_date')->limit(1),
           'reviews',
       ])->get();

       return view('products.index', compact('products'));
   }
   ```
3. Route toevoegen in `routes/web.php`:
   ```php
   use App\Http\Controllers\ProductController;
   Route::get('/products', [ProductController::class, 'index']);
   ```

## Opdracht 6: View voor producten
`resources/views/products/index.blade.php`:
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Producten</title>
</head>
<body>
    <h1>Producten</h1>

    @if($products->isEmpty())
        <p>Geen producten gevonden.</p>
    @else
        @foreach($products as $product)
            <div>
                <h2>{{ $product->name }}</h2>
                <p>Categorie: {{ $product->category->name ?? 'Onbekend' }}</p>
                <p>Huidige prijs: 
                    {{ optional($product->prices->first())->price ? number_format($product->prices->first()->price / 100, 2) : 'n.v.t.' }}
                </p>
                <p>Aantal reviews: {{ $product->reviews->count() }}</p>
            </div>
        @endforeach
    @endif
</body>
</html>
```

## Opdracht 7: Eager loading vs N+1
1. Vergelijk:
   - Zonder eager loading: `Product::all()`
   - Met eager loading: `Product::with('category','prices')->get()`
2. Log queries (bijv. `DB::enableQueryLog()` of Laravel Debugbar) en noteer het verschil in aantal queries.

## Opdracht 8: Validatie & mass assignment
1. Voeg `$fillable` toe zoals hierboven.
2. Bij opslaan/bijwerken (bijv. in `store`): valideer `name`, `category_id`, `price`.
3. Maak bij het aanmaken van een product direct ook een `Price` record aan (in cents).

## Opdracht 9: Tests
1. Maak een testgroep `ModelsRelations` met Pest of PHPUnit.
2. Test dat:
   - `Category->products` werkt.
   - `Product->prices` de laatste prijs kan geven.
   - `Order->orderrows` en `Orderrow->product` werken.
   - `Review->product` en `Review->user` werken.
3. Draai de tests:
   ```bash
   php artisan test --group="ModelsRelations"
   ```

## Afronding / Reflectie
- Je hebt het volledige datamodel volgens het ERD opgezet met models, migrations, seeders en relaties.
- Je toont producten met categorie, prijs en reviews, en gebruikt eager loading om N+1 te vermijden.
- Volgende stap: CRUD uitbreiden, authenticatie/roles toepassen en filters/paginatie toevoegen.

