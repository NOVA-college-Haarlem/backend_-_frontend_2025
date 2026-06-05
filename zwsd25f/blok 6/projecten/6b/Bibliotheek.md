# Project 1: Bibliotheek (6B - CRUD uitbreiding)

## Introductie

Je bouwt verder op je 6A Bibliotheek-project. In 6B maak je de applicatie interactief: data aanmaken, aanpassen en verwijderen, met rechten per rol.

## Startpunt

- Gebruik je bestaande 6A-project als basis.
- Controleer eerst of index en detailpagina's nog werken met seeddata.

## 6B opdrachten

## Opdracht 1 - Resource routes en controllers

1. Zet `books` om naar een resource route.
2. Maak of vul de standaard methodes aan: index, show, create, store, edit, update, destroy.
3. Laat categorieen en uitleningen op de book-detailpagina zichtbaar blijven.

## Opdracht 2 - CRUD boeken (bibliothecaris)

1. Maak formulier voor nieuw boek.
2. Valideer minimaal:
   - title required, min 2
   - author required, min 2
   - isbn required, unique
   - description nullable
3. Maak edit formulier en update flow.
4. Voeg delete met bevestiging toe.
5. Toon flash messages voor create, update en delete.

## Opdracht 3 - Categorieen koppelen (many-to-many)

1. Voeg formulier toe om een boek aan 1 of meer categorieen te koppelen.
2. Gebruik sync voor update van categorie-koppelingen.
3. Toon op category detail alle gekoppelde boeken met links.

## Opdracht 4 - Uitleningen beheren

1. Maak CRUD voor `loans` (minimaal create en update).
2. Balie medewerker kan een uitlening registreren:
   - user_id
   - book_id
   - loan_date
   - due_date
3. Balie medewerker kan een boek als ingeleverd markeren.
4. Validatie: due_date moet na of gelijk aan loan_date zijn.

## Opdracht 5 - Auth, middleware, rollen, gate, policy

1. Installeer Breeze als dit nog niet is gebeurd.
   Zie hiervoor expliciet de les Hoofdstuk 4 - Authenticatie en Middleware (Laravel Breeze).
2. Beveilig schrijf-routes met auth middleware.
3. Gate: `beheer-boeken` voor bibliothecaris.
4. Policy: alleen de maker van een uitlening of een bibliothecaris mag een uitlening aanpassen/verwijderen.

## 6B user stories

### Bibliothecaris
- [ ] Als bibliothecaris wil ik boeken kunnen toevoegen zodat de collectie up-to-date blijft.
- [ ] Als bibliothecaris wil ik boekgegevens kunnen bewerken zodat informatie correct blijft.
- [ ] Als bibliothecaris wil ik boeken kunnen verwijderen zodat verouderde records verdwijnen.
- [ ] Als bibliothecaris wil ik boeken aan categorieen kunnen koppelen zodat leden beter kunnen filteren.

### Balie medewerker
- [ ] Als balie medewerker wil ik een uitlening kunnen registreren zodat bekend is wie welk boek mee heeft.
- [ ] Als balie medewerker wil ik een uitlening kunnen afronden (ingeleverd) zodat beschikbaarheid klopt.

### Bibliotheeklid
- [ ] Als lid wil ik mijn actieve uitleningen en inleverdatum kunnen zien zodat ik boetes voorkom.

## Acceptatiecriteria

- Minimaal 2 volledige CRUD-entiteiten afgerond.
- Schrijf-acties beveiligd met auth en rolcontrole.
- Validatiefouten netjes per veld zichtbaar.
- Geen N+1 op kernoverzichten (gebruik eager loading).
