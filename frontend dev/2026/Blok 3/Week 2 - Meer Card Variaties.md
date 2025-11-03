# Week 2: Meer Card Variaties

## Leerdoelen
Na deze les kan de student:
- Verschillende card layouts maken (horizontal cards)
- Badges toevoegen aan cards
- Card headers en footers maken
- Color schemes toepassen op cards
- Overlay effecten maken

## Lesopbouw (90 minuten)

### 1. Terugblik (5 min)
- Laat 1-2 studenten hun cards zien
- Bespreek wat goed ging

### 2. Horizontal Cards (20 min)

**Basis horizontal card:**
```css
.card-horizontal {
    display: inline-block;
    width: 600px;
    border: 1px solid #ddd;
    border-radius: 8px;
    overflow: hidden;
}

.card-horizontal img {
    width: 40%;
    height: 200px;
    object-fit: cover;
    float: left;
}

.card-horizontal .card-content {
    width: 60%;
    float: left;
    padding: 20px;
    box-sizing: border-box;
}
```

**Clearfix:**
```css
.card-horizontal::after {
    content: "";
    display: table;
    clear: both;
}
```

**Oefening (10 min):**
Maak een horizontal card met afbeelding links en tekst rechts.

### 3. Badges op Cards (20 min)

**Badge in hoek:**
```html
<div class="card">
    <span class="badge">Nieuw!</span>
    <img src="product.jpg" alt="Product">
    <div class="card-content">
        <!-- content -->
    </div>
</div>
```

```css
.card {
    position: relative;
}

.badge {
    position: absolute;
    top: 10px;
    right: 10px;
    background-color: #e74c3c;
    color: white;
    padding: 5px 10px;
    border-radius: 4px;
    font-size: 12px;
    font-weight: bold;
}
```

**Verschillende badge kleuren:**
```css
.badge-new {
    background-color: #e74c3c;
}

.badge-sale {
    background-color: #f39c12;
}

.badge-popular {
    background-color: #3498db;
}
```

**Oefening (10 min):**
Voeg badges toe aan je cards ("Nieuw", "Sale", "Populair").

### 4. Card Headers & Footers (20 min)

**Card met header:**
```html
<div class="card">
    <div class="card-header">
        <h4>Premium Plan</h4>
    </div>
    <div class="card-body">
        <p>Features lijst...</p>
    </div>
    <div class="card-footer">
        <button class="btn">Kies dit plan</button>
    </div>
</div>
```

```css
.card-header {
    background-color: #3498db;
    color: white;
    padding: 15px 20px;
}

.card-body {
    padding: 20px;
}

.card-footer {
    background-color: #f9f9f9;
    padding: 15px 20px;
    border-top: 1px solid #ddd;
}
```

**Oefening (15 min):**
Maak pricing cards met header, body en footer.

### 5. Color Schemes (15 min)

**Themed cards:**
```css
.card-blue {
    border-top: 4px solid #3498db;
}

.card-green {
    border-top: 4px solid #2ecc71;
}

.card-red {
    border-top: 4px solid #e74c3c;
}
```

**Dark cards:**
```css
.card-dark {
    background-color: #2c3e50;
    color: white;
    border: none;
}

.card-dark h3 {
    color: white;
}

.card-dark p {
    color: #ecf0f1;
}
```

**Oefening (10 min):**
Maak 3 cards met verschillende color schemes.

### 6. Overlay Effecten (25 min)

**Text overlay:**
```html
<div class="card">
    <img src="image.jpg" alt="Image">
    <div class="card-overlay">
        <h3>Titel</h3>
        <p>Beschrijving</p>
    </div>
</div>
```

```css
.card {
    position: relative;
    overflow: hidden;
}

.card img {
    width: 100%;
    display: block;
}

.card-overlay {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    background: linear-gradient(
        to top,
        rgba(0, 0, 0, 0.8),
        transparent
    );
    color: white;
    padding: 20px;
    transform: translateY(100%);
    transition: transform 0.3s ease;
}

.card:hover .card-overlay {
    transform: translateY(0);
}
```

**Full overlay op hover:**
```css
.card-overlay-full {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: rgba(52, 152, 219, 0.9);
    color: white;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    opacity: 0;
    transition: opacity 0.3s ease;
}

.card:hover .card-overlay-full {
    opacity: 1;
}
```

**Oefening (15 min):**
Maak een card met overlay dat verschijnt bij hover.

### 7. Afronding (5 min)
- Vragen?
- Volgende week: Layout trucjes!

## Huiswerk

**Opdracht: Maak een Complete Card Library**

Bouw een pagina met 9 verschillende card variaties (3 rijen van 3):

**Rij 1: Basic Variations**
1. Basic card met shadow
2. Card met badge
3. Card met colored border-top

**Rij 2: Layout Variations**
4. Horizontal card
5. Card met header/footer
6. Dark themed card

**Rij 3: Advanced Effects**
7. Card met image zoom hover
8. Card met text overlay
9. Card met full overlay hover

**Vereisten:**
- Alle 9 cards moeten werken
- Hover effecten overal
- Nette code met comments
- Cards in grid (3 per rij)

**Bonus:**
- Voeg een title toe aan elke rij
- Maak een navigation sidebar
- Experimenteer met verschillende transitions
- Maak één custom card variant

## Tips voor Docent
- Laat veel voorbeelden zien
- Benadruk position: relative/absolute voor badges en overlays
- Leg z-index uit bij overlappende elementen
- DevTools gebruiken om layering te zien
- Loop rond en help bij positioning

## Veelgemaakte Fouten
1. Vergeten `position: relative` op parent bij absolute positioning
2. Geen clearfix bij float
3. Overlay werkt niet (vergeten overflow: hidden of position)
4. Badge zit niet in de hoek (geen absolute positioning)
5. Transition werkt niet (vergeten op initial state)

---
