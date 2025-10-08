## Week 2: Advanced Flexbox & Responsive Design

### Leerdoelen
Na deze les kan de student:
- De flex item properties gebruiken: `flex-grow`, `flex-shrink`, `flex-basis`
- De `flex` shorthand property toepassen
- `flex-wrap` gebruiken voor meerdere rijen
- `align-content` toepassen bij meerdere rijen
- CSS variabelen aanmaken en gebruiken voor consistent design
- Media queries toepassen voor responsive layouts
- Een responsive image gallery bouwen

### Lesopbouw (90 minuten)

**1. Terugblik & Warm-up (10 min)**

**Snelle quiz:**
- "Wat doet `display: flex`?" (Maakt container een flex container)
- "Wat is het verschil tussen `justify-content` en `align-items`?" (Horizontaal vs verticaal)
- "Hoe centreer je iets perfect?" (justify-content: center + align-items: center)

**Huiswerk bespreken:**
- Laat een paar studenten hun card layout laten zien
- Bespreek eventuele problemen

**2. Flex-Wrap: Meerdere Rijen (15 min)**

**Het probleem:**
```html
<div class="container">
    <div class="box">1</div>
    <div class="box">2</div>
    <div class="box">3</div>
    <div class="box">4</div>
    <div class="box">5</div>
    <div class="box">6</div>
</div>
```

```css
.container {
    display: flex;
    border: 2px solid black;
    width: 500px;
}

.box {
    background: lightblue;
    padding: 20px;
    width: 150px;
    margin: 5px;
}
```

**Probleem:** Als de container te smal is, worden de boxes geperst!

**De oplossing: flex-wrap**
```css
.container {
    display: flex;
    flex-wrap: wrap; /* Items gaan naar nieuwe rij */
    width: 500px;
}
```

**Drie waarden:**
```css
flex-wrap: nowrap;     /* Standaard: alles op 1 rij */
flex-wrap: wrap;       /* Items wrappen naar volgende rij */
flex-wrap: wrap-reverse; /* Wrappen, maar van beneden naar boven */
```

**Praktisch voorbeeld - Responsive card grid:**
```html
<div class="card-grid">
    <div class="card">Card 1</div>
    <div class="card">Card 2</div>
    <div class="card">Card 3</div>
    <div class="card">Card 4</div>
    <div class="card">Card 5</div>
    <div class="card">Card 6</div>
</div>
```

```css
.card-grid {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    padding: 20px;
}

.card {
    background: #3498db;
    color: white;
    padding: 40px;
    width: 200px;
    border-radius: 8px;
}
```

**3. Align-Content: Meerdere Rijen Uitlijnen (10 min)**

**Uitleg:**
`align-content` werkt alleen bij meerdere rijen (met `flex-wrap: wrap`).
Het lijnt de **rijen zelf** uit, niet de items.

```css
.container {
    display: flex;
    flex-wrap: wrap;
    align-content: flex-start; /* Rijen bovenaan */
    height: 600px; /* Hoogte nodig om effect te zien */
}
```

**Waarden (vergelijkbaar met justify-content):**
```css
align-content: flex-start;   /* Rijen bovenaan */
align-content: flex-end;     /* Rijen onderaan */
align-content: center;       /* Rijen gecentreerd */
align-content: space-between; /* Ruimte tussen rijen */
align-content: space-around;  /* Ruimte rondom rijen */
align-content: space-evenly;  /* Gelijke ruimte */
```

**4. Flex Item Properties (25 min)**

**Introductie:**
Tot nu toe hebben we alleen de **container** gestyled.
Nu gaan we individuele **items** controleren!

**A. Flex-Grow: Items laten groeien**

```html
<div class="container">
    <div class="item item-1">Item 1</div>
    <div class="item item-2">Item 2</div>
    <div class="item item-3">Item 3</div>
</div>
```

```css
.container {
    display: flex;
    gap: 10px;
}

.item {
    background: lightcoral;
    padding: 20px;
}

.item-1 {
    flex-grow: 1; /* Neemt 1 deel van beschikbare ruimte */
}

.item-2 {
    flex-grow: 2; /* Neemt 2 delen van beschikbare ruimte */
}

.item-3 {
    flex-grow: 1; /* Neemt 1 deel van beschikbare ruimte */
}
```

**Uitleg:**
- `flex-grow: 0` (standaard): Item groeit niet
- `flex-grow: 1`: Item krijgt 1 deel van de beschikbare ruimte
- `flex-grow: 2`: Item krijgt 2x zoveel ruimte als een item met flex-grow: 1

**B. Flex-Shrink: Items laten krimpen**

```css
.item {
    flex-shrink: 1; /* Standaard: items mogen krimpen */
}

.item-2 {
    flex-shrink: 0; /* Deze mag NIET krimpen */
    width: 300px;
}
```

**Praktisch gebruik:**
```css
/* Logo mag niet krimpen in navigatiebalk */
.logo {
    flex-shrink: 0;
    width: 150px;
}
```

**C. Flex-Basis: Startgrootte bepalen**

```css
.item {
    flex-basis: 200px; /* Startbreedte van 200px */
}
```

