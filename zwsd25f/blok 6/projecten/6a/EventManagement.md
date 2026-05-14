# Project 3: Event Management

## Introductie

Het lokale evenementenbureau wil graag een applicatie om hun events, venues, tickets en reserveringen te kunnen beheren. Daarnaast willen ze dat bezoekers eenvoudig kunnen zoeken naar events en hun tickets kunnen bekijken.

## Opdracht 1 - Laravel Project beginnen

1. Start een nieuw Laravel project in Laravel Herd.
2. Kies voor "No Starter Kit"
3. Noem het project "eventmanagement"
4. Testing Framework: Pest
5. Install Laravel Boost: Ja
6. Initialize a Git repository: Ja
7. ga naar http://eventmanagement.test



## Opdracht 3 - Database ontwerp

Dit zijn de gegevens die we gaan opslaan.
- users (standaard Laravel users-tabel)
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

## Userstories

### Requirements
- Zorg ervoor dat je seeders alle situaties (testdata) bevatten die je nodig hebt om onderstaande userstories te realiseren.
- Gebruik geen Laravel-code of features die nog niet in de les zijn behandeld.
- Gebruik ten minste 2 Blade-componenten in moderne syntax (bijvoorbeeld <x-layout> en <x-ui.card>).
- Neem basisstyling op via een centrale CSS-file die je in de layout laadt (geen Tailwind).
- Maak gerelateerde gegevens klikbaar: toon je bijvoorbeeld een categorie, gebruiker of locatie, dan link je door naar de bijbehorende detailpagina.
- Begin met de onderstaande stories; de stories uit "Later oppakken" komen in projectweek 6A nog niet aan bod.
- Maak per role eerst een overzichtspagina (index/read), en breid daarna pas uit met extra functionaliteit.
- Controleer na elke stap of je pagina's werken met je seeddata, zodat je problemen vroeg ontdekt.

#### Algemene gebruiker
- [ ] Als gebruiker wil ik een navigatiemenu zien met links naar alle entiteiten zodat ik snel door de applicatie kan navigeren.
- [ ] Als gebruiker wil ik kunnen zien op welke pagina ik ben (actief menu-item) zodat ik altijd context heb.
- [ ] Als gebruiker wil ik op elke pagina een footer zien met projectnaam en klas/groep zodat de layout compleet en consistent is.
- [ ] Als gebruiker wil ik vanaf een overzicht naar een detailpagina kunnen klikken zodat ik meer informatie per item kan bekijken.
- [ ] Als gebruiker wil ik een duidelijke melding zien als er geen data is zodat ik begrijp waarom een lijst leeg is.
- [ ] Als gebruiker wil ik dat de applicatie goed leesbaar en bruikbaar is op mobiel.

#### Event Manager
- [ ] Als manager wil ik ticket verkopen kunnen volgen zodat ik weet hoe populair events zijn

#### Bezoeker
- [ ] Als bezoeker wil ik upcoming events kunnen bekijken zodat ik kan zien wat er te doen is
- [ ] Als bezoeker wil ik events kunnen filteren op datum zodat ik kan zien wat er deze week speelt
- [ ] Als bezoeker wil ik event details kunnen bekijken zodat ik weet wat me te wachten staat
- [ ] Als bezoeker wil ik mijn gekochte tickets kunnen bekijken zodat ik weet waarvoor ik betaald heb
- [ ] Als bezoeker wil ik op de detailpagina van een event de venue en categorieen zien zodat ik alle context van het event direct heb

#### Venue Manager
- [ ] Als venue manager wil ik kunnen zien welke events gepland zijn zodat ik me kan voorbereiden
- [ ] Als venue manager wil ik op de detailpagina van een venue alle events op die locatie zien zodat ik de planning kan overzien

#### Ticket Office Medewerker
- [ ] Als medewerker wil ik kunnen zien hoeveel tickets er nog beschikbaar zijn zodat ik klanten correct kan informeren
- [ ] Als medewerker wil ik verkoop rapporten kunnen bekijken zodat ik management kan informeren
- [ ] Als medewerker wil ik op de detailpagina van een event alle tickets met status zien zodat ik snel de ticketverdeling kan controleren

### Later oppakken (als formulieren en crud-operaties behandeld zijn)

#### Event Manager
- [ ] Als manager wil ik nieuwe events kunnen aanmaken met datum, tijd, locatie en beschrijving zodat ons programma compleet is
- [ ] Als manager wil ik events kunnen categoriseren zodat bezoekers makkelijk kunnen vinden wat hen interesseert
- [ ] Als manager wil ik venues kunnen beheren zodat ik weet welke locaties beschikbaar zijn
- [ ] Als manager wil ik capaciteit per event kunnen instellen zodat we niet oververkopen

#### Bezoeker
- [ ] Als bezoeker wil ik tickets kunnen kopen zodat ik kan deelnemen aan events

#### Venue Manager
- [ ] Als venue manager wil ik beschikbare data kunnen aangeven zodat event managers weten wanneer ze kunnen boeken
- [ ] Als venue manager wil ik venue details kunnen bijwerken zodat informatie actueel is

#### Ticket Office Medewerker
- [ ] Als medewerker wil ik tickets kunnen verkopen aan bezoekers zodat zij events kunnen bijwonen