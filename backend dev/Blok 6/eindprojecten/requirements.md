# Generieke Projecteisen Blok 6

## Introductie

Dit document beschrijft de algemene eisen waaraan alle eindprojecten voor Blok 6 moeten voldoen. Het project moet gebruik maken van alle behandelde concepten uit de weken 1-6 van het Laravel lesprogramma.

## Project Setup

### Opdracht 1 - Laravel Project beginnen

1. Start een nieuw Laravel project in Laravel Herd
2. Kies voor het gebruik van Laravel Breeze voor authenticatie
3. Kies Blade voor de frontend
4. Testing Framework: PHPUnit
5. Zorg dat het project correct opstart op een `.test` domain

### Opdracht 2 - Database Setup

1. **Database server/file opzetten**
   - Standaard werkt Laravel met een SQLITE database
   - Voor MySQL/PHPMyAdmin: gebruik de Docker omgeving (mysql-phpmyadmin repository)
   - Configureer de database connectie in `.env`

2. **Database configuratie**
   - Configureer de database connectie correct
   - Test de connectie

## Database Ontwerp

### Opdracht 3 - Database Ontwerp

1. Ontwerp je database schema met de volgende aandachtspunten:
   - **Gebruik minimaal 4 hoofdtabellen** (naast de `users` tabel)
   - **Verplicht: Implementeer minimaal één veel-op-veel (many-to-many) relatie**
   - Gebruik de juiste relaties:
     - One-to-One
     - One-to-Many (belongsTo / hasMany)
     - **Many-to-Many (belongsToMany met pivot table)**

2. Documenteer je database ontwerp:
   - Beschrijf alle tabellen met hun attributen
   - Beschrijf alle relaties tussen de tabellen
   - Identificeer expliciet de many-to-many relatie(s)

### Veel-op-veel relatie vereisten

**Verplicht:** Je project moet minimaal één veel-op-veel relatie bevatten. Dit betekent:
- Een pivot table (tussentabel) aanmaken
- `belongsToMany` relaties definiëren in beide models
- De relatie kunnen gebruiken in controllers en views
- De relatie kunnen beheren (attach, detach, sync) in formulieren

**Voorbeelden van veel-op-veel relaties:**
- Boeken kunnen meerdere auteurs hebben / Auteurs kunnen meerdere boeken hebben
- Gerechten kunnen meerdere ingrediënten hebben / Ingrediënten zitten in meerdere gerechten
- Bestellingen kunnen meerdere producten bevatten / Producten zitten in meerdere bestellingen
- Studenten kunnen meerdere vakken volgen / Vakken worden gevolgd door meerdere studenten

## Migrations

### Opdracht 4 - Migrations maken

1. Maak alle benodigde migrations aan via `php artisan make:migration`
2. Zorg ervoor dat je alle attributen uit je database ontwerp hebt meegenomen:
   - Primaire sleutels (`id`)
   - Alle benodigde kolommen met juiste datatypes
   - Foreign keys voor relaties
   - **Pivot table voor veel-op-veel relatie(s)**
   - Timestamps waar nodig
   - Nullable velden waar nodig

3. Voer de migrations uit en controleer of alle tabellen correct zijn aangemaakt

## Models

### Opdracht 5 - Models maken

1. Maak alle benodigde models aan via `php artisan make:model`
2. Models zijn altijd in enkelvoud en in het Engels
3. Configureer `$fillable` voor mass assignment
4. **Definieer alle relaties in de models:**
   - `belongsTo` relaties
   - `hasMany` relaties
   - **`belongsToMany` relaties voor veel-op-veel (verplicht)**
5. Test de relaties in je models

### Relaties in Models

Zorg ervoor dat je de volgende relaties correct implementeert:

```php
// Voorbeeld van veel-op-veel relatie
// In Model A (bijv. Product)
public function categories()
{
    return $this->belongsToMany(Category::class);
}

// In Model B (bijv. Category)
public function products()
{
    return $this->belongsToMany(Product::class);
}
```

## Seeders

### Opdracht 6 - Seeding

1. Maak seeders aan via `php artisan make:seeder`
2. Maak minimaal één seeder per hoofdmodel
3. Zorg voor realistische testdata:
   - Minimaal 10 records per hoofdmodel (waar van toepassing)
   - **Testdata voor de veel-op-veel relatie(s) via attach() of sync()**
4. Koppel alle seeders in `DatabaseSeeder`
5. Test dat je database correct gevuld wordt met `php artisan db:seed`

## CRUD Functionaliteit

### Opdracht 7 - Basis CRUD

Implementeer minimaal voor één hoofdmodel volledige CRUD functionaliteit:

1. **Create (Aanmaken)**
   - Controller methode `create()`
   - View met formulier
   - Controller methode `store()` met validatie
   - Route met naam (bijv. `resource.store`)

2. **Read (Lezen)**
   - Controller methode `index()` - overzicht
   - Controller methode `show()` - detailpagina (optioneel maar aanbevolen)
   - Views voor weergave van data
   - Routes met namen

3. **Update (Bewerken)**
   - Controller methode `edit()`
   - View met vooringevuld formulier
   - Controller methode `update()` met validatie
   - Routes met `@method('PUT')`

4. **Delete (Verwijderen)**
   - Controller methode `destroy()`
   - Bevestiging (in view of via formulier)
   - Route met `@method('DELETE')`

## Formulieren met Relaties

### Opdracht 8 - Relaties in Formulieren

