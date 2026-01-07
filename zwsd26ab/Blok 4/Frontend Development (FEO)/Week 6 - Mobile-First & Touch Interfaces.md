# Week 6 - Mobile-First & Touch Interfaces

**Doel van deze week:** Leer mobile-first development en touch-friendly interfaces maken met hamburger menu's.

---

## Leerdoelen

Na deze week kun je:
- ✅ Mobile-first development strategie toepassen
- ✅ Touch-friendly elementen maken (minimum 44x44px)
- ✅ Hamburger menu maken voor mobile navigatie
- ✅ Basis JavaScript gebruiken voor menu toggle
- ✅ Touch events begrijpen (tap vs click)
- ✅ Scroll gedrag optimaliseren voor mobile
- ✅ Font-size aanpassen voor leesbaarheid op mobile
- ✅ Spacing aanpassen voor touch targets
- ✅ Landscape vs portrait orientatie hanteren
- ✅ Zoom-gedrag controleren met viewport settings

---

## 1. Mobile-First Philosophy

### Waarom Mobile-First?

**Voordelen:**
- 📱 **Performance:** Mobile krijgt minimale CSS (sneller laden)
- 🎯 **Focus:** Begint met essentie (wat is echt belangrijk?)
- 📈 **Progressive Enhancement:** Voeg features toe voor grotere schermen
- 🌍 **Reality:** Meeste gebruikers zijn op mobile

**Mobile-first = Start simpel, voeg toe voor desktop**
**Desktop-first = Start complex, haal weg voor mobile**

### Mobile-First Mindset:
```
Mobile → Tablet → Desktop
(Simpel) → (Meer features) → (Volledig)
```

**Vraag jezelf af:**
- Wat heeft een mobile gebruiker ECHT nodig?
- Kan dit simpeler?
- Is dit gemakkelijk te bedienen met één hand/duim?

---

## 2. Touch-Friendly Design

### Touch Target Sizes

**Apple & Google Richtlijnen:**
- **Minimum:** 44x44px (iOS) / 48x48px (Android)
- **Comfortable:** 48x48px of groter
- **Spacing:** Minimaal 8px tussen touchable elementen

### Voorbeelden:

#### ❌ Te Klein (Slecht):
```css
button {
    padding: 5px 10px; /* Ongeveer 30x20px - te klein! */
}
```

#### ✅ Touch-Friendly (Goed):
```css
button {
    padding: 12px 24px; /* Minimaal 44x44px */
    min-height: 44px;
    min-width: 44px;
}
```

### Touch Targets in Navigatie:
```css
/* Mobile navigatie */
.nav a {
    display: block;
    padding: 15px 20px; /* Grote tap area */
    font-size: 18px; /* Goed leesbaar */
}

/* Desktop navigatie */
@media (min-width: 768px) {
    .nav a {
        padding: 10px 15px; /* Kan kleiner met muis */
        font-size: 16px;
    }
}
```

---

## 3. Hamburger Menu

### Wat is een Hamburger Menu?
- **Icon:** ≡ (drie horizontale lijnen)
- **Functie:** Verbergt navigatie op small screens, toont bij klik
- **Waarom:** Bespaart ruimte op mobile

### HTML Structuur:
```html
<header class="header">
    <div class="container">
        <div class="logo">
            <h1>MyWebsite</h1>
        </div>

        <!-- Hamburger Button (alleen zichtbaar op mobile) -->
        <button class="hamburger" id="hamburger" aria-label="Toggle menu">
            <span></span>
            <span></span>
            <span></span>
        </button>

        <!-- Navigatie (verborgen op mobile totdat hamburger geklikt) -->
        <nav class="nav" id="nav">
            <a href="#">Home</a>
            <a href="#">About</a>
            <a href="#">Services</a>
            <a href="#">Portfolio</a>
            <a href="#">Contact</a>
        </nav>
    </div>
</header>
```

