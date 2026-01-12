# Project Suggesties - Alternatieve Thema's
## Voor Toekomstige Eindprojecten

Dit document bevat suggesties voor projecten met verschillende thema's, maar met vergelijkbare complexiteit en structuur als de bestaande projecten (Bibliotheek, ECommerceShop, EventManagement, etc.).

Alle projecten voldoen aan de basisvereisten:
- ✅ Minimaal 4 hoofdtabellen (naast users)
- ✅ Minimaal één veel-op-veel relatie
- ✅ Meerdere user rollen
- ✅ CRUD functionaliteit
- ✅ Authenticatie (Laravel Breeze)
- ✅ Zoek- en filter functionaliteit mogelijk

---

## 1. Restaurant Management System

### Thema
Een restaurant wil een applicatie om gerechten, reserveringen, bestellingen en klanten te beheren. Klanten kunnen online reserveren en bestellen.

### Database Entiteiten
- users (Laravel Breeze)
- dishes (naam, prijs, beschrijving, allergenen)
- categories (voorgerecht, hoofdgerecht, dessert, etc.)
- reservations (datum, tijd, aantal personen, status)
- orders (datum, tijd, totaalbedrag, status)
- ingredients (naam, allergenen)

### Veel-op-Veel Relaties
- **Dishes ↔ Categories**: Een gerecht kan meerdere categorieën hebben (bijv. vegetarisch + hoofdgerecht)
- **Dishes ↔ Orders**: Een bestelling bevat meerdere gerechten, een gerecht kan in meerdere bestellingen zitten
- **Dishes ↔ Ingredients**: Een gerecht heeft meerdere ingrediënten, een ingrediënt zit in meerdere gerechten

### User Rollen
- **Restaurant Owner**: Gerechten beheren, prijzen instellen, rapporten bekijken
- **Klant**: Reserveren, bestellen, bestelgeschiedenis bekijken
- **Kok**: Bestellingen zien, status updaten
- **Ober**: Bestellingen opnemen, reserveringen beheren

### Voorbeelden User Stories
- Als restaurant eigenaar wil ik gerechten kunnen categoriseren zodat klanten makkelijk kunnen kiezen
- Als klant wil ik kunnen filteren op allergenen zodat ik veilig kan bestellen
- Als kok wil ik nieuwe bestellingen kunnen zien zodat ik kan beginnen met koken

---

## 2. Fitness Center Management

### Thema
Een sportschool wil een applicatie om leden, abonnementen, lessen en trainers te beheren. Leden kunnen zich inschrijven voor groepslessen.

### Database Entiteiten
- users (Laravel Breeze)
- members (naam, geboortedatum, abonnement_type, lidmaatschap_datum)
- trainers (naam, specialisatie, ervaring)
- classes (naam, tijd, datum, capaciteit, duur)
- equipment (naam, type, status, locatie)
- subscriptions (type, prijs, duur)

### Veel-op-Veel Relaties
- **Members ↔ Classes**: Een lid kan zich inschrijven voor meerdere lessen, een les heeft meerdere leden
- **Trainers ↔ Classes**: Een trainer geeft meerdere lessen, een les kan meerdere trainers hebben (team training)
- **Members ↔ Equipment**: Leden kunnen verschillende apparaten gebruiken (boekingen/reserveringen)

### User Rollen
- **Fitness Manager**: Trainers beheren, lessen plannen, apparatuur beheren
- **Lid**: Lessen bekijken en inschrijven, eigen schema bekijken
- **Trainer**: Eigen lessen beheren, ingeschreven leden zien
- **Receptie**: Nieuwe leden registreren, abonnementen beheren

### Voorbeelden User Stories
- Als manager wil ik lessen kunnen categoriseren zodat leden makkelijk kunnen vinden wat ze zoeken
- Als lid wil ik kunnen zoeken op tijd en type les zodat ik passende lessen vind
- Als trainer wil ik kunnen zien hoeveel leden ingeschreven zijn voor mijn les

---

## 3. Car Rental System

