# Freelance Marktplaats

## Projectomschrijving

### Opdrachtgever
Een platform wil freelancers en opdrachtgevers bij elkaar brengen. Bedrijven plaatsen opdrachten, freelancers reageren met een offerte, en de opdrachtgever kiest wie de klus mag doen. Na afloop kunnen beide partijen een review achterlaten.

### Functionele eisen

Bezoekers (niet ingelogd) kunnen:
- Een overzicht van openstaande opdrachten bekijken
- De details van een opdracht bekijken (beschrijving, budget, deadline, categorie)
- Zich registreren als freelancer of opdrachtgever

Freelancers (ingelogd) kunnen:
- Op opdrachten reageren met een offerte (bedrag, aanpak, doorlooptijd)
- Hun eigen offertes bekijken en de status volgen (in behandeling / geaccepteerd / afgewezen)
- Een profiel bijhouden met vaardigheden en eerder werk
- Reviews ontvangen van opdrachtgevers

Opdrachtgevers (ingelogd) kunnen:
- Opdrachten plaatsen (titel, beschrijving, budget, deadline, categorie, gewenste vaardigheden)
- Binnengekomen offertes inzien en vergelijken
- Één offerte accepteren (de rest wordt automatisch afgewezen)
- Reviews achterlaten voor freelancers na afronding
- Eigen opdrachten bewerken of sluiten

Beheerders kunnen:
- Categorieën beheren (toevoegen, bewerken, verwijderen)
- Gebruikers beheren (accounts inzien, blokkeren)
- Opdrachten en reviews modereren

### Technische eisen

- Laravel (nieuwste stabiele versie)
- Database met minimaal: `users`, `projects`, `categories`, `bids`, `reviews`
- Authenticatie (Laravel Breeze of de starter kit van de docent)
- Autorisatie via rollen: freelancer / opdrachtgever / admin
- E-mailnotificatie aan freelancer bij accept/afwijzing offerte
- E-mailnotificatie aan opdrachtgever bij nieuwe offerte
- **Nice to have**: Laravel Authorization met Policies voor biedingen en reviews

### Aan de slag

- **Bespreek samen**: Kan een freelancer ook opdrachtgever zijn (één account, twee rollen) of zijn het aparte accounts? Hoe handle je dat in de database?
- **Maak een ERD**: Denk na over de `bids`-tabel. Welke velden heb je nodig? Hoe sla je de status op (pending / accepted / rejected)?
- **Verdeel het werk**: Wie bouwt de opdrachtenpagina's, wie de biedingslogica, wie de reviewfunctionaliteit?

### GitHub

Maak een nieuwe repository aan. Zorg dat alle teamleden toegang hebben. Werk met feature branches — één branch per user story of feature.

### Eerste stappen

```bash
composer create-project laravel/laravel freelance-marktplaats
cd freelance-marktplaats

php artisan make:model Project -mcr
php artisan make:model Bid -mcr
php artisan make:model Review -mcr
php artisan make:model Category -mcr
```

Denk na over de status van een opdracht: open / in uitvoering / afgerond / gesloten. En de status van een bieding: pending / accepted / rejected.

### Bonusfunctionaliteit

- Zoeken en filteren op categorie, budget, deadline
- Freelancer kan vaardighedentags toevoegen aan zijn profiel
- Sterrenrating bij reviews (1–5 sterren)
- Favorieten: opdrachtgever kan freelancers opslaan
