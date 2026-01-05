# Project 3: BookHaven - Library Management System

## Introductie
BookHaven is een bibliotheek management systeem waar leden boeken kunnen zoeken, lenen en hun leengeschiedenis kunnen bekijken. Bibliothecarissen kunnen het boekenbestand beheren en nieuwe boeken toevoegen aan de collectie.

### Verhaal van de opdrachtgever

"Hallo! Ik ben Emma, hoofd van de openbare bibliotheek BookHaven. We hebben een groeiende collectie boeken en steeds meer leden, maar ons huidige papieren systeem raakt overbelast.

We willen graag een digitaal systeem waar we onze boeken kunnen beheren en leden online kunnen zoeken en lenen. Voor elk boek willen we informatie bijhouden zoals:

Boeken (books):
- titel
- ISBN
- publicatiejaar
- genre (fictie, non-fictie, geschiedenis, etc.)
- aantal beschikbare exemplaren
- auteur

Auteurs (authors):
- voornaam
- achternaam
- geboortejaar
- land van herkomst

Leden (users) moeten een account kunnen aanmaken met:
- naam
- email
- wachtwoord
- adres
- telefoonnummer

Voor lidkaarten (member_cards) houden we bij:
- uniek lidnummer
- afgiftedatum
- vervaldatum
- maximaal aantal uitleningen

Voor uitleningen (loans) willen we bijhouden:
- welk boek
- welk lid
- leendatum
- inleverdatum
- daadwerkelijke retourdatum

Als bibliothecarissen willen we het boekenbestand kunnen beheren - nieuwe boeken toevoegen, gegevens wijzigen, en verwijderde boeken kunnen herstellen. Leden moeten kunnen zoeken op titel of auteur, en kunnen filteren op genre.

Het is belangrijk dat we kunnen zien welke boeken beschikbaar zijn en welke uitgeleend zijn. En natuurlijk moet alles veilig zijn - we werken met persoonlijke gegevens van onze leden.

Kunnen jullie ons helpen dit te realiseren?"

## Opdracht 1 - Database Ontwerp

Studenten moeten zelf een database ontwerp maken op basis van bovenstaande vereisten.

- Stap 1: ERD
- Stap 2: Relatie Model
- Stap 3: DB Bouwen

---

## Opdracht 2 - User Stories

### Database & PDO

#### US-01: PDO Database Connectie
**Als developer wil ik PDO gebruiken in plaats van mysqli**

**Acceptance Criteria:**
- [ ] PDO connectie met try-catch error handling
- [ ] Alle queries gebruiken prepared statements
- [ ] Database structuur: `users`, `member_cards`, `books`, `authors`, `loans`

---

#### US-02: Genormaliseerd Database Design
**Als developer wil ik een goed genormaliseerd database design**

**Acceptance Criteria:**
- [ ] Primary keys (id kolommen) op alle tabellen
- [ ] Foreign key constraints correct ingesteld
- [ ] Indexes op foreign key kolommen voor performance

**Assessment Voorbeeldvraag:**
"Leg uit waarom we authors in een aparte tabel hebben en niet als tekstveld in books."

---


### Security

#### US-03: Account Aanmaken
**Als lid wil ik een account kunnen aanmaken**

**Acceptance Criteria:**
- [ ] Registratie formulier met email, password, naam
- [ ] `password_hash(PASSWORD_DEFAULT)` voordat opslag in database
- [ ] htmlspecialchars() op alle user input bij weergave
- [ ] Email validatie (filter_var FILTER_VALIDATE_EMAIL)

---

**Assessment Voorbeeldvraag:**
"Laat zien waar je password_hash() gebruikt en leg uit waarom."

#### US-04: Veilige Login
**Als lid wil ik veilig kunnen inloggen**