### Thema
Een autoverhuurbedrijf wil een applicatie om auto's, klanten en verhuringen te beheren. Klanten kunnen online reserveren.

### Database Entiteiten
- users (Laravel Breeze)
- cars (merk, model, kenteken, brandstoftype, prijs_per_dag, status)
- customers (naam, rijbewijsnummer, email, telefoon)
- rentals (startdatum, einddatum, totaalprijs, status)
- features (navigatie, airco, automatisch, etc.)
- locations (vestigingsplaatsen)

### Veel-op-Veel Relaties
- **Cars ↔ Features**: Een auto heeft meerdere features, een feature zit op meerdere auto's
- **Cars ↔ Rentals**: Een auto kan meerdere keren verhuurd worden (via rentals is dit one-to-many, maar kan uitgebreid worden)
- **Customers ↔ Features**: Klanten kunnen voorkeurs-features hebben voor hun zoekopdracht

### User Rollen
- **Fleet Manager**: Auto's beheren, status bijhouden, rapporten bekijken
- **Klant**: Beschikbare auto's zoeken, reserveren, eigen reserveringen bekijken
- **Medewerker**: Verhuringen afhandelen, auto's inchecken/uitchecken
- **Onderhoud**: Auto's markeren voor onderhoud, onderhoudsgeschiedenis bijhouden

### Voorbeelden User Stories
- Als fleet manager wil ik auto's kunnen categoriseren op type en features
- Als klant wil ik kunnen filteren op features en prijs zodat ik een passende auto vind
- Als medewerker wil ik kunnen zien welke auto's beschikbaar zijn op een bepaalde datum

---

## 4. Cinema Management System

### Thema
Een bioscoop wil een applicatie om films, zalen, voorstellingen en tickets te beheren. Klanten kunnen online tickets kopen.

### Database Entiteiten
- users (Laravel Breeze)
- movies (titel, regisseur, duur, genre, rating, release_datum)
- cinemas (naam, adres, aantal_zalen)
- screenings (datum, tijd, zaal, prijs)
- tickets (prijs, stoel_nummer, status)
- genres (naam, beschrijving)

### Veel-op-Veel Relaties
- **Movies ↔ Genres**: Een film kan meerdere genres hebben, een genre heeft meerdere films
- **Movies ↔ Screenings**: Een film kan meerdere voorstellingen hebben (one-to-many, maar kan uitgebreid)
- **Customers ↔ Movies**: Klanten kunnen favoriete films hebben (many-to-many)

### User Rollen
- **Cinema Manager**: Films toevoegen, voorstellingen plannen, zalen beheren
- **Klant**: Films bekijken, tickets kopen, eigen tickets bekijken
- **Kassamedewerker**: Tickets verkopen, voorstellingen bekijken
- **Projectionist**: Voorstellingen beheren, status updaten

### Voorbeelden User Stories
- Als manager wil ik films kunnen categoriseren op genre zodat klanten makkelijk kunnen browsen
- Als klant wil ik kunnen filteren op genre en tijd zodat ik een passende voorstelling vind
- Als kassamedewerker wil ik kunnen zien hoeveel tickets er nog beschikbaar zijn

---

## 5. Music Store Management

### Thema
Een muziekwinkel (vinyl/CD/streaming) wil een applicatie om albums, artiesten, voorraad en bestellingen te beheren. Klanten kunnen albums zoeken en bestellen.

### Database Entiteiten
- users (Laravel Breeze)
- albums (titel, artiest, jaar, label, prijs, voorraad)
- artists (naam, genre, land, biografie)
- genres (naam, beschrijving)
- orders (datum, totaalbedrag, status)
- tracks (titel, duur, tracknummer)

### Veel-op-Veel Relaties
- **Albums ↔ Artists**: Een album kan meerdere artiesten hebben (collaborations), een artiest heeft meerdere albums
- **Albums ↔ Genres**: Een album kan meerdere genres hebben, een genre heeft meerdere albums
- **Albums ↔ Orders**: Een bestelling bevat meerdere albums, een album kan in meerdere bestellingen zitten
- **Albums ↔ Tracks**: Een album heeft meerdere tracks (one-to-many normaal, maar kan many-to-many zijn als tracks op meerdere compilaties staan)

