# Frontend Ontwikkeling - Blok 2

## Week 1: Herhaling & CSS Selectoren Uitbreiden

### Algemene Informatie
- **Doelgroep:** MBO studenten die Blok 1 hebben afgerond
- **Lesduur:** 90 minuten
- **Voorkennis:** HTML basis, CSS basis, box model, classes & IDs
- **Tools:** VS Code, Browser DevTools

---

### Leerdoelen
Na deze les kan de student:
- De belangrijkste concepten van Blok 1 toepassen (box model, classes, IDs)
- Descendant selectors gebruiken (`div p`, `.card h2`)
- Child selectors toepassen (`div > p`)
- Adjacent sibling selectors gebruiken (`h2 + p`)
- Multiple selectors combineren (`h1, h2, h3`)
- Pseudo-classes `:hover` en `:focus` toepassen voor interactiviteit

---

### Lesopbouw (90 minuten)

**1. Welkom Terug & Terugblik Blok 1 (15 min)**

**Snelle Check:**
Vraag aan de klas:
- "Wat is het box model?" (content, padding, border, margin)
- "Wat is het verschil tussen een class en een ID?" (class herbruikbaar, ID uniek)
- "Hoe maak je ruimte binnen een element?" (padding)
- "Hoe maak je ruimte tussen elementen?" (margin)

**Demo: Even Opfrissen**
```html
<div class="voorbeeld">
    <h2>Voorbeeld</h2>
    <p>Dit is een paragraaf met padding en margin.</p>
</div>
```

```css
.voorbeeld {
    background-color: lightblue;
    padding: 20px;        /* Ruimte binnen */
    margin: 20px;         /* Ruimte buiten */
    border: 2px solid blue;
    border-radius: 10px;
}
```

**Wat gaan we dit blok leren?**
- Mooie buttons maken
- Professionele cards bouwen
- Navigatie stylen
- Formulieren mooi maken
- En nog veel meer CSS trucjes!

---

**2. Descendant Selectors (20 min)**

**Wat is een Descendant Selector?**
Een descendant selector selecteert elementen die *binnen* een ander element zitten.

**Syntax:** `ouder kind`

**Voorbeeld 1: Basis**
```html
<div class="artikel">
    <h2>Titel van Artikel</h2>
    <p>Dit is de eerste paragraaf.</p>
    <p>Dit is de tweede paragraaf.</p>
</div>

<p>Deze paragraaf staat BUITEN het artikel.</p>
```

```css
/* Alleen paragrafen BINNEN .artikel worden rood */
.artikel p {
    color: red;
}
```

**Uitleg:**
- `.artikel p` = "alle `<p>` die binnen `.artikel` zitten"
- De paragraaf buiten het artikel wordt NIET rood
- Spatie tussen `.artikel` en `p` is belangrijk!

**Voorbeeld 2: Dieper nesten**
```html
<div class="container">
    <div class="content">
        <h2>Hoofdtitel</h2>
        <p>Tekst in content</p>
    </div>
</div>
```

```css
/* H2 binnen .content binnen .container */
.container .content h2 {
    color: blue;
    font-size: 24px;
}
```

**Waarom is dit handig?**
- Je hoeft niet elke `<p>` een class te geven
- Specifieke styling voor specifieke plekken
- Code blijft overzichtelijker

**Oefening 1 (10 min):**
```html
<div class="blog">
    <h1>Mijn Blog</h1>
    <article class="post">
        <h2>Post Titel</h2>
        <p>Dit is de intro tekst.</p>
        <p>Dit is de body tekst.</p>
    </article>
    <aside class="sidebar">
        <h3>Over Mij</h3>
        <p>Tekst in de sidebar.</p>
    </aside>
</div>
```

**Opdrachten:**
1. Maak alle `<p>` binnen `.post` grijs
2. Maak de `<h2>` binnen `.post` blauw
3. Maak alle `<p>` binnen `.sidebar` klein (font-size: 14px)
4. Maak alle headings (h1, h2, h3) binnen `.blog` een lettertype Arial

---

**3. Child Selector (>) (10 min)**

**Wat is het verschil met Descendant?**
- Descendant: selecteert ALLE kinderen (ook dieper genest)
- Child: selecteert alleen DIRECTE kinderen

**Syntax:** `ouder > kind`

**Voorbeeld:**
```html
<div class="container">
    <p>Direct kind van container</p>
    <div class="inner">
        <p>Kleinkind van container (binnen inner)</p>
    </div>
</div>
```

