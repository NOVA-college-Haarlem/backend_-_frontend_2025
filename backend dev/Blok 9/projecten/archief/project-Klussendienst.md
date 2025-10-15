# Projectdocument: Klussendienst Platform

## 1. Projectoverzicht

### 1.1 Probleemstelling
Particulieren en kleine bedrijven hebben regelmatig behoefte aan klusjes maar vinden het lastig om betrouwbare vakmensen te vinden. Vakmensen zoeken aan de andere kant naar flexibele opdrachten naast hun reguliere werk. Er ontbreekt een gestructureerd platform waar vraag en aanbod bij elkaar komen met waarborgen voor kwaliteit en betrouwbaarheid.

### 1.2 Projectdoel
Ontwikkeling van een marktplaats-platform waar klussen en vakmensen elkaar vinden. Het platform faciliteert het volledige proces: van opdrachtplaatsing tot afronding, inclusief communicatie, planning en beoordeling.

### 1.3 Doelgroep
- **Primair:** Particulieren en kleine bedrijven die klusjes willen laten uitvoeren
- **Secundair:** ZZP'ers en vakmensen (loodgieters, elektriciens, timmerlieden, schilders) die opdrachten zoeken

### 1.4 Verwacht Resultaat
Een werkend web-platform waar gebruikers opdrachten kunnen plaatsen en aannemen, met elkaar kunnen communiceren, afspraken kunnen maken en elkaar kunnen beoordelen.

---

## 2. Gebruikersrollen en Rechten

### 2.1 Klusaanbieder (Klant)
**Kernfunctionaliteit:**
- Registreren en inloggen met e-mailadres en wachtwoord
- Opdrachten aanmaken, bewerken en verwijderen
- Biedingen van klussers bekijken en accepteren
- Communiceren via chat met geïnteresseerde klussers
- Opdrachtstatus bijwerken (open, toegewezen, in uitvoering, afgerond, geannuleerd)
- Klussers beoordelen na voltooiing

### 2.2 Klusser (Vakman)
**Kernfunctionaliteit:**
- Registreren en inloggen met e-mailadres en wachtwoord
- Profiel aanmaken met specialisatie(s) en ervaring
- Opdrachten zoeken en filteren
- Biedingen doen op opdrachten
- Communiceren via chat met klusaanbieders
- Opdrachten markeren als voltooid
- Klusaanbieders beoordelen na voltooiing

### 2.3 Moderator (Optioneel)
**Kernfunctionaliteit:**
- Inzicht in alle opdrachten en gebruikers
- Ongepaste opdrachten of berichten verwijderen
- Gebruikers blokkeren bij misbruik

---

## 3. Functionele Requirements

### 3.1 Authenticatie & Autorisatie
**Must Have:**
- Registratie met rolkeuze (klusaanbieder/klusser)
- Inloggen met e-mail en wachtwoord
- Wachtwoord vergeten functionaliteit
- Profielpagina met basisgegevens (naam, locatie, telefoonnummer)

**Should Have:**
- E-mailverificatie bij registratie
- Klussers kunnen portfolio/certificaten uploaden

**Could Have:**
- Social login (Google, Facebook)
- Twee-factor authenticatie

### 3.2 Opdrachtenbeheer
**Must Have:**
- Opdracht aanmaken met:
  - Titel (max 100 karakters)
  - Omschrijving (max 1000 karakters)
  - Categorie (dropdown: loodgieterij, elektra, timmerwerk, schilderwerk, algemeen)
  - Budget (range of vast bedrag)
  - Gewenste uitvoerdatum
  - Locatie (postcode + plaatsnaam)
  - Urgentie (normaal/spoed)
- Opdracht bewerken en verwijderen (alleen door eigenaar)
- Opdrachten overzicht met filters:
  - Categorie
  - Locatie (binnen x km)
  - Budgetrange
  - Urgentie
  - Status
- Zoekfunctionaliteit op titel en omschrijving
- Opdrachtstatus management (open → toegewezen → in uitvoering → afgerond/geannuleerd)

**Should Have:**
- Foto's uploaden bij opdracht (max 5 foto's, max 5MB per foto)
- Opgeslagen zoekopdrachten voor klussers
- Notificaties bij statuswijzigingen

**Could Have:**
- Map-weergave van opdrachten
- Favorieten lijst voor klussers

### 3.3 Biedingen & Onderhandeling
**Must Have:**
- Klusser kan bieding doen met:
  - Voorgesteld bedrag
  - Motivatie/pitch (max 500 karakters)
  - Beschikbaarheid
