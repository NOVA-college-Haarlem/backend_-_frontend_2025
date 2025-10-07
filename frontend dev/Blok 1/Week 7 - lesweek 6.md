## Week 7: Semantische HTML & Code Structuur

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