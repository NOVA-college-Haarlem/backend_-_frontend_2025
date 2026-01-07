# SchoolSync - Project Overzicht

**Project:** SchoolSync - Schooladministratiesysteem voor MBO-instellingen
**Duur:** 7 weken (3 sprints van ~2-2.5 weken)
**Aanpak:** Elke student = 1 dev team, bouwt VOLLEDIGE systeem
**Teams:** 9 parallelle dev teams (9 studenten)
**Product Owner:** Docent (voor alle 9 teams)
**Versiebeheer:** GitHub (elke student eigen repository)
**Werkwijze:** Agile/Scrum (aangepast voor onderwijscontext)

---

## Project Visie

**Meta-project:** MBO-studenten bouwen een administratiesysteem voor hun eigen schooltype.

### Waarom dit project?

✅ **Herkenbaar:** Studenten kennen alle processen uit eigen ervaring
✅ **Educatief:** Complexe relaties, multiple user roles, realistische business logic
✅ **Portfolio-waardig:** Toont begrip van enterprise-level systemen
✅ **Relevant:** Echte use cases die studenten dagelijks meemaken
✅ **Uitdagend:** 18-20 tabellen met many-to-many relationships
✅ **Volledig:** Elke student leert alle aspecten van het systeem

---

## Individuele Dev Team Aanpak

### Elke Student Bouwt:
✅ **Authenticatie & Autorisatie** (multi-role: student/docent/admin/ouder)
✅ **Opleidingen & Klassen** (programs, classes, enrollments)
✅ **Vakken & Modules** (courses, course modules, studiegids)
✅ **Roostersysteem** (schedules, schedule items, lokalen)
✅ **Cijferregistratie** (grades, berekeningen, voortgang)
✅ **Aanwezigheid** (attendance, absences, verzuim tracking)
✅ **Stagemodule** (internships, companies, evaluations)
✅ **Toetsplanning** (exams, registrations, herkansingen)
✅ **Dashboards** (per rol, rapporten, overzichten)

### Voordelen van deze aanpak:
- 🎯 **Geen dependencies:** Elke student werkt volledig onafhankelijk
- 📚 **Alles leren:** Iedereen leert alle aspecten (auth, CRUD, relaties, business logic)
- ⚡ **Eigen tempo:** Geen wachten op anderen
- 🎓 **Individuele beoordeling:** Duidelijk wie wat heeft gedaan
- 🤝 **Kunnen elkaar helpen:** Zonder afhankelijk te zijn
- 🏆 **Compleet portfolio item:** Elk heeft een volledig werkend systeem

---

## Gebruikersrollen

| Rol | Rechten | Dashboard Features |
|-----|---------|-------------------|
| **Student** | Eigen roosters, cijfers, aanwezigheid, opdrachten bekijken | Rooster, cijfers, opdrachten, stage-info |
| **Docent** | Cijfers invoeren, aanwezigheid registreren, opdrachten beheren | Lesgroepen, cijferadministratie, rooster |
| **Stagecoördinator** | Stagebedrijven, plaatsingen, beoordelingen beheren | Stage-overzicht, bedrijvenlijst, evaluaties |
| **Administratie** | Studenten inschrijven, klassen beheren, rapporten genereren | Administratie-dashboard, export-functies |
| **Ouder/Verzorger** | Cijfers, aanwezigheid kind bekijken (read-only) | Kind-dashboard met voortgang |

---

## Sprint Planning (7 weken)

### Sprint 1: Foundation & Core Setup (Week 1-2.5)
**Focus:** Database, authenticatie, basis modules
**Oplevering:** Werkende login, database structuur, basis CRUD

**Deliverables:**
- Database schema compleet (alle tabellen)
- Authenticatie & autorisatie (Module 1)
- Opleidingen & klassen basis (Module 2)
- Vakken basis (Module 3)
- Rooster basis (Module 4)

---

