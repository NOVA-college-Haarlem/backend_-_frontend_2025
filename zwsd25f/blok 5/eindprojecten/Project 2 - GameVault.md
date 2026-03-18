# Project 2: GameVault - Game Collectie Tracker

## Introductie
GameVault is een platform voor gamers om hun spelcollectie bij te houden. Gebruikers registreren zich met een gamerprofiel, voegen games toe aan hun collectie en beheren een wishlist. Beheerders beheren het aanbod van platforms en games. Bezoekers kunnen filteren op platform en genre, en ingelogde gebruikers kunnen games aan hun wishlist toevoegen via AJAX.

### Verhaal van de opdrachtgever

"Hoi! Ik ben Kevin, oprichter van GameVault. Ik ben zelf een fervent gamer en ik mis een simpele plek waar ik kan bijhouden welke games ik heb, welke ik nog wil kopen en welke ik al heb uitgespeeld.

Ik wil dat gamers een account kunnen aanmaken. Naast hun naam en e-mail vul je bij registratie ook een gamertag en je favoriete platform in — dat wordt je gamerprofiel.

De kern van het systeem zijn de games:
- titel
- genre (bijv. FPS, RPG, Platformer, Sports, Horror)
- releasejaar
- beschrijving
- cover_url (optioneel)
- platform (bijv. PlayStation, Xbox, PC, Nintendo Switch)

Een platform heeft meerdere games — dat is de één-op-veel relatie. Games kunnen door een beheerder worden toegevoegd, gewijzigd en verwijderd. Als een game verwijderd wordt, mag dat niet permanent zijn want ik maak soms vergissingen.

Ingelogde gamers moeten games aan hun wishlist kunnen toevoegen zonder dat de pagina herlaadt. Ik wil ook dat gamers kunnen filteren op platform en genre.

Kunnen jullie dit bouwen?"

## Opdracht 1 - Database Ontwerp

Studenten moeten zelf een database ontwerp maken op basis van bovenstaande vereisten.

- Stap 1: ERD
- Stap 2: Relatie Model
- Stap 3: DB Bouwen

**Entiteiten en belangrijke kolommen:**

**users**: id, naam, email, wachtwoord, rol (admin/user), created_at

**gamer_profiles** (1-op-1 met users): id, user_id, gamertag, favoriete_platform, bio

**platforms** (1-op-veel naar games): id, naam, fabrikant

**games** (hoort bij platform): id, titel, genre, releasejaar, beschrijving, cover_url, platform_id (FK), deleted_at, created_at

**wishlist**: id, user_id (FK), game_id (FK), created_at

---

## Opdracht 2 - User Stories

### Database & PDO

#### US-01: PDO Database Connectie
**Als developer wil ik een PDO database connectie opzetten**

**Acceptance Criteria:**
- [ ] PDO connectie in `database.php` met correcte error handling

---

#### US-02: Genormaliseerde Database
**Als developer wil ik een genormaliseerde database**

**Acceptance Criteria:**
- [ ] Primary keys op alle tabellen
- [ ] Foreign key relaties correct opgezet
- [ ] Unique constraint op email en gamertag
- [ ] 1-op-1 relatie tussen users en gamer_profiles
- [ ] 1-op-veel relatie tussen platforms en games

**Assessment Voorbeeldvraag:**
"Waarom hebben we een aparte gamer_profiles tabel naast users?"

---

### Security

#### US-03: Veilige Registratie
**Als gamer wil ik veilig kunnen registreren**

**Acceptance Criteria:**
- [ ] Wachtwoord wordt gehashed met `password_hash()` voor opslag
- [ ] Email validatie voorkomt ongeldige invoer
- [ ] `htmlspecialchars()` wordt toegepast op alle user input bij weergave
- [ ] Prepared statements voorkomen SQL-injectie
- [ ] Input validatie op alle formuliervelden
- [ ] Bij registratie wordt automatisch een gamer_profile aangemaakt

**Assessment Voorbeeldvraag:**
"Laat zien waar je password_hash() gebruikt en leg uit waarom."

---

#### US-04: Veilige Login
**Als gebruiker wil ik veilig kunnen inloggen**

