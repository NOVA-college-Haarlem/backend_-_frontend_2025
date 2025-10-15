# Frontend Ontwikkeling - Blok 2

## Week 3: Cards Bouwen (Basis)

### Algemene Informatie
- **Doelgroep:** MBO studenten
- **Lesduur:** 90 minuten
- **Voorkennis:** Box model, selectoren, buttons
- **Tools:** VS Code, Browser

---

### Leerdoelen
Na deze les kan de student:
- De anatomie van een card begrijpen (image, titel, tekst, button)
- Cards maken met border en border-radius
- Box-shadow toepassen voor depth/diepte
- Padding en margin correct gebruiken binnen cards
- Hover effecten toevoegen aan cards
- Cards naast elkaar plaatsen (basis, zonder Flexbox)
- Verschillende card varianten maken (profile, product, info)

---

### Lesopbouw (90 minuten)

**1. Introductie: Wat zijn Cards? (10 min)**

**Vraag aan de klas:**
"Waar zie je cards op websites?"
- Product cards op webshops (bijv. bol.com)
- Social media posts (Twitter, Instagram)
- Nieuws artikelen (Nu.nl)
- Team members op bedrijfswebsites
- Prijzen/pricing cards

**Toon voorbeelden van echte websites!**

**Anatomie van een Card:**
```
┌─────────────────────┐
│     [Afbeelding]    │
├─────────────────────┤
│ Titel               │
│ Korte beschrijving  │
│ die meer info geeft │
│                     │
│     [Button]        │
└─────────────────────┘
```

Een card is een **container** voor gerelateerde content.

---

**2. Basis Card Structuur (15 min)**

**HTML Structuur:**
```html
<div class="card">
    <img src="product.jpg" alt="Product" class="card-image">
    <div class="card-body">
        <h3 class="card-title">Product Naam</h3>
        <p class="card-text">Dit is een korte beschrijving van het product.</p>
        <button class="btn btn-primary">Meer Info</button>
    </div>
</div>
```

**Uitleg structuur:**
- `.card` = de container (de doos)
- `.card-image` = afbeelding bovenaan
- `.card-body` = content area (titel, tekst, button)
- `.card-title` = heading
- `.card-text` = beschrijving
- `.btn` = button (van vorige week!)

**Basis CSS:**
```css
.card {
    width: 300px;
    border: 1px solid #ddd;
    border-radius: 8px;
    overflow: hidden;  /* Afbeelding knipt af bij border-radius */
}

.card-image {
    width: 100%;
    height: 200px;
    object-fit: cover;  /* Afbeelding vult de ruimte */
    display: block;     /* Verwijdert witte ruimte onder image */
}

.card-body {
    padding: 20px;
}

.card-title {
    margin: 0 0 10px 0;
    font-size: 20px;
    color: #333;
}

.card-text {
    margin: 0 0 15px 0;
    color: #666;
    line-height: 1.5;
}
```

**Samen doen: Bouw deze basis card!**

---

**3. Border-Radius voor Mooie Hoeken (10 min)**

**Wat doet border-radius?**
Maakt hoeken rond in plaats van vierkant.

```css
/* Alle hoeken dezelfde radius */
.card {
    border-radius: 8px;
}

/* Verschillende per hoek */
.card {
    border-radius: 10px 10px 0 0;
    /* top-left, top-right, bottom-right, bottom-left */
}

/* Heel rond maken */
.card {
    border-radius: 20px;
}

/* Cirkel (voor vierkante elementen) */
.profile-pic {
    border-radius: 50%;
}
```

**Praktisch:**
```css
.card {
    border-radius: 8px;
    overflow: hidden;  /* Belangrijk! Anders steekt image uit */
}
```

**Oefening 1 (5 min):**
Experimenteer met verschillende border-radius waardes:
- 0px (helemaal vierkant)
- 5px (subtiel)
- 15px (duidelijk rond)
- 50px (heel rond)

Welke vind je het mooist?

---

**4. Box-Shadow voor Diepte (15 min)**

**Waarom shadow?**
Geeft de illusie dat de card "boven" de pagina zweeft.

**Basis Syntax:**
```css
box-shadow: x-offset y-offset blur spread color;
```

**Voorbeelden:**
```css
/* Subtiele shadow */
.card {
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

/* Medium shadow */
.card {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
}

/* Sterke shadow */
.card {
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

/* Shadow met spread */
.card {
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1),
                0 2px 4px -1px rgba(0, 0, 0, 0.06);
}
```

