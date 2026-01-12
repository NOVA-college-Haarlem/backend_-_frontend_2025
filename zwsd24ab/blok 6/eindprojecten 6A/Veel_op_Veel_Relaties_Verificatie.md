# Veel-op-Veel Relaties Verificatie
## ZWSD24AB - Blok 6 Eindprojecten

Dit document controleert alle projecten op de aanwezigheid van veel-op-veel (many-to-many) relaties, zoals vereist in de projecteisen.

## Vereiste
Volgens de `requirements.md` moet elk project **minimaal één veel-op-veel relatie** bevatten met:
- Een pivot table (tussentabel)
- `belongsToMany` relaties in beide models
- De mogelijkheid om relaties te beheren (attach, detach, sync) in formulieren

---

## Project 1: Bibliotheek

### Status: ✅ VEEL-OP-VEEL RELATIE AANWEZIG

### Relaties Gevonden:
1. **Books ↔ Categories** (Veel-op-Veel)
   - **Documentatie**: 
     - "Een boek kan meerdere categorieën hebben" (regel 80)
     - "Een categorie kan meerdere boeken hebben" (regel 83)
   
   - **Implementatie Vereisten**:
     - Pivot table: `book_category` (book_id, category_id)
     - In Book model: `public function categories() { return $this->belongsToMany(Category::class); }`
     - In Category model: `public function books() { return $this->belongsToMany(Book::class); }`
     - In formulieren: Multi-select of checkboxes voor categorieën bij create/edit boek

### Conclusie
✅ **OK** - Project bevat een veel-op-veel relatie die correct geïmplementeerd kan worden.

---

## Project 2: ECommerceShop

### Status: ✅ MEERDERE VEEL-OP-VEEL RELATIES AANWEZIG

### Relaties Gevonden:
1. **Products ↔ Categories** (Veel-op-Veel)
   - **Documentatie**: 
     - "Een product kan meerdere categorieën hebben" (regel 91)
     - "Een categorie kan meerdere producten hebben" (regel 97)
   
   - **Implementatie Vereisten**:
     - Pivot table: `category_product` (category_id, product_id)
     - In Product model: `public function categories() { return $this->belongsToMany(Category::class); }`
     - In Category model: `public function products() { return $this->belongsToMany(Product::class); }`

2. **Products ↔ Orders** (Veel-op-Veel)
   - **Documentatie**: 
     - "Een product kan in meerdere bestellingen zitten" (regel 94)
     - "Een bestelling kan meerdere producten bevatten" (regel 101)
   
   - **Implementatie Vereisten**:
     - Pivot table: `order_product` (order_id, product_id, aantal, prijs)
     - Extra kolommen in pivot: `aantal`, `prijs` (voor hoeveelheid en prijs per item)
     - In Product model: `public function orders() { return $this->belongsToMany(Order::class)->withPivot('aantal', 'prijs'); }`
     - In Order model: `public function products() { return $this->belongsToMany(Product::class)->withPivot('aantal', 'prijs'); }`

### Conclusie
✅ **OK** - Project bevat meerdere veel-op-veel relaties. Dit project voldoet ruimschoots aan de eisen.

---

## Project 3: EventManagement

### Status: ✅ VEEL-OP-VEEL RELATIE AANWEZIG

### Relaties Gevonden:
1. **Events ↔ Categories** (Veel-op-Veel)
   - **Documentatie**: 
     - "Een event kan meerdere categorieën hebben" (regel 90)
     - "Een categorie kan meerdere events hebben" (regel 97)
   
   - **Implementatie Vereisten**:
     - Pivot table: `category_event` (category_id, event_id)
     - In Event model: `public function categories() { return $this->belongsToMany(Category::class); }`
     - In Category model: `public function events() { return $this->belongsToMany(Event::class); }`

### Conclusie
✅ **OK** - Project bevat een veel-op-veel relatie die correct geïmplementeerd kan worden.

---

## Project 4: HotelManagement

### Status: ✅ VEEL-OP-VEEL RELATIE AANWEZIG

### Relaties Gevonden:
1. **Reservations ↔ Services** (Veel-op-Veel)
   - **Documentatie**: 
     - "Een reservering kan meerdere diensten bevatten" (regel 99)
     - "Een dienst kan aan meerdere reserveringen gekoppeld zijn" (regel 102)
   
   - **Implementatie Vereisten**:
     - Pivot table: `reservation_service` (reservation_id, service_id)
     - In Reservation model: `public function services() { return $this->belongsToMany(Service::class); }`
     - In Service model: `public function reservations() { return $this->belongsToMany(Reservation::class); }`
     - In formulieren: Multi-select of checkboxes voor diensten bij reservering

### Conclusie
✅ **OK** - Project bevat een veel-op-veel relatie die correct geïmplementeerd kan worden.

---

## Project 6: UniversityManagement

### Status: ⚠️ GEEN EXPLICIETE VEEL-OP-VEEL RELATIE GEVONDEN

### Relaties Geanalyseerd:
- **Students ↔ Courses**: Dit gaat via de `enrollments` tabel, wat een one-to-many relatie lijkt te zijn (een enrollment heeft één student en één course)
- **Teachers ↔ Courses**: "Een docent kan meerdere cursussen geven" - dit suggereert een one-to-many (een cursus heeft één docent volgens regel 99)

