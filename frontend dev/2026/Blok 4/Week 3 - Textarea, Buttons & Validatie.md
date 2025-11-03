# Week 3 - Textarea, Buttons & Validatie

**Doel van deze week:** Leer textarea's en buttons stylen, en HTML5 validatie toepassen met duidelijke feedback.

---

## Leerdoelen

Na deze week kun je:
- ✅ Textarea maken en stylen voor lange teksten
- ✅ Resize property gebruiken (none, vertical, horizontal)
- ✅ Verschillende button types onderscheiden (submit, reset, button)
- ✅ Button states stylen (hover, active, disabled, focus)
- ✅ HTML5 validatie gebruiken (required, pattern, min, max, minlength, maxlength)
- ✅ Custom validatie feedback styling
- ✅ Error messages tonen met CSS (:invalid, :valid)
- ✅ Success states tonen
- ✅ Disabled en readonly states correct implementeren
- ✅ Toegankelijke formulieren maken

---

## 1. Textarea (Multi-line Text Input)

### Wanneer Textarea?
- **Lange teksten** (meer dan 1 regel)
- Voorbeelden: Berichten, reviews, opmerkingen, biografieën

### Basis HTML:
```html
<label for="message">Je bericht:</label>
<textarea
    id="message"
    name="message"
    rows="5"
    cols="50"
    placeholder="Typ hier je bericht..."
    maxlength="500"
    required
></textarea>
```

### Belangrijke Attributes:
- `rows` → aantal zichtbare rijen (hoogte)
- `cols` → aantal zichtbare kolommen (breedte, maar vaak overschreven met CSS)
- `maxlength` → maximaal aantal karakters
- `placeholder` → voorbeeld tekst
- `required` → veld moet ingevuld zijn

### Textarea vs Input:
```html
<!-- Input: Eén regel -->
<input type="text" placeholder="Korte tekst">

<!-- Textarea: Meerdere regels -->
<textarea placeholder="Lange tekst..."></textarea>
```

---

## 2. Textarea Styling

### Basis Styling:
```css
textarea {
    width: 100%;
    padding: 12px 15px;
    border: 2px solid #ddd;
    border-radius: 8px;
    font-size: 16px;
    font-family: inherit; /* Gebruik zelfde font als website */
    line-height: 1.5;
    transition: border-color 0.3s;
    resize: vertical; /* Alleen verticaal resizable */
}

textarea:focus {
    outline: none;
    border-color: #007bff;
    box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.1);
}

textarea::placeholder {
    color: #999;
}
```

### Resize Property:
```css
/* Gebruiker kan grootte aanpassen in beide richtingen */
textarea {
    resize: both;
}

/* Alleen verticaal (meest gebruikelijk) */
textarea {
    resize: vertical;
}

/* Alleen horizontaal */
textarea {
    resize: horizontal;
}

/* Geen resize (vaste grootte) */
textarea {
    resize: none;
}
```

### Character Counter Toevoegen:
```html
<div class="form-group">
    <label for="bio">Bio (max 200 karakters):</label>
    <textarea id="bio" name="bio" maxlength="200"></textarea>
    <div class="char-count">
        <span id="char-count">0</span> / 200 karakters
    </div>
</div>
```

```css
.char-count {
    text-align: right;
    font-size: 14px;
    color: #666;
    margin-top: 5px;
}
```

---

## 3. Buttons

### Button Types:

#### type="submit"
Verstuurt het formulier
```html
<button type="submit">Verstuur</button>
```

#### type="reset"
Reset alle velden naar default waarden
```html
<button type="reset">Reset</button>
```

#### type="button"
Doet niets (gebruikt voor JavaScript)
```html
<button type="button">Klik Mij</button>
```

### Button vs Input Button:
```html
<!-- Modern: <button> (flexibeler) -->
<button type="submit">
    <span>Verstuur</span>
    <svg><!-- icon --></svg>
</button>

<!-- Oud: <input> (minder flexibel) -->
<input type="submit" value="Verstuur">
```

**Gebruik altijd `<button>`, niet `<input type="submit">`!**

---

## 4. Button Styling

### Basis Button Styles:
```css
button {
    padding: 12px 30px;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
    font-family: inherit;
}

/* Primary button (submit) */
button[type="submit"],
.btn-primary {
    background: #007bff;
    color: white;
}

button[type="submit"]:hover {
    background: #0056b3;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0, 123, 255, 0.3);
}

/* Secondary button */
.btn-secondary {
    background: #6c757d;
    color: white;
}

.btn-secondary:hover {
    background: #545b62;
}

/* Danger button (reset, delete) */
button[type="reset"],
.btn-danger {
    background: #dc3545;
    color: white;
}

.btn-danger:hover {
    background: #c82333;
}

/* Outline button */
.btn-outline {
    background: transparent;
    color: #007bff;
    border: 2px solid #007bff;
}

.btn-outline:hover {
    background: #007bff;
    color: white;
}
```

