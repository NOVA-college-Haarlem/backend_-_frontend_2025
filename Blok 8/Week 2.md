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

Pas de view `links.blade.php` aan zodat de layout `base-layout.blade.php` wordt gebruikt. Voeg de tekst "Links Page" toe aan de pagina.

### Les 5: Database

In de vijfde les leer je hoe je een database kan gebruiken in Laravel. Een database is een verzameling van gegevens die op een gestructureerde manier zijn opgeslagen. In Laravel kan je gebruik maken van de Eloquent ORM (Object-Relational Mapping) om gegevens uit de database te halen en te bewerken.

#### Database sqlite

In deze les maken we gebruik van een SQLite database. SQLite is een lichtgewicht database die geen aparte server nodig heeft. Je kan een SQLite database eenvoudig aanmaken met Laravel.

Bij het initialiseren van een nieuw Laravel project wordt er standaard een SQLite database aangemaakt in de map `database/database.sqlite`.

#### Migraties

In Laravel kan je gebruik maken van migraties om de database te structureren. Een migratie is een PHP-klasse die de structuur van de database beschrijft. Met een migratie kan je tabellen aanmaken, kolommen toevoegen en verwijderen, en de structuur van de database aanpassen.

1. Maak een nieuwe migratie aan met de naam `create_companies_table`
   ```bash
   php artisan make:migration create_companies_table
   ```
2. Open het bestand `database/migrations/2022_01_01_000000_create_companies_table.php`
3. Voeg de volgende code toe aan de migratie om de tabel `companies` aan te maken

   ```php
   public function up()
   {
       Schema::create('companies', function (Blueprint $table) {
           $table->id();
           $table->string('name');
           $table->string('slug')->unique();
           $table->text('description')->nullable();

           $table->timestamps();
       });
   }

   public function down()
   {
       Schema::dropIfExists('companies');
   }
   ```

4. Voer de migratie uit om de tabel `companies` aan te maken
   ```bash
    php artisan migrate
   ```
5. Controleer of de tabel `companies` is aangemaakt in de **database**

#### Seeder

In Laravel kan je gebruik maken van seeders om de database te vullen met testgegevens. Een seeder is een PHP-klasse die gegevens in de database invoegt. Met een seeder kan je de database vullen met testgegevens zodat je de functionaliteit van je website kan testen.

1. Maak een nieuwe seeder aan met de naam `CompanySeeder`
   ```bash
   php artisan make:seeder CompanySeeder
   ```
2. Open het bestand `database/seeders/CompanySeeder.php`
3. Voeg de volgende code toe aan de seeder om testgegevens in de tabel `companies` in te voegen

   ```php
   public function run()
   {
       DB::table('companies')->insert([
           'name' => 'Webbureau Van Steen',
           'slug' => 'webbureau-van-steen',
           'description' => 'Webbureau Van Steen voor al uw websites en apps',
           'created_at' => now(),
           'updated_at' => now(),
       ]);

       DB::table('companies')->insert([
           'name' => 'Jose Monkey',
           'slug' => 'jose-monkey',
           'description' => 'Jose Monkey Coding for profs.',
           'created_at' => now(),
           'updated_at' => now(),
       ]);
   }
   ```

4. Voer de seeder uit om de testgegevens in de tabel `companies` in te voegen
   ```bash
   php artisan db:seed --class=CompanySeeder
   ```

> Je kunt ook een complete nieuwe database vullen met testgegevens door de `DatabaseSeeder.php` te wijzigen:

```php
public function run()
{
    $this->call([
        CompanySeeder::class,
      //   IntershipsSeeder::class,
    ]);
}
```

> En daarna het volgende commando uit te voeren: `php artisan migrate:fresh --seed`

##### Opdracht 1

1. Open een terminal
2. Maak een nieuwe migratie aan met de naam `create_interships_table` om de tabel `internships` aan te maken.
3. Voeg de volgende kolommen toe aan de tabel `internships`: `title`, `slug`, `start_date`, `end_date`, `hours_per_week`, `compensation`, `type`, `description`, `level_of_education`, `created_at` en `updated_at`.
4. Voer de migratie uit om de tabel `internships` aan te maken.

##### Opdracht 2

1. Open een terminal
2. Maak een nieuwe seeder aan met de naam `IntershipsSeeder` om testgegevens in de tabel `internships` in te voegen.
3. Voeg de volgende testgegevens toe aan de tabel `internships`: `internships`, `slug`, `start_date`, `end_date`, `hours_per_week`, `compensation`, `type`, `description`, `level_of_education`, `created_at` en `updated_at`.
4. Voer de seeder uit om de testgegevens in de tabel `internships` in te voegen.

#### Van DB via Controller naar View

1. Open een terminal en maak een InternshipController aan
   ```bash
   php artisan make:controller InternshipController
   ```
2. Open het bestand `app/Http/Controllers/InternshipController.php`
3. Voeg de volgende methode toe aan de controller om alle internships uit de database te halen
   ```php
   public function index()
   {
       $internships = DB::table('internships')->get();
       return view('internships', compact('internships'));
   }
   ```
4. Sla de wijzigingen op
5. Open het bestand `routes/web.php`
6. Voeg de volgende route toe om de methode `index` van de controller `InternshipController` aan te roepen
   ```php
   Route::get('/internships', [InternshipController::class, 'index']);
   ```
7. Sla de wijzigingen op
8. Maak een nieuwe view `internships.blade.php` aan
9. Voeg de volgende code toe aan `internships
10. ```php
    <x-base-layout>
        <h1>nternships</h1>
        <ul>
            @foreach ($internships as $internship)
                <li>
                    <h2>{{ $internship->title }}</h2>
                    <p>{{ $internship->start_date }}</p>
                    <p>{{ $internship->enddate_date }}</p>
                </li>
            @endforeach
        </ul>
    </x-base-layout>
    ```
11. Sla de wijzigingen op
12. Open de pagina `/internships` in je browser en controleer of de tekst wordt weergegeven

##### Opdracht 3

1. Doe nu hetzelde zoals het bovenstaande voor opleidingen:
2. Maak een controller: EducationController
3. Maak een seeder: EducationSeeder
4. Maak een view: educations/index
5. Zorg dat je de educations kunt zien op het scherm