```css
/* Descendant: beide <p> worden rood */
.container p {
    color: red;
}

/* Child: alleen directe kinderen worden blauw */
.container > p {
    color: blue;
}
```

**Resultaat:**
- Eerste `<p>`: blauw (direct kind)
- Tweede `<p>`: rood (kleinkind, geen direct kind)

**Wanneer gebruiken?**
Als je ALLEEN de directe kinderen wilt stylen, niet alles dieper.

**Praktisch voorbeeld:**
```html
<nav class="menu">
    <ul>
        <li>Home</li>
        <li>Over
            <ul>
                <li>Team</li>
                <li>Geschiedenis</li>
            </ul>
        </li>
    </ul>
</nav>
```

```css
/* Alleen de eerste niveau <li> groot maken */
.menu > ul > li {
    font-size: 18px;
    font-weight: bold;
}

/* Sub-menu items blijven normaal */
.menu ul li li {
    font-size: 14px;
    font-weight: normal;
}
```

---

**4. Adjacent Sibling Selector (+) (10 min)**

**Wat doet het?**
Selecteert een element dat DIRECT NA een ander element komt.

**Syntax:** `element1 + element2`

**Voorbeeld:**
```html
<h2>Hoofdtitel</h2>
<p>Deze paragraaf komt direct na h2</p>
<p>Deze paragraaf niet</p>

<h2>Nog een titel</h2>
<p>Deze komt ook direct na h2</p>
```

```css
/* Alleen de EERSTE <p> na elke <h2> wordt rood */
h2 + p {
    color: red;
    font-size: 18px;
}
```

**Resultaat:**
- Eerste en derde `<p>` worden rood (komen direct na `<h2>`)
- Tweede `<p>` blijft normaal

**Praktisch gebruik:**
Vaak voor styling van intro paragraaf na een heading.

```css
h1 + p {
    font-size: 20px;
    color: gray;
    font-style: italic;
}
```

---

**5. Multiple Selectors (,) (10 min)**

**Wat is het?**
Meerdere elementen dezelfde styling geven.

**Syntax:** `selector1, selector2, selector3`

**Voorbeeld:**
```css
/* FOUT: herhalen */
h1 {
    color: darkblue;
    font-family: Arial, sans-serif;
}
h2 {
    color: darkblue;
    font-family: Arial, sans-serif;
}
h3 {
    color: darkblue;
    font-family: Arial, sans-serif;
}

/* GOED: combineren */
h1, h2, h3 {
    color: darkblue;
    font-family: Arial, sans-serif;
}
```

**Je kunt ook classes en elements combineren:**
```css
.belangrijke-tekst, .highlight, strong, .nadruk {
    font-weight: bold;
    color: red;
}
```

**Let op de komma!**
```css
/* GOED: komma = aparte selectors */
h1, p {
    margin-bottom: 20px;
}

/* FOUT: geen komma = descendant selector */
h1 p {
    /* Dit selecteert <p> BINNEN <h1> - bestaat meestal niet! */
}
```

---

**6. Pseudo-classes: :hover en :focus (20 min)**

**Wat zijn pseudo-classes?**
Speciale selectors voor specifieke states van elementen.

**:hover - Als je er met muis overheen gaat**

```css
a {
    color: blue;
    text-decoration: none;
}

a:hover {
    color: red;
    text-decoration: underline;
}
```

**Praktisch voorbeeld: Button met hover**
```html
<button class="mijn-button">Klik Hier</button>
```

```css
.mijn-button {
    background-color: blue;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.mijn-button:hover {
    background-color: darkblue;
}
```

**:focus - Als element focus heeft (bijv. input field)**

```css
input {
    border: 2px solid gray;
    padding: 10px;
}

input:focus {
    border-color: blue;
    outline: none;
    box-shadow: 0 0 5px lightblue;
}
```

**Combineren van selectors met pseudo-classes:**
```css
/* Alle links binnen .menu */
.menu a:hover {
    background-color: lightgray;
}

/* Alle inputs binnen een form */
form input:focus {
    border-color: green;
}
```

**Oefening 2 (10 min):**
Maak deze HTML na en style het:
```html
<div class="card">
    <h2>Product Naam</h2>
    <p>Omschrijving van het product.</p>
    <a href="#" class="meer-info">Meer Info</a>
</div>
```

**Opdrachten:**
1. Geef `.card` een border, padding en border-radius
2. Maak de `<h2>` binnen `.card` blauw
3. Maak de link (`.meer-info`) blauw zonder underline
4. Bij hover: link wordt rood en krijgt underline
5. Bij hover op de hele card: geef de card een shadow (`box-shadow: 0 4px 8px rgba(0,0,0,0.2)`)

