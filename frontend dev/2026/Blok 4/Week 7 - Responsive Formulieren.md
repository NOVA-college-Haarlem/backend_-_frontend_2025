# Week 7 - Responsive Formulieren

**Doel van deze week:** Maak je formulieren volledig responsive en touch-friendly voor alle devices.

---

## Leerdoelen

Na deze week kun je:
- ✅ Formulieren responsive maken voor mobile devices
- ✅ Input types aanpassen per schermformaat
- ✅ Stacked vs inline form layouts implementeren
- ✅ Labels en inputs responsive positioneren
- ✅ Error messages responsive tonen
- ✅ Touch-friendly input fields maken (grotere tap targets)
- ✅ Keyboard types optimaliseren voor mobile (inputmode)
- ✅ Form buttons full-width op mobile maken
- ✅ Multi-column forms op desktop, single-column op mobile
- ✅ Responsive tables en data displays

---

## 1. Form Layout: Mobile vs Desktop

### Mobile-First Form Layout

**Mobile (< 768px):**
- Alles verticaal gestackt (1 kolom)
- Labels boven inputs
- Full-width inputs
- Grotere inputs (padding)
- Full-width buttons

**Desktop (>= 768px):**
- Labels naast inputs (optioneel)
- Multi-column layouts mogelijk
- Kleinere padding (muis is preciezer dan vinger)

### Basic Responsive Form:
```css
/* Mobile First */
.form-group {
    display: flex;
    flex-direction: column;
    margin-bottom: 20px;
}

label {
    margin-bottom: 8px;
    font-weight: 600;
}

input,
select,
textarea {
    width: 100%;
    padding: 14px; /* Groter voor touch */
    font-size: 16px; /* Prevent zoom */
}

button[type="submit"] {
    width: 100%; /* Full width op mobile */
    padding: 16px;
    font-size: 18px;
}

/* Tablet & Desktop */
@media (min-width: 768px) {
    /* Labels naast inputs */
    .form-group {
        flex-direction: row;
        align-items: center;
    }

    label {
        flex: 0 0 150px; /* Vaste label breedte */
        margin-bottom: 0;
        margin-right: 15px;
    }

    input,
    select,
    textarea {
        flex: 1;
        padding: 12px; /* Kan kleiner met muis */
    }

    button[type="submit"] {
        width: auto; /* Niet full width */
        min-width: 200px;
    }
}
```

---

## 2. Multi-Column Forms

### Responsive Form Rows:
```css
/* Mobile: 1 kolom */
.form-row {
    display: flex;
    flex-direction: column;
    gap: 20px;
}

.form-group {
    flex: 1;
}

/* Tablet: 2 kolommen */
@media (min-width: 768px) {
    .form-row {
        flex-direction: row;
    }
}

/* Desktop: 3 kolommen mogelijk */
@media (min-width: 1024px) {
    .form-row.three-col {
        display: flex;
    }

    .form-row.three-col .form-group {
        flex: 1;
    }
}
```

### HTML:
```html
<!-- Mobile: Stack verticaal -->
<!-- Desktop: 2 kolommen naast elkaar -->
<div class="form-row">
    <div class="form-group">
        <label for="first-name">Voornaam</label>
        <input type="text" id="first-name" name="first-name" required>
    </div>

    <div class="form-group">
        <label for="last-name">Achternaam</label>
        <input type="text" id="last-name" name="last-name" required>
    </div>
</div>
```

---

## 3. Touch-Friendly Inputs

### Minimum Sizes:
```css
/* Mobile: Grotere inputs voor touch */
input,
select,
textarea,
button {
    min-height: 44px; /* iOS guideline */
    padding: 12px 15px;
    font-size: 16px; /* Prevent zoom! */
}

/* Desktop: Kan iets kleiner */
@media (min-width: 768px) {
    input,
    select,
    textarea {
        min-height: 40px;
        padding: 10px 12px;
    }
}
```

### Spacing tussen Inputs:
```css
/* Mobile: Meer ruimte tussen inputs */
.form-group {
    margin-bottom: 25px;
}

/* Desktop: Kan compacter */
@media (min-width: 768px) {
    .form-group {
        margin-bottom: 20px;
    }
}
```

---

