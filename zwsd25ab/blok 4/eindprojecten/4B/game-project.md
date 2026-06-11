# Tournament Tracker: The Grand Arena

E-sports-vereniging __The Grand Arena__ is een lokale community waar recreatieve en competitieve gamers samen trainen, scrims spelen en maandelijkse events organiseren. We werken met meerdere games en teams, maar missen nu een centrale manier om resultaten eerlijk, snel en inzichtelijk vast te leggen.

Voor dit toernooi hebben we de hulp van studenten nodig om twee dingen tegelijk neer te zetten: een strak georganiseerd speelschema en een werkende data-gedreven webapp. Tijdens de projectweek verzamelen studenten wedstrijddata, zetten die om naar bruikbare scores en bouwen een applicatie waarmee spelers, organisatoren en publiek direct kunnen zien wie presteert, waarom iemand wint en hoe het toernooi zich ontwikkelt.

Doel: in 5 dagen een werkende webapp opleveren met:
1. spelers en rollen in database
2. dynamisch score-overzicht en detailpagina
3. zoeken, filteren en sorteren
4. login/logout en rolbeveiliging
5. dashboard met kernstatistieken
6. nette, professionele en consistente vormgeving op alle kernpagina's

---

## 1. Randvoorwaarden (verplicht)

1. Gebruik alleen fictieve persoonsgegevens.
2. Gebruik geen echte e-mailadressen, huisadressen of privefoto's.
3. Screenshots mogen geen gevoelige data tonen.
4. Toegestane uploadformaten: jpg, png, webp.
5. Max uploadgrootte: 2 MB.
6. Alle invoer wordt server-side gevalideerd.
7. De website heeft een verzorgde en professionele uitstraling (leesbare typografie, consistente kleuren en nette uitlijning).

---

## 2. Datamodel

### Tabellen
1. `users`
2. `roles`
3. `addresses`
4. `match_scores`
5. `final_matches`

### Verplichte velden en regels

Users:
1. `firstname`, `lastname`: string, verplicht
2. `email`: string, verplicht, uniek, geldig e-mailformaat
3. `username`: string, verplicht, uniek
4. `password`: string, verplicht (gehashte waarde)
5. `role_id`: foreign key, verplicht
6. `address_id`: foreign key, verplicht

Match_scores:
1. `match_ref`: string, verplicht
2. `player_username`: string, verplicht
3. `title`: string, verplicht
4. `game_name`: string, verplicht
5. `description`: text, verplicht
6. `score_type`: string, verplicht
7. `points_value`: integer, verplicht, min 0
8. `achieved_year`: integer, optioneel
9. `hero_or_vehicle`: string, optioneel
10. `match_rules`: string, optioneel
11. `image_filename`: string, optioneel

Final_matches:
1. `player_username`: string, verplicht
2. `game_name`: string, verplicht
3. `round_number`: integer, verplicht, min 1
4. `points_value`: integer, verplicht, min 0
5. `win_loss`: tinyint, verplicht, alleen 0 of 1
6. `added_at`: datetime, verplicht

### Database-aanlevering (verplicht)

1. Elke groep levert 1 SQL-bestand aan (bijv. `database.sql`).
2. Dit bestand bevat minimaal:
    - `CREATE TABLE` statements voor `users`, `roles`, `addresses`, `match_scores`, `final_matches`.
    - `INSERT INTO` statements voor startdata (minimaal rollen + 2 users + gekoppelde adressen).
3. De database moet volledig op te bouwen zijn door alleen dit SQL-bestand uit te voeren op een lege database.
4. Handmatig tabellen/records aanmaken via losse phpMyAdmin-kliks is niet toegestaan als eindoplevering.

Mappingregels (verplicht voor consistente import):
1. Vul eerst `roles` en `addresses`, daarna pas `users`.
2. `users.role_id` verwijst naar `roles.id` op basis van de kolom `role` in tabblad 1.
3. `users.address_id` verwijst naar `addresses.id` op basis van het adres van dezelfde gebruiker uit tabblad 1.
4. Gebruik in `match_scores.player_username` exact dezelfde `username` als in `users.username`.

