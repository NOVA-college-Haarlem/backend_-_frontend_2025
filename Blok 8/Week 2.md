## Week 2

### Leerdoelen week 2

> - Ik kan een layout aanmaken in Laravel.
> - Ik kan een layout gebruiken in Laravel.
> - Ik kan een database aanmaken in Laravel.
> - Ik kan een tabel aanmaken in de database met een migratie.
> - Ik kan testgegevens invoegen in de database met een seeder.
> - Ik kan gegevens uit de database halen
> - Ik kan gegevens doorgeven aan de view
> - Ik kan een nieuwe route en view toevoegen aan mijn website.

### Les 4: Layouts en Blade

In de vierde les leer je hoe je layouts en Blade kan gebruiken in Laravel. Een layout is een sjabloon voor je website waarin je de structuur van je website kan bepalen. Met Blade kan je dynamische content toevoegen aan je views. Blade is een template engine die wordt gebruikt in Laravel.

#### Layout aanmaken

Er zijn twee manieren om een layout aan te maken in Laravel. Wij maken gebruik van Component-based layouts.

1. Open een terminal.
2. Maak een nieuw component aan met de naam `base-layout`:
   ```bash
   php artisan make:component BaseLayout
   ```
3. Open het bestand `resources/views/components/base-layout.blade.php`
4. Knip en plak alle HTML van `<!DOCTYPE>` tot en met `</nav>` (de regels 1 t/m 29) van `home.blade.php` naar `base-layout.blade.php`.
5. Knip en plak ook de onderste regels, de footer en de html en body sluit-tags van `home.blade.php` naar `base-layout.blade.php`. (regels 163 tot en met 172)
6. Voeg de volgende code toe aan `base-layout.blade.php` om de content van de pagina weer te geven. Precies na de regel met `</nav>`.
   ```php
   {{ $slot }}
   ```
7. Sla de wijzigingen op.

#### Layout gebruiken

1. Open het bestand `resources/views/about.blade.php`
2. Verwijder alle HTML van `about.blade.php`
3. Voeg de volgende code toe aan `about.blade.php` om de layout te gebruiken
   ```php
   <x-base-layout>
       <h1>About</h1>
   </x-base-layout>
   ```
4. Sla de wijzigingen op
5. Open de pagina `/about` in je browser en controleer of de tekst wordt weergegeven

##### Opdracht 1

Pas de view `contact.blade.php` aan zodat de layout `base-layout.blade.php` wordt gebruikt. Voeg de tekst "Contact" toe aan de pagina.

##### Opdracht 2

Pas de view `simple-static.blade.php` aan zodat de layout `base-layout.blade.php` wordt gebruikt. Voeg de tekst "Simple Page" toe aan de pagina.

### Les 5: Database

In de vijfde les leer je hoe je een database kan gebruiken in Laravel. Een database is een verzameling van gegevens die op een gestructureerde manier zijn opgeslagen. In Laravel kan je gebruik maken van de Eloquent ORM (Object-Relational Mapping) om gegevens uit de database te halen en te bewerken.

#### Database sqlite

In deze les maken we gebruik van een SQLite database. SQLite is een lichtgewicht database die geen aparte server nodig heeft. Je kan een SQLite database eenvoudig aanmaken met Laravel.

Bij het initialiseren van een nieuw Laravel project wordt er standaard een SQLite database aangemaakt in de map `database/database.sqlite`.

#### Migraties

In Laravel kan je gebruik maken van migraties om de database te structureren. Een migratie is een PHP-klasse die de structuur van de database beschrijft. Met een migratie kan je tabellen aanmaken, kolommen toevoegen en verwijderen, en de structuur van de database aanpassen.

1. Maak een nieuwe migratie aan met de naam `create_categories_table`
   ```bash
   php artisan make:migration create_categories_table
   ```
2. Open het bestand `database/migrations/2022_01_01_000000_create_categories_table.php`
3. Voeg de volgende code toe aan de migratie om de tabel `categories` aan te maken

   ```php
   public function up()
   {
       Schema::create('categories', function (Blueprint $table) {
           $table->id();
           $table->string('name');
           $table->string('slug')->unique();
           $table->text('description')->nullable();
           $table->timestamps();
       });
   }

   public function down()
   {
       Schema::dropIfExists('categories');
   }
   ```

