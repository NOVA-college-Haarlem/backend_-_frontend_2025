# Frontend Ontwikkeling - Blok 2

## Week 6: Formulieren Stylen

### Algemene Informatie
- **Doelgroep:** MBO studenten
- **Lesduur:** 90 minuten
- **Voorkennis:** HTML forms, CSS box model, selectoren
- **Tools:** VS Code, Browser

---

### Leerdoelen
Na deze les kan de student:
- Input fields mooi stylen
- Labels correct positioneren
- Focus states toevoegen voor betere UX
- Textarea en select elementen stylen
- Checkboxes en radio buttons stylen (basis)
- Submit buttons als CTA's gebruiken
- Form layouts maken (stacked en inline)
- Validation states visualiseren (success, error)

---

### Lesopbouw (90 minuten)

**1. Waarom Forms Stylen? (10 min)**

**Demo: Voor en Na**

Onstyled form (lelijk):
```html
<form>
    <label>Naam:</label>
    <input type="text">
    <button>Verzenden</button>
</form>
```

Gestyled form (mooi):
```html
<form class="styled-form">
    <div class="form-group">
        <label for="name">Naam:</label>
        <input type="text" id="name" class="form-input">
    </div>
    <button class="btn btn-primary">Verzenden</button>
</form>
```

**Waarom is styling belangrijk?**
- Betere gebruikerservaring
- Duidelijker welk veld actief is (:focus)
- Professioneler uiterlijk
- Error states kunnen visueel getoond worden

---

**2. Text Inputs Stylen (20 min)**

**Basis HTML:**
```html
<div class="form-group">
    <label for="email">Email:</label>
    <input type="email" id="email" class="form-input" placeholder="jouw@email.com">
</div>
```

**Basis CSS:**
```css
.form-input {
    width: 100%;
    padding: 10px 15px;
    font-size: 16px;
    border: 2px solid #ddd;
    border-radius: 5px;
    transition: border-color 0.3s;
}

.form-input:focus {
    outline: none;  /* Verwijder browser default */
    border-color: #007bff;
    box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.1);
}
```

**Stap voor stap samen opbouwen:**

```css
/* Stap 1: Basis styling */
.form-input {
    padding: 10px 15px;
    font-size: 16px;
}

/* Stap 2: Border styling */
.form-input {
    border: 2px solid #ddd;
    border-radius: 5px;
}

/* Stap 3: Focus state */
.form-input:focus {
    outline: none;
    border-color: #007bff;
}

/* Stap 4: Smooth transition */
.form-input {
    transition: border-color 0.3s;
}

/* Stap 5: Shadow bij focus */
.form-input:focus {
    box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.1);
}
```

**Placeholder styling:**
```css
.form-input::placeholder {
    color: #999;
    font-style: italic;
}
```

**Disabled state:**
```css
.form-input:disabled {
    background-color: #f5f5f5;
    color: #999;
    cursor: not-allowed;
}
```

**Oefening 1 (10 min):**
Maak 3 input fields (naam, email, telefoon) met verschillende focus kleuren.

---

**3. Labels Positioneren (10 min)**

**Boven input (standaard):**
```html
<div class="form-group">
    <label for="name">Naam:</label>
    <input type="text" id="name" class="form-input">
</div>
```

```css
.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
    color: #333;
}
```

**Inline (naast input):**
```css
.form-group-inline {
    display: flex;
    align-items: center;
    margin-bottom: 15px;
}

.form-group-inline label {
    width: 120px;
    margin-right: 10px;
}

.form-group-inline .form-input {
    flex: 1;
}
```

**Floating label (advanced, optioneel):**
```css
/* Label schuift omhoog bij focus - complex! */
/* Skip voor nu, of toon alleen als extra */
```

---

**4. Textarea Stylen (10 min)**

**HTML:**
```html
<div class="form-group">
    <label for="message">Bericht:</label>
    <textarea id="message" class="form-textarea" rows="5" placeholder="Jouw bericht..."></textarea>
</div>
```