---

## 5. Button States

### Hover State:
```css
button:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0,0,0,0.2);
}
```

### Active State (wordt ingedrukt):
```css
button:active {
    transform: translateY(0);
    box-shadow: 0 2px 4px rgba(0,0,0,0.2);
}
```

### Focus State (keyboard navigatie):
```css
button:focus {
    outline: none;
    box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.3);
}
```

### Disabled State:
```html
<button type="submit" disabled>Versturen...</button>
```

```css
button:disabled {
    background: #e9ecef;
    color: #6c757d;
    cursor: not-allowed;
    opacity: 0.6;
    transform: none;
    box-shadow: none;
}

button:disabled:hover {
    background: #e9ecef; /* Geen hover effect */
    transform: none;
}
```

---

## 6. HTML5 Validatie

### Validatie Attributes:

#### required
Veld moet ingevuld zijn
```html
<input type="text" name="naam" required>
```

#### minlength / maxlength
Minimum/maximum aantal karakters
```html
<input type="password" minlength="8" maxlength="20" required>
```

#### min / max
Minimum/maximum waarde (voor numbers, dates)
```html
<input type="number" name="leeftijd" min="18" max="100" required>
<input type="date" name="datum" min="2024-01-01" max="2024-12-31">
```

#### pattern
Regex patroon dat waarde moet matchen
```html
<!-- Nederlandse postcode (1234AB) -->
<input type="text" pattern="[0-9]{4}[A-Z]{2}" placeholder="1234AB" required>

<!-- Nederlands telefoonnummer (06-12345678) -->
<input type="tel" pattern="06-[0-9]{8}" placeholder="06-12345678" required>
```

#### type-specific validatie
```html
<!-- Email: moet @ en . bevatten -->
<input type="email" required>

<!-- URL: moet http:// of https:// bevatten -->
<input type="url" required>
```

---

## 7. Validatie Feedback Styling

### :valid en :invalid Pseudo-classes:
```css
/* Valid state (groen) */
input:valid,
textarea:valid {
    border-color: #28a745;
}

/* Invalid state (rood) */
input:invalid,
textarea:invalid {
    border-color: #dc3545;
}

/* Alleen tonen NADAT gebruiker iets getypt heeft */
input:not(:placeholder-shown):valid {
    border-color: #28a745;
}

input:not(:placeholder-shown):invalid {
    border-color: #dc3545;
}
```

### Icon Feedback:
```css
.form-group {
    position: relative;
}

input:not(:placeholder-shown):valid {
    padding-right: 40px;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='%2328a745'%3E%3Cpath d='M8 15l-5-5 1.5-1.5L8 12l7.5-7.5L17 6z'/%3E%3C/svg%3E");
    background-repeat: no-repeat;
    background-position: right 12px center;
}

input:not(:placeholder-shown):invalid {
    padding-right: 40px;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='%23dc3545'%3E%3Cpath d='M10 2L2 18h16L10 2zm0 13a1 1 0 100-2 1 1 0 000 2zm0-3a1 1 0 01-1-1V8a1 1 0 012 0v3a1 1 0 01-1 1z'/%3E%3C/svg%3E");
    background-repeat: no-repeat;
    background-position: right 12px center;
}
```

---

## 8. Error Messages

### Met HTML5 (browser default):
```html
<input type="email" required>
<!-- Browser toont automatisch: "Voer een geldig e-mailadres in" -->
```

### Custom Error Messages met CSS:
```html
<div class="form-group">
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required>
    <span class="error-message">Voer een geldig email adres in</span>
</div>
```

```css
.error-message {
    display: none;
    color: #dc3545;
    font-size: 14px;
    margin-top: 5px;
}

/* Toon error message alleen wanneer invalid */
input:not(:placeholder-shown):invalid + .error-message {
    display: block;
}
```

### Success Messages:
```html
<div class="form-group">
    <label for="username">Gebruikersnaam:</label>
    <input type="text" id="username" name="username" minlength="3" required>
    <span class="success-message">✓ Gebruikersnaam beschikbaar</span>
</div>
```

```css
.success-message {
    display: none;
    color: #28a745;
    font-size: 14px;
    margin-top: 5px;
}

input:not(:placeholder-shown):valid + .success-message {
    display: block;
}
```

---

## 9. Complete Voorbeeld: Contact Formulier met Validatie

