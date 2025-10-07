
## Week 6: Het Box Model

### Leerdoelen
Na deze les kan de student:
- Het CSS box model uitleggen (content, padding, border, margin)
- Padding en margin toepassen
- Borders toevoegen en stylen
- DevTools gebruiken om het box model te inspecteren

### Lesopbouw (90 minuten)

**1. Introductie Box Model (15 min)**

**Wat is het Box Model?**
- Elk HTML element is eigenlijk een "doos"
- Die doos bestaat uit lagen:
  1. **Content** - De inhoud (tekst, afbeelding)
  2. **Padding** - Ruimte rondom de inhoud, binnen de rand
  3. **Border** - De rand zelf
  4. **Margin** - Ruimte buiten de rand, tussen elementen

**Visualisatie:**
Teken op het bord of laat diagram zien:
```
┌─────────────────────────┐
│       MARGIN            │
│  ┌──────────────────┐   │
│  │    BORDER        │   │
│  │  ┌───────────┐   │   │
│  │  │  PADDING  │   │   │
│  │  │ ┌───────┐ │   │   │
│  │  │ │CONTENT│ │   │   │
│  │  │ └───────┘ │   │   │
│  │  └───────────┘   │   │
│  └──────────────────┘   │
└─────────────────────────┘
```

**2. Padding (20 min)**

**Wat is padding?**
- Ruimte BINNEN het element
- Maakt de "doos" groter
- Achtergrondkleur strekt uit tot aan de padding

**Voorbeelden:**
```css
.kaart {
    background-color: lightblue;
    padding: 20px;
}
```

**Verschillende kanten:**
```css
.kaart {
    padding-top: 10px;
    padding-right: 20px;
    padding-bottom: 10px;
    padding-left: 20px;
}

/* Shorthand (boven rechts onder links - kloksgewijs): */
.kaart {
    padding: 10px 20px 10px 20px;
}

/* Nog korter (boven/onder rechts/links): */
.kaart {
    padding: 10px 20px;
}
```

**Oefening (10 min):**
```html
<div class="info-box">
    <h2>Informatie</h2>
    <p>Dit is een tekstblok met padding.</p>
</div>
```

```css
.info-box {
    background-color: lightyellow;
    padding: 20px;
}
```

Laat studenten experimenteren met verschillende padding waarden.

**3. Border (15 min)**

**Wat is border?**
- De rand van het element
- Kan verschillende stijlen, diktes en kleuren hebben

**Voorbeelden:**
```css
.omlijnd {
    border: 2px solid black;
}

.gestippeld {
    border: 3px dotted red;
}

.dik {
    border: 5px solid blue;
}
```

**Border properties apart:**
```css
.custom-border {
    border-width: 3px;
    border-style: solid;
    border-color: green;
}
```

**Veel gebruikte border-styles:**
- `solid` - Doorlopende lijn
- `dashed` - Streepjes
- `dotted` - Stippen
- `none` - Geen rand

**Oefening:**
Maak kaartjes met verschillende borders en probeer combinaties met padding.

**4. Margin (20 min)**

**Wat is margin?**
- Ruimte BUITEN het element
- Duwt andere elementen weg
- Is NIET deel van de achtergrondkleur

**Voorbeelden:**
```css
.afstand {
    margin: 20px;
}

.alleen-boven {
    margin-top: 30px;
}

.alleen-onder {
    margin-bottom: 15px;
}
```

**Centreren met margin:**
```css
.gecentreerd {
    width: 50%;
    margin-left: auto;
    margin-right: auto;
}

/* Of korter: */
.gecentreerd {
    width: 50%;
    margin: 0 auto;
}
```

**5. DevTools voor Box Model (15 min)**

**Demonstratie:**
1. Open een pagina met gestylede elementen
2. Open DevTools (F12)
3. Selecteer een element
4. Kijk onderaan naar de "box model visualisatie"
5. Zie de kleuren:
   - Groen = margin
   - Oranje/beige = padding
   - Blauw = content

**Samen doen:**
- Open eigen pagina
- Inspecteer verschillende elementen
- Bekijk hun box model
- Verander live padding/margin in DevTools
- Zie wat gebeurt

**Oefening:**
Inspecteer een professionele website en kijk naar hun box model:
- Hoeveel padding gebruiken ze voor knoppen?
- Hoeveel margin tussen secties?

**6. Praktische Oefening (10 min)**

Maak "kaartjes":
```html
<div class="kaart">
    <h3>Kaart Titel</h3>
    <p>Wat informatie op de kaart.</p>
</div>

<div class="kaart">
    <h3>Nog een Kaart</h3>
    <p>Nog meer informatie.</p>
</div>
```

```css
.kaart {
    background-color: white;
    border: 1px solid #ddd;
    padding: 20px;
    margin-bottom: 20px;
}
```

**7. Afronding (5 min)**
- Vragen?
- Volgende week: Semantische HTML!

### Huiswerk
Voeg toe aan je hobby-pagina:
- Geef alle paragrafen `padding: 15px`
- Voeg een `border` toe aan afbeeldingen
- Gebruik `margin-bottom` om ruimte tussen secties te maken
- Maak een "kaart" class die je kunt hergebruiken
- Gebruik DevTools om je box model te inspecteren

---

