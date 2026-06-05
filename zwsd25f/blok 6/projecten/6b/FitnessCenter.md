# Project 4: FitnessCenter (6B - CRUD uitbreiding)

## Introductie

Je bouwt verder op je 6A FitnessCenter-project. In 6B voeg je beheerfunctionaliteit toe voor workouts, reserveringen en trainerplanning.

## 6B opdrachten

## Opdracht 1 - Workout CRUD

1. Maak volledige CRUD voor workouts.
2. Valideer minimaal:
   - name required
   - duration required integer min 5
   - difficulty required in:beginner,intermediate,advanced
   - trainer_id required exists
3. Koppel equipment via many-to-many en beheer dit in create/edit.

## Opdracht 2 - Reserveringen beheren

1. Maak create/store voor reservations door leden.
2. Receptionist kan reservering status bijwerken (booked, canceled, attended).
3. Voorkom dubbele reservering voor hetzelfde lid + workout op dezelfde datum.

## Opdracht 3 - Trainer en specialisaties

1. Maak CRUD voor specializations.
2. Koppel trainers aan meerdere specializations.
3. Toon op trainer detail alle specialisaties en toegewezen workouts.

## Opdracht 4 - Auth en autorisatie

1. Gebruik je nog geen Breeze? Werk dan eerst de les Hoofdstuk 4 - Authenticatie en Middleware (Laravel Breeze) door.
1. Schrijfacties alleen voor ingelogde gebruikers.
2. Gate: `beheer-workouts` voor manager.
3. Gate: `beheer-reserveringen` voor receptionist.
4. Policy: trainer mag alleen eigen workout-details updaten (niet verwijderen).

## 6B user stories

### Gym manager
- [ ] Als manager wil ik workouts kunnen toevoegen zodat leden meer keuze hebben.
- [ ] Als manager wil ik workouts kunnen aanpassen of verwijderen zodat planning en aanbod kloppen.
- [ ] Als manager wil ik equipment aan workouts kunnen koppelen zodat leden weten wat nodig is.

### Receptionist
- [ ] Als receptionist wil ik leden kunnen inschrijven voor workouts zodat deelname wordt vastgelegd.
- [ ] Als receptionist wil ik reserveringsstatus kunnen aanpassen zodat de balie actuele informatie heeft.

### Personal trainer
- [ ] Als trainer wil ik mijn specialisaties kunnen beheren zodat de juiste lessen aan mij worden gekoppeld.

### Gym lid
- [ ] Als lid wil ik een reservering kunnen maken en annuleren zodat ik mijn planning beheer.

## Acceptatiecriteria

- Workout CRUD en specializations CRUD zijn afgerond.
- Reserveringsregels voorkomen dubbele boekingen.
- Rollen/gates/policies beperken acties correct.