### User Rollen
- **Store Owner**: Albums beheren, voorraad bijhouden, bestellingen verwerken
- **Klant**: Albums zoeken, bestellen, bestelgeschiedenis bekijken
- **Medewerker**: Bestellingen afhandelen, voorraad beheren
- **Muziekspecialist**: Artiesten en albums toevoegen, genres beheren

### Voorbeelden User Stories
- Als store owner wil ik albums kunnen categoriseren op genre en artiest
- Als klant wil ik kunnen zoeken op artiest, genre of jaar
- Als medewerker wil ik kunnen zien welke albums bijna uitverkocht zijn

---

## 6. Pet Shop / Veterinary Clinic

### Thema
Een dierenwinkel/dierenkliniek wil een applicatie om dieren, klanten, afspraken en producten te beheren. Klanten kunnen afspraken maken en producten bestellen.

### Database Entiteiten
- users (Laravel Breeze)
- pets (naam, soort, ras, geboortedatum, gewicht)
- owners (naam, adres, telefoon, email)
- appointments (datum, tijd, type, status)
- products (naam, prijs, voorraad, categorie)
- treatments (naam, beschrijving, prijs)
- categories (voer, speelgoed, medicatie, etc.)

### Veel-op-Veel Relaties
- **Pets ↔ Treatments**: Een dier kan meerdere behandelingen krijgen, een behandeling wordt aan meerdere dieren gegeven
- **Products ↔ Categories**: Een product kan meerdere categorieën hebben, een categorie heeft meerdere producten
- **Pets ↔ Products**: Dieren kunnen verschillende producten gebruiken (voer, speelgoed) - kan via orders
- **Appointments ↔ Treatments**: Een afspraak kan meerdere behandelingen bevatten, een behandeling kan in meerdere afspraken voorkomen

### User Rollen
- **Kliniek Eigenaar**: Dieren en klanten beheren, behandelingen toevoegen
- **Dierenarts**: Afspraken beheren, behandelingen uitvoeren, medische geschiedenis bijhouden
- **Klant**: Afspraken maken, eigen dieren bekijken, producten bestellen
- **Medewerker**: Producten beheren, bestellingen afhandelen

### Voorbeelden User Stories
- Als dierenarts wil ik behandelingen kunnen koppelen aan dieren zodat de geschiedenis compleet is
- Als klant wil ik kunnen zien welke producten geschikt zijn voor mijn dier
- Als medewerker wil ik producten kunnen categoriseren op diersoort en type

---

## 7. Real Estate Management

### Thema
Een makelaarskantoor wil een applicatie om woningen, klanten, bezichtigen en contracten te beheren. Klanten kunnen zoeken naar beschikbare woningen.

### Database Entiteiten
- users (Laravel Breeze)
- properties (adres, type, prijs, oppervlakte, kamers, status)
- clients (naam, email, telefoon, budget, voorkeuren)
- viewings (datum, tijd, status, notities)
- features (tuin, garage, balkon, lift, etc.)
- neighborhoods (naam, beschrijving, gemiddelde_prijs)
- contracts (type, startdatum, einddatum, prijs)

### Veel-op-Veel Relaties
- **Properties ↔ Features**: Een woning heeft meerdere features, een feature zit op meerdere woningen
- **Properties ↔ Viewings**: Een woning kan meerdere bezichtigen hebben (one-to-many normaal)
- **Clients ↔ Properties**: Klanten kunnen favoriete woningen hebben (many-to-many)
- **Properties ↔ Neighborhoods**: Een woning kan in één wijk staan (one-to-many normaal)

### User Rollen
- **Makelaar**: Woningen toevoegen, bezichtigen inplannen, contracten beheren
- **Klant**: Woningen zoeken, bezichtigen aanvragen, favorieten bekijken
- **Kantoor Manager**: Rapporten bekijken, makelaars beheren
- **Administratie**: Contracten verwerken, documenten beheren

