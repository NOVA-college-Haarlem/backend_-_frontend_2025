# Project 4: RecipeBox - Recepten Platform

## Introductie
RecipeBox is een platform waar thuiskoks recepten kunnen delen en bewaren. Gebruikers registreren zich met een kookprofiel, voegen recepten toe en beheren hun eigen aanbod. Bezoekers kunnen filteren op categorie en bereidingstijd. Ingelogde gebruikers kunnen recepten aan hun favorietenlijst toevoegen via AJAX. Beheerders kunnen recepten soft-deleten en herstellen.

### Verhaal van de opdrachtgever

"Hallo! Ik ben Nora, ik ben gek op koken en ik mis een simpele plek waar ik recepten kan delen met vrienden en familie. Ik wil een platform bouwen waarbij mensen hun eigen recepten kunnen plaatsen en die van anderen kunnen bewaren.

Gebruikers maken een account aan. Bij registratie vullen ze naast naam en e-mail ook hun kookniveau (beginner / gevorderd / expert) en een specialiteit (bijv. Italiaans, Aziatisch, Gebak) in — dat wordt hun kookprofiel.

De kern van het systeem zijn de recepten:
- titel
- omschrijving (kort)
- bereidingstijd (in minuten)
- aantal porties
- ingrediënten (tekstveld)
- bereidingswijze (tekstveld)
- foto_url (optioneel)
- categorie (bijv. Ontbijt, Lunch, Diner, Dessert, Snacks)

Een categorie heeft meerdere recepten. Beheerders kunnen recepten toevoegen, wijzigen en verwijderen. Verwijderen mag geen permanent verlies zijn — soft delete dus.

Ingelogde gebruikers moeten recepten aan hun favorieten kunnen toevoegen zonder page reload. Bezoekers moeten kunnen filteren op categorie en bereidingstijd.

Kunnen jullie dit voor mij bouwen?"

## Opdracht 1 - Database Ontwerp

Studenten moeten zelf een database ontwerp maken op basis van bovenstaande vereisten.

- Stap 1: ERD
- Stap 2: Relatie Model
- Stap 3: DB Bouwen

**Entiteiten en belangrijke kolommen:**

**users**: id, naam, email, wachtwoord, rol (admin/user), created_at

**cook_profiles** (1-op-1 met users): id, user_id, kookniveau, specialiteit, bio

**categories** (1-op-veel naar recipes): id, naam, omschrijving

**recipes** (hoort bij category en user): id, titel, omschrijving, bereidingstijd, porties, ingredienten, bereidingswijze, foto_url, category_id (FK), user_id (FK), deleted_at, created_at

**favorites**: id, user_id (FK), recipe_id (FK), created_at

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
- [ ] Unique constraint op email
- [ ] 1-op-1 relatie tussen users en cook_profiles
- [ ] 1-op-veel relatie tussen categories en recipes

**Assessment Voorbeeldvraag:**
"Waarom hebben we een aparte cook_profiles tabel naast users?"

---

### Security

#### US-03: Veilige Registratie
**Als thuiskok wil ik veilig kunnen registreren**

**Acceptance Criteria:**
- [ ] Wachtwoord wordt gehashed met `password_hash()` voor opslag
- [ ] Email validatie voorkomt ongeldige invoer
- [ ] `htmlspecialchars()` wordt toegepast op alle user input bij weergave
- [ ] Prepared statements voorkomen SQL-injectie
- [ ] Input validatie op alle formuliervelden
- [ ] Bij registratie wordt automatisch een cook_profile aangemaakt

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

### CRUD - Recipes

#### US-05: Recept Toevoegen (CREATE)
**Als ingelogde gebruiker wil ik een recept kunnen toevoegen**

**Acceptance Criteria:**
- [ ] Formulier op `recipe_create.php` met velden: titel, omschrijving, bereidingstijd, porties, ingrediënten, bereidingswijze, foto_url, categorie (dropdown)
- [ ] POST naar `recipe_create_process.php` met prepared statement INSERT query
- [ ] Categorie dropdown toont alle categorieën uit de `categories` tabel
- [ ] Input validatie controleert of alle verplichte velden zijn ingevuld
- [ ] Alleen ingelogde gebruikers kunnen recepten toevoegen (session check)

---

#### US-06: Recepten Overzicht (READ)
**Als bezoeker wil ik een overzicht van alle recepten zien**

**Acceptance Criteria:**
- [ ] `recipes_index.php` toont alle recepten in een grid of lijst
- [ ] JOIN query toont categorienaam bij elk recept
- [ ] Alleen niet-verwijderde recepten worden getoond (`WHERE deleted_at IS NULL`)
- [ ] `htmlspecialchars()` wordt toegepast op alle getoonde data

**Assessment Voorbeeldvraag:**
"Leg uit wat deze JOIN query doet en waarom we dat nodig hebben."

---

#### US-07: Recept Wijzigen (UPDATE)
**Als eigenaar wil ik mijn recept kunnen wijzigen**

**Acceptance Criteria:**
- [ ] `recipe_update.php` toont formulier met huidige gegevens (pre-filled)
- [ ] Categorie dropdown toont de huidige categorie als geselecteerd
- [ ] POST naar `recipe_update_process.php` met UPDATE query via prepared statement
- [ ] Validatie controleert of recipe_id numeriek is (`is_numeric()`)
- [ ] Alleen de eigenaar of een admin mag het recept wijzigen (session check)

