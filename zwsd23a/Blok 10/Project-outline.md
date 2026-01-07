"SchoolSync" - Schooladministratiesysteem voor MBO-instellingen
Een platform waar docenten, studenten, stagecoördinatoren en administratie samenwerken. Perfect meta-project: MBO-studenten bouwen een systeem voor hun eigen schooltype!
Waarom dit project?

Super herkenbaar: Studenten kennen alle processen uit eigen ervaring
Complexe relaties: Veel many-to-many relationships
Verschillende gebruikersrollen: Elk met eigen dashboards en rechten
Realistische business rules: Aanwezigheidsplicht, cijferregels, herkansingen
15-20 tabellen met interessante koppelingen
Portfolio-waardig: Toont begrip van complexe bedrijfsprocessen

Voorgestelde verdeling (9 studenten):

Student 1: Multi-role authenticatie & gebruikersbeheer (student/docent/admin/ouder)
Student 2: Opleidingen, klassen & groepenbeheer
Student 3: Vakken, modules & studiegids
Student 4: Roostersysteem met lokaalreserveringen
Student 5: Cijferregistratie & studievoortgang
Student 6: Aanwezigheidsregistratie & verzuimmelding
Student 7: Stagemodule (bedrijven, plaatsingen, beoordelingen)
Student 8: Toetsplanning & herkansingen
Student 9: Dashboards, rapporten & ouderportaal

Database structuur (18-20 tabellen):
- users
- roles
- students
- teachers
- parents
- programs (opleidingen)
- classes (klassen)
- courses (vakken)
- course_modules
- enrollments (inschrijvingen)
- schedules (roosters)
- schedule_items
- rooms (lokalen)
- grades (cijfers)
- attendance (aanwezigheid)
- absences (verzuim)
- internships (stages)
- companies
- internship_evaluations
- assignments (opdrachten)
- assignment_submissions
- exams (toetsen)
- exam_registrations
- announcements (mededelingen)
- student_parent (pivot)
- teacher_course (pivot)
Complexe features die studenten kunnen toevoegen:

Automatische roostering met conflictpreventie
Studiepuntentelling (ECTS tracking)
Aanwezigheidspercentage met waarschuwingen
Herkansingsregels (max 2 per vak)
Stage-matching op basis van voorkeuren
Cijferberekening met wegingsfactoren
Verzuimregistratie met automatische meldingen
Voortgangsgesprekken plannen bij achterstanden
Exportfuncties voor DUO/BRON
Notificaties bij belangrijke deadlines
Digitale lesmateriaal bibliotheek
Peer-review voor groepsopdrachten

Extra uitdagingen voor snelle studenten:

Real-time roosterwijzigingen (websockets)
QR-code aanwezigheid scannen
API voor rooster-apps
Bulk import van studenten (Excel/CSV)
Automatische cijferberekening voor eindcijfers
Grafieken voor studievoortgang
Kalender-integratie (iCal export)

Waarom complexer dan MediConnect:

Meer relaties: Student-vak-docent-klas-periode koppelingen
Tijdsgebonden data: Roosters, periodes, schooljaren
Complexere business rules: Overgangsnormen, aanwezigheidsplicht
Meer gebruikerstypen: 4-5 verschillende rollen
Historische data: Voortgang over meerdere jaren

Zal ik voor dit project:

Alle user stories met acceptatiecriteria in het Nederlands uitwerken?
Een 9-weken planning maken?
Dependencies tussen modules aangeven?
Een basis database schema met migrations opstellen?