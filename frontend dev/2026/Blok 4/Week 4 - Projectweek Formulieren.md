# Week 4 - Projectweek: Complete Formulier Applicatie

**Doel van deze week:** Pas alle geleerde technieken toe in een professioneel formulier project.

---

## Leerdoelen

Na deze week kun je:
- ✅ Een complete formulier applicatie maken met alle input types
- ✅ Validatie toepassen op alle velden
- ✅ Custom styling voor radio buttons, checkboxes en select
- ✅ Error en success feedback implementeren
- ✅ Een professionele layout maken met Flexbox
- ✅ Toegankelijke formulieren bouwen
- ✅ Code netjes organiseren en documenteren

---

## Project Opties

Kies **één** van de volgende projecten:

---

## Optie 1: Event Registratie Formulier

**Scenario:** Een formulier voor het registreren bij een tech conference/evenement.

### Vereisten:

#### 1. Persoonlijke Informatie
- Voornaam (text, required, min 2 chars)
- Achternaam (text, required, min 2 chars)
- Email (email, required)
- Telefoon (tel, optional, pattern 06-12345678)
- Bedrijf/Organisatie (text, optional)

#### 2. Event Voorkeuren
- **Ticket Type** (radio buttons - custom styled):
  - Early Bird - €99
  - Regular - €149
  - VIP - €299
  - Student - €49 (met studentennummer veld)
- **Workshop Selectie** (checkboxes - custom styled, minimaal 3):
  - Frontend Development
  - Backend Development
  - UI/UX Design
  - DevOps
  - Mobile Development
  - AI/Machine Learning
- **T-shirt Maat** (select dropdown):
  - XS, S, M, L, XL, XXL
- **Dieet voorkeuren** (checkboxes):
  - Vegetarisch
  - Veganistisch
  - Glutenvrij
  - Lactosevrij
  - Geen

#### 3. Extra Informatie
- Speciale verzoeken (textarea, optional, max 500 chars met counter)
- **Hoe heb je van ons gehoord?** (select):
  - Social Media
  - Google
  - Vriend/Collega
  - Email
  - Anders

#### 4. Akkoord
- Privacy verklaring (checkbox, required)
- Nieuwsbrief ontvangen (checkbox, optional)

#### 5. Buttons
- Reset formulier
- Registreer (submit)

---

## Optie 2: Online Cursus Aanmelding

**Scenario:** Aanmelden voor online programmeercursussen.

### Vereisten:

#### 1. Account Informatie
- Gewenste gebruikersnaam (text, required, min 3 chars)
- Email (email, required)
- Wachtwoord (password, required, min 8 chars)
- Bevestig wachtwoord (password, required, min 8 chars)
- Geboortedatum (date, required, min 16 jaar)

#### 2. Cursus Selectie
- **Programmeerniveau** (radio buttons - custom styled):
  - Beginner (nooit geprogrammeerd)
  - Basis (1-2 jaar ervaring)
  - Gevorderd (3+ jaar ervaring)
- **Cursussen** (checkboxes - custom styled, minimaal 4):
  - HTML & CSS Fundamentals
  - JavaScript Mastery
  - React Development
  - Node.js Backend
  - Python Programming
  - Database Design
- **Leervoorkeur** (select):
  - Video lessen
  - Live webinars
  - Geschreven tutorials
  - Combinatie
- **Studieschema** (radio buttons):
  - Part-time (5-10 uur/week)
  - Full-time (20-40 uur/week)
  - Flexibel (eigen tempo)

#### 3. Achtergrond (optional)
- Huidige beroep (text, optional)
- Programmeer ervaring (textarea, optional, max 300 chars)
- Leerdoelen (textarea, optional, max 500 chars met counter)

#### 4. Betaling
- **Betaalmethode** (radio buttons):
  - Creditcard
  - iDEAL
  - PayPal
  - Bankoverschrijving
- Land (select met optgroups: Europa, Azië, Amerika, etc.)

#### 5. Akkoord
- Algemene voorwaarden (checkbox, required)
- Marketing emails (checkbox, optional)

---

## Optie 3: Job Application Form

**Scenario:** Sollicitatieformulier voor een tech bedrijf.

### Vereisten:

#### 1. Persoonlijke Gegevens
- Volledige naam (text, required)
- Email (email, required)
- Telefoon (tel, required, pattern)
- LinkedIn profiel (url, optional)
- Portfolio/Website (url, optional)
- Woonplaats (text, required)

#### 2. Functie Details
- **Sollicitatie voor** (select):
  - Frontend Developer
  - Backend Developer
  - Full-stack Developer
  - UI/UX Designer
  - DevOps Engineer
  - Project Manager
- **Ervaring level** (radio buttons):
  - Junior (0-2 jaar)
  - Medior (2-5 jaar)
  - Senior (5+ jaar)
