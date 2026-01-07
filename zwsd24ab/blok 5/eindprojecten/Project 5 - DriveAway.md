# Project 5: DriveAway - Car Rental Service

## Introductie
DriveAway is een autoverhuur service waar klanten verschillende auto's kunnen huren voor korte of lange termijn. Klanten kunnen beschikbare auto's bekijken, gefilterd op type of merk, en reserveringen maken. Medewerkers beheren de vloot en verhuuradministratie.

### Verhaal van de opdrachtgever

"Hallo! Ik ben Thomas, eigenaar van DriveAway Car Rental. We hebben een groeiende vloot auto's en steeds meer klanten, maar ons huidige boekingssysteem met spreadsheets wordt te ingewikkeld.

We willen graag een digitaal platform waar klanten online auto's kunnen reserveren en wij onze vloot kunnen beheren. Voor elke auto willen we informatie bijhouden zoals:

Voertuigen (vehicles):
- kenteken
- merk (BMW, Mercedes, Toyota, etc.)
- model
- bouwjaar
- voertuigtype (sedan, SUV, van, cabrio)
- dagprijs
- beschikbaarheid

Merken (brands):
- merknaam
- land van herkomst

Klanten (users) moeten een account kunnen aanmaken met:
- naam
- email
- wachtwoord
- telefoonnummer

Voor rijbewijzen (driver_profiles) houden we bij:
- rijbewijs nummer
- vervaldatum rijbewijs
- jaren rijervaring

Voor verhuur (rentals) willen we bijhouden:
- welke auto
- welke klant
- startdatum
- einddatum
- totaalprijs
- status (actief, voltooid, geannuleerd)

Als verhuurmedewerkers willen we de vloot kunnen beheren - nieuwe auto's toevoegen, gegevens wijzigen, en auto's uit bedrijf kunnen halen. Klanten moeten kunnen filteren op merk en voertuigtype, en direct kunnen zien welke auto's beschikbaar zijn.

Het is belangrijk dat we kunnen checken of een auto al verhuurd is voor bepaalde data. En natuurlijk moet alles veilig zijn - we werken met persoonlijke gegevens en rijbewijsgegevens.

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
**Als developer wil ik PDO implementeren voor database connectie**

**Acceptance Criteria:**
- [ ] PDO connectie in `database.php`
- [ ] Error mode ingesteld: `PDO::ERRMODE_EXCEPTION`
- [ ] Prepared statements bij alle queries
- [ ] Tabellen: `users`, `driver_profiles`, `vehicles`, `brands`, `rentals`

---

#### US-02: Genormaliseerde Database
**Als developer wil ik een genormaliseerde database**

**Acceptance Criteria:**
- [ ] Primary keys op alle tabellen
- [ ] Foreign key relaties correct opgezet
- [ ] Unique constraints waar nodig (bijv. email, kenteken)

**Assessment Voorbeeldvraag:**
"Waarom hebben we brands in een aparte tabel?"

---

#### US-02B: Één-op-Één Relatie Implementeren
**Als developer wil ik een één-op-één relatie tussen users en driver_profiles**

**Acceptance Criteria:**
- [ ] `driver_profiles` tabel heeft foreign key `user_id` die verwijst naar `users.user_id`
- [ ] De `user_id` kolom in `driver_profiles` heeft een UNIQUE constraint (dit maakt het 1-op-1)
- [ ] Bij registratie wordt automatisch een driver_profile record aangemaakt
- [ ] JOIN query kan gebruikt worden om user data + rijbewijs data te combineren

**Assessment Voorbeeldvraag:**
"Wat is het verschil tussen een één-op-één en één-op-veel relatie? Laat beide zien in je database."

---

### Security

#### US-03: Veilige Registratie
**Als klant wil ik veilig kunnen registreren**

**Acceptance Criteria:**
- [ ] Registratie met `password_hash()`
- [ ] Rijbewijs nummer validatie
- [ ] htmlspecialchars() op output
- [ ] SQL-injectie preventie met prepared statements

---

#### US-04: Veilige Login
**Als klant wil ik veilig kunnen inloggen**

**Acceptance Criteria:**
- [ ] `password_verify()` controleert credentials
- [ ] Session start bij succesvolle login
- [ ] Protected pages voor medewerkers
- [ ] Session timeout na inactiviteit

**Assessment Voorbeeldvraag:**
"Laat password_verify() zien en leg uit waarom dit veiliger is dan directe vergelijking."

---

### CRUD - Vehicles

#### US-05: Voertuig Toevoegen (CREATE)
**Als medewerker wil ik voertuigen kunnen toevoegen**

**Acceptance Criteria:**
- [ ] Formulier: kenteken, merk (dropdown), model, bouwjaar, dagprijs
- [ ] Brand dropdown uit database
- [ ] INSERT prepared statement
- [ ] Kenteken validatie (uniek, correct formaat)

---

#### US-06: Beschikbare Auto's Zien (READ)
**Als bezoeker wil ik beschikbare auto's zien**

