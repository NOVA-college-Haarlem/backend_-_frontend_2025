# UniversityManagement (6B - CRUD uitbreiding)

## Introductie

Je bouwt verder op je 6A UniversityManagement-project. In 6B breid je uit met inschrijvingen, cijferregistratie en beheer van studenten en cursussen.

## Startpunt

- [ ] Ik heb mijn bestaande 6A-project geopend en kan het lokaal starten.
- [ ] Ik heb eerst gecontroleerd of mijn overzichten en detailpagina's uit 6A nog werken.

## Korte begrippen in dit project

- CRUD (Create, Read, Update, Delete)
- Middleware (controlelaag voor routes)
- Gate (centrale rechtencheck)
- Policy (rechtencheck op 1 specifiek record)

## Verplichte opdrachten

### Student CRUD
- [ ] Ik heb volledige CRUD voor `students` gemaakt.
- [ ] Ik heb gevalideerd met regel: `name` required.
- [ ] Ik heb gevalideerd met regel: `student_number` required unique.
- [ ] Ik heb gevalideerd met regel: `study` required.

### Course CRUD
- [ ] Ik heb volledige CRUD voor `courses` gemaakt.
- [ ] Ik heb gekoppeld een docent aan elke cursus.
- [ ] Ik heb gevalideerd `study_points` als integer min 1.

### Enrollments beheren
- [ ] Ik heb ervoor gezorgd dat studieadviseur een student kan inschrijven voor een cursus.
- [ ] Ik heb `status` toegevoegd (active, dropped, completed) en update-flow.

### Grades invoeren
- [ ] Ik heb ervoor gezorgd dat docent cijfers kan toevoegen en wijzigen.
- [ ] Ik heb gevalideerd `grade` tussen 1.0 en 10.0.

### Zoeken en filteren
- [ ] Ik heb een zoekopdracht op cursusnaam toegevoegd.
- [ ] Ik heb een filter op `study` of inschrijf-`status` toegevoegd.

### Auth en autorisatie
- [ ] Als Breeze nog ontbreekt, doorloop ik eerst Hoofdstuk 4 - Authenticatie en Middleware (Laravel Breeze).
- [ ] Ik heb beheeracties met auth middleware beveiligd.
- [ ] Ik heb gate beheer-cursussen voor faculteits manager gebruikt.
- [ ] Ik heb gate beheer-inschrijvingen voor studieadviseur gebruikt.
- [ ] Ik heb @can voor knoppen in views gebruikt.

## Plusopdrachten (extra)

- [ ] Ik heb voorkomen dubbele inschrijving van dezelfde student op dezelfde cursus.
- [ ] Ik heb een policy: docent mag alleen cijfers beheren van eigen cursussen gebruikt.
- [ ] Ik heb een overzicht toegevoegd met gemiddelde cijfers per cursus.

## User stories 6B

### Studieadviseur
- [ ] Als studieadviseur wil ik studenten kunnen registreren zodat ze kunnen deelnemen.
- [ ] Als studieadviseur wil ik studenten kunnen inschrijven voor cursussen zodat studievoortgang start.

### Docent
- [ ] Als docent wil ik cijfers kunnen invoeren en aanpassen voor mijn eigen cursussen.

### Faculteits manager
- [ ] Als manager wil ik cursussen kunnen aanmaken, wijzigen en verwijderen zodat het aanbod actueel blijft.

### Student
- [ ] Als student wil ik mijn inschrijvingen en cijfers op een detailpagina kunnen zien zodat ik voortgang kan volgen.

## Acceptatiecriteria

- [ ] Student CRUD en Course CRUD compleet.
- [ ] Validatie werkt in create en update flows.
- [ ] Rollen, gates en policies werken correct.
