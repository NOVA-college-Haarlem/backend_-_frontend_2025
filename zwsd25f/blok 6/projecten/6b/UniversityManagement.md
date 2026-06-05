# Project 6: UniversityManagement (6B - CRUD uitbreiding)

## Introductie

Je bouwt verder op je 6A UniversityManagement-project. In 6B breid je uit met inschrijvingen, cijferregistratie en beheer van studenten/cursussen.

## 6B opdrachten

## Opdracht 1 - Student CRUD

1. Maak volledige CRUD voor students.
2. Valideer minimaal:
   - name required
   - student_number required unique
   - study required

## Opdracht 2 - Course CRUD

1. Maak volledige CRUD voor courses.
2. Koppel een docent aan elke cursus.
3. Valideer study points als integer min 1.

## Opdracht 3 - Enrollments beheren

1. Studieadviseur kan student inschrijven voor cursus.
2. Voorkom dubbele inschrijving van dezelfde student op dezelfde cursus.
3. Voeg status toe (active, dropped, completed) en update-flow.

## Opdracht 4 - Grades invoeren

1. Docent kan cijfers toevoegen en wijzigen voor eigen cursussen.
2. Valideer grade tussen 1.0 en 10.0.
3. Policy: docent mag alleen cijfers beheren van cursussen die aan hem/haar gekoppeld zijn.

## Opdracht 5 - Auth en autorisatie

1. Gebruik je nog geen Breeze? Werk dan eerst de les Hoofdstuk 4 - Authenticatie en Middleware (Laravel Breeze) door.
1. Beveilig beheeracties met auth middleware.
2. Gate: `beheer-cursussen` voor faculteits manager.
3. Gate: `beheer-inschrijvingen` voor studieadviseur.
4. Gebruik @can voor knoppen in views.

## 6B user stories

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

- Student CRUD en Course CRUD compleet.
- Enrollment-duplicaten worden voorkomen.
- Grade-beheer gebruikt policy op eigenaarschap van cursus.
