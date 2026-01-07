## Week 6: Advanced CSS Grid & Complete Layouts

### Leerdoelen
Na deze les kan de student:
- Grid Template Areas gebruiken voor overzichtelijke layouts
- `auto-fit` en `auto-fill` toepassen voor automatisch responsive grids
- `minmax()` gebruiken voor flexibele maar gecontroleerde afmetingen
- Grid en Flexbox combineren in één layout
- Complexe magazine-style layouts bouwen
- Een complete responsive website bouwen met Grid als basis

### Lesopbouw (90 minuten)

**1. Terugblik & Warm-up (10 min)**

**Snelle quiz:**
- "Wat is het verschil tussen Grid en Flexbox?" (1D vs 2D)
- "Wat doet `1fr`?" (1 deel van beschikbare ruimte)
- "Hoe maak je ruimte tussen grid items?" (gap)

**Huiswerk bespreken:**
- Laat een paar studenten hun dashboard layout laten zien
- Bespreek eventuele problemen met positionering

**2. Grid Template Areas: Named Layouts (20 min)**

**Het probleem met nummers:**
```css
.grid-container {
    display: grid;
    grid-template-columns: 250px 1fr;
    grid-template-rows: 80px 1fr 60px;
}

.header {
    grid-column: 1 / 3; /* Wat betekent dit ook alweer? */
    grid-row: 1 / 2;
}
```

**De oplossing: Named Areas**
```css
.grid-container {
    display: grid;
    grid-template-columns: 250px 1fr;
    grid-template-rows: 80px 1fr 60px;
    grid-template-areas:
        "header  header"
        "sidebar content"
        "footer  footer";
    /* Visuele representatie van je layout! */
}

.header  { grid-area: header; }
.sidebar { grid-area: sidebar; }
.content { grid-area: content; }
.footer  { grid-area: footer; }
```

**Wow-moment:** De CSS code **ziet er uit** als je layout!

**Complete voorbeeld - Dashboard:**
```html
<div class="dashboard">
    <header class="header">Header</header>
    <aside class="sidebar">Sidebar</aside>
    <main class="main-content">Main Content</main>
    <aside class="widgets">Widgets</aside>
    <footer class="footer">Footer</footer>
</div>
```

```css
.dashboard {
    display: grid;
    grid-template-columns: 250px 2fr 1fr;
    grid-template-rows: 80px 1fr 60px;
    grid-template-areas:
        "header  header  header"
        "sidebar main    widgets"
        "footer  footer  footer";
    gap: 20px;
    height: 100vh;
    padding: 20px;
}

.header  { grid-area: header;  background: #34495e; color: white; padding: 20px; }
.sidebar { grid-area: sidebar; background: #ecf0f1; padding: 20px; }
.main-content { grid-area: main; background: white; padding: 20px; }
.widgets { grid-area: widgets; background: #ecf0f1; padding: 20px; }
.footer  { grid-area: footer;  background: #34495e; color: white; padding: 20px; text-align: center; }
```

**Responsive maken:**
```css
/* Mobile: alles onder elkaar */
@media (max-width: 768px) {
    .dashboard {
        grid-template-columns: 1fr;
        grid-template-rows: auto;
        grid-template-areas:
            "header"
            "main"
            "sidebar"
            "widgets"
            "footer";
    }
}
```

**Leeg vakje maken met punt:**
```css
.grid-container {
    grid-template-areas:
        "header header  ."
        "sidebar content content"
        "footer footer  footer";
    /* De punt (.) = leeg vakje */
}
```

**Oefening (10 min):**
Maak deze layout met grid-template-areas:
```
┌───────────────────┐
│       NAV         │
├─────┬───────┬─────┤
│ AD  │ MAIN  │ AD  │
│     │       │     │
├─────┴───────┴─────┤
│      FOOTER       │
└───────────────────┘
```

**3. Auto-fit & Auto-fill: Magisch Responsive (20 min)**

**Het probleem met media queries:**
```css
.grid {
    grid-template-columns: repeat(3, 1fr);
}

@media (max-width: 900px) {
    .grid { grid-template-columns: repeat(2, 1fr); }
}

@media (max-width: 600px) {
    .grid { grid-template-columns: 1fr; }
}
/* Veel media queries voor simpele responsive grid! */
```

**De oplossing: auto-fit**
```css
.grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, 200px);
    gap: 20px;
}
/* Grid maakt automatisch zoveel kolommen als er passen! */
/* GEEN media queries nodig! */
```

