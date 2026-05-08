# Project 7: Hotel Management

## Introductie

Het lokale hotel wil graag een applicatie om hun kamers, gasten, reserveringen en diensten te kunnen beheren. Daarnaast willen ze dat gasten eenvoudig kunnen zoeken naar beschikbare kamers en hun reserveringen kunnen bekijken.

## Opdracht 1 - Laravel Project beginnen

1. Start een nieuw Laravel project in Laravel Herd.
2. Kies voor het gebruik van Laravel Breeze voor authenticatie
3. Noem het project "hotelmanagement"
4. Kies Blade voor de frontend
5. Testing Framework: PHPUnit
6. Target location: _hoef je niet te kiezen_
7. ga naar http://hotelmanagement.test

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
DB_DATABASE=hotelmanagement
DB_USERNAME=root
DB_PASSWORD=password
```

## Userstories

### Receptionist
- [ ] Als receptionist wil ik nieuwe gasten kunnen registreren met persoonlijke gegevens zodat ze kunnen reserveren
- [ ] Als receptionist wil ik beschikbare kamers kunnen bekijken zodat ik weet wat ik kan aanbieden
- [ ] Als receptionist wil ik reserveringen kunnen maken zodat gasten kunnen verblijven
- [ ] Als receptionist wil ik check-ins en check-outs kunnen verwerken zodat de administratie klopt

### Gast
- [ ] Als gast wil ik beschikbare kamers kunnen bekijken zodat ik weet wat ik kan boeken
- [ ] Als gast wil ik kunnen filteren op prijs en faciliteiten zodat ik een passende kamer vind
- [ ] Als gast wil ik mijn reservering kunnen bekijken zodat ik weet wanneer ik kom
- [ ] Als gast wil ik extra diensten kunnen boeken zodat ik mijn verblijf kan aanvullen

### Huishoudelijke Dienst
- [ ] Als huishoudelijke dienst wil ik kunnen zien welke kamers schoongemaakt moeten worden
- [ ] Als huishoudelijke dienst wil ik kamers kunnen markeren als schoon zodat nieuwe gasten kunnen inchecken
- [ ] Als huishoudelijke dienst wil ik onderhoudsproblemen kunnen melden zodat ze opgelost worden

### Hotel Manager
- [ ] Als manager wil ik nieuwe kamers kunnen toevoegen zodat het aanbod compleet is
- [ ] Als manager wil ik prijzen kunnen beheren zodat we competitief blijven
- [ ] Als manager wil ik bezettingsgraad kunnen bekijken zodat ik trends kan identificeren
- [ ] Als manager wil ik personeelsroosters kunnen beheren zodat er altijd voldoende dekking is

## Opdracht 3 - Database ontwerp

Dit zijn de gegevens die we gaan opslaan.
- users (Laravel Breeze)
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

Realiseer de userstories.