# Week 8 - Eindproject: Complete Responsive Form Application

**Doel van deze week:** Bouw een complete responsive form applicatie die ALLE technieken van Blok 4 combineert.

---

## Leerdoelen

Na deze week kun je:
- ✅ Een complete multi-page/multi-step form applicatie bouwen
- ✅ Alle input types professioneel stylen en valideren
- ✅ Een volledig responsive ontwerp maken (mobile → tablet → desktop)
- ✅ Touch-friendly interfaces implementeren
- ✅ Hamburger menu integreren voor navigatie
- ✅ Progress indicators toevoegen
- ✅ Toegankelijke formulieren maken
- ✅ Een professioneel eindproduct opleveren

---

## Project Opties

Kies **één** van de volgende projecten:

---

## Optie 1: Hotel/Vakantie Booking Systeem

**Scenario:** Complete booking flow voor hotel of vakantie accommodatie.

### Stap 1: Reservering Details (Page 1)
**Vereisten:**
- Check-in datum (date, required, min=today)
- Check-out datum (date, required, min=check-in+1)
- Aantal gasten (number, required, min 1, max 10)
  - Volwassenen (select dropdown 1-8)
  - Kinderen (select dropdown 0-4)
- Kamer type (radio buttons - custom styled):
  - Standard Room - €89/nacht
  - Deluxe Room - €129/nacht
  - Suite - €199/nacht
  - Family Room - €149/nacht
- Aantal kamers (number, min 1, max 5)

**Layout:**
- Mobile: Stack verticaal
- Tablet/Desktop: Form rows (2 kolommen)

---

### Stap 2: Extra's & Voorkeuren (Page 2)
**Vereisten:**
- **Extra Services** (checkboxes - custom styled):
  - Ontbijt (+€15/persoon/nacht)
  - Parkeren (+€10/nacht)
  - WiFi (gratis)
  - Airport transfer (+€25)
  - Late check-out (+€20)
  - Babysit service (+€30/uur)

- **Bed Type** (radio buttons):
  - 1 Kingsize bed
  - 2 Single beds
  - Twin beds

- **View Preference** (select):
  - Geen voorkeur
  - Zeezicht (+€20/nacht)
  - Tuinzicht (+€10/nacht)
  - Stadszicht

- **Speciale Verzoeken** (textarea, optional, max 500 chars met counter)

**Layout:**
- Mobile: Single column
- Desktop: Checkboxes in 2-3 columns grid

---

### Stap 3: Persoonlijke Informatie (Page 3)
**Vereisten:**
- Voornaam (text, required, min 2)
- Achternaam (text, required, min 2)
- Email (email, required)
- Telefoon (tel, required, inputmode="tel", pattern)
- Land (select met optgroups voor continenten, 15+ landen)
- Postcode (text, required)
- Straat + huisnummer (text, required)
- Stad (text, required)
- **Arrival Time** (select):
  - Voor 14:00
  - 14:00 - 16:00
  - 16:00 - 18:00
  - Na 18:00

**Layout:**
- Mobile: Stack
- Desktop: Naam in form row (2 cols), adres velden smart grouping

---

### Stap 4: Betaling (Page 4)
**Vereisten:**
- **Betaalmethode** (radio buttons - card style):
  - Creditcard (Visa/Mastercard)
  - iDEAL
  - PayPal
  - Bank Transfer

- **Creditcard details** (alleen tonen als creditcard geselecteerd):
  - Kaart nummer (text, inputmode="numeric", pattern [0-9]{16})
  - Naam op kaart (text, required)
  - Vervaldatum (date, required)
  - CVV (text, inputmode="numeric", maxlength 3, pattern [0-9]{3})

- **Akkoord:**
  - Algemene voorwaarden (checkbox, required)
  - Privacy beleid (checkbox, required)
  - Nieuwsbrief (checkbox, optional)

**Security note:** "Dit is een demo. Voer geen echte creditcard gegevens in."

---

### Stap 5: Overzicht & Bevestiging (Page 5)
**Vereisten:**
- Samenvatting van alle ingevoerde gegevens:
  - Reservering details
  - Gekozen kamer en extras
  - Persoonlijke informatie
  - Betaalmethode
  - **Totaalprijs berekening**

