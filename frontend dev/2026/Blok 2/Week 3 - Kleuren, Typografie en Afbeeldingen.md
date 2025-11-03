# Week 3: Kleuren, Typografie en Afbeeldingen

## Leerdoelen
Na deze les kan de student:
- Kleurenschema's toepassen op een website
- Verschillende font eigenschappen gebruiken voor leesbaarheid
- Afbeeldingen professioneel stylen met CSS
- Een visueel aantrekkelijke pagina maken met kleuren en typografie

## Lesopbouw (90 minuten)

### 1. Terugblik (5 min)
- Hoe ging het met buttons maken?
- Laat 1-2 studenten hun button designs zien

### 2. Kleuren in Webdesign (25 min)

**Waarom zijn kleuren belangrijk?**
- Maken je website aantrekkelijk
- Helpen bezoekers informatie te begrijpen
- Geven je website een "gevoel" (professioneel, speels, etc.)

**Kleurnotaties in CSS:**
```css
/* Kleurnamen */
.box {
    background-color: lightblue;
    color: darkblue;
}

/* Hex codes (meest gebruikt) */
.box {
    background-color: #3498db;
    color: #2c3e50;
}

/* RGB */
.box {
    background-color: rgb(52, 152, 219);
    color: rgb(44, 62, 80);
}
```

**Kleurenschema's:**
```css
/* Basis kleuren definiëren */
body {
    background-color: #f5f5f5;  /* Lichte achtergrond */
    color: #333333;              /* Donkere tekst */
}

h1, h2, h3 {
    color: #2c3e50;              /* Heading kleur */
}

.accent {
    background-color: #3498db;   /* Accent kleur */
    color: white;
}
```

**Contrast en leesbaarheid:**
```css
/* Goed contrast - Makkelijk te lezen */
.goed {
    background-color: white;
    color: #333;
}

/* Slecht contrast - Moeilijk te lezen */
.slecht {
    background-color: #ddd;
    color: #ccc;
}
```

**Oefening (10 min):**
Maak een pagina met:
- Een lichte achtergrondkleur voor de body
- Donkere tekstkleur voor leesbaarheid
- Eén accent kleur voor belangrijke elementen
- Test verschillende kleurencombinaties

### 3. Typografie (30 min)

**Font families:**
```css
body {
    font-family: Arial, Helvetica, sans-serif;
}

h1, h2, h3 {
    font-family: Georgia, 'Times New Roman', serif;
}
```

**Font sizes en hiërarchie:**
```css
body {
    font-size: 16px;
    line-height: 1.6;
}

h1 {
    font-size: 36px;
}

h2 {
    font-size: 28px;
}

h3 {
    font-size: 22px;
}

p {
    font-size: 16px;
}
```

**Font weights:**
```css
.normaal {
    font-weight: normal;    /* 400 */
}

.dik {
    font-weight: bold;      /* 700 */
}

.extra-dik {
    font-weight: 900;
}
```

**Text styling:**
```css
.italic {
    font-style: italic;
}

.onderstreept {
    text-decoration: underline;
}

.geen-decoratie {
    text-decoration: none;  /* Handig voor links */
}

.hoofdletters {
    text-transform: uppercase;
}

.kapitalen {
    text-transform: capitalize;
}
```

**Letter en word spacing:**
```css
.spatieer {
    letter-spacing: 2px;
    word-spacing: 5px;
}

.compact {
    letter-spacing: -1px;
}
```

**Text alignment:**
```css
.links {
    text-align: left;
}

.centraal {
    text-align: center;
}

.rechts {
    text-align: right;
}

.uitgevuld {
    text-align: justify;
}
```

**Oefening (15 min):**
Maak een blog artikel layout:
- Kies een passend font voor de body tekst
- Kies een ander font voor headings
- Maak een duidelijke hiërarchie met font-sizes
- Zorg voor goede line-height voor leesbaarheid

### 4. Afbeeldingen Stylen (25 min)

