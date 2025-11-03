# Week 2 - Radio Buttons, Checkboxes & Select

**Doel van deze week:** Leer radio buttons, checkboxes en select dropdowns maken en custom stylen.

---

## Leerdoelen

Na deze week kun je:
- ✅ Radio buttons maken en stylen voor enkelvoudige keuzes
- ✅ Checkboxes maken en stylen voor meervoudige keuzes
- ✅ Het verschil uitleggen tussen radio buttons en checkboxes
- ✅ Custom radio buttons en checkboxes maken (appearance: none)
- ✅ Select dropdowns maken en stylen
- ✅ Option groups gebruiken (`<optgroup>`)
- ✅ Multiple select toepassen
- ✅ Fieldsets gebruiken voor groepering
- ✅ Legend elementen voor groepstitels
- ✅ Consistent styling voor alle input types

---

## 1. Radio Buttons (Enkelvoudige Keuze)

### Wanneer Radio Buttons?
- **Eén keuze** uit meerdere opties
- Alle opties zijn zichtbaar
- Meestal 2-5 opties
- Voorbeelden: Geslacht, betaalmethode, verzendoptie

### Basis HTML:
```html
<fieldset>
    <legend>Kies je geslacht:</legend>

    <label>
        <input type="radio" name="gender" value="male">
        Man
    </label>

    <label>
        <input type="radio" name="gender" value="female">
        Vrouw
    </label>

    <label>
        <input type="radio" name="gender" value="other">
        Anders
    </label>
</fieldset>
```

### Belangrijke Punten:
- **Zelfde `name`** → radio buttons horen bij elkaar (slechts één kan geselecteerd)
- **Verschillende `value`** → welke optie is gekozen
- **`<fieldset>` en `<legend>`** → groepeer gerelateerde inputs (accessibility!)

### Radio Button Styling (Basis):
```css
/* Fieldset styling */
fieldset {
    border: 2px solid #ddd;
    border-radius: 8px;
    padding: 20px;
    margin-bottom: 20px;
}

legend {
    font-weight: 600;
    color: #333;
    padding: 0 10px;
}

/* Radio button container */
label {
    display: flex;
    align-items: center;
    margin-bottom: 12px;
    cursor: pointer;
    padding: 10px;
    border-radius: 6px;
    transition: background 0.3s;
}

label:hover {
    background: #f8f9fa;
}

/* Radio button zelf */
input[type="radio"] {
    margin-right: 10px;
    cursor: pointer;
    width: 18px;
    height: 18px;
}

/* Geselecteerde radio */
input[type="radio"]:checked + span {
    font-weight: 600;
    color: #007bff;
}
```

---

## 2. Custom Radio Buttons

Browser default radio buttons zijn vaak lelijk. Maak je eigen!

### HTML:
```html
<label class="radio-custom">
    <input type="radio" name="plan" value="basic">
    <span class="radio-mark"></span>
    <span class="radio-label">Basic Plan - €9.99/maand</span>
</label>

<label class="radio-custom">
    <input type="radio" name="plan" value="pro">
    <span class="radio-mark"></span>
    <span class="radio-label">Pro Plan - €19.99/maand</span>
</label>
```

### CSS:
```css
.radio-custom {
    display: flex;
    align-items: center;
    padding: 15px;
    margin-bottom: 10px;
    border: 2px solid #ddd;
    border-radius: 8px;
    cursor: pointer;
    transition: all 0.3s;
}

.radio-custom:hover {
    border-color: #007bff;
    background: #f0f8ff;
}

/* Verstop de echte radio button */
.radio-custom input[type="radio"] {
    position: absolute;
    opacity: 0;
}

/* Custom radio circle */
.radio-mark {
    width: 20px;
    height: 20px;
    border: 2px solid #ddd;
    border-radius: 50%;
    margin-right: 12px;
    position: relative;
    transition: all 0.3s;
}

/* Inner circle (wanneer geselecteerd) */
.radio-mark::after {
    content: "";
    width: 10px;
    height: 10px;
    background: #007bff;
    border-radius: 50%;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%) scale(0);
    transition: transform 0.2s;
}

/* Geselecteerde state */
.radio-custom input[type="radio"]:checked ~ .radio-mark {
    border-color: #007bff;
}

.radio-custom input[type="radio"]:checked ~ .radio-mark::after {
    transform: translate(-50%, -50%) scale(1);
}

.radio-custom input[type="radio"]:checked ~ .radio-label {
    font-weight: 600;
    color: #007bff;
}

/* Focus state (keyboard navigation) */
.radio-custom input[type="radio"]:focus ~ .radio-mark {
    box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.15);
}
```

