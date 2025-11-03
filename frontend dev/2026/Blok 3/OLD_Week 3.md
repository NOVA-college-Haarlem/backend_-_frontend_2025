## Week 3: Praktische Flexbox Projecten & Complete Layouts

### Leerdoelen
Na deze les kan de student:
- Complete page layouts bouwen met Flexbox
- De "Holy Grail" layout implementeren
- Meerdere flex containers combineren in één pagina
- Een volledig responsive landing page bouwen
- Modern UI patronen toepassen (card grids, hero sections, footer layouts)
- CSS transitions gebruiken voor interactieve effecten
- Debugging van Flexbox layouts met DevTools

### Lesopbouw (90 minuten)

**1. Terugblik & DevTools Introduction (10 min)**

**Snelle terugblik:**
- "Wat doet `flex-wrap`?" (Items naar nieuwe rij laten gaan)
- "Wat is het verschil tussen `flex-grow` en `flex-basis`?"
- "Hoe maak je een responsive layout?" (Media queries)

**DevTools voor Flexbox:**
```
1. Open je website in Chrome
2. Rechtsklik op een flex container → Inspect
3. In de Styles panel zie je een badge "flex" naast display: flex
4. Klik op de badge → Flexbox overlay verschijnt!
5. Handige tools:
   - Zie de flex-direction visueel
   - Zie de justify-content spacing
   - Zie de align-items uitlijning
```

**Demonstreer dit live!**

**2. De Holy Grail Layout (25 min)**

**Uitleg:**
De "Holy Grail" is een klassieke layout die vroeger heel moeilijk was.
Met Flexbox is het simpel!

**Structuur:**
```
┌─────────────────────────────┐
│         HEADER              │
├──────┬─────────────┬────────┤
│      │             │        │
│ LEFT │   CONTENT   │ RIGHT  │
│ SIDE │             │ SIDE   │
│      │             │        │
├──────┴─────────────┴────────┤
│         FOOTER              │
└─────────────────────────────┘
```

**HTML structuur:**
```html
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Holy Grail Layout</title>
    <link rel="stylesheet" href="holy-grail.css">
</head>
<body>
    <div class="container">
        <header class="header">
            <h1>Mijn Website</h1>
            <nav>
                <a href="#home">Home</a>
                <a href="#about">Over</a>
                <a href="#contact">Contact</a>
            </nav>
        </header>

        <div class="main-content">
            <aside class="sidebar-left">
                <h2>Sidebar Links</h2>
                <ul>
                    <li><a href="#link1">Link 1</a></li>
                    <li><a href="#link2">Link 2</a></li>
                    <li><a href="#link3">Link 3</a></li>
                </ul>
            </aside>

            <main class="content">
                <h2>Hoofdinhoud</h2>
                <p>Dit is de belangrijkste content van de pagina.</p>
                <p>Deze sectie neemt het meeste ruimte in.</p>
            </main>

            <aside class="sidebar-right">
                <h2>Sidebar Rechts</h2>
                <p>Advertenties of extra info hier.</p>
            </aside>
        </div>

        <footer class="footer">
            <p>&copy; 2024 Mijn Website. Alle rechten voorbehouden.</p>
        </footer>
    </div>
</body>
</html>
```

**CSS - Stap voor stap opbouwen:**

