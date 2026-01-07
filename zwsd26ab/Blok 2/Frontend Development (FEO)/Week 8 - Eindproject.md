# Week 8: Eindproject - "Complete Website"

## Projectomschrijving
Bouw een complete, professioneel uitziende website met ALLE technieken uit Blok 2. Dit is je kans om te laten zien wat je hebt geleerd!

## Leerdoelen
Na deze week kan de student:
- Een complete website zelfstandig bouwen
- Alle Blok 2 technieken toepassen
- Design keuzes maken en uitleggen
- Code netjes organiseren
- Presenteren voor de klas

## Projecteisen

### Minimale Vereisten (Voldoende)

**Technisch - Moet erin:**
- [ ] Professionele navigatie (horizontaal, styled, hover)
- [ ] Minimaal 5 verschillende button styles
- [ ] Consistent kleurenschema (3 kleuren max)
- [ ] Minimaal 2 verschillende fonts
- [ ] Hero section met call-to-action
- [ ] Minimaal 8 gestylede afbeeldingen
- [ ] Gestylede lijsten (bullets of nummers)
- [ ] 2-kolom layout ergens op de pagina
- [ ] Gecentreerde content (max-width + margin)
- [ ] Footer met links
- [ ] Hover effecten OVERAL
- [ ] Nette CSS met comments

**Content - Minimaal:**
- [ ] Header met logo/naam + navigatie
- [ ] Hero section
- [ ] Over/Info sectie
- [ ] Features/Diensten sectie
- [ ] Gallery/Portfolio sectie
- [ ] Contact info sectie
- [ ] Footer

**Design - Kwaliteit:**
- [ ] Consistent kleurenschema
- [ ] Goede leesbaarheid
- [ ] Professionele spacing
- [ ] Aantrekkelijk design

### Bonus Functies (Goed/Uitstekend)

**Extra Styling:**
- [ ] Meerdere button sizes (small, medium, large)
- [ ] Button groepen (buttons naast elkaar)
- [ ] Active state op navigatie links
- [ ] Breadcrumb navigatie
- [ ] Image filters (grayscale, brightness)
- [ ] Image hover effects (zoom, overlay)
- [ ] Smooth scroll behavior
- [ ] Gradient backgrounds

**Extra Layout:**
- [ ] 3-kolom sectie
- [ ] Sidebar layout
- [ ] Sticky header
- [ ] Parallax effect (basic)

**Extra Polish:**
- [ ] CSS variabelen voor alles
- [ ] Animations (fade in, slide in)
- [ ] Box shadows overal
- [ ] Border radius consistent
- [ ] Loading animations

## Onderwerp Keuzes

Kies ÉÉN onderwerp:

1. **Portfolio Website**
   - Over jezelf
   - Skills sectie
   - Project gallery
   - Contact info

2. **Bedrijfswebsite**
   - Lokale bakkerij
   - Kapper/salon
   - Restaurant
   - Sportclub

3. **Product Landing Page**
   - Nieuwe game
   - App
   - Product
   - Service

4. **Event Website**
   - Festival
   - Concert
   - Conferentie
   - Wedstrijd

5. **Eigen Idee**
   - Overleg met docent!

## Weekplanning

### Dag 1 (90 min): Planning & Setup

**1. Kickoff (15 min)**
- Voorbeelden bekijken
- Eisen bespreken
- Onderwerp kiezen

**2. Planning Fase (30 min)**

**Wireframe (schets op papier):**
```
┌─────────────────────────┐
│  Header + Nav           │
├─────────────────────────┤
│                         │
│    Hero Section         │
│                         │
├─────────────────────────┤
│  Sectie 1  │  Sectie 2  │
├─────────────────────────┤
│    Gallery              │
├─────────────────────────┤
│  Footer                 │
└─────────────────────────┘
```

**Beslissingen maken:**
- Welke kleuren? (Kies 3)
- Welke fonts? (Kies 2)
- Welke secties?
- Welke afbeeldingen?

**Checklist maken:**
```
□ Header + nav
□ Hero met button
□ Over sectie
□ Features (3 items)
□ Gallery (8+ afbeeldingen)
□ Contact sectie
□ Footer
□ Buttons (5+ styles)
□ Hover effecten
```

**3. Project Setup (15 min)**

**Bestandsstructuur:**
```
eindproject/
├── index.html
├── css/
│   └── style.css
└── images/
    ├── hero-bg.jpg
    ├── logo.png
    ├── gallery/
    │   ├── img1.jpg
    │   ├── img2.jpg
    │   └── ...
    └── ...
```

