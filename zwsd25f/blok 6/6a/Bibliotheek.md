# Project 1: Bibliotheek

## Introductie

De lokale bibliotheek wil graag een applicatie om hun boeken, leden en uitleenregistraties te kunnen beheren. Daarnaast willen ze dat leden eenvoudig kunnen zoeken naar boeken en hun uitleenstatus kunnen bekijken.

## Opdracht 1 - Laravel Project beginnen

1. Start een nieuw Laravel project in Laravel Herd.
2. Kies voor het gebruik van Laravel Breeze voor authenticatie
3. Noem het project "bibliotheek"
4. Kies Blade voor de frontend
5. Testing Framework: PHPUnit
6. Target location: _hoef je niet te kiezen_
7. ga naar http://bibliotheek.test

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
DB_DATABASE=bibliotheek
DB_USERNAME=root
DB_PASSWORD=password
```

## Userstories

### Bibliothecaris
- [ ] Als bibliothecaris wil ik nieuwe boeken kunnen toevoegen met titel, auteur, ISBN en beschrijving zodat onze collectie up-to-date blijft
- [ ] Als bibliothecaris wil ik boekgegevens kunnen bewerken zodat informatie correct en actueel is
- [ ] Als bibliothecaris wil ik boeken kunnen zoeken op titel of auteur zodat ik snel kan vinden wat leden zoeken
- [ ] Als bibliothecaris wil ik kunnen zien welke boeken uitgeleend zijn zodat ik weet wat beschikbaar is
- [ ] Als bibliothecaris wil ik uitleen registraties kunnen maken zodat we bijhouden wie wat heeft geleend  
- [ ] Als bibliothecaris wil ik boeken kunnen categoriseren zodat leden makkelijker kunnen browsen

### Bibliotheeklid
- [ ] Als lid wil ik kunnen zoeken naar boeken op titel zodat ik kan vinden wat ik wil lezen
- [ ] Als lid wil ik kunnen filteren op categorie zodat ik boeken in mijn interessegebied kan vinden
- [ ] Als lid wil ik kunnen zien of een boek beschikbaar is zodat ik weet of ik het kan lenen
- [ ] Als lid wil ik mijn uitgeleende boeken kunnen bekijken zodat ik weet wat ik terug moet brengen
- [ ] Als lid wil ik kunnen zien wanneer ik boeken moet inleveren zodat ik geen boete krijg

## Opdracht 3 - Database ontwerp

Dit zijn de gegevens die we gaan opslaan.
- users (Laravel Breeze)
- books (titel, auteur, isbn, beschrijving)
- categories (naam, beschrijving)
- loans (uitleendatum, inleverdatum)

### Relaties

#### Users
Users ofwel gebruikers zijn bibliothecarissen of leden.

#### Books
Een boek kan meerdere uitleenregistraties hebben.
Een boek kan meerdere categorieën hebben.

#### Categories
Een categorie kan meerdere boeken hebben.

#### Loans
Een uitleenregistratie heeft één boek.
Een uitleenregistratie heeft één gebruiker.

## Opdracht 4 - Migrations maken

1. Maak via de `php artisan` commando de migrations aan. 
    > `php artisan make:migration create_books_table`
2. Zorg ervoor dat je alle attributen uit je database ontwerp hebt meegenomen.
3. Controleer of de migrations zijn aangemaakt.
4. Laat je migrations door de docent goedkeuren.

## Opdracht 5 - Models maken

1. Maak via de `php artisan` commando de models aan. Deze zijn altijd in enkelvoud en in het Engels.
   > `php artisan make:model Book`
2. Laat je models door de docent goedkeuren.

## Opdracht 6 - Seeding

1. Maak via de `php artisan` commando de seeders aan.
    > `php artisan make:seeder BooksSeeder`
2. Zorg ervoor dat alle niet-verplichte kolommen zijn voorzien van een default waarde of een nullable waarde.
3. Probeer de database te seeden.
4. Laat je seeders door de docent goedkeuren.

## Opdracht 7 - Userstories maken

Realiseer de userstories.