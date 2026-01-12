# Project Planning - Dagelijkse Reviews
## ZWSD24AB - Blok 6 Eindprojecten

## Overzicht

Dit document bevat de dagelijkse review planning voor de eindprojecten in Blok 6. Elke dag heeft vooraf bepaalde user stories/features die de studenten moeten bouwen en waarop gereviewd wordt.

**BELANGRIJK:** De originele projectdocumenten worden NIET aangepast. Studenten werken volgens hun projectdocument, maar deze dagelijkse reviews zorgen voor structuur en monitoring.

## Verdeling Projecten

- **Project 1 - Bibliotheek**: Niek, Emilio, Adam, Cemil
- **Project 2 - ECommerceShop**: Hidde, Kaio, Jordan
- **Project 3 - EventManagement**: Justin, Jesse, Koen, Ayaz
- **Project 4 - HotelManagement**: Thijs, Jay, Teoman
- **Project 6 - UniversityManagement**: Lorenzo, Demian, Azaan
- **Project 7 - ZiekenhuisManagement**: Indy, Silvio, Symon, Drake

---

## Dag 1: Project Setup & Database Ontwerp

### Doel
- Laravel project opzetten met Laravel Breeze
- Database ontwerp compleet maken
- Documentatie van database schema

### Review Checklist
- [ ] Laravel project aangemaakt met Laravel Breeze
- [ ] Project draait op `.test` domain
- [ ] Database connectie geconfigureerd (MySQL of SQLite)
- [ ] Database schema ontworpen en gedocumenteerd
- [ ] Alle tabellen geïdentificeerd (minimaal 4 hoofdtabellen + users)
- [ ] Alle relaties geïdentificeerd en gedocumenteerd
- [ ] **Veel-op-veel relatie(s) geïdentificeerd**
- [ ] Pivot table(s) voor veel-op-veel relaties ontworpen

### Te Bespreken
- Database ontwerp laten zien
- Uitleggen van relaties (one-to-many, many-to-many)
- Verificeren dat veel-op-veel relatie correct is ontworpen

---

## Dag 2: Migrations & Models

### Doel
- Alle migrations aangemaakt
- Alle models aangemaakt met relaties

### Review Checklist
- [ ] Alle migrations aangemaakt (inclusief pivot tables)
- [ ] Alle foreign keys correct gedefinieerd
- [ ] Alle models aangemaakt (enkelvoud, Engels)
- [ ] `$fillable` array geconfigureerd in models
- [ ] **`belongsToMany` relaties gedefinieerd voor veel-op-veel**
- [ ] `belongsTo` relaties gedefinieerd
- [ ] `hasMany` relaties gedefinieerd
- [ ] Migrations succesvol uitgevoerd
- [ ] Tabellen correct aangemaakt in database

### Te Bespreken
- Migrations code review
- Models code review
- Testen van relaties in Tinker (optioneel)

---

## Dag 3: Seeders & Basis Views

### Doel
- Seeders aanmaken met testdata
- Basis views opzetten (layout, index pages)

### Review Checklist
- [ ] Seeders aangemaakt voor alle hoofdmodellen
- [ ] Seeders bevatten minimaal 10 records per model (waar van toepassing)
- [ ] **Seeders bevatten testdata voor veel-op-veel relaties (attach/sync)**
- [ ] DatabaseSeeder configured
- [ ] Database succesvol gesedd
- [ ] Basis layout component aangemaakt/geconfigureerd
- [ ] Index view(s) aangemaakt met basis data weergave
- [ ] Routes aangemaakt met route namen
- [ ] Data wordt correct getoond in views

### Te Bespreken
- Seeder code review
- View structuur
- Routes configuratie
- Data weergave testen

---

## Dag 4: CRUD - Create & Read

### Doel
- Volledige Create functionaliteit
- Volledige Read functionaliteit (index + detail)

### Review Checklist
- [ ] `create()` method in controller
- [ ] `store()` method in controller met validatie
- [ ] Create formulier view
- [ ] Validatie rules geïmplementeerd
- [ ] Validatiefouten worden getoond in view
- [ ] Flash messages voor succesvolle acties
- [ ] `index()` method in controller
- [ ] `show()` method in controller (detailpagina)
- [ ] Index view met overzicht van items
- [ ] Detail view (optioneel maar aanbevolen)
- [ ] Routes correct geconfigureerd
- [ ] **Data kan worden aangemaakt en opgeslagen**
- [ ] Data wordt correct weergegeven

### Project-specifieke User Stories - Dag 4

#### Bibliotheek
- Bibliothecaris: Boeken toevoegen met titel, auteur, ISBN, beschrijving
- Bibliothecaris: Boeken kunnen zoeken op titel of auteur
- Lid: Zoeken naar boeken op titel

