# FitnessCenter (6B - CRUD uitbreiding)

## Introductie

Je bouwt verder op je 6A FitnessCenter-project. In 6B voeg je beheerfunctionaliteit toe voor `workouts`, reserveringen en trainerplanning.

## Startpunt

- [ ] Ik heb mijn bestaande 6A-project geopend en kan het lokaal starten.
- [ ] Ik heb eerst gecontroleerd of mijn overzichten en detailpagina's uit 6A nog werken.

## Korte begrippen in dit project

- CRUD (Create, Read, Update, Delete)
- Many-to-many (veel-op-veel-relatie)
- Middleware (controlelaag voor routes)
- Gate (centrale rechtencheck)
- Policy (rechtencheck op 1 specifiek record)

## Verplichte opdrachten

### Workout CRUD
- [ ] Ik heb volledige CRUD voor `workouts` gemaakt.
- [ ] Ik heb gevalideerd met regel: `name` required.
- [ ] Ik heb gevalideerd met regel: duration required integer min 5.
- [ ] Ik heb gevalideerd met regel: difficulty required in beginner, intermediate, advanced.
- [ ] Ik heb gevalideerd met regel: `trainer_id` required exists.
- [ ] Ik heb gekoppeld `equipment` via many-to-many en beheer dit in create en edit.

### Reserveringen beheren
- [ ] Ik heb create en store voor `reservations` gemaakt voor leden.
- [ ] Ik heb ervoor gezorgd dat receptionist reserveringsstatus kan bijwerken (booked, canceled, attended).

### Trainer en specialisaties
- [ ] Ik heb CRUD voor `specializations` gemaakt.
- [ ] Ik heb gekoppeld trainers aan meerdere `specializations`.
- [ ] Ik heb op trainerdetail alle specialisaties en toegewezen `workouts` getoond.

### Zoeken en filteren
- [ ] Ik heb een zoekopdracht op workoutnaam toegevoegd.
- [ ] Ik heb een filter op moeilijkheidsgraad toegevoegd.

### Auth en autorisatie
- [ ] Als Breeze nog ontbreekt, doorloop ik eerst Hoofdstuk 4 - Authenticatie en Middleware (Laravel Breeze).
- [ ] Ik heb schrijfacties met auth middleware beveiligd.
- [ ] Ik heb gate beheer-`workouts` voor manager gebruikt.
- [ ] Ik heb gate beheer-reserveringen voor receptionist gebruikt.

## Plusopdrachten (extra)

- [ ] Ik heb voorkomen dubbele reservering voor hetzelfde lid en dezelfde workout op dezelfde datum.
- [ ] Ik heb een policy: trainer mag alleen eigen workout-details updaten gebruikt.
- [ ] Ik heb een extra filter op trainer toegevoegd.

## User stories 6B

### Gym manager
- [ ] Als manager wil ik `workouts` kunnen toevoegen zodat leden meer keuze hebben.
- [ ] Als manager wil ik `workouts` kunnen aanpassen of verwijderen zodat planning en aanbod kloppen.
- [ ] Als manager wil ik `equipment` aan `workouts` kunnen koppelen zodat leden weten wat nodig is.

### Receptionist
- [ ] Als receptionist wil ik leden kunnen inschrijven voor `workouts` zodat deelname wordt vastgelegd.
- [ ] Als receptionist wil ik reserveringsstatus kunnen aanpassen zodat de balie actuele informatie heeft.

### Personal trainer
- [ ] Als trainer wil ik mijn specialisaties kunnen beheren zodat de juiste lessen aan mij worden gekoppeld.

### Gym lid
- [ ] Als lid wil ik een reservering kunnen maken en annuleren zodat ik mijn planning beheer.

## Acceptatiecriteria

- [ ] Workout CRUD en `specializations` CRUD zijn afgerond.
- [ ] Rollen, gates en policies beperken acties correct.
- [ ] Validatie en flash messages werken in schrijf-flow.
