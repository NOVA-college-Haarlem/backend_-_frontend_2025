# Week 1: Cards Bouwen

## Leerdoelen
Na deze les kan de student:
- Begrijpen wat cards zijn en waarvoor ze gebruikt worden
- Een basis card structuur maken met HTML
- Cards stylen met borders, shadows en spacing
- Card layouts maken met inline-block
- Hover effecten toevoegen aan cards

## Lesopbouw (90 minuten)

### 1. Wat zijn Cards? (10 min)

**Waarom cards?**
- Meest gebruikte component op websites
- Organiseert informatie in hapklare stukken
- Werkt voor alles: producten, posts, portfolios, teams

**Voorbeelden tonen:**
- Netflix (film cards)
- Instagram (post cards)
- Webshops (product cards)
- Portfolio sites (project cards)

### 2. Card Anatomie (15 min)

**Basis card bestaat uit:**
```html
<div class="card">
    <img src="images/product.jpg" alt="Product">
    <h3>Card Titel</h3>
    <p>Korte beschrijving van de content in deze card.</p>
    <a href="#" class="btn">Lees meer</a>
</div>
```

**Elementen:**
- **Image**: Visuele aantrekkingskracht
- **Title**: Wat is het?
- **Description**: Korte uitleg
- **Button/Link**: Call to action

### 3. Basis Card Styling (25 min)

**Container styling:**
```css
.card {
    width: 300px;
    border: 1px solid #ddd;
    border-radius: 8px;
    overflow: hidden;
    background-color: white;
}
```

**Image styling:**
```css
.card img {
    width: 100%;
    height: 200px;
    object-fit: cover;
    display: block;
}
```

**Content padding:**
```css
.card-content {
    padding: 20px;
}

.card h3 {
    margin: 0 0 10px 0;
    color: #333;
}

.card p {
    color: #666;
    line-height: 1.6;
    margin-bottom: 15px;
}
```

**Oefening (15 min):**
Maak een product card met:
- Een afbeelding
- Productnaam als h3
- Korte beschrijving
- Een "Bekijk" button

### 4. Box Shadow toevoegen (15 min)

**Basis shadow:**
```css
.card {
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
```

**Shadow parameters:**
```css
/* horizontal vertical blur spread color */
box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
```

**Verschillende shadow stijlen:**
```css
/* Subtiel */
.card-subtle {
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12);
}

/* Medium */
.card-medium {
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

/* Prominent */
.card-prominent {
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
}
```

**Oefening (10 min):**
Experimenteer met verschillende box-shadow waardes op je card.

### 5. Hover Effecten (20 min)

**Shadow veranderen bij hover:**
```css
.card {
    transition: box-shadow 0.3s ease;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.card:hover {
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}
```

**Card omhoog laten bewegen:**
```css
.card {
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.card:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15);
}
```

**Image zoom effect:**
```css
.card {
    overflow: hidden;
}

.card img {
    transition: transform 0.3s ease;
}

.card:hover img {
    transform: scale(1.1);
}
```

**Oefening (10 min):**
Voeg een hover effect toe aan je card:
- Shadow wordt groter
- Card beweegt iets omhoog
- Of: image zoomt in

### 6. Cards Naast Elkaar (20 min)

**Met inline-block:**
```css
.card {
    width: 300px;
    display: inline-block;
    vertical-align: top;
    margin: 15px;
}
```

**Container voor cards:**
```css
.cards-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
    text-align: center;
}
```

**Responsive breedte met percentages:**
```css
.card {
    width: 30%;
    min-width: 280px;
    max-width: 350px;
    display: inline-block;
    vertical-align: top;
    margin: 1.5%;
}
```

**Oefening (15 min):**
Maak 3 cards naast elkaar:
- Gebruik inline-block
- Geef ze margin tussen
- Zorg dat ze op één lijn staan

### 7. Afronding (5 min)
- Vragen?
- Volgende week: meer card variaties!

## Huiswerk

**Opdracht: Maak een Portfolio Cards Pagina**

Maak een pagina met minimaal 6 cards over één van deze onderwerpen:
- Je favoriete films
- Je favoriete games
- Portfolio projecten
- Team members
- Product catalogus

**Vereisten:**
1. **Elke card moet hebben:**
   - Afbeelding (200px hoog)
   - Titel (h3)
   - Beschrijving (2-3 zinnen)
   - Button of link

2. **Styling:**
   - Border radius (8px)
   - Box shadow
   - Padding in content (20px)
   - Hover effect (shadow + transform)

3. **Layout:**
   - 3 cards per rij
   - Centered met max-width container
   - Margin tussen cards

**Bonus uitdagingen:**
- Voeg een badge toe ("Nieuw!", "Populair")
- Maak image hover zoom effect
- Voeg een footer toe aan de card
- Experimenteer met verschillende border-radius waardes

## Tips voor Docent
- Laat veel voorbeelden zien van cards op echte websites
- Benadruk: "Cards zijn overal!"
- Laat studenten experimenteren met shadows
- DevTools gebruiken om box-shadow te visualiseren
- Leg overflow: hidden uit voor image effects

## Veelgemaakte Fouten
1. Vergeten `vertical-align: top` bij inline-block
2. Geen `overflow: hidden` bij border-radius en image
3. Image niet `display: block` (witte ruimte onder)
4. Geen transition bij hover effecten
5. Cards te breed voor de container (> 100% totaal)

---