### Sprint 2: Business Logic & Integration (Week 2.5-5)
**Focus:** Complexe functionaliteit, module-integratie
**Oplevering:** Werkende business rules, gekoppelde modules

**Deliverables:**
- Cijferregistratie met berekeningen (Module 5)
- Aanwezigheidsregistratie (Module 6)
- Stage-module (Module 7)
- Toetsplanning (Module 8)
- Module-integratie (roosters → cijfers → voortgang)

---

### Sprint 3: Finalization & Polish (Week 5-7)
**Focus:** Dashboards, rapporten, bugfixes, documentatie
**Oplevering:** Volledig werkend systeem met alle features

**Deliverables:**
- Dashboards voor alle rollen (Module 9)
- Rapporten & export functies
- Ouderportaal
- Notificaties & meldingen
- Documentatie & presentatie
- Bug fixes & testing

---

## Dependencies tussen Modules

### Critical Path:
```
Module 1 (Auth)
    ↓
Module 2 (Opleidingen/Klassen) + Module 3 (Vakken)
    ↓
Module 4 (Rooster) → Module 6 (Aanwezigheid)
    ↓
Module 5 (Cijfers) + Module 8 (Toetsen)
    ↓
Module 7 (Stages) + Module 9 (Dashboards)
```

### Dependencies Detail:

**Module 1** (Auth) → **ALLE MODULES**
Iedereen heeft authenticatie nodig

**Module 2** (Opleidingen/Klassen) → **Module 4, 5, 6, 8**
Roosters, cijfers, aanwezigheid zijn gekoppeld aan klassen

**Module 3** (Vakken) → **Module 4, 5, 8**
Roosters, cijfers en toetsen hebben vakken nodig

**Module 4** (Rooster) → **Module 6**
Aanwezigheid wordt geregistreerd bij geroosterde lessen

**Module 5** (Cijfers) → **Module 9**
Dashboards tonen cijfers

**Module 6** (Aanwezigheid) → **Module 9**
Dashboards tonen aanwezigheid

**Module 7** (Stages) → **Module 9** (light dependency)
Stage-info in dashboards

**Module 8** (Toetsen) → **Module 5**
Toetsen hebben invloed op cijfers

---

## Database Structuur (20 tabellen)

### Core Tables:
- `users` - Alle gebruikers (students, teachers, parents, admin)
- `roles` - Gebruikersrollen
- `students` - Student-specifieke data
- `teachers` - Docent-specifieke data
- `parents` - Ouder/verzorger data

### Educational Structure:
- `programs` - Opleidingen (bijv. Software Development niveau 4)
- `classes` - Klassen (bijv. SD4A, SD4B)
- `courses` - Vakken (bijv. Backend Development, Frontend)
- `course_modules` - Modules binnen vakken (bijv. Blok 1-4)

### Enrollment & Scheduling:
- `enrollments` - Student-inschrijvingen bij klassen/vakken
- `schedules` - Rooster-perioden (bijv. Schooljaar 2024-2025)
- `schedule_items` - Individuele roosteritems
- `rooms` - Lokalen

### Assessment & Attendance:
- `grades` - Cijfers
- `attendance` - Aanwezigheidsregistratie
- `absences` - Verzuimmeldingen
- `exams` - Toetsen
- `exam_registrations` - Toetsaanmeldingen

### Assignments & Internships:
- `assignments` - Opdrachten
- `assignment_submissions` - Ingeleverde opdrachten
- `internships` - Stages
- `companies` - Stagebedrijven
- `internship_evaluations` - Stage-beoordelingen

### Communication:
- `announcements` - Mededelingen/nieuws

### Pivot Tables:
- `student_parent` - Many-to-many: Student ↔ Ouders
- `teacher_course` - Many-to-many: Docent ↔ Vakken
- `class_course` - Many-to-many: Klas ↔ Vakken

---

## GitHub Workflow

