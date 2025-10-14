# Rubric Eindproject Backend Development - Blok 5

## Algemene Informatie
**Blok:** 5
**Duur assessment:** 20-30 minuten
**Weging:** Eindcijfer Blok 5
**Vorm:** Mondeling assessment met live demo en code review

---

## Projecteisen
Studenten bouwen een PHP/MySQL webapplicatie waarin alle behandelde technieken uit Blok 5 zijn verwerkt. Het project moet minimaal de volgende functionaliteit bevatten:
- Een gebruikerssysteem met inlog/registratie
- CRUD-operaties op minimaal 2 entiteiten
- Een één-op-veel relatie in de database met bijbehorende feature (bijv. opzoektabel/dropdown)
- Een interactieve component met AJAX
- Filtering/zoekfunctionaliteit

---

## Beoordelingscriteria

**Verdeling:**
- **Projectweek (Aftekenen functionaliteit):** 100 punten
- **Mondeling Assessment:** 100 punten

---

### DEEL A: PROJECTWEEK - Aftekenen Functionaliteit (100 punten)

Deze criteria worden tijdens de projectweek afgevinkt door de docent.

---

### 1. Database Ontwerp (20 punten)

| Criterium           | Onvoldoende (0-2)                                                                                                                                        | Voldoende (3-4)                                                                                                                                                    | Goed (5)                                                                                                                                                        |
| ------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **DBO-verslag**     | - Er is geen verslag of verslag voldoet niet aan de eisen<br>- Er is geen inspanning verricht (ontbrekende teksten, geen lay-out, niet leesbaar)         | - Er is een verslag dat grotendeels/bijna aan alle eisen voldoet<br>- Er is voldoende inspanning verricht (goede teksten, goede lay-out, goed leesbaar)            | - Er is een verslag dat volledig aan alle eisen voldoet<br>- Er zijn extra inspanningen verricht (extra aandacht aan teksten, mooie lay-out, erg goed leesbaar) |
| **DBO stap 1: ERD** | - Er is geen ERD of ERD sluit niet aan bij opdracht<br>- Het ERD voldoet niet aan de afgesproken notatie<br>- 1-op-1 is niet opgenomen                   | - Er is een ERD dat grotendeels/bijna volledig aansluit bij opdracht<br>- Het ERD voldoet aan de afgesproken notatie<br>- 1-op-1 is goed opgenomen                 | - Er is een ERD dat volledig aansluit bij opdracht<br>- Het ERD voldoet aan de afgesproken notatie<br>- 1-op-1 is goed opgenomen                                |
| **DBO stap 2: RM**  | - Er is geen RM of RM is geen goede vertaling van ERD<br>- Het RM voldoet niet aan de afgesproken notatie<br>- 1-op-1 is niet goed vertaald of ontbreekt | - Er is een RM dat grotendeels/bijna volledig een goede vertaling is van ERD<br>- Het RM voldoet aan de afgesproken notatie<br>- 1-op-1 is goed vertaald in het RM | - Er is een RM dat volledig een goede vertaling is van ERD<br>- Het RM voldoet aan de afgesproken notatie<br>- 1-op-1 is goed vertaald in het RM                |
| **DBO stap 3: DB**  | - Er is geen DB of DB is geen juiste implementatie van RM<br>- 1-op-1 is niet goed geïmplementeerd of ontbreekt                                          | - Er is een DB dat grotendeels/bijna volledig een juiste implementatie is van RM<br>- 1-op-1 is goed geïmplementeerd                                               | - Er is een DB dat volledig een juiste implementatie is van RM<br>- 1-op-1 is goed geïmplementeerd                                                              |

**Totaal: ___ / 20**

---

### 2. Database Implementatie (20 punten)

| Criterium           | Onvoldoende (0-2)                                                                                                                                        | Voldoende (3-4)                                                                                                                                                    | Goed (5)                                                                                                                                                        |
| ------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Tabellen** | Geen tabellen of tabellen sluiten niet aan bij opdracht | Tabellen sluiten grotendeels/bijna aan bij opdracht | Tabellen sluiten volledig aan bij opdracht |
| **Primary keys** | Geen primary keys op alle tabellen | Primary keys op alle tabellen | Primary keys op alle tabellen |
| **Foreign keys** | Geen foreign keys op alle tabellen | Foreign keys op alle tabellen | Foreign keys op alle tabellen |
| **Database connectie** | Gebruikt nog mysqli of geen database connectie, of PDO met grote fouten | PDO connectie correct opgezet | PDO connectie correct met goede error handling |

**Totaal: ___ / 20**

### 3. Security (15 punten)

