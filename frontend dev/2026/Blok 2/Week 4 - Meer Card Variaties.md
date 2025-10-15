# Frontend Ontwikkeling - Blok 2

## Week 4: Meer Card Variaties & Projectweek Prep

### Algemene Informatie
- **Doelgroep:** MBO studenten
- **Lesduur:** 90 minuten
- **Voorkennis:** Basis cards, buttons, selectoren
- **Tools:** VS Code, Browser

---

### Leerdoelen
Na deze les kan de student:
- Cards met meerdere secties maken
- Cards met badges/labels toevoegen
- Horizontal cards maken (afbeelding naast tekst)
- Card footers en headers stylen
- Color schemes toepassen op cards
- Cards responsive maken (basis)
- Card overlay effecten toepassen

---

### Lesopbouw (90 minuten)

**1. Terugblik + Showcase (10 min)**

Vraag: "Wie wil zijn/haar cards laten zien?"
- Laat 2-3 studenten hun cards tonen
- Bespreek wat goed werkt
- Geef tips voor verbetering

**Check:** Heeft iedereen basis cards werkend met hover effecten?

---

**2. Cards met Header en Footer (15 min)**

**Structuur:**
```html
<div class="card">
    <div class="card-header">
        <h4>Card Header</h4>
    </div>
    <div class="card-body">
        <p>Main content hier</p>
    </div>
    <div class="card-footer">
        <button class="btn">Action</button>
    </div>
</div>
```

**CSS:**
```css
.card {
    border: 1px solid #ddd;
    border-radius: 8px;
    overflow: hidden;
    width: 300px;
}

.card-header {
    background-color: #f8f9fa;
    padding: 15px 20px;
    border-bottom: 1px solid #ddd;
}

.card-header h4 {
    margin: 0;
    font-size: 18px;
}

.card-body {
    padding: 20px;
}

.card-footer {
    background-color: #f8f9fa;
    padding: 15px 20px;
    border-top: 1px solid #ddd;
    text-align: right;
}
```

**Oefening 1 (5 min):** Maak een card met header "Notificatie", body met bericht, en footer met "Sluiten" button.

---

**3. Cards met Badges/Labels (15 min)**

**Wat zijn badges?**
Kleine labels die extra info geven (bijv. "Nieuw!", "Sale!", "Populair")

**HTML:**
```html
<div class="card">
    <span class="badge badge-new">Nieuw!</span>
    <img src="product.jpg" class="card-image">
    <div class="card-body">
        <h3>Product Naam</h3>
        <p>Beschrijving...</p>
    </div>
</div>
```

**CSS:**
```css
.card {
    position: relative;  /* Voor absolute positioning van badge */
}

.badge {
    position: absolute;
    top: 10px;
    right: 10px;
    padding: 5px 10px;
    border-radius: 4px;
    font-size: 12px;
    font-weight: bold;
    color: white;
}

.badge-new {
    background-color: #28a745;  /* Groen */
}

.badge-sale {
    background-color: #dc3545;  /* Rood */
}

.badge-popular {
    background-color: #ffc107;  /* Geel */
    color: #333;
}
```

**Position: Absolute Uitleg (simpel):**
```css
.parent {
    position: relative;  /* Parent moet relative zijn */
}

.child {
    position: absolute;  /* Child wordt "losgemaakt" */
    top: 10px;          /* 10px van bovenkant parent */
    right: 10px;        /* 10px van rechterkant parent */
}
```

**Oefening 2 (10 min):**
Maak 3 product cards met verschillende badges:
1. "Nieuw!" badge (groen)
2. "50% Korting!" badge (rood)
3. "Bestseller" badge (geel)

---

**4. Horizontal Cards (20 min)**

**Wat zijn horizontal cards?**
Afbeelding naast tekst, in plaats van boven tekst.

**HTML:**
```html
<div class="card card-horizontal">
    <img src="product.jpg" class="card-image-left">
    <div class="card-body">
        <h3>Product Naam</h3>
        <p>Beschrijving van het product.</p>
        <button class="btn btn-primary">Meer Info</button>
    </div>
</div>
```

**CSS:**
```css
.card-horizontal {
    display: flex;  /* Simpele Flexbox! */
    width: 500px;
}

.card-image-left {
    width: 200px;
    height: 200px;
    object-fit: cover;
}

.card-body {
    padding: 20px;
    flex: 1;  /* Neemt overige ruimte */
}
```

**Alternatief zonder Flexbox (float):**
```css
.card-horizontal {
    width: 500px;
}

.card-image-left {
    width: 200px;
    height: 200px;
    float: left;
}

.card-body {
    margin-left: 220px;  /* 200px image + 20px margin */
    padding: 20px;
}
```

**Oefening 3 (10 min):**
Maak een horizontal card voor een blog post met:
- Afbeelding links
- Titel, datum, intro tekst rechts
- "Lees Meer" button

---

**5. Color Schemes voor Cards (15 min)**

**Thema Cards:**
```css
/* Primary Card - Blauw */
.card-primary {
    border-color: #007bff;
}

.card-primary .card-header {
    background-color: #007bff;
    color: white;
}

/* Success Card - Groen */
.card-success {
    border-color: #28a745;
}

.card-success .card-header {
    background-color: #28a745;
    color: white;
}

/* Danger Card - Rood */
.card-danger {
    border-color: #dc3545;
}

.card-danger .card-header {
    background-color: #dc3545;
    color: white;
}

/* Dark Card */
.card-dark {
    background-color: #343a40;
    color: white;
    border-color: #343a40;
}
```

