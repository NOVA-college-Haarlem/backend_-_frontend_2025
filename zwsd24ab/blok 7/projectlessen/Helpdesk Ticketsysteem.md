# Helpdesk Ticketsysteem

## Projectomschrijving: Helpdesk Ticketsysteem

### Opdrachtgever
Een IT-afdeling van een school of bedrijf wil een digitaal systeem om IT-problemen te registreren, tickets toe te wijzen aan medewerkers en de status van deze tickets te volgen.

### Functionele eisen

Gebruikers (melders) kunnen:

- IT-problemen melden via een formulier (titel, beschrijving, prioriteit, categorie)
- De status van hun eigen tickets bekijken (bijv. nieuw, in behandeling, opgelost, gesloten)
- Reacties/updates van de helpdesk op hun tickets lezen
- Eventueel aanvullingen of reacties plaatsen op hun eigen ticket

Medewerkers (helpdesk) kunnen:

- Binnengekomen tickets inzien en filteren (op status, prioriteit, categorie, medewerker)
- Tickets aan zichzelf of collega’s toewijzen
- De status van een ticket aanpassen (bijv. nieuw → in behandeling → opgelost)
- Reacties plaatsen op tickets (vragen stellen, voortgang melden)

Beheerders kunnen:

- Categorieën en prioriteiten beheren (toevoegen/bewerken/verwijderen)
- Medewerkersaccounts beheren
- Overzichten en eenvoudige statistieken bekijken (aantal open tickets, gemiddelde afhandeltijd, tickets per categorie)

### Technische eisen

- Laravel (nieuwste stabiele versie)
- Database met minimaal: `users`, `tickets`, `categories`, `ticket_statuses` (of status als kolom in `tickets`), `ticket_assignments` (of een `assigned_to`-kolom in `tickets`)
- Authenticatie (Laravel Breeze of Fortify)
- Autorisatie via rollen (bijv. user/medewerker/admin)

### Aan de slag

- **Bespreek samen**: Welke statussen gebruiken jullie? (bijv. nieuw, in behandeling, on hold, opgelost, gesloten)  
  Welke prioriteiten zijn er? (laag, normaal, hoog, kritiek)  
  Welke categorieën zijn belangrijk? (netwerk, hardware, software, account, overig)
- **Maak een ERD**: Schets jullie database-structuur voordat je begint.
- **Verdeel het werk**: Wie richt de modellen/migrations/controllers in, wie maakt de views en styling?

### Eerste stappen in Laravel

```bash
composer create-project laravel/laravel helpdesk-ticketsysteem
cd helpdesk-ticketsysteem
php artisan make:model Ticket -mcr
php artisan make:model Category -mcr
php artisan make:model TicketStatus -mcr
```

Kies zelf of je een aparte `TicketStatus`-tabel gebruikt, of statussen als enum/string-kolom in `tickets` opslaat.

### Bonusfunctionaliteit (als er tijd over is)

- E-mailnotificatie bij nieuwe tickets of statuswijzigingen
- Zoeken en filteren op meerdere velden tegelijk (status, prioriteit, categorie, meldingsdatum)
- Bijlagen uploaden bij een ticket (schermafbeeldingen, logs)
- Dashboard voor medewerkers met eigen openstaande tickets en takenlijst

### Tip

Commit regelmatig en werk met feature-branches. Succes!

