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
3. `addresses` (komt dinsdag)
4. `match_scores` (komt dinsdag)
5. `final_matches` (komt later)

#### Tabeldefinities

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

## Maandagmiddag: Ledenadministratie / Counterstrike

Doel: basisgegevens verzamelen om de database te vullen.

Welke data:
1. Counterstrike-sessie: elke student geeft zijn score voor `meeste_kills` door via MS Forms.

Taken:
- [ ] Formulier 1 invullen: https://forms.office.com/e/2W5E4va5GH Let op: gebruik fictieve adresgegevens!
- [ ] Counterstrike spelen. Maak een screenshot van je game met de meeste kills.
- [ ] Kill count invullen in formulier 2: https://forms.office.com/e/AtGz6X2Bwh

Requirements:
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

## Dinsdagmiddag: Overmatch

Doel: eerste numerieke matchscores en bewijsmateriaal verzamelen.

Welke data: iedereen vult tabblad 2 (MatchScores - Cijfers) in de sheet met Overwatch-data.

Taken:
- [ ] Overwatch-match:
    - [ ] Speel per student minimaal 1 volledige match.
    - [ ] Verzamel tijdens het spelen meetbare scores voor de database.
- [ ] Scores noteren: kills, assists, damage, healing.
- [ ] Screenshot van hoogste scores bewaren.
- [ ] Score(s) invullen in formulier 3: https://forms.office.com/e/Ghn3nwFniQ

## Woensdagochtend: Dynamische weergave

Taken:
- [ ] Databasetabel `match_scores` bijwerken met gegevens van gisteren.
- [ ] Screenshots van hoogste scores (Counterstrike en Overwatch) op server (in het PHP-project) plaatsen.
- [ ] Login (POST) en logout implementeren met `email` en `password` uit de `users` tabel.
- [ ] Dynamisch overzicht uitbreiden op bestaande overzichtspagina (met data uit match_scores, thumbnail en detaillink).
- [ ] Profielpagina maken met alle scores van de ingelogde gebruiker.

## Woensdagmiddag: Minecraft Education

Doel: data verzamelen voor zoek- en filterfuncties.

Taken:
- [ ] Minecraft Education-sessie(s) uitvoeren.
- [ ] Meetwaarden noteren: `PvP kills`, `Build Battle` score, `Bed Wars` resultaat.
- [ ] Context invullen: `hero_or_vehicle`, `match_rules`, `score_type`.
- [ ] Formulier 4 invullen voor 1 of meerdere games: 
    - PvP score: https://forms.office.com/e/WfcEZMXZtP
    - Build Battle score: https://forms.office.com/e/2Xx6B1n2yB
    - Bed Wars score: https://forms.office.com/e/vg0U1UWmTT
- [ ] Screenshots bewaren van hoogste scores

## Donderdagochtend: Zoeken, filteren en sorteren

Taken:
- [ ] Databasetabel `match_scores` bijwerken met gegevens van gisteren.
- [ ] Detailpagina. Vanaf de profielpagina moet elke score doorlinken naar een detailpagina die ten minste een grote afbeelding (screenshot score) en alle verdere info bevat.
- [ ] Filter op `game_name` bouwen.
- [ ] Sorteerfunctie op `points_value` bouwen (asc/desc).
- [ ] Zoekfunctie op `title` en `description` bouwen.

Definition of Done:
1. Filter werkt en geeft correcte resultaten.
2. Sorteren wisselt correct tussen laag-hoog en hoog-laag.
3. Zoekfunctie vindt relevante resultaten.
4. Leeg resultaat toont nette melding.

## Donderdagmiddag: Finaledata verzamelen

Doel: voldoende data verzamelen voor dashboard-statistieken.

Taken:
- [ ] GTA (of alternatief spel) spelen.
- [ ] Modi registreren: deathmatch (meeste kills) of race (tijd).
- [ ] Minimaal 3 rondes per speler registreren.
- [ ] Win/loss (1 of 0) noteren.
- [ ] Tijdstempel noteren.
- [ ] Tabblad 4 invullen.

---

## Vrijdagochtend: Beveiliging en dashboard

Taken:
- [ ] Tabel `final_matches` vullen met data van gisteren.
- [ ] Dashboard met SQL-statistieken bouwen die alleen zichtbaar is voor de rol `organiser`. De volgende statistieken moeten getoond worden:
    1. Totaal aantal final matches (COUNT).
    2. Gemiddelde points_value (AVG).
    3. Hoogste points_value (MAX).
    4. Winnaar op basis van hoogste gemiddelde score.
- [ ] Tijd over? Formulier voor handmatige score en screenshot-upload maken.

## Vrijdagmiddag: Afronding en presentatie

Taken:
- [ ] About-pagina met toernooiregels maken.
- [ ] Mobiel testen op minimaal 3 pagina's: home, overzicht, detail.
- [ ] Publieke leaderboard- en finaleweergave klaarzetten.
- [ ] Vrijdagfinale draaien met top 4 (halve finales + finale).
- [ ] Korte demo geven met winnaar uit dashboard.
- [ ] Side-awards uitreiken (bijv. Most Kills, Best Support, Comeback).

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

### Voorstel: Publiek toernooi-opzet en vrijdagfinale

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