**CSS:**
```css
.form-textarea {
    width: 100%;
    padding: 10px 15px;
    font-size: 16px;
    border: 2px solid #ddd;
    border-radius: 5px;
    resize: vertical;  /* Alleen verticaal groter maken */
    font-family: inherit;  /* Gebruik zelfde font als pagina */
    transition: border-color 0.3s;
}

.form-textarea:focus {
    outline: none;
    border-color: #007bff;
    box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.1);
}
```

**resize property:**
```css
resize: none;       /* Niet resizable */
resize: vertical;   /* Alleen verticaal */
resize: horizontal; /* Alleen horizontaal */
resize: both;       /* Beide richtingen (standaard) */
```

---

**5. Select Dropdown Stylen (10 min)**

**HTML:**
```html
<div class="form-group">
    <label for="country">Land:</label>
    <select id="country" class="form-select">
        <option value="">Kies een land...</option>
        <option value="nl">Nederland</option>
        <option value="be">België</option>
        <option value="de">Duitsland</option>
    </select>
</div>
```

**CSS:**
```css
.form-select {
    width: 100%;
    padding: 10px 15px;
    font-size: 16px;
    border: 2px solid #ddd;
    border-radius: 5px;
    background-color: white;
    cursor: pointer;
    transition: border-color 0.3s;
}

.form-select:focus {
    outline: none;
    border-color: #007bff;
    box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.1);
}

/* Pijltje styling (beperkt mogelijk in CSS) */
.form-select {
    appearance: none;  /* Verwijder browser default styling */
    background-image: url('data:image/svg+xml;utf8,<svg fill="black" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M7 10l5 5 5-5z"/></svg>');
    background-repeat: no-repeat;
    background-position: right 10px center;
    padding-right: 40px;
}
```

**Simpeler (zonder custom pijltje):**
```css
.form-select {
    /* Laat browser pijltje staan */
    padding: 10px 15px;
    border: 2px solid #ddd;
    border-radius: 5px;
}
```

---

**6. Checkboxes en Radio Buttons (10 min)**

**Default checkboxes zijn lastig te stylen!**

**Basis styling:**
```html
<div class="form-check">
    <input type="checkbox" id="agree" class="form-checkbox">
    <label for="agree">Ik ga akkoord met de voorwaarden</label>
</div>
```

```css
.form-check {
    margin-bottom: 15px;
}

.form-checkbox {
    margin-right: 8px;
    width: 18px;
    height: 18px;
    cursor: pointer;
}

.form-check label {
    cursor: pointer;
}
```

**Custom checkbox (advanced, optioneel):**
```css
/* Verberg default checkbox */
.form-checkbox {
    position: absolute;
    opacity: 0;
}

/* Maak custom checkbox */
.form-check label {
    position: relative;
    padding-left: 30px;
    cursor: pointer;
}

.form-check label::before {
    content: "";
    position: absolute;
    left: 0;
    top: 0;
    width: 20px;
    height: 20px;
    border: 2px solid #ddd;
    border-radius: 3px;
}

/* Checkmark bij checked */
.form-checkbox:checked + label::after {
    content: "✓";
    position: absolute;
    left: 5px;
    top: 2px;
    color: #007bff;
    font-weight: bold;
}
```

**Voor nu:** Basis styling is genoeg!

---

**7. Submit Button (5 min)**

**Gebruik button van Week 2!**

```html
<button type="submit" class="btn btn-primary btn-lg">Verzenden</button>
```

```css
.btn {
    padding: 12px 30px;
    font-size: 16px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: all 0.3s;
}

.btn-primary {
    background-color: #007bff;
    color: white;
}

.btn-primary:hover {
    background-color: #0056b3;
}

.btn-lg {
    padding: 15px 40px;
    font-size: 18px;
}
```

**Full width button:**
```css
.btn-block {
    width: 100%;
}
```

---

**8. Form Layouts (10 min)**

**Stacked (onder elkaar):**
```html
<form class="form-stacked">
    <div class="form-group">
        <label>Naam:</label>
        <input type="text" class="form-input">
    </div>
    <div class="form-group">
        <label>Email:</label>
        <input type="email" class="form-input">
    </div>
    <button class="btn btn-primary">Verzenden</button>
</form>
```

