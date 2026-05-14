# Project 7: Hotel Management

## Introductie

Het lokale hotel wil graag een applicatie om hun kamers, gasten, reserveringen en diensten te kunnen beheren. Daarnaast willen ze dat gasten eenvoudig kunnen zoeken naar beschikbare kamers en hun reserveringen kunnen bekijken.

## Opdracht 1 - Laravel Project beginnen

1. Start een nieuw Laravel project in Laravel Herd.
2. Kies voor "No Starter Kit"
3. Noem het project "hotelmanagement"
4. Testing Framework: Pest
5. Install Laravel Boost: Ja
6. Initialize a Git repository: Ja
7. ga naar http://hotelmanagement.test



## Opdracht 3 - Database ontwerp

Dit zijn de gegevens die we gaan opslaan.
- users (standaard Laravel users-tabel)
- guests (naam, email, telefoon)
- rooms (nummer, type, prijs, capaciteit)
- reservations (check_in, check_out, status)
- services (naam, prijs, beschrijving)
- maintenance (probleem, status, datum)

### Relaties

#### Users
Users ofwel gebruikers zijn receptionisten, huishoudelijke dienst medewerkers, hotel managers of gasten.

#### Guests
Een gast kan meerdere reserveringen hebben.
Een gast kan meerdere diensten afnemen.

#### Rooms
Een kamer kan meerdere reserveringen hebben.
Een kamer kan meerdere onderhoudsmeldingen hebben.

#### Reservations
Een reservering heeft één gast.
Een reservering heeft één kamer.
Een reservering kan meerdere diensten bevatten.

#### Services
Een dienst kan aan meerdere reserveringen gekoppeld zijn.

#### Maintenance
Een onderhoudsmelding heeft één kamer.
Een onderhoudsmelding heeft één gebruiker.

## Opdracht 4 - Migrations maken

1. Maak via de `php artisan` commando de migrations aan. 
    > `php artisan make:migration create_rooms_table`
2. Zorg ervoor dat je alle attributen uit je database ontwerp hebt meegenomen.
3. Controleer of de migrations zijn aangemaakt.
4. Laat je migrations door de docent goedkeuren.

## Opdracht 5 - Models maken

1. Maak via de `php artisan` commando de models aan. Deze zijn altijd in enkelvoud en in het Engels.
   > `php artisan make:model Room`
2. Laat je models door de docent goedkeuren.

## Opdracht 6 - Seeding

1. Maak via de `php artisan` commando de seeders aan.
    > `php artisan make:seeder RoomsSeeder`
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

#### Receptionist
- [ ] Als receptionist wil ik beschikbare kamers kunnen bekijken zodat ik weet wat ik kan aanbieden
- [ ] Als receptionist wil ik op de detailpagina van een kamer alle reserveringen van die kamer zien zodat ik de bezetting kan controleren

#### Gast
- [ ] Als gast wil ik beschikbare kamers kunnen bekijken zodat ik weet wat ik kan boeken
- [ ] Als gast wil ik kunnen filteren op prijs en faciliteiten zodat ik een passende kamer vind
- [ ] Als gast wil ik mijn reservering kunnen bekijken zodat ik weet wanneer ik kom
- [ ] Als gast wil ik op de detailpagina van mijn reservering de kamergegevens en gekoppelde diensten zien zodat ik precies weet wat inbegrepen is

#### Huishoudelijke Dienst
- [ ] Als huishoudelijke dienst wil ik kunnen zien welke kamers schoongemaakt moeten worden
- [ ] Als huishoudelijke dienst wil ik op de detailpagina van een kamer de onderhoudsmeldingen zien zodat ik rekening kan houden met technische issues

#### Hotel Manager
- [ ] Als manager wil ik bezettingsgraad kunnen bekijken zodat ik trends kan identificeren

### Later oppakken (als formulieren en crud-operaties behandeld zijn)

#### Receptionist
- [ ] Als receptionist wil ik nieuwe gasten kunnen registreren met persoonlijke gegevens zodat ze kunnen reserveren
- [ ] Als receptionist wil ik reserveringen kunnen maken zodat gasten kunnen verblijven
- [ ] Als receptionist wil ik check-ins en check-outs kunnen verwerken zodat de administratie klopt

#### Gast
- [ ] Als gast wil ik extra diensten kunnen boeken zodat ik mijn verblijf kan aanvullen

#### Huishoudelijke Dienst
- [ ] Als huishoudelijke dienst wil ik kamers kunnen markeren als schoon zodat nieuwe gasten kunnen inchecken
- [ ] Als huishoudelijke dienst wil ik onderhoudsproblemen kunnen melden zodat ze opgelost worden

#### Hotel Manager
- [ ] Als manager wil ik nieuwe kamers kunnen toevoegen zodat het aanbod compleet is
- [ ] Als manager wil ik prijzen kunnen beheren zodat we competitief blijven
- [ ] Als manager wil ik personeelsroosters kunnen beheren zodat er altijd voldoende dekking is