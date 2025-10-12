# Project 1: PetMatch - Pet Adoption Platform

## Introductie
PetMatch is een adoptieplatform waar dierenasielen hun dieren kunnen aanbieden en mensen op zoek naar een huisdier kunnen browsen en adopteren. Bezoekers kunnen dieren bekijken, filteren op soort en leeftijd, en adoptieaanvragen indienen. Asielmedewerkers beheren de dierenprofielen en behandelen adoptieaanvragen.

## Database Structuur

Studenten moeten zelf een database ontwerp maken op basis van onderstaande vereisten.

### Entiteiten
- `users` (adopters en asielmedewerkers)
- `adopter_profiles` (woonsituatie en ervaring) - **één-op-één relatie met users**
- `pets` (honden, katten, andere huisdieren)
- `shelters` (dierenasielen) - **één-op-veel relatie met pets**
- `adoption_requests` (adoptieaanvragen)

### Relaties
**Één-op-Veel Relatie:** Een asiel heeft meerdere dieren, maar een dier verblijft in één asiel.

**Één-op-Één Relatie:** Een user heeft één adopter_profile, en een adopter_profile hoort bij één user.

**Een-op-veel Relatie:** Een adopter kan meerdere adoptieaanvragen indienen, maar een adoptieaanvraag hoort bij één adopter.

### Belangrijke Kolommen
- **users:** user_id (PK), email (UNIQUE), password, firstname, lastname, phone, role, deleted_at
- **adopter_profiles:** profile_id (PK), housing_type, has_garden, has_other_pets, experience_level, deleted_at
- **pets:** pet_id (PK), pet_name, species, breed, age_years, gender, description, adoption_status, deleted_at
- **shelters:** shelter_id (PK), shelter_name, city, address, phone, email, deleted_at
- **adoption_requests:** request_id (PK), request_date, status, motivation, created_at

---

## User Stories

### Database & PDO (20 punten)

#### US-01: PDO Database Connectie
**Als developer wil ik een PDO database connectie opzetten**

**Acceptance Criteria:**
- [ ] PDO connectie in `database.php` met correcte error handling

---

#### US-02: Genormaliseerde Database Structuur
**Als developer wil ik een genormaliseerde database structuur**

**Acceptance Criteria:**
- [ ] Elke tabel heeft een primary key (AUTO_INCREMENT)
- [ ] Alle relaties zijn correct opgezet door middel van foreign keys.

**Assessment Vraag:**
"Waarom is de shelters tabel apart en niet als tekstveld in pets?"

"Wat is het verschil tussen een één-op-één en één-op-veel relatie? Laat beide zien in je database."

---

### Security (15 punten)

#### US-03: Veilige Registratie
**Als adopter wil ik veilig kunnen registreren**

**Acceptance Criteria:**
- [ ] Wachtwoord wordt gehashed met `password_hash()` voor opslag in database
- [ ] Email validatie voorkomt ongeldige invoer
- [ ] htmlspecialchars() wordt toegepast op alle user input bij weergave
- [ ] Prepared statements voorkomen SQL-injectie

**Assessment Vraag:**
"Laat zien waar je password_hash() gebruikt en leg uit waarom."

---

#### US-04: Veilige Login
**Als gebruiker wil ik veilig kunnen inloggen**

**Acceptance Criteria:**
- [ ] Login gebruikt `password_verify()` om wachtwoord te checken
- [ ] Session wordt gestart bij succesvolle login (`$_SESSION['user_id']`, `$_SESSION['role']`)
- [ ] Foutmeldingen zijn generiek ("Ongeldige inloggegevens")
- [ ] Session checks beschermen shelter staff pagina's

**Assessment Vraag:**
"Leg uit hoe password_verify() werkt en waarom we dit gebruiken."

---

### CRUD - Pets (10 punten)

#### US-05: Dier Toevoegen (CREATE)
**Als asielmedewerker wil ik dieren kunnen toevoegen**

**Acceptance Criteria:**
- [ ] Formulier op `pet_create.php` met velden: naam, soort, ras, leeftijd, geslacht, beschrijving, asiel (dropdown)
- [ ] POST naar `pet_create_process.php` met prepared statement INSERT query
- [ ] Shelter dropdown toont alle asielen uit `shelters` tabel
- [ ] Input validatie controleert of alle verplichte velden zijn ingevuld

---

#### US-06: Dieren Overzicht (READ)
**Als bezoeker wil ik een overzicht van alle beschikbare dieren zien**

**Acceptance Criteria:**
- [ ] `pets_index.php` toont alle dieren in een grid of lijst
- [ ] JOIN query toont asielnaam bij elk dier
- [ ] Alleen beschikbare dieren worden getoond (`WHERE adoption_status = 'available' AND deleted_at IS NULL`)
- [ ] htmlspecialchars() wordt toegepast op alle getoonde data

**Assessment Vraag:**
"Leg uit wat deze JOIN query doet en waarom we dat nodig hebben."

---

#### US-07: Dier Wijzigen (UPDATE)
**Als asielmedewerker wil ik diergegevens kunnen wijzigen**

**Acceptance Criteria:**
- [ ] `pet_update.php` toont formulier met huidige diergegevens (pre-filled)
- [ ] Shelter dropdown toont huidige asiel als geselecteerd
- [ ] POST naar `pet_update_process.php` met UPDATE query
- [ ] Validatie controleert of pet_id numeriek is

---

#### US-08: Dier Verwijderen (SOFT DELETE)
**Als asielmedewerker wil ik dieren kunnen verwijderen**

**Acceptance Criteria:**
- [ ] `pet_delete.php` zet `deleted_at` timestamp in plaats van hard delete
- [ ] Alleen shelter staff kunnen dieren verwijderen (role check)
- [ ] Confirmation dialog voorkomt onbedoeld verwijderen
- [ ] Na verwijderen redirect naar `pets_index.php` met success message

