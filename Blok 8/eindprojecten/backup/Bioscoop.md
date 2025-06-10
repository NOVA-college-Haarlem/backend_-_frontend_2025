# Project 1: Bioscoop

## Introductie

Bioscoop "De Gouden Film" wil graag een applicatie om haar films, zalen en voorstellingen te kunnen beheren. Daarnaast willen ze de verschillende films die ze aanbieden dynamisch kunnen tonen op de site.

## Opdracht 1 - Laravel Project beginnen

1. Start een nieuw Laravel project in Laravel Herd.
2. Kies voor het gebruik van Laravel Breeze voor authenticatie
3. Noem het project "bioscoop"
4. Kies Blade voor de frontend
5. Testing Framework: PHPUnit
6. Target location: _hoef je niet te kiezen_
7. ga naar http://bioscoop.test

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
DB_DATABASE=bioscoop
DB_USERNAME=root
DB_PASSWORD=password
```

## Userstories

### Filmsbeheer
- [ ] nieuwe films kunnen toevoegen aan het systeem zodat we hun informatie kunnen bijhouden
- [ ] filmgegevens kunnen bewerken om informatie actueel te houden
- [ ] films kunnen verwijderen uit het systeem wanneer ze niet meer draaien
- [ ] basisinformatie van films kunnen registreren (titel, regisseur, duur, genre, leeftijdsgrens)
- [ ] een overzicht kunnen zien van alle films in de bioscoop
- [ ] films kunnen filteren op verschillende eigenschappen (genre, leeftijdsgrens, duur)
- [ ] films kunnen indelen in categorieën voor een beter overzicht

### Zalenbeheer
- [ ] zalen kunnen toevoegen aan het systeem zodat we hun informatie kunnen bijhouden
- [ ] zalen kunnen bewerken om informatie actueel te houden
- [ ] zalen kunnen verwijderen uit het systeem wanneer ze niet meer in gebruik zijn
- [ ] basisinformatie van zalen kunnen registreren (naam, aantal stoelen, schermgrootte)
- [ ] een overzicht kunnen zien van alle zalen in de bioscoop
- [ ] zalen kunnen filteren op verschillende eigenschappen (capaciteit, schermgrootte)

### Voorstellingenbeheer
- [ ] voorstellingen kunnen toevoegen aan het systeem zodat we hun informatie kunnen bijhouden
- [ ] voorstellingen kunnen bewerken om informatie actueel te houden
- [ ] voorstellingen kunnen verwijderen uit het systeem wanneer ze niet meer draaien
- [ ] basisinformatie van voorstellingen kunnen registreren (datum, tijd, film, zaal)
- [ ] een overzicht kunnen zien van alle voorstellingen in de bioscoop
- [ ] voorstellingen kunnen filteren op verschillende eigenschappen (datum, film, zaal)

### Reserveringenbeheer
- [ ] reserveringen kunnen registreren per voorstelling
- [ ] reserveringen kunnen bewerken
- [ ] reserveringen kunnen annuleren
- [ ] de reserveringsgeschiedenis van een klant kunnen inzien
- [ ] alerts krijgen wanneer een voorstelling bijna vol is
- [ ] reserveringsnotities kunnen toevoegen
- [ ] Een reservering heeft een type zoals regulier, student, senior, etc.


## Opdracht 3 - Database ontwerp

Dit zijn de gegevens die we gaan opslaan.
- users (Laravel Breeze).
- movies (titel, regisseur, duur)
- genres (naam, beschrijving)
- halls (naam, aantal_stoelen, schermgrootte)
- screenings (datum, tijd)
- reservations (klant_naam, email, aantal_kaarten, type)

### Relaties

#### Users
Users ofwel gebruikers zijn medewerkers of klanten.

#### Movies
Een film kan meerdere voorstellingen hebben.
Een film kan meerdere genres hebben.

#### Genres
Een genre kan meerdere films hebben.

#### Halls
Een zaal kan meerdere voorstellingen hebben.

#### Screenings
Een voorstelling heeft één film.
Een voorstelling heeft één zaal.
Een voorstelling kan meerdere reserveringen hebben.

#### Reservations
Een reservering heeft één voorstelling.

## Opdracht 4 - Migrations maken

1. Maak via de `php artisan` commando de migrations aan. 
    > `php artisan make:migration create_movies_table`
2. Zorg ervoor dat je alle attributen uit je database ontwerp hebt meegenomen.
3. Controleer of de migrations zijn aangemaakt.
4. Laat je migrations door de docent goedkeuren.

## Opdracht 5 - Models maken

1. Maak via de `php artisan` commando de models aan. Deze zijn altijd in enkelvoud en in het Engels.
   > `php artisan make:model Movie`
2. Laat je models door de docent goedkeuren.

## Opdracht 6 - Seeding

1. Maak via de `php artisan` commando de seeders aan.
    > `php artisan make:seeder MoviesSeeder`
2. Zorg ervoor dat alle niet-verplichte kolommen zijn voorzien van een default waarde of een nullable waarde.
3. Probeer de database te seeden.
4. Laat je seeders door de docent goedkeuren.

## Opdracht 7 - Userstories maken

Realiseer de userstories.