---

**7. Grote Oefening: Combineer Alles (15 min)**

**Opdracht:**
Gegeven deze HTML, schrijf de CSS:

```html
<div class="website">
    <header>
        <h1>Mijn Website</h1>
        <nav>
            <a href="#home">Home</a>
            <a href="#over">Over</a>
            <a href="#contact">Contact</a>
        </nav>
    </header>

    <main>
        <article class="nieuws">
            <h2>Nieuws Artikel</h2>
            <p>Dit is de intro van het artikel.</p>
            <p>Dit is de rest van het artikel.</p>
            <a href="#">Lees Meer</a>
        </article>

        <aside>
            <h3>Advertentie</h3>
            <p>Koop nu!</p>
        </aside>
    </main>

    <footer>
        <p>Copyright 2024</p>
    </footer>
</div>
```

**Style de volgende dingen:**
1. Alle `<h1>`, `<h2>`, `<h3>` moeten `font-family: Arial, sans-serif` hebben
2. Alle `<p>` binnen `<main>` moeten `line-height: 1.6` hebben
3. De eerste `<p>` na elke `<h2>` moet groter zijn (font-size: 18px)
4. Alle links binnen `<nav>` moeten:
   - Geen underline hebben
   - Wit zijn (kleur)
   - Padding hebben (10px)
   - Bij hover: achtergrondkleur krijgen (bijv. donkerblauw)
5. Links binnen `.nieuws` moeten blauw zijn en bij hover onderstreept

---

### Huiswerk

**Opdracht 1: Selector Oefeningen (15 variaties)**

Maak een HTML pagina en style de volgende situaties:

1. Alle `<p>` binnen een `<article>` tag grijs maken
2. Alleen directe kinderen `<li>` van een `<ul>` groot maken
3. De eerste `<p>` na elke `<h2>` cursief maken
4. Alle `<h1>`, `<h2>`, `<h3>`, `<h4>` dezelfde font-family geven
5. Alle links binnen een `.sidebar` class kleiner maken
6. Alle inputs een border geven, en bij focus een andere kleur
7. Alle buttons een hover effect geven (kleur veranderen)
8. Alleen de directe `<p>` kinderen van `.content` padding geven
9. De eerste link in een `<nav>` een andere kleur geven
10. Alle images binnen een `.gallery` een border-radius geven
11. Bij hover op een `.card`: shadow toevoegen
12. Alle `<span>` binnen een `<p>` binnen een `.highlight` class bold maken
13. Links in de footer grijs maken, bij hover zwart
14. Alle `<li>` items binnen `.menu > ul` horizontaal maken (later leren we betere manieren!)
15. Een form met inputs die bij focus een glow effect krijgen (box-shadow)

**Opdracht 2: Maak een Mini Blog Post**

Maak een HTML pagina met:
- Een header met je naam
- Een blog post (article) met:
  - Titel (h2)
  - Intro paragraaf
  - 2-3 normale paragrafen
  - Een "Lees Meer" link
- Een sidebar met:
  - "Over Mij" sectie
  - Een paar links

**Style het met:**
- Descendant selectors voor tekst binnen article
- Child selectors waar nodig
- Adjacent sibling voor intro styling
- Multiple selectors voor alle headings
- Hover effects op alle links
- Een hover effect op de hele article (shadow)

**Bonus:**
Experimenteer met `:active` (als je klikt) en `:visited` (al bezochte links)!

---

### Controlelijst voor Docent
- [ ] Studenten begrijpen descendant selectors (spatie)
- [ ] Studenten begrijpen child selectors (>)
- [ ] Studenten begrijpen adjacent sibling (+)
- [ ] Studenten kunnen multiple selectors gebruiken (,)
- [ ] Studenten kunnen :hover toepassen
- [ ] Studenten kunnen :focus toepassen op inputs
- [ ] Studenten kunnen selectors combineren

### Tips voor Docent
- **DevTools gebruiken!** Laat zien hoe je de selector in DevTools ziet
- **Veel voorbeelden:** toon steeds de HTML en CSS naast elkaar
- **Veelgemaakte fout:** spatie vergeten bij descendant selector
- **Veelgemaakte fout:** komma vergeten bij multiple selectors
- **Laat studenten experimenteren** in DevTools met live editing
- **Visual feedback:** hover effecten zijn motiverend omdat je direct ziet wat er gebeurt!

### Resources
- [MDN: CSS Selectors](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Selectors)
- [CSS Diner](https://flukeout.github.io/) - Game om selectors te leren!

---
