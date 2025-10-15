# Frontend Ontwikkeling - Blok 2

## Week 5: Lijsten en Navigatie

### Algemene Informatie
- **Doelgroep:** MBO studenten
- **Lesduur:** 90 minuten
- **Voorkennis:** HTML lists, CSS selectoren, hover effecten
- **Tools:** VS Code, Browser

---

### Leerdoelen
Na deze les kan de student:
- HTML lists stylen (`<ul>`, `<ol>`, `<li>`)
- List-style properties gebruiken
- Horizontale navigatie maken (zonder Flexbox)
- Verticale/sidebar navigatie stylen
- Active/current state toevoegen aan links
- Dropdown menu hints maken
- Footer link groepen stylen
- Breadcrumb navigatie maken

---

### Lesopbouw (90 minuten)

**1. HTML Lists Herhaling (10 min)**

**Twee soorten lists:**

```html
<!-- Unordered List (bullets) -->
<ul>
    <li>Item 1</li>
    <li>Item 2</li>
    <li>Item 3</li>
</ul>

<!-- Ordered List (nummers) -->
<ol>
    <li>Stap 1</li>
    <li>Stap 2</li>
    <li>Stap 3</li>
</ol>
```

**Wanneer gebruik je wat?**
- `<ul>`: Volgorde maakt niet uit (navigatie, features, links)
- `<ol>`: Volgorde is belangrijk (stappen, rankings, instructions)

---

**2. List Styling Basics (15 min)**

**list-style-type:**
```css
/* Bullets weghalen */
ul {
    list-style-type: none;
}

/* Verschillende bullets */
ul { list-style-type: disc; }    /* ● Standaard */
ul { list-style-type: circle; }  /* ○ Holle cirkel */
ul { list-style-type: square; }  /* ■ Vierkant */

/* Nummers stylen */
ol { list-style-type: decimal; }     /* 1, 2, 3 */
ol { list-style-type: upper-alpha; } /* A, B, C */
ol { list-style-type: lower-roman; } /* i, ii, iii */
```

**list-style-position:**
```css
ul {
    list-style-position: outside;  /* Standaard */
}

ul {
    list-style-position: inside;  /* Bullets binnen tekst */
}
```

**Padding en margin resetten:**
```css
ul, ol {
    padding: 0;
    margin: 0;
    list-style: none;  /* Shorthand: verwijdert bullets EN padding */
}
```

**Custom bullets met emoji's:**
```html
<ul class="custom-list">
    <li>✅ Afgerond</li>
    <li>⏳ In Progress</li>
    <li>❌ Te Doen</li>
</ul>
```

```css
.custom-list {
    list-style: none;
    padding: 0;
}

.custom-list li {
    padding-left: 25px;
    margin-bottom: 10px;
}
```

**Oefening 1 (5 min):**
Maak een lijst met 5 items en probeer 3 verschillende list-style-types uit.

---

**3. Horizontale Navigatie Maken (20 min)**

**HTML Structuur:**
```html
<nav class="horizontal-nav">
    <ul>
        <li><a href="#home">Home</a></li>
        <li><a href="#about">Over</a></li>
        <li><a href="#services">Diensten</a></li>
        <li><a href="#contact">Contact</a></li>
    </ul>
</nav>
```

**Methode 1: display: inline-block**
```css
.horizontal-nav ul {
    list-style: none;
    padding: 0;
    margin: 0;
    background-color: #333;
}

.horizontal-nav li {
    display: inline-block;  /* Naast elkaar */
}

.horizontal-nav a {
    display: block;
    padding: 15px 20px;
    color: white;
    text-decoration: none;
    transition: background-color 0.3s;
}

.horizontal-nav a:hover {
    background-color: #555;
}
```

**Methode 2: float (ouderwets)**
```css
.horizontal-nav li {
    float: left;
}

.horizontal-nav::after {
    content: "";
    display: table;
    clear: both;
}
```

**Stap voor stap samen opbouwen:**

Stap 1: Bullets weg, basis styling
```css
.horizontal-nav ul {
    list-style: none;
    padding: 0;
    margin: 0;
    background-color: #333;
}
```

Stap 2: Li's naast elkaar
```css
.horizontal-nav li {
    display: inline-block;
}
```

Stap 3: Links stylen
```css
.horizontal-nav a {
    display: block;
    padding: 15px 20px;
    color: white;
    text-decoration: none;
}
```