---

## 3. 5-daags programma (must-haves)

### Geselecteerde games en volgorde

1. Maandagmiddag: Counterstrike
2. Dinsdagmiddag: Overwatch
3. Woensdagmiddag: Minecraft Education
4. Donderdagmiddag: GTA (of alternatief spel op laptop)

## Maandagmiddag: Gamen en ledenadministratie

Doel: basisgegevens verzamelen om de database te vullen.

Welke data:
1. Iedereen vult tabblad 1 (Leden en Rollen) in de centrale sheet.
2. Counterstrike-sessie: per student 1 score voor `meeste_kills` registreren (tabblad 2).

Taken:
- [ ] Rollen verdelen: Player en Organiser.
- [ ] Tabblad 1 volledig invullen.
- [ ] Dataset controleren op unieke usernames en e-mails.
- [ ] Game 1 spelen en kills registreren met screenshot.

Definition of Done:
1. Alle groepsleden staan in tabblad 1.
2. Geen dubbele username.
3. Geen lege verplichte kolommen.
4. Iedereen heeft minimaal 1 kill-score van Counterstrike.

## Dinsdagochtend: Database en basispagina's

Taken:
- [ ] Database en tabellen users, roles, addresses, match_scores, final_matches aanmaken.
- [ ] Gegevens uit tabblad 1 importeren of invoeren.
- [ ] SQL-bestand opleveren (bijv. database.sql) met alle `CREATE TABLE` en `INSERT INTO` statements.
    - [ ] Controle: op lege database in 1 keer uitvoerbaar.
    - [ ] Controle: geen handmatige phpMyAdmin-kliks nodig voor eindoplevering.
- [ ] Homepage bouwen.
    - [ ] Gebruik een herbruikbare nav-bar als include/partial (bijv. `navbar.php`) die op meerdere pagina's wordt ingeladen.
    - [ ] Nav-bar bevat minimaal links naar: Home, Overzicht, Login/Logout.
    - [ ] Korte intro met: wie The Grand Arena is en doel van het toernooi.
    - [ ] Tabel met toernooi-opzet: kwalificatie (ma-do) + vrijdagfinale.
    - [ ] "Call-to-action" buttons (grote knoppen): Bekijk score-overzicht en Bekijk leaderboard.
    - [ ] Herbruikbare footer met contactinfo.
    - [ ] Basis-styling toepassen: consistente kleuren, nette spacing, duidelijke koppen en goed leesbare tekst.
    - [ ] Pagina werkt bruikbaar op laptop en mobiel (geen overlappende blokken of afbrekende navigatie).
- [ ] Overzichtspagina opzetten.
    - [ ] Maak een apart bestand, bijv. `overzicht.php`.
    - [ ] Voeg bovenaan dezelfde includes toe als op home (`navbar.php`, evt. `config.php`).
    - [ ] Maak een eenvoudige HTML-tabel met kolommen: title, game_name, score_type, points_value.
    - [ ] Toon minimaal 2 regels testdata (hardcoded of uit een eenvoudige query).
    - [ ] Voeg een nette melding toe voor lege resultaten: "Nog geen scores beschikbaar".
    - [ ] Controleer dat de links Home en Overzicht op beide pagina's werken.


Definition of Done:
1. SQL-bestand met `CREATE TABLE` en `INSERT INTO` draait zonder fouten.
2. Minimaal 2 users correct zichtbaar vanuit database.
3. Homepage en overzichtspagina laden zonder errors.
4. Nav-bar include werkt op minimaal Home + Overzicht.
5. Homepage bevat alle verplichte onderdelen uit de uitwerking hierboven.
6. Overzichtspagina werkt met basis-PHP (bestand + include + tabel + lege-statusmelding).
7. Database kan op een lege omgeving opnieuw worden opgebouwd met alleen het SQL-bestand.
8. Homepage en overzichtspagina hebben een verzorgde, consistente en professionele uitstraling.

## Dinsdagmiddag: Eerste numerieke scores verzamelen

Doel: eerste numerieke matchscores en bewijsmateriaal verzamelen.

