## Hoofdstuk 7: Semantische HTML & Code Structuur

### Leerdoelen
Na deze les kan de student:
- Uitleggen waarom semantische HTML belangrijk is
- Correct gebruik maken van `<header>`, `<main>`, `<footer>`, `<section>`, `<article>`
- Code netjes inspringen voor leesbaarheid
- Het belang van nette code uitleggen

### Lesopbouw (90 minuten)

**1. Wat is Semantische HTML? (15 min)**

**Probleem schetsen:**
- Tot nu toe gebruiken we veel `<div>` en `<p>`
- Maar wat betekent een `<div>`? Niets eigenlijk!
- Vergelijk:
```html
<!-- Niet-semantisch: -->
<div>
    <div>Mijn Website</div>
    <div>
        <div>Over Mij</div>
        <div>Ik ben een student...</div>
    </div>
</div>

<!-- Semantisch: -->
<header>
    <h1>Mijn Website</h1>
</header>
<main>
    <section>
        <h2>Over Mij</h2>
        <p>Ik ben een student...</p>
    </section>
</main>
```

**Waarom is dit belangrijk?**
1. **Toegankelijkheid** - Schermlezers (voor blinde mensen) begrijpen de structuur beter
2. **Zoekmachines** - Google begrijpt je pagina beter
3. **Andere ontwikkelaars** - Je collega's snappen sneller wat je code doet
4. **Jezelf over 6 maanden** - Je begrijpt je eigen code terug

**2. De Belangrijkste Semantische Elementen (30 min)**

**`<header>` - De kop**
```html
<header>
    <h1>Website Naam</h1>
    <nav>
        <a href="#home">Home</a>
        <a href="#about">Over</a>
    </nav>
</header>
```
- Gebruik voor: Logo, site titel, hoofdnavigatie
- Meestal bovenaan de pagina

**`<nav>` - Navigatie**
```html
<nav>
    <a href="#home">Home</a>
    <a href="#about">Over Mij</a>
    <a href="#contact">Contact</a>
</nav>
```
- Voor navigatiemenu's
- Kan in `<header>` of apart

**`<main>` - Hoofdinhoud**
```html
<main>
    <!-- Hier komt de belangrijkste content -->
</main>
```
- Slechts ÉÉN keer per pagina!
- Voor de hoofdinhoud van je pagina

**`<section>` - Logische sectie**
```html
<section>
    <h2>Over Mij</h2>
    <p>Informatie over mij...</p>
</section>
```
- Voor logische onderdelen van je pagina
- Meestal met een heading

**`<article>` - Zelfstandig stuk content**
```html
<article>
    <h2>Mijn Blog Post</h2>
    <p>Dit is een artikel dat ook op zichzelf kan staan...</p>
</article>
```
- Voor content die op zichzelf kan staan
- Bijvoorbeeld: blog posts, nieuwsartikelen, comments

**`<footer>` - De voet**
```html
<footer>
    <p>&copy; 2024 Mijn Naam. Alle rechten voorbehouden.</p>
    <p>Contact: email@voorbeeld.nl</p>
</footer>
```
- Gebruik voor: Copyright info, contact, links
- Meestal onderaan de pagina

**`<aside>` - Zijinhoud**
```html
<aside>
    <h3>Gerelateerde Links</h3>
    <ul>
        <li><a href="#">Link 1</a></li>
        <li><a href="#">Link 2</a></li>
    </ul>
</aside>
```
- Voor gerelateerde maar niet essentiële content
- Bijvoorbeeld: sidebar, extra info

**3. Pagina Structuur Voorbeeld (20 min)**

**Complete Semantische Pagina:**
```html
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <title>Mijn Portfolio</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <header>
        <h1>Jan de Vries</h1>
        <nav>
            <a href="#over">Over</a>
            <a href="#projecten">Projecten</a>
            <a href="#contact">Contact</a>
        </nav>
    </header>

    <main>
        <section id="over">
            <h2>Over Mij</h2>
            <p>Ik ben een student Applicatie Ontwikkeling...</p>
        </section>

        <section id="projecten">
            <h2>Mijn Projecten</h2>

            <article class="project">
                <h3>Project 1: Website voor Bakkerij</h3>
                <p>Ik heb een website gemaakt voor een lokale bakkerij...</p>
            </article>

            <article class="project">
                <h3>Project 2: Portfolio Website</h3>
                <p>Mijn eigen portfolio website gebouwd met HTML en CSS...</p>
            </article>
        </section>

        <section id="contact">
            <h2>Contact</h2>
            <p>Email: jan@voorbeeld.nl</p>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 Jan de Vries. Alle rechten voorbehouden.</p>
    </footer>

</body>
</html>
```

