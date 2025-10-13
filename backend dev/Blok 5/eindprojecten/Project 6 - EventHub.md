# Project 6: EventHub - Event Ticketing Platform

## Introductie
EventHub is een ticketing platform waar organisatoren evenementen kunnen aanmaken zoals concerten, sportevents en festivals. Bezoekers kunnen events browsen, filteren en tickets kopen. Het systeem houdt bij hoeveel tickets er beschikbaar zijn per evenement.

## Database Structuur

Studenten moeten zelf een database ontwerp maken op basis van onderstaande vereisten.

### Entiteiten
- `users` (bezoekers en organisatoren)
- `visitor_profiles` (bezoeker voorkeuren) - **één-op-één relatie met users**
- `events` (concerten, sportevenementen, etc.)
- `venues` (locaties/zalen) - **één-op-veel relatie met events**
- `tickets` (verkochte tickets)

### Relaties
**Één-op-Veel Relatie:** Een venue host meerdere events, maar een event vindt plaats op één venue.

**Één-op-Één Relatie:** Een user heeft één visitor_profile, en een visitor_profile hoort bij één user.

### Belangrijke Kolommen
- **users:** user_id (PK), email (UNIQUE), password, firstname, lastname, phone, role, deleted_at
- **visitor_profiles:** profile_id (PK), preferred_categories, payment_method, newsletter_subscription, deleted_at
- **events:** event_id (PK), event_name, description, event_date, event_time, venue_id (FK), category, max_tickets, ticket_price, organizer_id (FK), deleted_at
- **venues:** venue_id (PK), venue_name, address, city, capacity, deleted_at
- **tickets:** ticket_id (PK), purchase_date, quantity, total_price, ticket_code (UNIQUE)

---

## User Stories

### Database & PDO (20 punten)

#### US-01: PDO Database Connectie
**Als developer wil ik PDO gebruiken**

**Acceptance Criteria:**
- [ ] PDO connectie met error handling
- [ ] Prepared statements overal
- [ ] Tabellen: `users`, `visitor_profiles`, `events`, `venues`, `tickets`

---

#### US-02: Genormaliseerd Database Design
**Als developer wil ik een genormaliseerd database design**

**Acceptance Criteria:**
- [ ] Primary keys op alle tabellen
- [ ] Foreign key constraints
- [ ] Unique constraints waar relevant (ticket_code, email)

**Assessment Vraag:**
"Waarom is venues een aparte tabel en niet een tekstveld in events?"

---

#### US-02B: Één-op-Één Relatie Implementeren
**Als developer wil ik een één-op-één relatie tussen users en visitor_profiles**

**Acceptance Criteria:**
- [ ] `visitor_profiles` tabel heeft foreign key `user_id` die verwijst naar `users.user_id`
- [ ] De `user_id` kolom in `visitor_profiles` heeft een UNIQUE constraint (dit maakt het 1-op-1)
- [ ] Bij registratie wordt automatisch een visitor_profile record aangemaakt
- [ ] JOIN query kan gebruikt worden om user data + voorkeuren te combineren

**Assessment Vraag:**
"Wat is het verschil tussen een één-op-één en één-op-veel relatie? Laat beide zien in je database."

---

### Security (15 punten)

#### US-03: Account Aanmaken
**Als bezoeker wil ik een account kunnen maken**

**Acceptance Criteria:**
- [ ] `password_hash()` bij registratie
- [ ] Email validatie
- [ ] htmlspecialchars() op alle input
- [ ] Prepared statements

---

#### US-04: Veilig Inloggen
**Als bezoeker wil ik veilig kunnen inloggen**

**Acceptance Criteria:**
- [ ] `password_verify()` check
- [ ] Session management
- [ ] Role-based access (organizer vs visitor)
- [ ] Input validatie

**Assessment Vraag:**
"Laat password_verify() zien en leg uit waarom we dat gebruiken."

---

### CRUD - Events (10 punten)

#### US-05: Event Aanmaken (CREATE)
**Als organisator wil ik events kunnen aanmaken**

**Acceptance Criteria:**
- [ ] Formulier: naam, datum, tijd, venue (dropdown), max tickets, prijs
- [ ] Venue dropdown uit database
- [ ] INSERT prepared statement
- [ ] Datum validatie (niet in verleden)

---

#### US-06: Events Bekijken (READ)
**Als bezoeker wil ik alle events kunnen zien**

**Acceptance Criteria:**
- [ ] `events_index.php` toont events
- [ ] JOIN toont venue naam en locatie
- [ ] Alleen toekomstige events
- [ ] Beschikbare tickets weergeven

