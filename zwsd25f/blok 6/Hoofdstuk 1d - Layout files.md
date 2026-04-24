### Layout files

In hoofdstuk 1 heb je de basis van Laravel geleerd met een overzicht van categorieen. In 1b heb je dezelfde MVC-stappen herhaald voor producten. In 1c heb je detailpagina's toegevoegd.

In dit hoofdstuk maken we de views netter en slimmer met een gedeelde layout. Zo hoeven we header, footer en HTML-structuur niet steeds opnieuw te schrijven.

---

#### Wat ga je leren?

| Nieuw begrip | Wat betekent het? |
|---|---|
| Layout component | Een herbruikbare Blade-component voor gedeelde pagina-opmaak |
| Prop | Een expliciet ingestelde eigenschap, zoals een titel |
| Attribute bag | Alle overige HTML-attributen die je aan een component meegeeft |
| merge() | Methode om standaard attributen slim te combineren met meegegeven attributen |

> Patroon dat we volgen: component maken -> bestaande views omzetten -> props en attributes slim gebruiken.

---

#### Opdracht 21: Gedeelde layout aanmaken

We maken eerst een centrale layout met een header, navigatie, content-gebied en footer.

##### Stap 21.1: Layout component maken

1. Open de terminal.
2. Maak een component aan:
   ```bash
   php artisan make:component Layout
   ```
3. Open `resources/views/components/layout.blade.php`.
4. Vervang de inhoud met:
   ```html
   @props(['title' => 'Spelshop'])

   <!DOCTYPE html>
   <html lang="nl">
   <head>
       <meta charset="UTF-8">
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <title>{{ $title }}</title>
   </head>
   <body>
       <header>
           <h1>Spelshop</h1>
           <nav>
               <a href="/">Home</a>
               <a href="/categories">Categorieen</a>
               <a href="/products">Producten</a>
           </nav>
           <hr>
       </header>

       <main>
           {{ $slot }}
       </main>

       <hr>
       <footer>
           <p>&copy; {{ date('Y') }} Spelshop</p>
       </footer>
   </body>
   </html>
   ```
5. Sla op.

> Uitleg:
> - `@props(['title' => 'Spelshop'])` definieert een prop met standaardwaarde.
> - `{{ $slot }}` is de plek waar de pagina-inhoud van elke view wordt ingeladen.

---

#### Opdracht 22: Bestaande views laten erven van de layout

Nu zetten we bestaande views om, zodat ze dezelfde header en footer delen.

##### Stap 22.1: Categories index omzetten

1. Open `resources/views/categories/index.blade.php`.
2. Verwijder de volledige HTML shell (`<!DOCTYPE html>`, `<html>`, `<head>`, `<body>`).
3. Zet de inhoud in de layout component:
   ```html
   <x-layout title="Categorieen overzicht">
       <h1>Categorieen overzicht</h1>

       @if($categories->isEmpty())
           <p>Geen categorieen gevonden.</p>
       @else
           @foreach($categories as $category)
               <div>
                   <h2>
                       <a href="/categories/{{ $category->id }}">{{ $category->name }}</a>
                   </h2>
                   <p>{{ $category->description }}</p>
               </div>
           @endforeach
       @endif
   </x-layout>
   ```

##### Stap 22.2: Categories show omzetten

1. Open `resources/views/categories/show.blade.php`.
2. Gebruik:
   ```html
   <x-layout title="Categorie detail">
       <h1>{{ $category->name }}</h1>
       <p>{{ $category->description }}</p>

       <a href="/categories">Terug naar alle categorieen</a>
   </x-layout>
   ```

##### Stap 22.3: Products views omzetten

1. Open `resources/views/products/index.blade.php` en gebruik de layout met titel `Producten overzicht`.
2. Open `resources/views/products/show.blade.php` en gebruik de layout met titel `Product detail`.
3. Controleer of elke pagina nog werkt op:
   - `https://spelshop.test/categories`
   - `https://spelshop.test/categories/1`
   - `https://spelshop.test/products`
   - `https://spelshop.test/products/1`

---

#### Opdracht 23: Props vs attributes + merge

Nu maken we een tweede component om het verschil tussen props en attributes duidelijk te zien.

##### Stap 23.1: Panel component maken

1. Maak een nieuw bestand: `resources/views/components/panel.blade.php` (je kunt ook het commando `php artisan make:component Panel` in de terminal uitvoeren).
2. Voeg toe:
   ```html
   @props(['title' => 'Info'])

   <section {{ $attributes->merge(['class' => 'panel']) }}>
       <h2>{{ $title }}</h2>
       <div>
           {{ $slot }}
       </div>
   </section>
   ```

##### Stap 23.2: Gebruik panel in een view

1. Open bijvoorbeeld `resources/views/products/show.blade.php`.
2. Plaats in de layout:
   ```html
   <x-layout title="Product detail">
       <x-panel title="Productinformatie" class="product-panel" id="product-panel">
           <p><strong>Naam:</strong> {{ $product->name }}</p>
           <p><strong>Beschrijving:</strong> {{ $product->description }}</p>
           <p><strong>Categorie:</strong> {{ $product->category->name ?? 'Onbekend' }}</p>
       </x-panel>

       <a href="/products">Terug naar alle producten</a>
   </x-layout>
   ```

##### Stap 23.3: Wat gebeurt hier precies?

- Prop:
  - `title="Productinformatie"` wordt gelezen als prop omdat die in `@props([...])` staat.
- Attributes:
  - `class="product-panel"` en `id="product-panel"` zitten in de attribute bag (`$attributes`).
- Merge:
  - `$attributes->merge(['class' => 'panel'])` zorgt dat de standaard class `panel` gecombineerd wordt met de meegegeven classes.

Resultaat voor class:
- Standaard class in component: `panel`
- Meegegeven class in gebruik: `product-panel`
- Eindresultaat in HTML: `panel product-panel`

---

#### Opdracht 24: Test en controle

1. Controleer alle pagina's opnieuw in de browser.
2. Bekijk in de browser devtools of de classes correct gemerged zijn op het panel element.
3. Pas de prop `title` op een pagina aan en controleer of de `<title>` in de browser-tab verandert.
4. Test ook een pagina zonder expliciete `title` prop om de standaardwaarde `Spelshop` te zien. Dit kun je doen door het Layout-component in de home-view te gebruiken.

---

#### Opdracht 25: Commit

```bash
git add .
git commit -m "Add shared layout"
```

---

#### Terugblik: wat heb je geleerd?

| Concept | Uitleg |
|---|---|
| Layout component | Hergebruik van header, footer en pagina-opbouw in alle views |
| Title prop | Een configureerbare paginatitel per view |
| Slot | De variabele inhoud die in de layout wordt geplaatst |
| Props vs attributes | Props zijn expliciet gedefinieerd, attributes zijn alle overige HTML-attributen |
| merge() | Combineert standaard classes met classes die je per gebruik meegeeft |
