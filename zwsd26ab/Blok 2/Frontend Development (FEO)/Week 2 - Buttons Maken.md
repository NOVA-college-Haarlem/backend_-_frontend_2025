# Frontend Ontwikkeling - Blok 2

## Week 2: Buttons Maken (Veel Variaties!)

### Algemene Informatie
- **Doelgroep:** MBO studenten
- **Lesduur:** 90 minuten
- **Voorkennis:** CSS selectoren, box model, :hover
- **Tools:** VS Code, Browser

---

### Leerdoelen
Na deze les kan de student:
- Button basics stylen (padding, border, border-radius, background)
- Verschillende button types maken (primary, secondary, outline, danger)
- Button sizes implementeren (klein, normaal, groot)
- Hover en active states toevoegen
- Disabled button states maken
- `cursor: pointer` toepassen voor betere UX
- Buttons toegankelijk maken

---

### Lesopbouw (90 minuten)

**1. Introductie: Waarom zijn Buttons Belangrijk? (10 min)**

**Vraag aan de klas:**
"Waar zie je buttons op websites?"
- "Koop Nu" buttons
- "Aanmelden" buttons
- "Meer Info" links die eruitzien als buttons
- "Verzenden" in formulieren

**Demo: Slechte vs Goede Button**

Slecht (ongestylde HTML):
```html
<button>Klik Hier</button>
```

Goed (gestyled):
```html
<button class="btn-primary">Klik Hier</button>
```
```css
.btn-primary {
    background-color: #007bff;
    color: white;
    padding: 12px 24px;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
}

.btn-primary:hover {
    background-color: #0056b3;
}
```

**Het verschil is enorm!**

---

**2. Button Basics - Anatomie van een Button (15 min)**

**De Basis Properties:**

```css
.btn {
    /* Tekst */
    color: white;
    font-size: 16px;
    font-weight: bold;
    text-align: center;

    /* Ruimte */
    padding: 10px 20px;  /* boven/onder links/rechts */

    /* Rand */
    border: none;  /* Of: 2px solid blue */
    border-radius: 5px;  /* Afgeronde hoeken */

    /* Achtergrond */
    background-color: blue;

    /* Cursor */
    cursor: pointer;  /* Handjes cursor */

    /* Display */
    display: inline-block;  /* Belangrijker voor <a> tags */
}
```

**Samen Doen: Eerste Button (10 min)**

HTML:
```html
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <title>Mijn Buttons</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Button Oefeningen</h1>

    <button class="btn-basis">Mijn Eerste Button</button>
</body>
</html>
```

CSS - Stap voor stap opbouwen:
```css
/* Stap 1: Tekst en kleur */
.btn-basis {
    color: white;
    background-color: #3498db;
}
/* Test in browser - nog niet mooi! */

/* Stap 2: Ruimte toevoegen */
.btn-basis {
    color: white;
    background-color: #3498db;
    padding: 10px 20px;
}
/* Beter! Maar nog geen ronde hoeken */

/* Stap 3: Border styling */
.btn-basis {
    color: white;
    background-color: #3498db;
    padding: 10px 20px;
    border: none;  /* Standaard border weg */
    border-radius: 5px;
}
/* Nu ziet het er al goed uit! */

/* Stap 4: Cursor en font */
.btn-basis {
    color: white;
    background-color: #3498db;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
}
/* Perfect! */

/* Stap 5: Hover effect */
.btn-basis:hover {
    background-color: #2980b9;  /* Donkerder blauw */
}
```

**Oefening 1 (5 min):**
Maak je eigen button met jouw favoriete kleur!

---

**3. Button Types: Primary, Secondary, Danger (20 min)**

**Waarom verschillende types?**
- **Primary:** Belangrijkste actie (bijv. "Kopen", "Aanmelden")
- **Secondary:** Minder belangrijke actie (bijv. "Annuleren", "Meer Info")
- **Danger/Warning:** Gevaarlijke actie (bijv. "Verwijderen", "Account Sluiten")
- **Success:** Positieve actie (bijv. "Opslaan", "Bevestigen")

**HTML:**
```html
<button class="btn btn-primary">Primary Button</button>
<button class="btn btn-secondary">Secondary Button</button>
<button class="btn btn-danger">Danger Button</button>
<button class="btn btn-success">Success Button</button>
```

**CSS Strategie: Basis + Varianten**

```css
/* Basis styling voor ALLE buttons */
.btn {
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: all 0.3s ease;  /* Smooth transitions */
}

/* Primary button - blauw */
.btn-primary {
    background-color: #007bff;
    color: white;
}

.btn-primary:hover {
    background-color: #0056b3;
}

/* Secondary button - grijs */
.btn-secondary {
    background-color: #6c757d;
    color: white;
}

.btn-secondary:hover {
    background-color: #545b62;
}

/* Danger button - rood */
.btn-danger {
    background-color: #dc3545;
    color: white;
}

.btn-danger:hover {
    background-color: #c82333;
}

/* Success button - groen */
.btn-success {
    background-color: #28a745;
    color: white;
}

.btn-success:hover {
    background-color: #218838;
}
```

