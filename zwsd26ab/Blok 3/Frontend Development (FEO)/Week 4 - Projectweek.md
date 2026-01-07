# Frontend Ontwikkeling - Blok 2

## Week 4: Projectweek - Portfolio Website

### Projectomschrijving
Deze week gaan studenten een complete, professionele portfolio website bouwen waarin ze alle Flexbox technieken toepassen die ze de afgelopen 3 weken hebben geleerd.

### Leerdoelen
Na deze week kan de student:
- Zelfstandig een complete responsive website bouwen met Flexbox
- Een projectplan maken en uitvoeren
- Design keuzes maken en uitleggen
- Code organiseren in overzichtelijke bestanden
- Feedback geven en ontvangen op elkaars werk

---

## Projecteisen

### Minimale Vereisten (Voldoende)

**Technisch:**
- [ ] Volledig responsive (mobile, tablet, desktop met media queries)
- [ ] Minimaal 4 secties: Header, Hero, Portfolio Items, Footer
- [ ] Flexbox gebruikt voor alle layouts (geen float, inline-block, etc.)
- [ ] CSS variabelen voor kleuren en spacing
- [ ] Minstens 3 breakpoints (mobile, tablet, desktop)
- [ ] Nette code met goede inspringin en comments
- [ ] Werkende links (binnen de pagina met #anchors)

**Content:**
- [ ] Header met navigatie
- [ ] Hero section met je naam en korte intro
- [ ] "Over mij" sectie
- [ ] Portfolio sectie met minimaal 3 projecten (kunnen nep/placeholder projecten zijn)
- [ ] Contact sectie met (nep) contactgegevens
- [ ] Footer met copyright info

**Design:**
- [ ] Consistent kleurenschema (gebruik CSS variabelen)
- [ ] Goede leesbaarheid (contrast, font-sizes)
- [ ] Hover effecten op links en knoppen
- [ ] Passende spacing (niet te vol, niet te leeg)

### Bonus Functies (Goed/Uitstekend)

**Advanced Features:**
- [ ] Smooth scroll behavior
- [ ] Sticky/fixed header
- [ ] CSS animaties op hero section
- [ ] Image gallery met hover effects
- [ ] Social media links met iconen
- [ ] "Skills" sectie met visuele elementen
- [ ] Testimonials/reviews sectie
- [ ] Timeline voor ervaring/opleiding

**Extra Polish:**
- [ ] Loading animatie
- [ ] Hamburger menu op mobile (CSS only!)
- [ ] Dark mode toggle (CSS variabelen switchen)
- [ ] Scroll reveal animaties
- [ ] Gradient backgrounds
- [ ] Box shadows en depth
- [ ] Custom fonts (Google Fonts)

---

## Weekplanning

### Les 1 (90 min): Planning & Design

**1. Introductie Project (15 min)**
- Toon voorbeelden van goede portfolio websites
- Bespreek wat een portfolio moet bevatten
- Leg vereisten uit

**2. Design Fase (30 min)**

**Wireframing:**
Studenten maken schetsen (op papier of digitaal) van:
- Mobile layout
- Desktop layout
- Elke sectie apart

**Vragen om te beantwoorden:**
- Welke kleuren ga je gebruiken?
- Welke fonts? (Google Fonts)
- Welke projecten laat je zien?
- Welke foto's heb je nodig?

**3. Project Setup (20 min)**

**Bestandsstructuur:**
```
portfolio/
├── index.html
├── css/
│   └── style.css
├── images/
│   └── (foto's hier)
└── README.md (optioneel)
```

**Basis HTML template:**
```html
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mijn Portfolio - [Jouw Naam]</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <!-- Header -->
    <header class="header">
        <!-- Later invullen -->
    </header>

    <!-- Hero Section -->
    <section class="hero" id="home">
        <!-- Later invullen -->
    </section>

    <!-- Over Mij -->
    <section class="about" id="about">
        <!-- Later invullen -->
    </section>

    <!-- Portfolio -->
    <section class="portfolio" id="portfolio">
        <!-- Later invullen -->
    </section>

    <!-- Contact -->
    <section class="contact" id="contact">
        <!-- Later invullen -->
    </section>

    <!-- Footer -->
    <footer class="footer">
        <!-- Later invullen -->
    </footer>
</body>
</html>
```

**Basis CSS template:**
```css
/* ==================== */
/* CSS Variabelen       */
/* ==================== */
:root {
    /* Kleuren */
    --primary: #3498db;
    --secondary: #2ecc71;
    --dark: #2c3e50;
    --light: #ecf0f1;
    --white: #ffffff;
    --text: #333333;

    /* Spacing */
    --spacing-sm: 10px;
    --spacing-md: 20px;
    --spacing-lg: 40px;
    --spacing-xl: 80px;

    /* Fonts */
    --font-main: Arial, sans-serif;
    --font-size-base: 16px;
    --font-size-lg: 24px;
    --font-size-xl: 36px;

    /* Overig */
    --border-radius: 8px;
    --transition: all 0.3s ease;
}

/* ==================== */
/* Reset & Base         */
/* ==================== */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

html {
    scroll-behavior: smooth;
}

body {
    font-family: var(--font-main);
    font-size: var(--font-size-base);
    line-height: 1.6;
    color: var(--text);
}

/* ==================== */
/* Header               */
/* ==================== */

/* Jouw code hier */

/* ==================== */
/* Hero Section         */
/* ==================== */

/* Jouw code hier */

/* ==================== */
/* Media Queries        */
/* ==================== */

/* Tablet */
@media (min-width: 768px) {
    /* Jouw code hier */
}

/* Desktop */
@media (min-width: 1024px) {
    /* Jouw code hier */
}
```

**4. Begin met Bouwen (25 min)**

Studenten beginnen met:
1. Header met navigatie maken
2. Hero section opzetten
3. CSS variabelen aanpassen naar eigen kleuren

**Docent loopt rond en helpt waar nodig.**

---

### Les 2 (90 min): Verder Bouwen & Peer Review

**1. Voortgang Check (10 min)**
- Waar ben je?
- Wat lukt goed?
- Waar loop je tegenaan?

**2. Zelfstandig Werken (60 min)**

**Prioriteiten voor vandaag:**
1. Alle secties in HTML structuur
2. Basis CSS styling voor elke sectie
3. Portfolio items met Flexbox layout
4. Mobile-first CSS schrijven

**Hulp vragen? Dat mag!**

**3. Peer Review Sessie (20 min)**

**Hoe werkt het:**
- Werk in tweetallen
- Bekijk elkaars code en website
- Geef constructieve feedback

**Feedback punten:**
- Werkt de website op verschillende schermgroottes?
- Is de code netjes en overzichtelijk?
- Zijn er dingen die niet werken?
- Wat vind je mooi? Wat kan beter?

**Feedback geven:**
- Wees eerlijk maar vriendelijk
- Geef concrete voorbeelden
- Denk mee over oplossingen

---

### Les 3 (Assessment): Presentatie & Eindresultaat

**1. Laatste Aanpassingen (20 min)**
- Fix eventuele bugs
- Voeg laatste polish toe
- Test op verschillende schermgroottes
- Check DevTools Console voor errors

**2. Presentaties (60 min)**

**Elke student presenteert (4-5 min per persoon):**

**Wat te laten zien:**
1. **Demo** (2 min)
   - Open je website in de browser
   - Laat zien hoe het responsive werkt (resize window)
   - Laat hover effecten zien
   - Navigeer door je site

2. **Code Uitleg** (2 min)
   - Open je CSS bestand
   - Leg uit hoe je Flexbox hebt gebruikt
   - Laat je CSS variabelen zien
   - Laat een interessante media query zien

3. **Reflectie** (1 min)
   - Wat vond je moeilijk?
   - Waar ben je trots op?
   - Wat zou je anders doen?

**3. Afronding (10 min)**
- Wat hebben we geleerd?
- Tips voor verder werken aan portfolio
- Preview volgende weken

---

## Beoordelingscriteria

### Technische Kwaliteit (40%)

| Criterium | Onvoldoende | Voldoende | Goed |
|-----------|-------------|-----------|------|
| **Flexbox Gebruik** | Weinig of incorrect Flexbox gebruik | Flexbox correct gebruikt voor layouts | Flexbox slim ingezet, geneste containers |
| **Responsive Design** | Werkt niet op mobile | Werkt op mobile, tablet, desktop | Perfect responsive met smooth transitions |
| **Code Kwaliteit** | Rommelige code, geen structuur | Nette code met comments | Zeer nette code, logische structuur, CSS variabelen |
| **CSS Variabelen** | Niet gebruikt | Basis variabelen voor kleuren | Uitgebreid gebruik voor kleuren, spacing, fonts |

### Functionaliteit (30%)

| Criterium | Onvoldoende | Voldoende | Goed |
|-----------|-------------|-----------|------|
| **Alle Secties** | Mist >2 vereiste secties | Alle vereiste secties aanwezig | Alle secties + extra features |
| **Navigatie** | Werkt niet | Werkt, links kloppen | Werkt perfect, smooth scroll, actieve state |
| **Content** | Weinig inhoud, lorem ipsum | Echte content, goed leesbaar | Professionele content, goede structuur |

### Design & UX (20%)

| Criterium | Onvoldoende | Voldoende | Goed |
|-----------|-------------|-----------|------|
| **Visueel** | Lelijk, geen samenhang | Nette kleuren, consistent | Mooi design, professioneel |
| **Gebruikersvriendelijkheid** | Onduidelijk, moeilijk te gebruiken | Duidelijk, makkelijk te navigeren | Intuïtief, prettig in gebruik |

### Presentatie (10%)

| Criterium | Onvoldoende | Voldoende | Goed |
|-----------|-------------|-----------|------|
| **Demo & Uitleg** | Kan niet uitleggen | Kan demo geven en basis uitleggen | Duidelijke demo met goede uitleg |

---

## Veel Gemaakte Fouten

### 1. Vergeten `<meta viewport>` tag
```html
<!-- FOUT: Vergeten -->
<head>
    <title>Portfolio</title>
</head>

<!-- GOED: -->
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portfolio</title>
</head>
```

### 2. Geen mobile-first approach
```css
/* FOUT: Desktop eerst */
.container {
    flex-direction: row;
}
@media (max-width: 768px) {
    .container {
        flex-direction: column;
    }
}

/* GOED: Mobile eerst */
.container {
    flex-direction: column; /* Mobile */
}
@media (min-width: 768px) {
    .container {
        flex-direction: row; /* Desktop */
    }
}
```

### 3. Vaste breedtes in pixels
```css
/* FOUT: Te specifiek */
.card {
    width: 300px;
}

/* GOED: Flexibel */
.card {
    flex: 0 0 calc(33.333% - 20px);
}
```

### 4. Geen CSS variabelen
```css
/* FOUT: Overal hardcoded */
.header { background: #3498db; }
.button { background: #3498db; }
.link { color: #3498db; }

/* GOED: Met variabelen */
:root { --primary: #3498db; }
.header { background: var(--primary); }
.button { background: var(--primary); }
.link { color: var(--primary); }
```

---

## Inspiratie & Resources

### Voorbeeld Portfolio's
- [brittanychiang.com](https://brittanychiang.com/) - Developer portfolio
- [jacekjeznach.com](https://jacekjeznach.com/) - Minimalistisch
- [bruno-simon.com](https://bruno-simon.com/) - Creatief (te advanced voor nu!)

### Handige Tools
- **Kleuren:** [Coolors.co](https://coolors.co/) - Color scheme generator
- **Fonts:** [Google Fonts](https://fonts.google.com/)
- **Afbeeldingen:** [Unsplash](https://unsplash.com/), [Pexels](https://pexels.com/)
- **Iconen:** [Font Awesome](https://fontawesome.com/), [Heroicons](https://heroicons.com/)
- **Placeholder Images:** [Picsum Photos](https://picsum.photos/)

### CSS Generators
- [CSS Gradient](https://cssgradient.io/)
- [Box Shadow Generator](https://box-shadow.dev/)
- [Fancy Border Radius](https://9elements.github.io/fancy-border-radius/)

---

## Tips voor Docenten

### Tijdens de Projectweek
- Loop actief rond en help studenten
- Spot veelgemaakte fouten vroeg en bespreek klassikaal
- Laat succesvolle oplossingen zien aan de klas
- Moedig experimenteren aan
- Vier kleine successen

### Peer Review Begeleiden
- Model hoe je constructieve feedback geeft
- Geef studenten een checklist voor review
- Laat ze code samen bekijken, niet alleen eindresultaat
- Moedig vragen stellen aan: "Waarom heb je dit zo gedaan?"

### Presentaties
- Houd het luchtig en positief
- Vraag doorvragen: "Hoe heb je dit gemaakt?"
- Laat andere studenten ook vragen stellen
- Geef concrete complimenten

### Differentiatie
- **Snelle studenten:** Laat ze bonus features implementeren
- **Studenten die moeite hebben:** Help met prioriteren - eerst werkend krijgen, dan mooi maken
- **Samen werken:** Mag, maar iedereen moet eigen portfolio hebben

---