**Met minmax() voor nog flexibeler:**
```css
.grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 20px;
}
/* Elke kolom is minimaal 200px, maximaal 1fr */
/* Items groeien om ruimte te vullen! */
```

**Hoe werkt minmax()?**
```css
minmax(200px, 1fr)
/* Min: 200px - Kolom wordt nooit smaller dan 200px */
/* Max: 1fr - Kolom mag groeien om ruimte te vullen */
```

**Auto-fit vs Auto-fill:**

```css
/* AUTO-FIT: Items groeien om ruimte te vullen */
grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
/* 3 items in container van 900px = elk 300px breed */

/* AUTO-FILL: Maakt "ghost" kolommen voor lege ruimte */
grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
/* 3 items in container van 900px = elk 200px, rest is lege kolommen */
```

**Vuistregel:**
- **auto-fit**: Gebruik voor card grids waar items mogen groeien
- **auto-fill**: Gebruik als je de grid structuur wilt behouden

**Praktisch voorbeeld - Responsive Product Grid:**
```html
<div class="products">
    <div class="product">Product 1</div>
    <div class="product">Product 2</div>
    <div class="product">Product 3</div>
    <div class="product">Product 4</div>
    <div class="product">Product 5</div>
    <div class="product">Product 6</div>
    <div class="product">Product 7</div>
    <div class="product">Product 8</div>
</div>
```

```css
.products {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 30px;
    padding: 30px;
}

.product {
    background: white;
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 20px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    transition: transform 0.3s, box-shadow 0.3s;
}

.product:hover {
    transform: translateY(-5px);
    box-shadow: 0 4px 12px rgba(0,0,0,0.15);
}
```

**Dit werkt op ALLE schermgroottes zonder media queries!** 🎉

**4. MinMax() Dieper (10 min)**

**Basisgebruik:**
```css
grid-template-columns: minmax(200px, 400px);
/* Kolom kan niet smaller dan 200px, niet breder dan 400px */
```

**Combinaties:**
```css
/* Sidebar + flexible content */
grid-template-columns: minmax(200px, 300px) 1fr;
/* Sidebar: 200-300px */
/* Content: alle overige ruimte */

/* 3 kolommen met verschillende constraints */
grid-template-columns:
    minmax(150px, 200px)  /* Kolom 1: 150-200px */
    minmax(300px, 1fr)    /* Kolom 2: min 300px, max 1fr */
    minmax(200px, 250px); /* Kolom 3: 200-250px */
```

**Praktisch: Blog sidebar layout**
```css
.blog-layout {
    display: grid;
    grid-template-columns: minmax(250px, 300px) minmax(600px, 1fr);
    gap: 40px;
}
/* Sidebar: 250-300px breed */
/* Content: minimaal 600px (leesbaarheid!), groeit verder */
```

**5. Grid + Flexbox Combineren (15 min)**

**De kracht van combinatie:**
- Grid voor grote layout structuur
- Flexbox binnen grid items voor details

**Voorbeeld: Card Grid met Flexbox binnen cards**

```html
<div class="card-grid">
    <div class="card">
        <img src="https://picsum.photos/300/200?random=1" alt="Product">
        <div class="card-content">
            <h3>Product Naam</h3>
            <p class="description">Korte beschrijving van het product hier.</p>
            <div class="card-footer">
                <span class="price">€29,99</span>
                <button class="btn">Kopen</button>
            </div>
        </div>
    </div>
    <!-- Meer cards... -->
</div>
```

```css
/* Grid voor de card layout */
.card-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 25px;
    padding: 25px;
}

/* Flexbox BINNEN elke card */
.card {
    display: flex;
    flex-direction: column; /* Verticale card */
    background: white;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

.card img {
    width: 100%;
    height: 200px;
    object-fit: cover;
}

.card-content {
    display: flex;
    flex-direction: column;
    padding: 20px;
    flex: 1; /* Neemt overige ruimte */
}

.description {
    flex: 1; /* Beschrijving neemt ruimte */
    margin: 10px 0;
    color: #666;
}

/* Flexbox voor footer binnen card */
.card-footer {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 15px;
    padding-top: 15px;
    border-top: 1px solid #eee;
}

.price {
    font-size: 24px;
    font-weight: bold;
    color: #27ae60;
}

.btn {
    background: #3498db;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    transition: background 0.3s;
}

.btn:hover {
    background: #2980b9;
}
```

