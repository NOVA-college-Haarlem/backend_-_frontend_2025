# Eindprojecten Blok 5 - Overzicht

## 7 Project Scenarios

Deze map bevat 7 verschillende projectscenario's voor het eindproject van Blok 5. Elk project is volledig uitgewerkt met user stories die alle rubric criteria dekken.

### Projecten

1. **TechStore** - Online Electronics Shop
   - Klanten kunnen producten bekijken en aan winkelwagen toevoegen
   - 1-op-1: users ↔ customer_profiles
   - 1-op-veel: brands → products

2. **FitZone** - Fitness School Management
   - Leden kunnen zich inschrijven voor lessen
   - 1-op-1: users ↔ members EN users ↔ instructors
   - 1-op-veel: instructors → classes

3. **BookHaven** - Library Management System
   - Leden kunnen boeken lenen en reserveren
   - 1-op-1: users ↔ member_cards
   - 1-op-veel: authors → books

4. **TastyBites** - Restaurant Menu & Ordering
   - Klanten kunnen online bestellen
   - 1-op-1: users ↔ customer_preferences
   - 1-op-veel: categories → menu_items

5. **DriveAway** - Car Rental Service
   - Klanten kunnen auto's huren
   - 1-op-1: users ↔ driver_profiles
   - 1-op-veel: brands → vehicles

6. **EventHub** - Event Ticketing Platform
   - Bezoekers kunnen tickets kopen voor evenementen
   - 1-op-1: users ↔ visitor_profiles
   - 1-op-veel: venues → events

7. **HomeFinder** - Real Estate Listings
   - Kopers zoeken woningen, makelaars beheren listings
   - 1-op-1: users ↔ buyer_profiles
   - 1-op-veel: agents → properties

## Belangrijke Informatie

### Database Ontwerp
Studenten moeten **zelf** hun database ontwerp maken. De SQL CREATE TABLE statements zijn bewust weggelaten. Elk project bevat wel:
- Lijst van benodigde entiteiten
- Beschrijving van relaties (1-op-1 en 1-op-veel)
- Belangrijke kolommen per tabel
- Vereisten voor foreign keys en constraints

### Relaties per Project
Elk project heeft:
- **Minimaal 1 één-op-veel relatie** (voor rubric: JOIN query feature)
- **Minimaal 1 één-op-één relatie** (extra uitdaging, laat database begrip zien)

### User Stories Dekken Rubric

Elke project bevat user stories voor:

#### Database & PDO (20 punten)
- US-01: PDO connectie opzetten
- US-02: Genormaliseerde database structuur
- US-02B: Één-op-één relatie implementeren

#### Security (15 punten)
- US-03: Veilige registratie (password_hash, htmlspecialchars, prepared statements)
- US-04: Veilige login (password_verify, session management)

#### CRUD Functionaliteit (10 punten)
- US-05: CREATE - Toevoegen
- US-06: READ - Overzicht met JOIN
- US-07: UPDATE - Wijzigen met pre-filled form
- US-08: SOFT DELETE - Verwijderen met deleted_at
- US-09: RESTORE - Herstellen van soft deleted items

#### Één-op-Veel Relatie Feature
- US-10: Dropdown selectie met JOIN query

#### AJAX Implementation
- US-11: AJAX functionaliteit met JSON response

#### Filtering/Zoeken
- US-12 & US-13: Filtering met GET parameters en prepared statements

#### Code Kwaliteit
- US-14: Logische bestandsstructuur

## Assessment Vragen

Elk project bevat specifieke assessment vragen bij elke user story, bijvoorbeeld:
- "Waarom gebruiken we prepared statements?"
- "Wat doet htmlspecialchars()?"
- "Leg uit hoe password_verify() werkt"
- "Wat is het verschil tussen soft delete en hard delete?"
- "Laat de één-op-veel relatie zien in je database"
- "Leg uit hoe je AJAX implementatie werkt"

## Code Voorbeelden

Elk project bevat praktische PHP code voorbeelden voor:
- PDO connectie
- Prepared statements
- Password hashing
- AJAX met fetch()
- JOIN queries
- Soft delete implementatie
- Filtering met WHERE clauses

## Checklists

Elk project heeft twee checklists:
1. **Voor Projectweek** - Technische implementatie checklist
2. **Voor Mondeling Assessment** - Demonstratie en uitleg checklist

## Extra Uitdagingen

Elk project bevat 4-5 "Nice-to-Have" uitdagingen voor sterke studenten die verder willen gaan.

## Gebruik

1. Student kiest één van de 7 projecten
2. Student maakt zelf database ontwerp op basis van de vereisten
3. Student werkt user stories af (kan als checklist gebruikt worden)
4. Student bereidt zich voor op assessment met de assessment vragen
5. Student demonstreert alle functionaliteit tijdens assessment

## Tips voor Docenten

- Laat studenten eerst een ERD (Entity Relationship Diagram) tekenen
- Check database ontwerp voordat studenten beginnen met coderen
- Gebruik de user stories als afteken-momenten tijdens projectweek
- Gebruik de assessment vragen tijdens het mondeling assessment
- De code voorbeelden zijn startpunten, niet complete oplossingen

## Technische Stack

Alle projecten gebruiken:
- PHP 7.4+
- MySQL/MariaDB
- PDO (geen mysqli!)
- Vanilla JavaScript (geen frameworks)
- HTML5 & CSS3

## Tijdsindicatie

- Dag 1-2: Database design + PDO connectie + basis CRUD
- Dag 3: Security (hashing, htmlspecialchars, validatie)
- Dag 4: AJAX implementatie + filtering
- Dag 5: Code review, testen, assessment voorbereiding

---

**Succes met jullie eindproject!**