### HTML:
```html
<div class="form-container">
    <h2>Contact Formulier</h2>

    <form>
        <!-- Naam (required, min 2 chars) -->
        <div class="form-group">
            <label for="name" class="required">Naam</label>
            <input
                type="text"
                id="name"
                name="name"
                placeholder="bijv. Jan Jansen"
                minlength="2"
                required
            >
            <span class="error-message">Naam moet minimaal 2 karakters bevatten</span>
        </div>

        <!-- Email (required, valid email) -->
        <div class="form-group">
            <label for="email" class="required">Email</label>
            <input
                type="email"
                id="email"
                name="email"
                placeholder="jouw@email.nl"
                required
            >
            <span class="error-message">Voer een geldig email adres in</span>
        </div>

        <!-- Telefoon (optional, pattern) -->
        <div class="form-group">
            <label for="phone">Telefoon (optioneel)</label>
            <input
                type="tel"
                id="phone"
                name="phone"
                placeholder="06-12345678"
                pattern="06-[0-9]{8}"
            >
            <span class="error-message">Formaat: 06-12345678</span>
        </div>

        <!-- Onderwerp (required, select) -->
        <div class="form-group">
            <label for="subject" class="required">Onderwerp</label>
            <select id="subject" name="subject" required>
                <option value="">-- Kies een onderwerp --</option>
                <option value="question">Vraag</option>
                <option value="feedback">Feedback</option>
                <option value="complaint">Klacht</option>
                <option value="other">Anders</option>
            </select>
        </div>

        <!-- Bericht (required, min 10 chars, max 500) -->
        <div class="form-group">
            <label for="message" class="required">Bericht</label>
            <textarea
                id="message"
                name="message"
                rows="6"
                placeholder="Typ hier je bericht..."
                minlength="10"
                maxlength="500"
                required
            ></textarea>
            <div class="char-count">
                <span id="current">0</span> / 500 karakters
            </div>
            <span class="error-message">Bericht moet minimaal 10 karakters bevatten</span>
        </div>

        <!-- Privacy checkbox (required) -->
        <label class="checkbox-custom">
            <input type="checkbox" name="privacy" required>
            <span class="checkbox-mark"></span>
            <span class="checkbox-label">
                Ik ga akkoord met het <a href="#">privacybeleid</a>
            </span>
        </label>

        <!-- Buttons -->
        <div class="form-actions">
            <button type="reset" class="btn-secondary">Reset</button>
            <button type="submit" class="btn-primary">Verstuur</button>
        </div>
    </form>
</div>
```

### CSS:
```css
.form-container {
    max-width: 600px;
    margin: 50px auto;
    padding: 40px;
    background: white;
    border-radius: 12px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.1);
}

h2 {
    margin-top: 0;
    margin-bottom: 30px;
    text-align: center;
}

.form-group {
    margin-bottom: 25px;
}

label {
    display: block;
    margin-bottom: 8px;
    font-weight: 600;
    color: #333;
}

label.required::after {
    content: " *";
    color: #dc3545;
}

input,
select,
textarea {
    width: 100%;
    padding: 12px 15px;
    border: 2px solid #ddd;
    border-radius: 8px;
    font-size: 16px;
    font-family: inherit;
    transition: border-color 0.3s;
}

input:focus,
select:focus,
textarea:focus {
    outline: none;
    border-color: #007bff;
    box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.1);
}

/* Validatie states */
input:not(:placeholder-shown):valid,
textarea:not(:placeholder-shown):valid {
    border-color: #28a745;
}

input:not(:placeholder-shown):invalid,
textarea:not(:placeholder-shown):invalid {
    border-color: #dc3545;
}

/* Error messages */
.error-message {
    display: none;
    color: #dc3545;
    font-size: 14px;
    margin-top: 5px;
}

input:not(:placeholder-shown):invalid ~ .error-message,
textarea:not(:placeholder-shown):invalid ~ .error-message {
    display: block;
}

/* Character counter */
.char-count {
    text-align: right;
    font-size: 14px;
    color: #666;
    margin-top: 5px;
}

/* Textarea */
textarea {
    resize: vertical;
    line-height: 1.5;
    min-height: 120px;
}

/* Select */
select {
    appearance: none;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='8'%3E%3Cpath fill='%23333' d='M0 0l6 8 6-8z'/%3E%3C/svg%3E");
    background-repeat: no-repeat;
    background-position: right 15px center;
    cursor: pointer;
}

/* Checkbox */
.checkbox-custom {
    display: flex;
    align-items: center;
    margin-bottom: 25px;
    cursor: pointer;
}

.checkbox-custom input {
    position: absolute;
    opacity: 0;
}

.checkbox-mark {
    width: 20px;
    height: 20px;
    border: 2px solid #ddd;
    border-radius: 4px;
    margin-right: 10px;
    flex-shrink: 0;
    position: relative;
    transition: all 0.3s;
}

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

.checkbox-custom input:checked ~ .checkbox-mark {
    background: #007bff;
    border-color: #007bff;
}

.checkbox-custom input:checked ~ .checkbox-mark::after {
    transform: translate(-50%, -60%) rotate(45deg) scale(1);
}

.checkbox-label a {
    color: #007bff;
}

/* Buttons */
.form-actions {
    display: flex;
    gap: 15px;
    margin-top: 30px;
}

button {
    flex: 1;
    padding: 14px;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
}

.btn-primary {
    background: #007bff;
    color: white;
}

.btn-primary:hover {
    background: #0056b3;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0, 123, 255, 0.3);
}

.btn-secondary {
    background: #6c757d;
    color: white;
}

.btn-secondary:hover {
    background: #545b62;
}

button:active {
    transform: translateY(0);
}

button:disabled {
    background: #e9ecef;
    color: #6c757d;
    cursor: not-allowed;
    opacity: 0.6;
}
```