**Volledige gekleurde cards:**
```css
.card-full-primary {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    border: none;
}

.card-full-primary h3 {
    color: white;
}
```

**Oefening 4 (5 min):**
Maak 4 cards met verschillende color schemes (primary, success, danger, warning).

---

**6. Card Overlay Effect (Advanced) (10 min)**

**Overlay over afbeelding:**
```html
<div class="card card-overlay">
    <img src="background.jpg" class="card-bg">
    <div class="card-overlay-content">
        <h2>Overlay Title</h2>
        <p>Text over afbeelding</p>
        <button class="btn">Learn More</button>
    </div>
</div>
```

**CSS:**
```css
.card-overlay {
    position: relative;
    width: 400px;
    height: 300px;
    overflow: hidden;
    border-radius: 10px;
}

.card-bg {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.card-overlay-content {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(0, 0, 0, 0.5);  /* Donkere overlay */
    color: white;
    padding: 30px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    opacity: 0;
    transition: opacity 0.3s ease;
}

.card-overlay:hover .card-overlay-content {
    opacity: 1;  /* Verschijnt bij hover */
}
```

**Simpeler alternatief (zonder hover effect):**
```css
.card-overlay-content {
    /* ... andere styles ... */
    background: linear-gradient(transparent, rgba(0,0,0,0.8));
    opacity: 1;
    justify-content: flex-end;  /* Tekst onderaan */
}
```

---

**7. Responsive Cards (Basis) (10 min)**

**Cards op mobiel:**
```css
/* Desktop: 3 cards naast elkaar */
.card {
    width: 30%;
    display: inline-block;
    margin: 10px 1%;
}

/* Tablet: 2 cards naast elkaar */
@media (max-width: 768px) {
    .card {
        width: 48%;
    }
}

/* Mobile: 1 card volledige breedte */
@media (max-width: 480px) {
    .card {
        width: 100%;
        display: block;
        margin: 10px 0;
    }
}
```

**Horizontal cards responsive:**
```css
/* Desktop: afbeelding naast tekst */
.card-horizontal {
    display: flex;
}

/* Mobile: afbeelding boven tekst */
@media (max-width: 768px) {
    .card-horizontal {
        flex-direction: column;
    }

    .card-image-left {
        width: 100%;
        height: 200px;
    }
}
```

---

**8. Grote Oefening: Card Gallery (15 min)**

**Opdracht:**
Maak een pagina met 6 cards in verschillende stijlen:

1. **Standaard product card** (van vorige week)
2. **Card met header en footer**
3. **Card met "Nieuw!" badge**
4. **Horizontal blog card**
5. **Card met color scheme** (primary/success/danger)
6. **Card met overlay effect**

Alle cards moeten:
- Netjes naast elkaar staan (3 per rij op desktop)
- Hover effecten hebben
- Border-radius en shadow hebben
- Responsive zijn (testen!)

---

### Huiswerk

**Hoofdopdracht: 8 Advanced Cards**

Maak 8 verschillende cards met nieuwe technieken:

1. **Notification Card** - Header, body, footer
2. **Product Card met Badge** - "50% Sale!"
3. **Blog Post Card** - Horizontal layout
4. **Stats Card** - Cijfers met icon (emoji)
5. **Colored Card** - Primary, success, of danger theme
6. **Team Member Card** - Met social media icons als footer
7. **Gallery Card** - Met image overlay effect
8. **Pricing Card** - Header met prijs, lijst met features, footer met button

**Technische eisen:**
- Gebruik position: relative/absolute voor badges
- Gebruik color schemes
- Minstens 3 cards horizontal
- Minstens 3 cards met badges
- Alle cards responsive
- Nette CSS met sections en comments

**Opdracht 2: Start Eindproject**

Begin met je portfolio cards:
- Maak 3 project cards voor je eindproject (Week 8)
- Gebruik de mooiste technieken die je geleerd hebt
- Denk na over: welke style past bij jou?

**Opdracht 3: Inspiratie Verzamelen**

Bezoek 3 websites en screenshot hun cards:
- Welke styles gebruiken ze?
- Welke hover effecten?
- Welke kleuren?
- Wat vind je mooi en waarom?

Maak een document met screenshots en je observaties.

---

### Controlelijst voor Docent
- [ ] Studenten kunnen cards met header/footer maken
- [ ] Studenten kunnen badges toevoegen met position: absolute
- [ ] Studenten kunnen horizontal cards maken
- [ ] Studenten kunnen color schemes toepassen
- [ ] Studenten begrijpen basis responsive design
- [ ] Studenten kunnen overlay effecten maken

### Tips voor Docent
- **Position: absolute is lastig** - neem hier tijd voor
- **Laat voorbeelden zien** van badges op echte websites
- **Horizontal cards** - uitleggen waarom afbeelding fixed width heeft
- **Media queries** - kort introduceren, volgende week meer
- **Motivatie**: "Deze technieken zie je overal online!"
- **DevTools**: Laat zien hoe je position absolute live kunt aanpassen

### Resources
- [Card Examples - Dribbble](https://dribbble.com/search/cards)
- [CSS Position Explained](https://css-tricks.com/almanac/properties/p/position/)

---