**Assessment Vraag:**
"Wat is het verschil tussen soft delete en hard delete? Laat je code zien."

---

#### US-09: Dier Herstellen
**Als beheerder wil ik verwijderde dieren kunnen herstellen**

**Acceptance Criteria:**
- [ ] `pets_deleted.php` toont alle soft-deleted dieren
- [ ] "Herstel" link zet `deleted_at` terug naar NULL
- [ ] Alleen administrators hebben toegang tot deze pagina

---

### Één-op-Veel Relatie Feature

#### US-10: Asiel Selectie bij Dier
**Als asielmedewerker wil ik bij het toevoegen van een dier een asiel kunnen selecteren**

**Acceptance Criteria:**
- [ ] Dropdown/select element in `pet_create.php` haalt shelters op uit database
- [ ] Foreign key `shelter_id` wordt opgeslagen in `pets` tabel
- [ ] JOIN query in `pets_index.php` toont asielnaam bij elk dier

**Assessment Vraag:**
"Laat zien hoe je de één-op-veel relatie hebt opgezet tussen shelters en pets."

---

### AJAX Implementation

#### US-11: Adoptieaanvraag Indienen zonder Page Reload
**Als adopter wil ik een adoptieaanvraag kunnen indienen zonder page reload**

**Acceptance Criteria:**
- [ ] "Ik wil adopteren" knop op `pet_detail.php` gebruikt AJAX
- [ ] JavaScript fetch() stuurt JSON naar `submit_adoption_request.php`
- [ ] PHP retourneert JSON response: `{'success': true, 'message': 'Aanvraag ingediend'}`
- [ ] Aanvraag teller wordt live bijgewerkt (zonder refresh)
- [ ] Error handling toont melding bij mislukte request (bijv. al aangevraagd)

**Assessment Vraag:**
"Laat je AJAX implementatie zien en leg uit hoe JSON data wordt uitgewisseld."

---

### Filtering/Zoeken

#### US-12: Filteren op Diersoort
**Als bezoeker wil ik dieren kunnen filteren op soort**

**Acceptance Criteria:**
- [ ] Sidebar op `pets_index.php` toont lijst met diersoorten (Hond, Kat, Konijn, Vogel, etc.)
- [ ] Filter links gebruiken GET parameters: `?filter=species&value=dog`
- [ ] WHERE clause in prepared statement filtert op geselecteerde soort
- [ ] Meerdere filters kunnen gecombineerd worden

---

#### US-13: Filteren op Leeftijd en Zoeken op Naam
**Als bezoeker wil ik dieren kunnen filteren op leeftijd en zoeken op naam**

**Acceptance Criteria:**
- [ ] Leeftijdsfilters: Jong (0-2 jaar), Volwassen (3-7 jaar), Senior (8+ jaar)
- [ ] Zoekbalk stuurt GET parameter `?search=Max`
- [ ] LIKE query met prepared statement: `WHERE pet_name LIKE :search`
- [ ] Zoekterm wordt veilig verwerkt met wildcards: `%Max%`

**Assessment Vraag:**
"Laat zien hoe je filtering hebt geïmplementeerd met prepared statements."

---

### Code Kwaliteit

#### US-14: Logische Bestandsstructuur
**Als developer wil ik een logische bestandsstructuur**

**Acceptance Criteria:**
- [ ] Database connectie in apart `database.php` bestand
- [ ] Header/footer in aparte includes
- [ ] Process bestanden voor formulier afhandeling
- [ ] Consistente naamgeving (pet_create.php, pet_create_process.php)

**Bestandsstructuur:**
```
petmatch/
├── database.php
├── header.php
├── footer.php
├── index.php
├── login.php
├── login_process.php
├── register.php
├── register_process.php
├── pets_index.php
├── pet_detail.php
├── pet_create.php
├── pet_create_process.php
├── pet_update.php
├── pet_update_process.php
├── pet_delete.php
├── pets_deleted.php
├── submit_adoption_request.php
├── my_adoption_requests.php
├── manage_requests.php
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
- [ ] JOIN query voor shelters en pets
- [ ] AJAX adoptieaanvraag functionaliteit
- [ ] Filtering op diersoort en leeftijd
- [ ] htmlspecialchars() overal toegepast
- [ ] Session management voor login

### Voor Mondeling
- [ ] Kan alle functionaliteit demonstreren
- [ ] Kan prepared statements uitleggen en aanwijzen
- [ ] Kan password_hash() en password_verify() uitleggen
- [ ] Kan htmlspecialchars() uitleggen met voorbeeld
- [ ] Kan AJAX implementatie uitleggen
- [ ] Kan JOIN query uitleggen
- [ ] Kan soft delete uitleggen
- [ ] Kan één-op-één en één-op-veel relaties uitleggen

---

## Extra Uitdagingen (Nice-to-Have)

1. **Adoptie Status Tracking**
   - Status updates (aangevraagd, in behandeling, goedgekeurd, geadopteerd)
   - Email notificaties bij statuswijziging

2. **Foto Upload**
   - Dierenfoto's uploaden bij profiel aanmaken
   - Afbeeldingen tonen in overzicht en detailpagina

3. **Favorietenlijst**
   - Dieren kunnen bookmarken voor later
   - Overzicht van favoriete dieren

4. **Matching Systeem**
   - Match dieren met adopter profiel (woonsituatie, ervaring)
   - "Aanbevolen voor jou" sectie

5. **Asiel Dashboard**
   - Statistieken per asiel
   - Aantal adoptieaanvragen
   - Succesvolle adopties

6. **Success Stories**
   - Gallerij van geadopteerde dieren
   - Reviews van adopters
