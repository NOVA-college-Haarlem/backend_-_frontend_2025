# Hardware Uitleen Systeem

## Projectomschrijving: Hardware Uitleensysteem

### Opdrachtgever
Een bedrijf/instelling wil een digitaal systeem om hun hardware (laptops, kabels, adapters, camera's, etc.) uit te lenen aan medewerkers of studenten.
### Functionele eisen

Gebruikers kunnen:

- Beschikbare hardware bekijken
- Een uitleenverzoek indienen
- Hun eigen uitleenhistorie inzien

Beheerders kunnen:
- Hardware toevoegen, bewerken en verwijderen
- Uitleenverzoeken goedkeuren of afwijzen
- Overzicht zien van alle uitleningen (actief, te laat, retour)

### Technische eisen

Laravel (nieuwste stabiele versie)
Database met minimaal: users, hardware_items, loans
Authenticatie (Laravel Breeze of Fortify)
Autorisatie via rollen (user/admin)

### Aan de slag

Bespreek samen: Welke hardware-categorieën zijn er? Wat is de uitleentermijn?
Maak een ERD: Schets jullie database-structuur voordat je begint
Verdeel het werk: Wie doet de backend/models, wie de views/styling?

### Eerste stappen in Laravel
```bash
composer create-project laravel/laravel hardware-uitleen
cd hardware-uitleen
php artisan make:model HardwareItem -mcr
php artisan make:model Loan -mcr
```

### Bonusfunctionaliteit (als er tijd over is)

- E-mailnotificatie bij goedkeuring of te laat inleveren
- Zoeken en filteren op categorie
- QR-codes voor snelle registratie


### Tip: Commit regelmatig en werk met feature-branches. Succes!
