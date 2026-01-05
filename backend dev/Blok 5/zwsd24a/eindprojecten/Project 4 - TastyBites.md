# Project 4: TastyBites - Restaurant Menu & Ordering

## Introductie
TastyBites is een restaurant waar klanten online het menu kunnen bekijken en bestellingen kunnen plaatsen voor afhaal of bezorging. Medewerkers kunnen menu-items beheren en bestellingen inzien. Het systeem ondersteunt verschillende categorieën zoals voorgerechten, hoofdgerechten en desserts.

## Database Structuur

Studenten moeten zelf een database ontwerp maken op basis van onderstaande vereisten.

### Entiteiten
- `users` (klanten en medewerkers)
- `customer_preferences` (voedselvoorkeuren) - **één-op-één relatie met users**
- `menu_items` (gerechten)
- `categories` (voorgerecht, hoofdgerecht, dessert) - **één-op-veel relatie met menu_items**
- `orders` (bestellingen)
- `order_items` (koppeltabel: welke items in welke order)

### Relaties
**Één-op-Veel Relatie:** Een categorie heeft meerdere menu items, maar een menu item hoort bij één categorie.

**Één-op-Één Relatie:** Een user heeft één customer_preferences profiel, en customer_preferences hoort bij één user.

### Belangrijke **Kolommen**
- **users:** user_id (PK), email (UNIQUE), password, firstname, lastname, phone, address, role, deleted_at
- **customer_preferences:** preference_id (PK), dietary_restrictions, favorite_items, allergens, deleted_at
- **menu_items:** item_id (PK), item_name, description, price, allergens, is_available, deleted_at
- **categories:** category_id (PK), category_name, display_order, deleted_at
- **orders:** order_id (PK), order_date, total_price, status, delivery_type
- **order_items:** order_item_id (PK), quantity, price_at_order

---

## User Stories

### Database & PDO (20 punten)

#### US-01: PDO Database Connectie
**Als developer wil ik PDO database connectie implementeren**

**Acceptance Criteria:**
- [ ] `database.php` met PDO connectie en error handling
- [ ] Prepared statements overal gebruikt
- [ ] Tabellen: `users`, `customer_preferences`, `menu_items`, `categories`, `orders`, `order_items`

---

#### US-02: Genormaliseerde Database Structuur
**Als developer wil ik een genormaliseerde database structuur**

**Acceptance Criteria:**
- [ ] Primary keys op alle tabellen
- [ ] Foreign key constraints met ON DELETE RESTRICT

**Assessment Vraag:**
"Waarom gebruiken we een aparte order_items tabel? Waarom niet direct in orders?"

---

#### US-02B: Één-op-Één Relatie Implementeren
**Als developer wil ik een één-op-één relatie tussen users en customer_preferences**

**Acceptance Criteria:**
- [ ] De `user_id` kolom in `customer_preferences` heeft een UNIQUE constraint (dit maakt het 1-op-1)
- [ ] Bij registratie wordt automatisch een customer_preferences record aangemaakt
- [ ] JOIN query kan gebruikt worden om user data + preferences te combineren

**Assessment Vraag:**
"Wat is het verschil tussen een één-op-één en één-op-veel relatie? Laat beide zien in je database."

---

### Security (15 punten)

#### US-03: Veilige Registratie
**Als klant wil ik veilig een account kunnen aanmaken**

**Acceptance Criteria:**
- [ ] `password_hash()` voor wachtwoord opslag
- [ ] Email validatie en unieke constraint
- [ ] htmlspecialchars() op alle output
- [ ] Prepared statements tegen SQL-injectie

---

#### US-04: Veilig Inloggen
**Als klant wil ik veilig kunnen inloggen**

**Acceptance Criteria:**
- [ ] `password_verify()` voor login check
- [ ] Session management na succesvolle login
- [ ] Input validatie op login formulier
- [ ] Role-based access voor staff pagina's

**Assessment Vraag:**
"Laat password_hash() en password_verify() zien en leg uit waarom dit veilig is."

---

### CRUD - Menu Items (10 punten)

#### US-05: Menu Item Toevoegen (CREATE)
**Als medewerker wil ik menu items kunnen toevoegen**

**Acceptance Criteria:**
- [ ] Formulier: naam, beschrijving, prijs, categorie (dropdown), allergenen
- [ ] Categorie dropdown uit `categories` tabel
- [ ] INSERT query met prepared statements
- [ ] Prijs validatie (numeriek, positief)

---

#### US-06: Menu Bekijken (READ)
**Als bezoeker wil ik het menu kunnen bekijken**

**Acceptance Criteria:**
- [ ] `menu_index.php` toont alle gerechten
- [ ] JOIN query toont categorie naam bij elk item
- [ ] Alleen actieve items (`WHERE deleted_at IS NULL`)
- [ ] Gegroepeerd per categorie

