# HotelManagement (6B - CRUD uitbreiding)

## Introductie

Je bouwt verder op je 6A HotelManagement-project. In 6B voeg je complete hotelprocessen toe: gastenbeheer, reserveringen, kamerbeheer en onderhoud.

## Startpunt

- [ ] Ik heb mijn bestaande 6A-project geopend en kan het lokaal starten.
- [ ] Ik heb eerst gecontroleerd of mijn overzichten en detailpagina's uit 6A nog werken.

## Korte begrippen in dit project

- CRUD (Create, Read, Update, Delete)
- Middleware (controlelaag voor routes)
- Gate (centrale rechtencheck)
- Policy (rechtencheck op 1 specifiek record)

## Verplichte opdrachten

### Room CRUD
- [ ] Ik heb volledige CRUD voor `rooms` gemaakt.
- [ ] Ik heb gevalideerd met regel: `room_number` required unique.
- [ ] Ik heb gevalideerd met regel: `type` required.
- [ ] Ik heb gevalideerd met regel: `price` required numeric min 0.
- [ ] Ik heb gevalideerd met regel: `capacity` required integer min 1.

### Guest CRUD
- [ ] Ik heb ervoor gezorgd dat receptionist gasten kan registreren, wijzigen en verwijderen.
- [ ] Ik heb gevalideerd email als uniek.
- [ ] Ik heb gevalideerd telefoon in een logisch formaat.
- [ ] Ik heb op guest-detail alle reserveringen met `status` getoond.

### Reserveringen beheren
- [ ] Ik heb ervoor gezorgd dat receptionist reserveringen kan aanmaken en bijwerken.
- [ ] Ik heb gevalideerd met regel: `check_out` na `check_in` ligt.
- [ ] Ik heb check-in/check-out statusflow toegevoegd.

### Maintenance meldingen
- [ ] Ik heb ervoor gezorgd dat huishoudelijke dienst `maintenance` meldingen kan aanmaken en `status` kan wijzigen.
- [ ] Ik heb meldingen op room-detailpagina getoond.

### Zoeken en filteren
- [ ] Ik heb een zoekopdracht op gastnaam of `room_number` toegevoegd.
- [ ] Ik heb een filter op reserverings-`status` toegevoegd.

### Auth en autorisatie
- [ ] Als Breeze nog ontbreekt, doorloop ik eerst Hoofdstuk 4 - Authenticatie en Middleware (Laravel Breeze).
- [ ] Ik heb schrijf-routes met auth middleware beveiligd.
- [ ] Ik heb gate beheer-kamers voor manager gebruikt.
- [ ] Ik heb gate beheer-reserveringen voor receptionist gebruikt.
- [ ] Ik heb @can in de UI voor beheerknoppen gebruikt.

## Plusopdrachten (extra)

- [ ] Ik heb geblokkeerd dubbele booking van dezelfde kamer in overlappende periode.
- [ ] Ik heb een policy: alleen maker of manager mag een `maintenance`-melding sluiten of verwijderen gebruikt.
- [ ] Ik heb extra rapportage toegevoegd op bezetting per periode.

## User stories 6B

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

- [ ] Room CRUD en Guest CRUD volledig afgerond.
- [ ] Reserveringen valideren op datumlogica.
- [ ] Rollen, gates en policies werken correct.
