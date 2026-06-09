# Week 9 — Afronden eigen mini-app & assessmentvoorbereiding

**Type:** afrondings- en oefenweek (geen nieuwe stof)
**Doel:** de eigen PlayList-app afmaken én oefenen met het *verantwoorden* van je code — de kern van het mondeling assessment in week 10.

> Deze week traint expliciet de nieuwe bottleneck-vaardigheid: **kun je code lezen, uitleggen en controleren?** Niet: kun je nog meer bouwen.

## Leerdoelen

Na deze week kan de student:
- zijn eigen app foutloos demonstreren en elke laag (route → controller → model → view) benoemen;
- van een willekeurige regel uitleggen wat die doet en waarom;
- een stuk (AI-)code controleren op fouten en verbeteren;
- de assessment-rubric toepassen op zijn eigen werk.

## Programma

### Maandag — Afmaken & opschonen
- App compleet maken: alle 4 CRUD-operaties werkend, validatie aanwezig, nette opmaak.
- Code opschonen: dode code weg, duidelijke namen, korte commentaren waar nodig.
- Repo netjes: README met korte uitleg + screenshots.

### Dinsdag — "Leg je code uit" (pair-review)
In tweetallen. Student A wijst een willekeurige regel in de code van student B aan; B legt uit wat die doet. Daarna omgekeerd. Docent loopt rond en stelt verdiepingsvragen.
> Doel: ontdekken wélke regels je nog niet snapt — vóór het assessment, niet erin.

### Woensdag — "Debug deze AI-output" (assessment-stijl)
Klassikale opdracht: ieder krijgt dezelfde lap **AI-gegenereerde Laravel-code met 3 ingebouwde fouten** (bv. array-notatie op een object, ontbrekende `@csrf`, GET-route voor een POST-form). Vind ze, leg uit waarom het fout is, verbeter ze. Bespreek klassikaal.

### Donderdag — Proefassessment
Elke student doet een **mini-mondeling van 5 min** met een klasgenoot of de docent, met de echte rubric ernaast. Feedback: welk niveau zit je nu, wat moet beter?

### Vrijdag — Bijschaven & inleveren
Laatste verbeteringen op basis van de feedback. **Repo definitief inleveren** (deadline). Korte zelfreflectie schrijven (zie onder).

## Oefenvragen voor het assessment (deel met studenten!)

Bereid je voor op vragen als:
- "Laat zien wat er gebeurt als ik op deze URL kom — welke code draait er, in welke volgorde?"
- "Wijs de plek aan waar jouw data uit de database komt. Wat staat daar precies?"
- "Wat gebeurt er als ik dit formulier verstuur met een leeg veld? Waarom?"
- "Waarom staat hier een `if` / een `foreach`? Wat als ik die weghaal?"
- "Welk deel van deze code heeft AI voor je geschreven, en snap je het?"
- "Hier zit een fout in — kun je hem vinden en uitleggen?"

## Zelfreflectie (inleveren)
1. Welke 3 begrippen uit dit blok snap je nu goed? Geef bij elk een voorbeeld uit je eigen code.
2. Welk begrip vind je nog lastig?
3. Waar heb je AI gebruikt, en hoe controleerde je of de code klopte?
