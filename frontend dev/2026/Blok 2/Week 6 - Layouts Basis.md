# Week 6: Layouts Basis

## Leerdoelen
Na deze les kan de student:
- Elementen centreren met verschillende methodes
- Spacing toepassen met margin en padding
- Display properties begrijpen (block, inline, inline-block)
- Simpele layouts maken zonder Flexbox

## Lesopbouw (90 minuten)

### 1. Terugblik Projectweek (10 min)
- Wat ging goed?
- Wat vonden jullie moeilijk?
- Korte showcase: 2-3 studenten tonen hun project

### 2. Display Properties (20 min)

**Block elements:**
```css
/* Block elementen nemen volledige breedte */
div, h1, p {
    display: block;
}

.blok {
    display: block;
    background-color: lightblue;
    padding: 10px;
    margin-bottom: 10px;
}
```

**Inline elements:**
```css
/* Inline elementen nemen alleen nodig ruimte */
span, a, strong {
    display: inline;
}

.inline {
    display: inline;
    background-color: yellow;
    padding: 5px;
}
```

**Inline-block (het beste van beide):**
```css
/* Inline-block: naast elkaar, maar met width/height */
.inline-blok {
    display: inline-block;
    width: 200px;
    height: 100px;
    background-color: lightgreen;
    margin: 10px;
    padding: 15px;
}
```

**Oefening (10 min):**
Maak 3 dozen:
- Een met `display: block`
- Een met `display: inline`
- Een met `display: inline-block`

Zie het verschil!

### 3. Elementen Centreren (25 min)

**Tekst centreren:**
```css
.center-text {
    text-align: center;
}
```

**Block element horizontaal centreren:**
```css
.container {
    width: 80%;
    margin-left: auto;
    margin-right: auto;
}

/* Shorthand */
.container {
    width: 80%;
    margin: 0 auto;
}
```

**Element met vaste breedte centreren:**
```css
.box {
    width: 400px;
    margin: 0 auto;
    padding: 20px;
    background-color: #f0f0f0;
}
```

**Max-width voor responsive:**
```css
.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}
```

**Oefening (15 min):**
Maak een gecentreerde container:
- Width van 60%
- Achtergrondkleur
- Padding van 20px
- Gecentreerd met `margin: 0 auto`

### 4. Spacing Systemen (20 min)

**Consistente spacing:**
```css
/* Spacing variabelen */
:root {
    --space-xs: 5px;
    --space-sm: 10px;
    --space-md: 20px;
    --space-lg: 40px;
    --space-xl: 60px;
}

.section {
    padding: var(--space-lg);
    margin-bottom: var(--space-lg);
}
```

**Ruimte tussen elementen:**
```css
.card {
    margin-bottom: 30px;
}

.section {
    padding-top: 40px;
    padding-bottom: 40px;
}

h2 {
    margin-top: 0;
    margin-bottom: 20px;
}
```

**Whitespace voor leesbaarheid:**
```css
body {
    padding: 20px;
}

.content {
    max-width: 800px;
    margin: 0 auto;
    line-height: 1.8;
}

p {
    margin-bottom: 20px;
}
```

**Oefening (10 min):**
Maak een artikel pagina met:
- Goede spacing tussen paragrafen
- Ruimte rondom de hele content
- Consistente margins

### 5. Simpele 2-Kolom Layouts (30 min)

**Met inline-block:**
```css
.kolom {
    display: inline-block;
    width: 48%;
    vertical-align: top;
    padding: 20px;
    background-color: #f5f5f5;
    margin-right: 2%;
}

.kolom:last-child {
    margin-right: 0;
}
```

**Container pattern:**
```css
.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}

.content-area {
    display: inline-block;
    width: 65%;
    vertical-align: top;
}

.sidebar {
    display: inline-block;
    width: 30%;
    vertical-align: top;
    margin-left: 3%;
}
```

**Kaarten naast elkaar:**
```css
.kaart {
    display: inline-block;
    width: 30%;
    margin: 1%;
    padding: 15px;
    border: 1px solid #ddd;
    border-radius: 8px;
    vertical-align: top;
}
```

**Oefening (20 min):**
Maak een pagina met:
- Een gecentreerde container
- Twee kolommen naast elkaar (60% en 35%)
- Goede spacing tussen de kolommen

### 6. Praktisch Voorbeeld (10 min)

**Complete page layout:**
```css
/* Container */
.page-wrapper {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}

/* Header */
header {
    text-align: center;
    padding: 40px 0;
    margin-bottom: 40px;
    border-bottom: 2px solid #eee;
}

/* Main content */
.main-content {
    display: inline-block;
    width: 68%;
    vertical-align: top;
    padding-right: 20px;
}

/* Sidebar */
.sidebar {
    display: inline-block;
    width: 28%;
    vertical-align: top;
    background-color: #f9f9f9;
    padding: 20px;
    border-radius: 8px;
}

/* Footer */
footer {
    text-align: center;
    padding: 40px 0;
    margin-top: 60px;
    border-top: 2px solid #eee;
}
```

### 7. Afronding (5 min)
- Vragen?
- Volgende week: Website opmaak!

## Huiswerk

**Opdracht: Maak een "Over Mij" pagina met layout**

Vereisten:

1. **Container:**
   - Max-width van 1000px
   - Gecentreerd met `margin: 0 auto`
   - Padding van 20px

2. **Header:**
   - Gecentreerde tekst
   - Goede padding (top en bottom)

3. **Twee kolommen:**
   - Linker kolom: tekst over jezelf (60%)
   - Rechter kolom: afbeelding + info (35%)
   - Gebruik `display: inline-block`

4. **Spacing:**
   - Consistente margins tussen secties
   - Goede padding binnen elementen

5. **Footer:**
   - Gecentreerde tekst
   - Padding en border-top

**Bonus uitdagingen:**
- Maak 3 kleine kaartjes naast elkaar (elk 30% breed)
- Voeg een sidebar toe aan je layout
- Gebruik CSS variabelen voor spacing
- Experimenteer met verschillende width percentages

## Tips voor Docent
- Benadruk het verschil tussen margin (buiten) en padding (binnen)
- Laat zien hoe `margin: 0 auto` werkt in DevTools
- Leg uit waarom we `vertical-align: top` nodig hebben bij inline-block
- Laat studenten experimenteren met verschillende percentages
- Toon voorbeelden van goede spacing op professionele websites

## Veelgemaakte Fouten
1. Vergeten `vertical-align: top` bij inline-block
2. Percentages optellen tot meer dan 100%
3. Vergeten width te zetten bij `margin: 0 auto`
4. Te weinig of te veel spacing tussen elementen
5. Inline-block witte ruimte tussen elementen (uitleggen waarom)

---