### CSS Styling:
```css
/* Header */
.header {
    background: #333;
    color: white;
    padding: 15px 0;
}

.header .container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 90%;
    max-width: 1200px;
    margin: 0 auto;
}

.logo h1 {
    font-size: 24px;
    margin: 0;
}

/* Hamburger Button (Mobile only) */
.hamburger {
    display: flex;
    flex-direction: column;
    gap: 5px;
    background: none;
    border: none;
    cursor: pointer;
    padding: 10px;
    z-index: 1000;
}

.hamburger span {
    width: 30px;
    height: 3px;
    background: white;
    border-radius: 3px;
    transition: all 0.3s;
}

/* Hamburger animatie (active state) */
.hamburger.active span:nth-child(1) {
    transform: rotate(45deg) translate(8px, 8px);
}

.hamburger.active span:nth-child(2) {
    opacity: 0;
}

.hamburger.active span:nth-child(3) {
    transform: rotate(-45deg) translate(8px, -8px);
}

/* Navigatie - Mobile: Verborgen (off-screen) */
.nav {
    position: fixed;
    top: 0;
    right: -100%; /* Off-screen rechts */
    width: 70%;
    max-width: 300px;
    height: 100vh;
    background: #222;
    display: flex;
    flex-direction: column;
    padding: 80px 30px 30px;
    transition: right 0.3s ease;
    z-index: 999;
}

/* Navigatie - Mobile: Zichtbaar */
.nav.active {
    right: 0; /* Slide in */
}

.nav a {
    color: white;
    text-decoration: none;
    padding: 15px 0;
    font-size: 18px;
    border-bottom: 1px solid rgba(255,255,255,0.1);
    transition: color 0.3s;
}

.nav a:hover {
    color: #007bff;
}

/* Tablet en Desktop: Normale navigatie */
@media (min-width: 768px) {
    /* Verberg hamburger */
    .hamburger {
        display: none;
    }

    /* Toon navigatie normaal */
    .nav {
        position: static;
        width: auto;
        height: auto;
        flex-direction: row;
        padding: 0;
        gap: 30px;
        background: none;
    }

    .nav a {
        border-bottom: none;
        padding: 5px 0;
        font-size: 16px;
    }
}
```

### JavaScript (Basis Toggle):
```javascript
// Voeg toe aan <script> tag in HTML of apart .js bestand

const hamburger = document.getElementById('hamburger');
const nav = document.getElementById('nav');

hamburger.addEventListener('click', function() {
    // Toggle 'active' class op beide elementen
    hamburger.classList.toggle('active');
    nav.classList.toggle('active');
});

// Optioneel: Sluit menu bij klikken op een link
const navLinks = nav.querySelectorAll('a');
navLinks.forEach(link => {
    link.addEventListener('click', function() {
        hamburger.classList.remove('active');
        nav.classList.remove('active');
    });
});
```

### HTML met JavaScript:
```html
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hamburger Menu</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header class="header">
        <!-- Header content hier -->
    </header>

    <!-- JavaScript aan einde van body -->
    <script>
        const hamburger = document.getElementById('hamburger');
        const nav = document.getElementById('nav');

        hamburger.addEventListener('click', function() {
            hamburger.classList.toggle('active');
            nav.classList.toggle('active');
        });
    </script>
</body>
</html>
```

---

## 4. Mobile Typography

### Font-size Minimums:
```css
/* Mobile */
body {
    font-size: 16px; /* Minimum! (prevent zoom op iOS) */
    line-height: 1.6;
}

h1 {
    font-size: 28px;
    line-height: 1.2;
}

h2 {
    font-size: 24px;
}

p {
    font-size: 16px;
    line-height: 1.6; /* Goede leesbaarheid */
}

/* Tablet */
@media (min-width: 768px) {
    body {
        font-size: 18px;
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
    h1 {
        font-size: 48px;
    }

    h2 {
        font-size: 36px;
    }
}
```

**Waarom 16px minimum?**
- iOS zoomed automatisch in op inputs < 16px
- Voorkomt frustrerende zoom bij typing

---

## 5. Mobile Spacing

### Mobile vs Desktop Spacing:
```css
/* Mobile: Kleinere spacing (minder ruimte) */
.section {
    padding: 40px 20px;
}

.card {
    margin-bottom: 20px;
}

/* Tablet: Medium spacing */
@media (min-width: 768px) {
    .section {
        padding: 60px 40px;
    }

    .card {
        margin-bottom: 30px;
    }
}

/* Desktop: Grotere spacing */
@media (min-width: 1024px) {
    .section {
        padding: 80px 60px;
    }

    .card {
        margin-bottom: 40px;
    }
}
```