**Acceptance Criteria:**
- [ ] Login gebruikt `password_verify()` om wachtwoord te checken
- [ ] Session wordt gestart bij succesvolle login (`$_SESSION['user_id']`, `$_SESSION['role']`)
- [ ] Foutmeldingen zijn generiek ("Ongeldige inloggegevens")
- [ ] Session checks beschermen beheerderspagina's

**Assessment Voorbeeldvraag:**
"Leg uit hoe password_verify() werkt en waarom we dit gebruiken."

---

### CRUD - Games

#### US-05: Game Toevoegen (CREATE)
**Als beheerder wil ik een game kunnen toevoegen**

**Acceptance Criteria:**
- [ ] Formulier op `game_create.php` met velden: titel, genre (dropdown), releasejaar, beschrijving, cover_url, platform (dropdown)
- [ ] POST naar `game_create_process.php` met prepared statement INSERT query
- [ ] Platform dropdown toont alle platforms uit de `platforms` tabel
- [ ] Input validatie controleert of alle verplichte velden zijn ingevuld
- [ ] Alleen beheerders kunnen games toevoegen (role check)

---

#### US-06: Games Overzicht (READ)
**Als bezoeker wil ik een overzicht van alle games zien**

**Acceptance Criteria:**
- [ ] `games_index.php` toont alle games in een grid of lijst
- [ ] JOIN query toont platformnaam bij elke game
- [ ] Alleen niet-verwijderde games worden getoond (`WHERE deleted_at IS NULL`)
- [ ] `htmlspecialchars()` wordt toegepast op alle getoonde data

**Assessment Voorbeeldvraag:**
"Leg uit wat deze JOIN query doet en waarom we dat nodig hebben."

---

#### US-07: Game Wijzigen (UPDATE)
**Als beheerder wil ik een game kunnen wijzigen**

**Acceptance Criteria:**
- [ ] `game_update.php` toont formulier met huidige gegevens (pre-filled)
- [ ] Platform dropdown toont het huidige platform als geselecteerd
- [ ] POST naar `game_update_process.php` met UPDATE query via prepared statement
- [ ] Validatie controleert of game_id numeriek is (`is_numeric()`)
- [ ] Alleen beheerders kunnen games wijzigen (role check)

---

#### US-08: Game Verwijderen (SOFT DELETE)
**Als beheerder wil ik een game kunnen verwijderen**

**Acceptance Criteria:**
- [ ] `game_delete.php` zet `deleted_at` timestamp in plaats van hard delete
- [ ] Alleen admins kunnen games verwijderen (role check)
- [ ] Confirmation dialog voorkomt onbedoeld verwijderen
- [ ] Na verwijderen redirect naar `games_index.php` met success message

**Assessment Voorbeeldvraag:**
"Wat is het verschil tussen soft delete en hard delete? Laat je code zien."

---

#### US-09: Game Herstellen
**Als beheerder wil ik verwijderde games kunnen herstellen**

**Acceptance Criteria:**
- [ ] `games_deleted.php` toont alle soft-deleted games
- [ ] "Herstel" link zet `deleted_at` terug naar NULL
- [ ] Alleen admins hebben toegang tot deze pagina

---

#### US-10: Per Platform een Overzicht van de Games
**Als bezoeker wil ik games kunnen bekijken per platform**

**Acceptance Criteria:**
- [ ] Vanuit `platforms_index.php` kan je doorklikken naar de games van een platform
- [ ] Er wordt een GET parameter meegegeven: `?platform_id=1`
- [ ] JOIN query toont de platformnaam in de paginatitel
- [ ] Filter op platform_id via prepared statement
- [ ] Alleen niet-verwijderde games worden getoond

**Assessment Voorbeeldvraag:**
"Laat zien hoe je de één-op-veel relatie hebt opgezet tussen platforms en games."

---

### AJAX Implementation

#### US-11: Game Toevoegen aan Wishlist zonder Page Reload
**Als ingelogde gamer wil ik een game aan mijn wishlist kunnen toevoegen zonder page reload**

**Acceptance Criteria:**
- [ ] "Wil ik hebben" knop op `game_detail.php` gebruikt AJAX
- [ ] JavaScript `fetch()` stuurt JSON naar `add_to_wishlist.php`
- [ ] PHP retourneert JSON response: `{"success": true, "message": "Toegevoegd aan wishlist"}`
- [ ] Knoptekst verandert live naar "Op wishlist ✓" zonder refresh
- [ ] Error handling toont melding als game al op wishlist staat