1. **One-to-Many relaties in formulieren**
   - Dropdown menu's voor `belongsTo` relaties
   - Data ophalen in de `create()` en `edit()` methoden
   - Relatie opslaan/bijwerken in `store()` en `update()`

2. **Veel-op-veel relaties in formulieren (VERPLICHT)**
   - Multi-select of checkboxes voor many-to-many relaties
   - Data ophalen in de `create()` en `edit()` methoden
   - Relatie opslaan/bijwerken met `attach()`, `detach()`, of `sync()` in `store()` en `update()`
   - Bijvoorbeeld:
     ```php
     // In store() of update()
     $model->categories()->sync($request->categories);
     ```

3. **Data weergeven in views**
   - Relatie data tonen in index en detail views
   - Gebruik eager loading (`with()`) om N+1 problemen te voorkomen

## Validatie

### Opdracht 9 - Validatie

1. Implementeer validatie in alle `store()` en `update()` methoden
2. Gebruik Laravel's validation rules (required, string, integer, etc.)
3. Toon validatiefouten in de views
4. Gebruik `@error` directive of `$errors` variable in Blade templates

## Flash Messages

### Opdracht 10 - Flash Messages

1. Implementeer flash messages voor alle belangrijke acties:
   - Succes bericht na aanmaken (`with('success', '...')`)
   - Succes bericht na bijwerken
   - Succes bericht na verwijderen
   - Waarschuwingen waar nodig

2. Toon flash messages in je layout of views:
   ```php
   @if(session('success'))
       <div class="alert alert-success">{{ session('success') }}</div>
   @endif
   ```

## Laravel Breeze & Authenticatie

### Opdracht 11 - Authenticatie (Week 5)

1. Gebruik Laravel Breeze voor authenticatie
2. Implementeer login en registratie functionaliteit
3. Gebruik middleware om routes te beveiligen:
   - `auth` middleware voor beschermde routes
   - `guest` middleware voor login/registratie routes

4. Koppel data aan gebruikers waar van toepassing:
   - Gebruik `auth()->user()` of `Auth::user()` om ingelogde gebruiker op te halen
   - Koppel records aan gebruikers via `user_id` foreign key

## Routes en Route Namen

### Opdracht 12 - Routes

1. Gebruik route namen voor alle routes (bijv. `route('tasks.index')`)
2. Gebruik resource routes waar mogelijk: `Route::resource()`
3. Of gebruik expliciete routes met namen:
   ```php
   Route::get('/tasks', [TaskController::class, 'index'])->name('tasks.index');
   Route::get('/tasks/create', [TaskController::class, 'create'])->name('tasks.create');
   Route::post('/tasks', [TaskController::class, 'store'])->name('tasks.store');
   // etc.
   ```

## Views en Layout

### Opdracht 13 - Views

1. Maak gebruik van een layout component (bijv. `BaseLayout`)
2. Hergebruik de layout in alle views
3. Maak overzichtelijke en gebruiksvriendelijke views
4. Gebruik Blade syntax correct:
   - `@foreach`, `@if`, `@else`, `@endif`
   - `{{ }}` voor output
   - `{!! !!}` alleen waar nodig (met voorzichtigheid)
   - `@csrf` in formulieren
   - `@method()` voor PUT/DELETE

## Eager Loading (Optioneel maar Aanbevolen)

### Opdracht 14 - Performance

1. Gebruik eager loading (`with()`) om N+1 problemen te voorkomen
2. Laad gerelateerde data op in controllers:
   ```php
   $products = Product::with('category', 'reviews')->get();
   ```

## Samenvatting Vereisten

### Verplichte Elementen

- ✅ Laravel project met Laravel Breeze
- ✅ Minimaal 4 hoofdtabellen (naast users)
- ✅ **Minimaal één veel-op-veel relatie (belongsToMany met pivot table)**
- ✅ Minimaal één volledige CRUD implementatie
- ✅ Validatie in formulieren
- ✅ Flash messages
- ✅ Route namen
- ✅ Layout component
- ✅ Seeders met testdata
- ✅ Authenticatie geïntegreerd waar van toepassing

### Aanbevolen Elementen

- ✅ Eager loading om N+1 te voorkomen
- ✅ Detail pagina's (show methoden)
- ✅ Zoek functionaliteit
- ✅ Filter functionaliteit
- ✅ Paginatie voor grote datasets
- ✅ Mooie, gebruiksvriendelijke UI

## Beoordelingscriteria

Het project wordt beoordeeld op:

1. **Correcte implementatie van veel-op-veel relatie** (verplicht)
2. Functionaliteit: werkt alles zoals verwacht?
3. Code kwaliteit: is de code netjes gestructureerd?
4. Database ontwerp: zijn de relaties correct?
5. Views: zijn de views overzichtelijk en gebruiksvriendelijk?
6. Validatie: zijn formulieren correct gevalideerd?
7. Best practices: worden Laravel best practices gevolgd?

## Hulp en Ondersteuning

Raadpleeg de weekbestanden (Week 1 t/m Week 6) voor gedetailleerde uitleg over:
- Week 1: Project setup, routes, views, controllers
- Week 2: Models, migrations, seeders, relaties (one-to-many)
- Week 3: CRUD operaties, validatie
- Week 4: **Veel-op-veel relaties (belongsToMany, pivot tables)**
- Week 5: Laravel Breeze, authenticatie
- Week 6: (Zie project specifieke eisen)