- **Beschikbaarheid** (radio buttons):
  - Direct beschikbaar
  - 1 maand opzegtermijn
  - 2 maanden opzegtermijn
  - 3+ maanden opzegtermijn

#### 3. Skills & Expertise
- **Programmeertalen** (checkboxes, minimaal 6):
  - HTML/CSS
  - JavaScript
  - TypeScript
  - Python
  - PHP
  - Java
  - C#
  - Go
- **Frameworks** (checkboxes, minimaal 4):
  - React
  - Vue
  - Angular
  - Node.js
  - Laravel
  - Django
- **Jaren ervaring** (number, min 0, max 50)

#### 4. Motivatie
- **Waarom wil je bij ons werken?** (textarea, required, min 50 chars, max 1000 chars met counter)
- **Sterke punten** (textarea, required, min 30 chars, max 500 chars)
- **Salariseis** (number, optional, min 20000, max 200000)
- **Werkvoorkeur** (radio buttons):
  - Kantoor (5 dagen)
  - Hybride (2-3 dagen kantoor)
  - Remote (thuiswerken)

#### 5. Bestand Upload (bonus)
- CV uploaden (file input, type="file", accept=".pdf,.doc,.docx")
- Motivatiebrief (file input, optional)

#### 6. Akkoord
- Privacy verklaring (checkbox, required)
- Mag gecontacteerd worden voor andere functies (checkbox, optional)

---

## Technische Vereisten (Voor Alle Opties)

### HTML:
- ✅ Correcte formulier structuur (`<form>`, `<fieldset>`, `<legend>`)
- ✅ Alle labels correct gekoppeld (`for` en `id`)
- ✅ Semantische HTML (juiste input types)
- ✅ Alle vereiste attributes (required, pattern, min, max, etc.)

### CSS:
- ✅ **Custom styling** voor alle inputs:
  - Radio buttons (custom circles met ::after)
  - Checkboxes (custom squares met vinkjes)
  - Select dropdowns (custom pijl)
  - Textarea (resize: vertical)
  - Buttons (hover, active, disabled states)

- ✅ **Validatie feedback:**
  - :valid state (groene border)
  - :invalid state (rode border)
  - Error messages (alleen tonen wanneer invalid)
  - Success messages (optioneel)
  - Icons bij valid/invalid (optioneel)

- ✅ **Layout:**
  - Flexbox voor form layout
  - Max-width 700px, gecentreerd
  - Responsive (zie volgende weken, maar alvast basis testen)
  - Consistent spacing (margins, padding)
  - Mooie typography

- ✅ **Design:**
  - Color scheme (3-4 kleuren consistent)
  - Border-radius, box-shadows
  - Smooth transitions (0.3s)
  - Professional look

### Accessibility:
- ✅ Alle inputs hebben labels
- ✅ Fieldset en legend voor groepen
- ✅ Focus states duidelijk zichtbaar
- ✅ Keyboard navigatie werkt (tab, enter, space)
- ✅ Required velden gemarkeerd met *
- ✅ Error messages zijn descriptief

---

## Projectstructuur

```
project/
│
├── index.html          # HTML formulier
├── style.css           # Alle styling
└── README.md          # Project beschrijving (optioneel)
```

### HTML Template (Start):
```html
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Registratie</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <div class="form-container">
            <h1>Event Registratie</h1>
            <p class="subtitle">Vul het formulier in om je te registreren voor TechConf 2024</p>

            <form>
                <!-- Jouw formulier hier -->
            </form>
        </div>
    </div>
</body>
</html>
```

---

## Stapsgewijs Plan

### Dag 1: HTML Structuur
1. Maak basis HTML structuur
2. Voeg alle input velden toe (nog zonder styling)
3. Voeg validatie attributes toe
4. Test of alles werkt (submit, validatie)

### Dag 2: Basis CSS
1. Form container styling (centered, card design)
2. Label en input basis styling
3. Button styling
4. Spacing en layout (Flexbox)

### Dag 3: Custom Inputs
1. Custom radio buttons styling
2. Custom checkboxes styling
3. Select dropdown styling
4. Textarea styling

### Dag 4: Validatie & Polish
1. :valid en :invalid states
2. Error messages styling
3. Success feedback
4. Character counters (indien van toepassing)
5. Final polish (colors, spacing, transitions)

---

## Beoordelingscriteria

### HTML (25 punten)
- [ ] Correcte formulier structuur (5 punten)
- [ ] Alle labels correct gekoppeld (5 punten)
- [ ] Juiste input types gebruikt (5 punten)
- [ ] Validatie attributes toegepast (5 punten)
- [ ] Semantische HTML (fieldset, legend) (5 punten)