## 4. Input Mode voor Mobile Keyboards

### inputmode Attribute:
Bepaalt welke keyboard verschijnt op mobile.

```html
<!-- Numeric keyboard (0-9) -->
<input type="text" inputmode="numeric" placeholder="Postcode">

<!-- Tel keyboard (0-9, +, -) -->
<input type="text" inputmode="tel" placeholder="Telefoon">

<!-- Email keyboard (@ en .) -->
<input type="email" inputmode="email" placeholder="Email">

<!-- URL keyboard (/, .com) -->
<input type="url" inputmode="url" placeholder="Website">

<!-- Decimal keyboard (0-9, .) -->
<input type="text" inputmode="decimal" placeholder="Prijs">
```

### Input Types vs Inputmode:
```html
<!-- type="number" toont pijltjes (niet altijd gewenst) -->
<input type="number" name="age">

<!-- type="text" + inputmode="numeric" (geen pijltjes, numeric keyboard) -->
<input type="text" inputmode="numeric" name="postcode">
```

---

## 5. Responsive Radio & Checkbox

### Radio Buttons - Responsive:
```css
/* Mobile: Stack verticaal, grote touch areas */
.radio-group {
    display: flex;
    flex-direction: column;
    gap: 12px;
}

.radio-custom {
    padding: 15px;
    border: 2px solid #ddd;
    border-radius: 8px;
    min-height: 50px; /* Touch-friendly */
}

/* Desktop: Horizontaal of grid mogelijk */
@media (min-width: 768px) {
    .radio-group {
        flex-direction: row;
        flex-wrap: wrap;
    }

    .radio-custom {
        flex: 1 1 calc(50% - 10px);
        padding: 12px;
        min-height: 44px;
    }
}
```

### Checkboxes - Responsive:
```css
/* Mobile: Stack, grote touch areas */
.checkbox-group {
    display: flex;
    flex-direction: column;
    gap: 12px;
}

.checkbox-custom {
    padding: 12px;
    min-height: 48px;
}

/* Desktop: 2-3 kolommen mogelijk */
@media (min-width: 768px) {
    .checkbox-group {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 15px;
    }
}

@media (min-width: 1024px) {
    .checkbox-group {
        grid-template-columns: repeat(3, 1fr);
    }
}
```

---

## 6. Responsive Error Messages

### Error Message Positioning:
```css
.form-group {
    position: relative;
}

/* Mobile: Error onder input */
.error-message {
    display: none;
    color: #dc3545;
    font-size: 14px;
    margin-top: 5px;
    padding: 8px 12px;
    background: #ffe6e6;
    border-radius: 4px;
}

input:not(:placeholder-shown):invalid ~ .error-message {
    display: block;
}

/* Desktop: Error kan naast input (optioneel) */
@media (min-width: 1024px) {
    .form-group-inline {
        display: flex;
        align-items: flex-start;
    }

    .form-group-inline .error-message {
        margin-top: 0;
        margin-left: 10px;
        flex: 0 0 200px;
    }
}
```

---

## 7. Responsive Buttons

### Button Layouts:
```css
/* Mobile: Full width, stack verticaal */
.form-actions {
    display: flex;
    flex-direction: column;
    gap: 12px;
    margin-top: 30px;
}

button {
    width: 100%;
    padding: 16px;
    font-size: 18px;
    min-height: 52px; /* Extra groot voor touch */
}

/* Tablet: Buttons naast elkaar mogelijk */
@media (min-width: 768px) {
    .form-actions {
        flex-direction: row;
        justify-content: flex-end;
    }

    button {
        width: auto;
        min-width: 150px;
        padding: 14px 30px;
        min-height: 48px;
    }

    /* Secondary button links, primary rechts */
    button[type="reset"] {
        order: 1;
    }

    button[type="submit"] {
        order: 2;
    }
}
```

---

## 8. Responsive Select Dropdowns

### Select Styling:
```css
select {
    width: 100%;
    padding: 14px 40px 14px 15px;
    font-size: 16px; /* Prevent zoom */
    min-height: 48px;
    appearance: none;
    background-image: url("data:image/svg+xml,..."); /* Custom arrow */
    background-repeat: no-repeat;
    background-position: right 15px center;
}

/* Desktop: Smaller */
@media (min-width: 768px) {
    select {
        padding: 12px 35px 12px 12px;
        min-height: 44px;
    }
}
```

