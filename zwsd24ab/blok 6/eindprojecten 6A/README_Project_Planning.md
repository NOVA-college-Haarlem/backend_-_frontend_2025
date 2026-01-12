# Project Planning Overzicht - ZWSD24AB Blok 6

## Inleiding

Dit document geeft een overzicht van alle planning documenten en tools voor de eindprojecten in Blok 6.

## Documenten

### 1. Project_Planning_Daily_Reviews.md
Het hoofdplanning document met:
- Dagelijkse review checklists (Dag 1 t/m Dag 7)
- Project-specifieke user stories per dag
- Te bespreken onderwerpen per review
- Richtlijnen voor reviews

**Gebruik**: Dit is je dagelijkse handleiding voor de reviews met studenten.

### 2. Student_Monitoring_Checklist.csv
Een spreadsheet voor het monitoren van individuele studenten:
- Alle 21 studenten met hun project toewijzing
- Aftekenlijst per dag met belangrijke milestones
- Kolommen voor elke belangrijke feature/functionaliteit

**Gebruik**: 
- Open in Excel of Google Sheets
- Vink af (✓) of noteer status (✓/X/?) per student
- Voeg opmerkingen toe in de laatste kolom
- Gebruik voor dagelijkse voortgangsbesprekingen

### 3. Veel_op_Veel_Relaties_Verificatie.md
Een controle document dat:
- Alle projecten analyseert op veel-op-veel relaties
- Status aangeeft per project (✅ OK of ⚠️ Aandacht)
- Concrete aanbevelingen geeft voor projecten zonder veel-op-veel relaties

**Belangrijke bevindingen**:
- ✅ **4 projecten** hebben expliciete veel-op-veel relaties
- ⚠️ **2 projecten** (UniversityManagement, ZiekenhuisManagement) hebben geen expliciete veel-op-veel relaties en moeten aangepast worden

## Project Verdeling

| Project              | Studenten                  | Veel-op-Veel Status |
| -------------------- | -------------------------- | ------------------- |
| Bibliotheek          | Niek, Emilio, Adam, Cemil  | ✅ OK                |
| ECommerceShop        | Hidde, Kaio, Jordan        | ✅ OK                |
| EventManagement      | Justin, Jesse, Koen, Ayaz  | ✅ OK                |
| HotelManagement      | Thijs, Jay, Teoman         | ✅ OK                |
| UniversityManagement | Lorenzo, Demian, Azaan     | ⚠️ Aandacht          |
| ZiekenhuisManagement | Indy, Silvio, Symon, Drake | ⚠️ Aandacht          |

## Werkwijze

### Voor de Start
1. Lees het `Project_Planning_Daily_Reviews.md` document door
2. Bekijk de `Veel_op_Veel_Relaties_Verificatie.md` voor projecten die aandacht nodig hebben
3. Open `Student_Monitoring_Checklist.csv` en maak een backup/kopie

### Tijdens het Project (Dagelijks)
1. **Voor de Review**:
   - Bekijk de checklist voor die dag in `Project_Planning_Daily_Reviews.md`
   - Update de `Student_Monitoring_Checklist.csv` met voortgang

2. **Tijdens de Review**:
   - Gebruik de dagelijkse checklist als leidraad
   - Bespreek project-specifieke user stories
   - Vraag naar code demonstraties
   - Check expliciet op veel-op-veel relaties bij projecten die dit nodig hebben

3. **Na de Review**:
   - Update de spreadsheet met de status van elke student
   - Noteer eventuele opmerkingen of problemen
   - Geef richtlijnen voor de volgende dag

### Speciale Aandachtspunten

#### Dag 1 - Database Ontwerp
- **Kritiek**: Check of UniversityManagement en ZiekenhuisManagement een veel-op-veel relatie hebben geïdentificeerd
- Bespreek de aanbevelingen uit `Veel_op_Veel_Relaties_Verificatie.md` met deze groepen

#### Dag 2 - Migrations & Models
- Check of pivot tables correct zijn aangemaakt
- Verifieer dat `belongsToMany` relaties zijn gedefinieerd

#### Dag 5 - Veel-op-Veel Implementatie
- Dit is een kritieke dag - check of veel-op-veel relaties daadwerkelijk geïmplementeerd zijn
- Test of `sync()`, `attach()`, of `detach()` correct gebruikt worden

## Belangrijke Opmerkingen

1. **Projectdocumenten worden NIET aangepast** - Studenten werken volgens hun originele projectdocumenten
2. **Veel-op-veel relaties zijn VERPLICHT** - Alle projecten moeten minimaal één veel-op-veel relatie hebben
3. **UniversityManagement en ZiekenhuisManagement** hebben extra aandacht nodig - zie verificatie document voor aanbevelingen
4. **Spreadsheet is flexibel** - Voeg extra kolommen toe indien nodig voor specifieke tracking

## Tips voor Effectieve Reviews

1. **Wees specifiek**: Vraag naar concrete code in plaats van algemene beschrijvingen
2. **Demo's**: Laat studenten hun code demonstreren, niet alleen uitleggen
3. **Code review**: Bekijk daadwerkelijk code snippets tijdens de review
4. **Proactief**: Help met problemen voordat ze te groot worden
5. **Documenteer**: Noteer belangrijke beslissingen of problemen in de spreadsheet

## Contact & Updates

Als je vragen hebt of wijzigingen nodig zijn aan de planning, pas de documenten aan naar behoefte. De structuur is flexibel genoeg om aan te passen aan de behoeften van de klas.

---

**Laatste update**: Documenten aangemaakt voor projectperiode ZWSD24AB Blok 6

