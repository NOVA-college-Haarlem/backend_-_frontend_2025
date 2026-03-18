# Project 1: SnapMarket - Tweedehands Marktplaats

## Introductie
SnapMarket is een platform waar gebruikers tweedehands spullen kunnen aanbieden en kopen. Denk aan een mini-Vinted of Marktplaats. Verkopers maken een account aan, plaatsen advertenties en beheren hun aanbod. Kopers kunnen bladeren door het aanbod, filteren op categorie en conditie, en artikelen op hun watchlist zetten. Beheerders kunnen advertenties soft-deleten en herstellen.

### Verhaal van de opdrachtgever

"Hey! Ik ben Lars, oprichter van SnapMarket. Ik ben een beetje klaar met de grote platformen — hoge commissies, geen persoonlijk contact. Ik wil een eenvoudige marktplaats bouwen voor mijn buurt, maar die later groter kan worden.

Ik wil dat mensen een account kunnen aanmaken als verkoper. Bij registratie vullen ze naast hun naam en e-mail ook een korte bio en hun telefoonnummer in voor het verkopersprofiel.

De kern van het systeem zijn de advertenties (items):
- titel
- omschrijving
- prijs
- conditie (nieuw / goed / redelijk / slecht)
- status (beschikbaar / verkocht)
- foto-url (optioneel)
- categorie (bijv. Kleding, Elektronica, Boeken, Sport, Wonen)

Items horen altijd bij een categorie. En elke categorie heeft een naam en een korte omschrijving.

Bezoekers moeten kunnen filteren op categorie en conditie. Ingelogde gebruikers kunnen een item aan hun watchlist toevoegen — zonder dat de pagina herlaadt. Als een item van de marktplaats af moet, wil ik dat het soft-deleted wordt zodat ik het later kan herstellen als er iets mis is gegaan.

Kunnen jullie dit voor mij bouwen?"

## Opdracht 1 - Database Ontwerp

Studenten moeten zelf een database ontwerp maken op basis van bovenstaande vereisten.

- Stap 1: ERD
- Stap 2: Relatie Model
- Stap 3: DB Bouwen

**Entiteiten en belangrijke kolommen:**

**users**: id, naam, email, wachtwoord, rol (admin/user), created_at

**seller_profiles** (1-op-1 met users): id, user_id, bio, telefoonnummer, beoordelingsscore

**categories** (1-op-veel naar items): id, naam, omschrijving

**items** (hoort bij category en user): id, titel, omschrijving, prijs, conditie, status, foto_url, user_id (FK), category_id (FK), deleted_at, created_at

**watchlist**: id, user_id (FK), item_id (FK), created_at

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
- [ ] 1-op-1 relatie tussen users en seller_profiles
- [ ] 1-op-veel relatie tussen categories en items

**Assessment Voorbeeldvraag:**
"Waarom hebben we een aparte seller_profiles tabel naast users?"

---

### Security

#### US-03: Veilige Registratie
**Als verkoper wil ik veilig kunnen registreren**

**Acceptance Criteria:**
- [ ] Wachtwoord wordt gehashed met `password_hash()` voor opslag
- [ ] Email validatie voorkomt ongeldige invoer
- [ ] `htmlspecialchars()` wordt toegepast op alle user input bij weergave
- [ ] Prepared statements voorkomen SQL-injectie
- [ ] Input validatie op alle formuliervelden
- [ ] Bij registratie wordt automatisch een seller_profile aangemaakt

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

### CRUD - Items

#### US-05: Advertentie Plaatsen (CREATE)
**Als verkoper wil ik een advertentie kunnen plaatsen**

**Acceptance Criteria:**
- [ ] Formulier op `item_create.php` met velden: titel, omschrijving, prijs, conditie (dropdown), foto_url, categorie (dropdown)
- [ ] POST naar `item_create_process.php` met prepared statement INSERT query
- [ ] Categorie dropdown toont alle categorieën uit de `categories` tabel
- [ ] Input validatie controleert of alle verplichte velden zijn ingevuld
- [ ] Alleen ingelogde gebruikers kunnen een advertentie plaatsen (session check)

---

#### US-06: Advertenties Overzicht (READ)
**Als bezoeker wil ik een overzicht van alle beschikbare advertenties zien**

**Acceptance Criteria:**
- [ ] `items_index.php` toont alle beschikbare items in een grid of lijst
- [ ] JOIN query toont categorienaam bij elk item
- [ ] Alleen beschikbare items worden getoond (`WHERE status = 'beschikbaar' AND deleted_at IS NULL`)
- [ ] `htmlspecialchars()` wordt toegepast op alle getoonde data

**Assessment Voorbeeldvraag:**
"Leg uit wat deze JOIN query doet en waarom we dat nodig hebben."

---

#### US-07: Advertentie Wijzigen (UPDATE)
**Als verkoper wil ik mijn advertentie kunnen wijzigen**

