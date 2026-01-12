# Project 5: Music

## Introductie

Muziekwinkel "De Notenkraker" wil graag een applicatie om haar leden te kunnen registeren en bij te kunnen houden. Daarnaast willen ze de verschillende muziekalbums die ze aanbieden dynamisch kunnen tonen op de site.

## Database eisen
De volgende gegevens zijn bekend over de data die opgeslagen gaat worden.

### Gebruikers

Er zijn twee rollen binnen deze applicatie: Medewerker en Lid. Dit zijn de gebruikers die de applicatie gaan gebruiken.
Alle gemeenschappelijke gegevens voor de gebruiker worden vastgelegd in de tabel users. 
Elke gebruiker heeft de volgende eigenschappen:
id, firstname, lastname, email, username en password en rol.
- Elke gebruiker heeft 1 rol.

### Rollen

Er zijn twee verschillende rollen. 
Rollen hebben de volgende eigenschappen:
- Member: member_number, last_login_date
- Employee: start_date, job_title

### Adres

Elk adres heeft de volgende eigenschappen:
street, housenumber, zipcode, city, country, phone en mobile. 
- Elke gebruiker heeft 1 adres en 1 adres hoort bij 1 gebruiker.

### Albums

Alle albums worden in één tabel vastgelegd albums. Dit is één tabel met alle albums die bekend zijn. Een album kan maar 1 keer voorkomen (uniek). 
Van een album wordt een title, artist, description, genre, release_year, price, tracks, image en een added_at vastgelegd. 
Afbeeldingen dienen opgeslagen te worden op de webserver en op de juiste wijze dynamisch getoond te worden.
- Er is geen relatie tussen albums en gebruiker

## Userstories

### Blok 3
1. Als een bezoeker wil ik een overzicht zien van alle beschikbare albums zodat ik snel kan bladeren door verschillende albums
2. Als een bezoeker wil ik basisinformatie zien van elk album (titel, artiest, thumbnail afbeelding) zodat ik een eerste indruk krijg zonder naar de detailpagina te hoeven gaan
3. Als bezoeker wil ik een website die mij meteen het gevoel geeft dat ik op een muziekwinkel website ben zodat ik direct weet dat ik op de juiste plek ben
4. Als een bezoeker wil ik op een album klikken zodat ik naar de detailpagina kan gaan voor meer informatie
5. Als een bezoeker wil ik kunnen filteren op genre (rock, pop, jazz, etc.) zodat ik albums kan vinden die passen bij mijn muzieksmaak
6. Als een bezoeker wil ik kunnen filteren op prijs (budget, gemiddeld, luxe) zodat ik albums kan vinden die passen bij mijn budget
7. Als een bezoeker wil ik kunnen sorteren op prijs (van laag naar hoog of hoog naar laag) zodat ik albums kan vinden die passen bij mijn budget

### Blok 4

#### Frontend
1. Als bezoeker wil ik een about page kunnen bekijken zodat ik kan lezen wat deze website te bieden heeft. Mobile-friendly
2. Als bezoeker wil ik dat minstens 3 pagina's waaronder de allereerste pagina goed te bekijken is op een mobiel. Mobile-friendly
3. Als lid wil ik op elke pagina een timer zien die aangeeft hoe lang ik op die pagina ben. Javascript

#### Backend
4. Als bezoeker wil ik kunnen zoeken door de database naar albums op basis van <nader te bepalen> -- Op basis waarvan zoeken?
5. Als lid wil ik kunnen inloggen zodat ik afgeschermde pagina's kan bekijken -- POST-request
6. Als lid wil ik mijn sessie kunnen beëindigen via een uitlog-link. -- GET-request
7. Als lid wil ik een dashboard kunnen bekijken met daarin statistieken <nader te bepalen> over de database. -- Welke statistieken?
8. Als lid wil ik een overzicht zien van mijn persoonlijke gegevens zodat ik weet welke gegevens van mij bekend zijn

9. Als medewerker wil ik een overzicht zien van alle albums in tabelvorm zodat ik weet welke albums opgeslagen zijn
10. Als medewerker wil ik elk album in detail kunnen bekijken zodat ik de gegevens kan controleren
11. Als medewerker wil ik een nieuw album kunnen opslaan zodat ik de database up-to-date houd
12. Als medewerker wil ik een afbeelding kunnen uploaden bij het aanmaken van een album zodat de cover ook netjes opgeslagen wordt

13. Als medewerker wil een overzicht zien van alle gebruikers met enkel voor- en achternaam zodat ik een snel overzicht heb
14. Als medewerker wil ik detailpagina's van gebruikers kunnen bekijken zodat ik zijn/haar gegevens kan ophalen
15. Als medewerker wil ik kunnen zoeken door de database naar gebruikers op basis van achternaam of email