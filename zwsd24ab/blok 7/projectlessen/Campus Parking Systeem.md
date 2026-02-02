# Campus Parking Systeem

## Projectomschrijving: Campus Parking Systeem

### Opdrachtgever
Een school of bedrijfscampus wil een digitaal systeem om parkeerplaatsen te beheren. Medewerkers en studenten moeten een parkeerplaats kunnen reserveren, en beheerders willen inzicht in de bezetting.

### Functionele eisen
Gebruikers kunnen:

- Beschikbare parkeerplaatsen bekijken (per dag/tijdslot)
- Een parkeerplaats reserveren
- Hun eigen reserveringen inzien en annuleren
- Hun voertuig(en) registreren (kenteken, type)

Beheerders kunnen:

Parkeerplaatsen toevoegen, bewerken en verwijderen
Parkeerzones beheren (bijvoorbeeld: bezoekers, personeel, elektrisch)
Overzicht zien van alle reserveringen
Bezettingsgraad en statistieken bekijken

### Technische eisen

Laravel (nieuwste stabiele versie)
Database met minimaal: users, vehicles, parking_spots, reservations
Authenticatie (Laravel Breeze of Fortify)
Autorisatie via rollen (user/admin)

### Aan de slag

Bespreek samen: Hoeveel zones zijn er? Zijn er tijdslots of hele dagen? Mag iemand meerdere voertuigen hebben?
Maak een ERD: Schets jullie database-structuur voordat je begint
Verdeel het werk: Wie doet de backend/models, wie de views/styling?

### Eerste stappen in Laravel
```bash
composer create-project laravel/laravel parking-campus
cd parking-campus
php artisan make:model Vehicle -mcr
php artisan make:model ParkingSpot -mcr
php artisan make:model Reservation -mcr
```

### Bonusfunctionaliteit (als er tijd over is)

Kalenderweergave van beschikbaarheid
E-mailbevestiging bij reservering
Check-in/check-out registratie met tijdstempel
Wachtlijst bij volle bezetting


Tip: Commit regelmatig en werk met feature-branches. Succes!