- Edit buttons (ga terug naar specifieke stap)
- **Bevestig Boeking** button (groot, prominent)

---

## Optie 2: Online Course Enrollment Platform

**Scenario:** Inschrijven voor online cursussen met meerdere stappen.

### Stap 1: Account Aanmaken
- Gebruikersnaam (text, required, min 3, max 20)
- Email (email, required)
- Wachtwoord (password, required, min 8, pattern: letters+numbers)
- Bevestig wachtwoord (password, moet matchen)
- Geboortedatum (date, required, min leeftijd 16)
- Land (select, 20+ landen)

### Stap 2: Cursus Selectie
- **Niveau** (radio buttons):
  - Beginner
  - Intermediate
  - Advanced
  - Expert

- **Cursussen** (checkboxes, min 1, max 5):
  - HTML & CSS Fundamentals (€199)
  - JavaScript Mastery (€299)
  - React Development (€349)
  - Node.js Backend (€329)
  - Python Programming (€279)
  - Database Design (€249)
  - DevOps Essentials (€299)
  - UI/UX Design (€269)

- **Leervoorkeur** (select):
  - Video lessen
  - Live webinars
  - Geschreven content
  - Mixed (alles)

- **Studieschema** (radio buttons):
  - Part-time (5-10 uur/week)
  - Full-time (20-40 uur/week)
  - Flexibel (eigen tempo)

### Stap 3: Achtergrond & Goals
- Huidige beroep (text, optional)
- Programmeerervaring (textarea, optional, max 300)
- Leerdoelen (textarea, required, min 50, max 500)
- **Hoe heb je van ons gehoord?** (select):
  - Social Media
  - Google Search
  - Vriend/Collega
  - Email
  - Online advertentie
  - Anders

### Stap 4: Betaling & Bevestiging
- Betaalmethode (radio buttons)
- Creditcard velden (conditional)
- Algemene voorwaarden (checkbox, required)
- Nieuwsbrief (checkbox, optional)
- Overzicht geselecteerde cursussen
- Totaalprijs
- **Inschrijven** button

---

## Optie 3: Job Application Wizard

**Scenario:** Uitgebreide sollicitatie flow voor tech bedrijf.

### Stap 1: Persoonlijke Informatie
- Volledige naam, email, telefoon
- LinkedIn, Portfolio/Website
- Woonplaats, Land
- Beschikbaarheid (radio: direct, 1 maand, 2 maanden, 3+ maanden)

### Stap 2: Functie Details
- Sollicitatie voor functie (select, 10+ functies)
- Ervaring level (radio: Junior, Medior, Senior)
- Werkvoorkeur (radio: Kantoor, Hybride, Remote)
- Gewenst salaris (number, optional, range)
- Gewenste werkdagen (checkboxes: Ma-Vr)

### Stap 3: Skills & Ervaring
- Programmeertalen (checkboxes, 8+ opties)
- Frameworks (checkboxes, 6+ opties)
- Tools (checkboxes, 6+ opties)
- Jaren ervaring (number, 0-50)
- Hoogste opleiding (select)
- Certificaten (textarea, optional)

### Stap 4: Motivatie & Uploads
- Waarom deze functie? (textarea, required, min 50, max 1000)
- Sterke punten (textarea, required, min 30, max 500)
- CV upload (file input, .pdf/.doc/.docx)
- Motivatiebrief upload (file input, optional)

### Stap 5: Referenties & Bevestiging
- Referentie 1 & 2 (naam, email, telefoon, relatie)
- Akkoord privacy & voorwaarden
- Mag gecontacteerd voor andere functies
- Overzicht + Submit

---

## Technische Vereisten (ALLE Opties)

### HTML (30 punten)
- [ ] Correcte formulier structuur voor elke stap
- [ ] Alle labels correct gekoppeld (for/id)
- [ ] Juiste input types (email, tel, date, number, etc.)
- [ ] Validatie attributes (required, pattern, min, max, minlength, maxlength)
- [ ] inputmode waar van toepassing (numeric, tel, email)
- [ ] Fieldsets en legends voor groepen
- [ ] Viewport meta tag
- [ ] Semantische HTML

