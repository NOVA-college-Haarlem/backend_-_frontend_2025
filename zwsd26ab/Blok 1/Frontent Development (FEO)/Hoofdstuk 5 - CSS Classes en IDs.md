## Hoofdstuk 5: CSS Classes en IDs

### Leerdoelen
Na deze les kan de student:
- Het verschil uitleggen tussen classes en IDs
- Classes en IDs correct toepassen in HTML en CSS
- Meerdere classes op één element gebruiken
- Beslissen wanneer je een class of ID gebruikt

### Lesopbouw (90 minuten)

**1. Terugblik Project (10 min)**
- Wat ging goed?
- Wat vonden jullie moeilijk?
- Korte showcase: 2-3 studenten laten hun pagina zien

**2. Probleem Schetsen (10 min)**
- **Scenario:** Je hebt 3 paragrafen. Twee moeten blauw, één moet rood.
- **Probeer samen met huidige kennis:**
  ```css
  p {
      color: blue;
  }
  ```
  Maar dan is die ene paragraaf ook blauw! Hoe lossen we dit op?

**3. Classes Introductie (25 min)**

**Wat zijn classes?**
- Een manier om specifieke elementen te selecteren
- Herbruikbaar: meerdere elementen kunnen dezelfde class hebben
- Begint met een `.` in CSS

**Voorbeeld:**
```html
<p class="belangrijk">Deze tekst is belangrijk.</p>
<p>Deze tekst is normaal.</p>
<p class="belangrijk">Deze tekst is ook belangrijk.</p>
```

```css
.belangrijk {
    color: red;
    font-weight: bold;
}
```

**Meerdere classes:**
```html
<p class="belangrijk groot">Deze tekst heeft twee classes.</p>
```

```css
.belangrijk {
    color: red;
}

.groot {
    font-size: 24px;
}
```

**Oefening (10 min):**
- Maak 5 paragrafen
- Geef sommige de class "highlight"
- Style de highlight class met een gele achtergrond en dikke tekst

**4. IDs Introductie (20 min)**

**Wat zijn IDs?**
- Ook een manier om elementen te selecteren
- UNIEK: slechts één element per pagina mag deze ID hebben
- Begint met een `#` in CSS

**Voorbeeld:**
```html
<h1 id="hoofd-titel">Welkom op Mijn Website</h1>
```

```css
#hoofd-titel {
    color: darkblue;
    text-align: center;
}
```

**Wanneer gebruik je wat?**
- **Class:** Als meerdere elementen dezelfde styling nodig hebben
- **ID:** Als je één specifiek element wilt stylen (bijvoorbeeld de hoofdtitel)

**Vuistregel:**
- IDs gebruik je weinig (misschien 1-3 per pagina)
- Classes gebruik je vaak

**5. Praktische Voorbeelden (20 min)**

**Voorbeeld 1: Knoppenstijl**
```html
<a href="#" class="knop">Klik hier</a>
<a href="#" class="knop">Meer info</a>
```

```css
.knop {
    background-color: blue;
    color: white;
    padding: 10px;
    text-decoration: none;
}
```

**Voorbeeld 2: Verschillende tekstsoorten**
```html
<p class="intro">Dit is de introductie tekst.</p>
<p>Dit is normale tekst.</p>
<p class="opmerking">Dit is een opmerking.</p>
```

```css
.intro {
    font-size: 20px;
    font-weight: bold;
}

.opmerking {
    font-style: italic;
    color: gray;
}
```

**Gezamenlijke oefening:**
- Maak een pagina met verschillende tekstsoorten
- Gebruik classes voor: intro-tekst, belangrijke-info, footer-tekst
- Gebruik één ID voor de hoofdtitel

**6. Afronding (5 min)**
- Vragen?
- Volgende week: Box model!

### Huiswerk
Herschrijf je hobby-pagina van week 4:
- Voeg minstens 3 verschillende classes toe
- Gebruik 1 ID voor je hoofdtitel
- Experimenteer met verschillende styles per class
- Maak een class "highlight" voor tekst die extra moet opvallen

**Extra uitdaging:**
- Maak een class "button" voor je links die er als knoppen uitzien
- Combineer classes (bijv. class="tekst groot belangrijk")
- Gebruik een ID voor je footer

### Controlelijst voor docent
- [ ] Studenten begrijpen verschil tussen classes en IDs
- [ ] Studenten kunnen classes toevoegen in HTML
- [ ] Studenten kunnen classes stylen in CSS met `.`
- [ ] Studenten kunnen IDs stylen in CSS met `#`
- [ ] Studenten begrijpen wanneer je classes gebruikt vs IDs
- [ ] Studenten kunnen meerdere classes op één element gebruiken

### Tips voor docent
- Herhaal het verschil tussen classes (herbruikbaar) en IDs (uniek) meerdere keren
- Laat studenten vaak de browser verversen om hun wijzigingen te zien
- Gebruik kleurrijke voorbeelden - dat maakt het visueler en leuker
- Loop rond terwijl studenten oefenen en help waar nodig
- Laat studenten elkaars werk bekijken voor inspiratie

---
