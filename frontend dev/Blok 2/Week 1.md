# Frontend Ontwikkeling - Blok 2

## Algemene Informatie
- **Doelgroep:** MBO studenten (15-22 jaar), basis HTML/CSS kennis
- **Lesduur:** 90 minuten per week
- **Voorkennis:** Blok 1 (HTML, basis CSS, classes, IDs)
- **Tools:** VS Code, DevTools

---

## Week 1: Introductie Flexbox

### Leerdoelen
Na deze les kan de student:
- Uitleggen wat Flexbox is en waarom het gebruikt wordt
- Een flex container aanmaken met `display: flex`
- De `flex-direction` property toepassen voor verschillende layouts
- Items uitlijnen met `justify-content` en `align-items`
- Een horizontale navigatiebalk bouwen met Flexbox
- Een simpele card layout maken met Flexbox

### Lesopbouw (90 minuten)

**1. Introductie & Probleemstelling (10 min)**

**Het probleem zonder Flexbox:**
Vraag aan de klas: "Hoe maakten we tot nu toe elementen naast elkaar?"
- Met `float` (lastig, vaak bugs)
- Met `display: inline-block` (lastig, spaties tussen elementen)
- Met `position: absolute` (niet responsive)

**Demo zonder Flexbox:**
```html
<div class="container">
    <div class="box">Box 1</div>
    <div class="box">Box 2</div>
    <div class="box">Box 3</div>
</div>
```
```css
.box {
    float: left;
    width: 30%;
    margin: 1%;
    background: lightblue;
}
/* Probleem: container heeft geen hoogte meer! */
```

**De oplossing: Flexbox**
- Moderne manier om layouts te maken
- Speciaal ontworpen voor elementen naast elkaar
- Responsive van nature
- Makkelijker te begrijpen en te gebruiken

**2. Flex Container Basis (20 min)**

**Uitleg:**
Flexbox werkt met een **container** (ouder) en **items** (kinderen).

```html
<div class="container">
    <div class="item">1</div>
    <div class="item">2</div>
    <div class="item">3</div>
</div>
```

```css
.container {
    display: flex; /* Dit is de magic! */
    border: 2px solid black;
}

.item {
    background: lightblue;
    padding: 20px;
    margin: 5px;
}
```

**Samen doen:**
- Maak bovenstaande code in een nieuw bestand `flexbox-basis.html`
- Open in browser
- Wow-moment: "Ze staan automatisch naast elkaar!"

**Experimenteren:**
Laat studenten zien wat er gebeurt als je meer items toevoegt.

**3. Flex Direction (20 min)**

**Uitleg:**
Met `flex-direction` bepaal je de richting van je items.

```css
.container {
    display: flex;
    flex-direction: row; /* Standaard: horizontaal ’  */
}
```

**Vier mogelijkheden:**

```css
/* 1. row (standaard) - items naast elkaar van links naar rechts */
flex-direction: row;

/* 2. row-reverse - items naast elkaar van rechts naar links */
flex-direction: row-reverse;

/* 3. column - items onder elkaar van boven naar beneden */
flex-direction: column;

/* 4. column-reverse - items onder elkaar van beneden naar boven */
flex-direction: column-reverse;
```

**Oefening:**
Laat studenten alle vier de varianten uitproberen in hun code.

**Praktisch voorbeeld - Verticale navigatie:**
```html
<nav class="vertical-nav">
    <a href="#home">Home</a>
    <a href="#about">Over</a>
    <a href="#contact">Contact</a>
</nav>
```

```css
.vertical-nav {
    display: flex;
    flex-direction: column;
    background: #333;
    width: 200px;
}

.vertical-nav a {
    color: white;
    padding: 15px;
    text-decoration: none;
}

.vertical-nav a:hover {
    background: #555;
}
```

**4. Justify-Content: Horizontale uitlijning (20 min)**

**Uitleg:**
`justify-content` bepaalt hoe items langs de **hoofdas** verdeeld worden.

```css
.container {
    display: flex;
    justify-content: flex-start; /* standaard */
}
```

**Belangrijkste waarden:**

