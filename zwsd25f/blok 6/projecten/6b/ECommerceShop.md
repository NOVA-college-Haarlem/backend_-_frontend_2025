# ECommerceShop (6B - CRUD uitbreiding)

## Introductie

Je bouwt verder op je 6A ECommerceShop-project. In 6B voeg je beheerflows en klantinteractie toe met CRUD en autorisatie.

## Startpunt

- [ ] Ik heb mijn bestaande 6A-project geopend en kan het lokaal starten.
- [ ] Ik heb eerst gecontroleerd of mijn overzichten en detailpagina's uit 6A nog werken.

## Korte begrippen in dit project

- Resource route (routepakket met standaard CRUD-routes)
- Middleware (controlelaag voor routes)
- Gate (centrale rechtencheck)
- Policy (rechtencheck op een specifiek record)

## Verplichte opdrachten

### Productbeheer
- [ ] Ik heb resource routes voor `products` gebruikt.
- [ ] Ik heb complete CRUD voor producten gemaakt.
- [ ] Ik heb gevalideerd met regel: `name` required.
- [ ] Ik heb gevalideerd met regel: `price` required numeric min 0.
- [ ] Ik heb gevalideerd met regel: `stock` required integer min 0.
- [ ] Ik heb gevalideerd met regel: `description` nullable.

### Categorieen en voorraad
- [ ] Ik heb producten aan meerdere categorieen gekoppeld.
- [ ] Ik heb filter op categorie toegevoegd op product index.
- [ ] Ik heb een zoekopdracht op productnaam toegevoegd.
- [ ] Ik heb een eenvoudige voorraadstatus op detailpagina getoond.

### Reviews
- [ ] Ik heb ervoor gezorgd dat ingelogde klanten een review kunnen plaatsen (`rating` 1-5 en `comment`).
- [ ] Ik heb `reviews` op productdetail met auteur en datum getoond.
- [ ] Ik heb een policy: alleen review-eigenaar of admin mag verwijderen gebruikt.

### Auth en autorisatie
- [ ] Als Breeze nog ontbreekt, doorloop ik eerst Hoofdstuk 4 - Authenticatie en Middleware (Laravel Breeze).
- [ ] Ik heb create, edit en delete routes met auth middleware beveiligd.
- [ ] Ik heb gate beheer-producten voor shop owner gebruikt.
- [ ] Ik heb gate beheer-bestellingen voor customer service en warehouse gebruikt.
- [ ] Ik heb @can in views voor beheerknoppen gebruikt.

## Plusopdrachten (extra)

- [ ] Ik heb gebouwd een update-flow voor orderstatus.
- [ ] Ik heb beperkt statuswijzigingen per rol (bijvoorbeeld warehouse alleen packed of shipped).
- [ ] Ik heb gevalideerd toegestane statusovergangen.

## User stories 6B

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

- [ ] Producten hebben complete CRUD met validatie en flash messages.
- [ ] Reviews gebruiken policy-gebaseerde autorisatie.
- [ ] Rollen en rechten worden correct afgedwongen.
