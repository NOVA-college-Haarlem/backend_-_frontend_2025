# Week 5 - Laravel Todo List Project

We gaan nu flash messages toevoegen aan de todo list.

### Opdracht 1: Flash messages toevoegen
1. Open het bestand `app/Http/Controllers/TaskController.php`
2. Voeg de volgende code toe:
    ```php
    return redirect()->route('tasks.index')->with('success', 'Taak succesvol aangemaakt!');
    ```
3. Sla de wijzigingen op en open de pagina `/tasks/create` in je browser.
4. We zien nu de flash message.

### Opdracht 2: Flash messages toevoegen in de views    

1. Open de view `tasks.create.blade.php`
2. Voeg de volgende code toe:
    ```php
    <div class="alert alert-success">
        {{ session('success') }}
    </div>
    ```
3. Sla de wijzigingen op en open de pagina `/tasks/create` in je browser.
4. We zien nu de flash message.

### Opdracht 3.

1. Voe de flash messages toe aan de delete functionaliteit binnen je applicatie
2. Voeg flash messages toe aan de edit functionaliteit binnen je applicatie
3. Voeg flash messages toe aan de create functionaliteit binnen je applicatie
4. Voeg flash messages toe aan de index functionaliteit binnen je applicatie
5. Voeg flash messages toe aan de show functionaliteit binnen je applicatie
6. Voeg flash messages toe aan de destroy functionaliteit binnen je applicatie
7. Voeg flash messages toe aan de restore functionaliteit binnen je applicatie
8. Voeg flash messages toe aan de force delete functionaliteit binnen je applicatie
9. Voeg flash messages toe aan de restore all functionaliteit binnen je applicatie
10. Voeg flash messages toe aan de force delete all functionaliteit binnen je applicatie

## Breeze

Laravel Breeze is een package dat Laravel uitbreidt met authenticatie functionaliteit.

### Opdracht 4.1: Breeze installeren
1. Maak een GIT Commit van de huidige status van het project. Want we gaan mischien dingen veranderen en we willen deze niet verliezen.
2. Installeer Laravel Breeze:
    ```bash
    composer require laravel/breeze --dev
    php artisan breeze:install blade
    npm install
    npm run dev
    ```

### Opdracht 4.2: Starterspakket 

Laravel 12 komt met een starterspakket dat we kunnen gebruiken om snel een project op te zetten.

We hebben tot nu toe geen pagina's afgeschermd van niet-ingelogde gebruikers. Daarom gaan we gebruik maken van een authenticatie systeem.

Hiervoor zullen we een apart Laravel project aanmaken op basis van dezelfde Models en database structuur.

Waarom hebben we een apart project nodig? Twee redenen:

- Starter Kits. Laravel heeft starter kits om te helpen met authenticatie en autorisatie. Ze moeten geïnstalleerd worden op een vers Laravel project omdat ze sommige bestanden overschrijven. Daarom kunnen we ons bestaande project niet gebruiken.
- Visueel Ontwerp. We hebben een eenvoudig Tailwind template gebruikt voor de front page. Starter kits bieden verschillende ontwerpen, die conflicteren met onze huidige projectcode.

Maar eerst moeten we de opties in het Starter Kits ecosysteem bespreken, die zijn veranderd in de Laravel 12 versie.

In Laravel, je hebt GEEN enkele starter kit. Je hebt opties afhankelijk van welke full-stack dependencies je in je project wilt hebben.

Voor Laravel 12 waren er twee officiële starter kits uitgebracht in Laravel 8:

- Laravel Breeze: Een eenvoudige starter kit, alleen Laravel MVC + Tailwind
- Laravel JetStream: Gebruik Livewire of Vue Inertia, met 2FA en Teams functionaliteit

Deze zijn nog steeds operationeel, maar in Laravel 12, heeft de Laravel core team het ecosysteem veranderd door drie nieuwe starter kits uit te brengen per tech-stack:

- React starter kit
- Vue starter kit
- Livewire starter kit

Ze hebben een modern ontwerp en functionaliteit:

- React starter kit: Een starter kit met React, Tailwind en Laravel
- Vue starter kit: Een starter kit met Vue, Tailwind en Laravel
- Livewire starter kit: Een starter kit met Livewire, Tailwind en Laravel


Maar het probleem is dat alle nieuwe starter kits gericht zijn op full-stack dynamische applicaties.

Voor Laravel beginners, deze starter kits veronderstellen extra vereisten of dingen om te leren:

- React, Vue or Livewire. Voor Laravel 12 is er geen starter kit equivalent van Breeze, met "just Laravel Controllers with Blade".
- Component libraries: React starter kit gebruikt Shadcn, Vue gebruikt de equivalent Shadcn/Vue, en Livewire gebruikt Flux UI. Dus je moet die ook leren.

### Opdracht 4.3: Beginnen met Authenticatie

1. Maak een nieuwe project aan voor laravel 12 en noem het "todolist-pro".
2. Kies geen starter kit.
3. Kies Blade voor de frontend.
4. Testing Framework: Pest.
5. Target location: _hoef je niet te kiezen_.
6. Ga naar http://todolist-pro.test om te controleren of het project werkt.

```
cd project2
composer require laravel/breeze --dev
php artisan breeze:install
php artisan migrate
```

>routes/web.php bestand
```php
use App\Http\Controllers\ProfileController;
 
Route::get('/', function () {
    return view('welcome');
});
 
Route::get('/dashboard', function () { 
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');
 
Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
}); 
 
require __DIR__.'/auth.php';
```