```css
.form-stacked {
    max-width: 500px;
    margin: 0 auto;
}

.form-group {
    margin-bottom: 20px;
}
```

**Inline (naast elkaar):**
```html
<form class="form-inline">
    <input type="email" class="form-input" placeholder="Email">
    <button class="btn btn-primary">Aanmelden</button>
</form>
```

```css
.form-inline {
    display: flex;
    gap: 10px;
}

.form-inline .form-input {
    flex: 1;
}
```

---

**9. Validation States (10 min)**

**Success State:**
```html
<div class="form-group form-success">
    <label>Email:</label>
    <input type="email" class="form-input" value="email@example.com">
    <small class="form-message">✓ Geldig email adres</small>
</div>
```

```css
.form-success .form-input {
    border-color: #28a745;
}

.form-success .form-message {
    display: block;
    margin-top: 5px;
    color: #28a745;
    font-size: 14px;
}
```

**Error State:**
```html
<div class="form-group form-error">
    <label>Email:</label>
    <input type="email" class="form-input" value="invalid">
    <small class="form-message">✗ Ongeldig email adres</small>
</div>
```

```css
.form-error .form-input {
    border-color: #dc3545;
}

.form-error .form-message {
    display: block;
    margin-top: 5px;
    color: #dc3545;
    font-size: 14px;
}
```

---

**10. Grote Oefening: Complete Forms (5 min)**

**Opdracht:**
Maak 3 verschillende forms:

1. **Contact Form**
   - Naam, email, bericht (textarea)
   - Submit button

2. **Newsletter Signup** (inline)
   - Email input
   - "Aanmelden" button

3. **Registration Form**
   - Username, email, password
   - Checkbox: "Ik ga akkoord"
   - Submit button

Alle forms moeten:
- Focus states hebben
- Hover effecten
- Nette spacing
- Responsive zijn

---

### Huiswerk

**Hoofdopdracht: 5 Form Types**

Maak 5 verschillende formulieren:

1. **Simple Contact Form**
   - Naam, email, onderwerp, bericht
   - Submit button met icon

2. **Login Form**
   - Email, password
   - "Onthoud mij" checkbox
   - "Inloggen" button
   - "Wachtwoord vergeten?" link

3. **Search Form** (inline)
   - Search input met placeholder
   - Search button met 🔍

4. **Feedback Form**
   - Rating (radio buttons 1-5)
   - Comment textarea
   - Submit

5. **Signup Form**
   - Voornaam, achternaam
   - Email, bevestig email
   - Wachtwoord
   - Land (select dropdown)
   - Voorwaarden checkbox
   - Submit button

**Technische eisen:**
- Alle inputs hebben focus states
- Alle forms hebben goede spacing
- Submit buttons zijn styled (van Week 2)
- Gebruik validation states (success/error) op minstens 1 form
- Responsive (testen op small screen!)

**Opdracht 2: Contact Form voor Portfolio**

Maak een contact form voor je eindproject:
- Naam, email, bericht
- Kies een style die bij je portfolio past
- Zorg dat het responsive is

**Opdracht 3: Form Inspiratie**

Bezoek 3 websites met forms en screenshot:
- Login forms
- Contact forms
- Signup forms

Wat vind je mooi? Welke UX patterns gebruiken ze?

---

### Controlelijst voor Docent
- [ ] Studenten kunnen input fields stylen
- [ ] Studenten kunnen focus states toevoegen
- [ ] Studenten kunnen labels positioneren
- [ ] Studenten kunnen textarea en select stylen
- [ ] Studenten kunnen forms layouten
- [ ] Studenten kunnen validation states visualiseren

### Tips voor Docent
- **Focus op UX:** Waarom zijn focus states belangrijk?
- **Live demo:** Laat zien hoe :focus werkt in DevTools
- **Veelgemaakte fout:** outline: none zonder alternatief
- **Veelgemaakte fout:** placeholder als label gebruiken
- **Accessibility:** Leg uit waarom labels belangrijk zijn
- **Motivatie:** "Forms zijn overal! Elke website heeft ze!"

### Resources
- [Form Design Patterns](https://formdesignpatterns.com/)
- [Form Examples](https://codepen.io/search/pens?q=form)

---
