# Blok 4 - Frontend Ontwikkeling Samenvatting

**Doelgroep:** MBO studenten (HTML, CSS, Flexbox uit Blok 1-3) - **Developer Track**
**Duur:** 8 weken
**Focus:** Formulieren Stylen & Responsive/Mobile Development

---

## Belangrijke Note

Blok 4 is bedoeld voor **studenten die de developer richting opgaan**. In dit blok leren ze professionele formulieren maken en stylen, en websites responsive maken voor verschillende schermformaten.

**Backend integratie:** Formulieren worden in backend dev (PHP) afgehandeld - frontend bereidt ze voor.

---

## Week 1: Formulier Basics & Text Inputs
**Leerdoelen:**
- Begrijpen waarom formulieren belangrijk zijn op websites
- Een HTML formulier structuur opzetten met `<form>`, `<label>`, `<input>`
- Verschillende text input types gebruiken (text, email, password, number, tel, url)
- Labels correct koppelen aan inputs (for/id)
- Placeholder en required attributes toepassen
- Basis formulier styling (borders, padding, focus states)
- Input states stylen (:focus, :valid, :invalid)
- Formulier layout maken met Flexbox

**Oefening:** Maak een professioneel gestylede login en registratie formulier

**Waarom formulieren?**
- Contact formulieren, inlog systemen, bestellingen, reviews
- Gebruikers kunnen data invoeren en versturen
- Cruciale interactie tussen gebruiker en website

---

## Week 2: Radio Buttons, Checkboxes & Select
**Leerdoelen:**
- Radio buttons maken en stylen voor enkelvoudige keuzes
- Checkboxes maken en stylen voor meervoudige keuzes
- Custom radio buttons en checkboxes maken (appearance: none)
- Select dropdowns maken en stylen
- Option groups gebruiken (`<optgroup>`)
- Multiple select toepassen
- Fieldsets gebruiken voor groepering
- Legend elementen voor groepstitels
- Consistent styling voor alle input types

**Oefening:** Maak een enquête formulier met radio buttons, checkboxes en select dropdowns

**Nieuwe technieken:**
- `appearance: none` voor custom styling
- `::before` en `::after` voor custom checkboxes/radio
- Fieldset en legend voor semantische groepering

---

## Week 3: Textarea, Buttons & Validatie
**Leerdoelen:**
- Textarea maken en stylen voor lange teksten
- Resize property gebruiken (none, vertical, horizontal)
- Different button types (submit, reset, button)
- Button states stylen (hover, active, disabled, focus)
- HTML5 validatie gebruiken (required, pattern, min, max, minlength, maxlength)
- Custom validatie feedback styling
- Error messages tonen met CSS (:invalid)
- Success states tonen (:valid)
- Disabled states correct implementeren

**Oefening:** Maak een contact formulier met textarea, validatie en duidelijke feedback

**Validatie types:**
- Required fields (verplichte velden)
- Email format validatie
- Pattern matching (regex)
- Lengte beperkingen
- Nummer ranges

---

## Week 4: Projectweek - "Contact & Registratie Formulieren"
**Project:** Bouw een complete formulier pagina
**Vereisten:**
- Contact formulier (naam, email, bericht)
- Registratie formulier (username, email, password, voorkeuren)
- Minimaal 8 verschillende input types
- Radio buttons en checkboxes (custom styled)
- Select dropdown met options
- Textarea voor berichten
- Validatie op alle velden
- Error en success states
- Toegankelijk (labels, aria-attributes)
- Responsive layout met Flexbox

**Focus:** Combineer alle formulier technieken van week 1-3

---

## Week 5: Responsive Development Intro
**Leerdoelen:**
- Begrijpen wat responsive design is en waarom het belangrijk is
- Viewport meta tag toevoegen in HTML
- Media queries schrijven (@media)
- Breakpoints kiezen en toepassen (mobile, tablet, desktop)
- CSS aanpassen voor verschillende schermformaten
- Desktop-first vs Mobile-first benadering begrijpen
- Responsive units gebruiken (%, vw, vh, em, rem)
- Max-width en min-width in media queries
- Flexbox wrap gebruiken voor responsive layouts
- Responsive typografie (font-size aanpassingen)

**Oefening:** Maak een bestaande card layout responsive voor mobile, tablet en desktop

**Veelgebruikte breakpoints:**
```css
/* Mobile first */
@media (min-width: 768px) { /* Tablet */ }
@media (min-width: 1024px) { /* Desktop */ }

/* Desktop first */
@media (max-width: 1023px) { /* Tablet */ }
@media (max-width: 767px) { /* Mobile */ }
```

