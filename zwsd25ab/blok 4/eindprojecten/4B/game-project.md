# Tournament Tracker: The Grand Arena

E-sports-vereniging __The Grand Arena__  wil een website hebben om interne competities in vast te leggen. Voor dit toernooi hebben we de hulp van studenten nodig. Tijdens de projectweek verzamelen studenten data door verschillende games te spelen. Die data zetten we in een database, die we uitlezen en tonen op de website van de vereniging.

Doel: in 5 dagen een werkende webapp opleveren met:
1. spelers en rollen in database
2. dynamisch score-overzicht en detailpagina
3. zoeken, filteren en sorteren
4. login/logout en rolbeveiliging
5. dashboard met kernstatistieken
6. nette, professionele en consistente vormgeving op alle kernpagina's

## Inhoud

1. [Randvoorwaarden](#1-randvoorwaarden-verplicht)
2. [Datamodel](#2-datamodel)
3. [Weekprogramma](#3-weekprogramma)
   - [Geselecteerde games en volgorde](#geselecteerde-games-en-volgorde)
   - [Maandagmiddag: Gamen en ledenadministratie](#maandagmiddag-gamen-en-ledenadministratie)
   - [Dinsdagochtend: Database en basispagina's](#dinsdagochtend-database-en-basispaginas)
   - [Dinsdagmiddag: Eerste numerieke scores verzamelen](#dinsdagmiddag-eerste-numerieke-scores-verzamelen)
   - [Woensdagochtend: Dynamische weergave](#woensdagochtend-dynamische-weergave)
   - [Woensdagmiddag: MatchScores - Context verzamelen](#woensdagmiddag-matchscores---context-verzamelen)
   - [Donderdagochtend: Zoeken, filteren en sorteren](#donderdagochtend-zoeken-filteren-en-sorteren)
   - [Donderdagmiddag: Finaledata verzamelen](#donderdagmiddag-finaledata-verzamelen)
   - [Vrijdagochtend: Beveiliging en dashboard](#vrijdagochtend-beveiliging-en-dashboard)
   - [Vrijdagmiddag: Afronding en presentatie](#vrijdagmiddag-afronding-en-presentatie)
4. [Excel-opzet voor data-uitwisseling](#4-excel-opzet-voor-data-uitwisseling)
5. [Beoordeling](#5-beoordeling)
6. [Extra toelichting](#6-extra-toelichting)

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
1. `users` (al aanwezig in project als `users.sql`)
2. `roles` (al aanwezig in project als `roles.sql`)
3. `addresses`
4. `match_scores`
5. `final_matches`

### Verplichte velden en regels

Match_scores:
2. `player_username`: string, verplicht
3. `title`: string, niet verplicht
4. `game_name`: string, verplicht
5. `description`: text, niet verplicht
6. `score_type`: string, verplicht
7. `points_value`: integer, verplicht, min 0
9. `hero_or_vehicle`: string, optioneel, de gebruikte hero, vehicle of ander karakter/materiaal in de match
10. `match_rules`: string, optioneel, een korte omschrijving van de gevolgde spelregels
11. `image_filename`: string, optioneel

Final_matches:
1. `player_username`: string, verplicht
2. `game_name`: string, verplicht
3. `round_number`: integer, verplicht, min 1
4. `points_value`: integer, verplicht, min 0
5. `win_loss`: tinyint, verplicht, alleen 0 of 1
6. `added_at`: datetime, verplicht

Addresses:
1. `id`: integer, primary key, verplicht
2. `address`: string, verplicht, straat en huisnummer samen in 1 veld
3. `zipcode`: string, niet verplicht
4. `city`: string, verplicht
5. `country`: string, niet verplicht

### Database requirements

1. Elke project moet 3 nieuwe sql-bestanden bevatten: `addresses.sql`, `match_scores.sql`, `final_matches.sql`. Deze worden gedurende het project aangeleverd door de docent.
2. Elk bestand bevat:
    - `CREATE TABLE` statements.
    - `INSERT INTO` statements.
3. De database moet volledig op te bouwen zijn door deze SQL-bestanden uit te voeren op een lege database.
4. Handmatig tabellen/records aanmaken via losse phpMyAdmin-kliks is niet toegestaan.

Mappingregels (verplicht voor consistente import):
1. `users.role_id` verwijst naar `roles.id` op basis van de kolom `role` in tabblad 1.
3. `users.address_id` verwijst naar `addresses.id` op basis van het adres van dezelfde gebruiker uit tabblad 1.
4. Gebruik in `match_scores.player_username` exact dezelfde `username` als in `users.username`.

---

## 3. Weekprogramma

### Geselecteerde games en volgorde

1. Maandagmiddag: Counterstrike
2. Dinsdagmiddag: Overwatch
3. Woensdagmiddag: Minecraft Education
4. Donderdagmiddag: GTA (of alternatief spel op laptop)
4. Vrijdagmiddag: toernooi

## Maandagmiddag: Gamen en ledenadministratie

Doel: basisgegevens verzamelen om de database te vullen.

Welke data:
1. Counterstrike-sessie: elke student geeft zijn score voor `meeste_kills` door via MS Forms.

Taken:
- [ ] Formulier 1 invullen: https://forms.office.com/e/2W5E4va5GH Let op: gebruik fictieve adresgegevens!
- [ ] Counterstrike spelen. Maak een screenshot van je game met de meeste kills.
- [ ] Kill count invullen in formulier 2: https://forms.office.com/e/AtGz6X2Bwh

Definition of Done:
1. Geen dubbele username.
2. Iedereen heeft minimaal 1 kill-score van Counterstrike.

## Dinsdagochtend: Database en basispagina's

Taken:
- [ ] Database en tabellen users, roles, addresses en match_scores aanmaken. Docent deelt data met gegevens van gisteren.
- [ ] Homepage bouwen (op http://localhost/)
    - [ ] Gebruik een herbruikbare nav-bar als include/partial (bijv. `navbar.php`) die op meerdere pagina's wordt ingeladen.
    - [ ] Navbar bevat minimaal links naar: Home, Overzicht, Login/Logout.
    - [ ] Korte intro met: wie The Grand Arena is en doel van het toernooi.
    - [ ] Tabel met toernooi-opzet: kwalificatie (ma-do) + vrijdagfinale.
    - [ ] "Call-to-action" buttons (grote knoppen): Bekijk score-overzicht en Bekijk leaderboard.
    - [ ] Herbruikbare footer met contactinfo.
    - [ ] Basis-styling toepassen: consistente kleuren, nette spacing, duidelijke koppen en goed leesbare tekst.
    - [ ] Pagina werkt bruikbaar op laptop en mobiel (geen overlappende blokken of afbrekende navigatie).
- [ ] Overzichtspagina opzetten.
    - [ ] Maak een apart bestand, bijv. `overview.php`.
    - [ ] Voeg dezelfde includes toe als op home (`navbar.php`, `footer.php`).
    - [ ] Maak een eenvoudige HTML-tabel met kolommen: player_username, title, game_name, score_type, points_value.
    - [ ] Toon minimaal 2 regels testdata (hardcoded of uit een eenvoudige query).
    - [ ] Voeg een nette melding toe voor lege resultaten: "Nog geen scores beschikbaar".
    - [ ] Controleer dat de links Home en Overzicht op beide pagina's werken.


Definition of Done:
3. Homepage en overzichtspagina laden zonder errors.
4. Navbar include werkt op minimaal Home + Overzicht.
5. Homepage bevat alle verplichte onderdelen uit de uitwerking hierboven.
6. Overzichtspagina werkt
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

## 4. Data-uitwisseling

### Tabblad 2: MatchScores - Cijfers (dinsdagmiddag)

Definitie voor dit tabblad:
1. Per speler per gespeelde match worden 4 regels ingevuld: `kills`, `assists`, `damage`, `healing`.
3. `player_username` is verplicht voor elke regel.

| player_username | title | game_name | description | score_type | achieved_year | points_value | image_filename |
|---|---|---|---|---|---|---|---|---|
| JantjePro | Overwatch Ranked Match 1 | Overwatch | Teamfight op payload map | kills | 2026 | 22 | ow_jan_match1.png |
| JantjePro | Overwatch Ranked Match 1 | Overwatch | Teamfight op payload map | assists | 2026 | 11 | ow_jan_match1.png |
| JantjePro | Overwatch Ranked Match 1 | Overwatch | Teamfight op payload map | damage | 2026 | 8450 | ow_jan_match1.png |
| JantjePro | Overwatch Ranked Match 1 | Overwatch | Teamfight op payload map | healing | 2026 | 1800 | ow_jan_match1.png |

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
