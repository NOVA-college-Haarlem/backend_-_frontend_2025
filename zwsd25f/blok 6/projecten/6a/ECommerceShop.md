# Project 4: E-commerce Webshop

## Introductie

De lokale webshop wil graag een applicatie om hun producten, bestellingen, klanten en voorraad te kunnen beheren. Daarnaast willen ze dat klanten eenvoudig kunnen zoeken naar producten en hun bestellingen kunnen bekijken.

## Opdracht 1 - Laravel Project beginnen

1. Start een nieuw Laravel project in Laravel Herd.
2. Kies voor "No Starter Kit"
3. Noem het project "ecommerceshop"
4. Testing Framework: Pest
5. Install Laravel Boost: Ja
6. Initialize a Git repository: Ja
7. ga naar http://ecommerceshop.test



## Opdracht 3 - Database ontwerp

Dit zijn de gegevens die we gaan opslaan.
- users (standaard Laravel users-tabel)
- products (naam, prijs, beschrijving, voorraad)
- categories (naam, beschrijving)
- orders (datum, status, totaalbedrag)
- reviews (rating, commentaar)
- cart_items (aantal)

### Relaties

#### Users
Users ofwel gebruikers zijn shop owners, customer service medewerkers, warehouse medewerkers of klanten.

#### Products
Een product kan meerdere categorieën hebben.
Een product kan meerdere reviews hebben.
Een product kan in  winkelwagens zitten.
Een product kan in meerdere bestellingmeerdereen zitten.

#### Categories
Een categorie kan meerdere producten hebben.

#### Orders
Een bestelling heeft één gebruiker.
Een bestelling kan meerdere producten bevatten.

#### Reviews
Een review heeft één product.
Een review heeft één gebruiker.

#### Cart Items
Een winkelwagen item heeft één product.
Een winkelwagen item heeft één gebruiker.

## Opdracht 4 - Migrations maken

1. Maak via de `php artisan` commando de migrations aan. 
    > `php artisan make:migration create_products_table`
2. Zorg ervoor dat je alle attributen uit je database ontwerp hebt meegenomen.
3. Controleer of de migrations zijn aangemaakt.
4. Laat je migrations door de docent goedkeuren.

## Opdracht 5 - Models maken

1. Maak via de `php artisan` commando de models aan. Deze zijn altijd in enkelvoud en in het Engels.
   > `php artisan make:model Product`
2. Laat je models door de docent goedkeuren.

## Opdracht 6 - Seeding

1. Maak via de `php artisan` commando de seeders aan.
    > `php artisan make:seeder ProductsSeeder`
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
- Begin met de onderstaande stories; de stories uit "Later oppakken" komen in projectweek 6A nog niet aan bod.
- Maak per role eerst een overzichtspagina (index/read), en breid daarna pas uit met extra functionaliteit.
- Controleer na elke stap of je pagina's werken met je seeddata, zodat je problemen vroeg ontdekt.

#### Shop Owner
- [ ] Als eigenaar wil ik verkoop rapporten kunnen bekijken zodat ik mijn business kan analyseren

#### Klant
- [ ] Als klant wil ik producten kunnen zoeken op naam zodat ik snel vind wat ik zoek
- [ ] Als klant wil ik kunnen filteren op categorie en prijs zodat ik binnen mijn budget en interesse kan shoppen
- [ ] Als klant wil ik product details en reviews kunnen bekijken zodat ik een goede keuze kan maken
- [ ] Als klant wil ik mijn bestelling geschiedenis kunnen zien zodat ik kan bijhouden wat ik gekocht heb

#### Customer Service
- [ ] Als service medewerker wil ik alle bestellingen kunnen bekijken zodat ik klanten kan helpen
- [ ] Als service medewerker wil ik klant informatie kunnen bekijken zodat ik persoonlijke service kan bieden

#### Warehouse Medewerker
- [ ] Als warehouse medewerker wil ik nieuwe bestellingen kunnen zien zodat ik weet wat ik moet inpakken
- [ ] Als warehouse medewerker wil ik voorraad levels kunnen checken zodat ik weet wat op is

### Later oppakken (als formulieren en crud-operaties behandeld zijn)

#### Shop Owner
- [ ] Als eigenaar wil ik nieuwe producten kunnen toevoegen met naam, prijs, beschrijving en voorraad zodat klanten kunnen kopen
- [ ] Als eigenaar wil ik product informatie kunnen bewerken zodat details en prijzen actueel zijn
- [ ] Als eigenaar wil ik producten kunnen categoriseren zodat klanten makkelijk kunnen browsen
- [ ] Als eigenaar wil ik voorraad kunnen bijhouden zodat ik weet wanneer ik moet bijbestellen

#### Klant
- [ ] Als klant wil ik producten aan mijn winkelwagen kunnen toevoegen zodat ik meerdere items kan kopen
- [ ] Als klant wil ik reviews kunnen schrijven zodat andere klanten kunnen profiteren van mijn ervaring

#### Customer Service
- [ ] Als service medewerker wil ik bestelling status kunnen updaten zodat klanten weten waar hun order staat

#### Warehouse Medewerker
- [ ] Als warehouse medewerker wil ik bestellingen kunnen markeren als verzonden zodat klanten op de hoogte zijn