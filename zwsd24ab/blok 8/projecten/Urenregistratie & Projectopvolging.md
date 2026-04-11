# Urenregistratie & Projectopvolging

## Projectomschrijving

### Opdrachtgever
Een bedrijf wil bijhouden hoeveel uur medewerkers aan welke projecten besteden. Op dit moment worden uren bijgehouden in Excel — dat leidt tot fouten, verlies van overzicht en tijdrovende rapportages. De opdrachtgever wil een centrale webapplicatie waar medewerkers hun uren loggen en managers direct overzichten kunnen inzien.

### Functionele eisen

Medewerkers (ingelogd) kunnen:
- Uren registreren op een project (datum, aantal uren, omschrijving van de werkzaamheden, activiteitstype)
- Eigen urenregistraties inzien, bewerken en verwijderen (alleen van dezelfde dag of dag ervoor)
- Een weekoverzicht van hun eigen uren bekijken
- Zien aan welke projecten zij zijn toegewezen

Projectmanagers kunnen:
- Projecten aanmaken, bewerken en archiveren
- Medewerkers toewijzen aan projecten
- Alle urenregistraties per project inzien
- Overzicht per medewerker zien: hoeveel uur deze week, deze maand, per project
- Een eenvoudig rapport exporteren (CSV) met uren per project of per medewerker

Beheerders kunnen:
- Gebruikersaccounts beheren (aanmaken, rollen toewijzen, deactiveren)
- Activiteitstypes beheren (bijv. ontwikkeling, overleg, testen, documentatie)
- Alle projecten en uren inzien

### Technische eisen

- Laravel (nieuwste stabiele versie)
- Database met minimaal: `users`, `projects`, `time_entries`, `activity_types`, `project_user` (koppeltabel)
- Authenticatie (Laravel Breeze of de starter kit van de docent)
- Autorisatie via rollen: medewerker / projectmanager / admin
- CSV-export van urenrapportages
- **Nice to have**: Laravel Authorization met Policies voor tijdregistraties (medewerker mag alleen eigen uren bewerken)

### Aan de slag

- **Bespreek samen**: Hoe ga je om met de tijdslimiet voor bewerken (alleen dezelfde of de vorige dag)? En: mag een medewerker op meerdere projecten tegelijk werken?
- **Maak een ERD**: Let op de koppeltabel tussen `users` en `projects`. Hoe sla je bij welke medewerker welke uren horen, op welk project?
- **Verdeel het werk**: Wie bouwt de urenregistratie, wie de projectbeheer-pagina's, wie de rapportages?

### GitHub

Maak een nieuwe repository aan. Zorg dat alle teamleden toegang hebben. Werk met feature branches — één branch per user story of feature.

### Bonusfunctionaliteit

- Dashboard met grafieken (uren per week, uren per project)
- Notificatie aan projectmanager als een project boven het geschatte aantal uren komt
- Tijdregistratie via een timer (start/stop knop)
- Verlof en afwezigheid registreren