4. Voer de migratie uit om de tabel `categories` aan te maken
   ```bash
    php artisan migrate
   ```
5. Controleer of de tabel `categories` is aangemaakt in de **database**

#### Seeder

In Laravel kan je gebruik maken van seeders om de database te vullen met testgegevens. Een seeder is een PHP-klasse die gegevens in de database invoegt. Met een seeder kan je de database vullen met testgegevens zodat je de functionaliteit van je website kan testen.

1. Maak een nieuwe seeder aan met de naam `CategorySeeder`
   ```bash
   php artisan make:seeder CategorySeeder
   ```
2. Open het bestand `database/seeders/CategorySeeder.php`
3. Voeg de volgende code toe aan de seeder om testgegevens in de tabel `categories` in te voegen

   ```php
   public function run()
   {
       DB::table('categories')->insert([
           'name' => 'PHP',
           'slug' => 'php',
           'description' => 'PHP is a popular programming language for web development.',
           'created_at' => now(),
           'updated_at' => now(),
       ]);

       DB::table('categories')->insert([
           'name' => 'JavaScript',
           'slug' => 'javascript',
           'description' => 'JavaScript is a programming language for web development.',
           'created_at' => now(),
           'updated_at' => now(),
       ]);
   }
   ```

4. Voer de seeder uit om de testgegevens in de tabel `categories` in te voegen
   ```bash
   php artisan db:seed --class=CategorySeeder
   ```

> Je kunt ook een complete nieuwe database vullen met testgegevens door de `DatabaseSeeder.php` te wijzigen:

```php
public function run()
{
    $this->call([
        CategorySeeder::class,
      //   PostSeeder::class,
    ]);
}
```

> En daarna het volgende commando uit te voeren: `php artisan migrate:fresh --seed`

##### Opdracht 1

1. Open een terminal
2. Maak een nieuwe migratie aan met de naam `create_posts_table` om de tabel `posts` aan te maken.
3. Voeg de volgende kolommen toe aan de tabel `posts`: `title`, `slug`, `content`, `category_id`, `created_at` en `updated_at`. 4
4. Voer de migratie uit om de tabel `posts` aan te maken.

##### Opdracht 2

1. Open een terminal
2. Maak een nieuwe seeder aan met de naam `PostSeeder` om testgegevens in de tabel `posts` in te voegen.
3. Voeg de volgende testgegevens toe aan de tabel `posts`: `title`, `slug`, `content`, `category_id`, `created_at` en `updated_at`.
4. Voer de seeder uit om de testgegevens in de tabel `posts` in te voegen.

#### Van DB via Controller naar View

1. Open een terminal en maak een PostController aan
   ```bash
   php artisan make:controller PostController
   ```
2. Open het bestand `app/Http/Controllers/PostController.php`
3. Voeg de volgende methode toe aan de controller om alle posts uit de database te halen
   ```php
   public function index()
   {
       $posts = DB::table('posts')->get();
       return view('posts', compact('posts'));
   }
   ```
4. Sla de wijzigingen op
5. Open het bestand `routes/web.php`
6. Voeg de volgende route toe om de methode `index` van de controller `PostController` aan te roepen
   ```php
   Route::get('/posts', [PostController::class, 'index']);
   ```
7. Sla de wijzigingen op
8. Maak een nieuwe view `posts.blade.php` aan
9. Voeg de volgende code toe aan `posts
10. ```php
    <x-base-layout>
        <h1>Posts</h1>
        <ul>
            @foreach ($posts as $post)
                <li>
                    <h2>{{ $post->title }}</h2>
                    <p>{{ $post->content }}</p>
                </li>
            @endforeach
        </ul>
    </x-base-layout>
    ```
11. Sla de wijzigingen op
12. Open de pagina `/posts` in je browser en controleer of de tekst wordt weergegeven

##### Opdracht 3

1. Open een terminal
2. Maak een nieuwe controller aan met de naam `CategoryController`.
3. Voeg een methode `index` toe
4. Pas de methode index aan: zorg ervoor dat alle `categories` uit de database gehaald worden
5. Stuur alle data naar de view `categories.blade.php`.
6. Maak een nieuwe route aan in het bestand `routes/web.php` met de naam `/categories` maar wel een get methode.
7. Maak een nieuwe view `categories.blade.php` aan die de titel en de inhoud van de categories weergeeft.