### Responsive Spacing met vw:
```css
.section {
    padding: 5vw; /* 5% van viewport width */
}

/* Maar zet wel min/max voor extremen */
.section {
    padding: clamp(20px, 5vw, 80px);
    /* Min 20px, ideal 5vw, max 80px */
}
```

---

## 6. Landscape vs Portrait

### Orientation Media Query:
```css
/* Portrait (staand) */
@media (orientation: portrait) {
    .hero {
        height: 60vh;
    }
}

/* Landscape (liggend) */
@media (orientation: landscape) {
    .hero {
        height: 100vh; /* Volledige hoogte */
    }
}
```

### Landscape Mobile (bijv. iPhone horizontaal):
```css
/* Specifiek voor mobile landscape */
@media (max-width: 767px) and (orientation: landscape) {
    /* Header kleiner maken voor meer content ruimte */
    .header {
        padding: 10px 0;
    }

    .logo h1 {
        font-size: 20px;
    }

    /* Hero sections korter */
    .hero {
        height: 70vh;
    }
}
```

---

## 7. Scroll Optimization

### Smooth Scrolling:
```css
html {
    scroll-behavior: smooth;
}
```

### Scroll Snap (Mobile carousels):
```css
.carousel {
    display: flex;
    overflow-x: scroll;
    scroll-snap-type: x mandatory;
    -webkit-overflow-scrolling: touch; /* Smooth iOS scroll */
}

.carousel-item {
    flex: 0 0 100%;
    scroll-snap-align: start;
}
```

### Hide Scrollbar (Optional):
```css
/* Hide scrollbar maar behoud functionaliteit */
.carousel {
    overflow-x: scroll;
    -ms-overflow-style: none; /* IE/Edge */
    scrollbar-width: none; /* Firefox */
}

.carousel::-webkit-scrollbar {
    display: none; /* Chrome/Safari */
}
```

---

## 8. Prevent Unwanted Zoom

### Viewport Settings:
```html
<!-- Basis (zoom toegestaan) -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Prevent zoom (gebruik ALLEEN als je zeker weet dat het nodig is) -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
```

**⚠️ Waarschuwing:** Zoom disablen is meestal SLECHT voor accessibility!

**Betere oplossing:** Gebruik font-size minimaal 16px op inputs:
```css
input,
select,
textarea {
    font-size: 16px; /* Prevent auto-zoom op iOS */
}
```

---

## 9. Touch States

### :hover op Touch Devices:
```css
/* Desktop: Hover effect */
@media (hover: hover) {
    .button:hover {
        background: #0056b3;
        transform: translateY(-2px);
    }
}

/* Touch devices: Active (tap) effect */
@media (hover: none) {
    .button:active {
        background: #0056b3;
        transform: scale(0.98);
    }
}
```

### Active States:
```css
button {
    background: #007bff;
    transition: all 0.2s;
}

/* Immediate feedback bij touch */
button:active {
    background: #0056b3;
    transform: scale(0.95);
}
```

---

## 10. Complete Voorbeeld: Mobile-First Page

### HTML:
```html
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mobile-First Website</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <!-- Header met hamburger -->
    <header class="header">
        <div class="container">
            <div class="logo">
                <h1>MyWebsite</h1>
            </div>

            <button class="hamburger" id="hamburger" aria-label="Menu">
                <span></span>
                <span></span>
                <span></span>
            </button>

            <nav class="nav" id="nav">
                <a href="#home">Home</a>
                <a href="#about">About</a>
                <a href="#services">Services</a>
                <a href="#contact">Contact</a>
            </nav>
        </div>
    </header>

    <!-- Hero Section -->
    <section class="hero">
        <div class="container">
            <h2>Welcome to Our Website</h2>
            <p>Mobile-first design for the modern web</p>
            <a href="#contact" class="btn">Get Started</a>
        </div>
    </section>

    <!-- Cards Section -->
    <section class="cards-section">
        <div class="container">
            <h2>Our Services</h2>

            <div class="cards">
                <div class="card">
                    <h3>Web Design</h3>
                    <p>Beautiful, responsive websites</p>
                    <a href="#" class="card-link">Learn More</a>
                </div>

                <div class="card">
                    <h3>Development</h3>
                    <p>Custom web applications</p>
                    <a href="#" class="card-link">Learn More</a>
                </div>

                <div class="card">
                    <h3>SEO</h3>
                    <p>Get found online</p>
                    <a href="#" class="card-link">Learn More</a>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p>&copy; 2024 MyWebsite. All rights reserved.</p>
        </div>
    </footer>

    <script src="script.js"></script>
</body>
</html>
```