**HTML Basis:**
```html
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>[Jouw Project]</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <div class="container">
            <div class="logo">[Logo]</div>
            <nav>
                <a href="#home">Home</a>
                <a href="#about">Over</a>
                <a href="#services">Diensten</a>
                <a href="#gallery">Gallery</a>
                <a href="#contact">Contact</a>
            </nav>
        </div>
    </header>

    <section class="hero" id="home">
        <!-- Hero content -->
    </section>

    <section class="about" id="about">
        <!-- About content -->
    </section>

    <section class="services" id="services">
        <!-- Services content -->
    </section>

    <section class="gallery" id="gallery">
        <!-- Gallery content -->
    </section>

    <section class="contact" id="contact">
        <!-- Contact content -->
    </section>

    <footer>
        <!-- Footer content -->
    </footer>
</body>
</html>
```

**CSS Basis:**
```css
/* ==================== */
/* CSS Variabelen       */
/* ==================== */
:root {
    --primary-color: #3498db;
    --secondary-color: #2ecc71;
    --accent-color: #e74c3c;
    --text-color: #333;
    --light-bg: #f9f9f9;
    --dark-bg: #2c3e50;

    --font-main: Arial, sans-serif;
    --font-heading: Georgia, serif;

    --space-xs: 10px;
    --space-sm: 20px;
    --space-md: 40px;
    --space-lg: 60px;
    --space-xl: 100px;
}

/* ==================== */
/* Reset               */
/* ==================== */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: var(--font-main);
    color: var(--text-color);
    line-height: 1.6;
}

/* ==================== */
/* Container           */
/* ==================== */
.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 var(--space-sm);
}

/* ==================== */
/* Sections            */
/* ==================== */
section {
    padding: var(--space-lg) 0;
}

/* Voeg hier jouw styling toe! */
```

**4. Beginnen met Bouwen (30 min)**
- HTML structuur compleet maken
- Header + navigatie starten
- Hero section HTML

### Dag 2 (90 min): Bouwen

**1. Check-in (5 min)**
- Stand van zaken?
- Problemen?

**2. Zelfstandig Werken (75 min)**

**Prioriteiten:**
1. Header + nav compleet + styled
2. Hero section af
3. Minimaal 2 content secties
4. Buttons maken (5+ styles)
5. Eerste afbeeldingen toevoegen

**Focus:**
- Eerst structuur
- Dan styling
- Dan polish

**3. Tussentijdse Check (10 min)**
- Voortgang tonen aan docent
- Feedback krijgen
- Planning maken voor volgende sessie

### Dag 3 (90 min): Afwerken & Presenteren

**1. Laatste Sprint (40 min)**
- Alle secties compleet
- Alle afbeeldingen styled
- Alle buttons gemaakt
- Hover effecten overal
- Footer af
- Bug fixes
- Code opschonen

**Quick checklist:**
```
□ 5+ button styles?
□ 8+ afbeeldingen?
□ Alle hover effecten?
□ Footer compleet?
□ Navigatie werkt?
□ Alles gecentreerd?
□ Spacing overal goed?
```

**2. Peer Review (20 min)**

**In tweetallen bekijken:**

Geef feedback op:
1. Eerste indruk (1-5 sterren)
2. Navigatie werkt? ✓ / ✗
3. Hero section mooi? ✓ / ✗
4. Buttons professioneel? ✓ / ✗
5. Afbeeldingen goed? ✓ / ✗
6. Spacing consistent? ✓ / ✗
7. Mooist onderdeel?
8. Één tip?

**3. Presentaties (30 min)**

**Format (3 min per student):**

**1. Demo (1.5 min)**
- Open je website
- Scroll door alle secties
- Laat hover effecten zien
- Laat je favoriete onderdeel zien

**2. Code Highlight (1 min)**
- Open je CSS
- Laat één cool stuk code zien
- Leg uit waarom je trots bent

**3. Reflectie (0.5 min)**
- Wat ging goed?
- Wat was moeilijk?
- Wat zou je anders doen?

**Klasgenoten mogen vragen stellen!**

## Beoordelingscriteria

### Technische Kwaliteit (40%)