**Acceptance Criteria:**
- [ ] `password_verify()` controleert wachtwoord
- [ ] Session management (`$_SESSION['user_id']`, `$_SESSION['role']`)
- [ ] Beschermde pagina's voor bibliothecarissen (role = 'librarian')
- [ ] Session checks op admin/librarian pagina's

**Assessment Voorbeeldvraag:**
"Leg uit waar je password_verify() gebruikt en waarom dit veilig is."

---

### CRUD - Books

#### US-05: Boek Toevoegen (CREATE)
**Als bibliothecaris wil ik nieuwe boeken kunnen toevoegen**

**Acceptance Criteria:**
- [ ] `book_create.php`: titel, ISBN, publicatiejaar, auteur (dropdown)
- [ ] Auteur dropdown haalt data uit `authors` tabel
- [ ] INSERT prepared statement met placeholders
- [ ] Validatie: ISBN uniek, jaar niet in toekomst

---

#### US-06: Boeken Bekijken (READ)
**Als bezoeker wil ik alle boeken kunnen zien**

**Acceptance Criteria:**
- [ ] `books_index.php` toont tabel met alle boeken
- [ ] JOIN query: `SELECT * FROM books JOIN authors ON books.author_id = authors.author_id`
- [ ] Alleen beschikbare boeken (`WHERE deleted_at IS NULL`)
- [ ] Toont: titel, auteur naam, ISBN, beschikbaarheid

**Assessment Voorbeeldvraag:**
"Leg uit wat de JOIN query doet en waarom we een subquery gebruiken voor loaned_count."

---

#### US-07: Boek Wijzigen (UPDATE)
**Als bibliothecaris wil ik boekgegevens kunnen aanpassen**

**Acceptance Criteria:**
- [ ] `book_update.php` toont formulier met huidige data (pre-filled)
- [ ] Auteur dropdown toont huidige auteur als selected
- [ ] UPDATE query in `book_update_process.php`
- [ ] Validatie op server-side

---

#### US-08: Boek Verwijderen (SOFT DELETE)
**Als bibliothecaris wil ik boeken kunnen verwijderen**

**Acceptance Criteria:**
- [ ] `book_delete.php` gebruikt UPDATE ipv DELETE
- [ ] Zet `deleted_at = NOW()` met prepared statement
- [ ] Alleen role = 'librarian' mag verwijderen
- [ ] Logging naar `delete.log` bestand

**Assessment Voorbeeldvraag:**
"Laat zien wat er gebeurt bij soft delete vs hard delete in je database."

---

#### US-09: Boek Herstellen
**Als bibliothecaris wil ik verwijderde boeken kunnen herstellen**

**Acceptance Criteria:**
- [ ] `books_deleted.php` toont soft-deleted items (`WHERE deleted_at IS NOT NULL`)
- [ ] Herstel knop: `UPDATE books SET deleted_at = NULL WHERE book_id = :id`
- [ ] Role-based access control

---

#### US-10: Per Auteur een overzicht van de boeken
**Als bibliothecaris wil ik een overzicht van de boeken van een bepaalde auteur kunnen zien**

**Acceptance Criteria:**
- [ ] Vanuit authors_index.php kan je naar het overzicht van de boeken van een bepaalde auteur
- [ ] Er wordt een GET parameter meegegeven die de author_id bevat
- [ ] Er wordt een JOIN query gemaakt om de boeken van de auteur te krijgen
- [ ] Filter op author_id
- [ ] Alleen beschikbare boeken worden getoond (`WHERE deleted_at IS NULL`)
- [ ] htmlspecialchars() wordt toegepast op alle getoonde data

**Assessment Voorbeeldvraag:**
"Laat de één-op-veel relatie tussen authors en books zien in je database en code."

---

### AJAX Implementation

#### US-11: Beschikbaarheid Checken
**Als lid wil ik de beschikbaarheid van een boek live kunnen checken**