| Criterium                         | Onvoldoende (0-2)                                         | Voldoende (3-4)                                       | Goed (5)                                 |
| --------------------------------- | --------------------------------------------------------- | ----------------------------------------------------- | ---------------------------------------- |
| **XSS & SQL Injection Preventie** | Geen htmlspecialchars() of prepared statements, kwetsbaar | htmlspecialchars() en prepared statements toegepast   | Consequent toegepast op alle plaatsen    |
| **Password Hashing**              | Plain text wachtwoorden of zwakke hashing                 | password_hash() en password_verify() correct gebruikt | Correcte hashing met goede implementatie |
| **Session & Input Validatie**     | Geen session checks of input validatie                    | Session checks en server-side validatie aanwezig      | Uitgebreide validatie met error handling |

**Totaal: ___ / 15**

---

### 4. Functionaliteit & Features (40 punten)

| Criterium                       | Onvoldoende (0-2)                | Voldoende (3-4)                                                       | Goed (5)                                                           |
| ------------------------------- | ------------------------------ | ------------------------------------------------------------------- | ------------------------------------------------------------------ |
| **CRUD - Create**               | Niet werkend                   | Create werkend voor minimaal 1 entiteit                             | Create werkend voor meerdere entiteiten met pre-filled formulieren |
| **CRUD - Read**                 | Niet werkend                   | Read werkend voor minimaal 1 entiteit                             | Read werkend voor meerdere entiteiten met pre-filled formulieren |
| **CRUD - Update**               | Niet werkend                   | Update werkend voor minimaal 1 entiteit                             | Update werkend voor meerdere entiteiten met pre-filled formulieren |
| **CRUD - Delete**               | Niet werkend                   | Delete werkend voor minimaal 1 entiteit                             | Delete werkend voor meerdere entiteiten met pre-filled formulieren |
| **Soft Delete**                 | Niet geïmplementeerd           | Soft delete werkend met deleted_at kolom                            | Soft delete met restore functionaliteit                            |
| **Één-op-Veel Relatie Feature** | Geen feature die relatie toont | Opzoektabel/dropdown toont gerelateerde data (bijv. brand bij tool) | JOIN query toont gekoppelde data in overzicht/detail pagina        |
| **AJAX Implementation**         | Niet werkend                   | AJAX werkend zonder page reload                                     | AJAX met JSON response en error handling                           |
| **Filtering/Zoeken**            | Niet geïmplementeerd           | Filtering werkend met GET parameters                                | Meerdere filters met prepared statements                           |

**Totaal: ___ / 40**

---

### 5. Code Kwaliteit (5 punten)

| Criterium                       | Onvoldoende (0-1)                             | Voldoende (2-3)                                 | Goed (4-5)                                                    |
| ------------------------------- | --------------------------------------------- | ----------------------------------------------- | ------------------------------------------------------------- |
| **Code Structuur & Naamgeving** | Chaotisch, geen scheiding, onduidelijke namen | Logische bestandsstructuur met duidelijke namen | DRY principe, professionele naamgeving |

**Totaal: ___ / 5**

---

---

### DEEL B: MONDELING ASSESSMENT (100 punten)

Deze criteria worden beoordeeld tijdens het 20-minuten durende mondeling assessment.

---

### 6. Mondeling Assessment (100 punten)

| Criterium                            | Onvoldoende (0-7)                                                                               | Voldoende (8-9)                                                                            | Goed (10)                                                                                          |
| ------------------------------------ | ----------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------- |
| **Demo van je Applicatie**           | Applicatie werkt niet of kan niet alle CRUD-operaties laten zien (create, read, update, delete) | Laat alle CRUD-operaties zien, inloggen werkt, AJAX functie werkt, filtering werkt         | Laat alles zien én vertelt wat elke functie doet en hoe je het hebt gebouwd                          |
| **Security** | Heeft moeite met uitleggen van security concepten | Kan een enkel security concept (prepared statements, password hashing, XSS) uitleggen | Kan meerdere security concepten uitleggen |
| **Frontend Implementatie**           | Geen CSS/styling toegepast, ongestructureerde HTML of onvolledige implementatie | Basis CSS/styling met Bootstrap of eigen CSS, nette HTML structuur | Professionele styling, semantische HTML5 elementen |
| **CRUD - Create Implementatie**      | Kan create niet uitleggen/demonstreren           | Legt basis create flow uit met prepared statements              | Toont diepgaand begrip van create proces en data validatie            |
| **CRUD - Read Implementatie**        | Kan read niet uitleggen/demonstreren            | Legt basis read queries uit met prepared statements             | Toont begrip van complexe queries en data ophalen                     |
| **CRUD - Update Implementatie**      | Kan update niet uitleggen/demonstreren          | Legt basis update flow uit met prepared statements              | Toont diepgaand begrip van update proces en data validatie            |
| **CRUD - Delete Implementatie**      | Kan delete niet uitleggen/demonstreren          | Legt basis delete/soft-delete uit met prepared statements       | Toont begrip van delete implications en data integriteit              |
| **JOIN Query Implementatie**      | Kan JOIN query niet uitleggen/demonstreren          | Legt basis JOIN query uit met prepared statements       | Toont begrip van JOIN query en data ophalen              |
| **Filtering Implementatie**      | Kan filtering niet uitleggen/demonstreren          | Legt basis filtering uit met prepared statements       | Toont begrip van filtering en data ophalen              |
| **AJAX Implementatie**      | Kan AJAX niet uitleggen/demonstreren          | Legt basis AJAX uit met prepared statements       | Toont begrip van AJAX en data ophalen              |