**Uitleg parameters:**
- `0` = horizontale offset (geen verschuiving links/rechts)
- `4px` = verticale offset (shadow 4px naar beneden)
- `8px` = blur radius (hoe wazig)
- `rgba(0,0,0,0.15)` = kleur (zwart, 15% opacity)

**rgba() Uitleg:**
```css
rgba(red, green, blue, alpha)
rgba(0, 0, 0, 0.1)      /* Zwart, 10% opacity */
rgba(255, 0, 0, 0.5)    /* Rood, 50% opacity */
```

**Oefening 2 (5 min):**
Probeer deze shadows uit:
```css
.card-1 { box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
.card-2 { box-shadow: 0 4px 8px rgba(0,0,0,0.2); }
.card-3 { box-shadow: 0 10px 20px rgba(0,0,0,0.3); }
```

Welke is te veel? Welke is te weinig?

---

**5. Hover Effecten voor Cards (15 min)**

**Waarom hover effecten?**
Geeft feedback aan de gebruiker: "Dit is klikbaar!"

**Effect 1: Shadow wordt groter**
```css
.card {
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    transition: box-shadow 0.3s ease;
}

.card:hover {
    box-shadow: 0 8px 16px rgba(0,0,0,0.2);
}
```

**Effect 2: Card gaat omhoog**
```css
.card {
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    transition: all 0.3s ease;
}

.card:hover {
    box-shadow: 0 8px 16px rgba(0,0,0,0.2);
    transform: translateY(-5px);  /* 5px omhoog */
}
```

**Effect 3: Afbeelding wordt groter (zoom)**
```css
.card-image {
    transition: transform 0.3s ease;
}

.card:hover .card-image {
    transform: scale(1.1);  /* 110% grootte */
}

.card {
    overflow: hidden;  /* Belangrijk! Image blijft binnen card */
}
```

**Effect 4: Border kleur verandert**
```css
.card {
    border: 2px solid #ddd;
    transition: border-color 0.3s ease;
}

.card:hover {
    border-color: #007bff;
}
```

**Combinatie van effecten:**
```css
.card {
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    transition: all 0.3s ease;
    overflow: hidden;
}

.card:hover {
    box-shadow: 0 8px 16px rgba(0,0,0,0.2);
    transform: translateY(-5px);
}

.card-image {
    transition: transform 0.3s ease;
}

.card:hover .card-image {
    transform: scale(1.05);
}
```

**Oefening 3 (10 min):**
Maak 3 cards met verschillende hover effecten:
1. Alleen shadow groter
2. Shadow + omhoog gaan
3. Shadow + omhoog + afbeelding zoom

---

**6. Cards Naast Elkaar (10 min)**

**Zonder Flexbox (komen later):**

**Methode 1: inline-block**
```css
.card {
    width: 300px;
    display: inline-block;
    vertical-align: top;  /* Uitlijnen bovenaan */
    margin: 10px;
}
```

**Methode 2: float (ouderwets, maar werkt)**
```css
.card {
    width: 300px;
    float: left;
    margin: 10px;
}

/* Clearfix voor container */
.card-container::after {
    content: "";
    display: table;
    clear: both;
}
```

**HTML:**
```html
<div class="card-container">
    <div class="card">...</div>
    <div class="card">...</div>
    <div class="card">...</div>
</div>
```

**Tip:** Later (Blok 3) leer je Flexbox en Grid - makkelijkere manieren!

---

**7. Varianten van Cards (15 min)**

**Profile Card:**
```html
<div class="card profile-card">
    <img src="person.jpg" alt="John Doe" class="profile-image">
    <div class="card-body">
        <h3>John Doe</h3>
        <p class="role">Web Developer</p>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
        <button class="btn btn-primary">Contact</button>
    </div>
</div>
```

```css
.profile-card {
    text-align: center;
}

.profile-image {
    width: 120px;
    height: 120px;
    border-radius: 50%;  /* Cirkel */
    margin: 20px auto 0;
    display: block;
}

.role {
    color: #888;
    font-size: 14px;
    margin: 5px 0 15px;
}
```

**Info Card (zonder afbeelding):**
```html
<div class="card info-card">
    <div class="card-body">
        <div class="icon">📧</div>
        <h3>Email Support</h3>
        <p>Wij reageren binnen 24 uur op al je vragen.</p>
    </div>
</div>
```

```css
.info-card {
    text-align: center;
}

.icon {
    font-size: 48px;
    margin-bottom: 15px;
}
```

