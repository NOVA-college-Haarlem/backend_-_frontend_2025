## Week 5: Introductie CSS Grid

### Leerdoelen
Na deze les kan de student:
- Uitleggen wat CSS Grid is en wanneer je het gebruikt vs Flexbox
- Een grid container aanmaken met `display: grid`
- Kolommen en rijen definiëren met `grid-template-columns` en `grid-template-rows`
- De `fr` unit gebruiken voor flexibele grid tracks
- `gap` gebruiken voor ruimte tussen grid items
- Items positioneren met `grid-column` en `grid-row`
- Een simpele foto gallery maken met Grid
- Een basis dashboard layout bouwen

### Lesopbouw (90 minuten)

**1. Grid vs Flexbox: Wanneer Gebruik Je Wat? (15 min)**

**Terugblik Flexbox:**
- Vraag: "Wat was Flexbox goed in?"
- Antwoord: Eén dimensie (rij OF kolom), items naast/onder elkaar, flexible spacing

**Het probleem met Flexbox voor 2D layouts:**
```html
<div class="flexbox-grid">
    <div class="item">1</div>
    <div class="item">2</div>
    <div class="item">3</div>
    <div class="item">4</div>
    <div class="item">5</div>
    <div class="item">6</div>
</div>
```

```css
/* Flexbox hack voor grid-achtige layout */
.flexbox-grid {
    display: flex;
    flex-wrap: wrap;
}

.item {
    flex: 0 0 calc(33.333% - 20px); /* Complex! */
    margin: 10px;
}
/* Probleem: items zijn niet echt uitgelijnd in rijen EN kolommen */
```

**De oplossing: CSS Grid**
```css
.grid-container {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr; /* 3 kolommen */
    gap: 20px; /* Simpel! */
}
/* Items lijnen automatisch uit in rijen en kolommen! */
```

**Wanneer gebruik je wat?**

| Situatie | Tool |
|----------|------|
| Items in één rij of één kolom | Flexbox |
| Navigatiebalk | Flexbox |
| Button groep | Flexbox |
| Kaartjes in een grid | Grid |
| Complete page layout | Grid |
| Dashboard met verschillende secties | Grid |
| Complexe layouts met rijen EN kolommen | Grid |

**Vuistregel:**
- **Flexbox** = 1D (één dimensie: rij OF kolom)
- **Grid** = 2D (twee dimensies: rijen EN kolommen)

**Belangrijk:** Je kunt ze combineren! Grid voor de grote layout, Flexbox binnen grid items.

**2. Je Eerste Grid (20 min)**

**Basis Grid Setup:**
```html
<div class="grid-container">
    <div class="grid-item">1</div>
    <div class="grid-item">2</div>
    <div class="grid-item">3</div>
    <div class="grid-item">4</div>
    <div class="grid-item">5</div>
    <div class="grid-item">6</div>
</div>
```

```css
.grid-container {
    display: grid; /* Maakt het een grid! */
    background: #f0f0f0;
    padding: 20px;
}

.grid-item {
    background: lightblue;
    border: 2px solid #3498db;
    padding: 20px;
    text-align: center;
    font-size: 24px;
}
```

**Zonder meer CSS: alles staat onder elkaar!**
Waarom? Grid heeft 1 kolom als standaard.

**3 kolommen maken:**
```css
.grid-container {
    display: grid;
    grid-template-columns: 200px 200px 200px; /* 3 kolommen van 200px */
}
```

**Boom! Nu heb je 3 kolommen.**

**Oefening (5 min):**
Laat studenten experimenteren:
- Maak 4 kolommen
- Maak 2 kolommen
- Probeer verschillende breedtes (100px, 300px, 150px)

**3. De 'fr' Unit: Flexible Fractions (15 min)**

**Het probleem met pixels:**
```css
.grid-container {
    grid-template-columns: 200px 200px 200px;
    /* Werkt niet responsive! Wat als de container smaller is? */
}
```

**De oplossing: `fr` (fraction)**
```css
.grid-container {
    grid-template-columns: 1fr 1fr 1fr;
    /* 3 kolommen die elk 1/3 van de beschikbare ruimte krijgen */
}
```

**Hoe werkt `fr`?**
- `1fr` = 1 deel van beschikbare ruimte
- `2fr` = 2 delen van beschikbare ruimte
- Grid verdeelt de ruimte: totaal is 3fr, elk krijgt 1fr = 1/3

**Voorbeeld: Verschillende verhoudingen**
```css
.grid-container {
    grid-template-columns: 2fr 1fr 1fr;
    /* Kolom 1 krijgt 2/4 (50%) */
    /* Kolom 2 krijgt 1/4 (25%) */
    /* Kolom 3 krijgt 1/4 (25%) */
}
```