**Verschil met width:**
- `width`: Vaste breedte
- `flex-basis`: Startpunt, maar kan groeien/krimpen

**D. Flex Shorthand (BELANGRIJK!)**

In plaats van drie properties, gebruik je meestal de shorthand:

```css
/* Volledig: */
.item {
    flex-grow: 1;
    flex-shrink: 1;
    flex-basis: 200px;
}

/* Shorthand: */
.item {
    flex: 1 1 200px;
    /* grow | shrink | basis */
}
```

**Veel gebruikte patronen:**
```css
/* Item neemt gelijke ruimte */
flex: 1;
/* Betekent: flex: 1 1 0 */

/* Item heeft vaste breedte, mag niet groeien/krimpen */
flex: 0 0 250px;

/* Item mag groeien maar niet krimpen */
flex: 1 0 auto;
```

**Praktisch voorbeeld - Dashboard layout:**
```html
<div class="dashboard">
    <aside class="sidebar">Sidebar</aside>
    <main class="content">Hoofdinhoud</main>
</div>
```

```css
.dashboard {
    display: flex;
    height: 100vh;
}

.sidebar {
    flex: 0 0 250px; /* Vaste breedte, mag niet groeien/krimpen */
    background: #34495e;
    color: white;
    padding: 20px;
}

.content {
    flex: 1; /* Neemt alle overige ruimte */
    background: #ecf0f1;
    padding: 20px;
}
```

**5. CSS Variabelen (15 min)**

**Probleem schetsen:**
Stel je voor: je gebruikt overal de kleur `#3498db`, maar de klant wil een andere kleur.
Je moet dan 50+ plekken aanpassen!

**De oplossing: CSS Variabelen**

```css
/* Definieer variabelen in :root (geldt voor hele document) */
:root {
    --primary-color: #3498db;
    --secondary-color: #2ecc71;
    --text-dark: #2c3e50;
    --spacing: 20px;
    --border-radius: 8px;
}

/* Gebruik variabelen met var() */
.card {
    background: var(--primary-color);
    color: white;
    padding: var(--spacing);
    border-radius: var(--border-radius);
}

.button {
    background: var(--secondary-color);
    padding: var(--spacing);
    border-radius: var(--border-radius);
}
```

**Voordelen:**
- Eén plek aanpassen = overal aangepast
- Consistentie in je design
- Makkelijker te onderhouden

**Praktisch voorbeeld - Complete theme:**
```css
:root {
    /* Kleuren */
    --primary: #3498db;
    --secondary: #2ecc71;
    --danger: #e74c3c;
    --dark: #2c3e50;
    --light: #ecf0f1;

    /* Spacing */
    --spacing-sm: 10px;
    --spacing-md: 20px;
    --spacing-lg: 40px;

    /* Typography */
    --font-size-sm: 14px;
    --font-size-md: 16px;
    --font-size-lg: 24px;

    /* Border */
    --radius: 8px;
    --border: 2px solid var(--dark);
}

/* Nu overal gebruiken */
.card {
    background: var(--light);
    border: var(--border);
    border-radius: var(--radius);
    padding: var(--spacing-md);
}

.card h2 {
    color: var(--primary);
    font-size: var(--font-size-lg);
    margin-bottom: var(--spacing-sm);
}
```

**6. Responsive Design met Media Queries (15 min)**

**Uitleg:**
Media queries passen je CSS aan op basis van schermgrootte.

**Basis syntax:**
```css
/* Standaard CSS voor mobile (mobile-first approach) */
.container {
    flex-direction: column;
}

/* Vanaf 768px breed (tablets) */
@media (min-width: 768px) {
    .container {
        flex-direction: row;
    }
}

/* Vanaf 1024px breed (desktop) */
@media (min-width: 1024px) {
    .container {
        max-width: 1200px;
        margin: 0 auto;
    }
}
```

**Standaard breakpoints:**
```css
/* Mobile: 0 - 767px (geen media query nodig, dit is standaard) */

/* Tablet: 768px - 1023px */
@media (min-width: 768px) {
    /* Tablet styles */
}

/* Desktop: 1024px en groter */
@media (min-width: 1024px) {
    /* Desktop styles */
}

/* Large desktop: 1440px en groter */
@media (min-width: 1440px) {
    /* Large desktop styles */
}
```

**Responsive Card Grid:**
```html
<div class="responsive-grid">
    <div class="card">Card 1</div>
    <div class="card">Card 2</div>
    <div class="card">Card 3</div>
    <div class="card">Card 4</div>
    <div class="card">Card 5</div>
    <div class="card">Card 6</div>
</div>
```

```css
:root {
    --card-gap: 20px;
    --primary: #3498db;
}

/* Mobile: 1 kolom */
.responsive-grid {
    display: flex;
    flex-wrap: wrap;
    gap: var(--card-gap);
    padding: var(--card-gap);
}

.card {
    flex: 0 0 100%; /* Volledige breedte op mobile */
    background: var(--primary);
    color: white;
    padding: 30px;
    border-radius: 8px;
}

/* Tablet: 2 kolommen */
@media (min-width: 768px) {
    .card {
        flex: 0 0 calc(50% - var(--card-gap) / 2);
        /* 50% breedte min halve gap */
    }
}

/* Desktop: 3 kolommen */
@media (min-width: 1024px) {
    .card {
        flex: 0 0 calc(33.333% - var(--card-gap) * 2 / 3);
        /* 33.333% breedte min 2/3 van gap */
    }
}
```

