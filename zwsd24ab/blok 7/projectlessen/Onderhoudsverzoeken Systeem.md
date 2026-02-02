# Onderhoudsverzoeken Systeem

## Projectomschrijving: Onderhoudsverzoeken Systeem

### Opdrachtgever
Een facilitair dienst of huismeesterteam van een school/bedrijf wil een systeem om onderhoudsverzoeken (kapotte lampen, lekkages, defecte stoelen, schoonmaakverzoeken, etc.) te registreren, plannen en opvolgen.

### Functionele eisen

Gebruikers (medewerkers/studenten) kunnen:

- Een onderhoudsverzoek indienen (locatie, ruimte, type probleem, omschrijving, eventueel foto)
- De status van hun eigen verzoeken volgen (bijv. nieuw, ingepland, in uitvoering, afgerond)
- Reacties/updates van de facilitair dienst lezen

Medewerkers facilitaire dienst kunnen:

- Alle openstaande verzoeken bekijken en filteren (op locatie, type, status, prioriteit)
- Verzoeken aan zichzelf of collega’s toewijzen
- Status en geplande datum/tijd bijhouden
- Notities toevoegen over uitgevoerde werkzaamheden

Beheerders kunnen:

- Ruimtes/locaties beheren (toevoegen/bewerken/verwijderen)
- Categorieën van onderhoudsverzoeken beheren (elektra, sanitair, meubilair, ICT, schoonmaak, overig)
- Eenvoudige rapportages bekijken (meest voorkomende problemen, gemiddelde doorlooptijd)

### Technische eisen

- Laravel (nieuwste stabiele versie)
- Database met minimaal: `users`, `maintenance_requests`, `locations`, `categories`
- Authenticatie (Laravel Breeze of Fortify)
- Autorisatie via rollen (bijv. user/medewerker/admin)

### Github

Maak een nieuwe repository aan op Github.
Zorg ervoor dat je samen kunt werken aan het project door de andere gebruiker een link te geven naar de repository.


Voor authorisatie kun je gebruik maken van Laravel Breeze of van de eerste gebruikte starter kit:

https://github.com/LaravelDaily/starter-kit/

### Aan de slag

- **Bespreek samen**: Hoe fijnmazig maken jullie locaties (alleen gebouw, of ook lokaalnummer)?  
  Welke statussen en prioriteiten gebruiken jullie?  
  Welke informatie is verplicht in het formulier?
- **Maak een ERD**: Schets jullie database-structuur voordat je begint (relaties tussen users, requests, locations, categories).
- **Verdeel het werk**: Backend (models, controllers, policies) vs. frontend (blades, componenten, styling).

### Eerste stappen in Laravel

```bash
composer create-project laravel/laravel onderhoudsverzoeken
cd onderhoudsverzoeken
php artisan make:model MaintenanceRequest -mcr
php artisan make:model Location -mcr
php artisan make:model Category -mcr
```

### Bonusfunctionaliteit (als er tijd over is)

- E-mailnotificaties bij nieuw verzoek of afronding
- Calendar/agenda-weergave van ingeplande klussen
- Mogelijkheid om foto’s/bijlagen te uploaden
- Filter- en zoekfunctionaliteit (per gebouw, status, datum, medewerker)

### Tip

Plan klein, lever snel iets werkends op, en breid daarna uit met bonusfeatures. Commit regelmatig! Succes!

