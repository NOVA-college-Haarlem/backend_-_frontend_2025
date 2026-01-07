# Project 6: University Management

## Introductie

De lokale universiteit wil graag een applicatie om hun studenten, docenten, cursussen en inschrijvingen te kunnen beheren. Daarnaast willen ze dat studenten eenvoudig kunnen zoeken naar cursussen en hun studievoortgang kunnen bekijken.

## Opdracht 1 - Laravel Project beginnen

1. Start een nieuw Laravel project in Laravel Herd.
2. Kies voor het gebruik van Laravel Breeze voor authenticatie
3. Noem het project "universitymanagement"
4. Kies Blade voor de frontend
5. Testing Framework: PHPUnit
6. Target location: _hoef je niet te kiezen_
7. ga naar http://universitymanagement.test

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
DB_DATABASE=universitymanagement
DB_USERNAME=root
DB_PASSWORD=password
```

## Userstories

### Studieadviseur
- [ ] Als studieadviseur wil ik nieuwe studenten kunnen registreren met persoonlijke gegevens zodat ze kunnen studeren
- [ ] Als studieadviseur wil ik studievoortgang kunnen bekijken zodat ik studenten kan adviseren
- [ ] Als studieadviseur wil ik studenten kunnen inschrijven voor cursussen zodat ze kunnen deelnemen
- [ ] Als studieadviseur wil ik cijfers kunnen invoeren zodat studenten hun resultaten kunnen zien

### Student
- [ ] Als student wil ik beschikbare cursussen kunnen bekijken zodat ik weet wat ik kan volgen
- [ ] Als student wil ik mijn inschrijvingen kunnen bekijken zodat ik weet waar ik aan deelneem
- [ ] Als student wil ik mijn cijfers kunnen zien zodat ik mijn voortgang kan bijhouden
- [ ] Als student wil ik mijn persoonlijke gegevens kunnen updaten zodat deze actueel blijven

### Docent
- [ ] Als docent wil ik mijn cursussen kunnen bekijken zodat ik weet wat ik moet geven
- [ ] Als docent wil ik ingeschreven studenten kunnen zien zodat ik weet wie er komen
- [ ] Als docent wil ik cijfers kunnen invoeren zodat studenten hun resultaten kunnen zien
- [ ] Als docent wil ik cursusmateriaal kunnen toevoegen zodat studenten kunnen studeren

### Faculteits Manager
- [ ] Als manager wil ik nieuwe cursussen kunnen aanmaken zodat het aanbod compleet is
- [ ] Als manager wil ik docenten kunnen toewijzen aan cursussen zodat er altijd begeleiding is
- [ ] Als manager wil ik student statistieken kunnen bekijken zodat ik trends kan identificeren
- [ ] Als manager wil ik roosters kunnen beheren zodat er geen overlap is

## Opdracht 3 - Database ontwerp

Dit zijn de gegevens die we gaan opslaan.
- users (Laravel Breeze)
- students (naam, studentnummer, studie)
- teachers (naam, specialisatie, faculteit)
- courses (naam, beschrijving, studiepunten)
- enrollments (datum, status)
- grades (cijfer, datum)

### Relaties

#### Users
Users ofwel gebruikers zijn studieadviseurs, docenten, faculteits managers of studenten.

#### Students
Een student kan meerdere inschrijvingen hebben.
Een student kan meerdere cijfers hebben.

#### Teachers
Een docent heeft één faculteit.
Een docent kan meerdere cursussen geven.
Een docent kan meerdere cijfers toekennen.

#### Courses
Een cursus heeft één docent.
Een cursus kan meerdere inschrijvingen hebben.
Een cursus kan meerdere cijfers hebben.

#### Enrollments
Een inschrijving heeft één student.
Een inschrijving heeft één cursus.

#### Grades
Een cijfer heeft één student.
Een cijfer heeft één cursus.
Een cijfer heeft één docent.

## Opdracht 4 - Migrations maken

1. Maak via de `php artisan` commando de migrations aan. 
    > `php artisan make:migration create_students_table`
2. Zorg ervoor dat je alle attributen uit je database ontwerp hebt meegenomen.
3. Controleer of de migrations zijn aangemaakt.
4. Laat je migrations door de docent goedkeuren.

## Opdracht 5 - Models maken

1. Maak via de `php artisan` commando de models aan. Deze zijn altijd in enkelvoud en in het Engels.
   > `php artisan make:model Student`
2. Laat je models door de docent goedkeuren.

## Opdracht 6 - Seeding

1. Maak via de `php artisan` commando de seeders aan.
    > `php artisan make:seeder StudentsSeeder`
2. Zorg ervoor dat alle niet-verplichte kolommen zijn voorzien van een default waarde of een nullable waarde.
3. Probeer de database te seeden.
4. Laat je seeders door de docent goedkeuren.

## Opdracht 7 - Userstories maken

Realiseer de userstories.