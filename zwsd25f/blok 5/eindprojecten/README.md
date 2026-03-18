# Eindprojecten Blok 5 - Overzicht (zwsd25f)

## 4 Project Scenarios

Deze map bevat 4 verschillende projectscenario's voor het eindproject van Blok 5. Elk project is volledig uitgewerkt met user stories die alle rubric criteria dekken.

### Projecten

1. **SnapMarket** - Tweedehands Marktplaats
   - Gebruikers kopen en verkopen tweedehands spullen
   - 1-op-1: users ↔ seller_profiles
   - 1-op-veel: categories → items

2. **GameVault** - Game Collectie Tracker
   - Gamers beheren hun spelcollectie en wishlist
   - 1-op-1: users ↔ gamer_profiles
   - 1-op-veel: platforms → games

3. **SportBuddy** - Sportclub Beheer
   - Leden melden zich aan voor trainingen van hun team
   - 1-op-1: users ↔ player_profiles
   - 1-op-veel: teams → trainingen

4. **RecipeBox** - Recepten Platform
   - Thuiskoks delen recepten en bewaren favorieten
   - 1-op-1: users ↔ cook_profiles
   - 1-op-veel: categories → recipes

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
- **Minimaal 1 één-op-één relatie** (laat database begrip zien)

### User Stories Dekken Rubric

#### Database & PDO
- US-01: PDO connectie opzetten
- US-02: Genormaliseerde database structuur

#### Security
- US-03: Veilige registratie (password_hash, htmlspecialchars, prepared statements)
- US-04: Veilige login (password_verify, session management)

#### CRUD Functionaliteit
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

## Tijdsindicatie (3,5 dag — 08:30 tot 14:00)

- **Dag 1**: Database design + PDO connectie + basis CRUD (CREATE & READ)
- **Dag 2**: Security + UPDATE + SOFT DELETE & RESTORE
- **Dag 3**: AJAX implementatie + Filtering
- **Dag 3,5 (ochtend)**: Custom error pages, code review, testen, assessment voorbereiding

## Technische Stack

Alle projecten gebruiken:
- PHP 7.4+
- MySQL/MariaDB
- PDO (geen mysqli!)
- Vanilla JavaScript (geen frameworks)
- HTML5 & CSS3

---

**Succes met jullie eindproject!**
