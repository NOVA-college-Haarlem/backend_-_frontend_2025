# EventManagement (6B - CRUD uitbreiding)

## Introductie

Je bouwt verder op je 6A EventManagement-project. In 6B voeg je beheer en ticketverkoop toe met rechten per rol.

## Startpunt

- [ ] Ik heb mijn bestaande 6A-project geopend en kan het lokaal starten.
- [ ] Ik heb eerst gecontroleerd of mijn overzichten en detailpagina's uit 6A nog werken.

## Korte begrippen in dit project

- Resource controller (controller met standaard CRUD-methodes)
- Many-to-many (veel-op-veel-relatie)
- Middleware (controlelaag voor routes)
- Policy (rechtencheck op 1 record)

## Verplichte opdrachten

### Event CRUD
- [ ] Ik heb complete CRUD voor `events` via resource controller gemaakt.
- [ ] Ik heb gevalideerd met regel: `title` required.
- [ ] Ik heb gevalideerd met regel: `event_date` required date.
- [ ] Ik heb gevalideerd met regel: `event_time` required.
- [ ] Ik heb gevalideerd met regel: `venue_id` required exists.
- [ ] Ik heb gevalideerd met regel: `capacity` required integer min 1.
- [ ] Ik heb category-koppeling toegevoegd via many-to-many.

### Venue CRUD
- [ ] Ik heb CRUD voor `venues` gemaakt.
- [ ] Ik heb een detailpagina met alle gekoppelde `events` gemaakt.
- [ ] Ik heb een policy: alleen event manager of venue manager mag `venues` wijzigen gebruikt.

### Tickets en filters
- [ ] Ik heb ervoor gezorgd dat een ingelogde bezoeker een ticket kan kopen.
- [ ] Ik heb een ticket aangemaakt met `status` sold en `user_id`.
- [ ] Ik heb geblokkeerd verkoop als capaciteit bereikt is.
- [ ] Ik heb een zoekopdracht op eventnaam toegevoegd.
- [ ] Ik heb een filter op datumrange en categorie toegevoegd.
- [ ] Ik heb een duidelijke melding bij 0 resultaten getoond.

### Auth en autorisatie
- [ ] Als Breeze nog ontbreekt, doorloop ik eerst Hoofdstuk 4 - Authenticatie en Middleware (Laravel Breeze).
- [ ] Ik heb beheeracties met auth middleware beveiligd.
- [ ] Ik heb gate beheer-`events` voor event manager gebruikt.

## Plusopdrachten (extra)

- [ ] Ticket office kan ticketstatus bijwerken (sold, scanned, canceled).
- [ ] Ik heb een policy: alleen ticket office of owner/admin mag ticket annuleren gebruikt.
- [ ] Ik heb extra validatie toegevoegd op ticketstatus-overgangen.

## User stories 6B

### Event manager
- [ ] Als manager wil ik `events` kunnen aanmaken zodat het programma actueel blijft.
- [ ] Als manager wil ik `events` kunnen bewerken en verwijderen zodat planning klopt.

### Venue manager
- [ ] Als venue manager wil ik venuegegevens kunnen bijwerken zodat locatie-info correct is.

### Bezoeker
- [ ] Als bezoeker wil ik `tickets` kunnen kopen zolang er plek is.

### Ticket office medewerker
- [ ] Als medewerker wil ik ticketstatus kunnen aanpassen zodat toegang en administratie kloppen.

## Acceptatiecriteria

- [ ] Event CRUD en venue CRUD werken met validatie.
- [ ] Ticketverkoop respecteert capaciteit.
- [ ] Rollen en policies beperken beheeracties correct.