---

## 3. Checkboxes (Meervoudige Keuzes)

### Wanneer Checkboxes?
- **Meerdere keuzes** mogelijk
- On/off toggle (bijv. "Accepteer voorwaarden")
- Voorbeelden: Interesses, filters, voorkeuren

### Basis HTML:
```html
<fieldset>
    <legend>Selecteer je interesses:</legend>

    <label>
        <input type="checkbox" name="interests" value="sport">
        Sport
    </label>

    <label>
        <input type="checkbox" name="interests" value="music">
        Muziek
    </label>

    <label>
        <input type="checkbox" name="interests" value="travel">
        Reizen
    </label>

    <label>
        <input type="checkbox" name="interests" value="food">
        Eten
    </label>
</fieldset>
```

### Checkbox Styling (Basis):
```css
label {
    display: flex;
    align-items: center;
    margin-bottom: 12px;
    cursor: pointer;
    padding: 10px;
    border-radius: 6px;
    transition: background 0.3s;
}

label:hover {
    background: #f8f9fa;
}

input[type="checkbox"] {
    margin-right: 10px;
    cursor: pointer;
    width: 18px;
    height: 18px;
}
```

---

## 4. Custom Checkboxes

### HTML:
```html
<label class="checkbox-custom">
    <input type="checkbox" name="terms" value="accepted">
    <span class="checkbox-mark"></span>
    <span class="checkbox-label">Ik accepteer de algemene voorwaarden</span>
</label>
```

### CSS:
```css
.checkbox-custom {
    display: flex;
    align-items: center;
    padding: 12px;
    cursor: pointer;
}

/* Verstop de echte checkbox */
.checkbox-custom input[type="checkbox"] {
    position: absolute;
    opacity: 0;
}

/* Custom checkbox vierkant */
.checkbox-mark {
    width: 20px;
    height: 20px;
    border: 2px solid #ddd;
    border-radius: 4px;
    margin-right: 12px;
    position: relative;
    transition: all 0.3s;
}

/* Checkmark (vinkje) */
.checkbox-mark::after {
    content: "";
    width: 6px;
    height: 10px;
    border: solid white;
    border-width: 0 2px 2px 0;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%) rotate(45deg) scale(0);
    transition: transform 0.2s;
}

/* Checked state */
.checkbox-custom input[type="checkbox"]:checked ~ .checkbox-mark {
    background: #007bff;
    border-color: #007bff;
}

.checkbox-custom input[type="checkbox"]:checked ~ .checkbox-mark::after {
    transform: translate(-50%, -60%) rotate(45deg) scale(1);
}

/* Focus state */
.checkbox-custom input[type="checkbox"]:focus ~ .checkbox-mark {
    box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.15);
}

/* Hover */
.checkbox-custom:hover .checkbox-mark {
    border-color: #007bff;
}
```

---

## 5. Select Dropdown

### Wanneer Select?
- **Eén keuze** uit VEEL opties (>5)
- Bespaart ruimte op scherm
- Voorbeelden: Land selectie, maand, categorie

### Basis HTML:
```html
<label for="country">Land:</label>
<select id="country" name="country">
    <option value="">-- Kies een land --</option>
    <option value="nl">Nederland</option>
    <option value="be">België</option>
    <option value="de">Duitsland</option>
    <option value="fr">Frankrijk</option>
    <option value="uk">Verenigd Koninkrijk</option>
</select>
```

### Select met Optgroups:
```html
<label for="location">Locatie:</label>
<select id="location" name="location">
    <option value="">-- Kies een stad --</option>

    <optgroup label="Nederland">
        <option value="amsterdam">Amsterdam</option>
        <option value="rotterdam">Rotterdam</option>
        <option value="utrecht">Utrecht</option>
    </optgroup>

    <optgroup label="België">
        <option value="brussel">Brussel</option>
        <option value="antwerpen">Antwerpen</option>
        <option value="gent">Gent</option>
    </optgroup>
</select>
```

### Multiple Select:
```html
<label for="skills">Selecteer je skills (houd Ctrl ingedrukt):</label>
<select id="skills" name="skills" multiple size="5">
    <option value="html">HTML</option>
    <option value="css">CSS</option>
    <option value="javascript">JavaScript</option>
    <option value="php">PHP</option>
    <option value="python">Python</option>
</select>
```

