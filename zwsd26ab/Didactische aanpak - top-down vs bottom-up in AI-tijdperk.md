# Didactische aanpak zwds26ab — coderen leren in het AI-tijdperk

> Advies over de keuze tussen top-down en bottom-up bij het leren coderen (backend, frontend, fullstack), nu studenten veel gebruikmaken van AI.

## Kort antwoord: niet kiezen tussen top-down en bottom-up

Beide pure vormen falen juist *door* de AI-factor:

- **Pure bottom-up** (variabelen → loops → functies → ... → app, zoals we nu doen): degelijke basis, maar de losse syntax-oefeningen zijn precies het soort opgaven die AI in 2 seconden oplost. Studenten haken af ("waarom zou ik dit zelf typen?") én leren niets, want ze kopiëren. De motivatie was altijd al het zwakke punt; AI maakt het dodelijk.
- **Pure top-down** (begin met een hele app): motiverend en realistisch, maar onderzoek is helder — studenten *bouwen iets af zonder te snappen hoe het werkt*. Met AI erbij is dat geen risico maar een garantie: ze prompten een werkende fullstack-app en begrijpen geen regel.

De onderzoeksconsensus van 2025 is dat de **bottleneck-vaardigheid verschoven is**. Niet meer "kun je syntax uit je hoofd typen", maar: **kun je code lézen, beoordelen, verifiëren, debuggen en integreren**. Dáár moet het curriculum op sturen.

## Aanbeveling: "context-first + PRIMM", een spiraal i.p.v. een rechte lijn

De aanpak die het beste uit het onderzoek komt voor onze doelgroep heet **PRIMM** (Predict – Run – Investigate – Modify – Make), gebouwd op **Use-Modify-Create**. Het mooie: het is precies de aanpak die AI *benut* in plaats van bestrijdt. De AI levert de werkende code (de "Use"-fase); de student doet het echte werk in Predict, Investigate, Modify en Make.

Zo lossen top-down en bottom-up samen op:

| | Top-down geeft je | Bottom-up geeft je |
|---|---|---|
| **Rol** | De *context/motivatie* per les: start bij een werkende mini-app | De *diepgang*: binnen die app zoom je in op variabele, loop, query |
| **Wanneer** | Begin van elk thema (het "waarom") | Tijdens Investigate/Modify (het "hoe") |

Je begint dus **top-down qua framing** (een werkende webshop, een API die studentdata teruggeeft) maar werkt **bottom-up qua begrip** — je breekt die werkende code af tot op variabel-niveau. Geen rechte lijn van klein-naar-groot, maar een **spiraal**: elk blok komt een concept terug, maar in een rijkere context.

### Hoe een PRIMM-les eruitziet (past in het 90-min model)

1. **Predict** – studenten lezen werkende code en voorspellen wat die doet (nog niet draaien). Dit dwingt *lezen* af.
2. **Run** – draaien, voorspelling toetsen. Direct succes/feedback.
3. **Investigate** – jij stelt vragen: "wat doet regel 7?", "wat als ik dit weghaal?". Hier zit de bottom-up theorie (variabelen, scope, types).
4. **Modify** – kleine aanpassingen aan werkende code. Veilig, laagdrempelig.
5. **Make** – pas hier zelf bouwen, met de zojuist begrepen bouwstenen.

AI mag overal — maar de toets zit op Predict, Investigate en het *kunnen verantwoorden* van Modify/Make.

## Stappenplan om dit in zwds26ab in te voeren

zwds26ab is nu Blok 1–4 puur bottom-up frontend (HTML → CSS → flexbox → formulieren). Backend komt nog. Dat is een goed kantelpunt om de nieuwe aanpak in te zetten.

### Fase 0 — Kaders vastleggen (voor je begint)

1. Bepaal per leerlijn (frontend/backend/fullstack) de 5–8 **kernconcepten** die een student écht zelf moet kunnen verantwoorden (bijv. backend: request/response, variabele & datatype, conditie, loop, functie, database-query, koppeling FE↔BE). Dit wordt de spiraal-ruggengraat.
2. Formuleer een expliciet **AI-gebruiksbeleid** voor de klas: AI mag, mits je kunt uitleggen wat de code doet. Maak "ik kan het verantwoorden" de norm.

### Fase 1 — Eén blok herontwerpen als pilot (2–3 weken werk)

3. Kies het **eerste backend-blok** als pilot (laag risico, hoge urgentie).
4. Bouw per week één **werkende mini-app als startpunt** (top-down framing) + een PRIMM-werkblad eromheen.
5. Vervang losse syntax-opdrachten door **Predict/Investigate-opgaven** op die code. Behoud gelaagdheid: basiseis / uitbreiding / expert-uitdaging.

### Fase 2 — Toetsing AI-bestendig maken (cruciaal, anders valt alles om)

6. Verschuif beoordeling van "lever werkende code" naar **proces + verantwoording**: code-review-gesprekjes, "leg deze regel uit", mondeling bij de demo. Een rubric op *begrip en verificatie*, niet op *werkt het*.
7. Bouw minstens één **"debug deze AI-output"-opdracht** in: geef bewust foute/onhandige AI-code, student moet de fout vinden en verbeteren. Dit traint exact de nieuwe bottleneck-vaardigheid.

### Fase 3 — Evalueren en uitrollen

8. Na de pilot: korte evaluatie met studenten + jezelf (motivatie, begrip, haalbaarheid).
9. Rol uit naar de overige backend/fullstack-blokken; herschrijf de spiraal zodat concepten terugkomen.
10. Documenteer het model als curriculum-standaard, zodat collega's het kunnen overnemen.

## Vervolgstap

Mogelijke vervolgstap: **één backend-blok van zwds26ab volledig uitwerken als PRIMM-pilot** (week voor week, met werkende voorbeeldcode + werkbladen + rubric), als tastbaar voorbeeld voordat de hele leerlijn omgaat.

## Bronnen

- [Katrompas — Teaching CS in the Age of AI](https://medium.com/@sweaty.phd/teaching-computer-science-in-the-age-of-ai-344f98aafda8)
- [Teaching Programming in the Age of Generative AI (arXiv 2507.00108)](https://arxiv.org/html/2507.00108v1)
- [Raspberry Pi Foundation — Teaching Programming with PRIMM](https://www.raspberrypi.org/app/uploads/2022/08/Teaching_Programming_with_PRIMM-1.pdf)
- [AI Code Generators & novice learners / Use-Modify-Create (arXiv 2302.07427)](https://arxiv.org/pdf/2302.07427)
- [Top-Down vs Bottom-Up learning programming](https://www.programmingforbeginnersbook.com/blog/top-down-bottom-up-approaches-to-learning-programming/)