### Repository Structure:
```
schoolsync/
├── database/
│   ├── migrations/
│   ├── seeders/
│   └── schema.sql
├── modules/
│   ├── auth/
│   ├── classes/
│   ├── courses/
│   ├── scheduling/
│   ├── grades/
│   ├── attendance/
│   ├── internships/
│   ├── exams/
│   └── dashboard/
├── shared/
│   ├── config/
│   ├── helpers/
│   └── templates/
├── public/
│   ├── css/
│   ├── js/
│   └── index.php
├── docs/
│   ├── user-stories/
│   ├── api/
│   └── setup.md
└── README.md
```

### Branching Strategy:
```
main (production-ready)
  ↓
develop (integration branch)
  ↓
feature/module1-auth
feature/module2-classes
feature/module3-courses
...etc
```

### Workflow per Student:
1. **Maak feature branch:** `feature/module[X]-[feature-name]`
2. **Ontwikkel op eigen branch**
3. **Test lokaal**
4. **Push naar GitHub**
5. **Maak Pull Request naar `develop`**
6. **Code review door Product Owner**
7. **Merge na goedkeuring**

---

## Agile Ceremonies (aangepast voor onderwijs)

### Sprint Planning (Week 1, Week 2.5, Week 5)
**Duur:** 1-2 uur
**Doel:** Bespreken sprint goals, user stories prioriteren
**Deelnemers:** Alle studenten + Product Owner

**Agenda:**
- Sprint review vorige sprint (behalve Sprint 1)
- Sprint goal deze sprint
- User stories verdelen
- Dependencies bespreken
- Vragen & onduidelijkheden

---

### Daily Standup (Elke lesdag)
**Duur:** 10-15 minuten
**Doel:** Voortgang delen, blokkades bespreken

**Vragen per student:**
1. Wat heb je gisteren gedaan?
2. Wat ga je vandaag doen?
3. Loop je ergens tegenaan? (blokkades)

**Format:** Round-robin, iedereen kort aan het woord

---

### Sprint Review (Einde elke sprint)
**Duur:** 1-2 uur
**Doel:** Demo van werkende features

**Agenda:**
- Elke student demonstreert eigen module
- Product Owner test en geeft feedback
- Acceptatie van user stories (done/not done)
- Noteer bugs en verbeterpunten

---

### Sprint Retrospective (Na elke sprint)
**Duur:** 30-45 minuten
**Doel:** Reflectie en verbetering

**Vragen:**
- Wat ging goed?
- Wat kan beter?
- Actiepunten voor volgende sprint

---

## Product Owner Taken

### Voor elke Sprint:
- [ ] User stories voorbereiden en prioriteren
- [ ] Acceptatiecriteria controleren
- [ ] Dependencies identificeren en communiceren
- [ ] Sprint goals bepalen

### Tijdens Sprint:
- [ ] Beschikbaar voor vragen (office hours)
- [ ] Code reviews uitvoeren (Pull Requests)
- [ ] Tussentijdse check-ins (minimaal 1x per week per student)
- [ ] Blokkades helpen oplossen

### Einde Sprint:
- [ ] Sprint review voorzitten
- [ ] User stories accepteren of afkeuren
- [ ] Feedback geven op demo's
- [ ] Retrospective faciliteren

---

## Definition of Done (DoD)

Een user story is **DONE** als:

✅ **Code:**
- [ ] Feature werkt volgens acceptatiecriteria
- [ ] Code is gecommit en gepushed naar GitHub
- [ ] Code volgt coding standards (PSR-12 voor PHP)
- [ ] Geen kritieke bugs

✅ **Database:**
- [ ] Migrations zijn aanwezig
- [ ] Seeders zijn aanwezig (testdata)
- [ ] Foreign keys correct ingesteld

✅ **Testing:**
- [ ] Feature is handmatig getest
- [ ] Happy path werkt
- [ ] Error handling getest

✅ **Documentatie:**
- [ ] Code comments bij complexe logica
- [ ] README bijgewerkt (indien nodig)
- [ ] API documentatie (indien API endpoints)

✅ **Review:**
- [ ] Pull Request is goedgekeurd door Product Owner
- [ ] Feedback is verwerkt