#### ECommerceShop
- Shop Owner: Producten toevoegen met naam, prijs, beschrijving, voorraad
- Klant: Producten zoeken op naam
- Klant: Product details bekijken

#### EventManagement
- Event Manager: Events aanmaken met datum, tijd, locatie, beschrijving
- Bezoeker: Upcoming events bekijken
- Bezoeker: Event details bekijken

#### HotelManagement
- Hotel Manager: Kamers toevoegen
- Gast: Beschikbare kamers bekijken

#### UniversityManagement
- Faculteits Manager: Cursussen aanmaken
- Student: Beschikbare cursussen bekijken

#### ZiekenhuisManagement
- Receptionist: Patiënten registreren
- Patiënt: Afspraken bekijken

### Te Bespreken
- CRUD code review
- Validatie implementatie
- Formulier structuur
- View kwaliteit

---

## Dag 5: CRUD - Update, Delete & Veel-op-Veel Relaties

### Doel
- Update en Delete functionaliteit
- **Veel-op-veel relaties implementeren in formulieren**

### Review Checklist
- [ ] `edit()` method in controller
- [ ] `update()` method in controller met validatie
- [ ] Edit formulier view (vooringevuld)
- [ ] `destroy()` method in controller
- [ ] Delete bevestiging
- [ ] Flash messages voor update en delete
- [ ] **Veel-op-veel relatie in create formulier (multi-select/checkboxes)**
- [ ] **Veel-op-veel relatie in edit formulier (vooringevuld)**
- [ ] **`sync()`, `attach()`, of `detach()` gebruikt in store/update**
- [ ] Relatie data wordt getoond in views
- [ ] Eager loading gebruikt (`with()`) om N+1 te voorkomen

### Project-specifieke User Stories - Dag 5

#### Bibliotheek
- Bibliothecaris: Boekgegevens bewerken
- Bibliothecaris: Boeken categoriseren (veel-op-veel: books-categories)
- Lid: Filteren op categorie

#### ECommerceShop
- Shop Owner: Product informatie bewerken
- Shop Owner: Producten categoriseren (veel-op-veel: products-categories)
- Klant: Filteren op categorie en prijs

#### EventManagement
- Event Manager: Events categoriseren (veel-op-veel: events-categories)
- Bezoeker: Filteren op datum

#### HotelManagement
- Receptionist: Reserveringen maken met diensten (veel-op-veel: reservations-services)
- Gast: Extra diensten boeken

#### UniversityManagement
- Faculteits Manager: Docenten toewijzen aan cursussen (veel-op-veel indien meerdere docenten per cursus)

#### ZiekenhuisManagement
- (Controleren op veel-op-veel mogelijkheden)

### Te Bespreken
- Veel-op-veel implementatie code review
- Formulier handling voor relaties
- Sync/attach/detach gebruik

---

## Dag 6: Authenticatie & User-Specifieke Features

### Doel
- Laravel Breeze integreren en configureren
- User-specifieke functionaliteit implementeren
- Middleware gebruiken

### Review Checklist
- [ ] Login functionaliteit werkt
- [ ] Registratie functionaliteit werkt
- [ ] Routes beveiligd met `auth` middleware waar nodig
- [ ] User data gekoppeld aan records (bijv. `user_id` foreign key)
- [ ] `auth()->user()` of `Auth::user()` gebruikt
- [ ] User-specifieke data wordt getoond
- [ ] Logout functionaliteit werkt
- [ ] Navigation aangepast voor ingelogde/niet-ingelogde gebruikers

### Project-specifieke User Stories - Dag 6

#### Bibliotheek
- Bibliothecaris: Uitleen registraties maken (gekoppeld aan user)
- Lid: Uitgeleende boeken bekijken (alleen eigen boeken)
- Lid: Inleverdatum zien

#### ECommerceShop
- Klant: Producten aan winkelwagen toevoegen (per user)
- Klant: Bestelling geschiedenis bekijken (alleen eigen orders)
- Klant: Reviews schrijven (gekoppeld aan user)

#### EventManagement
- Bezoeker: Tickets kopen (gekoppeld aan user)
- Bezoeker: Gekochte tickets bekijken (alleen eigen tickets)

#### HotelManagement
- Receptionist: Gasten registreren
- Gast: Eigen reservering bekijken
- Gast: Persoonlijke gegevens updaten

#### UniversityManagement
- Studieadviseur: Studenten registreren
- Student: Eigen inschrijvingen bekijken
- Student: Eigen cijfers zien
- Student: Persoonlijke gegevens updaten

#### ZiekenhuisManagement
- Patiënt: Eigen afspraken bekijken
- Patiënt: Contact informatie updaten
- Dokter: Eigen agenda bekijken (alleen eigen afspraken)