```css
/* Links uitgelijnd (standaard) */
justify-content: flex-start;

/* Rechts uitgelijnd */
justify-content: flex-end;

/* Gecentreerd */
justify-content: center;

/* Ruimte tussen items */
justify-content: space-between;

/* Ruimte rondom items */
justify-content: space-around;

/* Gelijkmatige ruimte rondom items */
justify-content: space-evenly;
```

**Visuele demo:**
Maak samen dit voorbeeld en laat studenten alle waarden proberen:

```html
<div class="demo-container">
    <div class="demo-item">A</div>
    <div class="demo-item">B</div>
    <div class="demo-item">C</div>
</div>
```

```css
.demo-container {
    display: flex;
    justify-content: space-between; /* Verander deze! */
    border: 2px solid black;
    padding: 10px;
    margin: 20px 0;
}

.demo-item {
    background: coral;
    padding: 20px;
    width: 80px;
    text-align: center;
}
```

**5. Align-Items: Verticale uitlijning (15 min)**

**Uitleg:**
`align-items` bepaalt hoe items langs de **kruisas** uitgelijnd worden.

```css
.container {
    display: flex;
    align-items: stretch; /* standaard */
    height: 300px; /* Hoogte nodig om effect te zien */
}
```

**Belangrijkste waarden:**

```css
/* Items uitrekken tot volledige hoogte (standaard) */
align-items: stretch;

/* Boven uitgelijnd */
align-items: flex-start;

/* Onder uitgelijnd */
align-items: flex-end;

/* Verticaal gecentreerd */
align-items: center;

/* Uitgelijnd op tekstlijn */
align-items: baseline;
```

**Perfect centreren (populaire trick):**
```css
.center-container {
    display: flex;
    justify-content: center; /* Horizontaal gecentreerd */
    align-items: center;     /* Verticaal gecentreerd */
    height: 400px;
    background: lightgray;
}
```

**6. Praktische Opdracht: Horizontale Navigatie (15 min)**

**Opdracht:**
Maak een moderne horizontale navigatiebalk.

```html
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <title>Flexbox Navigatie</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <nav class="main-nav">
        <div class="logo">MijnSite</div>
        <div class="nav-links">
            <a href="#home">Home</a>
            <a href="#diensten">Diensten</a>
            <a href="#over">Over Ons</a>
            <a href="#contact">Contact</a>
        </div>
    </nav>
</body>
</html>
```

```css
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

.main-nav {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: #2c3e50;
    padding: 15px 30px;
}

.logo {
    color: white;
    font-size: 24px;
    font-weight: bold;
}

.nav-links {
    display: flex;
    gap: 20px; /* Ruimte tussen links */
}

.nav-links a {
    color: white;
    text-decoration: none;
    padding: 10px 15px;
    border-radius: 5px;
    transition: background 0.3s;
}

.nav-links a:hover {
    background: #34495e;
}
```

**Uitleg belangrijke onderdelen:**
- Twee flex containers: `main-nav` EN `nav-links`
- `space-between` voor logo links en links rechts
- `gap` voor ruimte tussen navigatie items (moderne CSS!)
- `transition` voor smooth hover effect

### Huiswerk

**Opdracht 1: Card Layout**
Maak een pagina met 3 cards naast elkaar:

```html
<div class="card-container">
    <div class="card">
        <h3>Webdesign</h3>
        <p>Mooie websites maken voor klanten</p>
    </div>
    <div class="card">
        <h3>Development</h3>
        <p>Websites bouwen met code</p>
    </div>
    <div class="card">
        <h3>Marketing</h3>
        <p>Online zichtbaar worden</p>
    </div>
</div>
```

**Eisen:**
- Cards staan naast elkaar (flex-direction: row)
- Cards zijn gecentreerd op de pagina
- Elke card heeft: padding, border, border-radius
- Hover effect: card wordt iets groter (transform: scale(1.05))

**Opdracht 2: Experimenteren**
Maak een HTML pagina met minstens 5 verschillende flex containers die laten zien:
1. Items gecentreerd (horizontaal en verticaal)
2. Items met `space-between`
3. Items met `space-evenly`
4. Column layout (verticaal)
5. Row-reverse layout

### Extra Uitdaging
Maak een complete header met:
- Logo links
- Navigatie in het midden
- "Login" knop rechts
- Alles verticaal gecentreerd

**Tip:** Je hebt 3 flex containers nodig!

---
