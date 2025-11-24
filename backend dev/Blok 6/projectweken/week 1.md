## Week 1 – Startprojecten

We beginnen met twee eenvoudige projecten (één tabel per app) zodat studenten de basisonderdelen van Laravel snel onder de knie krijgen.

---

### Project 1 – Theater Voorstellingen

**Concept**  
Een lokaal theater wil aankomende voorstellingen beheren in een klein CMS.

**Functies**
- Homepagina met alle aankomende voorstellingen
- Formulier om een voorstelling toe te voegen
- Detailpagina per voorstelling

**Database (`shows` tabel)**
- `title` (string)
- `description` (text)
- `performance_date` (date)
- `ticket_price` (decimal)
- `available_seats` (integer)

**Routes**
- `GET /` – homepagina
- `GET /shows/create` – formulier nieuwe voorstelling
- `POST /shows` – voorstelling opslaan
- `GET /shows/{id}` – detailpagina

**Leerdoelen**
- Basis routing en controllers
- Formulieren met CSRF-bescherming en validatie
- Blade + Tailwind voor eenvoudige UI
- Migraties en Eloquent-basics

---

### Project 2 – Muzieklokaal Reserveringen

**Concept**  
Leerlingen reserveren oefenruimtes via een simpele planner.

**Functies**
- Homepagina toont reserveringen van vandaag
- Formulier voor nieuwe reservering
- Overzicht van alle toekomstige reserveringen

**Database (`bookings` tabel)**
- `student_name` (string)
- `room_number` (string)
- `instrument` (string)
- `booking_date` (date)
- `time_slot` (string, bijv. “14:00 - 15:00”)

**Routes**
- `GET /` – reserveringen van vandaag
- `GET /bookings/create` – formulier
- `POST /bookings` – reservering opslaan
- `GET /bookings` – overzicht alle reserveringen

**Leerdoelen (extra t.o.v. project 1)**
- Werken met datums en filters (vandaag vs. alles)
- Dropdowns voor lokalen/tijdsloten

---

### Waarom deze projecten?
- Eén-tabel ontwerp zonder complexe relaties
- Context spreekt studenten aan en geeft snelle feedback
- Makkelijk uit te breiden met edit/delete, zoekfuncties, auth
- Goede Tailwind-oefening met formulieren, cards en lijsten

---

### Globale planning
- **Week 1**: Laravel installeren, migratie maken, homepagina bouwen
- **Week 2**: Formulier view met Tailwind
- **Week 3**: `store`-methode + validatie
- **Week 4**: Detailpagina en UI-polish