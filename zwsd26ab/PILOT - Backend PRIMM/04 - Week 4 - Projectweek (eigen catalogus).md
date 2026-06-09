# Week 4 — Projectweek: jouw eigen catalogus

**Type:** projectweek (integratie van weken 1-3, geen nieuwe stof)
**Doel:** zelfstandig een werkende, dynamische catalogus bouwen die data uit een database toont.

## Het scenario

> Je bent junior backend-developer bij webbureau **Studio Dedaaf**. Een klant wil een **online catalogus** voor zijn collectie — games, films, sneakers, planten, auto's, wat dan ook. Voor de eerste oplevering moet de catalogus de items netjes tonen, opgehaald uit een database. De klant wil het deze vrijdag in een demo zien.

Kies je eigen onderwerp (eigenaarschap = motivatie). De techniek is wat je in week 1-3 leerde.

## Acceptatiecriteria (wat moet het kunnen?)

**Basiseis — voldoende (iedereen haalt dit):**
- [ ] Een database met een tabel met **≥ 8 records** en **≥ 4 kolommen**.
- [ ] Een PHP-pagina die de data ophaalt met PDO en toont met een `foreach`.
- [ ] Minstens één `if`-conditie die de weergave beïnvloedt (bv. een badge).
- [ ] Verzorgde opmaak (hergebruik CSS uit Blok 1-4).
- [ ] Code staat in een Git-repo met nette commits.

**Uitbreiding — goed:**
- [ ] Gesorteerde of gefilterde weergave (`ORDER BY` / `WHERE`).
- [ ] Een teller ("X items in de catalogus").
- [ ] Tweede tabel of extra veld met logica.

**Expert-uitdaging — excellent (optioneel):**
- [ ] Een detailpagina per item (klik op item → `detail.php?id=…`). *(Vooruitblik op routing in week 5+.)*

## Weekritme

| Dag | Fase | Activiteit |
|-----|------|-----------|
| Ma | Kick-off | Scenario, onderwerp kiezen, datamodel schetsen (welke kolommen?) |
| Di-Wo | Bouw | Database vullen, ophalen, tonen. Docent = coach, geen antwoordenboek |
| Do | Bouw + review | Onderling code-review in tweetallen: "leg je `foreach` uit" |
| Vr | Demo & reflectie | Elke student toont 2 min + verantwoordt één codekeuze |

## AI-afspraak deze week
AI mag voor de bouw, maar bij de vrijdagdemo stelt de docent **één willekeurige vraag over je eigen code** ("waarom staat hier een `if`?"). Kun je het niet uitleggen → geen voldoende, ook al werkt het. Dit is de generale repetitie voor het mondeling assessment in week 10.

## Reflectievragen (vrijdag, kort opschrijven)
1. Wat ging makkelijker dan verwacht?
2. Welke foutmelding kostte je het meeste tijd, en hoe loste je hem op?
3. Welke regel code zou je nog niet aan een klant durven uitleggen?
