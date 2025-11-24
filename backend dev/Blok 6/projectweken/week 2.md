## Week 2 – Uitbreiding naar One-to-Many

Een mooie manier om beide projecten naar een one-to-many niveau te tillen is om één extra tabel toe te voegen die als “categoriserende” entiteit fungeert. Twee opties:

- `genres → shows`: elk genre heeft meerdere voorstellingen; een voorstelling hoort bij exact één genre.
- `rooms → bookings`: elk muzieklokaal kan meerdere reserveringen hebben; iedere reservering verwijst naar één lokaal.

Hieronder staat per project een concreet voorstel.

---

### Theater Voorstellingen Systeem

**Nieuwe tabel**
- `genres` met velden zoals `name` en optioneel `description`.
- Voeg `genre_id` toe aan `shows` (foreign key, required).

**Routes & views**
- Beheerpagina of eenvoudige dropdown om het genre te kiezen bij het aanmaken van een voorstelling.
- Homepagina kan filteren per genre of secties tonen waarin per genre de komende shows staan.

**Leerdoelen**
- Relaties definiëren (`Genre hasMany Show`, `Show belongsTo Genre`).
- Dropdowns vullen met Eloquent-data.
- Filtering op basis van een gerelateerde tabel.

---

### Muzieklokaal Reserveringssysteem

**Nieuwe tabel**
- `rooms` met velden zoals `number`, `floor`, `instrumentation`.
- Voeg `room_id` toe aan `bookings`; het oude `room_number` veld kan verdwijnen of computed blijven.

**Aanpassingen in flows**
- Reserveringsformulier toont alleen beschikbare lokalen via een dropdown.
- Overzichten kunnen per lokaal gefilterd of gegroepeerd worden.

**Extra leerdoelen**
- Relationele validatie (bestaat het gekozen lokaal?).
- Resource controllers voor `rooms` (optioneel CRUD).
- Eager loading inzetten om N+1-queries te voorkomen.