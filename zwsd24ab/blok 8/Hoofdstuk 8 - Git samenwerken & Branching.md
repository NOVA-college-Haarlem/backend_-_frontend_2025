# Hoofdstuk 8

## Git samenwerken & Branching

Je werkt al met Git — commits maken, pushen naar GitHub, code ophalen met `git pull`. Maar in een team van vier loopt dat al snel mis als iedereen op dezelfde branch werkt.

In dit hoofdstuk leer je werken met **feature branches**: één branch per taak. Dit is precies hoe teams in de echte beroepspraktijk werken. Het sluit ook direct aan bij Scrum — elke user story krijgt zijn eigen branch.

---

## Waarom branches?

Stel: jij werkt aan de zoekfunctie en je teamgenoot werkt tegelijkertijd aan het inlogscherm. Jullie werken allebei in dezelfde bestanden. Als jullie tegelijk pushen naar `main`, overschrijft de één de code van de ander.

Met branches werk je **geïsoleerd**:
- Jouw zoekfunctie leeft op `feature/zoekfunctie`
- Het inlogscherm leeft op `feature/inlogscherm`
- `main` blijft altijd werkende, stabiele code

Pas als een feature klaar en gecontroleerd is, voeg je hem samen met `main`.

---

## Branches en Scrum

In blok 8 werk je met user stories en sprints. Branches passen hier perfect bij:

| User story | Branch naam |
|---|---|
| Als bezoeker wil ik kunnen inloggen | `feature/inloggen` |
| Als admin wil ik gebruikers kunnen beheren | `feature/gebruikersbeheer` |
| Als medewerker wil ik uren kunnen registreren | `feature/uren-registreren` |

Eén story = één branch. Zo weet iedereen in het team precies waar welke code staat.

---

## Basisworkflow met branches

### 1. Nieuwe branch aanmaken

```bash
git checkout -b feature/zoekfunctie
```

Je bent nu op een nieuwe branch. Alles wat je nu commit, staat alleen op deze branch.

### 2. Werken en committen

Normaal werken:

```bash
git add .
git commit -m "feat: zoekbalk toegevoegd aan overzichtspagina"
```

### 3. Branch naar GitHub pushen

De eerste keer:

```bash
git push -u origin feature/zoekfunctie
```

Daarna gewoon:

```bash
git push
```

### 4. Terug naar main

Als je even op de hoofdbranch wil kijken of werken:

```bash
git checkout main
git pull
```

### 5. Samenvoegen (mergen)

Als je feature klaar is, voeg je hem samen met `main`:

```bash
git checkout main
git pull
git merge feature/zoekfunctie
git push
```

---

## Pull Requests

In de meeste teams merge je niet zelf. Je maakt een **Pull Request (PR)** op GitHub: een verzoek aan je teamgenoten om jouw branch te controleren en goed te keuren vóór het samenvoegen.

### PR aanmaken op GitHub

1. Ga naar jouw repository op GitHub
2. GitHub toont vanzelf: _"Compare & pull request"_ als je net een branch hebt gepusht — klik daarop
3. Geef een duidelijke titel en een korte beschrijving van wat je hebt gebouwd
4. Kies als base `main` en als compare jouw feature branch
5. Klik op **Create pull request**

Je teamgenoot kan nu de code bekijken, commentaar geven, en uiteindelijk op **Merge pull request** klikken.

> In veel bedrijven mag je jouw eigen PR niet mergen. Iemand anders moet hem goedkeuren. Dit heet een **code review**.

---

## Merge conflicts

Soms wijzigen twee mensen dezelfde regel in hetzelfde bestand. Git weet dan niet welke versie de juiste is. Dit heet een **merge conflict**.

### Hoe ziet een conflict eruit?

Als je merget en er een conflict is, ziet het bestand er zo uit:

```
<<<<<<< HEAD
    return view('taken.index', compact('taken'));
=======
    return view('taken.overzicht', compact('taken'));
>>>>>>> feature/takenoverzicht
```

