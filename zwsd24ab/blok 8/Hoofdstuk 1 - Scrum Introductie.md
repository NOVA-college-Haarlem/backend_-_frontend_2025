# Hoofdstuk 1

## Scrum

### Het probleem

Stel: je bouwt met je team een app. Jullie verdelen het werk aan het begin en spreken af: "Jij doet de database, ik doe de front-end, hij doet de login." Zes weken later kom je samen en probeer je alles te combineren. Wat gaat er mis?

- Dingen sluiten niet op elkaar aan
- Iemand heeft iets helemaal anders gebouwd dan verwacht
- De klant wil op het laatste moment iets veranderen, maar alles is al klaar (of bijna klaar)
- Eén teamlid is weken lang vastgelopen maar heeft niets gezegd

Dit is hoe software **vroeger** werd gemaakt. Het heet de **Waterfall-methode**: eerst alles plannen, dan alles bouwen, dan alles testen. Het probleem? De werkelijkheid houdt zich nooit aan het plan.

**Scrum** is een andere aanpak. In plaats van alles vooraf plannen, werk je in korte cycli van 2 à 3 weken. Na elke cyclus laat je iets werkends zien. Je past bij waar nodig.

---

## De drie rollen

### Product Owner (PO)
De PO bepaalt **wat** er gebouwd wordt. Hij of zij vertegenwoordigt de opdrachtgever en beheerd de **Product Backlog** — een lijst met alles wat de applicatie moet kunnen.

In dit blok is je **docent** de Product Owner.

### Scrum Master
De Scrum Master zorgt ervoor dat het team volgens Scrum werkt. Hij of zij ruimt obstakels op, organiseert de ceremonies en houdt de focus erin. De Scrum Master is **geen baas** — het is een dienende rol.

In jouw team wijst één persoon de Scrum Master-rol op zich. Je kunt dit ook laten rouleren per sprint.

### Development Team
Dat ben jij en je teamgenoten. Jullie bepalen **hoe** alles gebouwd wordt. Jullie zijn verantwoordelijk voor de technische kwaliteit van het product.

---

## De drie ceremonies

### Sprint Planning
Aan het begin van elke sprint bespreekt het team met de PO welke items uit de backlog opgepakt worden. Je maakt een **Sprint Backlog**: de lijst met taken voor deze sprint.

> Vraag jezelf altijd af: "Kunnen we dit realistisch bouwen in de tijd die we hebben?"

### Daily Stand-up
Elke dag een korte meeting van maximaal 15 minuten. Iedereen beantwoordt drie vragen:

1. Wat heb ik gisteren gedaan?
2. Wat ga ik vandaag doen?
3. Loop ik ergens tegenaan?

Het doel is niet rapporteren aan de baas. Het doel is dat het team weet wat er speelt en elkaar kan helpen.

### Sprint Review
Aan het einde van een sprint demonstreert het team de werkende software aan de PO. Geen PowerPoint, geen uitleg — gewoon laten zien wat het doet.

De PO geeft feedback: wat is goed, wat mist er nog, wat verandert er?

### Sprint Retrospective
Na de Review kijkt het team terug op het **proces** (niet het product). Wat ging goed? Wat kan beter? Je maakt concrete afspraken voor de volgende sprint.

Een handige methode: **Start / Stop / Continue**

| Start | Stop | Continue |
|-------|------|----------|
| Wat moeten we beginnen te doen? | Wat moeten we stoppen met doen? | Wat werkt goed en houden we vast? |

---

## De drie artifacts

### Product Backlog
Een geprioriteerde lijst van alles wat het product moet kunnen. De PO beheert deze lijst. Bovenaan staat wat het belangrijkst is.

Items in de backlog worden opgeschreven als **User Stories** (zie Hoofdstuk 2).

### Sprint Backlog
De subset van de Product Backlog die het team oppakt in de huidige sprint. Het team verdeelt de user stories in concrete taken.

### Increment
Het werkende stuk software dat aan het einde van de sprint wordt opgeleverd. Elk increment bouwt voort op het vorige.

---

## Scrum in één plaatje

```
Product Backlog
     │
     ▼
Sprint Planning ──► Sprint Backlog
                          │
                          ▼
                    Sprint (2-3 weken)
                    ┌─────────────────┐
                    │  Daily Stand-up │
                    │  (elke dag)     │
                    └─────────────────┘
                          │
                          ▼
                    Werkend product (Increment)
                          │
              ┌───────────┴───────────┐
              ▼                       ▼
        Sprint Review          Sprint Retro
        (wat hebben           (hoe werkte
         we gebouwd?)          het samen?)
```

---

## Opdracht 1 – Teamvorming

Je docent verdeelt de groepen en projecten.

1. Ga met je team bij elkaar zitten.
2. Bepaal wie de **Scrum Master** is (of spreek af dat je dit elke sprint wisselt).
3. Bespreek kort: wat zijn de sterke punten van ieder teamlid? Wie is goed in front-end, back-end, database, plannen?
4. Noteer dit en deel het met je docent.

---

## Opdracht 2 – Scrum tool

Je docent geeft je toegang tot de scrumtool.

1. Log in met je gegevens.
2. Zorg dat alle teamleden toegang hebben.
3. Bekijk de interface: waar staat de backlog, hoe maak je een taak aan, hoe update je de status?

---

## Opdracht 3 – Eerste kennismaking met je project

Lees de projectomschrijving in de map `projecten/` goed door.

1. Schrijf voor jezelf op: wat zijn de **drie belangrijkste functies** die dit systeem moet hebben?
2. Bespreek dit als team. Zijn jullie het eens?
3. Schrijf op: welke Laravel-onderdelen heb je nodig die je al kent? (denk aan: models, controllers, middleware, authenticatie...)
4. Schrijf op: wat weet je nog **niet** hoe je het moet bouwen?

Bewaar dit — het is de basis voor je eerste Sprint Planning.
