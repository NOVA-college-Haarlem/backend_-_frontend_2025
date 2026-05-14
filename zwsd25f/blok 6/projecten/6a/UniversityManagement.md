# Project 6: University Management

## Introductie

De lokale universiteit wil graag een applicatie om hun studenten, docenten, cursussen en inschrijvingen te kunnen beheren. Daarnaast willen ze dat studenten eenvoudig kunnen zoeken naar cursussen en hun studievoortgang kunnen bekijken.

## Opdracht 1 - Laravel Project beginnen

1. Start een nieuw Laravel project in Laravel Herd.
2. Kies voor "No Starter Kit"
3. Noem het project "universitymanagement"
4. Testing Framework: Pest
5. Install Laravel Boost: Ja
6. Initialize a Git repository: Ja
7. ga naar http://universitymanagement.test



## Opdracht 3 - Database ontwerp

Dit zijn de gegevens die we gaan opslaan.
- users (standaard Laravel users-tabel)
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

## Userstories

### Requirements
- Zorg ervoor dat je seeders alle situaties (testdata) bevatten die je nodig hebt om onderstaande userstories te realiseren.
- Gebruik geen Laravel-code of features die nog niet in de les zijn behandeld.
- Gebruik ten minste 2 Blade-componenten in moderne syntax (bijvoorbeeld <x-layout> en <x-ui.card>).
- Neem basisstyling op via een centrale CSS-file die je in de layout laadt (geen Tailwind).
- Maak gerelateerde gegevens klikbaar: toon je bijvoorbeeld een categorie, gebruiker of locatie, dan link je door naar de bijbehorende detailpagina.
- Begin met de onderstaande stories; de stories uit "Later oppakken" komen in projectweek 6A nog niet aan bod.
- Maak per role eerst een overzichtspagina (index/read), en breid daarna pas uit met extra functionaliteit.
- Controleer na elke stap of je pagina's werken met je seeddata, zodat je problemen vroeg ontdekt.

#### Algemene gebruiker
- [ ] Als gebruiker wil ik een navigatiemenu zien met links naar alle entiteiten zodat ik snel door de applicatie kan navigeren.
- [ ] Als gebruiker wil ik kunnen zien op welke pagina ik ben (actief menu-item) zodat ik altijd context heb.
- [ ] Als gebruiker wil ik op elke pagina een footer zien met projectnaam en klas/groep zodat de layout compleet en consistent is.
- [ ] Als gebruiker wil ik vanaf een overzicht naar een detailpagina kunnen klikken zodat ik meer informatie per item kan bekijken.
- [ ] Als gebruiker wil ik een duidelijke melding zien als er geen data is zodat ik begrijp waarom een lijst leeg is.
- [ ] Als gebruiker wil ik dat de applicatie goed leesbaar en bruikbaar is op mobiel.

#### Studieadviseur
- [ ] Als studieadviseur wil ik studievoortgang kunnen bekijken zodat ik studenten kan adviseren
- [ ] Als studieadviseur wil ik op de detailpagina van een student alle inschrijvingen en cijfers zien zodat ik gericht studieadvies kan geven

#### Student
- [ ] Als student wil ik beschikbare cursussen kunnen bekijken zodat ik weet wat ik kan volgen
- [ ] Als student wil ik mijn inschrijvingen kunnen bekijken zodat ik weet waar ik aan deelneem
- [ ] Als student wil ik mijn cijfers kunnen zien zodat ik mijn voortgang kan bijhouden
- [ ] Als student wil ik op de detailpagina van een cursus de docent en mijn inschrijfstatus zien zodat ik weet wat ik kan verwachten

#### Docent
- [ ] Als docent wil ik mijn cursussen kunnen bekijken zodat ik weet wat ik moet geven
- [ ] Als docent wil ik ingeschreven studenten kunnen zien zodat ik weet wie er komen
- [ ] Als docent wil ik op de detailpagina van een cursus de gekoppelde cijfers zien zodat ik de voortgang van de groep kan monitoren

#### Faculteits Manager
- [ ] Als manager wil ik student statistieken kunnen bekijken zodat ik trends kan identificeren

### Later oppakken (als formulieren en crud-operaties behandeld zijn)

#### Studieadviseur
- [ ] Als studieadviseur wil ik nieuwe studenten kunnen registreren met persoonlijke gegevens zodat ze kunnen studeren
- [ ] Als studieadviseur wil ik studenten kunnen inschrijven voor cursussen zodat ze kunnen deelnemen
- [ ] Als studieadviseur wil ik cijfers kunnen invoeren zodat studenten hun resultaten kunnen zien

#### Student
- [ ] Als student wil ik mijn persoonlijke gegevens kunnen updaten zodat deze actueel blijven

#### Docent
- [ ] Als docent wil ik cijfers kunnen invoeren zodat studenten hun resultaten kunnen zien
- [ ] Als docent wil ik cursusmateriaal kunnen toevoegen zodat studenten kunnen studeren

#### Faculteits Manager
- [ ] Als manager wil ik nieuwe cursussen kunnen aanmaken zodat het aanbod compleet is
- [ ] Als manager wil ik docenten kunnen toewijzen aan cursussen zodat er altijd begeleiding is
- [ ] Als manager wil ik roosters kunnen beheren zodat er geen overlap is