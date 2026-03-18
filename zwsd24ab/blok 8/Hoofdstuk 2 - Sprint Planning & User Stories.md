# Hoofdstuk 2

## Sprint Planning & User Stories

### Wat is een User Story?

Een User Story is een korte beschrijving van een functie vanuit het perspectief van een gebruiker. Het gaat niet om technische details — het gaat om **wat iemand wil kunnen doen en waarom**.

De standaardvorm is:

> **Als** [type gebruiker] **wil ik** [actie] **zodat** [doel/reden].

Voorbeelden:

> Als **organisator** wil ik een evenement aanmaken met een maximaal aantal deelnemers, zodat de zaal niet overboekt raakt.

> Als **medewerker** wil ik mijn gewerkte uren per project kunnen inzien, zodat ik mijn overzicht bijhoud.

> Als **receptionist** wil ik zien welke bezoekers momenteel in het pand zijn, zodat ik bij een noodsituatie weet wie er is.

---

### Acceptatiecriteria

Elke user story heeft **acceptatiecriteria** — concrete voorwaarden waaraan de functie moet voldoen voordat hij als "klaar" geldt. Zonder acceptatiecriteria weet je niet wanneer je klaar bent.

Voorbeeld:

**User Story**: Als organisator wil ik een evenement aanmaken.

**Acceptatiecriteria**:
- Het formulier bevat: naam, datum, locatie, beschrijving, max. aantal deelnemers
- Datum mag niet in het verleden liggen
- Na opslaan word ik doorgestuurd naar het evenementoverzicht
- Het evenement is direct zichtbaar in de lijst

---

### Wat maakt een goede User Story?

Gebruik het **INVEST**-model als check:

| Letter | Betekenis | Vraag |
|--------|-----------|-------|
| **I** | Independent | Kan deze story los van anderen gebouwd worden? |
| **N** | Negotiable | Is er ruimte om details te bespreken met de PO? |
| **V** | Valuable | Levert dit waarde op voor de gebruiker? |
| **E** | Estimable | Kunnen we inschatten hoe lang dit duurt? |
| **S** | Small | Kan dit in één sprint gebouwd worden? |
| **T** | Testable | Kunnen we controleren of het werkt? |

Als het antwoord op één van deze vragen "nee" is, moet je de story aanpassen of opsplitsen.

---

### Story Points

Story Points zijn een manier om in te schatten **hoe complex** een taak is — niet hoeveel uur het kost.

Gebruik de **Fibonacci-reeks**: 1 – 2 – 3 – 5 – 8 – 13

| Punten | Wat betekent het? |
|--------|-------------------|
| 1 | Heel klein, nauwelijks werk |
| 2 | Klein, ik heb dit eerder gedaan |
| 3 | Normaal, een uurtje of twee |
| 5 | Wat groter, bevat onzekerheden |
| 8 | Complex, meerdere onderdelen |
| 13 | Veel te groot — splits op! |

> **Tip**: Schat story points altijd als team. Gebruik Planning Poker: iedereen toont tegelijk zijn schatting. Grote verschillen zijn een signaal dat mensen het er niet over eens zijn wat er gedaan moet worden.

---

### Sprint Planning uitvoeren

De Sprint Planning verloopt in twee stappen:

**Stap 1 – Wat gaan we bouwen?**
De PO legt de bovenste items van de Product Backlog uit. Het team stelt vragen, begrijpt de acceptatiecriteria en beslist welke stories in de sprint passen.

**Stap 2 – Hoe gaan we het bouwen?**
Het team breekt elke user story op in concrete **taken**. Taken zijn technisch en specifiek.

Voorbeeld:

| User Story | Taken |
|------------|-------|
| Als organisator wil ik een evenement aanmaken | - Migration aanmaken voor `events` tabel<br>- Model + Controller aanmaken<br>- Formulier bouwen in Blade<br>- Validatie toevoegen<br>- Route aanmaken<br>- Redirect na opslaan |

Elke taak wordt in de scrumtool gezet en krijgt één eigenaar.

---

## Opdracht 1 – ERD tekenen

Voordat je één regel code schrijft, maak je een **Entity Relationship Diagram (ERD)** van je database.

1. Bespreek als team welke tabellen je nodig hebt.
2. Teken het ERD op papier of in een tool zoals [drawio.io](https://app.diagrams.net/) of [dbdiagram.io](https://dbdiagram.io/).
3. Noteer per tabel de kolommen en het datatype.
4. Geef aan welke relaties er zijn (one-to-many, many-to-many).
5. Laat het ERD goedkeuren door je docent voordat je begint.

---

## Opdracht 2 – User Stories schrijven

1. Lees je projectomschrijving nogmaals goed door.
2. Schrijf minimaal **10 user stories** voor jouw project. Zorg dat je alle gebruikersrollen dekt.
3. Schrijf bij elke user story minimaal **2 acceptatiecriteria**.
4. Voeg de user stories toe aan de Product Backlog in de scrumtool.

---

## Opdracht 3 – Prioriteren & Sprint Backlog

1. Bespreek met je PO (docent) welke user stories het belangrijkst zijn.
2. Zet de backlog in volgorde van prioriteit: wat moet er zeker in Sprint 1?
3. Schat de story points per user story als team.
4. Bepaal wat je realistisch in Sprint 1 kunt bouwen.
5. Maak de Sprint Backlog aan in de scrumtool en verdeel de taken.

---

## Opdracht 4 – Laravel project opzetten

Nu je weet wat je gaat bouwen, zet je het project op.

```bash
# Nieuw Laravel project aanmaken via Herd of via terminal:
composer create-project laravel/laravel naam-van-je-project

# Starter kit installeren voor authenticatie
# Gebruik Laravel Breeze of de starter kit van je docent:
# https://github.com/LaravelDaily/starter-kit/

# Database aanmaken en .env instellen
# Migrations uitvoeren:
php artisan migrate

# Git repository aanmaken op GitHub
# Alle teamleden toevoegen als collaborator
```

Zorg dat iedereen de repository heeft gecloned en lokaal aan de slag kan voor de projectweek begint.