**Waarom deze combinatie?**
- Grid: Perfect voor card grid layout
- Flexbox: Perfect voor verticale card structuur en footer alignment

**6. Magazine-Style Layout (20 min)**

**Complexe layout met verschillende item groottes:**

```html
<div class="magazine">
    <article class="feature-story">
        <img src="https://picsum.photos/800/600?random=1" alt="Feature">
        <h2>Grote Feature Story</h2>
    </article>

    <article class="story">
        <img src="https://picsum.photos/400/300?random=2" alt="Story">
        <h3>Artikel 1</h3>
    </article>

    <article class="story">
        <img src="https://picsum.photos/400/300?random=3" alt="Story">
        <h3>Artikel 2</h3>
    </article>

    <article class="story">
        <img src="https://picsum.photos/400/300?random=4" alt="Story">
        <h3>Artikel 3</h3>
    </article>

    <article class="story tall">
        <img src="https://picsum.photos/400/600?random=5" alt="Story">
        <h3>Lang Artikel</h3>
    </article>

    <article class="story">
        <img src="https://picsum.photos/400/300?random=6" alt="Story">
        <h3>Artikel 4</h3>
    </article>
</div>
```

```css
.magazine {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    grid-auto-rows: 250px;
    gap: 15px;
    padding: 20px;
}

article {
    position: relative;
    overflow: hidden;
    border-radius: 8px;
}

article img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

article h2,
article h3 {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    background: linear-gradient(transparent, rgba(0,0,0,0.8));
    color: white;
    padding: 20px;
    margin: 0;
}

/* Feature story: 2x2 */
.feature-story {
    grid-column: span 2;
    grid-row: span 2;
}

/* Tall story: 1x2 */
.tall {
    grid-row: span 2;
}

/* Responsive */
@media (max-width: 768px) {
    .magazine {
        grid-template-columns: repeat(2, 1fr);
        grid-auto-rows: 200px;
    }

    .feature-story {
        grid-column: span 2;
        grid-row: span 1; /* Minder hoog op mobile */
    }
}

@media (max-width: 480px) {
    .magazine {
        grid-template-columns: 1fr;
    }

    .feature-story,
    .tall {
        grid-column: span 1;
        grid-row: span 1;
    }
}
```

**Nieuwe concepten:**
- `grid-auto-rows`: Hoogte voor automatisch gemaakte rijen
- `span` met verschillende groottes voor interessante layouts
- Responsive aanpassingen voor verschillende schermen

---

### Grote Praktische Opdracht: Magazine/Blog Homepage

**Opdracht:**
Bouw een complete magazine-style homepage met:

**Vereiste elementen:**
1. **Header** met navigatie (Flexbox)
2. **Hero Section** met grote featured artikel (Grid: 2x2)
3. **Trending Section** met 4 kleinere artikelen (Grid: 4 kolommen)
4. **Categories Section** met verschillende groottes (Grid: mixed sizes)
5. **Footer** met 4 kolommen info (Grid: auto-fit)

**Technische eisen:**
- Gebruik Grid Template Areas voor main layout
- Gebruik auto-fit voor responsive sections
- Combineer Grid + Flexbox waar nodig
- Volledig responsive (mobile, tablet, desktop)
- Gebruik minmax() voor flexibele maar gecontroleerde afmetingen
- CSS variabelen voor kleuren en spacing
- Smooth transitions en hover effects

**Bonus features:**
- Sticky header
- Image overlay effects
- CSS animations op featured items
- "Read More" buttons met hover effects
- Category tags/badges

---

### Huiswerk

**Hoofdopdracht: Magazine Homepage Afmaken**
Maak je magazine homepage volledig af met alle vereiste elementen.

**Opdracht 2: Grid Template Areas Practice**
Maak 3 verschillende layouts met grid-template-areas:
1. Classic blog (sidebar left, content right)
2. App-style dashboard (header, sidebar, main, footer)
3. Magazine grid (creative layout met verschillende groottes)

**Opdracht 3: Auto-fit Experimenten**
Maak voorbeelden met:
- `repeat(auto-fit, minmax(200px, 1fr))` met 6 items
- `repeat(auto-fill, minmax(150px, 1fr))` met 6 items
- Zie het verschil bij verschillende schermbreedtes

**Opdracht 4: Cheat Sheet Updaten**
Voeg toe aan je Flexbox cheat sheet van week 3:
- Grid voorbeelden
- Grid template areas voorbeelden
- Auto-fit/auto-fill voorbeelden
- MinMax voorbeelden

