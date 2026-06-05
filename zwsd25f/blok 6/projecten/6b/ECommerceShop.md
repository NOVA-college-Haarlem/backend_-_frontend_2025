# Project 2: ECommerceShop (6B - CRUD uitbreiding)

## Introductie

Je bouwt verder op je 6A ECommerceShop-project. In 6B voeg je volledige beheerflows en klantinteractie toe met CRUD, autorisatie en policies.

## 6B opdrachten

## Opdracht 1 - Productbeheer via resource controller

1. Gebruik resource routes voor `products`.
2. Maak complete CRUD voor producten.
3. Valideer minimaal:
   - name required
   - price required numeric min 0
   - stock required integer min 0
   - description nullable

## Opdracht 2 - Categorieen en voorraad

1. Koppel producten aan meerdere categorieen.
2. Voeg filter op categorie toe op product index.
3. Voeg zoekfunctie op productnaam toe.
4. Voeg eenvoudige voorraadstatus toe op detailpagina (op voorraad / bijna op / uitverkocht).

## Opdracht 3 - Reviews door klanten

1. Ingelogde klanten kunnen review plaatsen (rating 1-5, comment).
2. Toon reviews op product detail met auteur en datum.
3. Policy: alleen review-eigenaar of admin mag verwijderen.

## Opdracht 4 - Bestelstatus beheren

1. Maak update-flow voor order status (bijvoorbeeld pending, packed, shipped, delivered, canceled).
2. Customer service mag status bijwerken.
3. Warehouse mag alleen packed/shipped zetten.
4. Valideer toegestane statusovergangen.

## Opdracht 5 - Auth en autorisatie

1. Gebruik je nog geen Breeze? Werk dan eerst de les Hoofdstuk 4 - Authenticatie en Middleware (Laravel Breeze) door.
1. Beveilig create/edit/delete routes voor producten met auth.
2. Gate: `beheer-producten` voor shop owner.
3. Gate: `beheer-bestellingen` voor customer service en warehouse.
4. Gebruik @can in views om beheerknoppen te tonen/verbergen.

## 6B user stories

### Shop owner
- [ ] Als eigenaar wil ik producten kunnen aanmaken zodat assortiment groeit.
- [ ] Als eigenaar wil ik producten kunnen bewerken zodat prijzen en info actueel blijven.
- [ ] Als eigenaar wil ik producten kunnen verwijderen zodat oude items verdwijnen.

### Klant
- [ ] Als klant wil ik een review kunnen plaatsen zodat ik mijn ervaring deel.
- [ ] Als klant wil ik alleen mijn eigen review kunnen verwijderen zodat beheer eerlijk is.

### Customer service
- [ ] Als service medewerker wil ik orderstatus kunnen aanpassen zodat klanten actuele informatie krijgen.

### Warehouse
- [ ] Als warehouse medewerker wil ik bestellingen kunnen markeren als packed of shipped zodat logistiek klopt.

## Acceptatiecriteria

- Producten hebben complete CRUD met validatie en flash messages.
- Reviews gebruiken policy-gebaseerde autorisatie.
- Orderstatus update is rolafhankelijk en gevalideerd.
