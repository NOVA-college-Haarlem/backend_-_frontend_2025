# Project 2: Library Management

## Book Collection

### Introductie

Bibliotheek "De Wijze Uil" wil graag een applicatie om haar leden te kunnen registeren en bij te kunnen houden. Daarnaast willen ze de verschillende boeken die ze in de collectie hebben dynamisch kunnen tonen op de site.

## Database eisen

De volgende gegevens zijn bekend over de data die opgeslagen gaat worden.

### Gebruikers

Er zijn twee rollen binnen deze applicatie: Medewerker en Lid.
Alle gemeenschappelijke gegevens voor de gebruiker worden vastgelegd in de tabel users.
Elke gebruiker heeft de volgende eigenschappen:
id, firstname, lastname, email, username en password en rol.

Elke gebruiker heeft 1 rol.

### Rollen

Er zijn twee verschillende rollen.
Rollen hebben de volgende eigenschappen:

Member: library_card_number, registration_date
Employee: start_date, specialization

### Adres

Elk adres heeft de volgende eigenschappen:
street, housenumber, zipcode, city, country, phone en mobile.

Elke gebruiker heeft 1 adres en 1 adres hoort bij 1 gebruiker.

### Boeken

Alle boeken worden in één tabel vastgelegd books. Dit is één tabel met alle boeken die bekend zijn. Een boektitel kan maar 1 keer voorkomen (uniek).
Van een boek wordt een title, category, pages, author, image en een added_at vastgelegd.

Er is geen relatie tussen boeken en gebruiker

## Userstories

### Blok 3
1. Als een bezoeker wil ik een overzicht zien van alle beschikbare boeken zodat ik snel kan bladeren door verschillende boeken
2. Als een bezoeker wil ik basisinformatie zien van elk boek (titel, categorie, thumbnail afbeelding) zodat ik een eerste indruk krijg zonder naar de detailpagina te hoeven gaan
3. Als bezoeker wil ik een website die mij meteen het gevoel geeft dat ik op een bibliotheek website ben zodat ik direct weet dat ik op de juiste plek ben
4. Als een bezoeker wil ik op een boek klikken zodat ik naar de detailpagina kan gaan voor meer informatie
5. Als een bezoeker wil ik kunnen filteren op categorie zodat ik boeken kan vinden die passen bij mijn interesses
6. Als een bezoeker wil ik kunnen filteren op aantal pagina's (kort, gemiddeld, lang) zodat ik boeken kan vinden die passen bij mijn leestijd
7. Als een bezoeker wil ik kunnen sorteren op aantal pagina's (van kort naar lang of lang naar kort) zodat ik boeken kan vinden die passen bij mijn beschikbare tijd

### Blok 4

#### Frontend
1. Als bezoeker wil ik een about page kunnen bekijken zodat ik kan lezen wat deze website te bieden heeft. Mobile-friendly
2. Als bezoeker wil ik dat minstens 3 pagina's waaronder de allereerste pagina goed te bekijken is op een mobiel. Mobile-friendly
3. Als lid wil ik op elke pagina een timer zien die aangeeft hoe lang ik op die pagina ben. Javascript

#### Backend
5. Als bezoeker wil ik kunnen zoeken door de database naar boeken op basis van titel, auteur of categorie
6. Als lid wil ik kunnen inloggen zodat ik afgeschermde pagina's kan bekijken -- POST-request
7. Als lid wil ik mijn sessie kunnen beëindigen via een uitlog-link. -- GET-request
8. Als lid wil ik een dashboard kunnen bekijken met daarin statistieken <nader te bepalen> over de database. -- Welke statistieken?
9. Als lid wil ik een overzicht zien van mijn persoonlijke gegevens zodat ik weet welke gegevens van mij bekend zijn

10. Als medewerker wil ik een overzicht zien van alle boeken in tabelvorm zodat ik weet welke boeken opgeslagen zijn
11. Als medewerker wil ik elk boek in detail kunnen bekijken zodat ik de gegevens kan controleren
12. Als medewerker wil ik een nieuw boek kunnen opslaan zodat ik de database up-to-date houd
13. Als medewerker wil ik een afbeelding kunnen uploaden bij het aanmaken van een boek zodat de cover ook netjes opgeslagen wordt

14. Als medewerker wil een overzicht zien van alle gebruikers met enkel voor- en achternaam zodat ik een snel overzicht heb
15. Als medewerker wil ik detailpagina's van gebruikers kunnen bekijken zodat ik zijn/haar gegevens kan ophalen
16. Als medewerker wil ik kunnen zoeken door de database naar gebruikers op basis van achternaam of email