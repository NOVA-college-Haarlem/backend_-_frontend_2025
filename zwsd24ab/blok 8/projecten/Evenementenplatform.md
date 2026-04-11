# Evenementenplatform

## Projectomschrijving

### Opdrachtgever
Een school of organisatie wil evenementen organiseren en aanmeldingen digitaal beheren. Denk aan open dagen, workshops, excursies, sportdagen of informatiesessies. Op dit moment gaat alles via e-mail en spreadsheets — dat wil de opdrachtgever vervangen door een overzichtelijk systeem.

### Functionele eisen

Bezoekers (niet ingelogd) kunnen:
- Een overzicht van aankomende evenementen bekijken
- De details van een evenement bekijken (beschrijving, datum, locatie, resterende plaatsen)

Deelnemers (ingelogd) kunnen:
- Zich aanmelden voor een evenement (als er nog plaatsen vrij zijn)
- Zich afmelden voor een evenement (tot een bepaalde deadline)
- Een overzicht zien van hun eigen aanmeldingen
- Een bevestigingsmail ontvangen na aanmelding

Organisatoren kunnen:
- Evenementen aanmaken, bewerken en verwijderen
- De deelnemerslijst per evenement inzien
- Evenementen sluiten voor aanmeldingen (los van de capaciteitslimiet)
- Deelnemers handmatig afmelden

Beheerders kunnen:
- Organisatoraccounts aanmaken en beheren
- Alle evenementen en aanmeldingen inzien
- Rapportage inzien: aantal evenementen, totaal aanmeldingen, meest populaire evenementen

### Technische eisen

- Laravel (nieuwste stabiele versie)
- Database met minimaal: `users`, `events`, `registrations`
- Authenticatie (Laravel Breeze of de starter kit van de docent)
- Autorisatie via rollen: bezoeker / deelnemer / organisator / admin
- Bevestigingsmail bij aanmelding (via Laravel Mail)
- Wachtlijst-logica: als een evenement vol is, kan een deelnemer op de wachtlijst
- **Nice to have**: Laravel Authorization met Policies voor evenement-beheer

### Aan de slag

- **Bespreek samen**: Wat gebeurt er als iemand zich afmeldt en er staat iemand op de wachtlijst? Automatisch doorschuiven of handmatig?
- **Maak een ERD**: Denk na over de relaties. Een evenement heeft veel aanmeldingen. Een aanmelding hoort bij één gebruiker en één evenement.
- **Verdeel het werk**: Wie bouwt de evenementenpagina's, wie de aanmeld-logica, wie de beheerpagina's?

### GitHub

Maak een nieuwe repository aan. Zorg dat alle teamleden toegang hebben. Werk met feature branches — één branch per user story of feature.

### Bonusfunctionaliteit

- QR-code genereren per aanmelding als "ticket"
- Herinneringsmail een dag voor het evenement
- Exporteer deelnemerslijst als CSV
- Kalenderweergave van evenementen