---

## 6. Select Styling

### Basis Styling:
```css
select {
    width: 100%;
    padding: 12px 40px 12px 15px;
    border: 2px solid #ddd;
    border-radius: 8px;
    font-size: 16px;
    font-family: inherit;
    background: white;
    cursor: pointer;
    transition: border-color 0.3s;
    appearance: none; /* Verwijder default dropdown pijl */

    /* Custom dropdown pijl */
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='8'%3E%3Cpath fill='%23333' d='M0 0l6 8 6-8z'/%3E%3C/svg%3E");
    background-repeat: no-repeat;
    background-position: right 15px center;
}

select:focus {
    outline: none;
    border-color: #007bff;
    box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.1);
}

/* Optgroup styling */
optgroup {
    font-weight: 600;
    color: #666;
}

option {
    padding: 8px;
}

/* Multiple select */
select[multiple] {
    padding: 10px;
    background-image: none;
}

select[multiple] option {
    padding: 8px 12px;
    border-radius: 4px;
    margin-bottom: 4px;
}

select[multiple] option:checked {
    background: #007bff;
    color: white;
}
```

---

## 7. Radio vs Checkbox vs Select

| **Type** | **Gebruik Voor** | **Gedrag** | **Zichtbaarheid** |
|----------|------------------|------------|-------------------|
| **Radio** | 1 keuze, 2-5 opties | Exclusief (1 selected) | Alle opties zichtbaar |
| **Checkbox** | Meerdere keuzes | Multiple selected | Alle opties zichtbaar |
| **Select** | 1 keuze, 5+ opties | Exclusief (1 selected) | Opties verborgen (dropdown) |

### Voorbeelden:
```html
<!-- Radio: Eén betaalmethode kiezen -->
<input type="radio" name="payment" value="creditcard"> Creditcard
<input type="radio" name="payment" value="paypal"> PayPal

<!-- Checkbox: Meerdere toppings kiezen -->
<input type="checkbox" name="toppings" value="cheese"> Kaas
<input type="checkbox" name="toppings" value="pepperoni"> Pepperoni
<input type="checkbox" name="toppings" value="mushrooms"> Champignons

<!-- Select: Eén land uit vele landen -->
<select name="country">
    <option value="nl">Nederland</option>
    <option value="be">België</option>
    <!-- 100+ landen... -->
</select>
```

---

## 8. Complete Voorbeeld: Bestelformulier

### HTML:
```html
<div class="form-container">
    <h2>Pizza Bestellen</h2>

    <form>
        <!-- Radio Buttons: Pizza size -->
        <fieldset>
            <legend>Kies je maat:</legend>

            <label class="radio-custom">
                <input type="radio" name="size" value="small" checked>
                <span class="radio-mark"></span>
                <span class="radio-label">Klein - €8.99</span>
            </label>

            <label class="radio-custom">
                <input type="radio" name="size" value="medium">
                <span class="radio-mark"></span>
                <span class="radio-label">Medium - €11.99</span>
            </label>

            <label class="radio-custom">
                <input type="radio" name="size" value="large">
                <span class="radio-mark"></span>
                <span class="radio-label">Large - €14.99</span>
            </label>
        </fieldset>

        <!-- Checkboxes: Toppings -->
        <fieldset>
            <legend>Extra toppings (+€1.50 per stuk):</legend>

            <label class="checkbox-custom">
                <input type="checkbox" name="toppings" value="cheese">
                <span class="checkbox-mark"></span>
                <span class="checkbox-label">Extra kaas</span>
            </label>

            <label class="checkbox-custom">
                <input type="checkbox" name="toppings" value="pepperoni">
                <span class="checkbox-mark"></span>
                <span class="checkbox-label">Pepperoni</span>
            </label>

            <label class="checkbox-custom">
                <input type="checkbox" name="toppings" value="mushrooms">
                <span class="checkbox-mark"></span>
                <span class="checkbox-label">Champignons</span>
            </label>

            <label class="checkbox-custom">
                <input type="checkbox" name="toppings" value="olives">
                <span class="checkbox-mark"></span>
                <span class="checkbox-label">Olijven</span>
            </label>
        </fieldset>

        <!-- Select: Delivery time -->
        <div class="form-group">
            <label for="time">Bezorgtijd:</label>
            <select id="time" name="time" required>
                <option value="">-- Kies een tijd --</option>
                <option value="asap">Zo snel mogelijk</option>
                <option value="18:00">18:00</option>
                <option value="18:30">18:30</option>
                <option value="19:00">19:00</option>
                <option value="19:30">19:30</option>
                <option value="20:00">20:00</option>
            </select>
        </div>

        <!-- Checkbox: Accept terms -->
        <label class="checkbox-custom">
            <input type="checkbox" name="terms" value="accepted" required>
            <span class="checkbox-mark"></span>
            <span class="checkbox-label">Ik accepteer de algemene voorwaarden</span>
        </label>

        <button type="submit">Bestel Nu</button>
    </form>
</div>
```