### CSS - Formulieren (35 punten)
- [ ] **Custom styled inputs:**
  - Radio buttons (custom circles, ::after dot)
  - Checkboxes (custom squares, vinkje)
  - Select dropdowns (custom arrow)
  - Text inputs (focus states)
  - Textarea (resize: vertical)
  - Buttons (hover, active, disabled states)

- [ ] **Validatie feedback:**
  - :valid state (groen)
  - :invalid state (rood)
  - Error messages (alleen bij invalid)
  - Icons bij valid/invalid (optioneel)

- [ ] **Layout:**
  - Mobile-first approach
  - Flexbox voor layouts
  - Form rows (multi-column op desktop)

### CSS - Responsive (25 punten)
- [ ] **Mobile (< 768px):**
  - Single column layout
  - Full-width inputs en buttons
  - Labels boven inputs
  - Font-size minimaal 16px
  - Touch-friendly (min 48px touch targets)
  - Padding 20-25px

- [ ] **Tablet (768px - 1023px):**
  - 2-column form rows waar logisch
  - Buttons naast elkaar
  - Padding 40px
  - Checkboxes/radios 2 columns grid

- [ ] **Desktop (>= 1024px):**
  - Max-width 900px, gecentreerd
  - 3-column grids voor checkboxes
  - Optional: labels naast inputs (inline)
  - Padding 60px
  - Hover effects

### Navigation & UI (10 punten)
- [ ] **Hamburger menu** (mobile):
  - Werkend met JavaScript
  - Smooth animatie
  - Close bij klik op link

- [ ] **Progress Indicator:**
  - Stap 1/5, 2/5, etc.
  - Visual progress bar of steps
  - Current step highlighted

- [ ] **Navigation buttons:**
  - "Volgende" button (submit naar volgende stap)
  - "Vorige" button (ga terug, behoud data)
  - Disabled tenzij form valid

### Bonus Features (+20 punten)
- [ ] JavaScript validatie (real-time feedback) (+5)
- [ ] Character counter die echt werkt (+3)
- [ ] Totaalprijs berekening (+5)
- [ ] LocalStorage (behoud data bij refresh) (+5)
- [ ] Smooth page transitions (+3)
- [ ] Dark mode toggle (+4)
- [ ] Print stylesheet voor overzicht page (+3)

---

## Multi-Step Form Implementatie

### Optie A: Multi-Page (Meerdere HTML bestanden)
```
step1.html → step2.html → step3.html → review.html → success.html
```

**Voordelen:** Simpeler, geen JavaScript nodig
**Nadelen:** Data niet behouden (tenzij LocalStorage)

### Optie B: Single Page (Display none/block)
```html
<div id="step1" class="step active">...</div>
<div id="step2" class="step">...</div>
<div id="step3" class="step">...</div>
```

**Voordelen:** Data behouden, betere UX
**Nadelen:** Meer JavaScript nodig

### Basis JavaScript voor Single Page:
```javascript
const steps = document.querySelectorAll('.step');
let currentStep = 0;

function showStep(n) {
    steps.forEach((step, index) => {
        step.style.display = index === n ? 'block' : 'none';
    });
    updateProgress(n);
}

function nextStep() {
    if (currentStep < steps.length - 1) {
        currentStep++;
        showStep(currentStep);
    }
}

function prevStep() {
    if (currentStep > 0) {
        currentStep--;
        showStep(currentStep);
    }
}

// Initialize
showStep(0);
```

---

## Progress Indicator Voorbeelden

### Optie 1: Simpele Text Counter
```html
<div class="progress-text">
    Stap <span id="current-step">1</span> van 5
</div>
```

### Optie 2: Progress Bar
```html
<div class="progress-bar">
    <div class="progress-fill" style="width: 20%"></div>
</div>
<p class="progress-text">Stap 1 van 5</p>
```

```css
.progress-bar {
    width: 100%;
    height: 8px;
    background: #e0e0e0;
    border-radius: 10px;
    margin-bottom: 30px;
}

.progress-fill {
    height: 100%;
    background: linear-gradient(90deg, #667eea, #764ba2);
    border-radius: 10px;
    transition: width 0.3s;
}
```

### Optie 3: Step Indicators (Advanced)
```html
<div class="step-indicators">
    <div class="step-indicator active">
        <div class="step-circle">1</div>
        <div class="step-label">Details</div>
    </div>
    <div class="step-indicator">
        <div class="step-circle">2</div>
        <div class="step-label">Voorkeuren</div>
    </div>
    <div class="step-indicator">
        <div class="step-circle">3</div>
        <div class="step-label">Persoonlijk</div>
    </div>
    <!-- etc -->
</div>
```

