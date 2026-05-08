# Project 3: Event Management

## Introductie

Het lokale evenementenbureau wil graag een applicatie om hun events, venues, tickets en reserveringen te kunnen beheren. Daarnaast willen ze dat bezoekers eenvoudig kunnen zoeken naar events en hun tickets kunnen bekijken.

## Opdracht 1 - Laravel Project beginnen

1. Start een nieuw Laravel project in Laravel Herd.
2. Kies voor het gebruik van Laravel Breeze voor authenticatie
3. Noem het project "eventmanagement"
4. Kies Blade voor de frontend
5. Testing Framework: PHPUnit
6. Target location: _hoef je niet te kiezen_
7. ga naar http://eventmanagement.test

## Opdracht 2a - Database server/file opzetten

Standaard werkt Laravel met een SQLITE database. Dit is een eenvoudige database die in een enkele file staat.

Als je met PHPMyAdmin wilt werken dan moeten we eerst een Docker omgeving opzetten. In opdracht 2a en 2b zetten we deze omgeving op.

1. Open VS Code
2. Open je projecten folder (dus werk netjes volgens de eerdere afspraken/opdrachten)
3. Open een terminal
4. Clone deze repository: https://github.com/NOVA-college-Haarlem/mysql-phpmyadmin in de projecten folder
    - `git clone https://github.com/NOVA-college-Haarlem/mysql-phpmyadmin`
5. Open de map `mysql-phpmyadmin`
6. Open een terminal in deze map
7. Run `docker compose up -d`
8. Open een browser en ga naar http://localhost:8000
9. Je hebt nu toegang tot een MySQL database met een phpmyadmin interface.

## Opdracht 2b - Database connectie

1. Druk op Ctrl + P
2. Open .env file
3. Gebruik je liever mysql en phpmyadmin. Vul de correcte database connectie in. Zie regel 24 tm 29
```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3307
DB_DATABASE=eventmanagement
DB_USERNAME=root
DB_PASSWORD=password
```

## Userstories

### Event Manager
- [ ] Als manager wil ik nieuwe events kunnen aanmaken met datum, tijd, locatie en beschrijving zodat ons programma compleet is
- [ ] Als manager wil ik events kunnen categoriseren zodat bezoekers makkelijk kunnen vinden wat hen interesseert
- [ ] Als manager wil ik venues kunnen beheren zodat ik weet welke locaties beschikbaar zijn
- [ ] Als manager wil ik ticket verkopen kunnen volgen zodat ik weet hoe populair events zijn
- [ ] Als manager wil ik capaciteit per event kunnen instellen zodat we niet oververkopen

### Bezoeker
- [ ] Als bezoeker wil ik upcoming events kunnen bekijken zodat ik kan zien wat er te doen is
- [ ] Als bezoeker wil ik events kunnen filteren op datum zodat ik kan zien wat er deze week speelt
- [ ] Als bezoeker wil ik event details kunnen bekijken zodat ik weet wat me te wachten staat
- [ ] Als bezoeker wil ik tickets kunnen kopen zodat ik kan deelnemen aan events
- [ ] Als bezoeker wil ik mijn gekochte tickets kunnen bekijken zodat ik weet waarvoor ik betaald heb

### Venue Manager
- [ ] Als venue manager wil ik beschikbare data kunnen aangeven zodat event managers weten wanneer ze kunnen boeken
- [ ] Als venue manager wil ik venue details kunnen bijwerken zodat informatie actueel is
- [ ] Als venue manager wil ik kunnen zien welke events gepland zijn zodat ik me kan voorbereiden

### Ticket Office Medewerker
- [ ] Als medewerker wil ik tickets kunnen verkopen aan bezoekers zodat zij events kunnen bijwonen
- [ ] Als medewerker wil ik kunnen zien hoeveel tickets er nog beschikbaar zijn zodat ik klanten correct kan informeren
- [ ] Als medewerker wil ik verkoop rapporten kunnen bekijken zodat ik management kan informeren

## Opdracht 3 - Database ontwerp

Dit zijn de gegevens die we gaan opslaan.
- users (Laravel Breeze)
- events (datum, tijd, locatie, beschrijving, capaciteit)
- venues (naam, adres, capaciteit, beschrijving)
- categories (naam, beschrijving)
- tickets (prijs, status)

### Relaties

#### Users
Users ofwel gebruikers zijn event managers, venue managers, ticket office medewerkers of bezoekers.

#### Events
Een event heeft één venue.
Een event kan meerdere categorieën hebben.
Een event kan meerdere tickets hebben.

#### Venues
Een venue kan meerdere events hebben.

#### Categories
Een categorie kan meerdere events hebben.

#### Tickets
Een ticket heeft één event.
Een ticket heeft één gebruiker.

## Opdracht 4 - Migrations maken

1. Maak via de `php artisan` commando de migrations aan. 
    > `php artisan make:migration create_events_table`
2. Zorg ervoor dat je alle attributen uit je database ontwerp hebt meegenomen.
3. Controleer of de migrations zijn aangemaakt.
4. Laat je migrations door de docent goedkeuren.

## Opdracht 5 - Models maken

1. Maak via de `php artisan` commando de models aan. Deze zijn altijd in enkelvoud en in het Engels.
   > `php artisan make:model Event`
2. Laat je models door de docent goedkeuren.

## Opdracht 6 - Seeding

1. Maak via de `php artisan` commando de seeders aan.
    > `php artisan make:seeder EventsSeeder`
2. Zorg ervoor dat alle niet-verplichte kolommen zijn voorzien van een default waarde of een nullable waarde.
3. Probeer de database te seeden.
4. Laat je seeders door de docent goedkeuren.

## Opdracht 7 - Userstories maken

Realiseer de userstories.