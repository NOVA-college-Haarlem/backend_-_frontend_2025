# Week 7: Flexbox Praktijk

## Leerdoelen
Na deze les kan de student:
- Veel oefening met Flexbox in verschillende scenarios
- Veelvoorkomende layout patronen bouwen met Flexbox
- Problemen oplossen met Flexbox
- Flexbox combineren met cards en andere componenten

## Lesopbouw (90 minuten)

### 1. Terugblik (5 min)
- Wat vonden jullie lastig aan Flexbox?
- Welke properties zijn het handigst?

### 2. Card Grid met Flexbox (20 min)

**Van inline-block naar Flexbox:**
```css
/* OUD (inline-block) */
.card {
    display: inline-block;
    width: 30%;
    vertical-align: top;
}

/* NIEUW (Flexbox) */
.cards-container {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
}

.card {
    flex: 1 1 300px;
    max-width: calc(33.333% - 20px);
}
```

**Oefening (15 min):**
Converteer je card layout van Week 1-2 naar Flexbox.

### 3. Navigation Patterns (20 min)

**Horizontal nav met space-between:**
```css
nav {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px;
}

.logo {
    font-size: 24px;
}

.nav-links {
    display: flex;
    gap: 20px;
}
```

**Centered nav:**
```css
nav {
    display: flex;
    justify-content: center;
    gap: 30px;
}
```

**Oefening (15 min):**
Maak 3 verschillende navigatie layouts met Flexbox.

### 4. Perfect Centering (15 min)

**Horizontaal en verticaal:**
```css
.hero {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    text-align: center;
}
```

**Oefening (10 min):**
Maak een hero section met perfect gecentreerde content.

### 5. Responsive Column Layouts (25 min)

**2-kolom met Flexbox:**
```css
.container {
    display: flex;
    gap: 40px;
}

.sidebar {
    flex: 0 0 250px;
}

.main-content {
    flex: 1;
}
```

**3-kolom equal width:**
```css
.three-col {
    display: flex;
    gap: 20px;
}

.col {
    flex: 1;
}
```

**Oefening (20 min):**
Maak een layout met:
- Header (Flexbox nav)
- 2-kolom content (sidebar + main)
- Footer

### 6. Common Patterns (15 min)

**Media object:**
```css
.media {
    display: flex;
    gap: 20px;
}

.media-image {
    flex: 0 0 100px;
}

.media-content {
    flex: 1;
}
```

**Split screen:**
```css
.split {
    display: flex;
    height: 100vh;
}

.split-left,
.split-right {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: center;
}
```

**Oefening (10 min):**
Maak een media object (afbeelding links, content rechts).

### 7. Troubleshooting (10 min)

**Veelvoorkomende problemen:**

**Items te groot?**
```css
/* PROBLEEM */
.item {
    flex: 1;
    min-width: 500px; /* Te breed! */
}

/* OPLOSSING */
.item {
    flex: 1;
    min-width: 200px;
}
```

**Items passen niet?**
```css
/* Voeg flex-wrap toe */
.container {
    display: flex;
    flex-wrap: wrap;
}
```

**Items niet uitgelijnd?**
```css
/* Check align-items */
.container {
    display: flex;
    align-items: stretch; /* of flex-start, center, etc. */
}
```

### 8. Afronding (5 min)
- Vragen?
- Volgende week: Eindproject!

## Huiswerk

**Opdracht: Rebuild je Blok 2 Eindproject met Flexbox**

Neem je eindproject van Blok 2 en vervang ALLE layouts door Flexbox:

**Te vervangen:**
1. **Navigatie** - Van floats naar Flexbox
2. **Hero section** - Perfect centered met Flexbox
3. **Feature cards** - Van inline-block naar Flexbox
4. **2-kolom secties** - Van floats naar Flexbox
5. **Footer** - Flexbox layout

**Vergelijk:**
- Hoeveel code scheelt het?
- Is het makkelijker?
- Werkt het beter?

**Bonus:**
- Maak een comparison document (voor/na screenshots)
- Voeg extra Flexbox features toe
- Experimenteer met flex-grow en flex-shrink

## Tips voor Docent
- Dit is een herhaling/oefening week
- Veel hands-on practice
- Loop constant rond
- Help bij debuggen
- Laat studenten elkaar helpen
- Vier de "aha!" momenten wanneer Flexbox klikt

## Veelgemaakte Fouten
1. Vergeten `display: flex` op parent
2. `flex-wrap` vergeten bij te veel items
3. Conflicterende width en flex properties
4. `align-items` vs `justify-content` door elkaar
5. Vergeten `gap` toe te voegen

---
