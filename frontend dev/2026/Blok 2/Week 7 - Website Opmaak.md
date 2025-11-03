# Week 7: Website Opmaak

## Leerdoelen
Na deze les kan de student:
- Een complete website structureren met header, main, footer
- Verschillende secties stylen
- Hero sections maken
- Call-to-action buttons effectief plaatsen
- Een professioneel uitziende website bouwen

## Lesopbouw (90 minuten)

### 1. Terugblik (5 min)
- Hoe ging het met layouts?
- Laat 1-2 studenten hun layout zien

### 2. Website Structuur (15 min)

**Basis HTML structuur:**
```html
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <title>Mijn Website</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <!-- Logo en navigatie -->
    </header>

    <main>
        <section class="hero">
            <!-- Hero section -->
        </section>

        <section class="features">
            <!-- Features -->
        </section>

        <section class="about">
            <!-- Over ons -->
        </section>
    </main>

    <footer>
        <!-- Footer content -->
    </footer>
</body>
</html>
```

**Basis CSS reset:**
```css
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
    color: #333;
}
```

### 3. Header Styling (20 min)

**Simpele header:**
```css
header {
    background-color: #2c3e50;
    color: white;
    padding: 20px 0;
}

.header-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
}

.logo {
    font-size: 24px;
    font-weight: bold;
    text-decoration: none;
    color: white;
}

nav {
    margin-top: 15px;
}

nav a {
    color: white;
    text-decoration: none;
    margin-right: 20px;
    font-size: 16px;
}

nav a:hover {
    color: #3498db;
}
```

**Header met logo en nav naast elkaar:**
```css
.header-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
}

.logo {
    display: inline-block;
    font-size: 24px;
    font-weight: bold;
    color: white;
    text-decoration: none;
}

nav {
    display: inline-block;
    float: right;
    margin-top: 5px;
}

nav a {
    color: white;
    text-decoration: none;
    margin-left: 25px;
}
```

**Oefening (10 min):**
Maak een header met:
- Een logo (links)
- Navigatie links (rechts)
- Achtergrondkleur
- Hover effecten op de links

### 4. Hero Section (25 min)

**Basis hero:**
```css
.hero {
    background-color: #3498db;
    color: white;
    text-align: center;
    padding: 100px 20px;
}

.hero h1 {
    font-size: 48px;
    margin-bottom: 20px;
}

.hero p {
    font-size: 20px;
    margin-bottom: 30px;
}

.hero-button {
    display: inline-block;
    background-color: white;
    color: #3498db;
    padding: 15px 40px;
    text-decoration: none;
    border-radius: 5px;
    font-weight: bold;
    font-size: 18px;
}

.hero-button:hover {
    background-color: #f0f0f0;
}
```

**Hero met achtergrond afbeelding:**
```css
.hero {
    background-image: url('images/hero-bg.jpg');
    background-size: cover;
    background-position: center;
    color: white;
    text-align: center;
    padding: 150px 20px;
}

.hero-overlay {
    background-color: rgba(0, 0, 0, 0.5);
    padding: 60px 20px;
    border-radius: 10px;
}
```

**Oefening (15 min):**
Maak een hero section met:
- Grote heading (h1)
- Beschrijving tekst
- Call-to-action button
- Achtergrondkleur of afbeelding

### 5. Content Secties (25 min)

**Feature cards section:**
```css
.features {
    padding: 60px 20px;
    background-color: #f9f9f9;
}

.features-container {
    max-width: 1200px;
    margin: 0 auto;
    text-align: center;
}

.features h2 {
    font-size: 36px;
    margin-bottom: 50px;
    color: #2c3e50;
}

.feature-card {
    display: inline-block;
    width: 30%;
    margin: 1%;
    padding: 30px;
    background-color: white;
    border-radius: 8px;
    vertical-align: top;
}

.feature-card h3 {
    color: #3498db;
    margin-bottom: 15px;
}
```

**About section:**
```css
.about {
    padding: 60px 20px;
}

.about-container {
    max-width: 1200px;
    margin: 0 auto;
}

.about-content {
    display: inline-block;
    width: 58%;
    vertical-align: top;
    padding-right: 40px;
}

.about-image {
    display: inline-block;
    width: 38%;
    vertical-align: top;
}

.about-image img {
    width: 100%;
    border-radius: 8px;
}
```