### Multiple Select:
```css
/* Mobile: Grotere size voor makkelijker selecteren */
select[multiple] {
    min-height: 200px;
    padding: 10px;
}

/* Desktop: Kan iets kleiner */
@media (min-width: 768px) {
    select[multiple] {
        min-height: 150px;
    }
}
```

---

## 9. Responsive Textarea

### Textarea Sizing:
```css
/* Mobile: Grotere default size */
textarea {
    min-height: 120px;
    padding: 14px;
    font-size: 16px;
    line-height: 1.5;
    resize: vertical;
}

/* Desktop: Kan iets kleiner default */
@media (min-width: 768px) {
    textarea {
        min-height: 100px;
        padding: 12px;
    }
}

/* Specifieke textarea's */
textarea.large {
    min-height: 200px;
}

@media (min-width: 768px) {
    textarea.large {
        min-height: 150px;
    }
}
```

---

## 10. Complete Voorbeeld: Responsive Contact Form

### HTML:
```html
<div class="form-container">
    <h2>Contact Formulier</h2>

    <form>
        <!-- Naam (2 kolommen op desktop) -->
        <div class="form-row">
            <div class="form-group">
                <label for="first-name" class="required">Voornaam</label>
                <input
                    type="text"
                    id="first-name"
                    name="first-name"
                    placeholder="Jan"
                    required
                    minlength="2"
                >
                <span class="error-message">Voornaam is verplicht (min 2 karakters)</span>
            </div>

            <div class="form-group">
                <label for="last-name" class="required">Achternaam</label>
                <input
                    type="text"
                    id="last-name"
                    name="last-name"
                    placeholder="Jansen"
                    required
                    minlength="2"
                >
                <span class="error-message">Achternaam is verplicht (min 2 karakters)</span>
            </div>
        </div>

        <!-- Email -->
        <div class="form-group">
            <label for="email" class="required">Email</label>
            <input
                type="email"
                id="email"
                name="email"
                placeholder="jan@example.nl"
                inputmode="email"
                required
            >
            <span class="error-message">Voer een geldig email adres in</span>
        </div>

        <!-- Telefoon -->
        <div class="form-group">
            <label for="phone">Telefoon</label>
            <input
                type="tel"
                id="phone"
                name="phone"
                placeholder="06-12345678"
                inputmode="tel"
                pattern="06-[0-9]{8}"
            >
            <span class="error-message">Formaat: 06-12345678</span>
        </div>

        <!-- Onderwerp -->
        <div class="form-group">
            <label for="subject" class="required">Onderwerp</label>
            <select id="subject" name="subject" required>
                <option value="">-- Kies een onderwerp --</option>
                <option value="question">Vraag</option>
                <option value="feedback">Feedback</option>
                <option value="complaint">Klacht</option>
            </select>
        </div>

        <!-- Bericht -->
        <div class="form-group">
            <label for="message" class="required">Bericht</label>
            <textarea
                id="message"
                name="message"
                placeholder="Typ hier je bericht..."
                required
                minlength="10"
                maxlength="500"
            ></textarea>
            <div class="char-count">
                <span>0</span> / 500 karakters
            </div>
            <span class="error-message">Bericht moet minimaal 10 karakters bevatten</span>
        </div>

        <!-- Privacy checkbox -->
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
/* ========================================
   MOBILE FIRST STYLES (< 768px)
   ======================================== */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
    font-size: 16px;
    line-height: 1.6;
    background: #f5f5f5;
    padding: 20px;
}

/* Form Container */
.form-container {
    max-width: 100%;
    background: white;
    padding: 25px;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

h2 {
    margin-bottom: 25px;
    font-size: 26px;
    text-align: center;
}

/* Form Groups */
.form-group {
    display: flex;
    flex-direction: column;
    margin-bottom: 25px;
}

label {
    margin-bottom: 8px;
    font-weight: 600;
    color: #333;
    font-size: 15px;
}

label.required::after {
    content: " *";
    color: #dc3545;
}

/* Inputs */
input,
select,
textarea {
    width: 100%;
    padding: 14px;
    border: 2px solid #ddd;
    border-radius: 8px;
    font-size: 16px; /* Prevent zoom! */
    font-family: inherit;
    transition: border-color 0.3s;
    min-height: 48px;
}

input:focus,
select:focus,
textarea:focus {
    outline: none;
    border-color: #007bff;
    box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.1);
}

/* Validation States */
input:not(:placeholder-shown):valid {
    border-color: #28a745;
}

input:not(:placeholder-shown):invalid {
    border-color: #dc3545;
}

/* Error Messages */
.error-message {
    display: none;
    color: #dc3545;
    font-size: 14px;
    margin-top: 6px;
    padding: 8px 12px;
    background: #ffe6e6;
    border-radius: 4px;
}

input:not(:placeholder-shown):invalid ~ .error-message,
textarea:not(:placeholder-shown):invalid ~ .error-message {
    display: block;
}

/* Select */
select {
    appearance: none;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='8'%3E%3Cpath fill='%23333' d='M0 0l6 8 6-8z'/%3E%3C/svg%3E");
    background-repeat: no-repeat;
    background-position: right 15px center;
    padding-right: 45px;
    cursor: pointer;
}

/* Textarea */
textarea {
    min-height: 140px;
    resize: vertical;
    line-height: 1.5;
}

.char-count {
    text-align: right;
    font-size: 13px;
    color: #666;
    margin-top: 5px;
}

/* Checkbox */
.checkbox-custom {
    display: flex;
    align-items: center;
    margin-bottom: 25px;
    cursor: pointer;
    padding: 12px;
    border-radius: 6px;
    min-height: 52px; /* Touch-friendly */
}

.checkbox-custom input {
    position: absolute;
    opacity: 0;
}

.checkbox-mark {
    width: 24px;
    height: 24px;
    border: 2px solid #ddd;
    border-radius: 4px;
    margin-right: 12px;
    flex-shrink: 0;
    position: relative;
    transition: all 0.3s;
}

.checkbox-mark::after {
    content: "";
    width: 6px;
    height: 12px;
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

.checkbox-label {
    font-size: 15px;
    line-height: 1.4;
}

.checkbox-label a {
    color: #007bff;
}

/* Form Row (voor meerdere kolommen) */
.form-row {
    display: flex;
    flex-direction: column;
    gap: 25px;
}

/* Buttons */
.form-actions {
    display: flex;
    flex-direction: column;
    gap: 12px;
    margin-top: 30px;
}

button {
    width: 100%;
    padding: 16px;
    border: none;
    border-radius: 8px;
    font-size: 18px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
    min-height: 52px; /* Touch-friendly */
}

.btn-primary {
    background: #007bff;
    color: white;
}

.btn-primary:active {
    background: #0056b3;
    transform: scale(0.98);
}

.btn-secondary {
    background: #6c757d;
    color: white;
}

.btn-secondary:active {
    background: #545b62;
    transform: scale(0.98);
}

button:disabled {
    background: #e9ecef;
    color: #6c757d;
    cursor: not-allowed;
    opacity: 0.6;
}

/* ========================================
   TABLET STYLES (>= 768px)
   ======================================== */

@media (min-width: 768px) {
    body {
        padding: 40px;
    }

    .form-container {
        max-width: 700px;
        margin: 0 auto;
        padding: 40px;
    }

    h2 {
        font-size: 32px;
    }

    /* Form row: 2 kolommen */
    .form-row {
        flex-direction: row;
        gap: 20px;
    }

    .form-row .form-group {
        flex: 1;
    }

    /* Inputs: Iets kleiner */
    input,
    select,
    textarea {
        padding: 12px;
        min-height: 44px;
    }

    textarea {
        min-height: 120px;
    }

    /* Checkbox: Kleiner */
    .checkbox-custom {
        padding: 10px;
        min-height: 48px;
    }

    .checkbox-mark {
        width: 20px;
        height: 20px;
    }

    /* Buttons: Naast elkaar */
    .form-actions {
        flex-direction: row;
        justify-content: flex-end;
    }

    button {
        width: auto;
        min-width: 150px;
        padding: 14px 30px;
        font-size: 16px;
        min-height: 48px;
    }
}

/* ========================================
   DESKTOP STYLES (>= 1024px)
   ======================================== */

@media (min-width: 1024px) {
    .form-container {
        max-width: 800px;
    }

    /* Hover effects (desktop only) */
    @media (hover: hover) {
        .btn-primary:hover {
            background: #0056b3;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 123, 255, 0.3);
        }

        .btn-secondary:hover {
            background: #545b62;
            transform: translateY(-2px);
        }

        .checkbox-custom:hover {
            background: #f8f9fa;
        }
    }
}
```

