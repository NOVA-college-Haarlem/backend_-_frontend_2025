# Project 3: BookHaven - Library Management System

## Introductie
BookHaven is een bibliotheek management systeem waar leden boeken kunnen zoeken, lenen en hun leengeschiedenis kunnen bekijken. Bibliothecarissen kunnen het boekenbestand beheren en nieuwe boeken toevoegen aan de collectie.

## Database Structuur

Studenten moeten zelf een database ontwerp maken op basis van onderstaande vereisten.

### Entiteiten
- `users` (leden en bibliothecarissen)
- `member_cards` (lidkaart info) - **één-op-één relatie met users**
- `books` (titels in de bibliotheek)
- `authors` (schrijvers) - **één-op-veel relatie met books**
- `loans` (uitleningen)

### Relaties
**Één-op-Veel Relatie:** Een auteur heeft meerdere boeken geschreven, maar een boek heeft één hoofdauteur.

**Een-op-veel Relatie:** Een lid kan meerdere uitleningen doen, maar een uitlening hoort bij één lid.

**Één-op-Één Relatie:** Een user heeft één member_card, en een member_card hoort bij één user.

### Belangrijke Kolommen
- **users:** user_id (PK), email (UNIQUE), password, firstname, lastname, role, deleted_at
- **member_cards:** card_id (PK), member_number (UNIQUE), issue_date, expiry_date, max_loans, deleted_at
- **books:** book_id (PK), title, isbn (UNIQUE), publication_year, genre, copies_available, deleted_at
- **authors:** author_id (PK), firstname, lastname, country, birth_year, deleted_at
- **loans:** loan_id (PK), loan_date, due_date, return_date

---

## User Stories

### Database & PDO (20 punten)

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

**Assessment Vraag:**
"Leg uit waarom we authors in een aparte tabel hebben en niet als tekstveld in books."

---

#### US-02B: Één-op-Één Relatie Implementeren
**Als developer wil ik een één-op-één relatie tussen users en member_cards**

**Acceptance Criteria:**
- [ ] De `user_id` kolom in `member_cards` heeft een UNIQUE constraint (dit maakt het 1-op-1)
- [ ] Bij registratie wordt automatisch een member_card aangemaakt met uniek member_number
- [ ] JOIN query kan gebruikt worden om user data + lidkaart data te combineren

**Assessment Vraag:**
"Wat is het verschil tussen een één-op-één en één-op-veel relatie? Laat beide zien in je database."

---

### Security (15 punten)

#### US-03: Account Aanmaken
**Als lid wil ik een account kunnen aanmaken**

**Acceptance Criteria:**
- [ ] Registratie formulier met email, password, naam
- [ ] `password_hash(PASSWORD_DEFAULT)` voordat opslag in database
- [ ] htmlspecialchars() op alle user input bij weergave
- [ ] Email validatie (filter_var FILTER_VALIDATE_EMAIL)

---

#### US-04: Inloggen
**Als lid wil ik kunnen inloggen**

**Acceptance Criteria:**
- [ ] Login formulier POST naar `login_process.php`
- [ ] `password_verify()` vergelijkt ingevoerd wachtwoord met hash
- [ ] Bij success: `$_SESSION['user_id']` en `$_SESSION['role']` instellen
- [ ] Bij failure: generieke foutmelding

**Assessment Vraag:**
"Laat password_verify() zien in je code en leg uit waarom we dit gebruiken."

---

### CRUD - Books (10 punten)

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

**Assessment Vraag:**
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

**Assessment Vraag:**
"Laat zien wat er gebeurt bij soft delete vs hard delete in je database."

---

#### US-09: Boek Herstellen
**Als bibliothecaris wil ik verwijderde boeken kunnen herstellen**

**Acceptance Criteria:**
- [ ] `books_deleted.php` toont soft-deleted items (`WHERE deleted_at IS NOT NULL`)
- [ ] Herstel knop: `UPDATE books SET deleted_at = NULL WHERE book_id = :id`
- [ ] Role-based access control

---

### Één-op-Veel Relatie Feature

#### US-10: Auteur Selecteren
**Als bibliothecaris wil ik bij het toevoegen van een boek een auteur kunnen selecteren**

**Acceptance Criteria:**
- [ ] SELECT query haalt alle auteurs op voor dropdown
- [ ] JOIN in overzicht toont auteur naam ipv ID

**Assessment Vraag:**
"Laat de één-op-veel relatie zien tussen authors en books in je database schema."

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

**Assessment Vraag:**
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

**Assessment Vraag:**
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
- [ ] Demo van alle functionaliteit
- [ ] Prepared statements uitleggen
- [ ] Password hashing tonen
- [ ] XSS preventie demonstreren
- [ ] AJAX + JSON uitleggen
- [ ] JOIN query uitleggen
- [ ] Soft delete tonen
- [ ] Verschil 1-op-1 vs 1-op-veel relatie uitleggen

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
