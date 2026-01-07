# Week 1 - Formulier Basics & Text Inputs

**Doel van deze week:** Leer de basis van HTML formulieren en style professionele text input velden.

---

## Leerdoelen

Na deze week kun je:
- ✅ Uitleggen waarom formulieren belangrijk zijn op websites
- ✅ Een HTML formulier structuur opzetten met `<form>`, `<label>`, `<input>`
- ✅ Verschillende text input types gebruiken (text, email, password, number, tel, url)
- ✅ Labels correct koppelen aan inputs (for/id)
- ✅ Placeholder en required attributes toepassen
- ✅ Basis formulier styling (borders, padding, focus states)
- ✅ Input states stylen (:focus, :valid, :invalid)
- ✅ Formulier layout maken met Flexbox

---

## Waarom Formulieren?

Formulieren zijn **overal** op websites:
- 🔐 **Inloggen** en registreren
- 📧 **Contact** formulieren
- 🛒 **Bestellingen** plaatsen
- 💬 **Reviews** en comments schrijven
- 🔍 **Zoeken** op websites
- 📝 **Enquêtes** en feedback

**Zonder formulieren kunnen gebruikers geen data invoeren!**

---

## 1. HTML Formulier Basis Structuur

### Simpelste Formulier:
```html
<form>
    <label for="naam">Naam:</label>
    <input type="text" id="naam" name="naam">

    <button type="submit">Verstuur</button>
</form>
```

### Belangrijke Elementen:

#### `<form>`
- Container voor alle formulier elementen
- `action=""` → waar data naartoe gestuurd wordt (later met PHP)
- `method="post"` → hoe data verzonden wordt (later!)

#### `<label>`
- Tekstlabel voor input veld
- `for="id"` → koppelt label aan input (belangrijk voor accessibility!)
- Klikken op label = focus op input

#### `<input>`
- Invoerveld voor gebruiker
- `type=""` → bepaalt soort input
- `id=""` → unieke identificatie (koppelt aan label)
- `name=""` → naam voor backend (PHP gebruikt dit later)

#### `<button>`
- `type="submit"` → verstuurt formulier
- `type="reset"` → reset alle velden
- `type="button"` → custom JavaScript actie

---

## 2. Text Input Types

### type="text"
Standaard tekst invoer (alles mag)
```html
<label for="username">Gebruikersnaam:</label>
<input type="text" id="username" name="username">
```

### type="email"
Email adres (controleert op @ en .)
```html
<label for="email">Email:</label>
<input type="email" id="email" name="email">
```

### type="password"
Wachtwoord (bullets/sterretjes ipv tekst)
```html
<label for="password">Wachtwoord:</label>
<input type="password" id="password" name="password">
```

### type="number"
Alleen nummers (vaak met pijltjes)
```html
<label for="leeftijd">Leeftijd:</label>
<input type="number" id="leeftijd" name="leeftijd" min="0" max="120">
```

### type="tel"
Telefoonnummer (mobiel toont nummer keyboard)
```html
<label for="telefoon">Telefoon:</label>
<input type="tel" id="telefoon" name="telefoon">
```

