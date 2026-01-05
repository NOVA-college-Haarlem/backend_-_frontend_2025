# Project 1: Kinderopvang

## Introductie

Kinderopvang "De Gouden Lepel" wil graag een applicatie om haar leden te kunnen registeren en bij te kunnen houden. Daarnaast willen ze de verschillende kinderen die ze aanbieden dynamisch kunnen tonen op de site.

## Opdracht 1 - Laravel Project beginnen

1. Start een nieuw Laravel project in Laravel Herd.
2. Kies voor het gebruik van Laravel Breeze voor authenticatie
3. Noem het project "kinderopvang"
4. Kies Blade voor de frontend
5. Testing Framework: PHPUnit
6. Target location: _hoef je niet te kiezen_
7. ga naar http://kinderopvang.test

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
DB_DATABASE=kinderopvang
DB_USERNAME=root
DB_PASSWORD=password
```

## Userstories

### Kinderenbeheer
- [ ] nieuwe kinderen kunnen toevoegen aan het systeem zodat we hun informatie kunnen bijhouden
- [ ] kindergegevens kunnen bewerken om informatie actueel te houden
- [ ] kinderen kunnen verwijderen uit het systeem wanneer ze uitgeschreven zijn
- [ ] basisinformatie van kinderen kunnen registreren (naam, leeftijd, geslacht)
- [ ] een overzicht kunnen zien van alle kinderen in de opvang
- [ ] kinderen kunnen filteren op verschillende eigenschappen (leeftijd, groep)
- [ ] kinderen kunnen indelen in groepen voor een beter overzicht

### Groepenbeheer
- [ ] groepen kunnen toevoegen aan het systeem zodat we hun informatie kunnen bijhouden
- [ ] groepen kunnen bewerken om informatie actueel te houden
- [ ] groepen kunnen verwijderen uit het systeem wanneer ze uitgeschreven zijn
- [ ] basisinformatie van groepen kunnen registreren (naam, leeftijdsgroep)
- [ ] een overzicht kunnen zien van alle groepen in de opvang
- [ ] groepen kunnen filteren op verschillende eigenschappen (leeftijd, groep)
- [ ] groepen kunnen indelen in groepen voor een beter overzicht

### Oudersbeheer
- [ ] ouders kunnen toevoegen aan het systeem zodat we hun informatie kunnen bijhouden
- [ ] ouders kunnen bewerken om informatie actueel te houden
- [ ] ouders kunnen verwijderen uit het systeem wanneer ze uitgeschreven zijn
- [ ] basisinformatie van ouders kunnen registreren (naam, email, telefoonnummer)
- [ ] een overzicht kunnen zien van alle ouders in de opvang
- [ ] ouders kunnen filteren op verschillende eigenschappen (naam, email, telefoonnummer)

### Medisch Beheer
- [ ] medische behandelingen kunnen registreren per kind
- [ ] medische behandelingen kunnen bewerken
- [ ] medische behandelingen kunnen verwijderen
- [ ] de medische geschiedenis van een kind kunnen inzien
- [ ] alerts krijgen wanneer medische behandelingen nodig zijn
- [ ] medische notities kunnen toevoegen aan een kind
- [ ] Een medische behandeling heeft een type zoals vaccinatie, medicijn, behandeling, etc.

### Voedingsbeheer
- [ ] dieetbehoeften kunnen registreren per kind
- [ ] voedingsschema's kunnen aanmaken per kind
- [ ] voedingsschema's kunnen aanpassen indien nodig



## Opdracht 3 - Database ontwerp

Dit zijn de gegevens die we gaan opslaan.
- users (Laravel Breeze).
- children (naam, geboortedatum, geslacht)
- parents (naam, email, telefoonnummer)
- groups (naam, leeftijdsgroep)
- medical_treatments (behandeling, datum, type)
- allergies (allergie, ernst)
- dietary_needs (dieet_type, beschrijving)


### Relaties

#### Users
Users ofwel gebruikers zijn medewekers of ouders.

#### Parents
Een ouder kan meerdere kinderen hebben.
Een ouder heeft een gebruikersaccount.

#### Children
Een kind zit in een groep.
Een kind heeft 1 of meerdere ouders.
Een kind kan meerdere medische behandelingen hebben.
Een kind kan meerdere allergieën hebben.
Een kind kan meerdere dieetbehoeften hebben.

#### Groups
Een groep kan meerdere kinderen hebben.

#### Medical_treatments
Een medische behandeling kan bij meerdere kinderen horen.
Een medische behandeling heeft een type.

#### Medical_treatments_types
Een medische behandelingstype kan meerdere medische behandelingen hebben.

#### Allergies
Een allergie kan bij meerdere kinderen horen.

#### Dietary_needs
Een dieetbehoefte kan bij meerdere kinderen horen.


1. maak een database ontwerp volgens de richtlijnen van de docent
2. maak een database schema volgens de richtlijnen van de docent
3. maak een database ERD volgens de richtlijnen van de docent
4. maak een database SQL dump file volgens de richtlijnen van de docent


## Opdracht 4 - Migrations maken

1. Maak via de `php artisan` commando de migrations aan. 
    > `php artisan make:migration create_children_table`
2. Zorg ervoor dat je alle attributen uit je database ontwerp hebt meegenomen.
3. Controleer of de migrations zijn aangemaakt.
4. Laat je migrations door de docent goedkeuren.

## Opdracht 5 - Models maken

1. Maak via de `php artisan` commando de models aan. Deze zijn altijd in enkelvoud en in het Engels.
   > `php artisan make:model Child`
2. Laat je models door de docent goedkeuren.

## Opdracht 6 - Seeding

1. Maak via de `php artisan` commando de seeders aan.
    > `php artisan make:seeder ChildrenSeeder`
2. Zorg ervoor dat alle niet-verplichte kolommen zijn voorzien van een default waarde of een nullable waarde.
3. Probeer de database te seeden.
4. Laat je seeders door de docent goedkeuren.

## Opdracht 7 - Userstories maken

Realiseer de userstories.