### CSS (style.css):
```css
/* Mobile-First Styles */

/* Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
    font-size: 16px;
    line-height: 1.6;
    color: #333;
}

.container {
    width: 90%;
    max-width: 1200px;
    margin: 0 auto;
}

/* Header - Mobile */
.header {
    background: #333;
    color: white;
    padding: 15px 0;
    position: sticky;
    top: 0;
    z-index: 1000;
}

.header .container {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.logo h1 {
    font-size: 22px;
}

/* Hamburger */
.hamburger {
    display: flex;
    flex-direction: column;
    gap: 5px;
    background: none;
    border: none;
    cursor: pointer;
    padding: 10px;
}

.hamburger span {
    width: 30px;
    height: 3px;
    background: white;
    border-radius: 3px;
    transition: all 0.3s;
}

.hamburger.active span:nth-child(1) {
    transform: rotate(45deg) translate(8px, 8px);
}

.hamburger.active span:nth-child(2) {
    opacity: 0;
}

.hamburger.active span:nth-child(3) {
    transform: rotate(-45deg) translate(8px, -8px);
}

/* Navigation - Mobile */
.nav {
    position: fixed;
    top: 0;
    right: -100%;
    width: 70%;
    max-width: 300px;
    height: 100vh;
    background: #222;
    display: flex;
    flex-direction: column;
    padding: 80px 30px 30px;
    transition: right 0.3s;
    z-index: 999;
}

.nav.active {
    right: 0;
}

.nav a {
    color: white;
    text-decoration: none;
    padding: 15px 0;
    font-size: 18px;
    border-bottom: 1px solid rgba(255,255,255,0.1);
}

/* Hero - Mobile */
.hero {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    text-align: center;
    padding: 60px 20px;
}

.hero h2 {
    font-size: 32px;
    margin-bottom: 15px;
}

.hero p {
    font-size: 18px;
    margin-bottom: 25px;
}

/* Buttons - Touch-friendly */
.btn {
    display: inline-block;
    padding: 15px 30px; /* Minimaal 44px hoog */
    background: white;
    color: #667eea;
    text-decoration: none;
    border-radius: 30px;
    font-weight: 600;
    transition: transform 0.2s;
}

.btn:active {
    transform: scale(0.95);
}

/* Cards - Mobile (Stack) */
.cards-section {
    padding: 40px 20px;
}

.cards-section h2 {
    text-align: center;
    margin-bottom: 30px;
    font-size: 28px;
}

.cards {
    display: flex;
    flex-direction: column;
    gap: 20px;
}

.card {
    background: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    text-align: center;
}

.card h3 {
    font-size: 22px;
    margin-bottom: 10px;
    color: #667eea;
}

.card p {
    margin-bottom: 15px;
    color: #666;
}

.card-link {
    display: inline-block;
    padding: 10px 20px;
    background: #667eea;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    font-size: 14px;
    min-height: 44px;
    line-height: 24px;
}

/* Footer */
.footer {
    background: #333;
    color: white;
    text-align: center;
    padding: 30px 20px;
}

/* Tablet (768px+) */
@media (min-width: 768px) {
    /* Hide hamburger */
    .hamburger {
        display: none;
    }

    /* Normal navigation */
    .nav {
        position: static;
        width: auto;
        height: auto;
        flex-direction: row;
        padding: 0;
        gap: 25px;
        background: none;
    }

    .nav a {
        border-bottom: none;
        padding: 5px 0;
        font-size: 16px;
    }

    /* Hero */
    .hero {
        padding: 100px 40px;
    }

    .hero h2 {
        font-size: 42px;
    }

    /* Cards: 2 columns */
    .cards {
        flex-direction: row;
        flex-wrap: wrap;
    }

    .card {
        flex: 1 1 calc(50% - 20px);
    }
}

/* Desktop (1024px+) */
@media (min-width: 1024px) {
    /* Hero */
    .hero h2 {
        font-size: 52px;
    }

    /* Cards: 3 columns */
    .card {
        flex: 1 1 calc(33.333% - 20px);
    }

    /* Hover effects (desktop only) */
    @media (hover: hover) {
        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        }
    }
}
```