- Klusaanbieder ziet alle biedingen bij opdracht
- Klusaanbieder kan één bieding accepteren
- Bij acceptatie wordt opdracht toegewezen aan klusser

**Should Have:**
- Automatische notificatie bij nieuwe bieding
- Klusser kan bieding intrekken/aanpassen

### 3.4 Communicatie
**Must Have:**
- Chat functionaliteit tussen klusaanbieder en klusser
- Chat is alleen beschikbaar na bieding
- Berichtgeschiedenis opslaan
- Nieuwe berichten indicator

**Should Have:**
- E-mail notificatie bij nieuw bericht (met opt-out)
- Typing indicator

**Could Have:**
- Bestandsdeling in chat (foto's, documenten)
- Real-time chat met WebSockets

### 3.5 Planning & Afspraken
**Must Have:**
- Klusaanbieder en klusser kunnen afspraakdatum vastleggen
- Overzicht van geplande afspraken per gebruiker

**Should Have:**
- Kalenderweergave met alle afspraken
- Herinnering 24 uur voor afspraak
- Afspraak wijzigen/annuleren functionaliteit

**Could Have:**
- iCal export voor externe kalenders
- Google Calendar integratie

### 3.6 Beoordelingen & Reviews
**Must Have:**
- Na afronding kunnen beide partijen elkaar beoordelen:
  - Sterren (1-5)
  - Geschreven review (max 500 karakters)
- Reviews zijn publiek zichtbaar op profielen
- Gemiddelde beoordeling tonen per gebruiker

**Should Have:**
- Badges voor klussers (bijv. "Top Klusser" bij 4.5+ sterren en 20+ klussen)
- Mogelijkheid om te reageren op reviews

**Could Have:**
- Review helpfulness voting (was deze review nuttig?)
- Moderatie voor ongepaste reviews

### 3.7 Dashboard & Overzichten
**Must Have:**
**Voor Klusaanbieders:**
- Overzicht van eigen opdrachten met status
- Aantal ongelezen berichten
- Overzicht van biedingen per opdracht

**Voor Klussers:**
- Overzicht van biedingen (pending, geaccepteerd, afgewezen)
- Toegewezen opdrachten
- Voltooide opdrachten
- Aantal ongelezen berichten

**Should Have:**
- Dashboard met statistieken:
  - Aantal actieve opdrachten
  - Aantal voltooide opdrachten
  - Gemiddelde beoordeling
  - Verdiensten (voor klussers)

---

## 4. Technische Requirements

### 4.1 Platform & Technologie
**Backend:**
- Laravel (PHP 8.2+)
- MySQL database
- RESTful API architectuur

**Frontend:**
- Blade templates OF moderne frontend framework (React/Vue)
- Responsive design (mobile-first)
- Bootstrap of Tailwind CSS

**Authenticatie:**
- Laravel Breeze of Jetstream
- Session-based authentication

### 4.2 Database
**Minimaal vereiste tabellen:**
- users (id, name, email, password, role, location, phone, avatar, created_at, updated_at)
- profiles (id, user_id, bio, specializations, portfolio_url, verified)
- jobs (id, user_id, title, description, category, budget_min, budget_max, location, postcode, urgency, deadline, status, created_at, updated_at)
- bids (id, job_id, user_id, amount, pitch, status, created_at, updated_at)
- messages (id, sender_id, receiver_id, job_id, content, read_at, created_at)
- reviews (id, reviewer_id, reviewee_id, job_id, rating, comment, created_at)
- job_photos (id, job_id, path, created_at)

### 4.3 Beveiliging
**Must Have:**
- CSRF bescherming (Laravel default)
- SQL injection preventie (Eloquent ORM)
- XSS preventie (Blade escaping)
- Password hashing (bcrypt)
- Input validatie op alle formulieren
- Rate limiting op API endpoints
- Middleware voor route protection

**Should Have:**
- File upload validatie (type, size, virus scan)
- Image optimization bij upload
- HTTPS enforcement in productie

### 4.4 Performance
**Requirements:**
- Pagina laadtijd < 3 seconden
- Database queries geoptimaliseerd (eager loading, indexen)
- Paginering voor lange lijsten (25-50 items per pagina)
- Image caching en thumbnails

---

## 5. Non-functionele Requirements

### 5.1 Gebruiksvriendelijkheid
- Intuïtieve navigatie
- Duidelijke call-to-actions
- Foutmeldingen in begrijpelijk Nederlands
- Responsive design voor mobile, tablet en desktop

### 5.2 Beschikbaarheid
- Uptime van minimaal 99%
- Graceful error handling
- Gebruiksvriendelijke foutpagina's (404, 500)

### 5.3 Schaalbaarheid
- Database moet minimaal 10.000 gebruikers aankunnen
- Ondersteuning voor 100+ gelijktijdige gebruikers

### 5.4 Onderhoudbaarheid
- Code volgens PSR-12 standaard
- Gestructureerde mappenindeling (MVC pattern)
- Comments bij complexe logica
- README met installatie-instructies

---

## 6. Acceptatiecriteria

Het project is succesvol opgeleverd wanneer:

**Functioneel:**
- Een klusaanbieder kan een account aanmaken, inloggen, een opdracht plaatsen en een bieding accepteren
- Een klusser kan een account aanmaken, inloggen, opdrachten zoeken, een bieding plaatsen en communiceren via chat
- Beide partijen kunnen elkaar beoordelen na voltooiing
- Alle CRUD operaties werken correct
- Filters en zoekfunctionaliteit werken

**Technisch:**
- Alle code is gecommit naar een Git repository
- Database migraties en seeders zijn aanwezig
- .env.example is aanwezig met alle benodigde variabelen
- README bevat installatie- en configuratie-instructies
- Geen kritieke security vulnerabilities

**Kwaliteit:**
- Applicatie werkt op Chrome, Firefox en Safari (laatste 2 versies)
- Responsive op schermgroottes van 320px tot 1920px
- Validatie werkt op alle formulieren
- Geen PHP errors in development en production mode

---

## 7. Out of Scope (wordt NIET gebouwd)

- Betalingsintegratie (Stripe/Mollie) voor transacties via platform
- Escrow service voor geld in beheer
- Mobiele apps (iOS/Android)
- Multi-language ondersteuning
- Geavanceerde analytics en rapportage
- Export functionaliteit (PDF/Excel)
- API voor third-party integraties
- Video call functionaliteit
- Automatische matching algoritme
- Verzekeringen of garanties
- Facturatie systeem

---

## 8. Deliverables

Bij oplevering wordt verwacht:

**Code:**
- Volledige Laravel applicatie (broncode)
- Git repository met commit history
- Database schema (migrations)
- Seed data voor testing

**Documentatie:**
- README.md met:
  - Installatiehandleiding
  - Configuratie-instructies
  - Gebruikte technologieën en packages
  - Database setup instructies
- API documentatie (indien relevant)
- Korte gebruikershandleiding

**Database:**
- ERD (Entity Relationship Diagram)
- SQL migrations
- Seeders met test data

**Testing:**
- Minimaal 5 test accounts (3 klussers, 2 klusaanbieders)
- 10+ voorbeeld opdrachten in verschillende statussen

---

## 9. Randvoorwaarden & Aannames

**Randvoorwaarden:**
- Development environment: PHP 8.2+, MySQL 8.0+, Composer, Node.js
- Hosting: Shared hosting met Laravel ondersteuning OF VPS
- Domein en SSL certificaat worden apart geregeld
- E-mail versturen vereist mail server configuratie

**Aannames:**
- Gebruikers hebben basiskennis van web applicaties
- Gebruikers zijn verantwoordelijk voor eigen afspraken en betalingen
- Platform is facilitair, geen juridische verantwoordelijkheid
- Nederlandse taal is voldoende (geen meertaligheid)
- Desktop en mobile browser gebruik (geen native apps)

---

## 10. Risico's & Beperkingen

**Geïdentificeerde Risico's:**
- Misbruik van platform (spam, fraude) → Mitigatie: moderatie functionaliteit, review systeem
- Privacy gevoelige data (contactgegevens) → Mitigatie: GDPR compliance, versleutelde opslag
- Performance bij grote hoeveelheid data → Mitigatie: indexering, caching, paginering

**Technische Beperkingen:**
- Real-time chat vereist WebSockets OR polling (kan performance impact hebben)
- File uploads hebben serverlimiet (aanpasbaar in php.ini)
- E-mail versturen afhankelijk van mail server configuratie

---

## 11. Optionele Uitbreidingen (Toekomstige Fase)

Volgende features kunnen in een latere fase worden toegevoegd:
- Betalingsintegratie met escrow service
- Automatische matching op basis van locatie, skills en reviews
- Mobiele applicaties (iOS/Android)
- Live notificaties met WebSockets
- Geavanceerde zoekfilters (beschikbaarheid, prijsrange, certificaten)
- Portfolio galerij voor klussers
- Certificeringen en badges systeem
- Verwijzing programma (referral bonuses)
- Premium accounts voor klussers (hogere zichtbaarheid)
