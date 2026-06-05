# ZiekenhuisManagement (6B - CRUD uitbreiding)

## Introductie

Je bouwt verder op je 6A ZiekenhuisManagement-project. In 6B voeg je patientregistratie, afspraakplanning en medische notities toe met juiste rechten.

## Startpunt

- [ ] Ik heb mijn bestaande 6A-project geopend en kan het lokaal starten.
- [ ] Ik heb eerst gecontroleerd of mijn overzichten en detailpagina's uit 6A nog werken.

## Korte begrippen in dit project

- CRUD (Create, Read, Update, Delete)
- Middleware (controlelaag voor routes)
- Gate (centrale rechtencheck)
- Policy (rechtencheck op 1 specifiek record)

## Verplichte opdrachten

### Patient CRUD
- [ ] Ik heb volledige CRUD voor `patients` gemaakt.
- [ ] Ik heb gevalideerd met regel: `name` required.
- [ ] Ik heb gevalideerd met regel: `birth_date` required date.
- [ ] Ik heb gevalideerd met regel: `contact_details` required.

### Appointment beheer
- [ ] Ik heb ervoor gezorgd dat receptionist afspraken kan aanmaken, wijzigen en annuleren.
- [ ] Ik heb gevalideerd datum, tijd en dokter-patient koppeling.
- [ ] Ik heb statusflow toegevoegd (planned, `checked_in`, completed, canceled).

### Medical notes
- [ ] Dokter kan notities toevoegen bij patient.
- [ ] Dokter kan eigen notities wijzigen.

### Departments en `doctors`
- [ ] Ik heb een update-flow voor `doctors` (afdeling, specialisatie) gemaakt.
- [ ] Ik heb op department detail alle dokters en komende afspraken getoond.

### Zoeken en filteren
- [ ] Ik heb een zoekopdracht op patientnaam toegevoegd.
- [ ] Ik heb een filter op afspraak-`status` of datum toegevoegd.

### Auth en autorisatie
- [ ] Als Breeze nog ontbreekt, doorloop ik eerst Hoofdstuk 4 - Authenticatie en Middleware (Laravel Breeze).
- [ ] Ik heb schrijf-routes met auth middleware beveiligd.
- [ ] Ik heb gate beheer-afspraken voor receptionist gebruikt.
- [ ] Ik heb gate beheer-afdelingen voor afdelings manager gebruikt.
- [ ] Ik heb @can op actieknoppen gebruikt.

## Plusopdrachten (extra)

- [ ] Ik heb voorkomen dubbele afspraak voor dezelfde dokter op hetzelfde tijdstip.
- [ ] Ik heb een policy: alleen auteur-dokter of manager mag een notitie verwijderen gebruikt.
- [ ] Ik heb extra dagoverzicht toegevoegd voor afspraken per afdeling.

## User stories 6B

### Receptionist
- [ ] Als receptionist wil ik nieuwe patienten kunnen registreren zodat afspraken ingepland kunnen worden.
- [ ] Als receptionist wil ik afspraken kunnen plannen en aanpassen zodat de agenda klopt.

### Dokter
- [ ] Als dokter wil ik medische notities kunnen toevoegen zodat behandelgeschiedenis compleet is.
- [ ] Als dokter wil ik alleen mijn eigen notities kunnen wijzigen zodat data betrouwbaar blijft.

### Afdelings manager
- [ ] Als manager wil ik dokters aan afdelingen kunnen koppelen en beheren zodat bezetting klopt.

### Patient
- [ ] Als patient wil ik mijn afspraken en gekoppelde dokter op detailniveau kunnen bekijken zodat ik goed voorbereid ben.

## Acceptatiecriteria

- [ ] Patient CRUD en Appointment CRUD afgerond met validatie.
- [ ] Rollen, gates en policies werken correct.
- [ ] Validatie en flash messages werken in schrijf-flow.
