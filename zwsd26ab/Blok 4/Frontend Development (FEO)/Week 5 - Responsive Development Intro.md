# Week 5 - Responsive Development Intro

**Doel van deze week:** Leer wat responsive design is en hoe je websites maakt die werken op alle schermformaten.

---

## Leerdoelen

Na deze week kun je:
- ✅ Uitleggen wat responsive design is en waarom het belangrijk is
- ✅ Viewport meta tag toevoegen in HTML
- ✅ Media queries schrijven (@media)
- ✅ Breakpoints kiezen en toepassen (mobile, tablet, desktop)
- ✅ CSS aanpassen voor verschillende schermformaten
- ✅ Desktop-first vs Mobile-first benadering begrijpen
- ✅ Responsive units gebruiken (%, vw, vh, em, rem)
- ✅ Max-width en min-width in media queries
- ✅ Flexbox wrap gebruiken voor responsive layouts
- ✅ Responsive typografie implementeren

---

## 1. Wat is Responsive Design?

### Definitie:
**Responsive design** = website past zich automatisch aan aan het schermformaat van het apparaat.

### Waarom belangrijk?
- 📱 **60%+** van websiteverkeer is mobile
- 💻 Schermformaten variëren enorm (280px tot 3840px breed!)
- 🎯 Google bevoordeelt mobile-friendly websites (SEO)
- ✨ Betere gebruikerservaring op alle devices

### Responsive vs Non-Responsive:

**Non-Responsive:**
- Desktop design op mobile → veel scrollen, te kleine tekst, slecht bruikbaar

**Responsive:**
- Aanpast aan scherm → leesbare tekst, makkelijk te navigeren, goede UX

---

## 2. Veelvoorkomende Schermformaten

| Device | Breedte | Voorbeeld |
|--------|---------|-----------|
| **Kleine mobile** | 320px - 375px | iPhone SE, kleine Android |
| **Grote mobile** | 375px - 480px | iPhone 12/13/14, moderne Android |
| **Tablet portrait** | 768px - 1024px | iPad portrait, Android tablets |
| **Tablet landscape** | 1024px - 1280px | iPad landscape |
| **Laptop** | 1280px - 1440px | MacBook, kleine laptops |
| **Desktop** | 1440px - 1920px+ | iMac, grote monitors |

### Veelgebruikte Breakpoints:
```css
/* Mobile first approach */
/* Default: Mobile (< 768px) */

@media (min-width: 768px) {
    /* Tablet */
}

@media (min-width: 1024px) {
    /* Desktop */
}

@media (min-width: 1440px) {
    /* Large desktop */
}
```

---

## 3. Viewport Meta Tag

### Zonder Viewport Tag:
Mobile browsers denken dat je een desktop website hebt en zoomen uit.

### Met Viewport Tag:
Browser gebruikt echte scherm breedte.

### HTML (VERPLICHT voor responsive):
```html
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Responsive Website</title>
</head>
```

**Leg dit ALTIJD toe aan je HTML!**

---

## 4. Media Queries

### Basis Syntax:
```css
/* Default styling (voor alle schermen) */
body {
    font-size: 14px;
}

/* Styling alleen voor schermen van 768px of breder */
@media (min-width: 768px) {
    body {
        font-size: 16px;
    }
}
```

### Min-width vs Max-width:

#### min-width (Mobile-First):
```css
/* Default: Mobile */
.container {
    width: 100%;
    padding: 20px;
}

/* Vanaf 768px (Tablet en groter) */
@media (min-width: 768px) {
    .container {
        width: 750px;
        margin: 0 auto;
    }
}

/* Vanaf 1024px (Desktop) */
@media (min-width: 1024px) {
    .container {
        width: 1000px;
    }
}
```

#### max-width (Desktop-First):
```css
/* Default: Desktop */
.container {
    width: 1000px;
    margin: 0 auto;
}

/* Tot en met 1023px (Tablet en kleiner) */
@media (max-width: 1023px) {
    .container {
        width: 750px;
    }
}

/* Tot en met 767px (Mobile) */
@media (max-width: 767px) {
    .container {
        width: 100%;
        padding: 20px;
    }
}
```