```css
/* STAP 1: CSS Reset en variabelen */
:root {
    --header-height: 80px;
    --footer-height: 60px;
    --sidebar-width: 250px;
    --primary: #3498db;
    --dark: #2c3e50;
    --light: #ecf0f1;
    --spacing: 20px;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
}

/* STAP 2: Container - volledige viewport hoogte */
.container {
    display: flex;
    flex-direction: column;
    min-height: 100vh; /* Volledige schermhoogte */
}

/* STAP 3: Header styling */
.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: var(--dark);
    color: white;
    padding: 0 var(--spacing);
    height: var(--header-height);
}

.header nav {
    display: flex;
    gap: 20px;
}

.header nav a {
    color: white;
    text-decoration: none;
    padding: 10px 15px;
    border-radius: 5px;
    transition: background 0.3s;
}

.header nav a:hover {
    background: rgba(255, 255, 255, 0.1);
}

/* STAP 4: Main content area met 3 kolommen */
.main-content {
    display: flex;
    flex: 1; /* Neemt alle overige ruimte tussen header en footer! */
}

.sidebar-left,
.sidebar-right {
    flex: 0 0 var(--sidebar-width);
    background: var(--light);
    padding: var(--spacing);
}

.content {
    flex: 1; /* Hoofdcontent neemt overige ruimte */
    padding: var(--spacing);
    background: white;
}

/* STAP 5: Footer styling */
.footer {
    background: var(--dark);
    color: white;
    text-align: center;
    padding: 20px;
    height: var(--footer-height);
}

/* STAP 6: Responsive - Mobile first! */
@media (max-width: 768px) {
    .main-content {
        flex-direction: column; /* Stack everything vertically */
    }

    .sidebar-left,
    .sidebar-right {
        flex: 0 0 auto; /* Auto height op mobile */
    }

    .header {
        flex-direction: column;
        height: auto;
        padding: var(--spacing);
    }

    .header nav {
        margin-top: 15px;
    }
}
```

**Belangrijke concepten uitleggen:**
1. **`min-height: 100vh`** - Footer blijft altijd onderaan, ook bij weinig content
2. **Geneste flex containers** - `.container` EN `.main-content` zijn beide flex!
3. **`flex: 1` op main-content** - Vult ruimte tussen header en footer
4. **`flex: 1` op content** - Vult ruimte tussen sidebars

**Laat studenten dit volledig nabouwen!**

**3. Hero Section (20 min)**

**Uitleg:**
Een "hero section" is het grote prominente deel bovenaan een website.
Vaak met grote tekst en een call-to-action button.

**HTML:**
```html
<section class="hero">
    <div class="hero-content">
        <h1>Welkom bij Onze Service</h1>
        <p>De beste oplossing voor al jouw problemen</p>
        <button class="cta-button">Aan de slag</button>
    </div>
</section>
```

**CSS:**
```css
.hero {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 600px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    text-align: center;
    position: relative;
    overflow: hidden;
}

/* Optioneel: subtiele achtergrond pattern */
.hero::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: url('data:image/svg+xml,<svg width="100" height="100" xmlns="http://www.w3.org/2000/svg"><circle cx="50" cy="50" r="40" fill="rgba(255,255,255,0.05)"/></svg>');
    opacity: 0.5;
}

.hero-content {
    position: relative;
    z-index: 1;
    max-width: 800px;
    padding: 40px;
}

.hero h1 {
    font-size: 48px;
    margin-bottom: 20px;
    animation: fadeInUp 1s ease-out;
}

.hero p {
    font-size: 24px;
    margin-bottom: 30px;
    animation: fadeInUp 1s ease-out 0.2s backwards;
}

.cta-button {
    background: white;
    color: #667eea;
    border: none;
    padding: 15px 40px;
    font-size: 18px;
    border-radius: 50px;
    cursor: pointer;
    transition: transform 0.3s, box-shadow 0.3s;
    animation: fadeInUp 1s ease-out 0.4s backwards;
}

.cta-button:hover {
    transform: translateY(-3px);
    box-shadow: 0 10px 20px rgba(0,0,0,0.2);
}

/* Animaties */
@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Responsive */
@media (max-width: 768px) {
    .hero h1 {
        font-size: 32px;
    }

    .hero p {
        font-size: 18px;
    }

    .cta-button {
        padding: 12px 30px;
        font-size: 16px;
    }
}
```

**Nieuwe concepten:**
- **Linear gradient** - Mooie kleurverloop achtergrond
- **CSS Animations** - `@keyframes` voor bewegende elementen
- **Pseudo-element** - `::before` voor extra styling laag
- **Z-index** - Laagjes boven elkaar
- **Transform** - Elementen verplaatsen/schalen zonder layout te beïnvloeden

**4. Feature Cards Section (20 min)**