**Acceptance Criteria:**
- [ ] Knop "Check beschikbaarheid" op `book_detail.php`
- [ ] JavaScript fetch() naar `check_availability.php`
- [ ] PHP query: `SELECT COUNT(*) FROM loans WHERE book_id = :id AND return_date IS NULL`
- [ ] JSON response: `{available: true, copies_left: 3}`
- [ ] UI update zonder page reload

**Assessment Voorbeeldvraag:**
"Laat je AJAX implementatie zien en leg uit hoe JSON werkt."

---

### Filtering/Zoeken

#### US-12: Filteren op Genre
**Als bezoeker wil ik boeken kunnen filteren op genre**

**Acceptance Criteria:**
- [ ] Sidebar met genres: Fiction, Non-fiction, Science, History
- [ ] GET parameter: `?filter=genre&value=Fiction`
- [ ] WHERE clause in prepared statement
- [ ] Breadcrumb toont actieve filters

---

#### US-13: Zoeken op Titel of Auteur
**Als bezoeker wil ik boeken kunnen zoeken op titel of auteur**

**Acceptance Criteria:**
- [ ] Zoekformulier met GET method
- [ ] LIKE query: `WHERE title LIKE :search OR author_name LIKE :search`
- [ ] Prepared statement met wildcards: `%search%`

**Assessment Voorbeeldvraag:**
"Laat zien hoe je zoekfunctie werkt met prepared statements."

---

### Code Kwaliteit

#### US-14: MVC-achtige Structuur
**Als developer wil ik MVC-achtige structuur**

**Acceptance Criteria:**
- [ ] Views (HTML/PHP) gescheiden van logic (process bestanden)
- [ ] database.php voor alle DB connecties
- [ ] Herbruikbare includes (header, footer, nav)
- [ ] DRY principe: geen duplicate code

**Bestandsstructuur:**
```
bookhaven/
├── database.php
├── header.php
├── footer.php
├── index.php
├── login.php
├── login_process.php
├── register.php
├── register_process.php
├── dashboard.php
├── books_index.php
├── book_detail.php
├── book_create.php
├── book_create_process.php
├── book_update.php
├── book_update_process.php
├── book_delete.php
├── books_deleted.php
├── check_availability.php
├── loan_book.php
├── my_loans.php
├── delete.log
└── style.css
```

---

## Checklist voor Assessment

### Voor Projectweek
- [ ] Database met alle tabellen en foreign keys
- [ ] PDO connectie werkend
- [ ] Login/registratie met password hashing
- [ ] CRUD voor books
- [ ] Soft delete met logging
- [ ] JOIN query (books + authors)
- [ ] Één-op-één relatie (users + member_cards)
- [ ] AJAX beschikbaarheid check
- [ ] Filtering en zoeken
- [ ] htmlspecialchars() overal
- [ ] Session management

### Voor Mondeling
- [ ] Kan alle CRUD functionaliteiten demonstreren en toelichten
- [ ] Kan prepared statements uitleggen en aanwijzen
- [ ] Kan password_hash() en password_verify() uitleggen
- [ ] Kan htmlspecialchars() uitleggen met voorbeeld
- [ ] Kan AJAX implementatie uitleggen
- [ ] Kan JOIN query uitleggen
- [ ] Kan soft delete uitleggen
- [ ] Kan één-op-één en één-op-veel relaties uitleggen

---

## Extra Uitdagingen (Nice-to-Have)

1. **Reservering Systeem**
   - Boek reserveren als niet beschikbaar
   - Notificatie bij beschikbaarheid

2. **Boete Berekening**
   - Automatische boete bij te late inlevering
   - Overzicht van boetes

3. **Reading History**
   - Overzicht geleende boeken
   - Statistieken per lid

4. **Review Systeem**
   - Leden kunnen boeken beoordelen
   - Gemiddelde rating tonen

5. **Multi-Author Support**
   - Koppeltabel voor meerdere auteurs per boek
   - Veel-op-veel relatie
