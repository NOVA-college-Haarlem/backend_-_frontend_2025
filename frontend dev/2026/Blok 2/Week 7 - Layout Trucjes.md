# Frontend Ontwikkeling - Blok 2

## Week 7: Layout Trucjes (Pre-Flexbox/Grid)

### Algemene Informatie
- **Doelgroep:** MBO studenten
- **Lesduur:** 90 minuten
- **Voorkennis:** Box model, display properties
- **Tools:** VS Code, Browser
- **Note:** Dit zijn "oude" layout methodes - in Blok 3 leren we Flexbox/Grid!

---

### Leerdoelen
Na deze les kan de student:
- Elementen centreren met `margin: 0 auto`
- `display` properties begrijpen (block, inline, inline-block)
- `float` gebruiken voor text-wrap bij afbeeldingen
- Clearfix toepassen
- `width` en `max-width` gebruiken voor responsive containers
- Simpele 2-kolom layouts maken
- Galleries maken met inline-block
- `position: relative` en `absolute` basics

---

### Lesopbouw (90 minuten)

**1. Display Properties Herhaling (15 min)**

**Drie belangrijke values:**

**display: block**
```css
/* Neemt volledige breedte */
/* Begint op nieuwe regel */
/* Voorbeelden: div, p, h1 */

.block-element {
    display: block;
    background-color: lightblue;
    padding: 10px;
}
```

```html
<div class="block-element">Block 1</div>
<div class="block-element">Block 2</div>
<!-- Staan onder elkaar -->
```

**display: inline**
```css
/* Neemt alleen benodigde ruimte */
/* Blijft op dezelfde regel */
/* Voorbeelden: span, a, strong */

.inline-element {
    display: inline;
    background-color: yellow;
    padding: 5px;
}
```

```html
<span class="inline-element">Inline 1</span>
<span class="inline-element">Inline 2</span>
<!-- Staan naast elkaar -->
```

**display: inline-block** ⭐
```css
/* Best of both worlds! */
/* Naast elkaar (inline) maar met width/height (block) */

.inline-block-element {
    display: inline-block;
    width: 150px;
    height: 100px;
    background-color: lightgreen;
    margin: 10px;
}
```

```html
<div class="inline-block-element">Box 1</div>
<div class="inline-block-element">Box 2</div>
<div class="inline-block-element">Box 3</div>
<!-- Staan naast elkaar, met vaste afmetingen -->
```

**Verschil tussen inline en inline-block:**
```css
/* inline: kan geen width/height krijgen! */
span {
    display: inline;
    width: 200px;  /* Werkt NIET */
    height: 100px; /* Werkt NIET */
}

/* inline-block: kan wel width/height krijgen! */
span {
    display: inline-block;
    width: 200px;  /* Werkt WEL */
    height: 100px; /* Werkt WEL */
}
```

**Oefening 1 (5 min):**
Maak 3 divs en test alle 3 display values. Zie het verschil!

---

**2. Centreren met margin: 0 auto (15 min)**

**Hoe center je een element horizontaal?**

```html
<div class="container">
    <p>Content binnen container</p>
</div>
```

```css
.container {
    width: 800px;  /* MOET een width hebben! */
    margin: 0 auto;  /* 0 boven/onder, auto links/rechts */
    background-color: lightblue;
    padding: 20px;
}
```

**Waarom werkt dit?**
- `auto` = browser verdeelt de ruimte gelijk links en rechts
- Werkt ALLEEN als element een vaste `width` heeft
- Werkt ALLEEN voor horizontaal centreren, niet verticaal

**Met max-width voor responsive:**
```css
.container {
    max-width: 800px;  /* Max 800px, maar kan kleiner */
    margin: 0 auto;
    padding: 20px;
}
```

**Verschil width vs max-width:**
```css
/* width: 800px */
/* Op small screen (bijv. 600px): scrollbar! */

/* max-width: 800px */
/* Op small screen: past zich aan (600px) */
```

**Content container (veel gebruikt!):**
```css
.content {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;  /* Padding links/rechts */
}
```

**Oefening 2 (10 min):**
Maak een gecentreerde container met:
- max-width: 900px
- achtergrondkleur
- padding
- 3 paragrafen erin

---

**3. Float voor Text-Wrap (15 min)**

**Wat is float?**
Laat elementen "zweven" zodat tekst eromheen kan lopen.

**Gebruik voor afbeelding in tekst:**
```html
<article>
    <img src="foto.jpg" class="float-left">
    <p>Lorem ipsum dolor sit amet... (veel tekst)</p>
    <p>Nog meer tekst die om de afbeelding heen loopt...</p>
</article>
```