**Samen doen:**
- Bespreek elk onderdeel
- Waarom gebruiken we `<section>` hier?
- Waarom `<article>` voor projecten?
- Wat is het verschil met alleen `<div>` gebruiken?

**4. Code Inspringen & Nette Code (15 min)**

**Waarom netjes inspringen?**

**Slecht voorbeeld:**
```html
<header>
<h1>Titel</h1>
<nav>
<a href="#">Home</a>
<a href="#">Over</a>
</nav>
</header>
```

**Goed voorbeeld:**
```html
<header>
    <h1>Titel</h1>
    <nav>
        <a href="#">Home</a>
        <a href="#">Over</a>
    </nav>
</header>
```

**Regels voor nette code:**
1. **Inspringen:** Elke keer dat je een element opent, spring je in (meestal 4 spaties of 1 tab)
2. **Sluit tags:** Sluit altijd je tags weer
3. **Comments:** Gebruik comments bij ingewikkelde stukken
   ```html
   <!-- Dit is de hoofdnavigatie -->
   <nav>
       <a href="#">Home</a>
   </nav>
   ```
4. **Lege regels:** Gebruik lege regels tussen grote secties
5. **Consistentie:** Doe het overal hetzelfde

**Oefening (10 min):**
Geef studenten deze rommelige code om te fixen:
```html
<header>
<h1>Website</h1>
<nav><a href="#">Home</a>
<a href="#">Over</a></nav></header>
<main><section><h2>Sectie</h2><p>Tekst</p>
</section></main>
```

Laat ze het netjes inspringen.

**5. Praktische Oefening (20 min)**

**Opdracht:**
Herschrijf je hobby-pagina met semantische HTML:

1. Voeg een `<header>` toe met:
   - Een hoofdtitel (`<h1>`)
   - Een navigatiemenu (`<nav>`) met minimaal 3 links

2. Zet alle content in een `<main>` element

3. Maak minimaal 2 `<section>` elementen:
   - Eén over jezelf
   - Eén over je hobby

4. Voeg een `<footer>` toe met:
   - Copyright informatie
   - Je (nep) email adres

5. Zorg dat alle code netjes is ingesprongen

**6. DevTools: HTML Structuur Bekijken (10 min)**

**Demonstratie:**
1. Open DevTools (F12)
2. Ga naar het "Elements" tabblad
3. Laat zien hoe de HTML boomstructuur werkt
4. Laat zien hoe je elementen kunt inklappen/uitklappen
5. Inspecteer een professionele website en bekijk hun structuur

**Samen doen:**
- Open jullie eigen pagina in DevTools
- Bekijk de structuur
- Is alles netjes genest?

**7. Afronding (5 min)**
- Vragen?
- Samenvatting: Semantische HTML maakt je code begrijpelijk
- Volgende week: Projectweek 2!

### Huiswerk
1. **Herschrijf je hobby-pagina** met alle semantische elementen:
   - `<header>` met navigatie
   - `<main>` voor de hoofdinhoud
   - Minimaal 2 `<section>` elementen
   - `<footer>` met info

2. **Zorg voor nette code:**
   - Alles netjes ingesprongen
   - Gebruik comments bij ingewikkelde delen
   - Test in DevTools of de structuur klopt

3. **Extra uitdaging:**
   - Voeg een `<aside>` toe met gerelateerde links
   - Gebruik `<article>` als je meerdere items hebt (bijv. verschillende hobby's)

### Controlelijst voor docent
- [ ] Studenten begrijpen verschil tussen semantische en niet-semantische HTML
- [ ] Studenten kunnen `<header>`, `<main>`, `<footer>` correct toepassen
- [ ] Studenten kunnen code netjes inspringen
- [ ] Studenten kunnen DevTools gebruiken om HTML structuur te bekijken

---