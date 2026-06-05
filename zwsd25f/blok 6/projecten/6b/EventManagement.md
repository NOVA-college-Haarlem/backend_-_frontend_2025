# Project 3: EventManagement (6B - CRUD uitbreiding)

## Introductie

Je bouwt verder op je 6A EventManagement-project. In 6B voeg je beheer en transacties toe: events, venues en ticketverkoop met rechten per rol.

## 6B opdrachten

## Opdracht 1 - Event CRUD

1. Maak complete CRUD voor events via resource controller.
2. Valideer minimaal:
   - title required
   - event_date required date
   - event_time required
   - venue_id required exists
   - capacity required integer min 1
3. Voeg category-koppeling toe via many-to-many.

## Opdracht 2 - Venue CRUD

1. Maak CRUD voor venues.
2. Voeg detailpagina met alle gekoppelde events toe.
3. Policy: alleen event manager of venue manager mag venues wijzigen.

## Opdracht 3 - Tickets verkopen

1. Ingelogde bezoeker kan ticket kopen voor een event.
2. Maak ticket aan met status sold en user_id.
3. Blokkeer verkoop als capaciteit bereikt is.
4. Ticket office kan ticketstatus bijwerken (sold, scanned, canceled).

## Opdracht 4 - Zoeken en filters

1. Zoek op eventnaam.
2. Filter op datumrange en categorie.
3. Toon duidelijke melding bij 0 resultaten.

## Opdracht 5 - Auth en autorisatie

1. Gebruik je nog geen Breeze? Werk dan eerst de les Hoofdstuk 4 - Authenticatie en Middleware (Laravel Breeze) door.
1. Beveilig beheeracties met auth middleware.
2. Gate: `beheer-events` voor event manager.
3. Policy: alleen ticket office of owner/admin mag ticket annuleren.

## 6B user stories

### Event manager
- [ ] Als manager wil ik events kunnen aanmaken zodat het programma actueel blijft.
- [ ] Als manager wil ik events kunnen bewerken en verwijderen zodat planning klopt.

### Venue manager
- [ ] Als venue manager wil ik venuegegevens kunnen bijwerken zodat locatie-info correct is.

### Bezoeker
- [ ] Als bezoeker wil ik tickets kunnen kopen zolang er plek is.

### Ticket office medewerker
- [ ] Als medewerker wil ik ticketstatus kunnen aanpassen zodat toegang en administratie kloppen.

## Acceptatiecriteria

- Event CRUD en venue CRUD werken met validatie.
- Ticketverkoop respecteert capaciteit.
- Rollen en policies beperken beheeracties correct.