---

## Week 6: Mobile-First & Touch Interfaces
**Leerdoelen:**
- Mobile-first development strategie toepassen
- Touch-friendly elementen maken (minimum 44x44px)
- Hamburger menu maken voor mobile navigatie
- JavaScript toggle voor hamburger menu (basis)
- Touch events begrijpen (tap vs click)
- Scroll gedrag optimaliseren voor mobile
- Font-size aanpassen voor leesbaarheid op mobile
- Spacing aanpassen voor touch targets
- Landscape vs portrait orientatie
- Prevent zoom met juiste viewport settings

**Oefening:** Rebuild je Blok 3 eindproject met mobile-first approach en hamburger menu

**Touch-friendly checklist:**
- Buttons minimaal 44x44px
- Voldoende spacing tussen klikbare elementen
- Grote, leesbare tekst (16px minimum)
- Toegankelijke navigatie op small screens
- Fast loading (CSS optimization)

---

## Week 7: Responsive Formulieren & Patterns
**Leerdoelen:**
- Formulieren responsive maken voor mobile devices
- Input types aanpassen per schermformaat
- Stacked vs inline form layouts (mobile vs desktop)
- Labels en inputs responsive positioneren
- Error messages responsive tonen
- Touch-friendly input fields (grotere tap targets)
- Keyboard types optimaliseren voor mobile (inputmode)
- Form buttons full-width op mobile
- Multi-column forms op desktop, single-column op mobile
- Responsive tables en data displays

**Oefening:** Maak formulieren uit week 1-4 volledig responsive

**Mobile form best practices:**
```css
/* Mobile: stack alles */
.form-group {
    display: flex;
    flex-direction: column;
}

/* Desktop: label en input naast elkaar */
@media (min-width: 768px) {
    .form-group {
        flex-direction: row;
        align-items: center;
    }
    label {
        flex: 0 0 150px;
    }
}
```

---

## Week 8: Eindproject - "Complete Responsive Form Application"
**Project:** Bouw een multi-page form applicatie (onboarding flow of booking system)
**Vereisten:**
- Minimaal 3 form stappen/pagina's
- Alle input types uit week 1-3
- Custom styled radio/checkboxes
- Validatie met duidelijke feedback
- Volledig responsive (mobile-first)
- Hamburger menu voor navigatie
- Touch-friendly (44x44px minimum)
- Accessible (ARIA labels, keyboard navigation)
- Progress indicator voor multi-step form
- Review page (overzicht van ingevoerde data)
- Success page na completion

**Voorbeelden:**
- Booking systeem (hotel, restaurant, events)
- Onboarding flow (account aanmaken met stappen)
- Survey platform (multi-page enquête)
- Registration wizard (stapsgewijze registratie)

---

## Wat heb je aan het einde van Blok 4 geleerd?

### Formulieren:
✅ HTML formulier structuur (form, label, input, fieldset, legend)
✅ Alle input types (text, email, password, radio, checkbox, select, textarea)
✅ Custom styling radio buttons en checkboxes
✅ Select dropdowns stylen
✅ HTML5 validatie (required, pattern, min, max)
✅ Error en success states (:valid, :invalid)
✅ Focus states en accessibility
✅ Button states en types
✅ Form layout met Flexbox

### Responsive Development:
✅ Media queries schrijven en toepassen
✅ Breakpoints kiezen (mobile, tablet, desktop)
✅ Mobile-first vs desktop-first
✅ Responsive units (%, vw, vh, rem)
✅ Viewport meta tag
✅ Responsive typografie
✅ Flexbox wrap voor responsive layouts

### Mobile Development:
✅ Touch-friendly interfaces (44x44px minimum)
✅ Hamburger menu maken
✅ Mobile navigatie patterns
✅ Touch events begrijpen
✅ Landscape en portrait orientatie
✅ Font-size optimalisatie voor mobile
✅ Responsive formulieren (stacked vs inline)
✅ Keyboard types voor mobile (inputmode)

---

## Vergelijking: Desktop vs Mobile

### Formulier Layout:
**Desktop:**
```css
.form-row {
    display: flex;
    gap: 20px;
}
.form-group {
    flex: 1;
}
/* Labels naast inputs */
label {
    flex: 0 0 150px;
}
```

**Mobile:**
```css
.form-row {
    display: flex;
    flex-direction: column;
    gap: 15px;
}
.form-group {
    width: 100%;
}
/* Labels boven inputs */
label {
    margin-bottom: 5px;
}
```

### Navigatie:
**Desktop:**
```css
.nav {
    display: flex;
    gap: 30px;
}
.hamburger {
    display: none;
}
```