**Call-to-action section:**
```css
.cta {
    background-color: #3498db;
    color: white;
    text-align: center;
    padding: 80px 20px;
}

.cta h2 {
    font-size: 36px;
    margin-bottom: 20px;
}

.cta p {
    font-size: 18px;
    margin-bottom: 30px;
}

.cta-button {
    display: inline-block;
    background-color: white;
    color: #3498db;
    padding: 15px 50px;
    text-decoration: none;
    border-radius: 5px;
    font-weight: bold;
    font-size: 18px;
}
```

**Oefening (15 min):**
Maak een features section met:
- Een heading
- 3 feature cards naast elkaar
- Icons of afbeeldingen
- Beschrijvende tekst

### 6. Footer Styling (15 min)

**Simpele footer:**
```css
footer {
    background-color: #2c3e50;
    color: white;
    text-align: center;
    padding: 40px 20px;
}

footer p {
    margin-bottom: 10px;
}

.social-links {
    margin-top: 20px;
}

.social-links a {
    color: white;
    text-decoration: none;
    margin: 0 10px;
    font-size: 18px;
}

.social-links a:hover {
    color: #3498db;
}
```

**Footer met kolommen:**
```css
footer {
    background-color: #2c3e50;
    color: white;
    padding: 60px 20px 20px;
}

.footer-container {
    max-width: 1200px;
    margin: 0 auto;
}

.footer-column {
    display: inline-block;
    width: 30%;
    margin: 1%;
    vertical-align: top;
}

.footer-column h4 {
    margin-bottom: 15px;
    color: #3498db;
}

.footer-column ul {
    list-style: none;
}

.footer-column ul li {
    margin-bottom: 8px;
}

.footer-column a {
    color: white;
    text-decoration: none;
}

.footer-bottom {
    text-align: center;
    margin-top: 40px;
    padding-top: 20px;
    border-top: 1px solid #34495e;
}
```

**Oefening (10 min):**
Maak een footer met:
- Achtergrondkleur
- Copyright tekst
- Sociale media links
- Goede padding

### 7. Complete Website Voorbeeld (10 min)

Demonstreer een complete website met:
- Header met navigatie
- Hero section
- Features section
- About section
- Footer

Laat zien hoe alle onderdelen samen komen.

### 8. Afronding (5 min)
- Vragen?
- Volgende week: Eindproject!

## Huiswerk

**Opdracht: Bouw een complete één-pagina website**

Kies één van deze onderwerpen:
- Jouw portfolio website
- Website voor een lokaal bedrijf (bakker, kapper, restaurant)
- Website over een hobby
- Landing page voor een fictief product

Vereisten:

1. **Header:**
   - Logo of naam
   - Navigatie menu
   - Sticky of vaste positie

2. **Hero Section:**
   - Grote heading
   - Call-to-action button
   - Achtergrond kleur of afbeelding

3. **Minimaal 2 Content Secties:**
   - Features/Diensten section
   - About section
   - Of: Portfolio section
   - Of: Contact section

4. **Footer:**
   - Copyright info
   - Links (social media, contact)
   - Goede styling

5. **Algemeen:**
   - Consistente kleuren en fonts
   - Goede spacing tussen secties
   - Alle secties gecentreerd met max-width
   - Professionele uitstraling

**Bonus uitdagingen:**
- Voeg een contact formulier toe
- Maak een image gallery
- Voeg smooth scroll toe (CSS: `scroll-behavior: smooth`)
- Maak hover effecten op alle interactieve elementen
- Voeg een achtergrond patroon toe aan een sectie

## Tips voor Docent
- Laat veel voorbeelden zien van professionele websites
- Bespreek waarom bepaalde secties belangrijk zijn
- Laat studenten websites inspecteren om te zien hoe ze gebouwd zijn
- Benadruk het belang van consistentie (kleuren, spacing, fonts)
- Loop rond en help studenten individueel

## Veelgemaakte Fouten
1. Geen max-width op containers (te breed op grote schermen)
2. Te weinig padding/margin tussen secties
3. Inconsistente kleuren en fonts
4. Te veel verschillende font-sizes
5. Vergeten hover states op links en buttons

---
