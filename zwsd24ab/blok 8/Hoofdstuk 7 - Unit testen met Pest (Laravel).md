# Hoofdstuk 7

## Unit testen met Pest (Laravel)

In een echt development team schrijf je niet alleen features, maar ook tests. Tests helpen je om sneller fouten te vinden en met meer vertrouwen te refactoren.

In dit hoofdstuk leer je hoe je met **Pest** in Laravel een test schrijft voor een CRUD-onderdeel of een overzichtspagina van een entiteit die gekoppeld is aan een project.

---

## Waarom testen?

Zonder tests weet je vaak pas laat dat iets kapot is. Met tests check je automatisch of belangrijke functionaliteit nog werkt.

Voordelen:

- Minder regressiebugs (iets dat eerst werkte, werkt niet meer)
- Sneller feedback tijdens ontwikkelen
- Meer vertrouwen bij samenwerken in een team
- Betere voorbereiding op je assessment (je kunt aantonen dat je code betrouwbaar is)

---

## Wat is Pest?

**Pest** is een testframework bovenop PHPUnit, maar met een kortere en leesbaardere syntax.

Laravel werkt standaard goed samen met Pest. Je schrijft tests in `tests/Feature` (voor gedrag van routes/controllers) en `tests/Unit` (voor losse logica).

Voor dit blok focussen we op **Feature tests**, omdat die goed passen bij jullie projectwerk.

---

## Voorbereiding

Controleer eerst of Pest beschikbaar is in je project:

```bash
php artisan test
```

Wil je een testbestand aanmaken:

```bash
php artisan make:test ProjectTaakOverzichtTest
```

Gebruik in je tests altijd factories en `RefreshDatabase`, zodat elke test start met een schone database.

---

## Voorbeeld: overzicht van taken binnen een project testen

Stel: je hebt in project `Urenregistratie & Projectopvolging` een model `Project` met gerelateerde `Taak` records (`project_id`).

Je wilt testen dat:

1. een ingelogde gebruiker de taken van een project ziet;
2. taken van een ander project niet in dat overzicht staan.

Voorbeeldtest met Pest:

```php
<?php

use App\Models\Project;
use App\Models\Taak;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;

uses(RefreshDatabase::class);

it('toont alleen taken van het gekozen project', function () {
    $user = User::factory()->create();
    $projectA = Project::factory()->create(['naam' => 'Website Klant A']);
    $projectB = Project::factory()->create(['naam' => 'Interne Tool B']);

    $taakVanA = Taak::factory()->create([
        'project_id' => $projectA->id,
        'titel' => 'Homepage bouwen',
    ]);

    $taakVanB = Taak::factory()->create([
        'project_id' => $projectB->id,
        'titel' => 'Dashboard testen',
    ]);

    $response = $this->actingAs($user)
        ->get(route('projects.taken.index', $projectA));

    $response->assertOk();
    $response->assertSee($taakVanA->titel);
    $response->assertDontSee($taakVanB->titel);
});
```

> Let op: pas modelnamen, routenamen en velden aan naar jullie eigen project.

---

## Voorbeeld: create (CRUD) testen

Bij een CRUD-flow kun je ook testen of een record echt wordt opgeslagen.

```php
it('maakt een nieuwe taak aan binnen een project', function () {
    $user = User::factory()->create();
    $project = Project::factory()->create();

    $response = $this->actingAs($user)->post(route('projects.taken.store', $project), [
        'titel' => 'API endpoint bouwen',
        'status' => 'open',
    ]);

    $response->assertRedirect();

    $this->assertDatabaseHas('taken', [
        'project_id' => $project->id,
        'titel' => 'API endpoint bouwen',
        'status' => 'open',
    ]);
});
```

---

## Testen draaien

Voer alle tests uit:

```bash
php artisan test
```

Alleen dit bestand draaien:

```bash
php artisan test tests/Feature/ProjectTaakOverzichtTest.php
```

---

## Veelgemaakte fouten

- Je gebruikt geen `RefreshDatabase`, waardoor data van eerdere tests blijft hangen.
- Je vergeet in te loggen met `actingAs()`, terwijl je route auth nodig heeft.
- Je test op exacte HTML-structuur in plaats van op gedrag (bijv. zichtbare titel / database record).
- Je route- of modelnaam klopt niet met jouw project.

---

## Opdracht 1 – Overzichtstest (verplicht)

Kies één overzichtspagina in jouw groepsproject waar een entiteit gekoppeld is aan een project, bijvoorbeeld:

- taken binnen een project;
- urenregels binnen een project;
- tickets binnen een project;
- bezoekersafspraken per project/event.

Schrijf een Pest test die controleert:

1. dat data van het gekozen project zichtbaar is;
2. dat data van een ander project **niet** zichtbaar is.

**Inlevereis**
- Test staat in `tests/Feature/...`
- Test draait groen (`php artisan test`)
- Je kunt mondeling uitleggen wat de test aantoont

---

## Opdracht 2 – CRUD test (verdieping)

Kies één CRUD-actie die jij hebt gebouwd (create, update of delete) en schrijf een test:

1. voer de actie uit via de juiste route;
2. controleer de response;
3. controleer het resultaat in de database (`assertDatabaseHas` of `assertDatabaseMissing`).

**Tip:** begin klein. Eerst 1 werkende test, daarna uitbreiden.

---

## Koppeling met assessment

Tijdens je assessment kun je met tests laten zien dat je verder kijkt dan "het werkt op mijn laptop". Als je kunt uitleggen:

- waarom je juist deze test hebt gekozen;
- welke bug je ermee voorkomt;
- hoe je testdata met factories opzet;

dan laat je professionele softwarekwaliteit zien.
