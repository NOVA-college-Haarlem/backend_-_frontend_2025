# 3. Car Rental System

### Thema
Een autoverhuurbedrijf wil een applicatie om auto's, klanten en verhuringen te beheren. Klanten kunnen online reserveren. Auto's kunnen worden gekozen op basis van features en prijs. De auto's kunnen worden gevonden op basis van de locatie.

### Database Entiteiten
- users (Laravel Breeze)
- cars (merk, model, kenteken, brandstoftype, prijs_per_dag, status)
- customers (naam, rijbewijsnummer, email, telefoon)
- rentals (startdatum, einddatum, totaalprijs, status)
- features (navigatie, airco, automatisch, etc.)
- locations (vestigingsplaatsen)


### User Rollen
- **Fleet Manager**: Auto's beheren, status bijhouden, rapporten bekijken
- **Klant**: Beschikbare auto's zoeken, reserveren, eigen reserveringen bekijken
- **Medewerker**: Verhuringen afhandelen, auto's inchecken/uitchecken
- **Onderhoud**: Auto's markeren voor onderhoud, onderhoudsgeschiedenis bijhouden

### Userstories

- US-1: Als fleet manager wil ik auto's kunnen categoriseren op type en features
- US-2: Als fleet manager wil ik auto's kunnen beheren, status bijhouden, rapporten bekijken
- US-4: Als medewerker wil ik kunnen zien welke auto's beschikbaar zijn op een bepaalde datum
- US-3: Als medewerker wil ik verhuringen afhandelen, auto's inchecken/uitchecken
- US-5: Als medewerker wil ik klanten kunnen beheren: klanten kunnen toevoegen, klanten kunnen wijzigen, klanten kunnen verwijderen en klanten kunnen bekijken
- US-5: Als medewerker wil ik locations kunnen beheren: locations kunnen toevoegen, locations kunnen wijzigen, locations kunnen verwijderen en locations kunnen bekijken
- US-4: Als onderhoud wil ik auto's markeren voor onderhoud, onderhoudsgeschiedenis bijhouden
- US-5: Als onderhoud wil ik features kunnen beheren: features kunnen toevoegen, features kunnen wijzigen, features kunnen verwijderen en features kunnen bekijken
- US-6: Als klant wil ik auto's kunnen reserveren, eigen reserveringen bekijken
- US-7: Als klant wil ik kunnen filteren op features en prijs zodat ik een passende auto vind