---

## 5. Mobile-First vs Desktop-First

### Mobile-First (AANBEVOLEN):
- Start met mobile styling (kleinste scherm)
- Voeg CSS toe voor grotere schermen (min-width)
- Performance: mobile krijgt minste CSS
- Modern development approach

```css
/* Default: Mobile */
.nav {
    flex-direction: column; /* Stack verticaal */
}

/* Tablet en groter: Horizontaal */
@media (min-width: 768px) {
    .nav {
        flex-direction: row;
    }
}
```

### Desktop-First (OUD):
- Start met desktop styling
- Overschrijf voor kleinere schermen (max-width)
- Meer CSS op mobile (slechter voor performance)

---

## 6. Responsive Units

### Absolute Units (NIET responsive):
- `px` → pixels (vaste grootte)

### Relative Units (WEL responsive):

#### Percentage (%)
Relatief aan parent element
```css
.container {
    width: 90%; /* 90% van parent */
}
```

#### em
Relatief aan font-size van parent
```css
p {
    font-size: 16px;
    padding: 1em; /* 16px */
}
```

#### rem
Relatief aan font-size van root (`<html>`)
```css
html {
    font-size: 16px;
}

h1 {
    font-size: 2rem; /* 32px */
}

@media (min-width: 768px) {
    html {
        font-size: 18px;
    }
    /* h1 wordt nu automatisch 36px! */
}
```

#### vw / vh
Viewport width / height (relatief aan scherm)
```css
.hero {
    height: 100vh; /* Volledige scherm hoogte */
    width: 100vw; /* Volledige scherm breedte */
}

.section {
    padding: 5vw; /* 5% van scherm breedte */
}
```

---

## 7. Responsive Typography

### Font-sizes Aanpassen:
```css
/* Mobile */
body {
    font-size: 14px;
}

h1 {
    font-size: 28px;
}

h2 {
    font-size: 24px;
}

/* Tablet */
@media (min-width: 768px) {
    body {
        font-size: 16px;
    }

    h1 {
        font-size: 36px;
    }

    h2 {
        font-size: 28px;
    }
}

/* Desktop */
@media (min-width: 1024px) {
    body {
        font-size: 18px;
    }

    h1 {
        font-size: 48px;
    }

    h2 {
        font-size: 36px;
    }
}
```

### Met rem (Slimmer!):
```css
/* Mobile */
html {
    font-size: 14px;
}

h1 {
    font-size: 2rem; /* 28px */
}

/* Tablet */
@media (min-width: 768px) {
    html {
        font-size: 16px; /* Alle tekst wordt groter! */
    }
}

/* Desktop */
@media (min-width: 1024px) {
    html {
        font-size: 18px;
    }
}
```

---

## 8. Responsive Layouts met Flexbox

### Cards Layout:
```css
.cards-container {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
}

/* Mobile: 1 kolom (volledige breedte) */
.card {
    flex: 1 1 100%;
}

/* Tablet: 2 kolommen */
@media (min-width: 768px) {
    .card {
        flex: 1 1 calc(50% - 20px);
    }
}

/* Desktop: 3 kolommen */
@media (min-width: 1024px) {
    .card {
        flex: 1 1 calc(33.333% - 20px);
    }
}

/* Large desktop: 4 kolommen */
@media (min-width: 1440px) {
    .card {
        flex: 1 1 calc(25% - 20px);
    }
}
```

### Sidebar Layout:
```css
.container {
    display: flex;
    flex-direction: column; /* Mobile: Stack verticaal */
    gap: 20px;
}

.sidebar {
    width: 100%;
}

.main-content {
    width: 100%;
}

/* Tablet en groter: Sidebar naast content */
@media (min-width: 768px) {
    .container {
        flex-direction: row;
    }

    .sidebar {
        flex: 0 0 250px; /* Vaste sidebar breedte */
    }

    .main-content {
        flex: 1; /* Rest van de ruimte */
    }
}
```

