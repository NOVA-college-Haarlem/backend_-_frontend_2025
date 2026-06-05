# Project 5: HotelManagement (6B - CRUD uitbreiding)

## Introductie

Je bouwt verder op je 6A HotelManagement-project. In 6B voeg je complete hotelprocessen toe: gastenbeheer, reserveringen, kamerbeheer en onderhoud.

## 6B opdrachten

## Opdracht 1 - Room CRUD

1. Maak volledige CRUD voor rooms.
2. Valideer minimaal:
   - room_number required unique
   - type required
   - price required numeric min 0
   - capacity required integer min 1

## Opdracht 2 - Guest CRUD

1. Receptionist kan gasten registreren, wijzigen en verwijderen.
2. Valideer email uniek en telefoonformaat.
3. Toon op guest detail alle reserveringen met status.

## Opdracht 3 - Reserveringen beheren

1. Receptionist kan reserveringen aanmaken en bijwerken.
2. Valideer dat check_out na check_in ligt.
3. Blokkeer dubbele booking van dezelfde kamer in overlappende periode.
4. Voeg check-in/check-out statusflow toe.

## Opdracht 4 - Maintenance meldingen

1. Huishoudelijke dienst kan maintenance meldingen aanmaken en status wijzigen.
2. Policy: alleen maker of manager mag een melding sluiten/verwijderen.
3. Toon meldingen op room detailpagina.

## Opdracht 5 - Auth en autorisatie

1. Gebruik je nog geen Breeze? Werk dan eerst de les Hoofdstuk 4 - Authenticatie en Middleware (Laravel Breeze) door.
1. Beveilig schrijf-routes met auth middleware.
2. Gate: `beheer-kamers` voor manager.
3. Gate: `beheer-reserveringen` voor receptionist.
4. Gebruik @can in de UI voor beheerknoppen.

## 6B user stories

### Receptionist
- [ ] Als receptionist wil ik gasten kunnen registreren zodat reserveringen gekoppeld kunnen worden.
- [ ] Als receptionist wil ik reserveringen kunnen aanmaken, bewerken en annuleren zodat de planning klopt.

### Huishoudelijke dienst
- [ ] Als huishoudelijke dienst wil ik onderhoudsmeldingen kunnen aanmaken zodat problemen worden opgepakt.
- [ ] Als huishoudelijke dienst wil ik onderhoudsstatus kunnen bijwerken zodat iedereen de voortgang ziet.

### Hotel manager
- [ ] Als manager wil ik kamers kunnen beheren zodat aanbod en prijs actueel blijven.

### Gast
- [ ] Als gast wil ik mijn reserveringsdetails met kamer en diensten kunnen bekijken zodat ik weet wat inbegrepen is.

## Acceptatiecriteria

- Room CRUD en Guest CRUD volledig afgerond.
- Reserveringen valideren op datumlogica en beschikbaarheid.
- Maintenance gebruikt policy-gebaseerde rechten.