### type="url"
Website URL (controleert op http://)
```html
<label for="website">Website:</label>
<input type="url" id="website" name="website">
```

### type="date"
Datum picker
```html
<label for="geboortedatum">Geboortedatum:</label>
<input type="date" id="geboortedatum" name="geboortedatum">
```

### type="search"
Zoekveld (vaak met X-knop om te wissen)
```html
<label for="zoeken">Zoeken:</label>
<input type="search" id="zoeken" name="zoeken">
```

---

## 3. Belangrijke Attributes

### required
Veld moet ingevuld zijn voor submit
```html
<input type="email" id="email" name="email" required>
```

### placeholder
Voorbeeld tekst in het veld (verdwijnt bij typen)
```html
<input type="text" id="naam" name="naam" placeholder="bijv. Jan Jansen">
```

### value
Vooringevulde waarde
```html
<input type="text" id="land" name="land" value="Nederland">
```

### disabled
Veld kan niet gebruikt worden (grijs)
```html
<input type="text" id="id" name="id" value="12345" disabled>
```

### readonly
Kan niet aangepast worden, maar wel geselecteerd
```html
<input type="text" id="email" name="email" value="jan@example.com" readonly>
```

### maxlength
Maximaal aantal karakters
```html
<input type="text" id="postcode" name="postcode" maxlength="6">
```

### minlength
Minimaal aantal karakters
```html
<input type="password" id="wachtwoord" name="wachtwoord" minlength="8">
```

### autocomplete
Browser autocompletion aan/uit
```html
<input type="password" id="wachtwoord" name="wachtwoord" autocomplete="off">
```

---

## 4. Form Styling met CSS

### Basis Input Styling:
```css
/* Alle inputs stylen */
input[type="text"],
input[type="email"],
input[type="password"],
input[type="number"],
input[type="tel"],
input[type="url"],
input[type="date"] {
    width: 100%;
    padding: 12px 15px;
    border: 2px solid #ddd;
    border-radius: 8px;
    font-size: 16px;
    font-family: inherit;
    transition: border-color 0.3s;
}

/* Focus state (wanneer je in het veld klikt) */
input:focus {
    outline: none;
    border-color: #007bff;
    box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.1);
}

/* Disabled state */
input:disabled {
    background-color: #f5f5f5;
    color: #999;
    cursor: not-allowed;
}

/* Read-only state */
input:readonly {
    background-color: #f9f9f9;
}
```

### Label Styling:
```css
label {
    display: block;
    margin-bottom: 8px;
    font-weight: 600;
    color: #333;
}

/* Optioneel: required velden markeren */
label.required::after {
    content: " *";
    color: #e74c3c;
}
```

### Form Layout met Flexbox:
```css
/* Form container */
.form-container {
    max-width: 500px;
    margin: 0 auto;
    padding: 30px;
    background: white;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

/* Form group (label + input samen) */
.form-group {
    margin-bottom: 20px;
}

/* Form row (meerdere velden naast elkaar) */
.form-row {
    display: flex;
    gap: 20px;
}

.form-row .form-group {
    flex: 1;
}

/* Submit button */
button[type="submit"] {
    width: 100%;
    padding: 14px;
    background: #007bff;
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    transition: background 0.3s;
}

button[type="submit"]:hover {
    background: #0056b3;
}
```

---

## 5. Input States met CSS

### :focus (veld is actief)
```css
input:focus {
    border-color: #007bff;
    box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.15);
}
```

### :valid (invoer is correct)
```css
input:valid {
    border-color: #28a745;
}

/* Alleen tonen als er iets ingevuld is */
input:not(:placeholder-shown):valid {
    border-color: #28a745;
}
```

### :invalid (invoer is incorrect)
```css
input:invalid {
    border-color: #dc3545;
}

/* Alleen tonen als gebruiker getypt heeft */
input:not(:placeholder-shown):invalid {
    border-color: #dc3545;
}
```

### :disabled (veld is uitgeschakeld)
```css
input:disabled {
    background: #e9ecef;
    color: #6c757d;
    cursor: not-allowed;
}
```

---

## 6. CompleteVoorbeeld: Login Form

### HTML:
```html
<div class="form-container">
    <h2>Inloggen</h2>

    <form>
        <div class="form-group">
            <label for="email" class="required">Email</label>
            <input
                type="email"
                id="email"
                name="email"
                placeholder="jouw@email.nl"
                required
            >
        </div>

        <div class="form-group">
            <label for="password" class="required">Wachtwoord</label>
            <input
                type="password"
                id="password"
                name="password"
                placeholder="Minimaal 8 karakters"
                required
                minlength="8"
            >
        </div>

        <button type="submit">Inloggen</button>

        <p class="form-footer">
            Nog geen account? <a href="#">Registreer hier</a>
        </p>
    </form>
</div>
```

### CSS:
```css
.form-container {
    max-width: 400px;
    margin: 50px auto;
    padding: 40px;
    background: white;
    border-radius: 12px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.1);
}

.form-container h2 {
    margin-top: 0;
    margin-bottom: 30px;
    text-align: center;
    color: #333;
}

.form-group {
    margin-bottom: 20px;
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

input {
    width: 100%;
    padding: 12px 15px;
    border: 2px solid #ddd;
    border-radius: 8px;
    font-size: 16px;
    font-family: inherit;
    transition: all 0.3s;
}

input:focus {
    outline: none;
    border-color: #007bff;
    box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.1);
}

input:not(:placeholder-shown):valid {
    border-color: #28a745;
}

input:not(:placeholder-shown):invalid {
    border-color: #dc3545;
}

button[type="submit"] {
    width: 100%;
    padding: 14px;
    margin-top: 10px;
    background: #007bff;
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    transition: background 0.3s;
}

button[type="submit"]:hover {
    background: #0056b3;
}

.form-footer {
    margin-top: 20px;
    text-align: center;
    font-size: 14px;
    color: #666;
}

.form-footer a {
    color: #007bff;
    text-decoration: none;
}

.form-footer a:hover {
    text-decoration: underline;
}
```

---

## 7. Praktijkopdracht: Registratie Formulier

### Opdracht:
Maak een registratie formulier met de volgende velden:

**Vereisten:**
1. **Voornaam** (text, required)
2. **Achternaam** (text, required)
3. **Email** (email, required)
4. **Telefoonnummer** (tel, optional)
5. **Geboortedatum** (date, required)
6. **Website** (url, optional)
7. **Wachtwoord** (password, required, min 8 karakters)
8. **Wachtwoord bevestigen** (password, required, min 8 karakters)

**Styling eisen:**
- Gebruik Flexbox voor form rows (voornaam + achternaam naast elkaar)
- Focus states op alle inputs
- Required velden markeren met *
- Button hover effect
- Max-width 600px, gecentreerd
- Mooie spacing tussen velden

**Bonus:**
- :valid en :invalid states
- Disabled button totdat alles ingevuld is (later met JavaScript)
- Placeholder teksten voor alle velden

---

## Tips & Best Practices

### ✅ DO's:
- **Altijd** een label gebruiken bij elke input (accessibility!)
- `for` en `id` correct koppelen
- Required velden duidelijk markeren
- Placeholder als voorbeeld, niet als label
- Focus states altijd stylen
- Font-size minimaal 16px (prevent zoom op iOS)
- `type` correct kiezen (email, tel, etc. voor betere mobile keyboards)

### ❌ DON'Ts:
- Geen label gebruiken (heel slecht voor accessibility)
- Placeholder gebruiken als enige label
- Outline compleet verwijderen zonder alternatief
- Te kleine inputs (moeilijk te klikken)
- Geen focus states (keyboard gebruikers zien niet waar ze zijn)
- Te veel velden tegelijk (splits op in stappen)

---

## DevTools Tips

### Input States Testen:
1. Open DevTools (F12)
2. Rechtsklik op input → Inspect
3. Rechts in Styles panel: zie `:hov`
4. Vink `:focus`, `:valid`, `:invalid` aan om states te testen

### Mobile Simuleren:
1. DevTools → Toggle device toolbar (Ctrl + Shift + M)
2. Selecteer iPhone of Android
3. Test welke keyboard verschijnt bij verschillende input types

---

## Veelgemaakte Fouten

### ❌ Fout:
```html
<input type="text" placeholder="Naam">
```
**Probleem:** Geen label! Screen readers kunnen dit niet lezen.

### ✅ Goed:
```html
<label for="naam">Naam</label>
<input type="text" id="naam" name="naam" placeholder="bijv. Jan Jansen">
```

---

### ❌ Fout:
```css
input:focus {
    outline: none; /* Slecht voor accessibility! */
}
```

### ✅ Goed:
```css
input:focus {
    outline: none;
    border-color: #007bff;
    box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.15); /* Alternatieve focus indicator */
}
```

---

### ❌ Fout:
```html
<input type="text"> <!-- Geen name attribute! -->
```
**Probleem:** Backend (PHP) kan data niet ontvangen.

### ✅ Goed:
```html
<input type="text" id="naam" name="naam">
```

---

## Samenvatting

Deze week heb je geleerd:
- ✅ HTML formulier structuur (`<form>`, `<label>`, `<input>`)
- ✅ Verschillende text input types (text, email, password, number, tel, url, date)
- ✅ Labels correct koppelen met `for` en `id`
- ✅ Attributes gebruiken (required, placeholder, disabled, readonly, maxlength)
- ✅ Inputs professioneel stylen met CSS
- ✅ Input states (:focus, :valid, :invalid, :disabled)
- ✅ Form layout maken met Flexbox

**Volgende week:** Radio buttons, checkboxes en select dropdowns!

---

**Tip:** Bekijk formulieren op websites die je vaak gebruikt (Google, Instagram, webshops). Let op hoe ze inputs stylen, error messages tonen, en focus states gebruiken. Inspiratie overal! 🚀
