# Blok Backend Development — PILOT (PRIMM-aanpak)

> **Eerste backend-blok** voor zwds26ab. 10 weken. Stack: plain PHP → Laravel-brug.
> Didactisch model: **PRIMM** (Predict – Run – Investigate – Modify – Make) met één doorlopende context.
> Zie ook: [Didactische aanpak - top-down vs bottom-up in AI-tijdperk](../Didactische%20aanpak%20-%20top-down%20vs%20bottom-up%20in%20AI-tijdperk.md)

## Doorlopende context: "PlayList"

Studenten bouwen 10 weken lang aan **PlayList** — een catalogus van games (of films/series/muziek, eigen keuze). De app groeit mee met wat ze leren:

| Wat ze al kunnen | Wordt in dit blok | 
|---|---|
| Statische HTML/CSS pagina's (Blok 1-4) | Een dynamische pagina die data uit een **database** toont, en waar je items kunt **toevoegen, wijzigen en verwijderen** (CRUD), eerst in plain PHP, daarna in Laravel. |

Eén context = elke week bouwt herkenbaar voort. Geen losse "hello world"-oefeningen.

## Kernconcepten (de spiraal-ruggengraat)

Dit zijn de concepten die een student aan het eind **zelf moet kunnen verantwoorden** (= toetsdoel mondeling). Ze komen meerdere keren terug, steeds in rijkere context:

1. **Client vs server** — wat gebeurt waar? (request/response)
2. **Variabele & datatype** in PHP
3. **Array & associatief array** — data structureren
4. **Conditie & loop** — `if`, `foreach` voor weergave
5. **Database & query** — `SELECT`, later Eloquent
6. **Formulierverwerking** — `$_POST` → opslaan (`INSERT`/`store`)
7. **CRUD** — Create, Read, Update, Delete
8. **Koppeling FE ↔ BE** — formulier → database → weergave (de mijlpaal)
9. **MVC & routing** (Laravel) — herframing van wat ze al deden
10. **Validatie & basisveiligheid**

## Weekplanning

| Week | Type | Onderwerp | Kernconcept(en) |
|------|------|-----------|-----------------|
| 1 | Les | Van statisch naar dynamisch (PHP) | client/server, variabele |
| 2 | Les | Data tonen met arrays | array, loop, conditie |
| 3 | Les | Data uit de database (PDO) | database, query, koppeling |
| **4** | **Project** | Eigen catalogus uit een database | integratie weken 1-3 |
| 5 | Les | Waarom een framework? (Laravel-intro) | routing, MVC-intro |
| 6 | Les | Eloquent & Models | Model, Controller, Eloquent |
| 7 | Les | Formulieren & opslaan (Create + validatie) | `$_POST`→store, validatie |
| 8 | Les | CRUD compleet (Update & Delete) | volledige CRUD |
| 9 | Les | Afronden eigen mini-app + assessmentvoorbereiding | verificatie, code lezen |
| **10** | **Assessment** | Mondeling assessment | verantwoorden van eigen code |

## De PRIMM-lesstructuur (past in 90 min)

Elke lesweek volgt dezelfde ritmiek. Studenten krijgen **werkende code** als startpunt — niet een leeg bestand.

| Fase | Tijd | Wat | Waarom |
|------|------|-----|--------|
| **Predict** | 10 min | Lees de meegegeven code, voorspel wat die doet (op papier/in tweetal, **nog niet draaien**) | dwingt *lezen* af i.p.v. typen |
| **Run** | 10 min | Draai de code, toets je voorspelling | directe feedback + succeservaring |
| **Investigate** | 20 min | Docent stelt vragen: "wat doet regel X?", "wat als je dit weghaalt?". Hier komt de bottom-up theorie | begrip op concept-niveau |
| **Modify** | 20 min | Kleine aanpassingen aan de werkende code (gelaagd) | veilig, laagdrempelig |
| **Make** | 30 min | Zelf uitbreiden in eigen PlayList | toepassen + eigenaarschap |

> **I do → We do → You do** zit hierin verweven: Predict/Run = samen, Investigate = docent doet voor (live coding), Modify = begeleid, Make = zelfstandig.

## AI-gebruik in dit blok

AI is **toegestaan en wordt actief geoefend** — maar de norm is: *"ik kan elke regel verantwoorden"*. Zie [AI-gebruiksbeleid klas](AI-gebruiksbeleid%20klas.md).

- **Predict & Investigate**: AI uit. Dit traint lezen/begrijpen — de nieuwe kernvaardigheid.
- **Modify & Make**: AI mag, mits de student kan uitleggen wat de gegenereerde code doet.
- Elke 2-3 weken een **"debug deze AI-output"-opdracht**: bewust foute AI-code die de student moet vinden en verbeteren.

## Toetsing

- **Formatief** (weken 1-9): korte code-review-gesprekjes ("leg deze regel uit"), check bij elke demo. Geen cijfer, wel sturen.
- **Summatief** (week 10): **mondeling assessment** over de eigen PlayList-app. Beoordeling op **begrip en verificatie**, niet op "werkt het". Zie [Rubric - Mondeling assessment](Rubric%20-%20Mondeling%20assessment.md).
- Bewijsdossier: GitHub/GitLab-repo van de eigen PlayList-app.

## Benodigdheden / setup

- XAMPP of Laragon (Apache + MySQL + PHP) voor de plain-PHP weken
- DB Browser of phpMyAdmin als visuele databaselaag
- Vanaf week 5: Composer + Laravel + Laravel Herd/`php artisan serve`
- VS Code, Git
