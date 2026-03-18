## Samenvatting weken 1 t/m 3

### Week 1 – Fundament & authenticatie
- Opzetten van een herbruikbare databaseconnectie via `database.php`, zodat elke pagina dezelfde mysqli-verbinding gebruikt en we duidelijke foutmeldingen tonen bij mislukte connecties.
- Bouwen van het eerste loginformulier (`login.php`) en het bijbehorende verwerkingsscript (`login_process.php`) met basale validatie (lege velden tegenhouden, gebruiker ophalen op e‑mail, wachtwoordvergelijking).
- Introduceren van sessies na een succesvolle login en directe doorverwijzing naar `dashboard.php`, waarmee we de basis legden voor een beschermde omgeving.

### Week 2 – Gebruikersbeheer & navigatie
- Uitbreiding met een registratieformulier (`register.php`) inclusief rollenkeuze en server-side controles in `register_process.php` (empty checks, minimale lengte, e-mailvalidatie) voordat een nieuwe gebruiker in de tabel `users` belandt.
- Toevoeging van `session_check.php` als eenvoudige middleware om niet-ingelogde bezoekers te blokkeren en `logout.php` om sessies op te ruimen.
- Introductie van een gedeelde header/navigation (`header.php` en `navbar.php`) die links naar dashboard, klassenoverzicht, klas aanmaken en gebruikersbeheer bevat, zodat alle beschermde pagina's dezelfde menustructuur tonen.

### Week 3 – Klassenbeheer
- Maken van een overzichtspagina `klassen.php` die alle klassen uit de database leest, toont in een tabel en linkt naar detailpagina's (`klas-detail.php`) via queryparameters.
- Bouwen van het formulier `create_klas.php` en het verwerkingsscript `create_klas_process.php` met uitgebreide validatie (lengte-controles, numerieke checks, maximum 30 leerlingen) en het opslaan van de klas in de tabel `klassen`.
- Voorbereiden van detailfunctionaliteit door alvast een parametercontrole in `klas-detail.php` te plaatsen; de verdere uitwerking staat voor komende weken gepland.

Met deze onderdelen beschikt de Regenboog-schoolapp na drie weken over een volledige authenticatiestroom, basisgebruikersbeheer en de eerste CRUD-stap voor klassen. Week 4 bouwt hierop voort met verfijningen en nieuwe features.