### Te Bespreken
- Authenticatie implementatie
- User-specifieke features
- Security considerations

---

## Dag 7: Advanced Features & Refinement

### Doel
- Zoek functionaliteit
- Filter functionaliteit
- Extra features per project
- Code refinement

### Review Checklist
- [ ] Zoek functionaliteit geïmplementeerd
- [ ] Filter functionaliteit geïmplementeerd
- [ ] Paginatie gebruikt waar nodig
- [ ] Extra project-specifieke features geïmplementeerd
- [ ] Code cleanup en refactoring
- [ ] Views verbeterd en gestyled
- [ ] Alle routes hebben route namen
- [ ] Alle flash messages geïmplementeerd
- [ ] Alle validatie correct geïmplementeerd

### Project-specifieke User Stories - Dag 7

#### Bibliotheek
- Bibliothecaris: Zien welke boeken uitgeleend zijn
- Lid: Zien of boek beschikbaar is

#### ECommerceShop
- Shop Owner: Voorraad bijhouden
- Shop Owner: Verkoop rapporten bekijken
- Klant: Reviews bekijken
- Warehouse Medewerker: Bestellingen zien en markeren als verzonden

#### EventManagement
- Event Manager: Ticket verkopen volgen
- Event Manager: Capaciteit instellen
- Venue Manager: Beschikbare data aangeven
- Ticket Office Medewerker: Tickets verkopen

#### HotelManagement
- Receptionist: Check-ins en check-outs verwerken
- Huishoudelijke Dienst: Kamers markeren als schoon
- Hotel Manager: Prijzen beheren
- Hotel Manager: Bezettingsgraad bekijken

#### UniversityManagement
- Studieadviseur: Studievoortgang bekijken
- Studieadviseur: Cijfers invoeren
- Docent: Ingeschreven studenten zien
- Docent: Cijfers invoeren
- Docent: Cursusmateriaal toevoegen

#### ZiekenhuisManagement
- Receptionist: Afspraken inplannen
- Receptionist: Afspraken bekijken per dag
- Dokter: Behandeling notities toevoegen
- Dokter: Beschikbaarheid aangeven
- Afdelings Manager: Afdeling statistieken bekijken

### Te Bespreken
- Algehele project status
- Compleetheid van features
- Code kwaliteit
- Eventuele laatste aanpassingen

---

## Veel-op-Veel Relaties Per Project

### Bibliotheek
- **Books ↔ Categories**: Een boek kan meerdere categorieën hebben, een categorie kan meerdere boeken hebben
- **Pivot table**: `book_category` (book_id, category_id)

### ECommerceShop
- **Products ↔ Categories**: Een product kan meerdere categorieën hebben, een categorie kan meerdere producten hebben
- **Products ↔ Orders**: Een product kan in meerdere bestellingen zitten, een bestelling kan meerdere producten bevatten
- **Pivot tables**: 
  - `category_product` (category_id, product_id)
  - `order_product` (order_id, product_id, aantal, prijs)

### EventManagement
- **Events ↔ Categories**: Een event kan meerdere categorieën hebben, een categorie kan meerdere events hebben
- **Pivot table**: `category_event` (category_id, event_id)

### HotelManagement
- **Reservations ↔ Services**: Een reservering kan meerdere diensten bevatten, een dienst kan aan meerdere reserveringen gekoppeld zijn
- **Pivot table**: `reservation_service` (reservation_id, service_id)

### UniversityManagement
- **Geen expliciete veel-op-veel relatie in documentatie**
- **Mogelijk**: Studenten ↔ Courses (als student meerdere cursussen kan volgen en cursus door meerdere studenten gevolgd wordt - maar dit lijkt via Enrollments te gaan, wat one-to-many is)

### ZiekenhuisManagement
- **Geen expliciete veel-op-veel relatie in documentatie**
- **Mogelijk**: Appointments ↔ Medical Notes of andere relaties - moet gevalideerd worden

**OPMERKING:** UniversityManagement en ZiekenhuisManagement moeten gecontroleerd worden op de aanwezigheid van veel-op-veel relaties, anders moet er één toegevoegd worden.

---

## Algemene Richtlijnen voor Reviews

1. **Dagelijkse Stand-up**: Start elke review met een korte stand-up per groep
2. **Code Review**: Bekijk code van minimaal één feature per dag
3. **Demo**: Laat studenten hun werk demonstreren
4. **Feedback**: Geef constructieve feedback en richtlijnen voor volgende dag
5. **Probleemoplossing**: Help met bugs en problemen
6. **Documentatie**: Check of code correct gedocumenteerd is

## Tracking

Gebruik de bijgevoegde spreadsheet voor het bijhouden van de voortgang per student en per project.