```css
.float-left {
    float: left;
    margin-right: 20px;
    margin-bottom: 10px;
    width: 300px;
}

.float-right {
    float: right;
    margin-left: 20px;
    margin-bottom: 10px;
    width: 300px;
}
```

**Float values:**
```css
float: left;   /* Zweeft naar links */
float: right;  /* Zweeft naar rechts */
float: none;   /* Geen float (standaard) */
```

**Probleem: Parent heeft geen hoogte meer!**
```html
<div class="parent">
    <img src="foto.jpg" class="float-left">
    <p>Tekst</p>
</div>
<!-- Parent heeft hoogte 0! -->
```

**Oplossing: Clearfix**
```css
.parent::after {
    content: "";
    display: table;
    clear: both;
}
```

Of met class:
```html
<div class="clearfix">
    <img src="foto.jpg" class="float-left">
    <p>Tekst</p>
</div>
```

```css
.clearfix::after {
    content: "";
    display: table;
    clear: both;
}
```

**Oefening 3 (10 min):**
Maak een artikel met:
- Afbeelding links
- 3 paragrafen tekst die eromheen lopen
- Clearfix op de parent

---

**4. Simpele 2-Kolom Layout (met float) (15 min)**

**HTML:**
```html
<div class="container clearfix">
    <aside class="sidebar">
        <h3>Sidebar</h3>
        <ul>
            <li>Link 1</li>
            <li>Link 2</li>
        </ul>
    </aside>

    <main class="content">
        <h2>Main Content</h2>
        <p>Lorem ipsum...</p>
    </main>
</div>
```

**CSS:**
```css
.container {
    max-width: 1200px;
    margin: 0 auto;
}

.sidebar {
    float: left;
    width: 250px;
    background-color: #f8f9fa;
    padding: 20px;
}

.content {
    margin-left: 290px;  /* 250px sidebar + 40px gap */
    padding: 20px;
}

.clearfix::after {
    content: "";
    display: table;
    clear: both;
}
```

**Waarom margin-left op content?**
Duwt content naar rechts zodat sidebar ernaast past.

**Oefening 4 (10 min):**
Maak een 2-kolom layout met:
- Sidebar links (200px)
- Content rechts
- Verschillende achtergrondkleuren

---

**5. Gallery met inline-block (10 min)**

**HTML:**
```html
<div class="gallery">
    <div class="gallery-item">
        <img src="foto1.jpg">
        <p>Caption 1</p>
    </div>
    <div class="gallery-item">
        <img src="foto2.jpg">
        <p>Caption 2</p>
    </div>
    <div class="gallery-item">
        <img src="foto3.jpg">
        <p>Caption 3</p>
    </div>
    <!-- Meer items... -->
</div>
```

**CSS:**
```css
.gallery {
    max-width: 1200px;
    margin: 0 auto;
    text-align: center;  /* Centreert inline-block items */
}

.gallery-item {
    display: inline-block;
    width: 300px;
    margin: 10px;
    vertical-align: top;  /* Uitlijnen bovenaan */
    background-color: white;
    border: 1px solid #ddd;
    border-radius: 8px;
    overflow: hidden;
}

.gallery-item img {
    width: 100%;
    height: 200px;
    object-fit: cover;
}

.gallery-item p {
    padding: 10px;
    margin: 0;
}
```

**Probleem: Witte ruimte tussen items**
Inline-block heeft standaard een spatie tussen elementen.

**Oplossingen:**
1. Comments tussen HTML elementen:
```html
<div class="gallery-item">...</div><!--
--><div class="gallery-item">...</div>
```

2. Font-size: 0 op parent:
```css
.gallery {
    font-size: 0;
}

.gallery-item {
    font-size: 16px;  /* Reset */
}
```

**Later (Blok 3) leer je Flexbox/Grid - veel makkelijker!**

---

**6. Position: Relative en Absolute (Basics) (10 min)**

**position: relative**
```css
/* Element blijft op zijn plek */
/* Maar je kunt het verplaatsen t.o.v. originele positie */

.relative-box {
    position: relative;
    top: 20px;   /* 20px naar beneden */
    left: 30px;  /* 30px naar rechts */
}
```

**position: absolute**
```css
/* Element wordt "losgemaakt" van flow */
/* Positioneert t.o.v. parent met position: relative */

.parent {
    position: relative;  /* Parent moet relative zijn! */
}

.child {
    position: absolute;
    top: 10px;
    right: 10px;
}
```