---

## 11. Praktijkopdracht: Responsive Week 4 Form

### Opdracht:
Maak je Week 4 formulier volledig responsive.

**Vereisten:**

#### Mobile (< 768px):
- [ ] Alles gestackt (1 kolom)
- [ ] Labels boven inputs
- [ ] Inputs padding 14px, min-height 48px
- [ ] Font-size minimaal 16px
- [ ] Buttons full-width
- [ ] Error messages onder inputs
- [ ] Checkbox/radio grote touch areas (min 48px)

#### Tablet (768px - 1023px):
- [ ] Form rows 2 kolommen (voornaam + achternaam naast elkaar)
- [ ] Inputs padding 12px, min-height 44px
- [ ] Buttons naast elkaar (reset links, submit rechts)
- [ ] Checkboxes 2 kolommen grid

#### Desktop (>= 1024px):
- [ ] Labels optioneel naast inputs (inline layout)
- [ ] Checkboxes 3 kolommen grid
- [ ] Max-width 800px, gecentreerd
- [ ] Hover effects op buttons

#### Alle Schermen:
- [ ] inputmode attributes op juiste inputs
- [ ] Responsive error messages
- [ ] Touch-friendly alle clickable elementen
- [ ] Smooth transitions
- [ ] Test op minimaal 3 resoluties (375px, 768px, 1024px)

