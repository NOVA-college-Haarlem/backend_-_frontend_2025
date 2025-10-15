# Blok 3 - Frontend Ontwikkeling Samenvatting

**Doelgroep:** MBO studenten (HTML, CSS, Components uit Blok 1 & 2)
**Duur:** 6 weken
**Focus:** Modern CSS Layouts (Flexbox & CSS Grid)

---

## Overzicht

Na Blok 2 kennen studenten alle basis componenten (buttons, cards, forms, navigatie) en kunnen ze simpele layouts maken met float en inline-block.

Blok 3 introduceert **moderne layout systemen** die het maken van complexe, responsive layouts veel makkelijker maken.

---

## Week 1: Introductie Flexbox
**Leerdoelen:**
- Uitleggen wat Flexbox is en waarom het gebruikt wordt
- Een flex container aanmaken met `display: flex`
- De `flex-direction` property toepassen voor verschillende layouts
- Items uitlijnen met `justify-content` en `align-items`
- Een horizontale navigatiebalk bouwen met Flexbox (beter dan Week 5!)
- Card layouts maken met Flexbox

**Waarom beter dan Blok 2 methodes?**
- Geen clearfix nodig
- Geen margin hacks
- Responsive van nature
- Items kunnen groeien en krimpen

---

## Week 2: Advanced Flexbox & Responsive Design
**Leerdoelen:**
- De flex item properties gebruiken: `flex-grow`, `flex-shrink`, `flex-basis`
- De `flex` shorthand property toepassen
- `flex-wrap` gebruiken voor meerdere rijen
- `align-content` toepassen bij meerdere rijen
- Media queries dieper toepassen voor responsive layouts
- Een responsive image gallery bouwen (beter dan inline-block!)

---

## Week 3: Praktische Flexbox Projecten
**Leerdoelen:**
- Complete page layouts bouwen met Flexbox
- De "Holy Grail" layout implementeren
- Meerdere flex containers combineren in één pagina
- Een volledig responsive landing page bouwen
- Modern UI patronen toepassen (hero sections, feature grids)
- Cards van Blok 2 verbeteren met Flexbox

---

## Week 4: Introductie CSS Grid
**Leerdoelen:**
- Uitleggen wat CSS Grid is en wanneer je het gebruikt vs Flexbox
- Een grid container aanmaken met `display: grid`
- Kolommen en rijen definiëren met `grid-template-columns` en `grid-template-rows`
- De `fr` unit gebruiken voor flexibele grid tracks
- `gap` gebruiken voor ruimte tussen grid items
- Items positioneren met `grid-column` en `grid-row`
- Een foto gallery maken met Grid (beter dan inline-block!)

---

## Week 5: Advanced CSS Grid
**Leerdoelen:**
- Grid Template Areas gebruiken voor overzichtelijke layouts
- `auto-fit` en `auto-fill` toepassen voor automatisch responsive grids
- `minmax()` gebruiken voor flexibele maar gecontroleerde afmetingen
- Grid en Flexbox combineren in één layout
- Complexe magazine-style layouts bouwen
- Dashboard layouts maken

---

## Week 6: Eindproject - Complete Responsive Website
**Project:** Portfolio of bedrijfswebsite met moderne layouts
**Leerdoelen:**
- Zelfstandig een complete responsive website bouwen
- Flexbox en Grid slim combineren
- Beslissen wanneer Flexbox vs Grid te gebruiken
- Components van Blok 2 integreren met layouts van Blok 3
- Presenteren en feedback geven

---

## Wat heb je aan het einde van Blok 3 geleerd?

### Flexbox Skills:
✅ Container properties (display, flex-direction, justify-content, align-items)
✅ Item properties (flex-grow, flex-shrink, flex-basis)
✅ Flex-wrap voor multi-line layouts
✅ Perfect centreren (horizontaal + verticaal)
✅ Navigatie bars (horizontaal en verticaal)
✅ Card grids die responsive zijn
✅ Complex nested flex containers

### CSS Grid Skills:
✅ Grid container opzetten (display, grid-template-columns/rows)
✅ Fr units voor flexibele tracks
✅ Gap voor spacing
✅ Grid-column en grid-row voor positionering
✅ Grid template areas voor leesbare layouts
✅ Auto-fit en auto-fill voor responsive grids
✅ Minmax() voor flexible sizing
✅ 2D layouts (rijen EN kolommen tegelijk)

### Integration Skills:
✅ Wanneer Flexbox vs Grid gebruiken
✅ Flexbox en Grid combineren
✅ Components van Blok 2 in moderne layouts plaatsen
✅ Responsive design met media queries
✅ Complete, professionele websites bouwen

---

## Vergelijking: Voor en Na

### Navigatie Bar:
**Blok 2 (float/inline-block):**
```css
.nav li {
    display: inline-block;
    /* Spacing hacks met margin */
}
```

**Blok 3 (Flexbox):**
```css
.nav {
    display: flex;
    gap: 20px;  /* Clean spacing! */
}
```

### Gallery:
**Blok 2 (inline-block):**
```css
.gallery-item {
    display: inline-block;
    width: 30%;
    /* Witte ruimte tussen items */
}
```

**Blok 3 (Grid):**
```css
.gallery {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;  /* Perfect spacing! */
}
```

### 2-Kolom Layout:
**Blok 2 (float + clearfix):**
```css
.sidebar {
    float: left;
    width: 250px;
}
.content {
    margin-left: 270px;
}
.clearfix::after { /* Clearfix needed */ }
```

**Blok 3 (Grid):**
```css
.container {
    display: grid;
    grid-template-columns: 250px 1fr;
    gap: 20px;
}
```

---

## Voorbereiding op Verder

Na Blok 3 hebben studenten een complete frontend skillset:
- **HTML** (semantisch, toegankelijk)
- **CSS Components** (buttons, cards, forms, navigatie)
- **CSS Layouts** (Flexbox en Grid)
- **Responsive Design** (media queries, mobile-first)

**Volgende stappen kunnen zijn:**
- JavaScript basics
- DOM manipulation
- Interactiviteit toevoegen
- Formulieren en validatie
- API's integreren
- Frameworks (React, Vue)
- Backend integratie

---

## Tips voor Docenten

### Blok 3 Aanpak:
1. **Laat het verschil zien:** Vergelijk oude methodes (Blok 2) met nieuwe (Blok 3)
2. **Veel oefenen:** Flexbox en Grid vereisen veel practice
3. **DevTools:** Gebruik browser DevTools Flexbox/Grid overlays!
4. **Real-world:** Laat zien hoe professionele sites het gebruiken
5. **Combineren:** Leer wanneer Flexbox vs Grid te gebruiken

### Studenten zullen blij zijn:
- "Dit is zoveel makkelijker dan float!"
- "Waarom hebben we dit niet eerder geleerd?"
- → Dit is waarom je eerst de moeilijke weg leert! 😊

---

**Veel succes met Blok 3! 🚀**
