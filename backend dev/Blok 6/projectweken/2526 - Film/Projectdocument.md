# Projectopdracht

## FilmTag Manager

*Laravel CRUD met veel-op-veel relaties*

**Opleiding:** MBO Software Developer  
**Niveau:** 4  
**Geschatte doorlooptijd:** 2-3 weken

## 1. Inleiding

In dit project ga je een webapplicatie bouwen waarmee gebruikers films kunnen beheren en tags kunnen toewijzen aan films. Dit is een praktische oefening om je vaardigheden in Laravel te ontwikkelen, specifiek gericht op CRUD-operaties en het implementeren van veel-op-veel (many-to-many) relaties in een database.

Een film kan meerdere tags hebben (bijvoorbeeld: actie, komedie, sci-fi) en een tag kan aan meerdere films gekoppeld zijn. Dit is een klassiek voorbeeld van een veel-op-veel relatie die je in veel echte applicaties tegenkomt.

### 1.1 Leerdoelen

Na afronding van dit project kun je:

- Een Laravel project opzetten en configureren
- Database migraties schrijven voor tabellen en pivot-tabellen
- Eloquent models maken met belongsToMany relaties
- CRUD-functionaliteit implementeren met controllers
- Blade templates gebruiken voor de front-end
- Formuliervalidatie toepassen
- De sync() methode gebruiken voor veel-op-veel relaties

## 2. De Casus

Je bouwt de "FilmTag Manager" - een applicatie voor een kleine filmverhuurder die hun collectie wil digitaliseren. De eigenaar wil films kunnen toevoegen, bewerken en verwijderen. Daarnaast wil hij tags kunnen beheren om films te categoriseren, zodat klanten makkelijker films kunnen vinden.

### 2.1 Entiteiten

| Entiteit     | Velden                                               | Beschrijving                                   |
| ------------ | ---------------------------------------------------- | ---------------------------------------------- |
| **Film**     | id, titel, regisseur, jaar, beschrijving, timestamps | Bevat informatie over een film in de collectie |
| **Tag**      | id, naam, timestamps                                 | Categorie/genre label voor films               |
| **film_tag** | film_id, tag_id                                      | Pivot-tabel voor de veel-op-veel relatie       |

### 2.2 Relaties

De relatie tussen Film en Tag is een veel-op-veel relatie:

- Een film kan meerdere tags hebben (bijv. "The Matrix" heeft tags: actie, sci-fi)
- Een tag kan aan meerdere films gekoppeld zijn (bijv. "actie" hoort bij meerdere films)

## 3. Functionele Eisen

### 3.1 Films beheren

1. Overzicht van alle films met hun gekoppelde tags
2. Detailpagina per film met alle informatie
3. Nieuwe film toevoegen met titel, regisseur, jaar en beschrijving
4. Bij toevoegen/bewerken: tags selecteren via checkboxes
5. Film gegevens kunnen bewerken
6. Film kunnen verwijderen (met bevestiging)

### 3.2 Tags beheren

1. Overzicht van alle tags
2. Nieuwe tag toevoegen
3. Tag naam kunnen bewerken
4. Tag kunnen verwijderen (alleen als er geen films aan gekoppeld zijn, óf met cascade)

### 3.3 Validatie

- Titel is verplicht en minimaal 2 karakters
- Regisseur is verplicht
- Jaar moet een geldig getal zijn tussen 1900 en huidig jaar
- Tag naam is verplicht en moet uniek zijn
- Foutmeldingen worden duidelijk getoond bij het formulier

## 4. Technische Eisen

### 4.1 Projectstructuur

- Laravel 10 of 11 project
- MySQL of SQLite database
- Resource controllers voor Film en Tag
- Blade templates met een layout

### 4.2 Database

- Migratie voor films tabel
- Migratie voor tags tabel
- Migratie voor film_tag pivot-tabel
- Seeder met minimaal 5 films en 8 tags

### 4.3 Models

- Film model met belongsToMany relatie naar Tag
- Tag model met belongsToMany relatie naar Film
- Correct gebruik van $fillable

### 4.4 Controllers

- FilmController met alle CRUD-methodes
- TagController met alle CRUD-methodes
- Gebruik van sync() voor het koppelen van tags aan films

## 5. Stappenplan

Volg onderstaande stappen om het project succesvol af te ronden:

### Stap 1: Project opzetten

- Maak een nieuw Laravel project aan
- Configureer de database in .env
- Test of de standaard welkomstpagina werkt

### Stap 2: Database structuur

- Maak migraties voor films en tags tabellen
- Maak de pivot-tabel migratie (film_tag)
- Voer de migraties uit
- Controleer de tabellen in je database

### Stap 3: Models maken

- Maak het Film model met de tags() relatie
- Maak het Tag model met de films() relatie
- Test de relaties in Tinker

### Stap 4: Seeders

- Maak seeders voor films en tags
- Koppel tags aan films in de seeder
- Voer de seeders uit

### Stap 5: CRUD voor Tags

- Begin met de eenvoudigste entiteit
- Maak TagController en routes
- Maak de Blade views voor tags

### Stap 6: CRUD voor Films

- Maak FilmController en routes
- Implementeer de tag-selectie met checkboxes
- Gebruik sync() om tags te koppelen
- Maak de Blade views voor films

### Stap 7: Afronding

- Voeg validatie toe
- Maak een navigatiemenu
- Style de applicatie (optioneel: Bootstrap/Tailwind)
- Test alle functionaliteiten

## 6. Hulp: Codevoorbeelden

Hieronder vind je enkele codevoorbeelden om je op weg te helpen:

### 6.1 Pivot-tabel migratie

```php
Schema::create('film_tag', function (Blueprint $table) {
    $table->foreignId('film_id')->constrained()->onDelete('cascade');
    $table->foreignId('tag_id')->constrained()->onDelete('cascade');
    $table->primary(['film_id', 'tag_id']);
});
```

### 6.2 Model relatie

```php
// In Film.php
public function tags()
{
    return $this->belongsToMany(Tag::class);
}
```

### 6.3 Tags synchroniseren in controller

```php
// In FilmController@store of @update
$film = Film::create($validated);
$film->tags()->sync($request->input('tags', []));
```

### 6.4 Checkboxes in Blade form

```blade
@foreach($tags as $tag)
    <label>
        <input type="checkbox" name="tags[]" value="{{ $tag->id }}"
            {{ $film->tags->contains($tag->id) ? 'checked' : '' }}>
        {{ $tag->naam }}
    </label>
@endforeach
```

## 7. Beoordeling

Je project wordt beoordeeld op de volgende criteria:

| Criterium                                   | Weging   | Punten   |
| ------------------------------------------- | -------- | -------- |
| Database: correcte migraties en relaties    | 20%      | /20      |
| Models: juiste belongsToMany implementatie  | 15%      | /15      |
| CRUD Films: alle operaties werken correct   | 20%      | /20      |
| CRUD Tags: alle operaties werken correct    | 15%      | /15      |
| Tag koppeling: sync() correct toegepast     | 15%      | /15      |
| Validatie: correcte regels en foutmeldingen | 10%      | /10      |
| Code kwaliteit en structuur                 | 5%       | /5       |
| **Totaal**                                  | **100%** | **/100** |

### 7.1 Bonuspunten (max +10)

- Zoekfunctie voor films (+3)
- Filter films op tag (+3)
- Professionele styling met CSS framework (+2)
- Unit tests voor models (+2)


**Succes met je project!**