**Responsive navigatie:**
```css
/* Mobile: verticale navigatie */
.nav {
    display: flex;
    flex-direction: column;
}

/* Desktop: horizontale navigatie */
@media (min-width: 768px) {
    .nav {
        flex-direction: row;
        justify-content: space-between;
    }
}
```

### Praktische Opdracht: Responsive Image Gallery

**HTML:**
```html
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Responsive Gallery</title>
    <link rel="stylesheet" href="gallery.css">
</head>
<body>
    <div class="gallery">
        <div class="gallery-item">
            <img src="https://picsum.photos/400/300?random=1" alt="Foto 1">
            <h3>Foto Titel 1</h3>
        </div>
        <div class="gallery-item">
            <img src="https://picsum.photos/400/300?random=2" alt="Foto 2">
            <h3>Foto Titel 2</h3>
        </div>
        <div class="gallery-item">
            <img src="https://picsum.photos/400/300?random=3" alt="Foto 3">
            <h3>Foto Titel 3</h3>
        </div>
        <div class="gallery-item">
            <img src="https://picsum.photos/400/300?random=4" alt="Foto 4">
            <h3>Foto Titel 4</h3>
        </div>
        <div class="gallery-item">
            <img src="https://picsum.photos/400/300?random=5" alt="Foto 5">
            <h3>Foto Titel 5</h3>
        </div>
        <div class="gallery-item">
            <img src="https://picsum.photos/400/300?random=6" alt="Foto 6">
            <h3>Foto Titel 6</h3>
        </div>
    </div>
</body>
</html>
```

**CSS:**
```css
:root {
    --primary: #3498db;
    --dark: #2c3e50;
    --gap: 20px;
    --radius: 10px;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    background: #f5f5f5;
    padding: var(--gap);
}

/* Gallery container */
.gallery {
    display: flex;
    flex-wrap: wrap;
    gap: var(--gap);
    max-width: 1200px;
    margin: 0 auto;
}

/* Gallery items - mobile: 1 kolom */
.gallery-item {
    flex: 0 0 100%;
    background: white;
    border-radius: var(--radius);
    overflow: hidden;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    transition: transform 0.3s, box-shadow 0.3s;
}

.gallery-item:hover {
    transform: translateY(-5px);
    box-shadow: 0 4px 16px rgba(0,0,0,0.2);
}

.gallery-item img {
    width: 100%;
    height: 250px;
    object-fit: cover;
    display: block;
}

.gallery-item h3 {
    padding: 15px;
    color: var(--dark);
}

/* Tablet: 2 kolommen */
@media (min-width: 768px) {
    .gallery-item {
        flex: 0 0 calc(50% - var(--gap) / 2);
    }
}

/* Desktop: 3 kolommen */
@media (min-width: 1024px) {
    .gallery-item {
        flex: 0 0 calc(33.333% - var(--gap) * 2 / 3);
    }
}
```

**Belangrijke onderdelen uitleggen:**
- `<meta name="viewport">` - Essentieel voor responsive design!
- `object-fit: cover` - Afbeelding vult de ruimte zonder vervorming
- `calc()` - Berekeningen in CSS voor perfecte breedtes
- `transition` - Smooth hover effecten

### Huiswerk

**Opdracht 1: Responsive Product Grid**
Maak een product pagina met:
- Minstens 8 producten (elk met afbeelding, titel, prijs)
- Mobile: 1 kolom
- Tablet: 2 kolommen
- Desktop: 4 kolommen
- Gebruik CSS variabelen voor kleuren en spacing
- Hover effect op producten

**Opdracht 2: Responsive Dashboard**
Maak een simpel dashboard layout:
- Sidebar (250px breed op desktop, full-width op mobile)
- Hoofdcontent (neemt overige ruimte)
- In hoofdcontent: 3 statistiek cards naast elkaar (responsive!)

**Tip voor sidebar op mobile:**
```css
/* Mobile: sidebar bovenaan, full width */
@media (max-width: 767px) {
    .dashboard {
        flex-direction: column;
    }
    .sidebar {
        flex: 0 0 auto;
    }
}
```

**Opdracht 3: Experimenteer met Flex properties**
Maak een pagina met 3 verschillende layouts die laten zien:
1. Drie items waar het middelste 2x zo breed is (flex-grow)
2. Een item dat niet mag krimpen (flex-shrink: 0)
3. Items met verschillende flex-basis waardes

### Extra Uitdaging
Maak een responsive pricing table met 3 prijsplannen:
- Mobile: onder elkaar (column)
- Tablet/Desktop: naast elkaar (row)
- Middelste plan heeft een "Popular" badge
- Middelste plan is iets groter (flex-grow: 1.2 ofzo)
- Hover effecten en smooth transitions

---