**Acceptance Criteria:**
- [ ] `item_update.php` toont formulier met huidige gegevens (pre-filled)
- [ ] Categorie dropdown toont huidige categorie als geselecteerd
- [ ] POST naar `item_update_process.php` met UPDATE query via prepared statement
- [ ] Validatie controleert of item_id numeriek is (`is_numeric()`)
- [ ] Alleen de eigenaar van het item mag het wijzigen (session check)

---

#### US-08: Advertentie Verwijderen (SOFT DELETE)
**Als beheerder wil ik advertenties kunnen verwijderen**

**Acceptance Criteria:**
- [ ] `item_delete.php` zet `deleted_at` timestamp in plaats van hard delete
- [ ] Alleen admins kunnen items verwijderen (role check)
- [ ] Confirmation dialog voorkomt onbedoeld verwijderen
- [ ] Na verwijderen redirect naar `items_index.php` met success message

**Assessment Voorbeeldvraag:**
"Wat is het verschil tussen soft delete en hard delete? Laat je code zien."

---

#### US-09: Advertentie Herstellen
**Als beheerder wil ik verwijderde advertenties kunnen herstellen**

**Acceptance Criteria:**
- [ ] `items_deleted.php` toont alle soft-deleted items
- [ ] "Herstel" link zet `deleted_at` terug naar NULL
- [ ] Alleen admins hebben toegang tot deze pagina

---

#### US-10: Per Categorie een Overzicht
**Als bezoeker wil ik items kunnen bekijken per categorie**

**Acceptance Criteria:**
- [ ] Vanuit `categories_index.php` kan je doorklikken naar items van een categorie
- [ ] Er wordt een GET parameter meegegeven: `?category_id=1`
- [ ] JOIN query toont de categorienaam in de paginatitel
- [ ] Filter op category_id via prepared statement
- [ ] Alleen beschikbare items worden getoond

**Assessment Voorbeeldvraag:**
"Laat zien hoe je de één-op-veel relatie hebt opgezet tussen categories en items."

---

### AJAX Implementation

#### US-11: Item Toevoegen aan Watchlist zonder Page Reload
**Als ingelogde gebruiker wil ik een item aan mijn watchlist kunnen toevoegen zonder page reload**

**Acceptance Criteria:**
- [ ] "Bewaar" knop op `item_detail.php` gebruikt AJAX
- [ ] JavaScript `fetch()` stuurt JSON naar `add_to_watchlist.php`
- [ ] PHP retourneert JSON response: `{"success": true, "message": "Toegevoegd aan watchlist"}`
- [ ] Knoptekst verandert live naar "Opgeslagen ✓" zonder refresh
- [ ] Error handling toont melding als item al op watchlist staat

**Assessment Voorbeeldvraag:**
"Laat je AJAX implementatie zien en leg uit hoe JSON data wordt uitgewisseld."

---

### Filtering/Zoeken

#### US-12: Filteren op Categorie
**Als bezoeker wil ik items kunnen filteren op categorie**

**Acceptance Criteria:**
- [ ] Sidebar of dropdown op `items_index.php` toont alle categorieën
- [ ] Filter links gebruiken GET parameter: `?category_id=2`
- [ ] WHERE clause in prepared statement filtert op geselecteerde categorie
- [ ] Actieve filter is visueel zichtbaar

---

#### US-13: Filteren op Conditie en Zoeken op Titel
**Als bezoeker wil ik items kunnen filteren op conditie en zoeken op titel**

**Acceptance Criteria:**
- [ ] Conditiefilters: Nieuw / Goed / Redelijk / Slecht via GET parameter `?conditie=goed`
- [ ] Zoekbalk stuurt GET parameter `?search=fiets`
- [ ] LIKE query met prepared statement: `WHERE titel LIKE :search`
- [ ] Zoekterm wordt veilig verwerkt: `%fiets%`
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
snapmarket/
├── database.php
├── header.php
├── footer.php
├── index.php
├── login.php
├── login_process.php
├── register.php
├── register_process.php
├── items_index.php
├── item_detail.php
├── item_create.php
├── item_create_process.php
├── item_update.php
├── item_update_process.php
├── item_delete.php
├── items_deleted.php
├── categories_index.php
├── add_to_watchlist.php
├── my_watchlist.php
├── my_items.php
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
- [ ] JOIN query voor categories en items
- [ ] AJAX watchlist functionaliteit
- [ ] Filtering op categorie en conditie
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

1. **Status bijwerken via AJAX**
   - Verkoper kan item markeren als "Verkocht" zonder page reload
   - Knop verdwijnt automatisch uit het overzicht

2. **Foto Upload**
   - Echte afbeelding uploaden in plaats van een URL invoeren
   - Afbeelding tonen op de detailpagina

3. **Beoordelingssysteem**
   - Kopers kunnen verkopers een beoordeling geven (1-5 sterren)
   - Gemiddelde score zichtbaar op verkopersprofiel

4. **Mijn Advertenties Dashboard**
   - Overzicht van eigen actieve en verkochte items
   - Statistieken: totaal geplaatst, totaal verkocht

5. **Custom Error Pages**
   - Eigen 404-pagina als een item niet bestaat
   - Eigen 403-pagina bij onbevoegde toegang