**Acceptance Criteria:**
- [ ] `vehicles_index.php` toont alle auto's
- [ ] JOIN query toont merknaam
- [ ] Filter op beschikbaarheid (niet verhuurd)
- [ ] htmlspecialchars() op alle data

**Assessment Voorbeeldvraag:**
"Leg uit hoe de subquery werkt om te checken of een auto verhuurd is."

---

#### US-07: Voertuiggegevens Wijzigen (UPDATE)
**Als medewerker wil ik voertuiggegevens kunnen wijzigen**

**Acceptance Criteria:**
- [ ] `vehicle_update.php` met pre-filled data
- [ ] Merk dropdown met current value selected
- [ ] UPDATE query met WHERE clause
- [ ] Server-side validatie

---

#### US-08: Voertuig Deactiveren (SOFT DELETE)
**Als medewerker wil ik voertuigen kunnen deactiveren**

**Acceptance Criteria:**
- [ ] Soft delete met `deleted_at`
- [ ] Role check (alleen medewerkers)
- [ ] JavaScript confirmation
- [ ] Success feedback na actie

**Assessment Voorbeeldvraag:**
"Wat is soft delete en waarom check je of een voertuig verhuurd is?"

---

#### US-09: Gedeactiveerde Voertuigen Herstellen
**Als manager wil ik gedeactiveerde voertuigen kunnen herstellen**

**Acceptance Criteria:**
- [ ] Overzicht soft-deleted vehicles
- [ ] Herstel functionaliteit
- [ ] Alleen manager role

---

### Één-op-Veel Relatie Feature

#### US-10: Merk Selecteren
**Als medewerker wil ik bij toevoegen van een voertuig een merk selecteren**

**Acceptance Criteria:**
- [ ] Dropdown met alle merken
- [ ] Foreign key opslag in `vehicles.brand_id`
- [ ] JOIN toont merknaam in overzichten

**Assessment Voorbeeldvraag:**
"Laat de één-op-veel relatie tussen brands en vehicles zien."

---

### AJAX Implementation

#### US-11: Beschikbaarheid Checken
**Als klant wil ik beschikbaarheid kunnen checken zonder page reload**

**Acceptance Criteria:**
- [ ] "Check beschikbaarheid" knop op `vehicle_detail.php`
- [ ] AJAX fetch() naar `check_availability.php`
- [ ] Query checkt of vehicle niet verhuurd is
- [ ] JSON response: `{available: true, next_available: '2024-12-25', total_price: 450.00}`
- [ ] Live feedback in UI

**Assessment Voorbeeldvraag:**
"Laat je AJAX code zien en leg uit hoe de beschikbaarheidscheck werkt."

---

### Filtering/Zoeken

#### US-12: Filteren op Automerk
**Als bezoeker wil ik kunnen filteren op automerk**

**Acceptance Criteria:**
- [ ] Sidebar met merken (BMW, Mercedes, Toyota)
- [ ] GET: `?filter=brand&value=BMW`
- [ ] WHERE clause met prepared statement
- [ ] Actieve filter visueel gemarkeerd

---

#### US-13: Filteren op Voertuigtype
**Als bezoeker wil ik kunnen filteren op voertuigtype**

**Acceptance Criteria:**
- [ ] Filter: Sedan, SUV, Van, Cabrio
- [ ] Multiple filters combineerbaar
- [ ] AND clauses in WHERE statement

**Assessment Voorbeeldvraag:**
"Laat je filtering implementatie zien met prepared statements."

---

### Code Kwaliteit

#### US-14: Clean Code
**Als developer wil ik clean code schrijven**

**Acceptance Criteria:**
- [ ] MVC-achtige structuur
- [ ] Herbruikbare components (header, footer)
- [ ] Consistente error handling
- [ ] Code comments bij complexe logic

**Bestandsstructuur:**
```
driveaway/
├── database.php
├── header.php
├── footer.php
├── index.php
├── login.php
├── login_process.php
├── register.php
├── register_process.php
├── vehicles_index.php
├── vehicle_detail.php
├── vehicle_create.php
├── vehicle_create_process.php
├── vehicle_update.php
├── vehicle_delete.php
├── check_availability.php
├── reserve.php
├── my_rentals.php
└── style.css
```

---

## Checklist voor Assessment

### Voor Projectweek
- [ ] Database met tabellen en foreign keys
- [ ] PDO connectie
- [ ] Login/registratie met hashing
- [ ] CRUD voor vehicles
- [ ] Soft delete
- [ ] JOIN (vehicles + brands)
- [ ] Één-op-één relatie (users + driver_profiles)
- [ ] AJAX beschikbaarheidscheck
- [ ] Filtering
- [ ] htmlspecialchars()
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

1. **Boetesysteem**
   - Automatische boete bij te late inlevering
   - Kilometerstand bijhouden

2. **Verzekering Opties**
   - Verschillende verzekeringsniveaus
   - Prijsberekening met verzekering

3. **Damage Reports**
   - Schade registreren bij inlevering
   - Foto's uploaden

4. **Loyalty Program**
   - Punten verdienen bij verhuur
   - Kortingen voor vaste klanten