### Voorbeelden User Stories
- Als makelaar wil ik woningen kunnen categoriseren op features en locatie
- Als klant wil ik kunnen filteren op prijs, type en features
- Als manager wil ik kunnen zien hoeveel bezichtigen er gepland zijn

---

## 8. Travel Agency Management

### Thema
Een reisbureau wil een applicatie om reizen, klanten, boekingen en bestemmingen te beheren. Klanten kunnen reizen zoeken en boeken.

### Database Entiteiten
- users (Laravel Breeze)
- trips (bestemming, vertrekdatum, terugkeerdatum, prijs, beschikbaarheid)
- destinations (naam, land, beschrijving, klimaat)
- bookings (boekingsdatum, aantal_personen, status, totaalprijs)
- accommodations (naam, type, locatie, prijs_per_nacht)
- activities (naam, type, prijs, beschrijving)
- services (verzekering, transfer, etc.)

### Veel-op-Veel Relaties
- **Trips ↔ Destinations**: Een reis kan meerdere bestemmingen hebben (rondreis), een bestemming komt voor in meerdere reizen
- **Trips ↔ Accommodations**: Een reis kan meerdere accommodaties hebben, een accommodatie wordt gebruikt in meerdere reizen
- **Trips ↔ Activities**: Een reis bevat meerdere activiteiten, een activiteit zit in meerdere reizen
- **Bookings ↔ Services**: Een boeking kan meerdere extra services bevatten (verzekering, transfer, etc.)

### User Rollen
- **Reisagent**: Reizen samenstellen, prijzen bepalen, beschikbaarheid beheren
- **Klant**: Reizen zoeken, boeken, eigen boekingen bekijken
- **Manager**: Rapporten bekijken, reisagenten beheren
- **Customer Service**: Boekingen beheren, klantvragen beantwoorden

### Voorbeelden User Stories
- Als reisagent wil ik reizen kunnen samenstellen met meerdere bestemmingen en activiteiten
- Als klant wil ik kunnen filteren op bestemming, prijs en vertrekdatum
- Als customer service wil ik alle boekingen kunnen zien en status kunnen updaten

---

## 9. Co-Working Space Management

### Thema
Een co-working space wil een applicatie om ruimtes, leden, reserveringen en faciliteiten te beheren. Leden kunnen ruimtes en faciliteiten reserveren.

### Database Entiteiten
- users (Laravel Breeze)
- members (naam, lidmaatschap_type, startdatum)
- spaces (naam, type, capaciteit, prijs_per_uur, faciliteiten)
- reservations (datum, starttijd, eindtijd, status)
- facilities (naam, type, prijs, beschikbaarheid) - printer, vergaderruimte, etc.
- amenities (koffie, wifi, parkeren, etc.)
- plans (type, prijs, features)

### Veel-op-Veel Relaties
- **Spaces ↔ Amenities**: Een ruimte heeft meerdere faciliteiten, een faciliteit zit in meerdere ruimtes
- **Reservations ↔ Facilities**: Een reservering kan meerdere faciliteiten bevatten (ruimte + printer + parkeren)
- **Members ↔ Facilities**: Leden kunnen verschillende faciliteiten gebruiken
- **Spaces ↔ Facilities**: Een ruimte kan verschillende faciliteiten hebben (overlapping met amenities)

### User Rollen
- **Space Manager**: Ruimtes beheren, prijzen instellen, beschikbaarheid bijhouden
- **Lid**: Ruimtes reserveren, eigen reserveringen bekijken
- **Receptie**: Nieuwe leden registreren, reserveringen bevestigen
- **Facility Manager**: Faciliteiten beheren, onderhoud plannen

### Voorbeelden User Stories
- Als space manager wil ik ruimtes kunnen categoriseren op type en faciliteiten
- Als lid wil ik kunnen filteren op tijd, prijs en faciliteiten
- Als receptie wil ik kunnen zien welke ruimtes beschikbaar zijn op een bepaald tijdstip

---

## 10. Art Gallery / Museum Management

### Thema
Een galerie/museum wil een applicatie om kunstwerken, kunstenaars, tentoonstellingen en bezoekers te beheren. Bezoekers kunnen tentoonstellingen bekijken en tickets kopen.