**Totaal: ___ / 100**

---

## Eindcijferberekening

| Categorie                        | Punten  | Maximum |
| -------------------------------- | ------- | ------- |
| **DEEL A: PROJECTWEEK**          |         |         |
| 1. Database Ontwerp              | ___     | 20      |
| 2. Database Implementatie        | ___     | 20      |
| 3. Security                      | ___     | 15      |
| 4. Functionaliteit & Features    | ___     | 40      |
| 5. Code Kwaliteit                | ___     | 5       |
| **Subtotaal Projectweek**        | **___** | **100** |
|                                  |         |         |
| **DEEL B: MONDELING ASSESSMENT** |         |         |
| 6. Mondeling Assessment          | ___     | 100      |
| **Subtotaal Assessment**         | **___** | **100**  |
|                                  |         |         |
| **EINDTOTAAL**                   | **___** | **200** |

**Eindcijfer:** ___ / 20

---

## Technische Checklist (Voor Controle)

### Must-Have Elementen:
- [ ] PDO database connectie in plaats van mysqli
- [ ] Prepared statements bij alle database queries
- [ ] CREATE operatie (formulier → database)
- [ ] READ operatie (database → tabel/overzicht)
- [ ] UPDATE operatie (formulier pre-filled → database)
- [ ] DELETE operatie (soft delete met deleted_at)
- [ ] Één-op-veel relatie in database (met foreign key)
- [ ] Opzoektabel of dropdown die relatie toont (bijv. brand selecteren bij tool)
- [ ] JOIN query om gekoppelde data te tonen
- [ ] htmlspecialchars() bij het tonen van user input
- [ ] Input validatie op formulieren
- [ ] password_hash() bij registratie
- [ ] password_verify() bij login
- [ ] Session management voor inloggen
- [ ] AJAX call met JSON response
- [ ] Filtering met GET parameters en WHERE clause
- [ ] Error handling met redirects of messages
- [ ] Minimaal 2 verschillende entiteiten (bijv. users en tools)

### Nice-to-Have Elementen:
- [ ] Restore functionaliteit voor soft deleted items
- [ ] Role-based access (admin vs user)
- [ ] Logging systeem (delete.log of activity log)
- [ ] Multiple AJAX features
- [ ] Meerdere filters combineren
- [ ] Shopping cart functionaliteit
- [ ] Meerdere één-op-veel relaties

---

## Assessment Vragen (Voorbeelden)

### Technische Vragen:
1. "Waarom gebruiken we prepared statements in plaats van variabelen in SQL?"
2. "Wat gebeurt er als je htmlspecialchars() weglaat?"
3. "Leg uit hoe password_verify() werkt."
4. "Wat is het verschil tussen soft delete en hard delete?"
5. "Hoe voorkom je dat niet-ingelogde gebruikers bepaalde pagina's kunnen bezoeken?"

### Code Review Vragen:
6. "Loop door je code en leg uit wat deze query doet."
7. "Waar in je code bescherm je tegen SQL-injectie?"
8. "Laat zien hoe je AJAX implementatie werkt."
9. "Hoe valideer je de input van gebruikers?"
10. "Wat zou er gebeuren als...?" (hypothetische scenario's)

### Reflectie Vragen:
11. "Wat was het moeilijkste onderdeel van dit project?"
12. "Welke security maatregel vind je het belangrijkst en waarom?"
13. "Hoe zou je dit project verder kunnen verbeteren?"
14. "Wat heb je geleerd over veilig programmeren?"

---

## Cijfer Conversie

| Percentage | Cijfer |
| ---------- | ------ |
| 90-100%    | 9-10   |
| 80-89%     | 8-9    |
| 70-79%     | 7-8    |
| 60-69%     | 6-7    |
| 50-59%     | 5-6    |
| < 50%      | < 5    |

---

## Feedback Sjabloon

**Student:** _______________
**Datum:** _______________
**Beoordelaar:** _______________

### Sterke Punten:
-
-
-

### Verbeterpunten:
-
-
-

### Specifieke Aanbevelingen:
-
-
-

**Eindoordeel:** _______________
