# Project 3: Boekenuitleen

## Introductie

Boekenuitleen "De Bieb" wil graag een applicatie om haar leden te kunnen registeren en bij te kunnen houden. Daarnaast willen ze de verschillende boeken die ze aanbieden dynamisch kunnen tonen op de site.

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

### Boekenbeheer
- [ ] boeken kunnen toevoegen zodat nieuwe aanwinsten in het systeem staan
- [ ] boeken kunnen bewerken zodat informatie up-to-date blijft
- [ ] boeken kunnen verwijderen als ze uit de collectie gaan
- [ ] de voorraad van boeken kunnen bijhouden zodat ik weet wanneer bij te bestellen
- [ ] meerdere auteurs kunnen koppelen aan één boek
- [ ] een boek kunnen indelen in één hoofdgenre
- [ ] een boek kunnen indelen in meerdere subgenres
- [ ] kunnen zien welke leveranciers een specifiek boek kunnen leveren
- [ ] boeken kunnen filteren op verschillende eigenschappen (titel, auteur, genre, leverancier)

### Uitleenbeheer
- [ ] nieuwe uitleen kunnen toevoegen aan het systeem
- [ ] uitleeninformatie kunnen bewerken
- [ ] uitleen kunnen verwijderen
- [ ] kunnen zien welke boeken een specifieke uitleen heeft
- [ ] contactgegevens van uitleen kunnen beheren

### Auteursbeheer  
- [ ] nieuwe auteurs kunnen toevoegen aan het systeem
- [ ] auteursinformatie kunnen bewerken
- [ ] auteurs kunnen verwijderen indien nodig
- [ ] kunnen zien welke boeken door een specifieke auteur zijn geschreven

### Leveranciersbeheer
- [ ] nieuwe leveranciers kunnen toevoegen aan het systeem
- [ ] leveranciersinformatie kunnen bewerken
- [ ] leveranciers kunnen verwijderen
- [ ] de levertijd per leverancier kunnen zien
- [ ] kunnen zien welke boeken een leverancier kan leveren
- [ ] contactgegevens van leveranciers kunnen beheren

## Opdracht 3 - Database ontwerp

Dit zijn de gegevens die we gaan opslaan.
- users (Laravel Breeze).
- books (titel, auteur, jaar, leverancier, voorraad)
- authors (naam, email, telefoonnummer)
- genres (naam, beschrijving)
- suppliers (naam, email, telefoonnummer)
- loans (boek, uitleen, teruggebracht)

### Relaties

#### Users
Users ofwel gebruikers zijn medewekers of mensen die een boek willen uitlenen.

#### Books
Een boek kan meerdere auteurs hebben.
Een boek kan meerdere genres hebben.
Een boek kan meerdere leveranciers hebben.

#### Authors
Een auteur kan meerdere boeken hebben.

#### Genres
Een genre kan meerdere boeken hebben.

#### Suppliers
Een leverancier kan meerdere boeken hebben.

#### Loans
Een uitleen kan meerdere boeken hebben.

## Opdracht 4 - Migrations maken

1. Maak via de `php artisan` commando de migrations aan. 
   > `php artisan make:migration create_books_table`
2. Zorg ervoor dat je alle attributen uit je database ontwerp hebt meegenomen.
3. Controleer of de migrations zijn aangemaakt.
4. Laat je migrations door de docent goedkeuren.

## Opdracht 5 - Models maken

1. Maak via de `php artisan` commando de models aan. Deze zijn altijd in enkelvoud en in het Engels.

2. Laat je models door de docent goedkeuren.

## Opdracht 6 - Seeding

1. Maak via de `php artisan` commando de seeders aan.
   > `php artisan make:seeder BooksSeeder`
2. Zorg ervoor dat alle niet-verplichte kolommen zijn voorzien van een default waarde of een nullable waarde.
3. Probeer de database te seeden.
4. Laat je seeders door de docent goedkeuren.

## Opdracht 7 - Userstories maken

De volgende dien je te maken:


