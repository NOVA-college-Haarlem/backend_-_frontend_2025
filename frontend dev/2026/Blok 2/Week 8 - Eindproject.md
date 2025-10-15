# Frontend Ontwikkeling - Blok 2

## Week 8: Eindproject - "Mijn Verbeterde Portfolio"

### Projectomschrijving
Deze week bouwen studenten een verbeterde versie van hun Blok 1 portfolio, maar nu met alle nieuwe technieken die ze geleerd hebben: buttons, cards, navigatie, formulieren en layout skills.

---

### Leerdoelen
Na deze week kan de student:
- Zelfstandig een complete website bouwen met alle Blok 2 technieken
- Design keuzes maken en uitleggen
- Code organiseren in overzichtelijke bestanden
- Feedback geven en ontvangen op elkaars werk
- Een eigen portfolio presenteren

---

## Projecteisen

### Minimale Vereisten (Voldoende)

**Technisch:**
- [ ] Gestylede navigatie (horizontaal of verticaal)
- [ ] Minimaal 3 button variaties gebruikt
- [ ] Minimaal 3 gestylede cards (voor projecten/skills)
- [ ] Contact formulier met styled inputs
- [ ] Gecentreerde content container (max-width, margin: 0 auto)
- [ ] Box-shadows en border-radius waar passend
- [ ] Hover effecten op alle interactieve elementen
- [ ] Nette, georganiseerde CSS met comments
- [ ] Werkende links (binnen pagina met #anchors)

**Content:**
- [ ] Header met navigatie
- [ ] "Over Mij" sectie
- [ ] "Projecten" sectie met minimaal 3 project cards
- [ ] "Skills" of "Wat Ik Kan" sectie
- [ ] Contact formulier of contact sectie
- [ ] Footer met links/copyright

**Design:**
- [ ] Consistent kleurenschema (2-3 hoofdkleuren)
- [ ] Goede leesbaarheid (contrast, font-sizes)
- [ ] Passende spacing (niet te vol, niet te leeg)
- [ ] Professioneel uiterlijk

### Bonus Functies (Goed/Uitstekend)

**Extra Features:**
- [ ] Breadcrumb navigatie
- [ ] Meerdere button types (primary, secondary, outline)
- [ ] Cards met badges ("Nieuw!", "Featured")
- [ ] Horizontal cards (afbeelding naast tekst)
- [ ] Active states op navigatie
- [ ] 2-kolom layout (sidebar + content)
- [ ] Gallery sectie met inline-block
- [ ] Validation states op formulier (success/error styling)

**Extra Polish:**
- [ ] Smooth transitions op alle hover effecten
- [ ] Shadow effecten die verbeteren bij hover
- [ ] Overlay effecten op cards
- [ ] Custom styled select dropdowns
- [ ] Footer met meerdere link groepen
- [ ] Social media links met icons
- [ ] Responsive design (basis media queries)

---

## Weekplanning

### Dag 1 (90 min): Planning & Start

**1. Project Kickoff (15 min)**
- Toon voorbeelden van goede portfolio sites
- Bespreek wat een portfolio moet bevatten
- Leg eisen uit

**2. Design & Planning (25 min)**

**Wireframing:**
Studenten schetsen (op papier of digitaal):
- Welke secties komen er?
- Waar komt de navigatie?
- Hoe zien de cards eruit?
- Welke kleuren ga ik gebruiken?

**Checklist maken:**
- Welke technieken moet ik gebruiken?
- Welke content heb ik nodig?
- Welke afbeeldingen?

**3. Project Setup (15 min)**

**Bestandsstructuur:**
```
mijn-portfolio/
├── index.html
├── css/
│   └── style.css
├── images/
│   ├── profile.jpg
│   ├── project1.jpg
│   ├── project2.jpg
│   └── project3.jpg
└── README.md (optioneel)
```

**Basis HTML Template:**
```html
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portfolio - [Jouw Naam]</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <!-- Header + Nav -->
    <header>
        <nav>
            <!-- Navigatie -->
        </nav>
    </header>

    <!-- Over Mij -->
    <section id="about">
        <!-- Content -->
    </section>

    <!-- Projecten -->
    <section id="projects">
        <!-- Project cards -->
    </section>

    <!-- Skills -->
    <section id="skills">
        <!-- Skill cards -->
    </section>

    <!-- Contact -->
    <section id="contact">
        <!-- Contact form -->
    </section>

    <!-- Footer -->
    <footer>
        <!-- Footer content -->
    </footer>
</body>
</html>
```

**Basis CSS Template:**
```css
/* ==================== */
/* Reset & Base         */
/* ==================== */
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

/* ==================== */
/* Container            */
/* ==================== */
.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
}

/* ==================== */
/* Buttons              */
/* ==================== */
.btn {
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: all 0.3s;
}

/* Voeg je button styles toe */

/* ==================== */
/* Cards                */
/* ==================== */
.card {
    border: 1px solid #ddd;
    border-radius: 8px;
    overflow: hidden;
}

/* Voeg je card styles toe */

/* ==================== */
/* Navigation           */
/* ==================== */
/* Voeg je nav styles toe */

/* ==================== */
/* Forms                */
/* ==================== */
/* Voeg je form styles toe */

/* ==================== */
/* Sections             */
/* ==================== */
section {
    padding: 60px 0;
}

/* ==================== */
/* Footer               */
/* ==================== */
footer {
    background-color: #333;
    color: white;
    padding: 40px 0;
    text-align: center;
}
```

**4. Begin met Bouwen (35 min)**

Studenten beginnen met:
1. HTML structuur opzetten (alle secties)
2. Navigatie maken
3. Over Mij sectie
4. Begin met eerste project card

**Docent loopt rond en helpt waar nodig.**

---

### Dag 2 (90 min): Verder Bouwen

**1. Stand van Zaken (5 min)**
- Waar ben je?
- Wat lukt goed?
- Waar loop je tegenaan?

**2. Zelfstandig Werken (70 min)**

**Prioriteiten:**
1. Alle HTML secties af
2. Navigatie compleet + styled
3. Minimaal 3 project cards
4. Contact formulier
5. Footer

**Focus op:** Eerst werkend, dan mooi maken!

**Veel voorkomende problemen klassikaal bespreken**

**3. Tussenevaluatie (15 min)**

Quick check:
- Laat je voortgang zien aan docent
- Krijg feedback
- Plan voor volgende sessie

---

### Dag 3 (90 min): Afwerken & Presenteren

**1. Laatste Aanpassingen (30 min)**
- Fix bugs
- Voeg laatste polish toe
- Test hover effecten
- Check spacing en alignment
- Valideer HTML/CSS (optioneel)

**2. Peer Review (20 min)**

**In tweetallen:**
- Bekijk elkaars portfolio
- Geef feedback:
  - Wat vind je mooi?
  - Wat zou je anders doen?
  - Werkt alles?
  - Responsive?

**Feedback formulier:**
1. Eerste indruk (1-5 sterren)
2. Navigatie werkt goed? (ja/nee)
3. Cards zien er professioneel uit? (ja/nee)
4. Formulier is duidelijk? (ja/nee)
5. Hover effecten werken? (ja/nee)
6. Wat vind je het mooist?
7. Tip voor verbetering?

**3. Presentaties (40 min)**

**Elke student presenteert (3-4 min):**

**Format:**
1. **Demo** (1.5 min)
   - Open website in browser
   - Navigeer door secties
   - Laat hover effecten zien
   - Laat 1-2 favoriete onderdelen zien

2. **Code Highlight** (1 min)
   - Open CSS
   - Laat 1 interessant stuk zien
   - "Dit ben ik het meest trots op omdat..."

3. **Reflectie** (0.5 min)
   - Wat vond je moeilijk?
   - Wat ging goed?
   - Wat zou je volgende keer anders doen?

**Klasgenoten mogen vragen stellen!**

---

## Beoordelingscriteria

### Technische Kwaliteit (40%)

| Criterium | Onvoldoende (1-5) | Voldoende (6-7) | Goed (8-10) |
|-----------|-------------------|------------------|-------------|
| **Buttons** | Weinig/geen styled buttons | Meerdere button types, hover werkt | Veel variaties, smooth transitions, consistent |
| **Cards** | Geen/basis cards | 3+ cards met shadows/radius | Professionele cards, hover effecten, badges |
| **Navigatie** | Basis lijst | Styled nav, hover werkt | Mooie nav, active states, smooth effects |
| **Formulier** | Ongestyleerd | Styled inputs, focus states | Professioneel form, validation states |
| **Code Kwaliteit** | Rommelig, geen comments | Georganiseerd, basis comments | Zeer netjes, goede structuur, duidelijke comments |

### Functionaliteit (30%)

| Criterium | Onvoldoende | Voldoende | Goed |
|-----------|-------------|-----------|------|
| **Alle Secties** | Mist >2 secties | Alle vereiste secties | Alle secties + extra's |
| **Interactiviteit** | Weinig hover effects | Hover op links/buttons | Hover overal, smooth |
| **Navigatie Werkt** | Links werken niet | Links werken | Links + active states |

### Design & UX (20%)

| Criterium | Onvoldoende | Voldoende | Goed |
|-----------|-------------|-----------|------|
| **Kleurenschema** | Geen samenhang | Consistent, 2-3 kleuren | Mooi schema, goed contrast |
| **Spacing** | Te vol of te leeg | Goede spacing | Perfecte spacing, adem in design |
| **Leesbaarheid** | Slecht leesbaar | Goed leesbaar | Uitstekend leesbaar |

### Presentatie (10%)

| Criterium | Onvoldoende | Voldoende | Goed |
|-----------|-------------|-----------|------|
| **Demo** | Kan niet demo geven | Kan demo geven | Duidelijke, zelfverzekerde demo |
| **Reflectie** | Geen reflectie | Kan reflecteren | Goede reflectie met lessen geleerd |

---

## Inspiratie & Tips

### Content Ideeën

**Over Mij:**
- Foto van jezelf
- Korte intro (2-3 zinnen)
- Wat je studeert
- Wat je leuk vindt

**Projecten (als je nog geen echte hebt):**
- Je Blok 1 website
- Oefeningen uit dit blok
- Toekomstige project ideeën
- Placeholder projecten ("Coming Soon")

**Skills:**
- HTML
- CSS
- Buttons styling
- Card design
- Forms
- Navigation
- Layout

### Design Tips

**Kleurenschema kiezen:**
- [Coolors.co](https://coolors.co/) - Genereer kleuren
- [Adobe Color](https://color.adobe.com/)
- Kies 1 primaire kleur, 1-2 accent kleuren
- Gebruik grijs voor tekst (#333, #666)

**Fonts:**
- Arial (veilig, altijd goed)
- Of Google Fonts (later)
- Max 2 fonts gebruiken

**Spacing:**
- Gebruik veelvouden van 5 of 10
- Padding: 10px, 15px, 20px, 30px
- Margin: 20px, 40px, 60px
- Consistent houden!

---

## Veelgemaakte Fouten & Oplossingen

### Technische Fouten

**1. Navigatie links werken niet**
```html
<!-- FOUT -->
<a href="about">Over</a>

<!-- GOED -->
<a href="#about">Over</a>  <!-- Met # -->

<!-- En section moet id hebben -->
<section id="about">...</section>
```

**2. Cards staan niet naast elkaar**
```css
/* FOUT: cards zijn block */
.card {
    width: 300px;
}

/* GOED: gebruik inline-block */
.card {
    width: 300px;
    display: inline-block;
    vertical-align: top;
}
```

**3. Hover effecten werken niet**
```css
/* FOUT: geen transition */
.btn {
    background-color: blue;
}
.btn:hover {
    background-color: darkblue;
}

/* GOED: met transition */
.btn {
    background-color: blue;
    transition: background-color 0.3s;
}
.btn:hover {
    background-color: darkblue;
}
```

**4. Content niet gecentreerd**
```css
/* FOUT: geen width */
.container {
    margin: 0 auto;
}

/* GOED: met max-width */
.container {
    max-width: 1200px;
    margin: 0 auto;
}
```

---

## Extra Resources

**Inspiratie:**
- [Awwwards - Portfolio Sites](https://www.awwwards.com/websites/portfolio/)
- [Dribbble - Portfolio Designs](https://dribbble.com/search/portfolio)

**Tools:**
- [Coolors](https://coolors.co/) - Kleuren
- [Unsplash](https://unsplash.com/) - Gratis foto's
- [Box Shadow Generator](https://box-shadow.dev/)

**Leren:**
- [W3Schools HTML/CSS](https://www.w3schools.com/)
- [MDN Web Docs](https://developer.mozilla.org/)

---

## Tips voor Docent

### Voor het Project
- Zorg dat alle technieken goed beheerst zijn
- Laat goede voorbeelden zien (niet te ingewikkeld!)
- Benadruk: "Eerst werkend, dan mooi"

### Tijdens het Project
- Loop constant rond
- Spot veelgemaakte fouten vroeg
- Moedig experimenteren aan
- Vier kleine successen
- Help met prioriteren: "Wat is het belangrijkst?"

### Bij Problemen
- "Laat eens zien in DevTools"
- "Heb je clearfix toegevoegd?"
- "Staat je link in de HTML?"
- Debuggen leren is ook een skill!

### Presentaties
- Positieve sfeer
- Laat andere studenten ook complimenten geven
- Stel vragen: "Waarom heb je deze kleur gekozen?"
- Vier wat ze bereikt hebben!

### Na het Project
- Laat studenten portfolio online zetten (GitHub Pages) - optioneel
- Preview Blok 3: "Nu gaan we Flexbox en Grid leren!"

---

**Succes met je portfolio! 🎉**