**Combineren van units:**
```css
.grid-container {
    grid-template-columns: 250px 1fr 1fr;
    /* Kolom 1: vaste 250px (bijv. sidebar) */
    /* Kolom 2 en 3: delen de overgebleven ruimte */
}
```

**Handige shortcut: `repeat()`**
```css
/* In plaats van: */
grid-template-columns: 1fr 1fr 1fr 1fr;

/* Gebruik: */
grid-template-columns: repeat(4, 1fr); /* 4 kolommen van 1fr */

/* Of zelfs: */
grid-template-columns: repeat(3, 100px); /* 3 kolommen van 100px */
```

**Praktisch voorbeeld - Blog layout:**
```html
<div class="blog-layout">
    <aside class="sidebar">Sidebar</aside>
    <main class="content">Hoofdinhoud</main>
    <aside class="widgets">Widgets</aside>
</div>
```

```css
.blog-layout {
    display: grid;
    grid-template-columns: 250px 2fr 1fr;
    /* Sidebar: 250px vast */
    /* Content: 2/3 van overige ruimte */
    /* Widgets: 1/3 van overige ruimte */
    gap: 20px;
    padding: 20px;
}
```

**4. Gap: Ruimte Tussen Items (10 min)**

**Zonder gap:**
```css
.grid-container {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    /* Items zitten tegen elkaar aan */
}
```

**Met gap:**
```css
.grid-container {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px; /* 20px ruimte tussen ALLE items */
}
```

**Verschillende gaps voor rijen en kolommen:**
```css
.grid-container {
    gap: 20px 40px;
    /* 20px tussen rijen */
    /* 40px tussen kolommen */
}

/* Of apart: */
.grid-container {
    row-gap: 20px;
    column-gap: 40px;
}
```

**Waarom is `gap` beter dan margin?**
```css
/* FOUT: Met margin */
.grid-item {
    margin: 10px; /* Geeft ook margin aan de buitenkant! */
}

/* GOED: Met gap */
.grid-container {
    gap: 20px; /* Alleen tussen items, niet aan buitenkant */
}
```

**5. Rows: Rijen Definiëren (10 min)**

**Automatische rijen:**
```css
.grid-container {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    /* Grid maakt automatisch nieuwe rijen als er meer items zijn */
}
```

**Expliciete rijen:**
```css
.grid-container {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    grid-template-rows: 100px 200px 100px;
    /* Rij 1: 100px hoog */
    /* Rij 2: 200px hoog */
    /* Rij 3: 100px hoog */
    /* Extra rijen: automatische hoogte */
}
```

**Met `fr` voor responsive heights:**
```css
.grid-container {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    grid-template-rows: 1fr 2fr 1fr;
    height: 600px; /* Container hoogte nodig voor fr in rows! */
}
```

**Praktisch: Grid met header en footer:**
```css
.page-layout {
    display: grid;
    grid-template-rows: 80px 1fr 60px;
    /* Header: 80px */
    /* Content: alle overige ruimte */
    /* Footer: 60px */
    min-height: 100vh;
}
```

**6. Items Positioneren (15 min)**

**Standaard gedrag:**
Items worden automatisch in volgorde geplaatst.

**Items handmatig plaatsen:**
```html
<div class="grid-container">
    <div class="item item-1">1</div>
    <div class="item item-2">2</div>
    <div class="item item-3">3</div>
</div>
```

```css
.grid-container {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    grid-template-rows: repeat(3, 150px);
    gap: 10px;
}

.item-1 {
    background: lightcoral;
    grid-column: 1 / 3; /* Start bij kolom 1, eindigt bij kolom 3 (dus 2 kolommen breed) */
}

.item-2 {
    background: lightblue;
    grid-column: 3 / 4; /* Kolom 3 (1 kolom breed) */
    grid-row: 1 / 3; /* Rij 1 tot 3 (2 rijen hoog) */
}

.item-3 {
    background: lightgreen;
    grid-column: 1 / 4; /* Alle 3 kolommen breed */
}
```

**Grid lines uitleg:**
```
   1    2    3    4
   │    │    │    │
1 ─┼────┼────┼────┼─
   │    │    │    │
2 ─┼────┼────┼────┼─
   │    │    │    │
3 ─┼────┼────┼────┼─
   │    │    │    │
```

**Shorthand:**
```css
/* In plaats van: */
grid-column-start: 1;
grid-column-end: 3;

/* Gebruik: */
grid-column: 1 / 3;

/* Of span: */
grid-column: span 2; /* Neem 2 kolommen in beslag */
```

**7. Praktische Opdracht: Foto Gallery (15 min)**