**Price Card:**
```html
<div class="card price-card">
    <div class="card-body">
        <h3>Basic Plan</h3>
        <div class="price">€9,99<span>/maand</span></div>
        <ul class="features">
            <li>10 GB Storage</li>
            <li>Email Support</li>
            <li>1 Website</li>
        </ul>
        <button class="btn btn-primary">Kies Plan</button>
    </div>
</div>
```

```css
.price {
    font-size: 36px;
    font-weight: bold;
    color: #007bff;
    margin: 20px 0;
}

.price span {
    font-size: 16px;
    color: #666;
}

.features {
    list-style: none;
    padding: 0;
    margin: 20px 0;
    text-align: left;
}

.features li {
    padding: 10px 0;
    border-bottom: 1px solid #eee;
}
```

---

### Grote Oefening (laatste tijd in les)

**Opdracht:**
Maak 3 verschillende cards:
1. **Product Card** - met afbeelding, titel, prijs, "In Winkelwagen" button
2. **Team Member Card** - ronde profielfoto, naam, functie, social media links
3. **Service Card** - icoon/emoji, titel, beschrijving

**Alle cards moeten:**
- Border-radius hebben
- Box-shadow hebben
- Hover effect hebben
- Netjes georganiseerde CSS gebruiken

---

### Huiswerk

**Hoofdopdracht: 6 Card Variaties**

Maak een HTML pagina met 6 verschillende cards:

1. **Product Card** - Laptop of telefoon
   - Afbeelding
   - Productnaam
   - Prijs
   - "Koop Nu" button

2. **Blog Post Card**
   - Featured image
   - Titel van artikel
   - Datum
   - Korte intro (2-3 zinnen)
   - "Lees Meer" button

3. **Profile/Team Card**
   - Ronde profielfoto
   - Naam
   - Functie
   - Quote of bio
   - Social media iconen (emoji's)

4. **Stat/Info Card** (zonder afbeelding)
   - Groot icoon (emoji)
   - Cijfer of statistiek
   - Label

5. **Testimonial/Review Card**
   - Quote
   - Naam van reviewer
   - Sterren rating (gebruik ⭐ emoji)
   - Kleine profielfoto

6. **Event Card**
   - Datum (groot, opvallend)
   - Event naam
   - Locatie
   - Tijd
   - "Meld Je Aan" button

**Technische eisen:**
- Alle cards 300px breed
- Border-radius: 8-10px
- Box-shadow op alle cards
- Hover effect (shadow groter OF omhoog gaan)
- Gebruik buttons van vorige week
- Nette CSS met comments
- Cards naast elkaar (3 per rij)

**Opdracht 2: Card Hover Experimenten**

Maak 1 card met 5 verschillende hover varianten:
1. Alleen shadow groter
2. Shadow groter + border kleur verandert
3. Omhoog gaan + shadow
4. Afbeelding inzoomen
5. Achtergrondkleur verandert

**Opdracht 3: Mini Project**

Begin alvast met je eindproject (Week 8)!
Maak 3 cards voor projecten die je wilt laten zien in je portfolio:
- Projectnaam
- Screenshot/afbeelding
- Korte beschrijving
- "Bekijk Project" button

---

### Controlelijst voor Docent
- [ ] Studenten begrijpen card structuur (image, body, title, text, button)
- [ ] Studenten kunnen border en border-radius toepassen
- [ ] Studenten kunnen box-shadow gebruiken
- [ ] Studenten kunnen hover effecten maken
- [ ] Studenten begrijpen overflow: hidden
- [ ] Studenten kunnen cards naast elkaar plaatsen
- [ ] Studenten kunnen verschillende card types maken

### Tips voor Docent
- **Toon echte voorbeelden:** Laat cards zien op bekende websites
- **Live coding:** Bouw samen een card vanaf scratch
- **DevTools:** Laat zien hoe je shadows en border-radius live kunt aanpassen
- **Veelgemaakte fout:** `overflow: hidden` vergeten bij border-radius + image
- **Veelgemaakte fout:** Image heeft witte ruimte onder → `display: block` oplossing
- **Motivatie:** Cards zijn overal! Dit is super praktisch
- **Experimenteren aanmoedigen:** Laat studenten spelen met shadow waardes

### Extra Resources
- [Card Design Examples](https://dribbble.com/search/card-design)
- [Box-Shadow Generator](https://box-shadow.dev/)

---
