# Bibliotheek (6B - CRUD uitbreiding)

## Introductie

Je bouwt verder op je 6A Bibliotheek-project. In 6B maak je de applicatie interactief: data aanmaken, aanpassen en verwijderen, met rechten per rol.

## Startpunt

- [ ] Ik heb mijn bestaande 6A-project geopend en kan het lokaal starten.
- [ ] Ik heb eerst gecontroleerd of index- en detailpagina's nog werken met seeddata.

## Commit-afspraak per checkbox

- [ ] Ik heb na elke afgevinkte checkbox precies 1 nieuwe commit gemaakt.
- [ ] De docent controleert mijn voortgang met `git log` op volgorde, inhoud en tijd van mijn commits.

## Korte begrippen in dit project

- Resource route (een routepakket met standaard CRUD-routes)
- Controller (bestand met logica tussen route en view)
- Many-to-many (veel-op-veel-relatie tussen twee tabellen)
- Sync (methode die gekoppelde records in een keer vervangt)
- Middleware (controlelaag voor routes, zoals inloggen verplicht)
- Gate (centrale rechtencheck)
- Policy (rechtencheck op 1 specifiek record)

## Verplichte opdrachten

### Routes en controllers
- [ ] Ik heb `books` omgezet naar een resource route.
- [ ] Ik heb in de controller de methodes index, show, create, store, edit, update en destroy.
- [ ] Op de boek-detailpagina blijven categorieen en uitleningen zichtbaar.

### CRUD boeken (bibliothecaris)
- [ ] Ik heb een formulier voor een nieuw boek gemaakt.
- [ ] Ik heb gevalideerd met regel: `title` required min 2.
- [ ] Ik heb gevalideerd met regel: `author` required min 2.
- [ ] Ik heb gevalideerd met regel: `isbn` required unique.
- [ ] Ik heb gevalideerd met regel: `description` nullable.
- [ ] Ik heb een edit-formulier en update-flow gemaakt.
- [ ] Ik heb een delete-actie met bevestiging toegevoegd.
- [ ] Ik heb flash messages bij create, update en delete gemaakt.

### Categorieen koppelen
- [ ] Ik heb een boek aan 1 of meer categorieen gekoppeld.
- [ ] Ik heb sync bij het updaten van categorie-koppelingen gebruikt.
- [ ] Ik heb op category detail alle gekoppelde boeken met links getoond.

### Uitleningen beheren
- [ ] Ik heb create en update voor `loans` gemaakt.
- [ ] Ik heb ervoor gezorgd dat een balie medewerker een uitlening kan registreren met `user_id`, `book_id`, `loan_date` en `due_date`.
- [ ] Ik heb ervoor gezorgd dat een balie medewerker een uitlening kan afronden (ingeleverd).
- [ ] Ik heb gevalideerd met regel: `due_date` komt na of is gelijk aan `loan_date`.

### Zoeken en filteren
- [ ] Ik heb een zoekopdracht op titel en auteur toegevoegd.
- [ ] Ik heb een filter op categorie toegevoegd op de boeken-index.

### Auth en autorisatie
- [ ] Als Breeze nog ontbreekt, doorloop ik eerst Hoofdstuk 4 - Authenticatie en Middleware (Laravel Breeze).
- [ ] Ik heb schrijf-routes met auth middleware beveiligd.
- [ ] Ik heb gate beheer-boeken voor bibliothecaris-acties gebruikt.
- [ ] Ik heb een policy gebruikt zodat alleen maker of bibliothecaris een uitlening mag aanpassen/verwijderen.

## Plusopdrachten (extra)

- [ ] Ik heb waarschuwing toegevoegd voor bijna te late inleverdatum.

## User stories 6B

### Bibliothecaris
- [ ] Als bibliothecaris wil ik boeken kunnen toevoegen zodat de collectie up-to-date blijft.
- [ ] Als bibliothecaris wil ik boekgegevens kunnen bewerken zodat informatie correct blijft.
- [ ] Als bibliothecaris wil ik boeken kunnen verwijderen zodat verouderde records verdwijnen.
- [ ] Als bibliothecaris wil ik boeken aan categorieen kunnen koppelen zodat leden beter kunnen filteren.

### Balie medewerker
- [ ] Als balie medewerker wil ik een uitlening kunnen registreren zodat bekend is wie welk boek mee heeft.
- [ ] Als balie medewerker wil ik een uitlening kunnen afronden zodat beschikbaarheid klopt.

### Bibliotheeklid
- [ ] Als lid wil ik mijn actieve uitleningen en inleverdatum kunnen zien zodat ik boetes voorkom.

## Acceptatiecriteria

- [ ] Ik heb aangetoond dat `books` volledige CRUD heeft met validatie en flash messages.
- [ ] Ik heb aangetoond dat `loans` aangemaakt en afgerond worden met correcte datumvalidatie (`due_date` na of gelijk aan `loan_date`).
- [ ] Ik heb aangetoond dat boeken aan categorieen gekoppeld worden, met sync geupdatet worden, en op detail zichtbaar zijn.
- [ ] Ik heb aangetoond dat zoeken op titel/auteur en filteren op categorie werkt op de boeken-index.
- [ ] Ik heb aangetoond dat schrijfacties correct afgeschermd zijn met auth middleware, gate `beheer-boeken` en policy op uitleningen.
