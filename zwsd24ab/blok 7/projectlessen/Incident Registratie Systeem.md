# Incident Registratie Systeem

## Projectomschrijving: Incident Registratie Systeem

### Opdrachtgever
Een school of bedrijf wil een systeem om veiligheids- en incidentmeldingen (bijv. ongevallen, bijna-ongevallen, vandalisme) centraal te registreren, op te volgen en af te handelen.

### Functionele eisen

Melders (medewerkers/studenten) kunnen:

- Een incident melden via een formulier (titel, beschrijving, locatie, datum/tijd, type incident)
- Eventueel foto’s of documenten toevoegen (optioneel, als bonus)
- De status van hun eigen meldingen bekijken (bijv. nieuw, in onderzoek, opgelost, gesloten)

Coördinatoren (bijv. arbo-/veiligheidscoördinator) kunnen:

- Alle binnengekomen incidentmeldingen inzien en filteren (op type, datum, status, locatie)
- Incidenten toewijzen aan verantwoordelijken (bijv. conciërge, teamleider)
- De status en voortgang bijwerken (notities toevoegen, acties registreren)
- Overzichten en eenvoudige statistieken bekijken (aantal incidenten per type, periode, locatie)

Beheerders kunnen:

- Types incidenten en locaties beheren (toevoegen/bewerken/verwijderen)
- Rollen en gebruikers beheren

### Technische eisen

- Laravel (nieuwste stabiele versie)
- Database met minimaal: `users`, `incidents`, `incident_types`, `locations`
- Authenticatie (Laravel Breeze of Fortify)
- Autorisatie via rollen (bijv. melder/coördinator/admin)

### Aan de slag

- **Bespreek samen**: Welke incidenttypen zijn relevant (ongevallen, bijna-ongevallen, schade, gedrag, anders)?  
  Welke rollen zijn er in jullie systeem?  
  Welke informatie is minimaal verplicht om een melding te kunnen doen?
- **Maak een ERD**: Schets jullie database-structuur voordat je begint.
- **Verdeel het werk**: Wie werkt aan de backend (models, controllers, policies), wie werkt aan de views en UX?

### Eerste stappen in Laravel

```bash
composer create-project laravel/laravel incident-registratie
cd incident-registratie
php artisan make:model Incident -mcr
php artisan make:model IncidentType -mcr
php artisan make:model Location -mcr
```

### Bonusfunctionaliteit (als er tijd over is)

- Uploaden van bijlagen (foto’s, PDF-rapporten) bij een incident
- Exporteren van incidenten naar CSV/Excel
- E-mailnotificaties bij nieuwe meldingen of statuswijzigingen
- Dashboard met grafieken (incidenten per maand, per type, per locatie)

### Tip

Commit regelmatig, werk met feature-branches en gebruik issues/board om taken te verdelen. Succes!

