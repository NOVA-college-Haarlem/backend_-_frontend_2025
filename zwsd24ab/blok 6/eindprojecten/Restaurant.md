# Project 1: Restaurant

## Introductie

Restaurant "De Gouden Gerechten" wil graag een applicatie om hun menu, bestellingen en gerechten te kunnen beheren. Daarnaast willen ze dat klanten eenvoudig kunnen bestellen en dat het personeel efficiënt kan werken.

## Opdracht 1 - Laravel Project beginnen

1. Start een nieuw Laravel project in Laravel Herd.
2. Kies voor het gebruik van Laravel Breeze voor authenticatie
3. Noem het project "restaurant"
4. Kies Blade voor de frontend
5. Testing Framework: PHPUnit
6. Target location: _hoef je niet te kiezen_
7. ga naar http://restaurant.test

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
DB_DATABASE=restaurant
DB_USERNAME=root
DB_PASSWORD=password
```

## Userstories

### Restaurant Manager
- [ ] Als manager wil ik nieuwe gerechten kunnen toevoegen met naam, beschrijving en prijs zodat ons menu actueel blijft
- [ ] Als manager wil ik gerecht informatie kunnen bewerken zodat prijzen en beschrijvingen correct zijn
- [ ] Als manager wil ik gerechten kunnen categoriseren (voorgerecht, hoofdgerecht, dessert) zodat het menu overzichtelijk is
- [ ] Als manager wil ik ingrediënten per gerecht kunnen bijhouden zodat we allergieën kunnen communiceren
- [ ] Als manager wil ik verkooprapporten kunnen bekijken zodat ik weet welke gerechten populair zijn

### Klant
- [ ] Als klant wil ik het menu kunnen bekijken per categorie zodat ik makkelijk kan kiezen wat ik wil eten
- [ ] Als klant wil ik gerecht details kunnen zien inclusief ingrediënten zodat ik kan checken op allergieën
- [ ] Als klant wil ik gerechten kunnen filteren op prijs zodat ik binnen mijn budget kan kiezen
- [ ] Als klant wil ik een bestelling kunnen plaatsen zodat ik mijn eten kan bestellen
- [ ] Als klant wil ik mijn bestelling geschiedenis kunnen zien zodat ik kan herhalen wat ik lekker vond

### Kok
- [ ] Als kok wil ik nieuwe bestellingen kunnen zien zodat ik weet wat ik moet bereiden
- [ ] Als kok wil ik ingrediënten lijsten kunnen bekijken zodat ik weet wat er in elk gerecht moet
- [ ] Als kok wil ik bestellingen kunnen markeren als klaar zodat de bediening weet dat het kan worden geserveerd

### Kellner
- [ ] Als kellner wil ik bestellingen kunnen opnemen voor klanten zodat zij kunnen eten
- [ ] Als kellner wil ik kunnen zien welke gerechten klaar zijn zodat ik ze kan serveren
- [ ] Als kellner wil ik allergene informatie snel kunnen opzoeken zodat ik klanten correct kan adviseren

## Opdracht 3 - Database ontwerp

Dit zijn de gegevens die we gaan opslaan.
- users (Laravel Breeze)
- dishes (naam, beschrijving, prijs)
- categories (naam, type)
- ingredients (naam, allergenen)
- orders (datum, status)
- order_items (aantal, opmerkingen)

### Relaties

#### Users
Users ofwel gebruikers zijn managers, koks, kellners of klanten.

#### Dishes
Een gerecht kan meerdere ingrediënten hebben.
Een gerecht kan meerdere bestellingen hebben.
Een gerecht heeft één categorie.

#### Categories
Een categorie kan meerdere gerechten hebben.

#### Ingredients
Een ingrediënt kan in meerdere gerechten voorkomen.

#### Orders
Een bestelling heeft één klant.
Een bestelling heeft één kellner.
Een bestelling kan meerdere gerechten bevatten.

#### Order Items
Een order item heeft één bestelling.
Een order item heeft één gerecht.

## Opdracht 4 - Migrations maken

1. Maak via de `php artisan` commando de migrations aan. 
    > `php artisan make:migration create_dishes_table`
2. Zorg ervoor dat je alle attributen uit je database ontwerp hebt meegenomen.
3. Controleer of de migrations zijn aangemaakt.
4. Laat je migrations door de docent goedkeuren.

## Opdracht 5 - Models maken

1. Maak via de `php artisan` commando de models aan. Deze zijn altijd in enkelvoud en in het Engels.
   > `php artisan make:model Dish`
2. Laat je models door de docent goedkeuren.

## Opdracht 6 - Seeding

1. Maak via de `php artisan` commando de seeders aan.
    > `php artisan make:seeder DishesSeeder`
2. Zorg ervoor dat alle niet-verplichte kolommen zijn voorzien van een default waarde of een nullable waarde.
3. Probeer de database te seeden.
4. Laat je seeders door de docent goedkeuren.

## Opdracht 7 - Userstories maken

Realiseer de userstories.