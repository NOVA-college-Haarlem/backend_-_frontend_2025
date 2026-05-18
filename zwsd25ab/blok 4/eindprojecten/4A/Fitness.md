# Project 1: Fitness

## Introductie

Fitnessbedrijf "Work4Me" wil graag een applicatie om haar leden te kunnen registeren en bij te kunnen houden. Daarnaast willen ze de verschillende workouts die ze aanbieden dynamisch kunnen tonen op de site. 

## Project setup

1. Kloon op Github het project [Docker Template](https://github.com/NOVA-college-Haarlem/docker-template) (je kunt de default settings aanhouden). 
2. Kopieer de URL van de repository (via de groene knop "Code").
2. Open de map waarin je je projecten bewaart met VS Code. 
3. Open de terminal en run `git clone <PASTE URL>`
4. In de Windows Verkenner (File Explorer): verander de naam "docker-template" naar de naam van je project, bijvoorbeeld "fitness" of "library".
5. Open dit project in VS Code.
6. In `.env` verander de naam `MYSQL_DATABASE` van "testdb" naar de naam van je project.
7. Open de terminal en run `docker compose up -d`.
8. Je website draait nu op http://localhost en PhpMyAdmin op http://localhost:8000/.

## Database eisen
De volgende gegevens zijn bekend over de data die opgeslagen gaat worden.

### Gebruikers

- Er zijn twee rollen binnen deze applicatie: Medewerker en Lid. Dit zijn de gebruikers die de applicatie gaan gebruiken.
- Alle gemeenschappelijke gegevens voor de gebruiker worden vastgelegd in de tabel `users`. 
- Elke gebruiker heeft de volgende eigenschappen:
`id`, `firstname`, `lastname`, `email`, `username`, `password` en `rol`.
- Elke gebruiker heeft 1 rol. 
- Schrijf met behulp van AI de SQL om de tabel `users` aan te maken met 10 verschillende gebruikers.

### Rollen

Er zijn twee verschillende rollen. 
Rollen hebben de volgende eigenschappen:
- **Employee**: `start_date`, `job_title`
- **Member**: `member_number`, `last_login_date`

Voeg deze vier velden toe aan de database `users`. Bij een medewerker worden alleen de employee-velden gevuld, bij een lid alleen de member-velden.

### Adres

- Elk adres heeft de volgende eigenschappen:
`street`, `housenumber`, `zipcode`, `city`, `country`, en `phone`. 
- Elke gebruiker heeft 1 adres en 1 adres hoort bij 1 gebruiker.
- Maak deze tabel aan.

### Workouts

- Alle workouts (bijv. hardlopen, zwemmen, fitness, gewichtsheffen of fietsen) worden in één tabel vastgelegd workouts. Dit is één tabel met alle workouts die bekend zijn. 
- Een workout kan maar 1 keer voorkomen (uniek). 
- Van een workout wordt een `title`, `description`, `duration`, `note`, `image` en een `added_at` vastgelegd. 
- Afbeeldingen dienen opgeslagen te worden op de webserver en op de juiste wijze dynamisch getoond te worden.
- Er is geen relatie tussen workouts en gebruiker

## Userstories

### Blok 3 (pas de kennis van blok 3 toe)
1. Als een bezoeker wil ik een overzicht zien van alle beschikbare fitnesslessen zodat ik snel kan bladeren door verschillende lessen   
2. Als een bezoeker wil ik basisinformatie zien van elke les (naam, type, thumbnail afbeelding) zodat ik een eerste indruk krijg zonder naar de detailpagina te hoeven gaan
3. Als bezoeker wil ik een website die mij meteen het gevoel geeft dat ik op een fitness website ben zodat ik direct weet dat ik op de juiste plek ben.
4. Als een bezoeker wil ik op een les klikken zodat ik naar de detailpagina kan gaan voor meer informatie
5. Als een bezoeker wil ik kunnen filteren op moeilijkheidsgraad (beginner, gemiddeld, gevorderd) zodat ik lessen kan vinden die passen bij mijn fitnessniveau
6. Als een bezoeker wil ik kunnen filteren op duur (15 minuten, 30 minuten, 45 minuten, 60 minuten) zodat ik lessen kan vinden die passen bij mijn tijd beschikbaarheid
7. Als een bezoeker wil ik kunnen sorteren op duur (van kort naar lang of lang naar kort) zodat ik lessen kan vinden die passen bij de tijd die ik beschikbaar heb

### Blok 4

#### Frontend
1. Als bezoeker wil ik een about page kunnen bekijken zodat ik kan lezen wat deze website te bieden heeft.    Mobile-friendly
2. Als bezoeker wil ik dat minstens 3 pagina’s waaronder de allereerste pagina goed te bekijken is op een mobiel.    Mobile-friendly
3. Bonus: Als lid wil ik op elke pagina een timer zien die aangeeft hoe lang ik op die pagina ben. Javascript

#### Backend
4. Als bezoeker wil ik kunnen zoeken door de database naar workouts.
5. Als lid wil ik kunnen inloggen zodat ik afgeschermde pagina’s kan bekijken     -- POST-request
6. Als lid wil ik mijn sessie kunnen beëindigen via een uitlog-link. -- GET-request
7. Als lid wil ik een dashboard kunnen bekijken met daarin statistieken <nader te bepalen> over de database. -- Welke statistieken?
8. Als lid wil ik een overzicht zien van mijn persoonlijke gegevens zodat ik weet welke gegevens van mij bekend zijn.    

9.  Als medewerker wil ik een overzicht zien van alle workouts in tabelvorm zodat ik weet welke workouts opgeslagen zijn.
10. Als medewerker wil ik elke workout in detail kunnen bekijken zodat ik de gegevens kan controleren.
11. Als medewerker wil ik een nieuwe workout kunnen opslaan zodat ik de database up-to-date houd
12. Bonus: Als medewerker wil ik een afbeelding kunnen uploaden bij het aanmaken van een workout zodat de poster ook netjes opgeslagen wordt

13. Als medewerker wil een overzicht zien van alle gebruikers met enkel voor- en achternaam zodat ik een snel overzicht heb.
14. Als medewerker wil ik detailpagina’s van gebruikers kunnen bekijken zodat ik zijn/haar gegevens kan ophalen.
15. Als medewerker wil ik kunnen zoeken door de database naar gebruikers op basis van achternaam of email.