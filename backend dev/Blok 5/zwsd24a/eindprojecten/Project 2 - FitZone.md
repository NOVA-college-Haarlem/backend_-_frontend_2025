# Project 2: FitZone - Fitness School Management

## Introductie
FitZone is een fitness school waar leden zich kunnen inschrijven voor verschillende lessen zoals yoga, spinning en bootcamp. Leden kunnen hun profiel beheren, zich inschrijven voor lessen, en hun planning bekijken. Instructeurs kunnen lessen beheren.

### Verhaal van de opdrachtgever

"Hallo! Ik ben Mark, eigenaar van FitZone Fitness. We hebben een groeiend aantal leden en instructeurs, maar ons huidige systeem met papieren inschrijfformulieren werkt niet meer.

We willen graag een digitaal platform waar onze leden zich kunnen inschrijven voor verschillende lessen. Bij elke les willen we informatie kunnen beheren zoals:

Lessen (classes):
- lesnaam
- lestype (yoga, spinning, bootcamp, etc.)
- datum en tijd
- maximaal aantal deelnemers
- instructeur
- beschrijving

Leden (members) moeten een account kunnen aanmaken met:
- naam
- email
- wachtwoord
- telefoonnummer
- lidmaatschapstype (basis, premium)
- startdatum lidmaatschap
- noodcontact
- medische aantekeningen

Voor instructeurs (instructors) houden we bij:
- naam
- specialisatie (yoga expert, spinning coach, etc.)
- bio
- certificeringen

Voor inschrijvingen (enrollments) willen we bijhouden:
- welk lid
- welke les
- inschrijfdatum
- aanwezigheid

Als eigenaar wil ik dat leden zich online kunnen inschrijven voor lessen en hun planning kunnen bekijken. Instructeurs moeten hun eigen lessen kunnen beheren en zien wie er ingeschreven staat.

Het zou fijn zijn als leden kunnen filteren op type les of op instructeur. En natuurlijk moet alles veilig zijn - we werken met persoonlijke gegevens en medische informatie.

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
**Als developer wil ik een PDO database connectie opzetten**

**Acceptance Criteria:**
- [ ] PDO connectie in `database.php` met error handling

---

#### US-02: Genormaliseerde Database
**Als developer wil ik een genormaliseerde database**

**Acceptance Criteria:**
- [ ] Primary keys op alle tabellen
- [ ] Foreign key relaties correct opgezet
- [ ] Unique constraints waar nodig (bijv. email, unieke inschrijving)

**Assessment Voorbeeldvraag:**
"Waarom hebben we een aparte instructors tabel naast users?"

---

### Security

#### US-03: Veilige Registratie
**Als lid wil ik veilig kunnen registreren**

**Acceptance Criteria:**
- [ ] `password_hash()` bij registratie
- [ ] Email validatie voorkomt ongeldige invoer
- [ ] htmlspecialchars() wordt toegepast op alle user input bij weergave
- [ ] Prepared statements voorkomen SQL-injectie
- [ ] Input validatie op alle formuliervelden

---

**Assessment Voorbeeldvraag:**
"Laat zien waar je password_hash() gebruikt en leg uit waarom."

#### US-04: Veilige Login
**Als lid wil ik veilig kunnen inloggen**

**Acceptance Criteria:**
- [ ] `password_verify()` controleert wachtwoord
- [ ] Session management (`$_SESSION['user_id']`, `$_SESSION['role']`)
- [ ] Beschermde pagina's voor instructeurs (role = 'instructor')
- [ ] Session checks op admin/instructor pagina's

**Assessment Voorbeeldvraag:**
"Leg uit waar je password_verify() gebruikt en waarom dit veilig is."

---

### CRUD - Classes

#### US-05: Les Aanmaken (CREATE)
**Als instructeur wil ik nieuwe lessen kunnen aanmaken**

**Acceptance Criteria:**
- [ ] Formulier op `class_create.php`: naam, beschrijving, datum/tijd, max deelnemers
- [ ] Instructeur dropdown selecteert gekoppelde instructeur
- [ ] INSERT prepared statement in `class_create_process.php`
- [ ] Validatie op datum (mag niet in verleden liggen)

---

#### US-06: Lessen Overzicht (READ)
**Als lid wil ik alle beschikbare lessen zien**

**Acceptance Criteria:**
- [ ] `classes_index.php` toont alle lessen in tabel
- [ ] JOIN query toont instructeur naam bij elke les
- [ ] Filter toont alleen toekomstige lessen (`WHERE class_date >= NOW()`)
- [ ] htmlspecialchars() op alle output

**Assessment Voorbeeldvraag:**
"Leg uit wat de JOIN query doet en waarom we COUNT() gebruiken."

---

#### US-07: Les Wijzigen (UPDATE)
**Als instructeur wil ik lesgegevens kunnen wijzigen**

**Acceptance Criteria:**
- [ ] `class_update.php` heeft pre-filled formulier met huidige data
- [ ] Instructeur dropdown toont huidige instructeur als selected
- [ ] UPDATE query met prepared statements
- [ ] Alleen instructeur van de les of admin mag wijzigen