Welke data: iedereen vult tabblad 2 (MatchScores - Cijfers) in de sheet met Overwatch-data.

Taken:
- [ ] Overwatch-match:
    - [ ] Speel per student minimaal 1 volledige match.
    - [ ] Verzamel tijdens het spelen direct meetbare scores voor de database.
- [ ] Scores noteren: kills, assists, damage, healing.
- [ ] Screenshot bewaren.
- [ ] Score in tabblad 2 invullen.

Definition of Done:
1. Iedereen heeft minimaal 1 score in tabblad 2.
2. Bij elke score hoort een geldige screenshot-bestandsnaam.
3. Per speler per match staan 4 records in tabblad 2 met score_type: kills, assists, damage, healing.

## Woensdagochtend: Dynamische weergave

Taken:
- [ ] Match_scores structuur controleren (kolommen aanwezig en juiste datatypes).
- [ ] Data uit tabblad 2 toevoegen aan de tabel `match_scores` in de database.
- [ ] Screenshots op server (in het PHP-project) plaatsen.
- [ ] Dynamisch overzicht uitbreiden op bestaande overzichtspagina (met data uit match_scores, thumbnail en detaillink).
- [ ] Detailpagina bouwen met grote afbeelding en extra info.

Definition of Done:
1. Overzicht haalt data uit database.
2. Klik op een score opent detailpagina.
3. Geen kapotte afbeeldingen (fallback-afbeelding bij ontbrekend bestand).
4. Tabblad 2-data staat in `match_scores`.

## Woensdagmiddag: MatchScores - Context verzamelen

Doel: contextdata verzamelen voor zoek- en filterfuncties.

Welke data: iedereen vult tabblad 3 (MatchScores - Context) in de sheet met Minecraft Education-data.

Taken:
- [ ] Minecraft Education-sessie uitvoeren.
- [ ] Meetwaarden noteren: PvP kills, built battle score, bed wars resultaat.
- [ ] Context invullen: hero_or_vehicle, match_rules, score_type.
- [ ] Tabblad 3 volledig invullen.

Definition of Done:
1. Nieuwe contextdata staat volledig in tabblad 3.
2. Data is klaar voor import op donderdag.
3. Elk Minecraft-record heeft een duidelijke score_type en points_value.

## Donderdagochtend: Zoeken, filteren en sorteren

Taken:
- [ ] Data uit tabblad 3 toevoegen aan database.
- [ ] Filter op game_name bouwen.
- [ ] Sorteerfunctie op points_value bouwen (asc/desc).
- [ ] Zoekfunctie op title en description bouwen.

Definition of Done:
1. Filter werkt en geeft correcte resultaten.
2. Sorteren wisselt correct tussen laag-hoog en hoog-laag.
3. Zoekfunctie vindt relevante resultaten.
4. Leeg resultaat toont nette melding.

## Donderdagmiddag: Finaledata verzamelen

Doel: voldoende data verzamelen voor dashboard-statistieken.

Welke data: iedereen vult tabblad 4 (Toernooifinale - Statistieken) in de sheet met GTA-data.

Taken:
- [ ] GTA (of alternatief spel) spelen.
- [ ] Modi registreren: deathmatch (meeste kills) of race (tijd).
- [ ] Minimaal 3 rondes per speler registreren.
- [ ] Win/loss (1 of 0) noteren.
- [ ] Tijdstempel noteren.
- [ ] Tabblad 4 invullen.
- [ ] Tabblad 4-data importeren in `final_matches`.

Definition of Done:
1. Elke speler heeft minimaal 3 records in tabblad 4.
2. Win/loss bevat alleen 0 of 1.
3. Alle records hebben geldige timestamp.
4. Elk record bevat een score die naar points_value is omgezet.
5. `final_matches` bevat de geimporteerde finaledata voor het dashboard van vrijdag.

---

## Vrijdagochtend: Beveiliging en dashboard

Taken:
- [ ] Login (POST) en logout implementeren.
- [ ] Afgeschermde organiser-pagina maken.
- [ ] Formulier voor handmatige score en screenshot-upload maken.
- [ ] Dashboard met SQL-statistieken bouwen.

