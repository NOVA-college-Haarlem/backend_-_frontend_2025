# Project 7: HomeFinder - Real Estate Listings

## Introductie
HomeFinder is een vastgoed platform waar makelaars woningen kunnen aanbieden en kopers kunnen zoeken naar hun droomhuis. Bezoekers kunnen panden bekijken, filteren op locatie, prijs en type. Makelaars beheren hun eigen portefeuille van panden.

## Database Structuur

Studenten moeten zelf een database ontwerp maken op basis van onderstaande vereisten.

### Entiteiten
- `users` (kopers en makelaars)
- `buyer_profiles` (koper voorkeuren) - **één-op-één relatie met users**
- `properties` (woningen, appartementen, etc.)
- `agents` (makelaars) - **één-op-veel relatie met properties**
- `viewings` (bezichtigingen)

### Relaties
**Één-op-Veel Relatie:** Een makelaar beheert meerdere panden, maar een pand heeft één verantwoordelijke makelaar.

**Één-op-Één Relatie:** Een user heeft één buyer_profile, en een buyer_profile hoort bij één user.

### Belangrijke Kolommen
- **users:** user_id (PK), email (UNIQUE), password, firstname, lastname, phone, role, deleted_at
- **buyer_profiles:** profile_id (PK), user_id (FK, UNIQUE), max_budget, preferred_locations, preferred_property_type, financing_approved, deleted_at
- **properties:** property_id (PK), address, city, postal_code, property_type, price, bedrooms, bathrooms, square_meters, description, agent_id (FK), status, deleted_at
- **agents:** agent_id (PK), user_id (FK), agency_name, bio, license_number, deleted_at
- **viewings:** viewing_id (PK), property_id (FK), user_id (FK), viewing_date, viewing_time, status, created_at

---

## User Stories

### Database & PDO (20 punten)

#### US-01: PDO Database Connectie
**Als developer wil ik PDO implementeren**

**Acceptance Criteria:**
- [ ] PDO connectie met error mode exception
- [ ] Prepared statements bij alle queries
- [ ] Tabellen: `users`, `buyer_profiles`, `properties`, `agents`, `viewings`

---

#### US-02: Genormaliseerde Database
**Als developer wil ik een genormaliseerde database**

**Acceptance Criteria:**
- [ ] Primary keys (id) overal
- [ ] Foreign key constraints
- [ ] Correcte data types (DECIMAL voor prijs)

**Assessment Vraag:**
"Waarom hebben we een aparte agents tabel naast users?"

---

#### US-02B: Één-op-Één Relatie Implementeren
**Als developer wil ik een één-op-één relatie tussen users en buyer_profiles**

**Acceptance Criteria:**
- [ ] De `user_id` kolom in `buyer_profiles` heeft een UNIQUE constraint (dit maakt het 1-op-1)
- [ ] Bij registratie wordt automatisch een buyer_profile record aangemaakt
- [ ] JOIN query kan gebruikt worden om user data + koper voorkeuren te combineren

**Assessment Vraag:**
"Wat is het verschil tussen een één-op-één en één-op-veel relatie? Laat beide zien in je database."

---

### Security (15 punten)

#### US-03: Veilige Registratie
**Als koper wil ik veilig kunnen registreren**

**Acceptance Criteria:**
- [ ] `password_hash()` wachtwoord opslag
- [ ] Email + telefoonnummer validatie
- [ ] htmlspecialchars() op output
- [ ] SQL-injectie preventie

---

#### US-04: Veilig Inloggen
**Als gebruiker wil ik veilig kunnen inloggen**

**Acceptance Criteria:**
- [ ] `password_verify()` login check
- [ ] Session management (`user_id`, `role`)
- [ ] Protected routes voor makelaars
- [ ] Input sanitization

**Assessment Vraag:**
"Laat password_hash() en password_verify() zien in je code."

---

### CRUD - Properties (10 punten)

#### US-05: Pand Toevoegen (CREATE)
**Als makelaar wil ik woningen kunnen toevoegen**

**Acceptance Criteria:**
- [ ] Formulier: adres, type, prijs, kamers, m², makelaar (dropdown)
- [ ] Agent dropdown uit database
- [ ] INSERT prepared statement
- [ ] Prijs en m² validatie (numeriek, positief)

---

#### US-06: Panden Bekijken (READ)
**Als bezoeker wil ik woningen kunnen bekijken**

**Acceptance Criteria:**
- [ ] `properties_index.php` toont alle panden
- [ ] JOIN query toont makelaar naam en foto
- [ ] Alleen actieve listings (`deleted_at IS NULL`)
- [ ] htmlspecialchars() op alle data

**Assessment Vraag:**
"Leg uit hoe de JOIN query werkt om makelaar informatie te tonen."

---

#### US-07: Pand Wijzigen (UPDATE)
**Als makelaar wil ik pandgegevens kunnen wijzigen**

