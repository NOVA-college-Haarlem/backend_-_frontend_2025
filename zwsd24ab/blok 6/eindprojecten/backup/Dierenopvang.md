# Project 2: Dierenasiel

## Introductie

Dierenasiel "De Struisvogel" wil graag een applicatie om haar leden te kunnen registeren en bij te kunnen houden. Daarnaast willen ze de verschillende dieren die ze aanbieden dynamisch kunnen tonen op de site.

## Opdracht 1 - Laravel Project beginnen

1. Start een nieuw Laravel project in Laravel Herd.
2. Kies voor het gebruik van Laravel Breeze voor authenticatie
3. Noem het project "dierenasiel"
4. Kies Blade voor de frontend
5. Testing Framework: PHPUnit
6. Target location: _hoef je niet te kiezen_
7. ga naar http://dierenasiel.test om je site te bezoeken

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
DB_DATABASE=dierenasiel
DB_USERNAME=root
DB_PASSWORD=password
```

## Userstories

### Dierenbeheer
- [ ] nieuwe dieren kunnen toevoegen aan het systeem zodat we hun informatie kunnen bijhouden
- [ ] diergegevens kunnen bewerken om informatie actueel te houden
- [ ] dieren kunnen verwijderen uit het systeem wanneer ze geadopteerd zijn
- [ ] basisinformatie van dieren kunnen registreren (naam, soort, ras, leeftijd, geslacht)
- [ ] een overzicht kunnen zien van alle dieren in het asiel
- [ ] dieren kunnen filteren op verschillende eigenschappen
- [ ] dieren kunnen categoriseren voor een beter overzicht

### Adoptiebeheer
- [ ] nieuwe adoptieaanvragen kunnen registreren
- [ ] de status van adoptieaanvragen kunnen bijwerken
- [ ] contactgegevens van aanvragers kunnen beheren
- [ ] een overzicht kunnen zien van alle lopende adoptieaanvragen
- [ ] adoptiehistorie per dier kunnen inzien

### Medisch Beheer
- [ ] medische behandelingen kunnen registreren per dier
- [ ] medische behandelingen kunnen bewerken
- [ ] medische behandelingen kunnen verwijderen
- [ ] de medische geschiedenis van een dier kunnen inzien
- [ ] alerts krijgen wanneer medische behandelingen nodig zijn
- [ ] medische notities kunnen toevoegen aan een dier
- [ ] Een medische behandeling heeft een type zoals vaccinatie, medicijn, behandeling, etc.

### Voedingsbeheer
- [ ] voedingsschema's kunnen aanmaken per dier
- [ ] voedingsschema's kunnen aanpassen indien nodig
- [ ] kunnen zien welke dieren wanneer gevoerd moeten worden
- [ ] speciale dieetwensen kunnen registreren
- [ ] voedingshistorie kunnen bijhouden


## Opdracht 3 - Database ontwerp

Dit zijn de gegevens die we gaan opslaan.
- users (Laravel Breeze).
- animals (naam, soort, ras, leeftijd, geslacht)
- adopters (naam, email, telefoonnummer)
- adoption_applications (status, aanvraagdatum)
- medical_treatments (behandeling, datum, type)
- allergies (allergie, ernst)
- dietary_needs (dieet_type, beschrijving)

### Relaties

#### Users
Users ofwel gebruikers zijn medewekers of mensen die een dier willen adopteren.

#### Animals
Een dier kan meerdere medische behandelingen hebben.
Een dier kan meerdere allergieën hebben.
Een dier kan meerdere dieetbehoeften hebben.
Een dier kan meerdere adoptieaanvragen hebben.

#### Adopters
Een eigenaar kan meerdere dieren hebben.
Een eigenaar heeft een gebruikersaccount.
Een adopter kan meerdere adoptieaanvragen hebben.

#### Medical_treatments
Een medische behandeling kan bij meerdere dieren horen.
Een medische behandeling heeft een type.

#### Medical_treatments_types
Een medische behandelingstype kan meerdere medische behandelingen hebben.

#### Allergies
Een allergie kan bij meerdere dieren horen.

#### Dietary_needs
Een dieetbehoefte kan bij meerdere dieren horen.

## Opdracht 4 - Migrations maken

1. Maak via de `php artisan` commando de migrations aan. 
   > `php artisan make:migration create_animals_table`
2. Zorg ervoor dat je alle attributen uit je database ontwerp hebt meegenomen.
3. Controleer of de migrations zijn aangemaakt.
4. Laat je migrations door de docent goedkeuren.

## Opdracht 5 - Models maken

1. Maak via de `php artisan` commando de models aan. Deze zijn altijd in enkelvoud en in het Engels.
   > `php artisan make:model Animal`
2. Laat je models door de docent goedkeuren.

## Opdracht 6 - Seeding

1. Maak via de `php artisan` commando de seeders aan.
   > `php artisan make:seeder AnimalsSeeder`
2. Zorg ervoor dat alle niet-verplichte kolommen zijn voorzien van een default waarde of een nullable waarde.
3. Probeer de database te seeden.
4. Laat je seeders door de docent goedkeuren.

## Opdracht 7 - Userstories maken

Realiseer de userstories.
