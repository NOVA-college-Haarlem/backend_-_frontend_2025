# Blok 3 - Frontend Ontwikkeling Samenvatting

**Doelgroep:** MBO studenten (HTML, CSS basics uit Blok 1 & 2) - **Developer Track**
**Duur:** 8 weken
**Focus:** Cards, Layout Technieken & Flexbox (veel herhaling!)

---

## Belangrijke Note

Blok 3 is bedoeld voor **studenten die de developer richting opgaan**. In dit blok leren ze complexere componenten (cards), oudere layout technieken (float, position) en moderne layout systemen (Flexbox).

**CSS Grid is NIET opgenomen** - we focussen op veel herhaling en oefening met Flexbox.

---

## Week 1: Cards Bouwen (Basis)
**Leerdoelen:**
- Begrijpen wat cards zijn en waarvoor ze gebruikt worden
- Een basis card structuur maken met HTML
- Cards stylen met borders, shadows en spacing
- Card layouts maken met inline-block
- Hover effecten toevoegen aan cards
- Box-shadow parameters begrijpen en toepassen
- Image styling binnen cards (object-fit, width, height)
- Cards naast elkaar plaatsen met inline-block

**Oefening:** Maak 6 product/portfolio cards met afbeelding, titel, beschrijving en button

**Waarom cards?**
- Meest gebruikte component op websites (Netflix, Instagram, webshops)
- Organiseert informatie in hapklare stukken
- Professioneel en modern

---

## Week 2: Meer Card Variaties
**Leerdoelen:**
- Verschillende card layouts maken (horizontal cards)
- Badges toevoegen aan cards met absolute positioning
- Card headers en footers maken
- Color schemes toepassen op cards (border-top, backgrounds)
- Overlay effecten maken met position en opacity
- Dark themed cards stylen
- Float gebruiken voor horizontal card layouts
- Position (relative/absolute) begrijpen voor badges en overlays

**Oefening:** Maak een card library met 9 verschillende card variaties

**Nieuwe technieken:**
- `position: relative` op parent
- `position: absolute` voor badges
- Float en clearfix voor horizontal cards
- Gradient backgrounds voor overlays

---

## Week 3: Layout Trucjes
**Leerdoelen:**
- Float gebruiken voor layouts en text-wrap
- Clearfix toepassen om float problemen op te lossen
- Position (relative, absolute, fixed) begrijpen en toepassen
- Simpele 2-kolom layouts maken met float
- Z-index gebruiken voor stapelvolgorde
- Fixed headers maken die blijven staan bij scrollen
- Elements positioneren met verschillende technieken
- Begrijpen wanneer position vs float te gebruiken

**Oefening:** Maak een blog layout met fixed header, 2-kolom content (sidebar + main), en positioned badges

**Waarom deze "oude" technieken?**
- Begrijpen hoe layouts vroeger werden gemaakt
- Soms nog nodig voor legacy projecten
- Betere waardering voor Flexbox straks!
- Position is nog steeds super handig voor overlays en badges

---

## Week 4: Projectweek - "Card-Based Website"
**Project:** Bouw een website die veel gebruik maakt van cards
**Vereisten:**
- Header met navigatie
- Hero section
- Minimaal 12 cards (3 verschillende variaties)
- 2-kolom layout ergens (float)
- Badges op sommige cards (position)
- Hover effecten overal
- Footer

**Focus:** Combineer alle technieken van week 1-3

---

## Week 5: Flexbox Introductie
**Leerdoelen:**
- Uitleggen wat Flexbox is en waarom het beter is dan float/inline-block
- Een flex container aanmaken met `display: flex`
- De `flex-direction` property toepassen (row, column)
- Items uitlijnen met `justify-content` (flex-start, center, flex-end, space-between, space-around)
- Items uitlijnen met `align-items` (flex-start, center, flex-end, stretch)
- Gap property gebruiken voor spacing
- Navigatiebalk bouwen met Flexbox
- Card layouts maken met Flexbox

**Oefening:** Herbouw navigatie en cards van week 1-2 met Flexbox