**Opdracht:**
Maak een responsive foto gallery.

**HTML:**
```html
<div class="gallery">
    <div class="gallery-item">
        <img src="https://picsum.photos/400/300?random=1" alt="Foto 1">
    </div>
    <div class="gallery-item">
        <img src="https://picsum.photos/400/300?random=2" alt="Foto 2">
    </div>
    <div class="gallery-item featured">
        <img src="https://picsum.photos/400/600?random=3" alt="Featured">
    </div>
    <div class="gallery-item">
        <img src="https://picsum.photos/400/300?random=4" alt="Foto 4">
    </div>
    <div class="gallery-item">
        <img src="https://picsum.photos/400/300?random=5" alt="Foto 5">
    </div>
    <div class="gallery-item">
        <img src="https://picsum.photos/400/300?random=6" alt="Foto 6">
    </div>
</div>
```

**CSS:**
```css
.gallery {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 15px;
    padding: 20px;
}

.gallery-item {
    overflow: hidden;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    transition: transform 0.3s;
}

.gallery-item:hover {
    transform: scale(1.05);
}

.gallery-item img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    display: block;
}

/* Featured image neemt 2 kolommen en 2 rijen */
.featured {
    grid-column: span 2;
    grid-row: span 2;
}

/* Responsive: Mobile */
@media (max-width: 768px) {
    .gallery {
        grid-template-columns: repeat(2, 1fr);
    }
}

/* Responsive: Tablet */
@media (min-width: 769px) and (max-width: 1023px) {
    .gallery {
        grid-template-columns: repeat(3, 1fr);
    }
}
```

**Studenten bouwen dit na en experimenteren:**
- Verander aantal kolommen
- Maak meer featured items
- Probeer verschillende gaps
- Voeg meer foto's toe

---

### Huiswerk

**Opdracht 1: Dashboard Layout**
Maak een simpel dashboard met Grid:

```
┌─────────────────────────────────┐
│          HEADER                 │
├─────────┬───────────────────────┤
│         │       MAIN            │
│ SIDEBAR │                       │
│         │                       │
├─────────┴───────────────────────┤
│          FOOTER                 │
└─────────────────────────────────┘
```

**Eisen:**
- Header: volledige breedte, 80px hoog
- Sidebar: 250px breed
- Main: neemt overige ruimte
- Footer: volledige breedte, 60px hoog
- Gebruik `fr` voor flexibele delen
- Minimaal 100vh hoog
- Responsive: sidebar bovenaan op mobile

**Opdracht 2: Product Grid**
Maak een product pagina met:
- 4 kolommen op desktop
- 2 kolommen op tablet
- 1 kolom op mobile
- Minimaal 8 producten
- Gap van 20px
- Hover effect

**Opdracht 3: Experimenteren**
Maak voorbeelden van:
1. 6 kolommen met gelijke breedte
2. 3 kolommen met verhoudingen 2:1:1
3. Grid met vaste breedte sidebar (250px) + flexible content
4. Grid met verschillende rij hoogtes

### Extra Uitdaging
Maak een foto masonry-achtige layout waar sommige foto's:
- 2 kolommen breed zijn
- 2 rijen hoog zijn
- Sommige zijn 2x2 (groot featured item)

**Tip:** Gebruik `grid-column: span X` en `grid-row: span X`

### Controlelijst voor docent
- [ ] Studenten begrijpen verschil tussen Grid en Flexbox
- [ ] Studenten kunnen `display: grid` toepassen
- [ ] Studenten kunnen kolommen definiëren met `grid-template-columns`
- [ ] Studenten begrijpen de `fr` unit
- [ ] Studenten kunnen `gap` gebruiken
- [ ] Studenten kunnen items positioneren met `grid-column` en `grid-row`
- [ ] Studenten kunnen `span` gebruiken voor grotere items

### Tips voor docent
- Grid kan overweldigend zijn - begin simpel!
- Gebruik Chrome DevTools Grid overlay om Grid visueel te maken
- Laat studenten veel experimenteren met aantal kolommen en `fr` units
- Teken grid lines op het bord om positionering te verduidelijken
- Vergelijk vaak met Flexbox - "Wanneer gebruik je wat?"
- Gebruik praktische voorbeelden (dashboard, gallery, blog layout)

### DevTools Grid Inspector
**Belangrijk! Laat dit zien:**
1. Open DevTools (F12)
2. Inspecteer een grid container
3. In Elements tab: zie je "grid" badge naast `display: grid`
4. Klik erop → Grid overlay verschijnt!
5. Zie de grid lines, tracks, en gaps visueel

**Dit helpt enorm bij debuggen!**

---
