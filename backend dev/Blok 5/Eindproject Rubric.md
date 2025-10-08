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
- **Projectweek (Aftekenen functionaliteit):** 50 punten
- **Mondeling Assessment:** 50 punten

---

### DEEL A: PROJECTWEEK - Aftekenen Functionaliteit (50 punten)

Deze criteria worden tijdens de projectweek afgevinkt door de docent.

---

### 1. Database & PDO (20 punten)

| Criterium | Onvoldoende (0-2) | Voldoende (3-4) | Goed (5) |
|-----------|-------------------|-----------------|----------|
| **PDO Connectie** | Gebruikt nog mysqli of geen database connectie, of PDO met grote fouten | PDO connectie correct opgezet | PDO connectie correct met goede error handling |
| **Prepared Statements** | Geen of nauwelijks prepared statements, SQL-injectie kwetsbaar | Alle queries gebruiken prepared statements met placeholders | Alle queries gebruiken prepared statements met duidelijke structuur en error handling |
| **Database Design** | Geen logische structuur, geen primary/foreign keys | Logische structuur met primary en foreign keys | Genormaliseerde database met duidelijke relaties en constraints |
| **Één-op-Veel Relatie** | Geen één-op-veel relatie in database aanwezig | Eén-op-veel relatie correct opgezet met foreign key | Meerdere één-op-veel relaties met correcte constraints en indexes |

**Totaal: ___ / 20**

---

### 2. Security (15 punten)

| Criterium | Onvoldoende (0-2) | Voldoende (3-4) | Goed (5) |
|-----------|-------------------|-----------------|----------|
| **XSS & SQL Injection Preventie** | Geen htmlspecialchars() of prepared statements, kwetsbaar | htmlspecialchars() en prepared statements toegepast | Consequent toegepast op alle plaatsen |
| **Password Hashing** | Plain text wachtwoorden of zwakke hashing | password_hash() en password_verify() correct gebruikt | Correcte hashing met goede implementatie |
| **Session & Input Validatie** | Geen session checks of input validatie | Session checks en server-side validatie aanwezig | Uitgebreide validatie met error handling |

**Totaal: ___ / 15**

---

### 3. Functionaliteit & Features (10 punten)

| Criterium | Onvoldoende (0) | Voldoende (1) | Goed (2) |
|-----------|-----------------|---------------|----------|
| **CRUD - Update** | Niet werkend | Update werkend voor minimaal 1 entiteit | Update werkend voor meerdere entiteiten met pre-filled formulieren |
| **Soft Delete** | Niet geïmplementeerd | Soft delete werkend met deleted_at kolom | Soft delete met restore functionaliteit |
| **Één-op-Veel Relatie Feature** | Geen feature die relatie toont | Opzoektabel/dropdown toont gerelateerde data (bijv. brand bij tool) | JOIN query toont gekoppelde data in overzicht/detail pagina |
| **AJAX Implementation** | Niet werkend | AJAX werkend zonder page reload | AJAX met JSON response en error handling |
| **Filtering/Zoeken** | Niet geïmplementeerd | Filtering werkend met GET parameters | Meerdere filters met prepared statements |

**Totaal: ___ / 10**

---

### 4. Code Kwaliteit (5 punten)

| Criterium | Onvoldoende (0-1) | Voldoende (2-3) | Goed (4-5) |
|-----------|-------------------|-----------------|------------|
| **Code Structuur & Naamgeving** | Chaotisch, geen scheiding, onduidelijke namen | Logische bestandsstructuur met duidelijke namen | MVC-achtige structuur, DRY principe, professionele naamgeving |

**Totaal: ___ / 5**

---

---

### DEEL B: MONDELING ASSESSMENT (50 punten)

Deze criteria worden beoordeeld tijdens het 20-minuten durende mondeling assessment.

---

### 5. Mondeling Assessment (50 punten)

| Criterium | Onvoldoende (0-4) | Voldoende (5-7) | Goed (8-10) |
|-----------|-------------------|-----------------|-------------|
| **Demo van je Applicatie** | Applicatie werkt niet of kan niet alle CRUD-operaties laten zien (create, read, update, delete) | Laat alle CRUD-operaties zien, inloggen werkt, AJAX functie werkt, filtering werkt | Laat alles zien én vertelt wat elke functie doet en hoe je het hebt gebouwd |
| **Prepared Statements Uitleggen** | Kan niet vertellen wat een prepared statement is of waar deze in de code staan | Wijst prepared statements aan in de code en kan uitleggen dat het SQL-injectie voorkomt | Laat zien hoe je placeholders gebruikt (:name) en kan het verschil met oude mysqli methode uitleggen |
| **Password Hashing Uitleggen** | Weet niet wat password_hash() of password_verify() doet | Wijst beide functies aan in de code en weet dat wachtwoorden versleuteld worden opgeslagen | Kan uitleggen waarom we plain text wachtwoorden niet opslaan en waar in de database je dit ziet |
| **XSS & htmlspecialchars Uitleggen** | Weet niet wat htmlspecialchars() doet of waar het staat | Wijst htmlspecialchars() aan in de code en weet dat het scripts voorkomt | Kan uitleggen wat er gebeurt als je het weglaat (kan script tag demo geven) |
| **AJAX & JSON Uitleggen** | Kan niet uitleggen hoe de AJAX code werkt | Wijst de fetch() aan in JavaScript en kan vertellen dat het zonder page reload werkt | Laat zien hoe JSON data wordt verstuurd en ontvangen tussen JavaScript en PHP |

**Totaal: ___ / 50**

---

## Eindcijferberekening

| Categorie | Punten | Maximum |
|-----------|--------|---------|
| **DEEL A: PROJECTWEEK** | | |
| 1. Database & PDO | ___ | 20 |
| 2. Security | ___ | 15 |
| 3. Functionaliteit & Features | ___ | 10 |
| 4. Code Kwaliteit | ___ | 5 |
| **Subtotaal Projectweek** | **___** | **50** |
| | | |
| **DEEL B: MONDELING ASSESSMENT** | | |
| 5. Mondeling Assessment | ___ | 50 |
| **Subtotaal Assessment** | **___** | **50** |
| | | |
| **EINDTOTAAL** | **___** | **100** |

**Eindcijfer:** ___ / 10

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
|------------|--------|
| 90-100% | 9-10 |
| 80-89% | 8-9 |
| 70-79% | 7-8 |
| 60-69% | 6-7 |
| 50-59% | 5-6 |
| < 50% | < 5 |

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