---

## 9. Responsive Images

### Basis:
```css
img {
    max-width: 100%; /* Nooit breder dan parent */
    height: auto; /* Behoud aspect ratio */
}
```

### Picture Element (Advanced):
```html
<picture>
    <!-- Desktop: Grote afbeelding -->
    <source media="(min-width: 1024px)" srcset="image-large.jpg">

    <!-- Tablet: Medium afbeelding -->
    <source media="(min-width: 768px)" srcset="image-medium.jpg">

    <!-- Mobile: Kleine afbeelding -->
    <img src="image-small.jpg" alt="Description">
</picture>
```

---

## 10. Complete Voorbeeld: Responsive Header

### HTML:
```html
<header class="header">
    <div class="container">
        <div class="logo">
            <h1>MyWebsite</h1>
        </div>

        <nav class="nav">
            <a href="#">Home</a>
            <a href="#">About</a>
            <a href="#">Services</a>
            <a href="#">Contact</a>
        </nav>
    </div>
</header>
```

### CSS:
```css
/* Mobile First */
.header {
    background: #333;
    color: white;
    padding: 15px 0;
}

.container {
    width: 90%;
    max-width: 1200px;
    margin: 0 auto;
}

/* Mobile: Logo en nav gestackt */
.header .container {
    display: flex;
    flex-direction: column;
    gap: 15px;
}

.logo h1 {
    font-size: 24px;
    margin: 0;
}

/* Mobile: Navigatie verticaal */
.nav {
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.nav a {
    color: white;
    text-decoration: none;
    padding: 10px;
    background: rgba(255,255,255,0.1);
    border-radius: 5px;
    text-align: center;
}

/* Tablet: Logo en nav horizontaal */
@media (min-width: 768px) {
    .header .container {
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
    }

    .nav {
        flex-direction: row;
        gap: 20px;
    }

    .nav a {
        background: none;
        padding: 5px 10px;
    }
}

/* Desktop: Grotere tekst */
@media (min-width: 1024px) {
    .logo h1 {
        font-size: 28px;
    }

    .nav a {
        font-size: 18px;
        padding: 8px 15px;
    }

    .nav a:hover {
        background: rgba(255,255,255,0.2);
        border-radius: 5px;
    }
}
```

---

## 11. Testing Responsive Design

### Browser DevTools:
1. Open DevTools (F12)
2. Toggle Device Toolbar (Ctrl + Shift + M)
3. Selecteer device (iPhone, iPad, etc.)
4. Test verschillende schermformaten

### Veelgebruikte Test Resoluties:
- **320px** (iPhone SE portrait)
- **375px** (iPhone 12/13 portrait)
- **768px** (iPad portrait)
- **1024px** (iPad landscape / small laptop)
- **1440px** (Desktop)
- **1920px** (Large desktop)

### Manual Testing:
Resize je browser window en kijk of alles netjes blijft werken.

---

## 12. Praktijkopdracht: Responsive Card Layout

### Opdracht:
Maak een responsive card layout die werkt op mobile, tablet en desktop.

**Vereisten:**

