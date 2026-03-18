# Project 3: SportBuddy - Sportclub Beheer

## Introductie
SportBuddy is een beheersysteem voor amateursporten. Leden kunnen een account aanmaken met een spelersprofiel, trainingen bekijken van hun team en zich aanmelden voor een training via AJAX. Beheerders beheren teams en trainingen. Bezoekers kunnen filteren op team en dag van de week.

### Verhaal van de opdrachtgever

"Goedendag! Ik ben Fatima, coördinator bij sportclub De Vliegende Ster. We regelen nu alles via WhatsApp-groepen en dat is een chaos. Ik wil een simpele webapplicatie om onze teams en trainingen te beheren.

We hebben meerdere teams — elk team heeft een naam, sport (bijv. Voetbal, Basketbal, Volleybal, Tennis), een trainer en een beschrijving. Een team heeft meerdere trainingen, en een training heeft altijd maar één team.

Voor elke training willen we bijhouden:
- datum
- starttijd
- locatie
- maximaal aantal deelnemers
- beschrijving

Leden kunnen een account aanmaken. Bij registratie vullen ze naast naam en e-mail ook hun positie (bijv. Aanvaller, Verdediger) en niveau (beginner / gevorderd / expert) in als spelersprofiel.

Leden moeten zich kunnen aanmelden voor een training zonder dat de pagina herlaadt. Als een training geannuleerd wordt, wil ik dat soft-deleten zodat de gegevens bewaard blijven. Beheerders moeten trainingen ook kunnen herstellen.

Kan je dit bouwen?"

## Opdracht 1 - Database Ontwerp

Studenten moeten zelf een database ontwerp maken op basis van bovenstaande vereisten.

- Stap 1: ERD
- Stap 2: Relatie Model
- Stap 3: DB Bouwen

**Entiteiten en belangrijke kolommen:**

**users**: id, naam, email, wachtwoord, rol (admin/user), created_at

**player_profiles** (1-op-1 met users): id, user_id, positie, niveau, geboortedatum

**teams** (1-op-veel naar trainingen): id, naam, sport, trainer, beschrijving

**trainingen** (hoort bij team): id, datum, starttijd, locatie, max_deelnemers, beschrijving, team_id (FK), deleted_at, created_at

**aanmeldingen**: id, user_id (FK), training_id (FK), created_at

---

## Opdracht 2 - User Stories

### Database & PDO

#### US-01: PDO Database Connectie
**Als developer wil ik een PDO database connectie opzetten**

**Acceptance Criteria:**
- [ ] PDO connectie in `database.php` met correcte error handling

---

#### US-02: Genormaliseerde Database
**Als developer wil ik een genormaliseerde database**

**Acceptance Criteria:**
- [ ] Primary keys op alle tabellen
- [ ] Foreign key relaties correct opgezet
- [ ] Unique constraint op email
- [ ] 1-op-1 relatie tussen users en player_profiles
- [ ] 1-op-veel relatie tussen teams en trainingen

**Assessment Voorbeeldvraag:**
"Waarom hebben we een aparte player_profiles tabel naast users?"

---

### Security

#### US-03: Veilige Registratie
**Als lid wil ik veilig kunnen registreren**

**Acceptance Criteria:**
- [ ] Wachtwoord wordt gehashed met `password_hash()` voor opslag
- [ ] Email validatie voorkomt ongeldige invoer
- [ ] `htmlspecialchars()` wordt toegepast op alle user input bij weergave
- [ ] Prepared statements voorkomen SQL-injectie
- [ ] Input validatie op alle formuliervelden
- [ ] Bij registratie wordt automatisch een player_profile aangemaakt

**Assessment Voorbeeldvraag:**
"Laat zien waar je password_hash() gebruikt en leg uit waarom."

---

#### US-04: Veilige Login
**Als gebruiker wil ik veilig kunnen inloggen**

**Acceptance Criteria:**
- [ ] Login gebruikt `password_verify()` om wachtwoord te checken
- [ ] Session wordt gestart bij succesvolle login (`$_SESSION['user_id']`, `$_SESSION['role']`)
- [ ] Foutmeldingen zijn generiek ("Ongeldige inloggegevens")
- [ ] Session checks beschermen beheerderspagina's

