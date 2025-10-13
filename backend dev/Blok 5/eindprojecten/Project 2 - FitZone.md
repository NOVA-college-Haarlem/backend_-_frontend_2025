# Project 2: FitZone - Fitness School Management

## Introductie
FitZone is een fitness school waar leden zich kunnen inschrijven voor verschillende lessen zoals yoga, spinning en bootcamp. Leden kunnen hun profiel beheren, zich inschrijven voor lessen, en hun planning bekijken. Instructeurs kunnen lessen beheren.

## Database Structuur

Studenten moeten zelf een database ontwerp maken op basis van onderstaande vereisten.

### Entiteiten
- `users` (leden en instructeurs)
- `members` (lid-specifieke info) - **één-op-één relatie met users**
- `instructors` (instructeur-specifieke info) - **één-op-één relatie met users**
- `classes` (yoga, spinning, bootcamp, etc.)
- `enrollments` (inschrijvingen van leden voor lessen)

### Relaties
**Één-op-Veel Relatie:** Een instructeur geeft meerdere lessen, maar een les heeft één instructeur.

**Een-op-veel Relatie:** Een lid kan meerdere inschrijvingen doen, maar een inschrijving hoort bij één lid.

**Één-op-Één Relaties:**
- Een user kan één member profiel hebben (voor gewone leden)
- Een user kan één instructor profiel hebben (voor instructeurs)

### Belangrijke Kolommen
- **users:** user_id (PK), email (UNIQUE), password, firstname, lastname, role, deleted_at
- **members:** member_id (PK), membership_type, start_date, emergency_contact, medical_notes, deleted_at
- **instructors:** instructor_id (PK), specialization, bio, certification, deleted_at
- **classes:** class_id (PK), class_name, class_type, class_date, class_time, max_participants, deleted_at
- **enrollments:** enrollment_id (PK), enrolled_at

---

## User Stories

### Database & PDO (20 punten)

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

**Assessment Vraag:**
"Waarom hebben we een aparte instructors tabel naast users?"

---

### Security (15 punten)

#### US-03: Veilige Registratie
**Als lid wil ik veilig kunnen registreren**

**Acceptance Criteria:**
- [ ] `password_hash()` bij registratie
- [ ] Email validatie voorkomt ongeldige invoer
- [ ] htmlspecialchars() wordt toegepast op alle user input bij weergave
- [ ] Prepared statements voorkomen SQL-injectie
- [ ] Input validatie op alle formuliervelden

---

**Assessment Vraag:**
"Laat zien waar je password_hash() gebruikt en leg uit waarom."

#### US-04: Veilige Login
**Als lid wil ik veilig kunnen inloggen**

**Acceptance Criteria:**
- [ ] `password_verify()` controleert wachtwoord
- [ ] Session management (`$_SESSION['user_id']`, `$_SESSION['role']`)
- [ ] Beschermde pagina's voor instructeurs (role = 'instructor')
- [ ] Session checks op admin/instructor pagina's

**Assessment Vraag:**
"Leg uit waar je password_verify() gebruikt en waarom dit veilig is."

---

### CRUD - Classes (10 punten)

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

**Assessment Vraag:**
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

**Assessment Vraag:**
"Wat is het verschil tussen soft delete en hard delete in jouw project?"

---

#### US-09: Geannuleerde Lessen Herstellen
**Als beheerder wil ik geannuleerde lessen kunnen herstellen**

**Acceptance Criteria:**
- [ ] `classes_deleted.php` toont soft-deleted lessen
- [ ] Herstel functie zet `deleted_at` naar NULL
- [ ] Alleen admins hebben toegang

---

### Één-op-Veel Relatie Feature

#### US-10: Per les een overzicht van de deelnemers
**Als instructeur wil ik een overzicht van de deelnemers van een les kunnen zien**

**Acceptance Criteria:**
- [ ] Vanuit classes_index.php kan je naar het overzicht van de deelnemers van een bepaalde les
- [ ] Er wordt een GET parameter meegegeven die de class_id bevat
- [ ] Er wordt een JOIN query gemaakt om de deelnemers van de les te krijgen
- [ ] htmlspecialchars() wordt toegepast op alle getoonde data

**Assessment Vraag:**
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

**Assessment Vraag:**
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

**Assessment Vraag:**
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
- [ ] Demonstratie van alle functionaliteit
- [ ] Prepared statements kunnen uitleggen
- [ ] Password hashing kunnen uitleggen
- [ ] XSS preventie met htmlspecialchars() kunnen tonen
- [ ] AJAX + JSON kunnen uitleggen
- [ ] JOIN query kunnen uitleggen
- [ ] Soft delete kunnen demonstreren

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
