## Hoofdstuk 2: Afbeeldingen, Links & DevTools

### Leerdoelen
Na deze les kan de student:
- Afbeeldingen toevoegen aan een webpagina
- Links maken naar andere websites
- DevTools gebruiken om HTML te inspecteren
- De broncode van andere websites bekijken

### Lesopbouw (90 minuten)

**1. Terugblik & Huiswerk bespreken (10 min)**
- Vraag wie het gelukt is
- Bespreek veelgemaakte fouten (vergeten tags te sluiten, verkeerde nesting)

**2. Afbeeldingen Toevoegen (25 min)**
- **Uitleg:** Waarom afbeeldingen?
  - Maakt pagina interessanter
  - Vertelt meer over je verhaal

- **Het `<img>` element:**
  ```html
  <img src="images/foto.jpg" alt="Een foto van mij">
  ```

- **Attributen uitleggen:**
  - `src` - Source, waar staat de afbeelding?
  - `alt` - Alternatieve tekst (toegankelijkheid, als afbeelding niet laadt)

- **Samen doen:**
  1. Download een afbeelding (of laat studenten eigen foto gebruiken)
  2. Zet afbeelding in de map "images"
  3. Voeg `<img>` tag toe in HTML
  4. Bekijk resultaat in browser

- **Veelgemaakte fouten bespreken:**
  - Verkeerde pad (images/foto.jpg vs foto.jpg)
  - Vergeten alt-attribuut

**3. Links Maken (20 min)**
- **Uitleg:** Het 'HyperText' deel van HTML
  - Links verbinden pagina's
  - Navigatie door het internet

- **Het `<a>` element:**
  ```html
  <a href="https://www.youtube.com">Mijn favoriete website</a>
  ```

- **Attributen:**
  - `href` - Hypertext Reference, waar gaat de link naartoe?
  - `target="_blank"` - Opent in nieuw tabblad (optioneel)

- **Oefening:** Studenten voegen links toe:
  ```html
  <h2>Mijn Favoriete Websites</h2>
  <p>Ik vind <a href="https://www.youtube.com">YouTube</a> een leuke website.</p>
  <p>Voor mijn studie gebruik ik vaak <a href="https://www.w3schools.com">W3Schools</a>.</p>
  ```

**4. DevTools Introductie (30 min)**
- **Wat zijn DevTools?**
  - Gereedschap voor ontwikkelaars
  - Ingebouwd in elke browser
  - Laat zien hoe websites gebouwd zijn

- **DevTools openen:**
  - F12 of Rechtsklik → Inspect/Inspecteren
  - Demonstreer in Chrome/Edge

- **Samen ontdekken:**
  1. Open een bekende website (bijv. YouTube, Nu.nl)
  2. Open DevTools
  3. Gebruik de selector (pijltje linksboven) om elementen te selecteren
  4. Laat zien hoe HTML eruitziet van echte websites

- **Eigen pagina inspecteren:**
  - Laat studenten hun eigen pagina openen
  - DevTools openen
  - Hun eigen HTML zien
  - Laat zien: als je iets verandert in DevTools, is het tijdelijk (verdwijnt bij refresh)

- **Oefening:** "Website Detective"
  - Ga naar een website naar keuze
  - Vind met DevTools:
    - Een `<h1>` element
    - Een `<img>` element
    - Een `<a>` element
  - Bekijk wat er in het `src` attribuut staat bij afbeeldingen

**5. Afronding (5 min)**
- Vragen beantwoorden
- Preview volgende week: we gaan onze pagina mooi maken met kleuren!

### Huiswerk
Voeg toe aan je pagina van vorige week:
- Minstens 2 afbeeldingen (in de juiste map!)
- Minstens 3 links naar websites die jou interesseren
- Gebruik DevTools om een website naar keuze te inspecteren en schrijf op:
  - Welke website je hebt bekeken
  - Hoeveel `<h1>` elementen de pagina heeft

---