**Acceptance Criteria:**
- [ ] `property_update.php` met pre-filled form
- [ ] Agent dropdown heeft current agent selected
- [ ] UPDATE query met WHERE
- [ ] Alleen eigen panden wijzigbaar

---

#### US-08: Pand Deactiveren (SOFT DELETE)
**Als makelaar wil ik panden kunnen deactiveren**

**Acceptance Criteria:**
- [ ] Soft delete bij verkoop
- [ ] `deleted_at` timestamp
- [ ] Confirmation dialog
- [ ] Redirect met success message

**Assessment Vraag:**
"Wat is het verschil tussen soft delete en hard delete?"

---

#### US-09: Verkochte Panden Herstellen
**Als admin wil ik verwijderde panden kunnen herstellen**

**Acceptance Criteria:**
- [ ] Overzicht van sold/deleted properties
- [ ] Restore functie
- [ ] Admin role required

---

### Één-op-Veel Relatie Feature

#### US-10: Makelaar Toewijzen
**Als makelaar wil ik mezelf kunnen toewijzen aan een pand**

**Acceptance Criteria:**
- [ ] Dropdown selecteert makelaar
- [ ] JOIN toont makelaar info in listings

**Assessment Vraag:**
"Laat de één-op-veel relatie tussen agents en properties zien."

---

### AJAX Implementation

#### US-11: Interesse Tonen zonder Refresh
**Als bezoeker wil ik interesse kunnen tonen zonder page reload**

**Acceptance Criteria:**
- [ ] "Toon interesse" knop op `property_detail.php`
- [ ] AJAX fetch() naar `show_interest.php`
- [ ] INSERT in `viewings` of `interests` tabel
- [ ] JSON response: `{success: true, message: 'Makelaar neemt contact op'}`
- [ ] UI feedback zonder refresh
- [ ] Error handling (al interesse getoond)

**Assessment Vraag:**
"Laat je AJAX implementatie zien en leg uit hoe JSON data wordt uitgewisseld."

---

### Filtering/Zoeken

#### US-12: Filteren op Woningtype
**Als bezoeker wil ik kunnen filteren op woningtype**

**Acceptance Criteria:**
- [ ] Filters: Appartement, Huis, Villa, Penthouse
- [ ] GET: `?filter=type&value=apartment`
- [ ] WHERE clause prepared statement
- [ ] Visual feedback actieve filter

---

#### US-13: Filteren op Prijsklasse
**Als bezoeker wil ik kunnen filteren op prijsklasse**

**Acceptance Criteria:**
- [ ] Ranges: < €200k, €200-400k, €400-600k, > €600k
- [ ] BETWEEN queries: `WHERE price BETWEEN :min AND :max`
- [ ] Multiple filters combineerbaar

**Assessment Vraag:**
"Laat je filtering zien met prepared statements en BETWEEN queries."

---

### Code Kwaliteit

#### US-14: Professionele Code Structuur
**Als developer wil ik professionele code structuur**

**Acceptance Criteria:**
- [ ] MVC-like separation
- [ ] Reusable includes
- [ ] Consistent naming
- [ ] DRY principe

**Bestandsstructuur:**
```
homefinder/
├── database.php
├── header.php
├── footer.php
├── index.php
├── login.php
├── login_process.php
├── register.php
├── register_process.php
├── properties_index.php
├── property_detail.php
├── property_create.php
├── property_create_process.php
├── property_update.php
├── property_delete.php
├── show_interest.php
├── my_properties.php
├── my_viewings.php
├── delete.log
└── style.css
```

---

## Checklist voor Assessment

### Voor Projectweek
- [ ] Database met alle tabellen
- [ ] PDO connectie
- [ ] Login/registratie
- [ ] CRUD voor properties
- [ ] Soft delete
- [ ] JOIN (properties + agents)
- [ ] Één-op-één relatie (users + buyer_profiles)
- [ ] AJAX interesse functie
- [ ] Filtering (type, prijs)
- [ ] htmlspecialchars()
- [ ] Session management

### Voor Mondeling
- [ ] Demo functionaliteit
- [ ] Prepared statements uitleggen
- [ ] Password hashing tonen
- [ ] XSS preventie
- [ ] AJAX + JSON uitleggen
- [ ] JOIN query uitleggen
- [ ] Soft delete demonstreren
- [ ] Verschil 1-op-1 vs 1-op-veel relatie uitleggen

---

## Extra Uitdagingen (Nice-to-Have)

1. **Favorieten Systeem**
   - Panden kunnen bookmarken
   - Favorieten overzicht

2. **Hypotheek Calculator**
   - Maandlasten berekenen
   - JavaScript calculator

3. **Virtual Tour**
   - Foto galerij per pand
   - 360° foto's uploaden

4. **Buurtinformatie**
   - Scholen, winkels in de buurt
   - Google Maps integratie

5. **Price History**
   - Prijsveranderingen bijhouden
   - Grafiek van prijsontwikkeling