---

## Tips & Best Practices

### ✅ DO's:
- **16px+ font-size** op inputs (prevent zoom!)
- **48px+ touch targets** op mobile
- **Full-width buttons** op mobile
- **Stack alles** op mobile (1 kolom)
- **inputmode** gebruiken voor betere keyboards
- **Test op echte devices** (niet alleen browser resize)
- **Smooth transitions** tussen breakpoints

### ❌ DON'Ts:
- Font-size <16px op inputs (zoom trigger!)
- Te kleine touch targets (<44px)
- Horizontal scroll op mobile
- Te veel kolommen op mobile (max 1-2)
- Desktop layout forceren op mobile
- Vergeten te testen op small mobile (320-375px)

---

## Veelgemaakte Fouten

### Fout 1: Zoom bij input focus (iOS)
**Probleem:** iOS zoomed in bij focus op input <16px
**Oplossing:**
```css
input {
    font-size: 16px; /* Minimaal! */
}
```

### Fout 2: Te kleine touch targets
**Probleem:** Moeilijk te klikken op mobile
**Oplossing:**
```css
input,
button,
.checkbox-custom {
    min-height: 48px;
}
```

### Fout 3: Full-width buttons op desktop
**Probleem:** Buttons te groot op desktop
**Oplossing:**
```css
/* Mobile */
button {
    width: 100%;
}

/* Desktop */
@media (min-width: 768px) {
    button {
        width: auto;
        min-width: 150px;
    }
}
```

---

## Samenvatting

Deze week heb je geleerd:
- ✅ Formulieren responsive maken (mobile → desktop)
- ✅ Stacked vs inline layouts
- ✅ Touch-friendly inputs (48px minimum)
- ✅ inputmode voor betere mobile keyboards
- ✅ Responsive buttons (full-width mobile, auto desktop)
- ✅ Multi-column forms op desktop, single-column mobile
- ✅ Responsive error messages
- ✅ Responsive radio/checkboxes (stack vs grid)
- ✅ Font-size minimaal 16px (prevent zoom)

**Volgende week:** Eindproject - Combineer ALLES wat je geleerd hebt in één grote responsive form applicatie!

---

**Tip:** Kijk naar formulieren op grote websites (Booking.com, Airbnb, Google Forms) op zowel mobile als desktop. Let op hoe ze van layout veranderen. Veel inspiratie! 📱💻🎨
