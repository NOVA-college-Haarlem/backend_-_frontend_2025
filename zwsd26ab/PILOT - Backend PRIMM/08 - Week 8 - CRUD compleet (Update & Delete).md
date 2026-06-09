# Week 8 — CRUD compleet (Update & Delete)

**Kernconcept:** volledige CRUD (Create, Read, Update, Delete)
**Context:** je kunt items lezen (R) en toevoegen (C). Deze week maak je het af: bestaande items **wijzigen** (U) en **verwijderen** (D). Daarna is je PlayList een complete mini-app.

## Leerdoelen

Na deze week kan de student:
- de vier CRUD-operaties benoemen en koppelen aan controller-methodes en SQL;
- een edit-formulier en `update`-methode lezen en aanpassen;
- een delete-actie veilig uitvoeren (via een POST/DELETE-form, niet een gewone link);
- het complete CRUD-overzicht van zijn eigen app uittekenen.

## Activerende start (10 min)
Teken het **CRUD-schema** op het bord en koppel alles wat ze al deden:

| Letter | Actie | Controller-methode | SQL |
|---|---|---|---|
| C | Create (week 7) | `store()` | INSERT |
| R | Read (week 3, 6) | `index()` / `show()` | SELECT |
| U | Update (vandaag) | `edit()` + `update()` | UPDATE |
| D | Delete (vandaag) | `destroy()` | DELETE |

"Je kent al de helft. Vandaag maken we het rond."

## PRIMM

### Predict (10 min) — *AI uit*
Toon `edit`, `update` en `destroy`. *Wat doet elke methode?*

```php
// GameController.php
public function edit($id) {
    $game = Game::findOrFail($id);
    return view('games.edit', ['game' => $game]);
}

public function update(Request $request, $id) {
    $gegevens = $request->validate([
        'titel' => 'required|min:2',
        'genre' => 'required',
    ]);
    Game::findOrFail($id)->update($gegevens);
    return redirect('/games');
}

public function destroy($id) {
    Game::findOrFail($id)->delete();
    return redirect('/games');
}
```
```blade
{{-- knop in de lijst, per game --}}
<form action="/games/{{ $game->id }}" method="POST">
    @csrf
    @method('DELETE')
    <button>Verwijderen</button>
</form>
```

### Run (10 min)
Routes inladen (laat ze de `resource`-route zien of expliciete routes). Wijzig een game, verwijder een game. Werkt — nu snappen waarom.

### Investigate (20 min) — live coding, *AI uit*
- "Wat doet `findOrFail($id)`? Wat is die `$id`?" → één specifiek record opzoeken; `$id` komt uit de URL. Koppel aan `show()` van week 6.
- "Waarom is `update` bijna gelijk aan `store`?" → zelfde validatie, maar `update` i.p.v. `create`. Herkenning = bevestiging dat ze het patroon snappen.
- "Waarom verwijderen we met een `<form>` en niet met een gewone `<a href>`?" → een link is GET; verwijderen via een link is gevaarlijk (een crawler kan je data wissen). Belangrijk veiligheidsbesef.
- "Wat doet `@method('DELETE')`?" → HTML-forms kennen alleen GET/POST; Laravel doet alsof het DELETE is.

### Modify (20 min) — *AI mag*
- **Basis:** voeg een "Wijzig"-knop toe naast elke game die naar het edit-formulier linkt.
- **Uitbreiding:** vraag een bevestiging vóór verwijderen (JS `confirm()` of een tussenpagina).
- **Expert:** maak de routes via één `Route::resource('games', GameController::class)` en verklaar welke 7 routes dat oplevert.

### Make (30 min) — *AI mag, mits verantwoordbaar*
Maak je eigen PlayList **volledig CRUD**: toevoegen, tonen, wijzigen, verwijderen. Dit is de app waarmee je het assessment doet — zorg dat je elke regel snapt.

## Afsluiting (10 min)
Exit: elke student tekent het CRUD-schema van zijn **eigen** app (welke methode hoort bij welke actie).

## Huiswerk / check
- Eigen PlayList ondersteunt alle 4 CRUD-operaties. Repo compleet.