Dashboard-statistieken (verplicht):
1. Totaal aantal final matches (COUNT).
2. Gemiddelde points_value (AVG).
3. Hoogste points_value (MAX).
4. Winnaar op basis van hoogste gemiddelde score.

Definition of Done:
1. Niet-ingelogde gebruikers kunnen organiser-pagina niet openen.
2. Upload accepteert alleen toegestane bestandsformaten.
3. Dashboard toont actuele cijfers uit final_matches.

## Vrijdagmiddag: Afronding en presentatie

Taken:
- [ ] About-pagina met toernooiregels maken.
- [ ] Mobiel testen op minimaal 3 pagina's: home, overzicht, detail.
- [ ] Publieke leaderboard- en finaleweergave klaarzetten.
- [ ] Vrijdagfinale draaien met top 4 (halve finales + finale).
- [ ] Korte demo geven met winnaar uit dashboard.
- [ ] Side-awards uitreiken (bijv. Most Kills, Best Support, Comeback).

Definition of Done:
1. 3 pagina's werken goed op mobiel.
2. Demo bevat login, filter/sort/search, dashboard en publieke leaderboard.
3. Winnaar wordt onderbouwd met data.
4. Vrijdagfinale is gespeeld en uitslag staat zichtbaar in de app.

---

## 4. Excel-opzet voor data-uitwisseling

De docent (of een aangewezen student) beheert een centrale Google Sheet of Excel-sheet in de cloud. De sheet heeft 4 tabbladen. Aan het einde van elke middag kopieert elke student zijn rij(en), zodat iedereen de volgende ochtend de complete dataset kan downloaden.

Regels:
1. Iedere student vult dagelijks zijn eigen rij(en) in.
2. Aan het einde van de middag controleert het team op lege verplichte velden.
3. De volgende ochtend werkt elk team met de complete, gecontroleerde dataset.

### Tabblad 1: Leden en Rollen (maandagmiddag)

| id | firstname | lastname | email | username | role | member_number / job_title | street | housenumber | zipcode | city | country |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Jan | De Vries | jan@email.com | JantjePro | Player | M-10043 | Dorpsstraat | 12 | 1234AB | Haarlem | Nederland |
| 2 | Lisa | Bakker | lisa@email.com | MasterOrganiser | Organiser | Hoofdscheidsrechter | Markt | 5 | 5678CD | Amsterdam | Nederland |

### Tabblad 2: MatchScores - Cijfers (dinsdagmiddag)

Definitie voor dit tabblad:
1. Per speler per gespeelde match worden 4 regels ingevuld: `kills`, `assists`, `damage`, `healing`.
2. Gebruik dezelfde `match_ref` voor die 4 regels, zodat duidelijk is dat ze bij 1 match horen.
3. `player_username` is verplicht voor elke regel.

| match_ref | player_username | title | game_name | description | score_type | achieved_year | points_value | image_filename |
|---|---|---|---|---|---|---|---|---|
| OW-M1-JAN | JantjePro | Overwatch Ranked Match 1 | Overwatch | Teamfight op payload map | kills | 2026 | 22 | ow_jan_match1.png |
| OW-M1-JAN | JantjePro | Overwatch Ranked Match 1 | Overwatch | Teamfight op payload map | assists | 2026 | 11 | ow_jan_match1.png |
| OW-M1-JAN | JantjePro | Overwatch Ranked Match 1 | Overwatch | Teamfight op payload map | damage | 2026 | 8450 | ow_jan_match1.png |
| OW-M1-JAN | JantjePro | Overwatch Ranked Match 1 | Overwatch | Teamfight op payload map | healing | 2026 | 1800 | ow_jan_match1.png |

### Tabblad 3: MatchScores - Context (woensdagmiddag)

| title | game_name | description | score_type | points_value | hero_or_vehicle | match_rules | image_filename |
|---|---|---|---|---|---|---|---|
| Castle PvP Clash | Minecraft Education | Teamduel in arena | PvP Kills | 14 | Diamond Sword | 10 min / Last team standing | mc_jan_pvp.png |
| Bed Breaker Finals | Minecraft Education | Snelste bed wars overwinning | BedWars Win | 1 | Team Blue | Best of 3 / No respawn after bed break | mc_lisa_bedwars.png |

