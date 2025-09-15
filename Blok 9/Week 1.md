# Blok 9 - Laravel Nieuws Project

## Week 1 - Project Setup

### Introductie
We gaan een nieuwswebsite bouwen met Laravel. In dit project leren we de basis van Laravel en maken we een volledig functionele nieuwswebsite met artikelen, categorieën en gebruikersbeheer.

### Opdracht 1: Project Aanmaken

1. Maak gebruik van Laravel Herd.
2. Kies voor het gebruik van Laravel Breeze voor authenticatie.
3. Noem het project "nieuws".
4. Kies Blade voor de frontend.
5. Testing Framework: PHPUnit.
6. Target location: _hoef je niet te kiezen_.
7. Ga naar http://nieuws.test.

### Opdracht 2: Maak Model

1. Maak een nieuw model aan met de naam "Post".
2. Maak gebruik van de volgende terminal commando:
    ```bash
    php artisan make:model Post -m -c -s
    ```
3. Maak een nieuw model aan met de naam "Category".
4. Maak gebruik van de volgende terminal commando:
    ```bash
    php artisan make:model Category -m -c -s
    ```

### Opdracht 3: Pas de Migration aan    (2022_01_01_000000_create_posts_table.php en 2022_01_01_000000_create_categories_table.php)

1. Open het bestand `database/migrations/2022_01_01_000000_create_posts_table.php`
2. Voeg de volgende code toe aan de migratie om de tabel `posts` aan te maken
    ```php
    $table->id();
    $table->string('title');
    $table->text('content');
    $table->timestamps();
    ```
3. Open het bestand `database/migrations/2022_01_01_000000_create_categories_table.php`
4. Voeg de volgende code toe aan de migratie om de tabel `categories` aan te maken 
    ```php
    $table->id();
    $table->string('name');
    $table->timestamps();
    ```
5. Voer de migraties uit met het volgende commando:
    ```bash
    php artisan migrate
    ```

### Opdracht 4: Maak een Seeder

1. Maak een nieuwe seeder aan met de naam "PostSeeder".
2. Maak gebruik van de volgende terminal commando:
    ```bash
    php artisan make:seeder PostSeeder
    ```
3. Open het bestand `database/seeders/PostSeeder.php`
4. Voeg de volgende code toe aan de seeder om de tabel `posts` in te vullen met testgegevens    
5. Voer de seeder uit met het volgende commando:
    ```bash
    php artisan db:seed --class=PostSeeder
    ```

### Opdracht 5: Maak een Controller

1. Maak een nieuwe controller aan met de naam "PostController".
2. Maak gebruik van de volgende terminal commando:
    ```bash
    php artisan make:controller PostController
    ```