| Aspect | Onvoldoende (1-5) | Voldoende (6-7) | Goed (8-10) |
|--------|-------------------|-----------------|-------------|
| **Buttons** | <3 styles | 5+ styles, hover werkt | Veel variaties, sizes, smooth transitions |
| **Navigatie** | Basic | Styled, hover, werkt | Professioneel, active states, perfect |
| **Layout** | Basic | 2-kolom werkt | Meerdere layouts, sidebar, perfect centered |
| **Afbeeldingen** | <5, basic | 8+, borders/shadows | 8+, filters, hover effects, professional |
| **Code** | Rommelig | Netjes, comments | Zeer netjes, georganiseerd, CSS vars |

### Functionaliteit (30%)

| Aspect | Onvoldoende | Voldoende | Goed |
|--------|-------------|-----------|------|
| **Alle Secties** | Mist >2 | Alle vereist | Alle + extras |
| **Interactiviteit** | Weinig hover | Hover op links/buttons | Hover overal, smooth |
| **Navigation** | Werkt niet | Werkt | Werkt + active states |

### Design & UX (20%)

| Aspect | Onvoldoende | Voldoende | Goed |
|--------|-------------|-----------|------|
| **Kleurenschema** | Geen samenhang | 2-3 kleuren consistent | Perfect schema, contrast |
| **Typografie** | 1 font, slecht | 2 fonts, hiërarchie | Perfect hiërarchie, leesbaar |
| **Spacing** | Inconsistent | Consistent | Perfect spacing overal |

### Presentatie (10%)

| Aspect | Onvoldoende | Voldoende | Goed |
|--------|-------------|-----------|------|
| **Demo** | Kan niet demo geven | Kan demo geven | Zelfverzekerd, duidelijk |
| **Reflectie** | Geen | Basis reflectie | Goede reflectie + lessen |

## Inspiratie & Content Tips

### Content Verzamelen

**Voor Portfolio:**
- Schrijf over jezelf (200 woorden)
- Lijst je skills
- Verzamel project screenshots
- Maak contact info

**Voor Bedrijf:**
- Bedenk bedrijfsnaam
- Schrijf over diensten (3-5)
- Verzamel stock foto's (Unsplash)
- Maak openingstijden/contact

### Design Inspiratie

**Kleurenschema's:**
- Blauw + Groen (tech, modern)
- Rood + Geel (energie, food)
- Paars + Roze (creatief, fun)
- Blauw + Oranje (professioneel)

**Button Styles:**
- Primary (gevuld, accent kleur)
- Secondary (outline)
- Ghost (transparant)
- Success (groen)
- Danger (rood)

**Layout Patronen:**
- Hero + 3 kolommen
- Hero + 2 kolommen + gallery
- Hero + alternating 2-kolom
- Hero + grid gallery + footer

## Veelgemaakte Fouten

**1. Content niet gecentreerd**
```css
/* FOUT */
body {
    max-width: 1200px;
}

/* GOED */
.container {
    max-width: 1200px;
    margin: 0 auto;
}
```

**2. Geen transitions**
```css
/* FOUT */
.btn:hover {
    background-color: darkblue;
}

/* GOED */
.btn {
    transition: all 0.3s;
}
.btn:hover {
    background-color: darkblue;
}
```

**3. Inconsistente spacing**
```css
/* FOUT */
.section1 { padding: 20px; }
.section2 { padding: 35px; }
.section3 { padding: 15px; }

/* GOED: gebruik variabelen */
section {
    padding: var(--space-lg) 0;
}
```

**4. Te veel kleuren**
Gebruik max 3-4 kleuren TOTAAL

**5. Slechte image kwaliteit**
Download HD afbeeldingen (Unsplash, Pexels)

## Extra Resources

**Inspiratie:**
- Awwwards.com
- Dribbble.com
- Behance.net

**Afbeeldingen:**
- Unsplash.com
- Pexels.com
- Pixabay.com

**Kleuren:**
- Coolors.co
- Adobe Color

**Tools:**
- Box Shadow Generator
- Gradient Generator
- Border Radius Generator

## Tips voor Docent

### Voorbereiding
- Laat goede voorbeelden zien
- Bespreek planning
- Help met onderwerp kiezen

### Tijdens Project
- Loop constant rond
- Spot problemen vroeg
- Help prioriteren
- Vier kleine successen
- "Eerst werkend, dan mooi"

### Veelvoorkomende Hulpvragen
- "Hoe centreer ik?"  → max-width + margin: 0 auto
- "Waarom staan ze niet naast elkaar?" → display: inline-block
- "Hover werkt niet" → transition toevoegen
- "Te wit" → backgrounds toevoegen

### Presentaties
- Positieve sfeer
- Moedig feedback aan
- Vier wat bereikt is
- Stel vragen over keuzes

---

**Veel succes met je eindproject! 🚀**