### Extra Uitdaging

**Pinterest-style Masonry Grid**
Maak een Pinterest-achtige layout waar:
- Items verschillende hoogtes hebben
- Items automatisch de beste plek vinden
- Volledig responsive
- Smooth hover effecten

**Tip:** Gebruik `grid-auto-flow: dense` om gaten op te vullen!

```css
.masonry {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    grid-auto-rows: 20px;
    gap: 15px;
    grid-auto-flow: dense; /* Vult gaten op! */
}

.masonry-item {
    grid-row: span var(--row-span); /* Dynamische hoogte */
}
```

---

### Samenvatting Blok 2: Wat Heb Je Geleerd?

**Week 1: Flexbox Basics**
- display: flex
- flex-direction
- justify-content, align-items
- Horizontale en verticale layouts

**Week 2: Advanced Flexbox**
- flex-grow, flex-shrink, flex-basis
- flex-wrap
- CSS variabelen
- Media queries en responsive design

**Week 3: Flexbox Projects**
- Holy Grail layout
- Hero sections
- Complete landing pages
- Combineren van meerdere flex containers

**Week 4: Portfolio Project**
- Complete responsive website bouwen
- Design keuzes maken
- Code organiseren
- Presenteren en feedback geven

**Week 5: CSS Grid Basics**
- display: grid
- grid-template-columns/rows
- fr unit
- gap
- grid-column, grid-row
- Positionering met span

**Week 6: Advanced Grid**
- Grid template areas
- auto-fit en auto-fill
- minmax()
- Grid + Flexbox combineren
- Complex magazine layouts

**Je kunt nu:**
✅ Moderne responsive layouts bouwen
✅ Flexbox en Grid combineren
✅ Complexe designs implementeren
✅ Responsive websites maken zonder teveel media queries
✅ Clean, onderhoudbare code schrijven
✅ Professional websites bouwen

---

### Resources voor verdere studie

**Interactive Learning:**
- [Grid Garden](https://cssgridgarden.com/) - Leer Grid door een game
- [CSS Grid by Wes Bos](https://cssgrid.io/) - Gratis video cursus

**Reference & Guides:**
- [CSS Tricks - Complete Guide to Grid](https://css-tricks.com/snippets/css/complete-guide-grid/)
- [MDN Grid Layout](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout)
- [Grid by Example](https://gridbyexample.com/) - Veel voorbeelden

**Inspiration:**
- [Awwwards](https://www.awwwards.com/) - Award-winning designs
- [Dribbble](https://dribbble.com/) - Design inspiration
- [CSS Design Awards](https://www.cssdesignawards.com/)

**Tools:**
- [Grid Generator](https://cssgrid-generator.netlify.app/) - Visual grid code generator
- [Layout Land](https://www.youtube.com/c/LayoutLand) - Jen Simmons YouTube channel

---

### Tips voor docent

**Deze week is intensief!**
- Veel nieuwe concepten (grid-template-areas, auto-fit, minmax)
- Geef studenten veel tijd om te experimenteren
- Loop actief rond en help individueel
- DevTools Grid inspector is essentieel - gebruik het veel!

**Grid template areas:**
- Teken het eerst op het bord
- Laat studenten hun eigen layouts tekenen voordat ze coderen
- Benadruk hoe leesbaar dit is

**Auto-fit/auto-fill:**
- Dit is magic voor studenten - laat het echt zien!
- Resize browser window live om effect te tonen
- Vergelijk met media query aanpak

**Magazine opdracht:**
- Dit is ambitieus - geef studenten vrijheid in design
- Laat voorbeelden zien van echte magazine sites
- Help met structuur/planning

**Afsluiting Blok 2:**
- Vier wat ze bereikt hebben!
- Laat mooie voorbeelden zien aan de klas
- Preview volgende blok (JavaScript?)

---

## Controlelijst voor docent
- [ ] Studenten kunnen grid-template-areas gebruiken
- [ ] Studenten begrijpen auto-fit vs auto-fill
- [ ] Studenten kunnen minmax() toepassen
- [ ] Studenten kunnen Grid en Flexbox combineren
- [ ] Studenten kunnen complexe layouts bouwen
- [ ] Studenten kunnen responsive maken met verschillende technieken
- [ ] Studenten kunnen zelfstandig een magazine-style layout bouwen

**Goed gedaan! Blok 2 is voltooid! 🎉**