---

## Communicatie

### Discord/Teams kanalen:
- **#general** - Algemene vragen en updates
- **#daily-standup** - Dagelijkse updates
- **#code-review** - Pull request notificaties
- **#bugs** - Bug reports en fixes
- **#module-[1-9]** - Module-specifieke discussies

### GitHub:
- **Issues** - Bugs en feature requests
- **Pull Requests** - Code reviews
- **Projects** - Kanban board voor sprint planning
- **Wiki** - Documentatie

---

## Evaluatie & Beoordeling

### Individuele Beoordeling (70%):
- **Functionaliteit** (30%): Werkt de module volgens acceptatiecriteria?
- **Code kwaliteit** (20%): Clean code, comments, structure
- **Database design** (10%): Correcte relaties, normalisatie
- **GitHub gebruik** (10%): Commits, branches, pull requests

### Team Beoordeling (30%):
- **Samenwerking** (10%): Communicatie, hulp aan anderen
- **Integratie** (10%): Werken modules samen?
- **Presentatie** (10%): Eindpresentatie van het project

---

## Risico's & Mitigatie

### Risico 1: Dependencies blokkeren studenten
**Mitigatie:**
- Gebruik dummy data/mock functions totdat dependency klaar is
- Prioriteer critical path modules (Auth, Classes, Courses)

### Risico 2: Merge conflicts bij database schema
**Mitigatie:**
- Database schema vroeg vastleggen (Sprint 1, week 1)
- Wijzigingen altijd via migrations
- Database wijzigingen communiceren in #general

### Risico 3: Ongelijke werklast per module
**Mitigatie:**
- Complexere modules krijgen minder user stories
- Snelle studenten helpen anderen of nemen bonus features
- Weekly check-ins om achterstand te signaleren

### Risico 4: Technische problemen (lokale omgeving, Git)
**Mitigatie:**
- Setup dag in week 1 (iedereen krijgt project werkend)
- Git workshop voor studenten die het nodig hebben
- Backup op school servers

---

## Resources & Tooling

### Development Stack:
- **Backend:** PHP 8.x
- **Database:** MySQL 8.x
- **Frontend:** HTML, CSS, JavaScript (vanilla of Bootstrap)
- **Versiebeheer:** Git + GitHub
- **Lokaal:** XAMPP/MAMP/Laravel Valet

### Aanbevolen Tools:
- **IDE:** VS Code met PHP extensions
- **Database:** phpMyAdmin of MySQL Workbench
- **API Testing:** Postman (voor API endpoints)
- **Git GUI:** GitHub Desktop of GitKraken (optioneel)

### Learning Resources:
- PHP Documentation (php.net)
- MySQL Documentation
- Git tutorials (learngitbranching.js.org)
- W3Schools voor frontend

---

## Success Metrics

Het project is **SUCCESVOL** als:

✅ Alle 9 modules zijn geïmplementeerd en werken
✅ Minimaal 80% van user stories is **DONE** (volgens DoD)
✅ Database structuur is compleet en genormaliseerd
✅ Alle gebruikersrollen kunnen inloggen en eigen features gebruiken
✅ Integratie tussen modules werkt (bijv. rooster → aanwezigheid → cijfers)
✅ Eindpresentatie toont werkend systeem
✅ Code staat op GitHub met nette commit history

**Bonus (voor excellent):**
- Real-time features (websockets)
- API voor externe integratie
- Responsive design (mobiel vriendelijk)
- Advanced reporting met grafieken
- Deployment naar productieserver

---

## Volgende Stappen

1. **Kickoff meeting** - Project introductie, modules verdelen
2. **Setup dag** - Lokale omgeving, GitHub access, database setup
3. **Sprint 1 Planning** - User stories verdelen, sprint goal bepalen
4. **Development start** - Elke student begint met eigen module
5. **Daily standups** - Dagelijkse voortgang delen

---

**Let's build SchoolSync! 🚀**
