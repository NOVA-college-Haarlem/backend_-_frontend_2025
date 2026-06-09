# Week 10 — Mondeling assessment

**Type:** summatieve toetsing (afsluiting blok)
**Vorm:** individueel mondeling gesprek van **±20 minuten** over de eigen PlayList-app.
**Beoordeeld wordt:** begrip en verificatie — *niet* of de app perfect werkt.

> Kern van de AI-bestendige toetsing: een student die zijn code niet zelf schreef maar wél volledig begrijpt, slaagt. Een student die een perfecte app inlevert maar niets kan uitleggen, niet. Dat is precies de bedoeling.

## Opzet van het gesprek

| Fase | Tijd | Inhoud |
|------|------|--------|
| 1. Demo | 3 min | Student toont de werkende app (CRUD-rondje) |
| 2. Rondleiding door de code | 7 min | Student legt uit hoe een request door de app loopt (route → controller → model → view) |
| 3. Verdiepingsvragen | 7 min | Docent wijst willekeurige regels aan: "wat doet dit, waarom staat het er?" |
| 4. Debug-vraag | 3 min | Docent introduceert live een fout (of toont een foutmelding); student diagnosticeert |

## Vaste vragenset (docent kiest 4-5)

**Read / weergave**
- Wijs aan waar je data uit de database komt. Wat doet die regel precies?
- Hoe weet je app welke games getoond worden? Wat als de tabel leeg is?

**Routing / MVC**
- Ik typ deze URL in — welke code draait er, en in welke volgorde?
- Wat is het verschil tussen je route, je controller en je view?

**Create / Update / validatie**
- Wat gebeurt er als ik dit formulier met een leeg veld verstuur? Waarom?
- Waar wordt de data opgeslagen? Welke methode hoort daarbij?

**Delete / veiligheid**
- Waarom verwijder je met een formulier en niet met een gewone link?
- Wat doet `@csrf` ook alweer, op hoofdlijn?

**AI & verificatie**
- Welk deel heeft AI geschreven? Hoe controleerde je of het klopte?
- *(Live)* Hier verander ik één ding zodat het stuk gaat — wat is er nu mis?

## Beoordeling
Gebruik [Rubric - Mondeling assessment](Rubric%20-%20Mondeling%20assessment.md). Vul tijdens of direct na het gesprek in. Geef mondeling één concreet sterk punt en één ontwikkelpunt.

## Praktische organisatie
- Plan ~20 min per student + 5 min uitloop/invullen. Reken op 2-3 dagdelen voor een volle klas.
- Laat wachtende studenten aan een **verdiepingsopdracht** of peer-review werken.
- Neem (met toestemming) audio op bij twijfelgevallen, voor de tweede beoordelaar.
- Repo moet vóór het gesprek ingeleverd zijn (week 9-deadline) — er wordt over de ingeleverde versie gesproken.