**Praktisch voorbeeld: Badge op card**
```html
<div class="card">
    <span class="badge">Nieuw!</span>
    <img src="product.jpg">
    <h3>Product</h3>
</div>
```

```css
.card {
    position: relative;  /* Parent */
}

.badge {
    position: absolute;  /* Child */
    top: 10px;
    right: 10px;
    background-color: red;
    color: white;
    padding: 5px 10px;
    border-radius: 4px;
}
```

**We gebruikten dit al in Week 4!**

---

**7. Width en Max-Width (5 min)**

**width: vast**
```css
.box {
    width: 800px;
}
/* Op kleine schermen: scrollbar! */
```

**max-width: flexibel**
```css
.box {
    max-width: 800px;
}
/* Op kleine schermen: past zich aan */
```

**min-width:**
```css
.box {
    min-width: 300px;
    max-width: 800px;
}
/* Nooit smaller dan 300px, nooit breder dan 800px */
```

**Responsive container pattern:**
```css
.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
    width: 100%;
}
```

---

**8. Grote Oefening: Complete Layout (10 min)**

**Opdracht:**
Maak een complete pagina layout met:

1. **Header** (volledige breedte, gekleurde achtergrond)
   - Content binnen header gecentreerd (max-width: 1200px)

2. **Main Content Area**
   - Gecentreerde container (max-width: 1200px)
   - 2 kolommen:
     - Sidebar links (250px)
     - Content rechts

3. **Gallery Section**
   - 6 foto's in grid (inline-block)
   - 3 per rij

4. **Footer** (volledige breedte)
   - Gecentreerde content

---

### Huiswerk

**Hoofdopdracht: Layout Practice**

Maak 3 verschillende layouts:

1. **Blog Layout**
   - Header met navigatie
   - 2-kolom: sidebar left (300px) + content right
   - Footer
   - Gecentreerd (max-width: 1200px)

2. **Gallery Page**
   - Header
   - 12 afbeeldingen in grid (inline-block)
   - 4 per rij op desktop
   - Gecentreerd

3. **Article Page**
   - Header
   - Gecentreerde content (max-width: 800px)
   - Artikel met afbeelding float left
   - Tekst loopt eromheen
   - Footer

**Technische eisen:**
- Gebruik margin: 0 auto voor centreren
- Gebruik float voor sidebar layout
- Gebruik inline-block voor gallery
- Gebruik clearfix waar nodig
- Max-width voor responsive
- Nette CSS met comments

**Opdracht 2: Responsive Test**

Test je layouts op verschillende scherm breedtes:
- Desktop (1200px+)
- Tablet (768px)
- Mobile (480px)

Welke layouts breken? Hoe zou je dat oplossen?

**Opdracht 3: Voorbereiden Eindproject**

Plan de layout voor je portfolio:
- Schets op papier: waar komt alles?
- Welke layout technieken ga je gebruiken?
- Centreren? Sidebar? Gallery?

---

### Controlelijst voor Docent
- [ ] Studenten begrijpen display: block, inline, inline-block
- [ ] Studenten kunnen centreren met margin: 0 auto
- [ ] Studenten kunnen float gebruiken voor text-wrap
- [ ] Studenten kunnen clearfix toepassen
- [ ] Studenten kunnen simpele 2-kolom layouts maken
- [ ] Studenten begrijpen width vs max-width
- [ ] Studenten kunnen position: relative/absolute basics

### Tips voor Docent
- **Motivatie:** "Dit zijn oude methodes, maar goed om te kennen!"
- **Preview:** "Volgende blok leren we Flexbox/Grid - veel makkelijker!"
- **Float is lastig:** Neem tijd voor clearfix uitleg
- **DevTools:** Laat zien hoe float werkt in browser
- **Veelgemaakte fout:** Clearfix vergeten
- **Veelgemaakte fout:** Width vergeten bij margin: 0 auto
- **Praktisch:** Laat echte websites zien met deze technieken

### Resources
- [Float Explained](https://css-tricks.com/all-about-floats/)
- [Centering in CSS](https://css-tricks.com/centering-css-complete-guide/)

---

**NOTE VOOR DOCENT:**
Deze technieken zijn ouderwets maar:
1. Studenten zien ze nog in bestaande code
2. Goede voorbereiding voor Flexbox/Grid (ze waarderen het dan meer!)
3. Goed om basics te begrijpen

In Blok 3 leren ze moderne layout methods! 🚀