**Uitleg `transition`:**
```css
transition: all 0.3s ease;
/* all: alle properties die veranderen */
/* 0.3s: duur van de transitie (0.3 seconden) */
/* ease: soepele animatie */
```

**Oefening 2 (10 min):**
Maak deze 4 button types na. Test de hover effecten!

**Bonus:** Voeg een 5e button type toe (bijv. "Warning" in oranje, of "Info" in lichtblauw)

---

**4. Outline Buttons (10 min)**

**Wat zijn Outline Buttons?**
Buttons met alleen een border, geen fill. Populair in modern design!

```html
<button class="btn btn-outline-primary">Outline Primary</button>
<button class="btn btn-outline-secondary">Outline Secondary</button>
```

```css
/* Outline Primary */
.btn-outline-primary {
    background-color: transparent;  /* Geen achtergrond */
    color: #007bff;                 /* Tekst is blauw */
    border: 2px solid #007bff;      /* Border is blauw */
}

.btn-outline-primary:hover {
    background-color: #007bff;      /* Bij hover: vult op */
    color: white;                    /* Tekst wordt wit */
}

/* Outline Secondary */
.btn-outline-secondary {
    background-color: transparent;
    color: #6c757d;
    border: 2px solid #6c757d;
}

.btn-outline-secondary:hover {
    background-color: #6c757d;
    color: white;
}
```

**Het "Flip" Effect:**
Bij hover verandert de button van outline naar filled!

**Oefening 3 (5 min):**
Maak een outline danger button en een outline success button.

---

**5. Button Sizes: Small, Normal, Large (15 min)**

**Waarom verschillende groottes?**
- **Large:** Voor belangrijke "Call to Action" buttons
- **Normal:** Standaard buttons
- **Small:** Voor minder belangrijke acties, of in nauwe ruimtes

```html
<button class="btn btn-primary btn-sm">Klein</button>
<button class="btn btn-primary">Normaal</button>
<button class="btn btn-primary btn-lg">Groot</button>
```

```css
/* Basis button (normaal) */
.btn {
    padding: 10px 20px;
    font-size: 16px;
}

/* Small button */
.btn-sm {
    padding: 5px 10px;
    font-size: 14px;
}

/* Large button */
.btn-lg {
    padding: 15px 30px;
    font-size: 18px;
}
```

**Extra Large voor Hero Sections:**
```css
.btn-xl {
    padding: 20px 40px;
    font-size: 22px;
    border-radius: 50px;  /* Heel rond! */
}
```

**Oefening 4 (5 min):**
Maak een pagina met 9 buttons:
- 3 groottes (klein, normaal, groot)
- 3 types (primary, secondary, danger)

Dus: klein-primary, klein-secondary, klein-danger, etc.

---

**6. Disabled State (10 min)**

**Wanneer gebruik je disabled?**
- Formulier nog niet compleet
- Actie niet beschikbaar
- Tijdens laden van data

**HTML:**
```html
<button class="btn btn-primary" disabled>Disabled Button</button>
<button class="btn btn-primary btn-disabled">Ook Disabled</button>
```

**CSS:**
```css
/* Met disabled attribuut */
.btn:disabled {
    background-color: #ccc;
    color: #666;
    cursor: not-allowed;  /* Verboden cursor */
    opacity: 0.6;
}

/* Of met een class */
.btn-disabled {
    background-color: #ccc;
    color: #666;
    cursor: not-allowed;
    opacity: 0.6;
    pointer-events: none;  /* Geen hover effect */
}
```

**Hover werkt niet bij disabled:**
```css
.btn-primary:disabled:hover {
    background-color: #ccc;  /* Blijft grijs */
}
```

---

**7. Extra Button Effecten (10 min)**

**Active State (als je klikt):**
```css
.btn-primary:active {
    transform: scale(0.98);  /* Iets kleiner */
    box-shadow: 0 2px 4px rgba(0,0,0,0.2);
}
```

**Shadow Effect:**
```css
.btn {
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.btn:hover {
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);  /* Grotere shadow */
    transform: translateY(-2px);  /* Iets omhoog */
}
```

**Glow Effect:**
```css
.btn-primary:hover {
    box-shadow: 0 0 20px rgba(0, 123, 255, 0.5);
}
```

**Oefening 5 (5 min):**
Maak een button die:
1. Standaard een kleine shadow heeft
2. Bij hover: grotere shadow + iets omhoog gaat
3. Bij klikken (:active): iets kleiner wordt

---

**8. Button met Icoon (Emoji) (5 min)**

**Buttons zijn leuker met iconen!**

