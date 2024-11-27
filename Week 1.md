## Week 1

### Leerdoelen week 1

> - Ik kan Laravel Herd installeren op mijn computer.
> - Ik kan een Laravel project aanmaken met Laravel Herd.
> - Ik kan de homepage van mijn website aanpassen.
> - Ik kan Bootstrap CSS toevoegen aan mijn website.
> - Ik kan een nieuwe route en view toevoegen aan mijn website.
> - Ik kan een controller aanmaken in Laravel.
> - Ik kan de homepage van mijn website aanpassen met een controller.
> - Ik kan data doorgeven aan de view met een controller.

### Les 1: Installatie Laravel

In de eerste les leer je hoe je Laravel installeert op je computer. Laravel is een PHP framework en werkt dus met PHP. Je moet dus eerst PHP installeren op je computer voordat je Laravel kan installeren. In deze les leer je hoe je PHP en Laravel installeert op je computer.

We maken gebruik van Laravel Herd.

#### Installeer Laravel Herd

1. Ga naar de officiële Laravel Herd-website: https://herd.laravel.com.
2. Download de installatieversie voor Windows.
3. Open het gedownloade bestand en volg de installatie-instructies.

#### Eerste Laravel project

1. Open Laravel Herd.
2. Klik op de knop "Create Site".
3. Vul de naam van je site `Blog` in en klik op de knop "Create Site".
4. Wacht tot de site is aangemaakt.
5. Klik op de knop "Open Site" om de site te openen in je browser.
6. Je ziet nu de standaard Laravel homepage.
7. Gefeliciteerd, je hebt Laravel geïnstalleerd!

### Les 2: Views en Routes

In de tweede les leer je hoe je de homepage van je website kan aanpassen. Je leert hoe je de tekst op de homepage kan aanpassen.

#### Aanpassen van de homepage view

1. Open het project in VS Code
2. Open het bestand `resources/views/welcome.blade.php`
3. Pas de tekst op de homepage aan
   1. Verander de titel van de pagina
   2. Verander de koptekst `Laracasts` op de pagina in de naam `Laravel Video Tutorials`
4. Sla de wijzigingen op
5. Open de homepage in je browser en controleer of de tekst is aangepast

#### Bootstrap CSS toevoegen

1. Download een template van de website https://startbootstrap.com/. Klik op de volgende link om een template te downloaden: https://startbootstrap.com/template/blog-home.
2. Pak het bestand uit.
3. Kopieer de map `css` en de map `js` naar de map `public` van je Laravel project.
4. Kopieer de map `img` naar de map `public` van je Laravel project.
5. Kopieer het bestand `index.html` naar de map `resources/views` van je Laravel project.
6. Hernoem het bestand `index.html` naar `home.blade.php`.
7. Open het bestand `home.blade.php` en pas de links naar de CSS- en JS-bestanden aan.
8. Wijzig de route van de root `/` naar `/home` in het bestand `routes/web.php`.
9. Controleer of de homepage wordt weergegeven in je browser.

#### Route en View toevoegen

1. Open het bestand `routes/web.php`
2. Voeg een nieuwe route toe
   ```php
   Route::get('/about', function () {
       return view('about');
   });
   ```
3. Maak een nieuw bestand `about.blade.php` in de map `resources/views`
4. Voeg de tekst "Dit is de about pagina" toe aan het bestand
5. Open de pagina `/about` in je browser en controleer of de tekst wordt weergegeven

#### Nog een route en View toevoegen

1. Voeg een nieuwe route toe aan het bestand `routes/web.php`
   ```php
   Route::get('/contact', function () {
       return view('contact');
   });
   ```
2. Maak een nieuw bestand `contact.blade.php` in de map `resources/views`
3. Voeg de tekst "Dit is de contact pagina" toe aan het bestand
4. Open de pagina `/contact` in je browser en controleer of de tekst wordt weergegeven

##### Opdracht 1

Maak een nieuwe pagina `blog` aan met de tekst "Dit is de blog pagina". Voeg een nieuwe route toe aan het bestand `routes/web.php` en maak een nieuw bestand `blog.blade.php` in de map `resources/views`. Open de pagina `/blog` in je browser en controleer of de tekst wordt weergegeven.

##### Opdracht 2

Open de pagina `/services` in je browser en bekijk de foutmelding. Wat zie je? Hoe kan je dit oplossen?

### Les 3: Controllers

In de derde les leer je hoe je controllers kan gebruiken in Laravel. Een controller is een PHP-klasse die de logica van je website bevat. In een controller kan je bijvoorbeeld de gegevens uit de database halen en doorgeven aan de view. Een controller kan je vergelijken met een chef-kok in een restaurant. De chef-kok bereidt het eten en geeft het door aan de serveerster, die het eten aan de klant serveert.

#### Controller aanmaken

1. Maak een nieuwe controller aan met de naam `PagesController`
   ```bash
   php artisan make:controller PagesController
   ```

#### Controller logica toevoegen

1. Open de controller `app/Http/Controllers/PagesController.php`
2. Voeg de volgende methode toe aan de controller
   ```php
   public function about()
   {
       return view('about');
   }
   ```
3. Voeg de volgende methode toe aan de controller
   ```php
    public function contact()
    {
         return view('contact');
    }
   ```
4. Voeg de volgende methode toe aan de controller
5. ```php
   public function blog()
   {
        return view('blog');
   }
   ```
6. Sla de wijzigingen op

#### Route aanpassen

1. Open het bestand `routes/web.php`
2. Verwijder de bestaande routes voor `/about`, `/contact` en `/blog`
3. Voeg de volgende routes toe

   ```php
    Route::get('/about', [PageController::class, 'about']);
    Route::get('/contact', [PageController::class, 'contact']);
    Route::get('/blog', [PageController::class, 'blog']);
   ```

4. Sla de wijzigingen op
5. Open de pagina's `/about`, `/contact` en `/blog` in je browser en controleer of de tekst wordt weergegeven

#### Data doorgeven aan de view

1. Open de controller `app/Http/Controllers/PagesController.php`
2. Pas de methode `about` aan
   ```php
   public function about()
   {
       $name = 'John Doe';
       return view('about', compact('name'));
   }
   ```
3. Pas de view `about.blade.php` aan
   ```html
   <h1>About {{ $name }}</h1>
   ```
4. Sla de wijzigingen op
5. Open de pagina `/about` in je browser en controleer of de tekst wordt weergegeven

##### Opdracht 1

Pas de methode `contact` aan in de controller `PagesController` zodat de view `contact.blade.php` de variabele `$email` ontvangt. Pas de view `contact.blade.php` aan zodat de variabele `$email` wordt weergegeven.

##### Opdracht 2

Pas de methode `blog` aan in de controller `PagesController` zodat de view `blog.blade.php` de variabele `$posts` ontvangt. Pas de view `blog.blade.php` aan zodat de variabele `$posts` wordt weergegeven.