- **Boven** `=======` staat jouw huidige code (`HEAD`)
- **Onder** `=======` staat de code van de branch die je wil mergen

### Conflict oplossen

1. Open het bestand in je editor
2. Besluit welke versie je wil houden — of combineer ze
3. Verwijder de conflict-markeringen (`<<<<<<<`, `=======`, `>>>>>>>`)
4. Sla het bestand op
5. Commit de oplossing:

```bash
git add .
git commit -m "fix: merge conflict in TaakController opgelost"
```

> **Tip**: VS Code toont merge conflicts visueel met knoppen als _Accept Current Change_ en _Accept Incoming Change_. Dit maakt het oplossen een stuk makkelijker.

---

## Naamgeving van branches

Gebruik consistente namen in je team. Gangbare conventies:

| Type | Prefix | Voorbeeld |
|---|---|---|
| Nieuwe feature | `feature/` | `feature/aanmelding-formulier` |
| Bugfix | `fix/` | `fix/login-redirect` |
| Kleine aanpassing | `chore/` | `chore/readme-bijwerken` |

Gebruik altijd **kebab-case** (kleine letters met koppeltekens) en geen spaties of hoofdletters.

---

## Veelgemaakte fouten

- **Rechtstreeks op `main` werken** — dan heeft het hele team meteen last van jouw onafgemaakte code.
- **Vergeten te pullen vóór een merge** — altijd eerst `git pull` op `main` doen, anders werk je met verouderde code.
- **Een branch te lang open houden** — hoe langer een branch bestaat, hoe groter de kans op conflicten. Kleine, snelle branches werken beter.
- **Onduidelijke branch namen** — `feature/test` of `mijn-branch` zegt niets. Gebruik de naam van de user story.
- **Conflict-markeringen laten staan** — vergeet je de `<<<<<<<`-regels te verwijderen, crasht de applicatie.

---

## Opdracht 1 — Feature branch per taak (verplicht)

Spreek met je team af dat jullie vanaf nu voor elke taak in de sprint een eigen branch gebruiken.

1. Kies een openstaande taak uit jullie sprint backlog
2. Maak een branch aan met een passende naam (`feature/...`)
3. Bouw de feature op die branch
4. Push de branch naar GitHub
5. Maak een Pull Request aan en vraag een teamgenoot om te reviewen
6. Laat de teamgenoot de PR mergen

**Inlevereis:**
- Jouw repository toont minimaal één gesloten Pull Request
- De branch naam volgt de naamconventie
- Je kunt mondeling uitleggen waarom je niet rechtstreeks op `main` werkt

---

## Opdracht 2 — Merge conflict oplossen (verdieping)

Maak bewust een merge conflict aan en los het op.

**Stappenplan:**

1. Maak twee branches aan vanuit dezelfde `main`:
   ```bash
   git checkout -b feature/branch-a
   ```
2. Wijzig dezelfde regel in hetzelfde bestand en commit
3. Doe hetzelfde op `feature/branch-b`
4. Merge `branch-a` in `main`
5. Merge daarna `branch-b` — nu krijg je een conflict
6. Los het conflict op en commit

**Inlevereis:**
- Je kunt een merge conflict herkennen in de editor
- Je kunt uitleggen welke keuze je hebt gemaakt bij het oplossen
- De repository heeft geen conflict-markeringen meer in de code

---

## Koppeling met Scrum en assessment

Branches passen direct in jullie Scrum-workflow:

- **Sprint Planning**: verdeel user stories → maak meteen de bijbehorende branches aan
- **Daily Stand-up**: "Ik werk aan `feature/aanmelding-formulier`" is concreter dan "ik ben bezig met aanmelden"
- **Sprint Review**: de PR-geschiedenis op GitHub laat zien wie wat heeft gebouwd

Tijdens je assessment kun je met branches en Pull Requests aantonen dat je professioneel samenwerkt. Een nette Git-history laat zien dat jij weet hoe teams in de praktijk werken.