**HTML:**
```html
<section class="features">
    <h2 class="section-title">Onze Diensten</h2>
    <div class="features-grid">
        <div class="feature-card">
            <div class="icon">🚀</div>
            <h3>Snel</h3>
            <p>Razendsnelle prestaties voor je website</p>
        </div>
        <div class="feature-card">
            <div class="icon">🔒</div>
            <h3>Veilig</h3>
            <p>Maximale beveiliging voor je gegevens</p>
        </div>
        <div class="feature-card">
            <div class="icon">📱</div>
            <h3>Responsive</h3>
            <p>Perfect op elk apparaat</p>
        </div>
        <div class="feature-card">
            <div class="icon">💎</div>
            <h3>Premium</h3>
            <p>Hoogwaardige kwaliteit gegarandeerd</p>
        </div>
    </div>
</section>
```

**CSS:**
```css
.features {
    padding: 80px 20px;
    background: #f8f9fa;
}

.section-title {
    text-align: center;
    font-size: 36px;
    color: var(--dark);
    margin-bottom: 60px;
}

.features-grid {
    display: flex;
    flex-wrap: wrap;
    gap: 30px;
    max-width: 1200px;
    margin: 0 auto;
}

.feature-card {
    flex: 0 0 calc(50% - 15px); /* 2 kolommen op tablet */
    background: white;
    padding: 40px;
    border-radius: 10px;
    text-align: center;
    box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    transition: transform 0.3s, box-shadow 0.3s;
}

.feature-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 12px 24px rgba(0,0,0,0.15);
}

.icon {
    font-size: 64px;
    margin-bottom: 20px;
}

.feature-card h3 {
    font-size: 24px;
    color: var(--dark);
    margin-bottom: 15px;
}

.feature-card p {
    color: #666;
    line-height: 1.6;
}

/* Responsive breakpoints */
@media (max-width: 768px) {
    .feature-card {
        flex: 0 0 100%; /* 1 kolom op mobile */
    }
}

@media (min-width: 1024px) {
    .feature-card {
        flex: 0 0 calc(25% - 22.5px); /* 4 kolommen op desktop */
    }
}
```

**5. Modern Footer (15 min)**

**HTML:**
```html
<footer class="modern-footer">
    <div class="footer-content">
        <div class="footer-section">
            <h3>Over Ons</h3>
            <p>Wij zijn een innovatief bedrijf dat geweldige producten maakt.</p>
        </div>
        <div class="footer-section">
            <h3>Snelle Links</h3>
            <ul>
                <li><a href="#home">Home</a></li>
                <li><a href="#diensten">Diensten</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
        </div>
        <div class="footer-section">
            <h3>Contact</h3>
            <p>Email: info@example.com</p>
            <p>Tel: 06-12345678</p>
        </div>
        <div class="footer-section">
            <h3>Volg Ons</h3>
            <div class="social-links">
                <a href="#" class="social-icon">📘</a>
                <a href="#" class="social-icon">📸</a>
                <a href="#" class="social-icon">🐦</a>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; 2024 Bedrijfsnaam. Alle rechten voorbehouden.</p>
    </div>
</footer>
```

**CSS:**
```css
.modern-footer {
    background: var(--dark);
    color: white;
    padding: 60px 20px 20px;
}

.footer-content {
    display: flex;
    flex-wrap: wrap;
    gap: 40px;
    max-width: 1200px;
    margin: 0 auto 40px;
}

.footer-section {
    flex: 1 1 250px; /* Groeit, krimpt, min 250px breed */
}

.footer-section h3 {
    margin-bottom: 20px;
    font-size: 20px;
}

.footer-section ul {
    list-style: none;
}

.footer-section ul li {
    margin-bottom: 10px;
}

.footer-section a {
    color: #bbb;
    text-decoration: none;
    transition: color 0.3s;
}

.footer-section a:hover {
    color: white;
}

.social-links {
    display: flex;
    gap: 15px;
}

.social-icon {
    font-size: 32px;
    transition: transform 0.3s;
}

.social-icon:hover {
    transform: scale(1.2);
}

.footer-bottom {
    text-align: center;
    padding-top: 20px;
    border-top: 1px solid rgba(255,255,255,0.1);
    color: #888;
}

/* Responsive */
@media (max-width: 768px) {
    .footer-content {
        flex-direction: column;
    }
}
```

### Grote Praktische Opdracht: Complete Landing Page (Zelfstandig maken)

**Opdracht:**
Bouw een complete, responsive landing page met alle onderdelen:

**Vereiste secties:**
1. **Header/Navigatie**
   - Logo links
   - Navigatie links (Home, Diensten, Over, Contact)
   - "Login" button rechts
   - Sticky (blijft bovenaan bij scrollen)

2. **Hero Section**
   - Grote titel
   - Ondertitel
   - Call-to-action button
   - Achtergrond gradient of afbeelding

3. **Features Section**
   - 3 of 4 feature cards
   - Iconen (gebruik emoji's of font-awesome)
   - Responsive: 1 kolom mobile, 2 kolommen tablet, 3-4 kolommen desktop

4. **Content Section**
   - Afbeelding links, tekst rechts (of andersom)
   - Responsive: onder elkaar op mobile

5. **Testimonials/Reviews** (optioneel)
   - 2-3 review cards
   - Responsive grid

6. **Footer**
   - Minstens 3 kolommen met informatie
   - Copyright tekst onderaan

**Technische vereisten:**
- Gebruik CSS variabelen voor je kleuren/spacing
- Gebruik Flexbox voor ALLE layouts (geen Grid!)
- Volledig responsive (mobile, tablet, desktop)
- Smooth transitions op hover effecten
- Nette code met comments
- Mobile-first approach (media queries met min-width)

**Bonus punten:**
- CSS animaties op hero section
- Scroll-smooth behavior
- Sticky header
- Hamburger menu op mobile (alleen CSS!)

**Voorbeeld Sticky Header CSS:**
```css
.header {
    position: sticky;
    top: 0;
    z-index: 100;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}
```

**Voorbeeld Smooth Scroll:**
```css
html {
    scroll-behavior: smooth;
}
```

### Huiswerk

**Hoofdopdracht: Landing Page Afmaken**
Maak je landing page volledig af met alle vereiste secties.

**Opdracht 2: Flexbox Cheat Sheet**
Maak een HTML pagina die werkt als een "cheat sheet" voor jezelf.
Toon voorbeelden van:
- Alle `justify-content` waarden
- Alle `align-items` waarden
- Alle `flex-direction` waarden
- `flex-wrap` voorbeelden
- `flex-grow`, `flex-shrink`, `flex-basis` voorbeelden

Maak het visueel duidelijk met borders en verschillende kleuren.

**Opdracht 3: Portfolio Setup**
Begin alvast na te denken over je eigen portfolio website:
- Welke secties wil je hebben?
- Welke kleuren ga je gebruiken?
- Welke projecten ga je laten zien?
- Maak een schets (op papier of digitaal)

### Tips & Tricks

**1. Centreren van alles:**
```css
.center-everything {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}
```

**2. Flexbox debugging:**
```css
/* Tijdelijk toevoegen om problemen te zien */
* {
    border: 1px solid red;
}

.container {
    border: 3px solid blue;
}
```

**3. Responsive breakpoints onthouden:**
```css
/* Mobile First approach */
/* Default CSS = Mobile (0-767px) */

@media (min-width: 768px) { /* Tablet */ }
@media (min-width: 1024px) { /* Desktop */ }
@media (min-width: 1440px) { /* Large Desktop */ }
```

**4. Snelle color schemes:**
```css
/* Blauw thema */
--primary: #3498db;
--secondary: #2ecc71;
--dark: #2c3e50;

/* Paars thema */
--primary: #9b59b6;
--secondary: #e74c3c;
--dark: #34495e;

/* Groen thema */
--primary: #27ae60;
--secondary: #f39c12;
--dark: #2c3e50;
```

**5. Box-sizing reset (altijd gebruiken!):**
```css
* {
    box-sizing: border-box;
}
```

### Resources

- [CSS Tricks - Complete Guide to Flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)
- [Flexbox Froggy](https://flexboxfroggy.com/) - Game om Flexbox te leren
- [Flexbox Defense](http://www.flexboxdefense.com/) - Nog een game!
- [Can I Use](https://caniuse.com/) - Check browser support

### Volgende Stappen

Na deze 3 weken Flexbox ga je verder met:
- CSS Grid (nog krachtiger layouts!)
- JavaScript basics
- Interactieve elementen
- Forms en validatie
- En meer...

Goed gedaan! Je hebt nu een sterke basis in modern CSS layout! 🎉

---