### Tabblad 4: Toernooifinale - Statistieken (donderdagmiddag)

| match_id | player_username | game_name | round_number | points_value | win_loss (1/0) | added_at (Tijdstempel) |
|---|---|---|---|---|---|---|
| 1 | JantjePro | GTA | 1 | 17 | 1 | 2026-06-11 14:15:00 |
| 2 | JantjePro | GTA | 2 | 13 | 0 | 2026-06-11 14:45:00 |
| 3 | JantjePro | GTA | 3 | 19 | 1 | 2026-06-11 15:15:00 |

---

## 5. Beoordeling (100 punten)

1. Datamodel en databasekwaliteit: 20
2. Dynamische pagina's (overzicht en detail): 20
3. Zoeken, filteren en sorteren: 20
4. Auth en autorisatie: 20
5. Dashboard, presentatie en professionele afwerking: 20

Afkeurcriteria:
1. Geen werkende login/logout.
2. Geen dynamische data uit database.
3. Geen werkende filter of zoekfunctie.
4. Geen dashboardberekening op finaledata.

---

## 6. Extra toelichting

### Score-check: kwantificeerbaarheid per game

| Game | Opgegeven score(s) | Kwantificeerbaar? | Advies voor points_value | Extra scores die je ook kunt bijhouden |
|---|---|---|---|---|
| Counterstrike | Meeste kills | Ja | Gebruik kills direct als points_value | deaths, kill/death ratio, headshots, winst/verlies per ronde |
| Overwatch | kills, assists, damage, healing | Ja | Sla elke metric op als aparte record met eigen score_type | objective time, eliminations, accuracy %, deaths |
| Minecraft Education | PvP kills, built battle, bed wars | Gedeeltelijk | PvP kills: direct. Built battle: rubric-score (bijv. 1-10). Bed wars: 1 voor winst, 0 voor verlies + tijd tot winst | blocks placed, deaths, resources verzameld, survival time |
| GTA of alternatief | deathmatch kills, race tijd | Ja | Deathmatch: kills direct. Race: tijd omzetten naar punten (bijv. sneller = hogere points_value) | laps completed, crashes, clean lap bonus, positie |

Opmerking:
1. Alles is kwantificeerbaar als je per score_type vooraf 1 vaste meetregel afspreekt.
2. Voor niet-numerieke prestaties (zoals built battle) gebruik je een rubric met vaste criteria en een maximale score.
3. Leg de omzetregel naar `points_value` vast in de About-pagina, zodat de beoordeling transparant blijft.

### Publiek toernooi-opzet en vrijdagfinale

Het publieke toernooi bestaat uit twee delen:
1. Maandag t/m donderdag: kwalificatie met dagelijkse scores.
2. Vrijdagmiddag: live finaleronde met publiek.

Aanpak:
1. Alle scores van maandag t/m donderdag tellen mee voor een weekklassement.
2. De top 4 spelers op basis van gemiddelde `points_value` plaatsen zich voor de vrijdagfinale.
3. De vrijdagfinale wordt gespeeld als halve finales + finale.

Scoremodel (advies):
1. Weekscore: 70% (op basis van alle kwalificatiedata).
2. Finalescore: 30% (op basis van vrijdagmatches).
3. Eindwinnaar: hoogste totaalscore na weging.

Publieke zichtbaarheid in de webapp:
1. Open leaderboard-pagina (alleen lezen, geen login nodig).
2. Speelschema met tijdsloten en status: gepland, bezig, afgerond.
3. Finale-pagina met live tussenstanden en winnaar.
4. Hall of Fame-sectie met winnaar en side-awards.

Vrijdagmiddag-draaiboek (60-90 minuten):
1. 10 min: opening, uitleg format, tonen top 4.
2. 20 min: halve finale 1 en 2.
3. 20 min: finale.
4. 10 min: dashboardresultaten en side-awards.
5. 10 min: afsluiting, winnaar, korte demo van de app.
