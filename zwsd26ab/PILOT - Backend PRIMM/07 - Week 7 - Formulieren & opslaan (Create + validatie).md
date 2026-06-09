# Week 7 — Formulieren & opslaan (Create + validatie)

**Kernconcept:** formulierverwerking (`$_POST` → `store`) · de C van CRUD · validatie
**Context:** tot nu toe kon je alleen data *lezen*. Deze week kan een gebruiker via een formulier zélf een game toevoegen — de eerste echte twee-richtingen-koppeling FE ↔ BE.

## Leerdoelen

Na deze week kan de student:
- de route van een formulier volgen: invullen → POST → controller → database → terug;
- uitleggen waarom je formulierdata moet **valideren** (vuilnis erin = vuilnis eruit);
- een `store`-methode lezen en aanpassen;
- uitleggen wat `@csrf` doet (op hoofdlijn: bescherming).

## Activerende start (10 min)
"Tot nu las je data. Maar hoe komt die data erin?" Teken de cyclus: **Formulier (browser) → POST → Controller (`store`) → database → redirect → lijst toont de nieuwe game.** Dit is de mijlpaal: data stroomt nu *beide kanten op*.

## PRIMM

### Predict (10 min) — *AI uit*
Toon het formulier en de `store`-methode. *Wat gebeurt er als je op "Toevoegen" klikt?*

```blade
{{-- resources/views/games/create.blade.php --}}
<h1>Nieuwe game toevoegen</h1>
<form action="/games" method="POST">
    @csrf
    <input type="text" name="titel" placeholder="Titel">
    <input type="text" name="genre" placeholder="Genre">
    <button type="submit">Toevoegen</button>
</form>
```
```php
// GameController.php
public function store(Request $request) {
    $gegevens = $request->validate([
        'titel' => 'required|min:2',
        'genre' => 'required',
    ]);

    Game::create($gegevens);

    return redirect('/games');
}
```
```php
// routes/web.php
Route::get('/games/create', [GameController::class, 'create']);
Route::post('/games', [GameController::class, 'store']);
```

### Run (10 min)
Vul het formulier in, verstuur. De nieuwe game staat in de lijst **én** in DB Browser. Vul nu een lege titel in → validatiefout. Het werkt al; nu begrijpen waarom.

### Investigate (20 min) — live coding, *AI uit*
- "Welke route hoort bij `method="POST"`? Waarom 2 routes (`create` en `store`)?" → `create` toont het formulier, `store` verwerkt het. (GET toont, POST verstuurt.)
- "Wat doet `$request->validate([...])`? Wat gebeurt er bij een lege titel?" → validatie stopt de verwerking + stuurt terug met foutmelding. Demonstreer `required` weghalen → lege rij in de database (de "vuilnis").
- "Wat doet `Game::create($gegevens)`?" → de **INSERT**; koppel aan SQL-besef van week 3.
- "Wat doet `@csrf`?" → kort: een veiligheidstoken zodat niet zomaar een andere site jouw formulier kan misbruiken. Haal het weg → Laravel weigert (419) → toon dat veiligheid ingebouwd is.

### Modify (20 min) — *AI mag*
- **Basis:** voeg een veld `rating` toe aan formulier, validatie én `$fillable` van het model.
- **Uitbreiding:** maak validatie strenger (`max:100`, `numeric` voor rating) en toon de foutmeldingen netjes in Blade (`@error`).
- **Expert:** toon na opslaan een succesmelding ("Game toegevoegd!") via een flash-message.

### Make (30 min) — *AI mag, mits verantwoordbaar*
Bouw in je eigen PlayList een werkend toevoeg-formulier met validatie op minstens 2 velden. Test bewust met foute invoer.

## "Debug deze AI-output" (10 min)
Geef AI-code waarin het formulier `method="POST"` heeft maar de route `Route::get` is (of `@csrf` ontbreekt). Studenten zoeken waarom het niet werkt.

## Afsluiting (10 min)
Exit-vraag: *"Waarom valideer je formulierdata in plaats van het meteen op te slaan?"*

## Huiswerk / check
- Eigen PlayList: items toevoegen via formulier mét validatie werkt. Gepusht.