---

## 10. Praktijkopdracht: Multi-Step Form

### Opdracht:
Maak een uitgebreid contactformulier met validatie.

**Vereisten:**
1. **Persoonlijke info:**
   - Voornaam (required, min 2 chars)
   - Achternaam (required, min 2 chars)
   - Email (required, valid email)
   - Telefoon (optional, pattern 06-12345678)

2. **Adres info:**
   - Straat + huisnummer (required)
   - Postcode (required, pattern 1234AB)
   - Plaats (required, select dropdown met 10+ steden)
   - Land (required, default "Nederland")

3. **Bericht:**
   - Onderwerp (required, select)
   - Bericht (required, textarea, min 20 chars, max 1000)
   - Character counter

4. **Voorkeuren:**
   - Contact voorkeur (radio: email, telefoon, post)
   - Nieuwsbrief (checkbox)
   - Privacy akkoord (checkbox, required)

5. **Validatie:**
   - Error messages voor elk veld
   - Success states (groene borders)
   - Icons bij valid/invalid
   - Submit button disabled totdat form valid is (bonus)

6. **Buttons:**
   - Reset button
   - Submit button met hover/active/disabled states

**Styling:**
- Modern design
- Consistent spacing
- Responsive (Flexbox)
- Smooth transitions
- Clear visual feedback

---

## Tips & Best Practices

### ✅ DO's:
- **Duidelijke error messages**: "Email adres is verplicht" ipv "Error"
- **Real-time validatie**: Toon feedback terwijl gebruiker typt
- **Positieve feedback**: Toon ook success states (groen = goed bezig!)
- **Disabled button**: Disable submit knop totdat form valid is
- **Character counter**: Bij textarea met maxlength
- **Focus states**: Belangrijk voor keyboard navigatie
- **Consistent styling**: Alle inputs dezelfde style

### ❌ DON'Ts:
- Error messages die te snel verschijnen (wacht tot gebruiker klaar is met typen)
- Te technische error messages ("Pattern mismatch")
- Geen feedback (gebruiker weet niet of het goed gaat)
- Te veel required velden (vraag alleen wat nodig is)
- Reset button prominent (vaak per ongeluk geklikt)
- Textarea te klein (frustrerend voor lange berichten)

---

## Validatie Best Practices

### Timing van Validatie:
```css
/* SLECHT: Error toont meteen (te vroeg!) */
input:invalid {
    border-color: red;
}

/* BETER: Error toont alleen na interactie */
input:not(:focus):not(:placeholder-shown):invalid {
    border-color: red;
}

/* OF: Error toont alleen als gebruiker het veld verlaat (blur) */
input.touched:invalid {
    border-color: red;
}
```

### Progressive Enhancement:
1. **HTML5 validatie** (basis, werkt altijd)
2. **CSS styling** (visuele feedback)
3. **JavaScript** (custom messages, real-time feedback) - komt later!

---

## Samenvatting

Deze week heb je geleerd:
- ✅ Textarea maken en stylen (resize property)
- ✅ Button types (submit, reset, button)
- ✅ Button states (hover, active, focus, disabled)
- ✅ HTML5 validatie attributes (required, pattern, min, max, minlength, maxlength)
- ✅ Validatie feedback styling (:valid, :invalid)
- ✅ Error en success messages
- ✅ Character counters
- ✅ Accessible forms met duidelijke feedback

**Volgende week:** Projectweek! Combineer alles wat je geleerd hebt in één groot formulier.

---

**Tip:** Test je formulieren altijd met keyboard navigatie (Tab, Enter, Space). Als je zonder muis kunt navigeren, is het toegankelijk! ⌨️✨