#### HTML:
Maak minimaal 9 cards met:
- Afbeelding (gebruik https://picsum.photos/400/300 voor dummy images)
- Titel
- Beschrijving (2-3 regels)
- Button

#### CSS Responsive Vereisten:
1. **Mobile (< 768px):**
   - 1 kolom (cards onder elkaar)
   - Padding 20px
   - Font-size 14px

2. **Tablet (768px - 1023px):**
   - 2 kolommen
   - Padding 30px
   - Font-size 16px

3. **Desktop (>= 1024px):**
   - 3 kolommen
   - Max-width 1200px, gecentreerd
   - Font-size 18px

4. **Large Desktop (>= 1440px):**
   - 4 kolommen
   - Max-width 1400px

#### Styling:
- Flexbox met flex-wrap
- Gap tussen cards
- Hover effect op cards
- Responsive images (max-width: 100%)
- Smooth transitions

#### Extra:
- Responsive typography (gebruik rem)
- Responsive spacing (vw/vh waar logisch)
- Test op minimaal 4 verschillende schermformaten

---

## 13. Common Responsive Patterns

### Pattern 1: Column Drop
```css
/* Mobile: Stack */
.item {
    width: 100%;
}

/* Tablet: 2 columns */
@media (min-width: 768px) {
    .item {
        width: 50%;
    }
}

/* Desktop: 3+ columns */
@media (min-width: 1024px) {
    .item {
        width: 33.333%;
    }
}
```

### Pattern 2: Mostly Fluid
```css
.container {
    width: 90%;
    margin: 0 auto;
}

@media (min-width: 768px) {
    .container {
        width: 750px;
    }
}

@media (min-width: 1024px) {
    .container {
        width: 970px;
    }
}

@media (min-width: 1440px) {
    .container {
        width: 1200px;
    }
}
```

### Pattern 3: Layout Shifter
```css
/* Mobile: All stacked */
.sidebar,
.content,
.extra {
    width: 100%;
}

/* Tablet: Sidebar + Content */
@media (min-width: 768px) {
    .container {
        display: flex;
    }
    .sidebar {
        flex: 0 0 30%;
    }
    .content {
        flex: 1;
    }
    .extra {
        width: 100%;
    }
}

/* Desktop: All 3 next to each other */
@media (min-width: 1024px) {
    .sidebar {
        flex: 0 0 20%;
    }
    .content {
        flex: 1;
    }
    .extra {
        flex: 0 0 25%;
    }
}
```

---

## Tips & Best Practices

### ✅ DO's:
- **Mobile-first** approach gebruiken
- **Viewport meta tag** altijd toevoegen
- Test op **echte devices** (niet alleen browser resize)
- Gebruik **relative units** (rem, %, vw) waar mogelijk
- **Breakpoints** kiezen op basis van content, niet devices
- **max-width** op containers om te grote layouts te voorkomen
- **Flexbox wrap** gebruiken voor responsive grids

### ❌ DON'Ts:
- Geen viewport meta tag (website niet responsive)
- Te veel breakpoints (3-4 is genoeg)
- Fixed pixel widths overal
- Breakpoints alleen op populaire device maten
- Vergeten te testen op small mobile (320px)
- Horizontal scroll op mobile (slecht UX)

---

## Veelgemaakte Fouten

### Fout 1: Geen viewport meta tag
**Probleem:** Website zoomed uit op mobile
**Oplossing:**
```html
<meta name="viewport" content="width=device-width, initial-scale=1.0">
```

### Fout 2: Fixed widths
```css
/* FOUT */
.container {
    width: 1200px; /* Te breed voor mobile! */
}

/* GOED */
.container {
    width: 90%;
    max-width: 1200px;
}
```

### Fout 3: Te kleine tekst op mobile
```css
/* FOUT: Te klein om te lezen */
body {
    font-size: 12px;
}

/* GOED: Minimaal 14px op mobile, 16px+ op desktop */
body {
    font-size: 14px;
}

@media (min-width: 768px) {
    body {
        font-size: 16px;
    }
}
```

---

## Samenvatting

Deze week heb je geleerd:
- ✅ Wat responsive design is en waarom het belangrijk is
- ✅ Viewport meta tag toevoegen
- ✅ Media queries schrijven (min-width, max-width)
- ✅ Mobile-first vs desktop-first benadering
- ✅ Responsive units (%, rem, em, vw, vh)
- ✅ Breakpoints kiezen voor mobile, tablet, desktop
- ✅ Flexbox wrap voor responsive layouts
- ✅ Responsive typography
- ✅ Responsive images (max-width: 100%)

**Volgende week:** Mobile-first development en touch-friendly interfaces (hamburger menu's, grote tap targets)!

---

**Tip:** Open je favoriete websites en resize je browser window. Zie hoe ze aanpassen aan verschillende schermformaten. Noteer wat je opvalt! 📱💻🖥️
