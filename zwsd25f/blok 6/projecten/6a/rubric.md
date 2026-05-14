# Rubric Projectweek 6A (Laravel Read-Only Projecten)

Deze rubric is toepasbaar op alle 7 projecten in `6a`.
Uitgangspunt: studenten realiseren de huidige user stories en volgen de projectrequirements.

Niet ingeleverd = **1.0**.

## Beoordelingsoverzicht (10 punten)

| Criterium | Weging | Wat wordt beoordeeld |
|---|---:|---|
| 1. Database ontwerp en relaties | **2.0** | Correcte tabellen/velden, consistente relaties, logische vertaalslag vanuit projectbeschrijving. |
| 2. Migrations, models en seeders | **2.0** | Werkende migrations/models, bruikbare testdata, seeders ondersteunen de user stories. |
| 3. Realisatie read-only user stories | **2.5** | Overzichten, detailpagina's, relationele weergaves en functionele read-flow per rol. |
| 4. Layout, componenten, CSS en UX | **2.5** | Gebruik van Blade-componenten, centrale CSS (geen Tailwind), navigatie, klikbare relaties en aantoonbaar mobile friendly gedrag. |
| 5. Codekwaliteit, lesconform werken en opleverkwaliteit | **1.0** | Heldere structuur, naamgeving, geen Laravel-features buiten lesstof, nette implementatie en stabiele demonstratie. |

## Criterium 1: Database ontwerp en relaties (2.0 pt)

- 2.0: Ontwerp volledig en correct; relaties kloppen en sluiten aan op user stories.
- 1.5: Kleine onvolkomenheden, maar kernrelaties zijn correct.
- 1.0: Meerdere fouten/inconsistenties in relaties of velden.
- 0.0-0.5: Ontwerp onvoldoende of niet bruikbaar.

## Criterium 2: Migrations, models en seeders (2.0 pt)

- 2.0: Alles migreert en seedt correct; seeddata dekt relevante scenario's.
- 1.5: Klein technisch gebrek, maar project blijft goed toetsbaar.
- 1.0: Seeders/migrations deels bruikbaar, belangrijke scenario's missen.
- 0.0-0.5: Onvoldoende uitvoerbaar of instabiel.

## Criterium 3: Read-only user stories (2.5 pt)

- 2.5: Stories in huidige set volledig gerealiseerd; duidelijke overzichten/detailpagina's en relationele data zichtbaar.
- 1.5: Belangrijke delen werken, maar meerdere stories missen of zijn onvolledig.
- 0.5: Beperkt werkend; onvoldoende dekking van de stories.
- 0.0: Nauwelijks gerealiseerd.

## Criterium 4: Layout, componenten, CSS en UX (2.5 pt)

- 2.5: Minimaal 2 Blade-componenten toegepast, centrale CSS gebruikt, navigatie en UX duidelijk, en de site is aantoonbaar mobile friendly.
- 1.5: Basis op orde, maar componentgebruik, UX of mobile friendly gedrag nog beperkt.
- 0.5: Fragmentarisch; weinig samenhangende UI-opbouw en onvoldoende mobiele bruikbaarheid.
- 0.0: Eisen niet gehaald.

## Criterium 5: Codekwaliteit, lesconform werken en opleverkwaliteit (1.0 pt)

- 1.0: Nette code, duidelijke structuur, sluit aan op behandelde lesstof en is stabiel te demonstreren.
- 0.5: Werkend, maar rommelig, deels buiten afgesproken aanpak, of beperkt demonstrabel.
- 0.0: Niet lesconform, slecht onderhoudbaar en/of onvoldoende demonstrabel.

## Puntenaftrek: AI-gegenereerde code

AI mag ondersteunend worden gebruikt, maar niet als "black box".
Puntenaftrek geldt wanneer code aantoonbaar door AI is gegenereerd zonder begrip, zonder aansluiting op lesstof, of zonder eigen aanpassingen.

- **-0.5**: Kleine AI-fragmenten zonder goede toelichting / beperkte mismatch met lesstof.
- **-1.0**: Meerdere delen duidelijk gekopieerd zonder voldoende begrip of consistentie.
- **-1.5**: Groot deel van het project AI-gegenereerd en beperkt navolgbaar door student.
- **-2.0**: Overwegend AI-uitwerking zonder beheersing van de gemaakte keuzes.
- **-3.0**: Project is in de kern AI-gegenereerd en student kan keuzes of werking onvoldoende uitleggen.

> Maximale AI-puntenaftrek is 3.0. Eindscore kan niet lager dan 1.0.

## Snelle beslisregels voor docenten

- Is de database-opzet relationeel correct? (zwaartepunt: **1.5-2.0 pt**)
- Ondersteunt seeddata de read-only stories?
- Kan de student uitleggen hoe pagina's en relaties zijn opgebouwd?
- Is de UI bruikbaar en navigeerbaar met componenten + CSS, en ook mobile friendly?
- Is de code lesconform, aantoonbaar eigen werk en stabiel te demonstreren?