```html
<button class="btn btn-primary">📧 Email Versturen</button>
<button class="btn btn-success">✅ Opslaan</button>
<button class="btn btn-danger">🗑️ Verwijderen</button>
<button class="btn btn-secondary">ℹ️ Meer Info</button>
```

Geen extra CSS nodig! Emoji's werken gewoon.

**Extra ruimte tussen icoon en tekst:**
```css
.btn {
    padding: 10px 20px;
}

/* Optioneel: extra ruimte */
.btn::before {
    margin-right: 5px;
}
```

---

### Grote Oefening: Button Library (laatste 10 min van de les)

**Opdracht:**
Maak een HTML pagina met een "Button Library" - een overzicht van alle button types.

**Structuur:**
```html
<h1>Mijn Button Library</h1>

<section>
    <h2>Button Types</h2>
    <button class="btn btn-primary">Primary</button>
    <button class="btn btn-secondary">Secondary</button>
    <button class="btn btn-success">Success</button>
    <button class="btn btn-danger">Danger</button>
</section>

<section>
    <h2>Outline Buttons</h2>
    <!-- Outline varianten -->
</section>

<section>
    <h2>Button Sizes</h2>
    <!-- Klein, normaal, groot -->
</section>

<section>
    <h2>Disabled Buttons</h2>
    <!-- Disabled varianten -->
</section>

<section>
    <h2>Buttons met Iconen</h2>
    <!-- Emoji buttons -->
</section>
```

---

### Huiswerk

**Hoofdopdracht: 20 Button Variaties**

Maak een HTML pagina met 20 verschillende buttons. Gebruik deze lijst:

1. Primary button (blauw, normaal)
2. Primary button, klein
3. Primary button, groot
4. Secondary button (grijs)
5. Danger button (rood)
6. Success button (groen)
7. Outline primary button
8. Outline danger button
9. Outline success button
10. Disabled primary button
11. Button met shadow effect
12. Button met glow effect bij hover
13. Round button (border-radius: 50px)
14. Square button (border-radius: 0)
15. Button met emoji 📧
16. Button met emoji 🗑️
17. Wide button (volledige breedte: width: 100%)
18. Gradient button (background: linear-gradient(...))
19. Button met dubbele border
20. Je eigen creatieve button!

**Technische eisen:**
- Gebruik de `.btn` basis class
- Gebruik extra classes voor variaties
- Gebruik :hover voor alle buttons
- Gebruik :active voor klik effect
- Nette, georganiseerde CSS

**Opdracht 2: "Call to Action" Button**

Maak een grote, opvallende button voor een website homepage.

**Eisen:**
- Groot (btn-xl)
- Mooi kleurenschema
- Shadow effect
- Glow bij hover
- Smooth transitions
- Emoji of tekst zoals "Probeer Nu Gratis!" of "Aan de Slag →"

**Opdracht 3: Button Groep**

Maak een groep van 3 buttons naast elkaar (bijv. "Ja", "Nee", "Misschien").

Tip: zet ze in een `<div>` en gebruik `display: inline-block` of laat een kleine `margin-right`.

---

### Inspiratie: Real-World Examples

**Grote websites gebruiken deze button stijlen:**
- **Bootstrap:** Primary (blauw), Secondary (grijs), Success (groen), Danger (rood), etc.
- **Material Design (Google):** Flat buttons, raised buttons, floating action buttons
- **Apple:** Minimalistisch, vaak outline buttons
- **Shopify:** Groene "Koop Nu" buttons met shadow

**Bekijk websites en let op buttons:**
- Welke kleuren gebruiken ze?
- Welke hover effecten?
- Hoe groot zijn ze?
- Waar staan ze op de pagina?

---

### Controlelijst voor Docent
- [ ] Studenten kunnen basis button styling toepassen
- [ ] Studenten kunnen verschillende button types maken
- [ ] Studenten kunnen button sizes aanpassen
- [ ] Studenten begrijpen het gebruik van :hover
- [ ] Studenten kunnen disabled states maken
- [ ] Studenten kunnen outline buttons maken
- [ ] Studenten begrijpen `cursor: pointer`
- [ ] Studenten kunnen transition toepassen

### Tips voor Docent
- **Laat studenten experimenteren!** Buttons zijn visueel en leuk
- **Toon echte websites:** Laat buttons op bekende sites zien
- **DevTools:** Laat zien hoe je button styling van andere sites inspecteert
- **Veelgemaakte fout:** `cursor: pointer` vergeten
- **Veelgemaakte fout:** Geen hover state toevoegen
- **Motivatie:** Buttons zijn overal - deze skill is super praktisch!
- **Live coding:** Bouw samen een button op vanaf basis

### Extra Resources
- [Button Generator](https://www.bestcssbuttongenerator.com/)
- [Buttons - A CSS Tricks Guide](https://css-tricks.com/a-complete-guide-to-buttons-in-web-design/)

---