**Assessment Vraag:**
"Leg uit hoe de subquery werkt om verkochte tickets te tellen."

---

#### US-07: Event Wijzigen (UPDATE)
**Als organisator wil ik event details kunnen wijzigen**

**Acceptance Criteria:**
- [ ] Pre-filled update formulier
- [ ] Venue dropdown met current selection
- [ ] UPDATE query
- [ ] Alleen eigen events wijzigbaar

---

#### US-08: Event Annuleren (SOFT DELETE)
**Als organisator wil ik events kunnen annuleren**

**Acceptance Criteria:**
- [ ] Soft delete met `deleted_at`
- [ ] Confirmation dialog
- [ ] Role check
- [ ] Email notificatie aan ticketkopers (optioneel)

**Assessment Vraag:**
"Wat gebeurt er met verkochte tickets als een event wordt geannuleerd?"

---

#### US-09: Geannuleerde Events Herstellen
**Als admin wil ik geannuleerde events kunnen herstellen**

**Acceptance Criteria:**
- [ ] Overzicht cancelled events
- [ ] Restore functionaliteit
- [ ] Admin-only access

---

### Één-op-Veel Relatie Feature

#### US-10: Venue Selecteren
**Als organisator wil ik een venue kunnen selecteren voor mijn event**

**Acceptance Criteria:**
- [ ] Dropdown met venues
- [ ] Foreign key opslag
- [ ] JOIN toont venue info bij event

**Assessment Vraag:**
"Laat de één-op-veel relatie tussen venues en events zien."

---

### AJAX Implementation

#### US-11: Ticket Kopen zonder Page Reload
**Als bezoeker wil ik tickets kunnen kopen zonder page reload**

**Acceptance Criteria:**
- [ ] "Koop ticket" knop met AJAX
- [ ] fetch() POST naar `buy_ticket.php`
- [ ] Check beschikbaarheid in PHP
- [ ] JSON response: `{success: true, tickets_left: 49, ticket_code: 'ABC123'}`
- [ ] Live update van beschikbare tickets
- [ ] Error handling voor uitverkocht

**Assessment Vraag:**
"Laat je AJAX implementatie zien en leg uit hoe JSON werkt."

---

### Filtering/Zoeken

#### US-12: Filteren op Categorie
**Als bezoeker wil ik events kunnen filteren op categorie**

**Acceptance Criteria:**
- [ ] Filters: Concert, Sport, Festival, Theater
- [ ] GET: `?category=concert`
- [ ] WHERE clause prepared statement
- [ ] Visual feedback actieve filter

---

#### US-13: Zoeken op Naam of Artiest
**Als bezoeker wil ik events kunnen zoeken op naam**

**Acceptance Criteria:**
- [ ] Zoekbalk met GET
- [ ] LIKE query met wildcards
- [ ] Prepared statements met :search placeholder

**Assessment Vraag:**
"Laat je zoekfunctie zien met prepared statements."

---

### Code Kwaliteit

#### US-14: Maintainable Code
**Als developer wil ik maintainable code**

**Acceptance Criteria:**
- [ ] Logische file structuur
- [ ] DRY principe
- [ ] Error handling
- [ ] Code comments

**Bestandsstructuur:**
```
eventhub/
├── database.php
├── header.php
├── footer.php
├── index.php
├── login.php
├── login_process.php
├── register.php
├── register_process.php
├── events_index.php
├── event_detail.php
├── event_create.php
├── event_create_process.php
├── event_update.php
├── event_delete.php
├── buy_ticket.php
├── my_tickets.php
├── my_events.php
└── style.css
```

---

## Checklist voor Assessment

### Voor Projectweek
- [ ] Database met alle tabellen
- [ ] PDO connectie
- [ ] Login/registratie
- [ ] CRUD voor events
- [ ] Soft delete
- [ ] JOIN (events + venues)
- [ ] Één-op-één relatie (users + visitor_profiles)
- [ ] AJAX ticket kopen
- [ ] Filtering
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

1. **QR Code Tickets**
   - Genereer QR code voor elk ticket
   - Scan functie voor toegangscontrole

2. **Waitlist Functionaliteit**
   - Wachtlijst bij uitverkochte events
   - Notificatie bij beschikbaarheid

3. **Rating & Reviews**
   - Bezoekers kunnen events beoordelen
   - Gemiddelde rating tonen

4. **Early Bird Prijzen**
   - Tijdelijke kortingen
   - Dynamische pricing