**"Aha!" moment:**
- Geen clearfix nodig!
- Geen margin hacks!
- Veel makkelijker dan float!

---

## Week 6: Flexbox Verdieping
**Leerdoelen:**
- De flex item properties gebruiken: `flex-grow`, `flex-shrink`, `flex-basis`
- De `flex` shorthand property begrijpen en toepassen
- `flex-wrap` gebruiken voor meerdere rijen
- `align-content` toepassen bij meerdere rijen met wrap
- Order property gebruiken om volgorde te veranderen
- `align-self` toepassen voor individuele items
- Complexere layouts bouwen met nested flex containers
- 2-kolom en 3-kolom layouts maken met Flexbox

**Oefening:** Maak een responsive card grid met flex-wrap en een 2-kolom layout met sidebar

**Flexbox shortcuts:**
- `flex: 1` = groei en vul beschikbare ruimte
- `flex: 0 0 250px` = vaste breedte sidebar
- `flex-wrap: wrap` = automatisch nieuwe rij

---

## Week 7: Flexbox Praktijk (Veel Herhaling!)
**Leerdoelen:**
- Veel oefening met Flexbox in verschillende scenarios
- Veelvoorkomende layout patronen bouwen met Flexbox
- Problemen oplossen met Flexbox (troubleshooting)
- Flexbox combineren met cards en andere componenten
- Perfect centering (horizontaal + verticaal)
- Navigation patterns (space-between, centered, etc.)
- Responsive column layouts
- Media objects en split screens

**Oefening:** Rebuild je Blok 2 eindproject met Flexbox

**Veelvoorkomende patronen:**
```css
/* Perfect centering */
.hero {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

/* Card grid */
.cards-container {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
}

/* Sidebar layout */
.container {
    display: flex;
    gap: 40px;
}
.sidebar {
    flex: 0 0 250px;
}
.main-content {
    flex: 1;
}
```

**Troubleshooting:**
- Items te groot? → Check min-width
- Items passen niet? → Voeg flex-wrap toe
- Items niet uitgelijnd? → Check align-items

---

## Week 8: Eindproject - "Complete Flexbox Website"
**Project:** Bouw een complete website met alle Blok 3 technieken
**Vereisten:**
- Flexbox voor ALLE layouts (navigatie, cards, sections)
- Minimaal 8 cards (verschillende variaties uit week 1-2)
- Position gebruiken voor badges/overlays
- Fixed header (blijft staan bij scrollen)
- Perfect centered hero section (Flexbox)
- 2-kolom of 3-kolom sectie (Flexbox)
- Hover effecten overal
- Responsive met Flexbox (flex-wrap, flex-basis)

**Vergelijk:**
- Hoeveel makkelijker is Flexbox dan float?
- Hoeveel schoner is de code?
- Hoe veel sneller bouw je?

---

## Wat heb je aan het einde van Blok 3 geleerd?

### Cards:
✅ Basis card structuur (image, titel, tekst, button)
✅ Card variaties (horizontal, badges, headers/footers)
✅ Box-shadow en border-radius voor moderne look
✅ Hover effecten (transform, shadow, opacity)
✅ Overlay effecten met position
✅ Color schemes en theming

### Layout Trucjes:
✅ Float voor layouts en text-wrap
✅ Clearfix techniek
✅ Position (relative, absolute, fixed)
✅ Z-index voor stapelvolgorde
✅ 2-kolom layouts met float
✅ Fixed headers/sidebars
✅ Badges en overlays positioneren

### Flexbox (diepgaand met veel herhaling):
✅ Flex container properties (display, flex-direction, justify-content, align-items, gap)
✅ Flex item properties (flex-grow, flex-shrink, flex-basis, flex shorthand)
✅ Flex-wrap voor meerdere rijen
✅ Align-content voor multi-line layouts
✅ Perfect centering (horizontaal + verticaal)
✅ Navigatie bars met Flexbox
✅ Card grids met Flexbox (wrap, gap)
✅ Column layouts (sidebar, main content)
✅ Nested flex containers
✅ Troubleshooting en debugging Flexbox