**Mobile:**
```css
.nav {
    display: none; /* Of off-screen */
}
.nav.active {
    display: flex;
    flex-direction: column;
}
.hamburger {
    display: block;
}
```

---

## Belangrijke Skills voor MBO-4 Niveau (Developer Track):

🎨 **Form Development:** Professionele, gebruiksvriendelijke formulieren maken
🎯 **Responsive Design:** Websites voor alle devices optimaliseren
🔧 **Mobile-First:** Modern development approach toepassen
📚 **Accessibility:** Toegankelijke interfaces bouwen
💪 **User Experience:** Touch-friendly, intuitive designs
🤝 **Validation:** Gebruikers helpen met duidelijke feedback
📱 **Cross-Device:** Consistent gedrag op alle schermformaten

---

## Voorbereiding op Backend Dev:

Na Blok 4 hebben developer track studenten:
- Professionele formulieren die klaar zijn voor backend processing
- Kennis van alle input types en hoe ze te stylen
- Responsive websites die op alle devices werken
- Touch-friendly interfaces voor mobile gebruikers
- Begrip van validatie (frontend basis voor backend validatie)

**Backend Dev (PHP) zal focussen op:**
- Formulier data ontvangen en verwerken ($_POST, $_GET)
- Server-side validatie
- Database opslag
- Security (SQL injection, XSS prevention)
- File uploads
- Sessions en cookies
- Email verzenden
- CRUD operaties

**Frontend heeft backend voorbereid met:**
- Correcte form HTML structuur
- Input names voor $_POST keys
- Client-side validatie als eerste check
- Gebruiksvriendelijke interfaces
- Accessible forms voor alle gebruikers

---

## Tips voor Docenten

### Blok 4 Aanpak:
1. **Formulieren eerst:** Begin met form basics voordat responsive komt
2. **Validatie demonstreren:** Laat zien hoe frustrerende vs goede validatie werkt
3. **Mobile testen:** Test op echte devices, niet alleen browser resize
4. **Accessibility:** Gebruik screen reader demo om belang te tonen
5. **Real-world:** Laat studenten formulieren van grote websites analyseren

### Formulier Best Practices:
- Labels zijn ALTIJD verplicht (accessibility)
- Required fields duidelijk markeren (*)
- Error messages moeten beschrijvend zijn ("Email is verplicht" ipv "Error")
- Success feedback is net zo belangrijk als error feedback
- Disabled buttons moeten duidelijk disabled uitzien
- Focus states zijn cruciaal voor keyboard navigatie

### Responsive Best Practices:
- Test op minimaal 3 schermformaten (mobile 375px, tablet 768px, desktop 1440px)
- Mobile-first is modern, maar desktop-first is ok voor beginners
- Gebruik echte devices voor touch testing
- Hamburger menu mag simpele JavaScript gebruiken (niet focus van dit blok)
- Landscape orientatie vergeten veel studenten - wijs erop!

### Veelgemaakte Fouten:
- Vergeten `<label for="id">` te koppelen aan input id
- Te kleine touch targets op mobile (<44px)
- Geen focus states (keyboard gebruikers zien niet waar ze zijn)
- Error messages die verdwijnen te snel
- Required fields niet gemarkeerd
- Formulieren zonder validatie feedback
- Responsive breakpoints op rare plekken
- Font-size te klein op mobile (<16px)

---

## Projectideeën voor Week 8:

### 1. Hotel Booking Systeem
- **Stap 1:** Datum selectie (check-in/out)
- **Stap 2:** Kamer type en gasten
- **Stap 3:** Persoonlijke info en speciale verzoeken
- **Review:** Overzicht boeking
- **Success:** Bevestiging

### 2. Online Course Registration
- **Stap 1:** Cursus selectie (checkboxes)
- **Stap 2:** Persoonlijke informatie
- **Stap 3:** Betaalvoorkeuren
- **Review:** Overzicht inschrijving
- **Success:** Welkom bericht

### 3. Job Application Wizard
- **Stap 1:** Persoonlijke gegevens
- **Stap 2:** Werkervaring (meerdere items)
- **Stap 3:** Motivatie en beschikbaarheid
- **Review:** Sollicitatie overzicht
- **Success:** Bevestiging verzonden

### 4. Event Ticket Booking
- **Stap 1:** Event en datum selectie
- **Stap 2:** Ticket types en aantal
- **Stap 3:** Contactgegevens
- **Review:** Order overzicht
- **Success:** Tickets geboekt

---

**Veel succes met Blok 4! 📱💻🚀**