**Assessment Vraag:**
"Leg uit hoe de JOIN query werkt en waarom we groeperen per categorie."

---

#### US-07: Menu Item Wijzigen (UPDATE)
**Als medewerker wil ik menu items kunnen wijzigen**

**Acceptance Criteria:**
- [ ] `menu_item_update.php` met pre-filled form
- [ ] Categorie dropdown met current value selected
- [ ] UPDATE query met WHERE clause
- [ ] Server-side validatie

---

#### US-08: Menu Item Deactiveren (SOFT DELETE)
**Als medewerker wil ik menu items kunnen deactiveren**

**Acceptance Criteria:**
- [ ] Soft delete met `deleted_at` timestamp
- [ ] Alleen medewerkers (role check)
- [ ] Confirmation dialog
- [ ] Logging van wijziging

**Assessment Vraag:**
"Wat is soft delete en waarom gebruiken we dat?"

---

#### US-09: Gedeactiveerde Items Herstellen
**Als manager wil ik gedeactiveerde items kunnen herstellen**

**Acceptance Criteria:**
- [ ] Overzicht van soft-deleted items
- [ ] Herstel functie zet `deleted_at = NULL`
- [ ] Role = 'manager' of 'admin' required

---

### Één-op-Veel Relatie Feature

#### US-10: Categorie Indeling
**Als medewerker wil ik menu items kunnen indelen in categorieën**

**Acceptance Criteria:**
- [ ] Dropdown toont alle categorieën
- [ ] Foreign key relatie in database
- [ ] JOIN query toont categorie in overzicht

**Assessment Vraag:**
"Laat de één-op-veel relatie tussen categories en menu_items zien."

---

### AJAX Implementation

#### US-11: Toevoegen aan Bestelling zonder Refresh
**Als klant wil ik items aan mijn bestelling kunnen toevoegen zonder refresh**

**Acceptance Criteria:**
- [ ] "Toevoegen" knop gebruikt fetch() AJAX call
- [ ] POST naar `add_to_order.php` met JSON
- [ ] Response: `{success: true, total_items: 5, total_price: 45.50}`
- [ ] Winkelwagen icon toont aantal items live
- [ ] Error handling bij onbeschikbaar item

**Assessment Vraag:**
"Laat je AJAX code zien en leg uit wat JSON doet."

---

### Filtering/Zoeken

#### US-12: Filteren op Categorie
**Als bezoeker wil ik menu items kunnen filteren op categorie**

**Acceptance Criteria:**
- [ ] Filter knoppen: Voorgerecht, Hoofdgerecht, Dessert, Dranken
- [ ] GET parameter: `?category=hoofdgerecht`
- [ ] WHERE clause met prepared statement
- [ ] Active state op geselecteerde filter

---

#### US-13: Filteren op Allergenen
**Als bezoeker wil ik kunnen filteren op allergenen**

**Acceptance Criteria:**
- [ ] Checkboxes voor veelvoorkomende allergenen
- [ ] Multiple filters combineren
- [ ] NOT LIKE queries voor allergeen exclusie

**Assessment Vraag:**
"Laat je filtering implementatie zien met prepared statements."

---

### Code Kwaliteit

#### US-14: Professionele Code Kwaliteit
**Als developer wil ik professionele code kwaliteit**

**Acceptance Criteria:**
- [ ] Consistente naamgeving (menu_item_create.php)
- [ ] DRY: herbruikbare includes
- [ ] Error handling met try-catch
- [ ] Comments bij complexe queries

**Bestandsstructuur:**
```
tastybites/
├── database.php
├── header.php
├── footer.php
├── index.php
├── login.php
├── login_process.php
├── register.php
├── register_process.php
├── menu_index.php
├── menu_item_create.php
├── menu_item_create_process.php
├── menu_item_update.php
├── menu_item_update_process.php
├── menu_item_delete.php
├── add_to_order.php
├── cart.php
├── checkout.php
├── my_orders.php
└── style.css
```

---

## Checklist voor Assessment

### Voor Projectweek
- [ ] Database met alle tabellen
- [ ] PDO connectie
- [ ] Login/registratie
- [ ] CRUD voor menu items
- [ ] Soft delete
- [ ] JOIN (menu_items + categories)
- [ ] Één-op-één relatie (users + customer_preferences)
- [ ] AJAX winkelwagen
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

1. **Order Tracking**
   - Status updates (preparing, ready, delivered)
   - Real-time updates met AJAX

2. **Rating Systeem**
   - Klanten kunnen gerechten beoordelen
   - Gemiddelde rating tonen

3. **Dagmenu**
   - Speciale aanbiedingen per dag
   - Tijdelijke prijsreducties

4. **Bezorgkosten Berekening**
   - Automatische berekening op basis van postcode
   - Gratis bezorging bij minimumbedrag