**Assessment Voorbeeldvraag:**
"Leg uit hoe password_verify() werkt en waarom we dit gebruiken."

---

### CRUD - Trainingen

#### US-05: Training Toevoegen (CREATE)
**Als beheerder wil ik een training kunnen toevoegen**

**Acceptance Criteria:**
- [ ] Formulier op `training_create.php` met velden: datum, starttijd, locatie, max_deelnemers, beschrijving, team (dropdown)
- [ ] POST naar `training_create_process.php` met prepared statement INSERT query
- [ ] Team dropdown toont alle teams uit de `teams` tabel
- [ ] Input validatie controleert of alle verplichte velden zijn ingevuld
- [ ] Alleen beheerders kunnen trainingen toevoegen (role check)

---

#### US-06: Trainingen Overzicht (READ)
**Als lid wil ik een overzicht van alle aankomende trainingen zien**

**Acceptance Criteria:**
- [ ] `trainingen_index.php` toont alle komende trainingen in een lijst
- [ ] JOIN query toont teamnaam bij elke training
- [ ] Alleen niet-verwijderde trainingen worden getoond (`WHERE deleted_at IS NULL`)
- [ ] `htmlspecialchars()` wordt toegepast op alle getoonde data

**Assessment Voorbeeldvraag:**
"Leg uit wat deze JOIN query doet en waarom we dat nodig hebben."

---

#### US-07: Training Wijzigen (UPDATE)
**Als beheerder wil ik een training kunnen wijzigen**

**Acceptance Criteria:**
- [ ] `training_update.php` toont formulier met huidige gegevens (pre-filled)
- [ ] Team dropdown toont het huidige team als geselecteerd
- [ ] POST naar `training_update_process.php` met UPDATE query via prepared statement
- [ ] Validatie controleert of training_id numeriek is (`is_numeric()`)
- [ ] Alleen beheerders kunnen trainingen wijzigen (role check)

---

#### US-08: Training Verwijderen (SOFT DELETE)
**Als beheerder wil ik een training kunnen verwijderen**

**Acceptance Criteria:**
- [ ] `training_delete.php` zet `deleted_at` timestamp in plaats van hard delete
- [ ] Alleen admins kunnen trainingen verwijderen (role check)
- [ ] Confirmation dialog voorkomt onbedoeld verwijderen
- [ ] Na verwijderen redirect naar `trainingen_index.php` met success message

**Assessment Voorbeeldvraag:**
"Wat is het verschil tussen soft delete en hard delete? Laat je code zien."

---

#### US-09: Training Herstellen
**Als beheerder wil ik verwijderde trainingen kunnen herstellen**

**Acceptance Criteria:**
- [ ] `trainingen_deleted.php` toont alle soft-deleted trainingen
- [ ] "Herstel" link zet `deleted_at` terug naar NULL
- [ ] Alleen admins hebben toegang tot deze pagina

---

#### US-10: Per Team een Overzicht van de Trainingen
**Als lid wil ik trainingen kunnen bekijken per team**

**Acceptance Criteria:**
- [ ] Vanuit `teams_index.php` kan je doorklikken naar trainingen van een team
- [ ] Er wordt een GET parameter meegegeven: `?team_id=1`
- [ ] JOIN query toont de teamnaam in de paginatitel
- [ ] Filter op team_id via prepared statement
- [ ] Alleen niet-verwijderde trainingen worden getoond

**Assessment Voorbeeldvraag:**
"Laat zien hoe je de één-op-veel relatie hebt opgezet tussen teams en trainingen."

---

### AJAX Implementation

#### US-11: Aanmelden voor Training zonder Page Reload
**Als ingelogd lid wil ik me kunnen aanmelden voor een training zonder page reload**