---

## Projectstructuur

```
eindproject/
│
├── index.html (of step1.html)
├── step2.html (indien multi-page)
├── step3.html
├── review.html
├── success.html
│
├── css/
│   ├── style.css (main styles)
│   └── responsive.css (optional, apart)
│
├── js/
│   └── app.js (form logic, navigation)
│
└── README.md (project beschrijving)
```

---

## Stapsgewijs Uitvoeringsplan

### Week Indeling (5 werkdagen):

#### Dag 1: Planning & HTML Structuur
- [ ] Kies project optie
- [ ] Schets wireframes (mobile & desktop)
- [ ] Maak HTML voor alle stappen
- [ ] Voeg validatie attributes toe
- [ ] Test basis form submit

#### Dag 2: CSS - Formulier Styling
- [ ] Custom radio buttons
- [ ] Custom checkboxes
- [ ] Select styling
- [ ] Input styling (focus, valid, invalid)
- [ ] Button styling (states)
- [ ] Error messages

#### Dag 3: CSS - Responsive Layout
- [ ] Mobile styles (< 768px)
- [ ] Tablet styles (768px - 1023px)
- [ ] Desktop styles (>= 1024px)
- [ ] Hamburger menu (HTML + CSS)
- [ ] Progress indicator
- [ ] Test op alle breakpoints

#### Dag 4: JavaScript & Interactiviteit
- [ ] Hamburger menu toggle
- [ ] Multi-step navigation (next/prev buttons)
- [ ] Progress indicator updaten
- [ ] Form validatie (optioneel)
- [ ] Character counters (optioneel)
- [ ] Totaalprijs berekening (optioneel)

#### Dag 5: Polish & Testing
- [ ] Final design polish (spacing, colors, transitions)
- [ ] Test op verschillende schermformaten
- [ ] Test alle formulier functionaliteit
- [ ] Test validatie op alle velden
- [ ] Test hamburger menu
- [ ] Test keyboard navigatie
- [ ] Bug fixes
- [ ] README schrijven
- [ ] Code cleanup (comments, formatting)

---

## Beoordelingscriteria (Totaal 120 punten)

### HTML Structuur (30 punten)
- Correcte formulier opbouw (10)
- Labels en inputs correct (8)
- Validatie attributes (7)
- Semantische HTML (5)

### CSS - Formulieren (35 punten)
- Custom inputs (radio, checkbox, select) (15)
- Validatie feedback (8)
- Button states (6)
- Layout & spacing (6)

### CSS - Responsive (25 punten)
- Mobile styling (10)
- Tablet styling (7)
- Desktop styling (8)

### Navigation & UX (10 punten)
- Hamburger menu (5)
- Progress indicator (3)
- Navigation buttons (2)

### Accessibility (10 punten)
- Keyboard navigatie (4)
- Screen reader friendly (3)
- Focus states (3)

### Code Quality (10 punten)
- Nette code (4)
- Comments (3)
- File organisatie (3)

**Bonus:** Tot 20 extra punten voor bonus features

**Totaal mogelijk: 140 punten**

**Cijfer berekening:**
- 120+ = 10
- 108-119 = 9
- 96-107 = 8
- 84-95 = 7
- 72-83 = 6
- < 72 = 5 of lager

---

## Inspiratie & Voorbeelden

### Bekijk deze websites:
- **Booking.com** - Hotel booking flow (stappen, progress)
- **Airbnb** - Listing creation (multi-step forms)
- **Typeform** - Mooie form designs en transitions
- **LinkedIn** - Job application forms
- **Udemy** - Course enrollment
- **Stripe** - Payment forms (creditcard styling)

### Let op:
- Hoe tonen ze progress?
- Waar staan navigation buttons?
- Hoe communiceren ze errors?
- Welke kleuren gebruiken ze?
- Hoe werkt het op mobile vs desktop?

---

## Tips voor Succes

