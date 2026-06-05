# Project 7: ZiekenhuisManagement (6B - CRUD uitbreiding)

## Introductie

Je bouwt verder op je 6A ZiekenhuisManagement-project. In 6B voeg je operationele processen toe: patientregistratie, afspraakplanning en medische notities met juiste autorisatie.

## 6B opdrachten

## Opdracht 1 - Patient CRUD

1. Maak volledige CRUD voor patients.
2. Valideer minimaal:
   - name required
   - birth_date required date
   - contact_details required

## Opdracht 2 - Appointment CRUD

1. Receptionist kan afspraken aanmaken, wijzigen en annuleren.
2. Valideer datum/tijd en dokter/patient koppeling.
3. Voorkom dubbele afspraak voor dezelfde dokter op hetzelfde tijdstip.
4. Voeg statusflow toe (planned, checked_in, completed, canceled).

## Opdracht 3 - Medical notes beheren

1. Dokter kan notities toevoegen bij patient.
2. Dokter kan eigen notities wijzigen.
3. Policy: alleen auteur-dokter of manager mag notitie verwijderen.

## Opdracht 4 - Department en doctors beheer

1. Maak minimaal update-flow voor doctors (afdeling, specialisatie).
2. Toon op department detail alle dokters en komende afspraken.

## Opdracht 5 - Auth en autorisatie

1. Gebruik je nog geen Breeze? Werk dan eerst de les Hoofdstuk 4 - Authenticatie en Middleware (Laravel Breeze) door.
1. Beveilig schrijf-routes met auth middleware.
2. Gate: `beheer-afspraken` voor receptionist.
3. Gate: `beheer-afdelingen` voor afdelings manager.
4. Gebruik @can op actieknoppen.

## 6B user stories

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

- Patient CRUD en Appointment CRUD afgerond met validatie.
- Afspraakplanning voorkomt dubbele tijdslots per dokter.
- Medical notes gebruikt policy-gebaseerde rechten.