### Mogelijke Oplossingen:
1. **Studenten ↔ Cursussen als Veel-op-Veel**:
   - Als een student meerdere cursussen kan volgen EN een cursus door meerdere studenten gevolgd wordt
   - Dit is al het geval via `enrollments`, maar kan herstructureerd worden
   - **Aanbeveling**: Behoud `enrollments` als tussenmodel (want het heeft extra data zoals datum en status), maar voeg expliciete `belongsToMany` relatie toe:
     ```php
     // In Student model
     public function courses() {
         return $this->belongsToMany(Course::class, 'enrollments');
     }
     
     // In Course model
     public function students() {
         return $this->belongsToMany(Student::class, 'enrollments');
     }
     ```

2. **Docenten ↔ Cursussen als Veel-op-Veel**:
   - Als een cursus meerdere docenten kan hebben (team teaching)
   - **Nieuwe pivot table**: `course_teacher` (course_id, teacher_id)
   - Wijzig regel 99 in het projectdocument: "Een cursus kan meerdere docenten hebben" in plaats van "Een cursus heeft één docent"

3. **Studenten ↔ Faculteiten als Veel-op-Veel**:
   - Als studenten bij meerdere faculteiten kunnen studeren
   - **Nieuwe pivot table**: `faculty_student` (faculty_id, student_id)

### Aanbeveling voor UniversityManagement:
**Optie 1** is het minst invasief: gebruik de bestaande `enrollments` tabel als pivot table en voeg `belongsToMany` relaties toe. Dit is technisch correct omdat `enrollments` al functioneert als een tussenmodel.

### Conclusie
⚠️ **AANDACHT NODIG** - Project bevat geen expliciete veel-op-veel relatie in de documentatie, maar kan er één maken door de `enrollments` tabel als pivot te gebruiken, of door een nieuwe relatie toe te voegen.

---

## Project 7: ZiekenhuisManagement

### Status: ⚠️ GEEN EXPLICIETE VEEL-OP-VEEL RELATIE GEVONDEN

### Relaties Geanalyseerd:
- **Patients ↔ Doctors**: Dit gaat via `appointments` - one-to-many (een afspraak heeft één patiënt en één dokter)
- **Patients ↔ Departments**: Indirect via doctors
- **Doctors ↔ Departments**: One-to-many (een dokter heeft één afdeling volgens regel 93)

### Mogelijke Oplossingen:
1. **Patiënten ↔ Afdelingen als Veel-op-Veel**:
   - Als een patiënt behandeld kan worden door meerdere afdelingen
   - **Nieuwe pivot table**: `department_patient` (department_id, patient_id)
   - Met extra velden: `datum`, `reden`

2. **Dokters ↔ Afdelingen als Veel-op-Veel**:
   - Als een dokter bij meerdere afdelingen kan werken
   - **Nieuwe pivot table**: `department_doctor` (department_id, doctor_id)
   - Wijzig regel 93: "Een dokter kan bij meerdere afdelingen werken"

3. **Patiënten ↔ Behandelingen als Veel-op-Veel**:
   - Als patiënten meerdere behandelingen kunnen ondergaan
   - **Nieuwe tabel**: `treatments` (naam, beschrijving)
   - **Pivot table**: `patient_treatment` (patient_id, treatment_id, datum, status)

4. **Appointments ↔ Medical Notes als Veel-op-Veel**:
   - Als een afspraak meerdere notities kan hebben of een notitie bij meerdere afspraken hoort
   - Dit is waarschijnlijk niet logisch

### Aanbeveling voor ZiekenhuisManagement:
**Optie 2** is het meest logisch en minst invasief: Laat dokters bij meerdere afdelingen werken. Dit is realistisch (dokters kunnen bij verschillende afdelingen ingeroosterd worden) en vereist alleen het toevoegen van een pivot table.

### Conclusie
⚠️ **AANDACHT NODIG** - Project bevat geen expliciete veel-op-veel relatie in de documentatie. Een veel-op-veel relatie moet toegevoegd worden. **Aanbeveling**: Maak `doctors ↔ departments` een veel-op-veel relatie (dokters kunnen bij meerdere afdelingen werken).

---

## Samenvatting

| Project              | Status     | Veel-op-Veel Relatie(s)                  | Actie Vereist                                     |
| -------------------- | ---------- | ---------------------------------------- | ------------------------------------------------- |
| Bibliotheek          | ✅ OK       | Books ↔ Categories                       | Geen actie                                        |
| ECommerceShop        | ✅ OK       | Products ↔ Categories, Products ↔ Orders | Geen actie                                        |
| EventManagement      | ✅ OK       | Events ↔ Categories                      | Geen actie                                        |
| HotelManagement      | ✅ OK       | Reservations ↔ Services                  | Geen actie                                        |
| UniversityManagement | ⚠️ Aandacht | Geen expliciet                           | Gebruik enrollments als pivot OF voeg relatie toe |
| ZiekenhuisManagement | ⚠️ Aandacht | Geen expliciet                           | **Moet veel-op-veel relatie toevoegen**           |

## Aanbevelingen

1. **UniversityManagement**: Bespreek met de groep hoe ze de veel-op-veel relatie willen implementeren. De beste optie is om `enrollments` als pivot te gebruiken.

2. **ZiekenhuisManagement**: **BELANGRIJK** - Dit project moet een veel-op-veel relatie toevoegen. Aanbeveling: `doctors ↔ departments` als veel-op-veel, zodat dokters bij meerdere afdelingen kunnen werken.

3. **Controle**: Tijdens Dag 1 review moet expliciet gecontroleerd worden of elk project een veel-op-veel relatie heeft geïdentificeerd.

4. **Documentatie**: Hoewel de projectdocumenten niet aangepast worden, moet tijdens de reviews duidelijk gemaakt worden welke veel-op-veel relatie geïmplementeerd moet worden.