---

#### US-08: Les Annuleren (SOFT DELETE)
**Als instructeur wil ik lessen kunnen annuleren**

**Acceptance Criteria:**
- [ ] `class_delete.php` zet `deleted_at` timestamp
- [ ] Confirmation met JavaScript confirm()
- [ ] Role check: alleen instructeur/admin
- [ ] Redirect met success message

**Assessment Voorbeeldvraag:**
"Wat is het verschil tussen soft delete en hard delete in jouw project?"

---

#### US-09: Geannuleerde Lessen Herstellen
**Als beheerder wil ik geannuleerde lessen kunnen herstellen**

**Acceptance Criteria:**
- [ ] `classes_deleted.php` toont soft-deleted lessen
- [ ] Herstel functie zet `deleted_at` naar NULL
- [ ] Alleen admins hebben toegang

---

#### US-10: Per les een overzicht van de deelnemers
**Als instructeur wil ik een overzicht van de deelnemers van een les kunnen zien**

**Acceptance Criteria:**
- [ ] Vanuit classes_index.php kan je naar het overzicht van de deelnemers van een bepaalde les
- [ ] Er wordt een GET parameter meegegeven die de class_id bevat
- [ ] Er wordt een JOIN query gemaakt om de deelnemers van de les te krijgen
- [ ] htmlspecialchars() wordt toegepast op alle getoonde data

**Assessment Voorbeeldvraag:**
"Laat de één-op-veel relatie tussen members en classes zien in je database en code."

---

### AJAX Implementation

#### US-11: Inschrijven zonder Page Reload
**Als lid wil ik me kunnen inschrijven voor een les zonder page reload**

**Acceptance Criteria:**
- [ ] "Inschrijven" knop op `class_detail.php` gebruikt fetch() AJAX
- [ ] POST naar `enroll.php` met JSON: `{class_id: 5}`
- [ ] PHP retourneert JSON: `{success: true, enrolled_count: 12}`
- [ ] Live update van aantal ingeschreven deelnemers
- [ ] Error handling voor volle lessen

**Assessment Voorbeeldvraag:**
"Laat je AJAX implementatie zien en leg uit hoe de data zonder refresh wordt bijgewerkt."

---

### Filtering/Zoeken

#### US-12: Filteren op Type Les
**Als lid wil ik lessen kunnen filteren op type**

**Acceptance Criteria:**
- [ ] Filter sidebar: Yoga, Spinning, Bootcamp, etc.
- [ ] GET parameters: `?filter=class_type&value=yoga`
- [ ] WHERE clause met prepared statements
- [ ] Actieve filter krijgt visuele indicator

---

#### US-13: Filteren op Instructeur
**Als lid wil ik lessen kunnen filteren op instructeur**

**Acceptance Criteria:**
- [ ] Tweede filter: `?filter=instructor&value=John`
- [ ] Combinatie van meerdere filters mogelijk
- [ ] JOIN query filtert op instructeur naam

**Assessment Voorbeeldvraag:**
"Laat zien hoe je filtering hebt geïmplementeerd met prepared statements."

---

### Code Kwaliteit

#### US-14: DRY Principe
**Als developer wil ik DRY principe toepassen**

**Acceptance Criteria:**
- [ ] Herbruikbare header.php en footer.php
- [ ] Database connectie in één bestand
- [ ] Consistente error handling met redirects
- [ ] Logische mappenstructuur

**Bestandsstructuur:**
```
fitzone/
├── database.php
├── header.php
├── footer.php
├── index.php
├── login.php
├── login_process.php
├── register.php
├── register_process.php
├── dashboard.php
├── classes_index.php
├── class_detail.php
├── class_create.php
├── class_create_process.php
├── class_update.php
├── class_update_process.php
├── class_delete.php
├── classes_deleted.php
├── enroll.php
├── my_classes.php
└── style.css
```

---

## Checklist voor Assessment

### Voor Projectweek
- [ ] Database aangemaakt met alle tabellen en foreign keys
- [ ] PDO connectie werkend
- [ ] Login/registratie met password hashing
- [ ] CRUD operaties voor classes
- [ ] Soft delete voor classes
- [ ] JOIN query toont instructeur bij class
- [ ] AJAX inschrijf functionaliteit
- [ ] Filtering op class type en instructeur
- [ ] htmlspecialchars() overal
- [ ] Session management en role checks

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

1. **Wachtlijst Functionaliteit**
   - Automatisch op wachtlijst bij volle les
   - Notificatie bij vrijgekomen plek

2. **Instructeur Dashboard**
   - Overzicht eigen lessen
   - Aantal inschrijvingen per les
   - Statistieken

3. **Les Historie**
   - Overzicht gevolgde lessen
   - Aanwezigheid bijhouden

4. **Rating Systeem**
   - Leden kunnen lessen beoordelen
   - Gemiddelde rating per instructeur

5. **Email Notificaties**
   - Bevestiging na inschrijving
   - Herinnering 24 uur voor les
