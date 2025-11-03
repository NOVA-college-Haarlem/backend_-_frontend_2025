# Week 3: Layout Trucjes

## Leerdoelen
Na deze les kan de student:
- Float gebruiken voor layouts
- Clearfix toepassen
- Position (relative, absolute, fixed) begrijpen en toepassen
- Simpele 2-kolom layouts maken
- Elements positioneren met verschillende technieken

## Lesopbouw (90 minuten)

### 1. Float Basics (20 min)

**Wat is float?**
- Oorspronkelijk voor text-wrap bij afbeeldingen
- Kan ook voor layouts gebruikt worden

**Basis float:**
```css
.float-left {
    float: left;
    width: 200px;
    margin-right: 20px;
}

.float-right {
    float: right;
    width: 200px;
    margin-left: 20px;
}
```

**Text-wrap bij afbeeldingen:**
```css
.article-image {
    float: left;
    width: 300px;
    margin: 0 20px 20px 0;
}
```

**Oefening (10 min):**
Maak een artikel met een afbeelding die links floats en tekst die er omheen loopt.

### 2. Clearfix (15 min)

**Het probleem:**
Gefloate elementen komen uit hun container.

**De oplossing - Clearfix:**
```css
.clearfix::after {
    content: "";
    display: table;
    clear: both;
}
```

**Of met clear property:**
```css
.clear {
    clear: both;
}
```

**Oefening (10 min):**
Maak een container met 2 gefloate elementen en pas clearfix toe.

### 3. Position: Relative (15 min)

**Wat doet relative?**
- Element blijft in normal flow
- Kan verschoven worden ten opzichte van originele positie

```css
.relative-box {
    position: relative;
    top: 20px;
    left: 30px;
}
```

**Gebruik voor parent van absolute:**
```css
.card {
    position: relative;
}

.badge {
    position: absolute;
    top: 10px;
    right: 10px;
}
```

**Oefening (10 min):**
Maak een box die 20px naar beneden en rechts verschoven is.

### 4. Position: Absolute (20 min)

**Wat doet absolute?**
- Element uit normal flow
- Positioneert ten opzichte van positioned parent

**Basis absolute:**
```css
.parent {
    position: relative;
    width: 400px;
    height: 300px;
    border: 1px solid #ddd;
}

.child {
    position: absolute;
    top: 20px;
    right: 20px;
}
```

**Hoek positionering:**
```css
/* Rechtsboven */
.top-right {
    position: absolute;
    top: 10px;
    right: 10px;
}

/* Linksonder */
.bottom-left {
    position: absolute;
    bottom: 10px;
    left: 10px;
}

/* Gecentreerd */
.centered {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}
```

**Oefening (15 min):**
Maak een card met:
- Badge rechtsboven (absolute)
- Button linksonder (absolute)
- Titel gecentreerd over afbeelding (absolute)

### 5. Position: Fixed (15 min)

**Wat doet fixed?**
- Blijft op plek bij scrollen
- Positioneert ten opzichte van viewport

**Fixed header:**
```css
.header-fixed {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    background-color: white;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    z-index: 1000;
}

/* Voorkom content onder header */
body {
    padding-top: 80px;
}
```

**Fixed sidebar:**
```css
.sidebar-fixed {
    position: fixed;
    top: 80px;
    left: 0;
    width: 250px;
    height: calc(100vh - 80px);
    overflow-y: auto;
}
```

**Oefening (10 min):**
Maak een fixed header die blijft staan bij scrollen.

### 6. 2-Kolom Layout met Float (20 min)

**Simpele 2-kolom:**
```css
.container {
    max-width: 1200px;
    margin: 0 auto;
}

.container::after {
    content: "";
    display: table;
    clear: both;
}

.sidebar {
    float: left;
    width: 250px;
    background-color: #f9f9f9;
    padding: 20px;
}

.main-content {
    float: left;
    width: calc(100% - 290px);
    margin-left: 20px;
    padding: 20px;
}
```

**Met percentages:**
```css
.col-left {
    float: left;
    width: 30%;
    padding: 20px;
}

.col-right {
    float: left;
    width: 68%;
    margin-left: 2%;
    padding: 20px;
}
```

**Oefening (15 min):**
Maak een 2-kolom layout met sidebar links (30%) en content rechts (65%).

### 7. Z-index (10 min)

**Wat is z-index?**
- Bepaalt stapelvolgorde
- Werkt alleen met positioned elements

```css
.layer-1 {
    position: relative;
    z-index: 1;
}

.layer-2 {
    position: absolute;
    z-index: 2;
}

.layer-top {
    position: fixed;
    z-index: 1000;
}
```

**Typische z-index waardes:**
- Normal content: 1-10
- Dropdowns: 100-500
- Modals: 500-1000
- Fixed headers: 1000+

### 8. Afronding (5 min)
- Vragen?
- Volgende week: Projectweek!

## Huiswerk

**Opdracht: Maak een Blog Layout**

Bouw een blog-style pagina met:

**1. Fixed Header:**
- Logo links
- Navigation rechts
- Blijft staan bij scrollen

**2. Main Layout (2 kolommen):**
- Sidebar links (30%)
  - "Over Mij" card
  - "Categorieën" lijst
  - "Recente Posts" lijst
- Content rechts (65%)
  - 3 blog post cards
  - Met afbeeldingen
  - Titel, datum, excerpt
  - "Lees meer" button

**3. Gebruik:**
- Float voor 2-kolom layout
- Position voor badges op cards
- Clearfix waar nodig
- Fixed voor header

**Bonus:**
- Voeg een "Back to top" fixed button toe (rechtsonder)
- Maak featured post met absolute positioned badge
- Experimenteer met z-index voor overlays

## Tips voor Docent
- Float is lastig - veel oefening nodig
- Benadruk verschil tussen relative, absolute en fixed
- DevTools gebruiken om position te visualiseren
- Laat zien wat er gebeurt zonder clearfix
- Z-index kan verwarrend zijn - simpel houden

## Veelgemaakte Fouten
1. Vergeten clearfix bij floats
2. Geen `position: relative` op parent bij absolute child
3. Fixed element verdwijnt (verkeerde top/left waardes)
4. Breedte optelt tot > 100% bij floats
5. Z-index werkt niet (element is niet positioned)

---
