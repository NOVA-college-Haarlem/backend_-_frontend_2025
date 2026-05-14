# Project 1: Bibliotheek

## Introductie

De lokale bibliotheek wil graag een applicatie om hun boeken, leden en uitleenregistraties te kunnen beheren. Daarnaast willen ze dat leden eenvoudig kunnen zoeken naar boeken en hun uitleenstatus kunnen bekijken.

## Opdracht 1 - Laravel Project beginnen

1. Start een nieuw Laravel project in Laravel Herd.
2. Kies voor "No Starter Kit"
3. Noem het project "bibliotheek"
4. Testing Framework: Pest
5. Install Laravel Boost: Ja
6. Initialize a Git repository: Ja
7. ga naar http://bibliotheek.test



## Opdracht 3 - Database ontwerp

Dit zijn de gegevens die we gaan opslaan.
- users (standaard Laravel users-tabel)
- books (titel, auteur, isbn, beschrijving)
- categories (naam, beschrijving)
- loans (uitleendatum, inleverdatum)

### Relaties

#### Users
Users ofwel gebruikers zijn bibliothecarissen, leden, balie medewerkers of collectiebeheerders.

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

## Userstories

### Requirements
- Zorg ervoor dat je seeders alle situaties (testdata) bevatten die je nodig hebt om onderstaande userstories te realiseren.
- Gebruik geen Laravel-code of features die nog niet in de les zijn behandeld.
- Gebruik ten minste 2 Blade-componenten in moderne syntax (bijvoorbeeld <x-layout> en <x-ui.card>).
- Neem basisstyling op via een centrale CSS-file die je in de layout laadt (geen Tailwind).
- Begin met de onderstaande stories; de stories uit "Later oppakken" komen in projectweek 6A nog niet aan bod.
- Maak per role eerst een overzichtspagina (index/read), en breid daarna pas uit met extra functionaliteit.
- Controleer na elke stap of je pagina's werken met je seeddata, zodat je problemen vroeg ontdekt.

#### Bibliothecaris
- [ ] Als bibliothecaris wil ik boeken kunnen zoeken op titel of auteur zodat ik snel kan vinden wat leden zoeken
- [ ] Als bibliothecaris wil ik kunnen zien welke boeken uitgeleend zijn zodat ik weet wat beschikbaar is

#### Bibliotheeklid
- [ ] Als lid wil ik kunnen zoeken naar boeken op titel zodat ik kan vinden wat ik wil lezen
- [ ] Als lid wil ik kunnen filteren op categorie zodat ik boeken in mijn interessegebied kan vinden
- [ ] Als lid wil ik kunnen zien of een boek beschikbaar is zodat ik weet of ik het kan lenen
- [ ] Als lid wil ik mijn uitgeleende boeken kunnen bekijken zodat ik weet wat ik terug moet brengen
- [ ] Als lid wil ik kunnen zien wanneer ik boeken moet inleveren zodat ik geen boete krijg

#### Balie Medewerker
- [ ] Als balie medewerker wil ik alle openstaande uitleningen kunnen zien zodat ik leden gericht kan helpen aan de balie

#### Collectiebeheerder
- [ ] Als collectiebeheerder wil ik per categorie kunnen zien welke boeken er zijn zodat de collectie overzichtelijk blijft
- [ ] Als collectiebeheerder wil ik kunnen zien welke boeken vaak uitgeleend zijn zodat ik kan bepalen welke titels we moeten uitbreiden

### Later oppakken (als formulieren en crud-operaties behandeld zijn)

#### Bibliothecaris
- [ ] Als bibliothecaris wil ik nieuwe boeken kunnen toevoegen met titel, auteur, ISBN en beschrijving zodat onze collectie up-to-date blijft
- [ ] Als bibliothecaris wil ik boekgegevens kunnen bewerken zodat informatie correct en actueel is
- [ ] Als bibliothecaris wil ik uitleen registraties kunnen maken zodat we bijhouden wie wat heeft geleend  
- [ ] Als bibliothecaris wil ik boeken kunnen categoriseren zodat leden makkelijker kunnen browsen

#### Balie Medewerker
- [ ] Als balie medewerker wil ik een uitleenregistratie kunnen koppelen aan een lid zodat boeken correct worden uitgeleend
- [ ] Als balie medewerker wil ik ingeleverde boeken kunnen verwerken zodat de beschikbaarheid direct weer klopt

#### Collectiebeheerder
- [ ] Als collectiebeheerder wil ik ontbrekende of onjuiste boekinformatie kunnen signaleren zodat bibliothecarissen dit kunnen corrigeren