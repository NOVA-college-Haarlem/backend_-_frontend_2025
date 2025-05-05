## Evenementenbeheer App

**Beschrijving:**
Een applicatie waarin gebruikers evenementen kunnen aanmaken, beheren en tickets kunnen reserveren. Naast de basisfunctionaliteiten wordt de app uitgebreid met geavanceerde features.

### Uitgebreide Functionaliteiten:

- **Gebruikersbeheer:**
  - Registratie, inloggen en profielbeheer voor zowel organisatoren als bezoekers.
  - Rollen en rechten: organisatoren kunnen eigen evenementen beheren; beheerders hebben overzicht over alle evenementen.

- **Evenementenbeheer:**
  - CRUD-functionaliteit voor evenementen (aanmaken, bewerken, verwijderen).
  - Mogelijkheid om evenementdetails zoals locatie, datum, tijd en omschrijving in te vullen.
  - Uploaden van afbeeldingen en bijlagen voor het evenement.

- **Ticketverkoop en Reserveringen:**
  - Systeem voor ticketverkoop met vooraf ingestelde limieten per evenement.
  - Integratie van een betalingssysteem (bijv. Stripe of Mollie) voor betaalde evenementen.
  - Automatische e-mailbevestigingen en herinneringen via Laravel's mailer.

- **Zoek- en Filtermogelijkheden:**
  - Filteren op datum, locatie, categorie en populariteit.
  - Zoekfunctionaliteit op titel of beschrijving.

- **Dashboard en Analytics:**
  - Overzicht voor organisatoren met statistieken (aantal verkochte tickets, bezoekersaantallen).
  - Grafieken en rapportages voor beheerders over alle evenementen.

- **Beveiliging en Validatie:**
  - Toegangsbescherming via middleware voor gevoelige routes.
  - Validatie van invoervelden en beveiliging tegen SQL-injecties en XSS-aanvallen.

- **Extra's:**
  - Kalenderweergave voor alle aankomende evenementen.
  - Mogelijkheid om evenementen te delen via social media.