**Assessment Voorbeeldvraag:**
"Laat je AJAX implementatie zien en leg uit hoe JSON data wordt uitgewisseld."

---

### Filtering/Zoeken

#### US-12: Filteren op Platform
**Als bezoeker wil ik games kunnen filteren op platform**

**Acceptance Criteria:**
- [ ] Sidebar of dropdown op `games_index.php` toont alle platforms
- [ ] Filter links gebruiken GET parameter: `?platform_id=2`
- [ ] WHERE clause in prepared statement filtert op geselecteerd platform
- [ ] Actieve filter is visueel zichtbaar

---

#### US-13: Filteren op Genre en Zoeken op Titel
**Als bezoeker wil ik games kunnen filteren op genre en zoeken op titel**

**Acceptance Criteria:**
- [ ] Genrefilters via GET parameter: `?genre=RPG`
- [ ] Zoekbalk stuurt GET parameter: `?search=zelda`
- [ ] LIKE query met prepared statement: `WHERE titel LIKE :search`
- [ ] Zoekterm wordt veilig verwerkt: `%zelda%`
- [ ] Meerdere filters kunnen gecombineerd worden

**Assessment Voorbeeldvraag:**
"Laat zien hoe je filtering hebt geïmplementeerd met prepared statements."

---

### Code Kwaliteit

#### US-14: Logische Bestandsstructuur
**Als developer wil ik een logische bestandsstructuur**

**Acceptance Criteria:**
- [ ] Database connectie in apart `database.php` bestand
- [ ] Header/footer in aparte includes
- [ ] Process bestanden voor formulier afhandeling
- [ ] Consistente naamgeving

**Bestandsstructuur:**
```
gamevault/
├── database.php
├── header.php
├── footer.php
├── index.php
├── login.php
├── login_process.php
├── register.php
├── register_process.php
├── games_index.php
├── game_detail.php
├── game_create.php
├── game_create_process.php
├── game_update.php
├── game_update_process.php
├── game_delete.php
├── games_deleted.php
├── platforms_index.php
├── add_to_wishlist.php
├── my_wishlist.php
└── style.css
```

---

## Checklist voor Assessment

### Voor Projectweek
- [ ] Database aangemaakt met alle tabellen
- [ ] PDO connectie werkend
- [ ] Alle CRUD operaties werkend
- [ ] Login/registratie met password hashing
- [ ] Soft delete geïmplementeerd
- [ ] JOIN query voor platforms en games
- [ ] AJAX wishlist functionaliteit
- [ ] Filtering op platform en genre
- [ ] `htmlspecialchars()` overal toegepast
- [ ] Session management voor login

### Voor Mondeling
- [ ] Kan alle CRUD functionaliteiten demonstreren en toelichten
- [ ] Kan prepared statements uitleggen en aanwijzen
- [ ] Kan `password_hash()` en `password_verify()` uitleggen
- [ ] Kan `htmlspecialchars()` uitleggen met voorbeeld
- [ ] Kan AJAX implementatie uitleggen
- [ ] Kan JOIN query uitleggen
- [ ] Kan soft delete uitleggen
- [ ] Kan 1-op-1 en 1-op-veel relaties uitleggen

---

## Extra Uitdagingen (Nice-to-Have)

1. **Collectie bijhouden**
   - Gamer kan een game markeren als "Heb ik" naast de wishlist
   - Overzicht van eigen collectie op profielpagina

2. **Beoordeling geven**
   - Gamers kunnen een game een score geven (1-10)
   - Gemiddelde score zichtbaar op de detailpagina

3. **Uitgespeeld markeren via AJAX**
   - Knop "Uitgespeeld" markeert de game zonder page reload
   - Voortgangsbalk op profielpagina (X van Y games uitgespeeld)

4. **Zoeken met autocomplete**
   - Zoekbalk toont suggesties terwijl je typt via AJAX

5. **Custom Error Pages**
   - Eigen 404-pagina als een game niet bestaat
   - Eigen 403-pagina bij onbevoegde toegang