---

## Vergelijking: Voor en Na Flexbox

### Navigatie:
**Week 5 (inline-block):**
```css
.nav li {
    display: inline-block;
    margin-right: 20px; /* Spacing hack */
}
```

**Week 5-7 (Flexbox):**
```css
.nav {
    display: flex;
    gap: 20px; /* Clean spacing! */
}
```

### Cards Naast Elkaar:
**Week 1 (inline-block):**
```css
.card {
    display: inline-block;
    width: 30%;
    vertical-align: top;
    margin: 1.5%;
    /* White space issues */
}
```

**Week 5-7 (Flexbox):**
```css
.cards-container {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
}
.card {
    flex: 1 1 300px;
}
```

### 2-Kolom Layout:
**Week 3 (float + clearfix):**
```css
.sidebar {
    float: left;
    width: 250px;
}
.content {
    float: left;
    width: calc(100% - 270px);
}
.clearfix::after { /* Clearfix hack */ }
```

**Week 5-7 (Flexbox):**
```css
.container {
    display: flex;
    gap: 20px;
}
.sidebar {
    flex: 0 0 250px;
}
.content {
    flex: 1;
}
```

---

## Belangrijke Skills voor MBO-4 Niveau (Developer Track):

🎨 **Component Development:** Professionele cards en componenten bouwen
🎯 **Layout Mastery:** Meerdere layout technieken beheersen
🔧 **Modern CSS:** Flexbox als primaire layout systeem
📚 **Progressive Learning:** Begrijpen waarom moderne tools beter zijn
💪 **Problem Solving:** Troubleshooten en debuggen
🤝 **Code Quality:** Nette, georganiseerde CSS schrijven

---

## Wat NIET in Blok 3 zit (komt in Blok 4):

❌ **CSS Grid** → Niet opgenomen, focus op Flexbox herhaling
❌ **Formulieren** → Komt in Blok 4
❌ **Responsiveness** (advanced media queries) → Komt in Blok 4
❌ **Animations** → Komt mogelijk in Blok 4
❌ **CSS Variables** (advanced) → Komt mogelijk in Blok 4

---

## Voorbereiding op Blok 4:

Na Blok 3 hebben developer track studenten:
- Solide kennis van cards (meest gebruikte component)
- Begrip van oude EN nieuwe layout technieken
- Sterke Flexbox skills door veel herhaling
- Position skills voor overlays en badges
- Kunnen complete, professionele websites bouwen

**Blok 4 zal focussen op:**
- Formulieren stylen (uit Blok 2 verplaatst)
- Responsiveness met media queries (uit Blok 2 verplaatst)
- Mogelijk: CSS Grid als alternatief voor Flexbox
- Mogelijk: Advanced CSS features (animations, transitions, transforms)
- Mogelijk: CSS preprocessing (variabelen, mixins)

---

## Tips voor Docenten

### Blok 3 Aanpak:
1. **Laat het verschil zien:** Vergelijk float/inline-block (week 1-3) met Flexbox (week 5-7)
2. **Veel oefenen:** Flexbox vereist veel practice - daarom 3 weken!
3. **DevTools:** Gebruik browser DevTools Flexbox overlay visualisatie
4. **Real-world:** Laat zien hoe professionele sites cards en Flexbox gebruiken
5. **Troubleshooting:** Besteed tijd aan veelgemaakte Flexbox fouten

### Studenten zullen zeggen:
- Week 3: "Float is lastig..."
- Week 5: "Wow, Flexbox is zoveel makkelijker!"
- Week 7: "Waarom hebben we niet meteen Flexbox geleerd?"
- → Omdat je nu begrijpt waarom het beter is! 😊

### Belangrijke Focus:
- **Herhaling, herhaling, herhaling** met Flexbox
- Cards zijn overal - bekijk websites samen met studenten
- Position is nog steeds super handig (niet alles is Flexbox!)
- Vier de "aha!" momenten wanneer Flexbox klikt

---

**Veel succes met Blok 3! 🚀**