### CSS (40 punten)
- [ ] Custom radio buttons (8 punten)
- [ ] Custom checkboxes (8 punten)
- [ ] Select styling (6 punten)
- [ ] Button states (hover, active, disabled) (6 punten)
- [ ] Validatie feedback (:valid, :invalid) (6 punten)
- [ ] Layout en spacing (Flexbox) (6 punten)

### Design (20 punten)
- [ ] Professionele uitstraling (5 punten)
- [ ] Consistent color scheme (5 punten)
- [ ] Goede typography (5 punten)
- [ ] Smooth transitions (5 punten)

### Accessibility (15 punten)
- [ ] Labels aanwezig (5 punten)
- [ ] Focus states duidelijk (5 punten)
- [ ] Keyboard navigatie werkt (5 punten)

**Totaal: 100 punten**

**Bonus punten (max +10):**
- Character counters die echt werken (JavaScript later) (+5)
- Extra creative design (+5)
- Responsive (alvast preview voor volgende week) (+5)
- File input mooi gestyled (+3)

---

## Tips voor Succes

### DO's:
- ✅ Begin met HTML, daarna CSS (structuur eerst!)
- ✅ Test regelmatig in de browser
- ✅ Gebruik DevTools om te debuggen
- ✅ Maak een consistent color scheme (kies 3-4 kleuren)
- ✅ Comment je code voor duidelijkheid
- ✅ Test keyboard navigatie (Tab key)
- ✅ Test validatie (vul bewust foute data in)

### DON'Ts:
- ❌ Te veel kleuren (niet meer dan 4 hoofdkleuren)
- ❌ Te kleine inputs (moeilijk te klikken)
- ❌ Geen focus states (slecht voor accessibility)
- ❌ Error messages die altijd zichtbaar zijn
- ❌ Slechte spacing (alles te dicht op elkaar)
- ❌ Inconsistente styling

---

## Inspiratie Bronnen

### Bekijk deze websites voor inspiratie:
- **Typeform** (typeform.com) - Mooie formulier designs
- **Google Forms** - Simpel en clean
- **Eventbrite** - Event registratie formulieren
- **Udemy** - Cursus aanmelding
- **LinkedIn** - Job application forms

**Let op:**
- Hoe gebruiken ze kleuren?
- Waar staan labels (boven, naast)?
- Hoe tonen ze errors?
- Hoe zijn buttons gestyled?

---

## Veelvoorkomende Problemen & Oplossingen

### Probleem: Custom checkboxes werken niet
**Oplossing:** Gebruik `position: absolute; opacity: 0;` ipv `display: none;`

### Probleem: Validation toont te vroeg
**Oplossing:** Gebruik `:not(:placeholder-shown):invalid` ipv alleen `:invalid`

### Probleem: Focus outline is lelijk
**Oplossing:** Vervang met custom box-shadow:
```css
input:focus {
    outline: none;
    box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.15);
}
```

### Probleem: Radio buttons blijven niet in groep
**Oplossing:** Zelfde `name` attribute voor alle radio buttons in groep

### Probleem: Form submit doet niets
**Oplossing:** Button moet `type="submit"` hebben (niet `type="button"`)

---

## Uitdaging (Bonus)

Als je klaar bent en meer wilt leren:

1. **Multi-step form:** Splits je formulier in meerdere stappen (gebruik display: none voor stappen)
2. **Progress bar:** Toon voortgang (Stap 1/3, 2/3, 3/3)
3. **JavaScript toevoegen:** Character counter die echt telt, real-time validatie
4. **Dark mode:** Voeg een dark mode toggle toe
5. **Animations:** Smooth slide-in animaties voor error messages

---

## Inleveren

### Checklist voor inleveren:
- [ ] Alle vereiste velden aanwezig
- [ ] Custom styling voor radio, checkbox, select
- [ ] Validatie werkt op alle velden
- [ ] Error messages zijn descriptief
- [ ] Focus states werken
- [ ] Buttons hebben hover/active/disabled states
- [ ] Form is toegankelijk (tab navigatie werkt)
- [ ] Code is netjes (comments, indenting)
- [ ] Getest in minimaal 2 browsers

### Bestanden:
- `index.html`
- `style.css`
- `README.md` (optional: project beschrijving)

---

## Samenvatting

Deze week heb je:
- ✅ Een complete formulier applicatie gebouwd
- ✅ Alle input types van week 1-3 toegepast
- ✅ Custom styling voor radio, checkbox, select
- ✅ Validatie en feedback geïmplementeerd
- ✅ Professionele layout gemaakt met Flexbox
- ✅ Toegankelijkheid toegepast
- ✅ Je kennis geconsolideerd

**Volgende week:** Responsive development - leer je formulier werken op mobile, tablet en desktop!

---

**Veel succes met je project! Je hebt alle tools om iets geweldigs te maken. 🚀**

**Tips:**
- Neem de tijd om het goed te doen
- Test veel en vroeg
- Vraag feedback aan medestudenten
- Geniet van het proces!