**Basis image styling:**
```css
img {
    max-width: 100%;
    height: auto;
}
```

**Borders en afgeronde hoeken:**
```css
.foto {
    border: 3px solid #ddd;
    border-radius: 10px;
}

.rond {
    border-radius: 50%;
    width: 200px;
    height: 200px;
}
```

**Shadow effects:**
```css
.schaduw {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.grote-schaduw {
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
}
```

**Filters:**
```css
.zwart-wit {
    filter: grayscale(100%);
}

.wazig {
    filter: blur(5px);
}

.helderder {
    filter: brightness(120%);
}

.contrast {
    filter: contrast(150%);
}
```

**Hover effects op images:**
```css
.hover-foto {
    transition: transform 0.3s;
}

.hover-foto:hover {
    transform: scale(1.05);
}
```

**Image galleries:**
```css
.gallery {
    display: inline-block;
    margin: 10px;
}

.gallery img {
    width: 300px;
    height: 200px;
    object-fit: cover;
    border-radius: 8px;
}
```

**Oefening (15 min):**
Maak een foto galerij:
- Voeg minimaal 4 afbeeldingen toe
- Geef ze borders en border-radius
- Voeg box-shadow toe
- Maak een hover effect

### 5. Alles Combineren (10 min)

**Complete voorbeeld:**
```css
/* Kleurenschema */
:root {
    --primary-color: #3498db;
    --text-color: #2c3e50;
    --background: #f9f9f9;
    --border-color: #ddd;
}

body {
    background-color: var(--background);
    color: var(--text-color);
    font-family: 'Segoe UI', Arial, sans-serif;
    font-size: 16px;
    line-height: 1.6;
}

h1 {
    color: var(--primary-color);
    font-size: 36px;
    font-weight: 700;
    text-align: center;
}

.foto-card {
    background: white;
    border: 1px solid var(--border-color);
    border-radius: 10px;
    padding: 20px;
    margin: 20px;
}

.foto-card img {
    width: 100%;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.foto-card h3 {
    color: var(--primary-color);
    margin-top: 15px;
}
```

### 6. Afronding (5 min)
- Vragen?
- Volgende week: Projectweek!

## Huiswerk

**Opdracht: Maak een "Mijn Favoriete Dingen" pagina**

Vereisten:
1. **Kleurenschema:**
   - Kies 3 kleuren: achtergrond, tekst, accent
   - Gebruik deze consistent door je hele pagina

2. **Typografie:**
   - Gebruik minimaal 2 verschillende fonts
   - Maak een duidelijke hiërarchie (h1 grootste, p normaal)
   - Gebruik font-weight om belangrijke tekst te benadrukken

3. **Afbeeldingen:**
   - Voeg minimaal 5 afbeeldingen toe
   - Geef alle afbeeldingen borders en border-radius
   - Voeg box-shadow toe aan afbeeldingen
   - Maak minimaal 1 hover effect

4. **Content:**
   - Schrijf over je favoriete film, muziek, game, hobby, etc.
   - Gebruik headings, paragrafen en afbeeldingen

**Bonus uitdagingen:**
- Maak een ronde profielfoto van jezelf
- Gebruik filters op één van je afbeeldingen
- Experimenteer met letter-spacing voor een moderne look
- Maak een hover effect waarbij afbeeldingen groter worden

## Tips voor Docent
- Laat veel voorbeelden zien van goede kleurencombinaties
- Gebruik websites zoals coolors.co om kleurenschema's te tonen
- Benadruk dat contrast belangrijk is voor leesbaarheid
- Laat studenten elkaars werk bekijken voor inspiratie
- Leer studenten om "Developer Tools" te gebruiken om kleuren te pikken van websites

## Veelgemaakte Fouten
1. Te veel verschillende kleuren gebruiken (hou het bij 3-4)
2. Slecht contrast (lichte tekst op lichte achtergrond)
3. Te veel verschillende fonts (hou het bij 2-3)
4. Font-sizes te groot of te klein
5. Vergeten max-width: 100% op images

---