### JavaScript (script.js):
```javascript
const hamburger = document.getElementById('hamburger');
const nav = document.getElementById('nav');

hamburger.addEventListener('click', function() {
    hamburger.classList.toggle('active');
    nav.classList.toggle('active');
});

// Close menu when clicking a link
const navLinks = nav.querySelectorAll('a');
navLinks.forEach(link => {
    link.addEventListener('click', function() {
        hamburger.classList.remove('active');
        nav.classList.remove('active');
    });
});

// Close menu when clicking outside
document.addEventListener('click', function(event) {
    const isClickInsideNav = nav.contains(event.target);
    const isClickOnHamburger = hamburger.contains(event.target);

    if (!isClickInsideNav && !isClickOnHamburger && nav.classList.contains('active')) {
        hamburger.classList.remove('active');
        nav.classList.remove('active');
    }
});
```

---

## 11. Praktijkopdracht: Mobile-First Portfolio

### Opdracht:
Rebuild je Blok 3 eindproject met mobile-first approach en hamburger menu.

**Vereisten:**

#### 1. Mobile-First CSS
- Begin met mobile styling (< 768px)
- Voeg tablet styling toe (@media min-width: 768px)
- Voeg desktop styling toe (@media min-width: 1024px)

#### 2. Hamburger Menu
- Werkend hamburger menu op mobile
- Animatie van hamburger icon (X vorm bij open)
- Smooth slide-in animatie voor menu
- Close bij klik op link
- Desktop: normale horizontale navigatie

#### 3. Touch-Friendly
- Alle buttons minimaal 44x44px
- Links in navigatie minimaal 44px hoog
- Spacing tussen clickable elementen

#### 4. Typography
- Font-size minimaal 16px
- Responsive font-sizes met rem
- Line-height 1.6 voor teksten

#### 5. Spacing
- Mobile: 20px padding
- Tablet: 40px padding
- Desktop: 60px padding

#### 6. Testing
- Test op minimaal 3 schermformaten (320px, 768px, 1024px)
- Test hamburger menu functionaliteit
- Test touch targets (moeilijk te klikken?)

---

## Tips & Best Practices

### ✅ DO's:
- **44x44px minimum** voor alle touch targets
- **16px+ font-size** op inputs (prevent zoom)
- **Mobile-first** CSS schrijven
- **Test op echte devices** (niet alleen browser)
- **Smooth animations** (0.3s transitions)
- **Close menu** bij klik op link of buiten menu
- **Sticky header** overwegenop mobile (altijd menu bereikbaar)

### ❌ DON'Ts:
- Te kleine touch targets (<44px)
- Te kleine font-sizes (<14px)
- Hamburger menu zonder animatie (lelijk)
- Menu dat niet sluit (frustreert gebruikers)
- Desktop-first approach (meer werk)
- Zoom disablen zonder goede reden
- Horizontal scroll op mobile

---

## Samenvatting

Deze week heb je geleerd:
- ✅ Mobile-first development strategie
- ✅ Touch-friendly design (44x44px minimum)
- ✅ Hamburger menu maken (HTML, CSS, JavaScript)
- ✅ Hamburger animatie (X vorm)
- ✅ Mobile typography (16px+ minimum)
- ✅ Responsive spacing met padding/margin
- ✅ Landscape vs portrait orientation
- ✅ Touch states (:active) ipv :hover
- ✅ Scroll optimization
- ✅ Viewport settings en zoom control

**Volgende week:** Responsive formulieren - pas alles toe op je week 4 formulier project!

---

**Tip:** Test je hamburger menu op een echte mobile phone. Voelt het natuurlijk aan? Zijn alle touch targets groot genoeg? Is de animatie smooth? 📱✨