Stap 4: Hover effect
```css
.horizontal-nav a:hover {
    background-color: #555;
}
```

**Oefening 2 (10 min):**
Maak een horizontale navigatie met 5 links en jouw favoriete kleuren.

---

**4. Active/Current State (10 min)**

**Wat is een active state?**
Laat zien op welke pagina je bent.

**HTML:**
```html
<nav>
    <ul>
        <li><a href="#home" class="active">Home</a></li>
        <li><a href="#about">Over</a></li>
        <li><a href="#contact">Contact</a></li>
    </ul>
</nav>
```

**CSS:**
```css
.horizontal-nav a {
    color: white;
    /* ... basis styling ... */
}

.horizontal-nav a.active {
    background-color: #007bff;
    font-weight: bold;
}

/* Of met :hover stijl */
.horizontal-nav a.active {
    background-color: #555;
    border-bottom: 3px solid #007bff;
}
```

**Met pseudo-class :active (bij klikken):**
```css
.horizontal-nav a:active {
    background-color: #000;
}
```

**Oefening 3 (5 min):**
Voeg een active state toe aan je navigatie.

---

**5. Verticale/Sidebar Navigatie (15 min)**

**HTML:**
```html
<nav class="sidebar-nav">
    <ul>
        <li><a href="#dashboard">📊 Dashboard</a></li>
        <li><a href="#profile">👤 Profile</a></li>
        <li><a href="#settings">⚙️ Settings</a></li>
        <li><a href="#logout">🚪 Logout</a></li>
    </ul>
</nav>
```

**CSS:**
```css
.sidebar-nav {
    width: 250px;
    background-color: #2c3e50;
}

.sidebar-nav ul {
    list-style: none;
    padding: 0;
    margin: 0;
}

.sidebar-nav li {
    /* Niet inline-block! Gewoon block (standaard) */
}

.sidebar-nav a {
    display: block;
    padding: 15px 20px;
    color: white;
    text-decoration: none;
    border-left: 3px solid transparent;
    transition: all 0.3s;
}

.sidebar-nav a:hover {
    background-color: #34495e;
    border-left-color: #3498db;
    padding-left: 25px;  /* Schuift iets naar rechts */
}

.sidebar-nav a.active {
    background-color: #34495e;
    border-left-color: #3498db;
}
```

**Sub-menu (nested list):**
```html
<nav class="sidebar-nav">
    <ul>
        <li>
            <a href="#products">Producten</a>
            <ul class="submenu">
                <li><a href="#laptops">Laptops</a></li>
                <li><a href="#phones">Telefoons</a></li>
            </ul>
        </li>
    </ul>
</nav>
```

```css
.submenu {
    padding-left: 20px;
    display: none;  /* Verborgen, later toggle met JS */
}

.submenu li a {
    font-size: 14px;
    padding: 10px 20px;
}
```

**Oefening 4 (10 min):**
Maak een verticale sidebar navigatie met emoji's en hover effecten.

---

**6. Breadcrumb Navigatie (10 min)**

**Wat zijn breadcrumbs?**
"Je bent hier" pad: Home > Producten > Laptops

**HTML:**
```html
<nav class="breadcrumb">
    <ul>
        <li><a href="#home">Home</a></li>
        <li><a href="#products">Producten</a></li>
        <li>Laptops</li>
    </ul>
</nav>
```

**CSS:**
```css
.breadcrumb ul {
    list-style: none;
    padding: 10px 0;
    margin: 0;
}

.breadcrumb li {
    display: inline;
    font-size: 14px;
    color: #666;
}

.breadcrumb li + li::before {
    content: " > ";  /* Pijltje tussen items */
    padding: 0 8px;
    color: #999;
}

.breadcrumb a {
    color: #007bff;
    text-decoration: none;
}

.breadcrumb a:hover {
    text-decoration: underline;
}
```

**Met emoji pijltjes:**
```css
.breadcrumb li + li::before {
    content: " → ";  /* Of: " / " */
}
```

---

**7. Footer Link Groepen (10 min)**

