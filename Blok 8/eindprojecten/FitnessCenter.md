# Project 2: Fitness Center

## Introductie

Het lokale fitnesscentrum wil graag een applicatie om hun workouts, trainers, leden en reserveringen te kunnen beheren. Daarnaast willen ze dat leden eenvoudig kunnen zoeken naar workouts en hun workout geschiedenis kunnen bekijken.

## Opdracht 1 - Laravel Project beginnen

1. Start een nieuw Laravel project in Laravel Herd.
2. Kies voor het gebruik van Laravel Breeze voor authenticatie
3. Noem het project "fitnesscenter"
4. Kies Blade voor de frontend
5. Testing Framework: PHPUnit
6. Target location: _hoef je niet te kiezen_
7. ga naar http://fitnesscenter.test

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
DB_DATABASE=fitnesscenter
DB_USERNAME=root
DB_PASSWORD=password
```

## Userstories

### Gym Manager
- [ ] Als manager wil ik nieuwe workouts kunnen toevoegen met naam, duur en moeilijkheidsgraad zodat leden variatie hebben
- [ ] Als manager wil ik trainers kunnen toewijzen aan workouts zodat er altijd begeleiding is
- [ ] Als manager wil ik equipment kunnen koppelen aan workouts zodat leden weten wat ze nodig hebben
- [ ] Als manager wil ik member rapporten kunnen bekijken zodat ik zie hoe actief onze leden zijn

### Gym Lid
- [ ] Als lid wil ik workouts kunnen bekijken gefilterd op moeilijkheidsgraad zodat ik passende oefeningen vind
- [ ] Als lid wil ik kunnen zien welke equipment ik nodig heb voor een workout zodat ik me kan voorbereiden
- [ ] Als lid wil ik mijn workout geschiedenis kunnen bijhouden zodat ik mijn voortgang kan zien
- [ ] Als lid wil ik workouts kunnen zoeken op naam zodat ik specifieke oefeningen kan vinden
- [ ] Als lid wil ik kunnen zien welke trainer een workout begeleidt zodat ik weet bij wie ik terecht kan

### Personal Trainer
- [ ] Als trainer wil ik kunnen zien welke workouts aan mij zijn toegewezen zodat ik weet waar ik moet zijn
- [ ] Als trainer wil ik workout details kunnen bekijken zodat ik me kan voorbereiden op de begeleiding
- [ ] Als trainer wil ik kunnen zien welke leden zich hebben aangemeld zodat ik weet hoeveel mensen er komen
- [ ] Als trainer wil ik mijn specialisaties kunnen aangeven zodat ik bij de juiste workouts word ingezet

### Receptionist
- [ ] Als receptionist wil ik nieuwe leden kunnen registreren zodat ze toegang krijgen tot faciliteiten
- [ ] Als receptionist wil ik leden kunnen inschrijven voor workouts zodat ze kunnen deelnemen
- [ ] Als receptionist wil ik kunnen zien welke workouts vol zijn zodat ik leden correcte informatie geef

## Opdracht 3 - Database ontwerp

Dit zijn de gegevens die we gaan opslaan.
- users (Laravel Breeze)
- workouts (naam, duur, moeilijkheidsgraad, beschrijving)
- equipment (naam, beschrijving)
- specializations (naam, beschrijving)
- reservations (datum, status)

### Relaties

#### Users
Users ofwel gebruikers zijn managers, trainers, receptionisten of leden.

#### Workouts
Een workout kan meerdere reserveringen hebben.
Een workout kan meerdere equipment hebben.
Een workout heeft één trainer.

#### Equipment
Equipment kan aan meerdere workouts gekoppeld zijn.

#### Specializations
Een specialisatie kan meerdere trainers hebben.
Een trainer kan meerdere specialisaties hebben.

#### Reservations
Een reservering heeft één workout.
Een reservering heeft één gebruiker.

## Opdracht 4 - Migrations maken

1. Maak via de `php artisan` commando de migrations aan. 
    > `php artisan make:migration create_workouts_table`
2. Zorg ervoor dat je alle attributen uit je database ontwerp hebt meegenomen.
3. Controleer of de migrations zijn aangemaakt.
4. Laat je migrations door de docent goedkeuren.

## Opdracht 5 - Models maken

1. Maak via de `php artisan` commando de models aan. Deze zijn altijd in enkelvoud en in het Engels.
   > `php artisan make:model Workout`
2. Laat je models door de docent goedkeuren.

## Opdracht 6 - Seeding

1. Maak via de `php artisan` commando de seeders aan.
    > `php artisan make:seeder WorkoutsSeeder`
2. Zorg ervoor dat alle niet-verplichte kolommen zijn voorzien van een default waarde of een nullable waarde.
3. Probeer de database te seeden.
4. Laat je seeders door de docent goedkeuren.

## Opdracht 7 - Userstories maken

Realiseer de userstories.