### DO's:
- ✅ **Plan eerst:** Schets wireframes voor mobile EN desktop
- ✅ **Start simpel:** Maak eerst HTML working, dan style
- ✅ **Mobile-first:** Begin met mobile CSS
- ✅ **Test vaak:** Check regelmatig op verschillende schermen
- ✅ **Incrementeel:** Bouw stap voor stap, test tussentijds
- ✅ **Vraag feedback:** Laat medestudenten testen
- ✅ **Version control:** Gebruik Git voor backup (optioneel)

### DON'Ts:
- ❌ Te ambitieus (focus op vereisten eerst, dan bonussen)
- ❌ Desktop-first approach (meer werk)
- ❌ Alles tegelijk (stap voor stap werken!)
- ❌ Geen tussentijdse tests (bugs stapelen op)
- ❌ Copy-paste zonder begrip
- ❌ Laatste moment beginnen (te veel werk!)

---

## Veelvoorkomende Problemen & Oplossingen

### Probleem 1: Data kwijt tussen stappen
**Oplossing:** Gebruik LocalStorage of hidden inputs in form

### Probleem 2: Validatie werkt niet over stappen heen
**Oplossing:** Valideer elke stap apart voor "Next" button

### Probleem 3: Layout breekt op kleine mobile
**Oplossing:** Test op 320px (iPhone SE), gebruik min-width

### Probleem 4: Hamburger menu blijft open
**Oplossing:** Close menu bij klik op link + bij outside click

### Probleem 5: Buttons te klein op mobile
**Oplossing:** min-height 48px, padding 16px

---

## Inleveren

### Checklist:
- [ ] Alle HTML bestanden
- [ ] CSS bestand(en)
- [ ] JavaScript bestand (indien gebruikt)
- [ ] README.md met:
  - Project beschrijving
  - Gekozen optie
  - Features lijst
  - Installatie instructies (hoe te openen)
  - Gebruikte technieken
  - Bekende bugs (indien van toepassing)
  - Bronnen/inspiratie

### ZIP bestand structuur:
```
VoornaamAchternaam_Blok4_Eindproject.zip
├── index.html
├── step2.html
├── ...
├── css/
├── js/
└── README.md
```

### Of: GitHub Repository (Bonus +5)
- Maak repository
- Push project
- Lever GitHub URL in
- Ensure README is compleet

---

## Na Blok 4: Wat heb je geleerd?

### Formulieren (Week 1-4):
✅ Alle input types (text, email, radio, checkbox, select, textarea)
✅ Custom styling (radio, checkbox, select)
✅ HTML5 validatie (required, pattern, min, max)
✅ Error en success feedback
✅ Button states (hover, active, disabled)
✅ Form layouts met Flexbox

### Responsive Development (Week 5-7):
✅ Media queries en breakpoints
✅ Mobile-first vs desktop-first
✅ Responsive units (rem, %, vw, vh)
✅ Hamburger menu
✅ Touch-friendly design (44px+)
✅ Mobile typography (16px+)
✅ Responsive formulieren

### Skills:
✅ **Frontend Development:** HTML, CSS, basis JavaScript
✅ **Responsive Design:** Mobile, tablet, desktop
✅ **UX Design:** Touch-friendly, accessible interfaces
✅ **Form Design:** Professionele formulieren bouwen
✅ **Problem Solving:** Debugging en troubleshooting
✅ **Project Management:** Planning en uitvoering

---

## Volgende Stap: Backend Dev

**Je bent nu klaar voor Backend Dev (PHP)!**

In Backend Dev ga je leren:
- Formulier data ontvangen ($_POST, $_GET)
- Server-side validatie
- Database opslag (MySQL)
- User authentication
- Sessions en cookies
- File uploads
- Email verzenden

**Je frontend formulieren zijn al klaar voor backend integratie!** 🎉

---

## Afsluiting

Dit is je moment om te laten zien wat je geleerd hebt. Je hebt 7 weken hard gewerkt en alle tools om iets geweldigs te maken.

**Belangrijkste tip:** Geniet van het proces! Maak iets waar je trots op bent.

**Veel succes met je eindproject! Je gaat het geweldig doen. 🚀✨**

---

**Vragen? Twijfels? Problemen?**
- Bespreek met medestudenten
- Vraag docent om feedback
- Google is je vriend (MDN Docs, CSS-Tricks, Stack Overflow)
- Test, test, test!

**You got this! 💪**