---

#### US-08: Recept Verwijderen (SOFT DELETE)
**Als beheerder wil ik een recept kunnen verwijderen**

**Acceptance Criteria:**
- [ ] `recipe_delete.php` zet `deleted_at` timestamp in plaats van hard delete
- [ ] Alleen admins of de eigenaar kunnen recepten verwijderen (role/session check)
- [ ] Confirmation dialog voorkomt onbedoeld verwijderen
- [ ] Na verwijderen redirect naar `recipes_index.php` met success message

**Assessment Voorbeeldvraag:**
"Wat is het verschil tussen soft delete en hard delete? Laat je code zien."

---

#### US-09: Recept Herstellen
**Als beheerder wil ik verwijderde recepten kunnen herstellen**

**Acceptance Criteria:**
- [ ] `recipes_deleted.php` toont alle soft-deleted recepten
- [ ] "Herstel" link zet `deleted_at` terug naar NULL
- [ ] Alleen admins hebben toegang tot deze pagina

---

#### US-10: Per Categorie een Overzicht van de Recepten
**Als bezoeker wil ik recepten kunnen bekijken per categorie**

**Acceptance Criteria:**
- [ ] Vanuit `categories_index.php` kan je doorklikken naar recepten van een categorie
- [ ] Er wordt een GET parameter meegegeven: `?category_id=1`
- [ ] JOIN query toont de categorienaam in de paginatitel
- [ ] Filter op category_id via prepared statement
- [ ] Alleen niet-verwijderde recepten worden getoond

**Assessment Voorbeeldvraag:**
"Laat zien hoe je de één-op-veel relatie hebt opgezet tussen categories en recipes."

---

### AJAX Implementation

#### US-11: Recept Toevoegen aan Favorieten zonder Page Reload
**Als ingelogde gebruiker wil ik een recept aan mijn favorieten kunnen toevoegen zonder page reload**

**Acceptance Criteria:**
- [ ] "Bewaar recept" knop op `recipe_detail.php` gebruikt AJAX
- [ ] JavaScript `fetch()` stuurt JSON naar `add_to_favorites.php`
- [ ] PHP retourneert JSON response: `{"success": true, "message": "Toegevoegd aan favorieten"}`
- [ ] Knoptekst verandert live naar "Opgeslagen ✓" zonder refresh
- [ ] Error handling toont melding als recept al in favorieten staat

**Assessment Voorbeeldvraag:**
"Laat je AJAX implementatie zien en leg uit hoe JSON data wordt uitgewisseld."

---

### Filtering/Zoeken

#### US-12: Filteren op Categorie
**Als bezoeker wil ik recepten kunnen filteren op categorie**

**Acceptance Criteria:**
- [ ] Sidebar of dropdown op `recipes_index.php` toont alle categorieën
- [ ] Filter links gebruiken GET parameter: `?category_id=2`
- [ ] WHERE clause in prepared statement filtert op geselecteerde categorie
- [ ] Actieve filter is visueel zichtbaar

---

#### US-13: Filteren op Bereidingstijd en Zoeken op Titel
**Als bezoeker wil ik recepten kunnen filteren op bereidingstijd en zoeken op titel**

**Acceptance Criteria:**
- [ ] Tijdfilters via GET parameter: `?tijd=snel` (snel: ≤30 min, normaal: 31-60 min, uitgebreid: 60+ min)
- [ ] Zoekbalk stuurt GET parameter: `?search=pasta`
- [ ] LIKE query met prepared statement: `WHERE titel LIKE :search`
- [ ] Zoekterm wordt veilig verwerkt: `%pasta%`
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
recipebox/
├── database.php
├── header.php
├── footer.php
├── index.php
├── login.php
├── login_process.php
├── register.php
├── register_process.php
├── recipes_index.php
├── recipe_detail.php
├── recipe_create.php
├── recipe_create_process.php
├── recipe_update.php
├── recipe_update_process.php
├── recipe_delete.php
├── recipes_deleted.php
├── categories_index.php
├── add_to_favorites.php
├── my_favorites.php
├── my_recipes.php
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
- [ ] JOIN query voor categories en recipes
- [ ] AJAX favorieten functionaliteit
- [ ] Filtering op categorie en bereidingstijd
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

1. **Beoordeling geven via AJAX**
   - Gebruikers kunnen een recept een score geven (1-5 sterren) zonder page reload
   - Gemiddelde score zichtbaar op de detailpagina

2. **Weekmenu Planner**
   - Gebruiker kan recepten koppelen aan een dag van de week
   - Overzicht van het weekmenu op de profielpagina

3. **Ingrediëntenlijst exporteren**
   - Alle ingrediënten van favoriete recepten samenvoegen tot een boodschappenlijst
   - Weergeven op een aparte pagina

4. **Kookprofiel pagina**
   - Openbare profielpagina per gebruiker met hun recepten en kookniveau
   - Andere gebruikers kunnen het profiel bekijken

5. **Custom Error Pages**
   - Eigen 404-pagina als een recept niet bestaat
   - Eigen 403-pagina bij onbevoegde toegang
