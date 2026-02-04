## Samenvatting hoofdstuk 1 t/m 3

### Hoofdstuk 1 – Create en Validatie
- Bouw van een formulier `create_tool.php` om nieuwe tools aan te maken met velden als naam, brand, categorie, prijs en afbeelding.
- Toepassen van server-side validatie in `create_tool_process.php`:
  - controleren op lege velden;
  - minimale lengte van tekstvelden;
  - controleren of prijs numeriek is en onder een maximaal bedrag blijft;
  - controleren of de afbeelding een geldige URL heeft en niet te lang is.
- Na geslaagde validatie de ingevulde data opslaan in de database met een `INSERT`-query.

### Hoofdstuk 2 – Registreren
- Werken met de `users`-tabel in de database (o.a. firstname, lastname, email, password, role, address, city, is_active).
- Opzetten van een registratieformulier in `user_create.php` met `name`-attributen die overeenkomen met de kolomnamen in de database.
- In `user_create_process.php`:
  - controleren of alle vereiste velden bestaan en niet leeg zijn;
  - valideren van het e-mailadres;
  - controleren of het wachtwoord minimaal 8 karakters lang is;
  - na geldige invoer de nieuwe gebruiker opslaan in de database en doorverwijzen naar een succes- of foutpagina.

### Hoofdstuk 3 – Inloggen en Sessions
- Maken van een loginformulier in `login.php` met de velden email en password.
- Schrijven van `login_process.php` om:
  - de ingevoerde gegevens op te halen;
  - de bijbehorende gebruiker uit de database te selecteren op e-mailadres;
  - het wachtwoord te controleren en bij succes door te sturen naar `dashboard.php`, bij fout een melding te tonen.
- Introductie van sessions (`session_start()` en de `$_SESSION`-array) om gebruikersgegevens op te slaan na een succesvolle login.
- Opzetten van `session_check.php` om te controleren of een gebruiker is ingelogd, en deze check toevoegen aan beschermde pagina’s zoals `dashboard.php` en pagina’s waar je nieuwe data (zoals tools) kunt aanmaken.

