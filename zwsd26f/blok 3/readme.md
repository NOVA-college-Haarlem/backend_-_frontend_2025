# Project Recepten

## Introductie

Voor een kookwebsite worden verschillende recepten bijgehouden.

## Start project

1. Ga naar https://github.com/NOVA-college-Haarlem/project-blok3a-25f/tree/main
2. Maak een fork van het project (met alle defaultinstellingen)
3. Kopieer het git-adres (Code -> HTTPS -> copy)
4. Open (in VS Code) een terminal in de map Projecten.
5. Terminal: `git clone <paste-git-adres>`
6. Terminal: `cd project-blok3a-25f` (open de map die zojuist is aangemaakt )
7. Open Docker Desktop en stop alle containers
8. Terminal: `docker compose up -d`
9. De website is nu beschikbaar op http://localhost
10. PhpMyAdmin is nu beschikbaar op http://localhost:8000
11. PhpMyAdmin: klik op database `project_blok3a` en selecteer het tabblad "SQL"
12. Kopieer de code uit `sql/recipes.sql` en voer de code uit in PhpMyAdmin. Je hebt nu een werkende website en een werkende database.

## Userstories

1. Als een bezoeker wil ik een overzicht zien van alle beschikbare recepten zodat ik snel kan bladeren door verschillende recepten
2. Als een bezoeker wil ik basisinformatie zien van elk gerecht (naam, categorie, thumbnail afbeelding) zodat ik een eerste indruk krijg zonder naar de detailpagina te hoeven gaan
3. Als bezoeker wil ik een website die mij meteen het gevoel geeft dat ik op een restaurant website ben zodat ik direct weet dat ik op de juiste plek ben
4. Als een bezoeker wil ik op een gerecht klikken zodat ik naar de detailpagina kan gaan voor meer informatie
5. Als een bezoeker wil ik kunnen filteren op categorie (voorgerecht, hoofdgerecht, dessert) zodat ik recepten kan vinden die passen bij mijn voorkeur
6. Als een bezoeker wil ik kunnen filteren op prijs (budget, gemiddeld, luxe) zodat ik recepten kan vinden die passen bij mijn budget
7. Als een bezoeker wil ik kunnen sorteren op prijs (van laag naar hoog of hoog naar laag) zodat ik recepten kan vinden die passen bij mijn budget