---

## 9. Praktijkopdracht: Survey Formulier

### Opdracht:
Maak een enquête formulier met alle input types van deze week.

**Vereisten:**
1. **Radio buttons** (custom styled):
   - Leeftijdscategorie: 18-25, 26-35, 36-45, 46+
2. **Checkboxes** (custom styled):
   - Interesses: Minimaal 6 opties
3. **Select dropdown**:
   - Land selectie (minimaal 10 landen met optgroups voor continenten)
4. **Multiple select**:
   - Favoriete programmeertalen (5+ opties)
5. **Fieldsets en legends** voor groepering
6. **Terms & conditions** checkbox (required)
7. **Submit button**

**Styling eisen:**
- Custom radio buttons en checkboxes (niet default browser style)
- Consistent color scheme
- Hover states overal
- Focus states voor keyboard navigatie
- Responsive layout
- Max-width 700px, gecentreerd

---

## Tips & Best Practices

### ✅ DO's:
- **Radio buttons**: Zelfde `name`, verschillende `value`
- **Checkboxes**: Meerdere kunnen `checked` zijn
- **Default selectie**: Gebruik `checked` voor radio/checkbox, `selected` voor option
- **Fieldset**: Groepeer gerelateerde inputs (accessibility!)
- **Custom styling**: Gebruik `appearance: none` en bouw eigen design
- **Focus states**: Altijd toevoegen voor keyboard gebruikers
- **Labels**: Altijd koppelen aan inputs

### ❌ DON'Ts:
- Radio buttons met verschillende `name` (werken niet als groep)
- Te veel radio buttons (>5 = select gebruiken)
- Select zonder default optie ("-- Kies --")
- Custom styling zonder accessibility (focus, keyboard support)
- Checkboxes gebruiken waar radio buttons horen
- `appearance: none` zonder custom replacement

---

## Accessibility Checklist

- ✅ Alle inputs hebben een `<label>` met correct `for` attribute
- ✅ Fieldset en legend gebruikt voor groepen
- ✅ Custom inputs hebben focus states
- ✅ Keyboard navigatie werkt (tab, space, enter)
- ✅ Screen reader vriendelijk (verstop echte input met `opacity: 0`, niet `display: none`)
- ✅ Required velden zijn gemarkeerd

---

## Veelgemaakte Fouten

### ❌ Radio buttons werken niet als groep:
```html
<!-- FOUT: verschillende names -->
<input type="radio" name="option1" value="a"> A
<input type="radio" name="option2" value="b"> B
```

### ✅ Correct:
```html
<input type="radio" name="option" value="a"> A
<input type="radio" name="option" value="b"> B
```

---

### ❌ Custom checkbox zonder accessibility:
```css
/* FOUT: display: none (screen readers kunnen niet vinden) */
input[type="checkbox"] {
    display: none;
}
```

### ✅ Correct:
```css
/* opacity: 0 (blijft toegankelijk) */
input[type="checkbox"] {
    position: absolute;
    opacity: 0;
}
```

---

## Samenvatting

Deze week heb je geleerd:
- ✅ Radio buttons voor enkelvoudige keuzes
- ✅ Checkboxes voor meervoudige keuzes
- ✅ Select dropdowns voor lange lijsten
- ✅ Custom styling met `appearance: none`
- ✅ Fieldset en legend voor groepering
- ✅ Het verschil tussen radio, checkbox en select
- ✅ Accessibility best practices

**Volgende week:** Textarea, buttons en validatie feedback!

---

**Tip:** Bekijk formulieren op grote websites (Booking.com, Coolblue, Thuisbezorgd). Let op wanneer ze radio, checkbox of select gebruiken. Elke keuze heeft een reden! 🍕