**HTML:**
```html
<footer>
    <div class="footer-links">
        <div class="link-group">
            <h4>Bedrijf</h4>
            <ul>
                <li><a href="#about">Over Ons</a></li>
                <li><a href="#team">Team</a></li>
                <li><a href="#careers">Vacatures</a></li>
            </ul>
        </div>

        <div class="link-group">
            <h4>Support</h4>
            <ul>
                <li><a href="#help">Help Center</a></li>
                <li><a href="#contact">Contact</a></li>
                <li><a href="#faq">FAQ</a></li>
            </ul>
        </div>
    </div>
</footer>
```

**CSS:**
```css
footer {
    background-color: #2c3e50;
    color: white;
    padding: 40px 20px;
}

.footer-links {
    max-width: 1200px;
    margin: 0 auto;
}

.link-group {
    display: inline-block;
    vertical-align: top;
    margin-right: 60px;
}

.link-group h4 {
    margin-bottom: 15px;
    font-size: 16px;
}

.link-group ul {
    list-style: none;
    padding: 0;
}

.link-group li {
    margin-bottom: 10px;
}

.link-group a {
    color: #bdc3c7;
    text-decoration: none;
    font-size: 14px;
}

.link-group a:hover {
    color: white;
}
```

---

**8. Grote Oefening: Complete Navigation System (10 min)**

**Opdracht:**
Maak een pagina met 3 navigatie types:

1. **Top Navigatie** (horizontaal)
   - 5 links
   - Hover effect
   - Active state

2. **Sidebar Navigatie** (verticaal)
   - 6 links met emoji's
   - Hover effect met border-left
   - Active state

3. **Breadcrumb**
   - Home > Section > Page
   - Met pijltjes

4. **Footer Links**
   - 3 kolommen
   - Elk met titel en 4 links

---

### Huiswerk

**Hoofdopdracht: Navigation Library**

Maak een HTML pagina met 6 verschillende navigatie stijlen:

1. **Dark Top Navigation**
   - Donkere achtergrond (#333)
   - Witte tekst
   - Hover effect
   - Active state

2. **Light Top Navigation**
   - Lichte achtergrond (#f8f9fa)
   - Donkere tekst
   - Border-bottom bij hover/active

3. **Colored Sidebar Navigation**
   - Je favoriete kleur als achtergrond
   - Emoji's voor elk item
   - Slide in effect bij hover (padding-left groter)

4. **Minimal Breadcrumb**
   - Simpele pijltjes
   - Subtiele kleuren

5. **Footer Link Groups**
   - 4 kolommen met links
   - Social media sectie

6. **Dropdown Hint**
   - Link met "▼" om aan te geven dat er submenu is
   - Submenu altijd zichtbaar (geen JS toggle)

**Technische eisen:**
- Alle navigaties gebruiken `<ul>` en `<li>`
- list-style: none overal
- Hover effecten met transitions
- Active states duidelijk zichtbaar
- Nette CSS met comments

**Opdracht 2: Eigen Portfolio Navigation**

Maak navigatie voor je eindproject portfolio:
- Top navigatie met je secties (Home, Projecten, Over, Contact)
- Kies een stijl die bij jou past
- Mobile versie: alle links onder elkaar (media query!)

**Opdracht 3: Inspiratie Onderzoek**

Bezoek 5 websites en screenshot hun navigatie:
- Welke styles gebruiken ze?
- Horizontal of vertical?
- Welke hover effecten?
- Active states?

Documenteer je bevindingen.

---

### Controlelijst voor Docent
- [ ] Studenten kunnen list-style properties gebruiken
- [ ] Studenten kunnen horizontale navigatie maken
- [ ] Studenten kunnen verticale navigatie stylen
- [ ] Studenten kunnen active states toevoegen
- [ ] Studenten kunnen breadcrumbs maken
- [ ] Studenten kunnen footer link groepen maken

### Tips voor Docent
- **Laat echte websites zien:** Navigatie is overal!
- **DevTools:** Inspecteer navigatie van bekende sites
- **display: inline-block** kan lastig zijn - herhaal het!
- **Veelgemaakte fout:** list-style vergeten te verwijderen
- **Veelgemaakte fout:** padding/margin niet resetten
- **Motivatie:** "Navigatie is essentieel voor elke website!"
- **Live coding:** Bouw samen een navigatie vanaf scratch

### Resources
- [Navigation Examples](https://codepen.io/search/pens?q=navigation)
- [CSS Navigation Tutorial](https://www.w3schools.com/css/css_navbar.asp)

---