### Database Entiteiten
- users (Laravel Breeze)
- artworks (titel, kunstenaar, jaar, medium, prijs, status)
- artists (naam, geboortedatum, nationaliteit, biografie)
- exhibitions (naam, startdatum, einddatum, locatie, thema)
- visitors (naam, email, telefoon)
- tickets (datum, tijd, prijs, type)
- categories (schilderkunst, sculptuur, fotografie, etc.)
- collections (naam, beschrijving)

### Veel-op-Veel Relaties
- **Artworks ↔ Categories**: Een kunstwerk kan meerdere categorieën hebben, een categorie heeft meerdere kunstwerken
- **Artworks ↔ Exhibitions**: Een kunstwerk kan in meerdere tentoonstellingen voorkomen, een tentoonstelling heeft meerdere kunstwerken
- **Artworks ↔ Collections**: Een kunstwerk kan in meerdere collecties zitten, een collectie heeft meerdere kunstwerken
- **Artists ↔ Exhibitions**: Een kunstenaar kan meerdere tentoonstellingen hebben, een tentoonstelling kan meerdere kunstenaars bevatten

### User Rollen
- **Galerie Manager**: Kunstwerken toevoegen, tentoonstellingen organiseren, prijzen bepalen
- **Bezoeker**: Tentoonstellingen bekijken, tickets kopen, favoriete kunstwerken bekijken
- **Curator**: Tentoonstellingen samenstellen, kunstwerken categoriseren
- **Receptie**: Tickets verkopen, bezoekers helpen

### Voorbeelden User Stories
- Als curator wil ik kunstwerken kunnen koppelen aan meerdere tentoonstellingen en categorieën
- Als bezoeker wil ik kunnen filteren op kunstenaar, categorie en periode
- Als manager wil ik kunnen zien welke kunstwerken het meest populair zijn

---

## 11. Sports Club Management

### Thema
Een sportclub wil een applicatie om teams, spelers, wedstrijden en competities te beheren. Spelers kunnen hun wedstrijden en statistieken bekijken.

### Database Entiteiten
- users (Laravel Breeze)
- players (naam, geboortedatum, positie, rugnummer)
- teams (naam, competitie, seizoen)
- matches (datum, tijd, locatie, thuis_team, uit_team, uitslag)
- competitions (naam, type, seizoen)
- positions (naam, beschrijving) - aanvaller, verdediger, etc.
- statistics (doelpunten, assists, kaarten, etc.)

### Veel-op-Veel Relaties
- **Players ↔ Teams**: Een speler kan in meerdere teams spelen (verschillende competities/seizoenen), een team heeft meerdere spelers
- **Players ↔ Positions**: Een speler kan meerdere posities spelen, een positie wordt door meerdere spelers gespeeld
- **Teams ↔ Competitions**: Een team kan in meerdere competities spelen, een competitie heeft meerdere teams
- **Matches ↔ Teams**: Een wedstrijd heeft twee teams (thuis en uit) - dit is technisch many-to-many
- **Players ↔ Matches**: Een speler speelt in meerdere wedstrijden, een wedstrijd heeft meerdere spelers (via team)

### User Rollen
- **Club Manager**: Teams beheren, spelers registreren, wedstrijden plannen
- **Coach**: Team samenstellingen bepalen, statistieken bijhouden
- **Speler**: Eigen wedstrijden bekijken, statistieken zien
- **Secretaris**: Competities beheren, uitslagen invoeren

### Voorbeelden User Stories
- Als coach wil ik spelers kunnen koppelen aan meerdere teams en posities
- Als speler wil ik mijn statistieken kunnen bekijken per wedstrijd
- Als secretaris wil ik wedstrijden kunnen plannen en uitslagen invoeren

---

## 12. Repair Shop Management

### Thema
Een reparatiewerkplaats wil een applicatie om klanten, reparaties, onderdelen en apparaten te beheren. Klanten kunnen reparaties aanvragen en de status volgen.