**Acceptance Criteria:**
- [ ] "Meld me aan" knop op `training_detail.php` gebruikt AJAX
- [ ] JavaScript `fetch()` stuurt JSON naar `aanmelden_training.php`
- [ ] PHP retourneert JSON response: `{"success": true, "message": "Je bent aangemeld!"}`
- [ ] Knoptekst verandert live naar "Aangemeld ✓" zonder refresh
- [ ] Error handling toont melding als lid al is aangemeld of training vol is

**Assessment Voorbeeldvraag:**
"Laat je AJAX implementatie zien en leg uit hoe JSON data wordt uitgewisseld."

---

### Filtering/Zoeken

#### US-12: Filteren op Team/Sport
**Als bezoeker wil ik trainingen kunnen filteren op team**

**Acceptance Criteria:**
- [ ] Sidebar of dropdown op `trainingen_index.php` toont alle teams
- [ ] Filter links gebruiken GET parameter: `?team_id=3`
- [ ] WHERE clause in prepared statement filtert op geselecteerd team
- [ ] Actieve filter is visueel zichtbaar

---

#### US-13: Filteren op Dag en Zoeken op Locatie
**Als lid wil ik trainingen kunnen filteren op dag en zoeken op locatie**

**Acceptance Criteria:**
- [ ] Dagfilters via GET parameter: `?dag=maandag`
- [ ] Zoekbalk stuurt GET parameter: `?search=sporthal`
- [ ] LIKE query met prepared statement: `WHERE locatie LIKE :search`
- [ ] Zoekterm wordt veilig verwerkt: `%sporthal%`
- [ ] Meerdere filters kunnen gecombineerd worden

**Assessment Voorbeeldvraag:**
"Laat zien hoe je filtering hebt geïmplementeerd met prepared statements."

---

### Code Kwaliteit

#### US-14: Logische Bestandsstructuur
**Als developer wil ik een logische bestandsstructuur**

**Acceptance Criteria:**
- [ ] Database connectie in apart `database.php` bestand
- [ ] Header/footer in aparte includes
- [ ] Process bestanden voor formulier afhandeling
- [ ] Consistente naamgeving

**Bestandsstructuur:**
```
sportbuddy/
├── database.php
├── header.php
├── footer.php
├── index.php
├── login.php
├── login_process.php
├── register.php
├── register_process.php
├── trainingen_index.php
├── training_detail.php
├── training_create.php
├── training_create_process.php
├── training_update.php
├── training_update_process.php
├── training_delete.php
├── trainingen_deleted.php
├── teams_index.php
├── aanmelden_training.php
├── mijn_aanmeldingen.php
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
- [ ] JOIN query voor teams en trainingen
- [ ] AJAX aanmeld-functionaliteit
- [ ] Filtering op team en dag
- [ ] `htmlspecialchars()` overal toegepast
- [ ] Session management voor login

### Voor Mondeling
- [ ] Kan alle CRUD functionaliteiten demonstreren en toelichten
- [ ] Kan prepared statements uitleggen en aanwijzen
- [ ] Kan `password_hash()` en `password_verify()` uitleggen
- [ ] Kan `htmlspecialchars()` uitleggen met voorbeeld
- [ ] Kan AJAX implementatie uitleggen
- [ ] Kan JOIN query uitleggen
- [ ] Kan soft delete uitleggen
- [ ] Kan 1-op-1 en 1-op-veel relaties uitleggen

---

## Extra Uitdagingen (Nice-to-Have)

1. **Afmelden via AJAX**
   - Lid kan zich ook afmelden voor een training zonder page reload
   - Deelnemersteller wordt live bijgewerkt

2. **Aanwezigheidslijst**
   - Beheerder kan na de training aanwezigheid registreren
   - Overzicht van aanwezigheidspercentage per lid

3. **Wachtlijst**
   - Als een training vol is, kunnen leden op de wachtlijst
   - Automatisch bericht als er een plek vrijkomt

4. **Teampagina**
   - Profielpagina per team met foto, beschrijving en ledenoverzicht
   - Statistieken: aantal trainingen gepland, gemiddelde opkomst

5. **Custom Error Pages**
   - Eigen 404-pagina als een training niet bestaat
   - Eigen 403-pagina bij onbevoegde toegang
