### CRUD uitbreiden: Producten

#### opdracht 12: Product model maken

1. Om producten uit de database te halen, maken we nu het model Product.
   ```bash
   php artisan make:model Product
   ```
2. Open het model `app/Models/Product.php`.
3. Voeg de volgende code toe:
   ```php
   protected $fillable = ['name', 'description', 'category_id'];

   public function category()
   {
       return $this->belongsTo(Category::class);
   }
   ```

#### opdracht 13: Product migration maken

1. Maak een migration voor de products tabel.
   ```bash
   php artisan make:migration create_products_table
   ```
2. Open de migration in `database/migrations/..._create_products_table.php`.
3. Gebruik de volgende code in de `up` methode:
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
4. Draai de migrations:
   ```bash
   php artisan migrate
   ```

#### opdracht 14: Product seeder maken

1. Maak een seeder aan voor producten:
   ```bash
   php artisan make:seeder ProductsSeeder
   ```
2. Open `database/seeders/ProductsSeeder.php` en voeg toe:
   ```php
   <?php

   use App\Models\Category;
   use App\Models\Product;
   use Illuminate\Database\Seeder;

   class ProductsSeeder extends Seeder
   {
       public function run(): void
       {
           $boardgames = Category::where('name', 'Bordspellen')->first();
           $cardgames = Category::where('name', 'Kaartspellen')->first();

           Product::insert([
               [
                   'name' => 'Catan',
                   'description' => 'Strategiespel voor 3 tot 4 spelers',
                   'category_id' => $boardgames?->id,
               ],
               [
                   'name' => 'Carcassonne',
                   'description' => 'Tegellegspel met middeleeuws thema',
                   'category_id' => $boardgames?->id,
               ],
               [
                   'name' => 'Uno',
                   'description' => 'Snel kaartspel voor het hele gezin',
                   'category_id' => $cardgames?->id,
               ],
           ]);
       }
   }
   ```
3. Voeg de seeder toe in `database/seeders/DatabaseSeeder.php`:
   ```php
   public function run()
   {
       $this->call([
           CategoriesSeeder::class,
           ProductsSeeder::class,
       ]);
   }
   ```
4. Draai de seeders:
   ```bash
   php artisan migrate:fresh --seed
   ```
Als je nu `database.sqlite` opent en de products tabel bekijkt, zie je dat de 3 spellen zijn toegevoegd.

#### opdracht 15: Product controller maken

1. Maak de controller aan:
   ```bash
   php artisan make:controller ProductController
   ```
2. Open `app/Http/Controllers/ProductController.php`.
3. Voeg de volgende code toe:
   ```php
   use App\Models\Product;

   public function index()
   {
       $products = Product::with('category')->get();
       return view('products.index', compact('products'));
   }
   ```

#### opdracht 16: Product route maken

1. Voeg een route toe in `routes/web.php`:
   ```php
   Route::get('/products', [ProductController::class, 'index']);
   ```

#### opdracht 17: Product view maken

1. Maak de map `resources/views/products` en het bestand `index.blade.php`.
2. Voeg deze code toe:
   ```html
   <!DOCTYPE html>
   <html lang="en">
   <head>
       <meta charset="UTF-8">
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <title>Producten overzicht</title>
   </head>
   <body>
       <h1>Producten overzicht</h1>

       @if($products->isEmpty())
           <p>Geen producten gevonden.</p>
       @else
           @foreach($products as $product)
               <div>
                   <h2>{{ $product->name }}</h2>
                   <p>{{ $product->description }}</p>
                   <p>Categorie: {{ $product->category->name ?? 'Onbekend' }}</p>
               </div>
           @endforeach
       @endif
   </body>
   </html>
   ```

#### opdracht 18: Test je product-overzicht

1. Open in de browser: https://spelshop.test/products
2. Controleer of je producten ziet met hun categorie.