### Database Entiteiten
- users (Laravel Breeze)
- customers (naam, email, telefoon, adres)
- devices (merk, model, type, serienummer)
- repairs (datum_in, datum_uit, probleem, status, kosten)
- parts (naam, type, prijs, voorraad)
- services (diagnose, reparatie, onderhoud, etc.)
- technicians (naam, specialisatie, ervaring)

### Veel-op-Veel Relaties
- **Repairs ↔ Parts**: Een reparatie gebruikt meerdere onderdelen, een onderdeel wordt gebruikt in meerdere reparaties
- **Repairs ↔ Services**: Een reparatie kan meerdere services bevatten (diagnose + reparatie + testen)
- **Technicians ↔ Services**: Een technicus kan meerdere services uitvoeren, een service wordt door meerdere technici uitgevoerd
- **Devices ↔ Parts**: Een apparaattype kan bepaalde onderdelen gebruiken (compatibiliteit)

### User Rollen
- **Werkplaats Manager**: Reparaties beheren, onderdelen bestellen, prijzen bepalen
- **Klant**: Reparaties aanvragen, status volgen, facturen bekijken
- **Technicus**: Reparaties toewijzen, status updaten, onderdelen gebruiken
- **Medewerker Receptie**: Klanten helpen, reparaties registreren

### Voorbeelden User Stories
- Als technicus wil ik kunnen zien welke onderdelen nodig zijn voor een reparatie
- Als klant wil ik de status van mijn reparatie kunnen volgen
- Als manager wil ik kunnen zien welke onderdelen op zijn en bestellen

---

## Overzicht - Veel-op-Veel Relaties per Project

| Project | Veel-op-Veel Relatie(s) |
|---------|------------------------|
| Restaurant | Dishes ↔ Categories, Dishes ↔ Orders, Dishes ↔ Ingredients |
| Fitness Center | Members ↔ Classes, Trainers ↔ Classes, Members ↔ Equipment |
| Car Rental | Cars ↔ Features, Customers ↔ Features (voorkeuren) |
| Cinema | Movies ↔ Genres, Customers ↔ Movies (favorieten) |
| Music Store | Albums ↔ Artists, Albums ↔ Genres, Albums ↔ Orders |
| Pet Shop | Pets ↔ Treatments, Products ↔ Categories, Appointments ↔ Treatments |
| Real Estate | Properties ↔ Features, Clients ↔ Properties (favorieten) |
| Travel Agency | Trips ↔ Destinations, Trips ↔ Accommodations, Trips ↔ Activities, Bookings ↔ Services |
| Co-Working Space | Spaces ↔ Amenities, Reservations ↔ Facilities |
| Art Gallery | Artworks ↔ Categories, Artworks ↔ Exhibitions, Artworks ↔ Collections, Artists ↔ Exhibitions |
| Sports Club | Players ↔ Teams, Players ↔ Positions, Teams ↔ Competitions |
| Repair Shop | Repairs ↔ Parts, Repairs ↔ Services, Technicians ↔ Services |

---

## Aanbevelingen voor Gebruik

1. **Kies thema's die studenten aanspreken**: Verschillende thema's spreken verschillende studenten aan
2. **Varieer complexiteit**: Sommige projecten hebben meer veel-op-veel relaties dan anderen
3. **Balanceer realisme**: Zorg dat projecten realistisch genoeg zijn maar niet te complex
4. **Testbaarheid**: Zorg dat elk project duidelijk testbare features heeft
5. **Documentatie**: Gebruik hetzelfde format als de bestaande projectdocumenten

## Aanpassingen voor Specifieke Klassen

- Pas projectnamen aan (projectnamen in Laravel: kleine letters, enkelvoud of samenstelling)
- Pas database namen aan (overeenkomstig met projectnaam)
- Pas user rollen aan naar wens
- Voeg of verwijder features om complexiteit aan te passen

---

**Nota Bene**: Deze project suggesties zijn bedoeld als inspiratie. Pas ze aan naar de specifieke behoeften van je klas en leerdoelen. Alle projecten volgen dezelfde structuur en vereisten als de bestaande projecten in deze map.

