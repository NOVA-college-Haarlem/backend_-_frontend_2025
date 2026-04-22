### CRUD uitbreiden: Detailpagina's

Je hebt nu twee lijstpagina's: een voor categorieën en een voor producten. Maar als je op een categorie of product klikt, gebeurt er nog niets.

In dit hoofdstuk maken we **detailpagina's**. Een detailpagina toont alle informatie van **één enkel item**. Denk aan een webshop waarbij je op een product klikt en dan de volledige beschrijving ziet.

---

#### Wat ga je leren?

| Nieuw begrip | Wat betekent het? |
|---|---|
| **Route parameter** | Een variabel stukje in de URL, zoals `/products/3` — het getal 3 is de parameter |
| **`findOrFail($id)`** | Laravel zoekt een item op ID. Als het niet bestaat, toont het automatisch een 404-foutpagina |
| **`show()` methode** | De controller-methode die één enkel item teruggeeft (in plaats van een hele lijst) |

> 💡 **Patroon dat we volgen:** Elke nieuwe pagina in Laravel maak je altijd in dezelfde volgorde: **Route → Controller → View**. Dit is hetzelfde patroon als in hoofdstuk 1 en 1b.

---

#### Opdracht 19: Detailpagina voor categorieën

We bouwen de detailpagina stap voor stap op. Na elke stap lees je wat het resultaat zou moeten zijn.

---

##### Stap 19.1: Bekijk de huidige situatie

1. Open je browser.
2. Ga naar `https://spelshop.test/categories`.
3. Je ziet een lijst van drie categorieën.

> 🤔 **Denkvraag:** Wat zou je verwachten te zien als je naar `https://spelshop.test/categories/1` gaat?

Probeer het maar:

4. Ga naar `https://spelshop.test/categories/1`.

> ✅ **Verwacht resultaat:** Je krijgt een foutmelding. Dat klopt! Er is nog geen route voor dit adres.

---

##### Stap 19.2: Begrijp wat een route parameter is

Op dit moment bestaat er alleen deze route:
```
/categories → toont ALLE categorieën
```

We willen ook:
```
/categories/1 → toont alleen categorie met ID 1
/categories/2 → toont alleen categorie met ID 2
/categories/3 → toont alleen categorie met ID 3
```

Het getal in de URL noemen we een **route parameter**. In Laravel schrijf je dat als `{id}` in de route.

> 💡 **Vergelijking:** Stel je voor dat elke categorie een kluisje is op school. `/categories` is de gang met alle kluisjes bekijken. `/categories/7` is kluisje 7 openen en de inhoud bekijken.

---

##### Stap 19.3: Voeg de route toe

1. Open `routes/web.php`.
2. Zoek de bestaande route voor categorieën:
   ```php
   Route::get('/categories', [CategoryController::class, 'index']);
   ```
3. Voeg **direct daaronder** deze regel toe:
   ```php
   Route::get('/categories/{id}', [CategoryController::class, 'show']);
   ```
4. Sla het bestand op.

> ✅ **Wat heb je gedaan?** Je hebt Laravel verteld: "Als iemand `/categories/` plus een getal bezoekt, roep dan de methode `show` aan in `CategoryController`."

---

##### Stap 19.4: Test de route (verwachte fout)

1. Ga in de browser naar `https://spelshop.test/categories/1`.

> ✅ **Verwacht resultaat:** Je krijgt een nieuwe foutmelding. Lees wat er staat.

> 🤔 **Denkvraag:** Wat zegt de fout? Waarom denk je dat deze fout optreedt?

De fout zegt waarschijnlijk dat de methode `show` niet bestaat. Dat klopt — we hebben de route aangemaakt, maar de controller-methode nog niet.

---

##### Stap 19.5: Open de controller

1. Open `app/Http/Controllers/CategoryController.php`.
2. Zoek de `index` methode:
   ```php
   public function index()
   {
       $categories = Category::all();
       return view('categories.index', compact('categories'));
   }
   ```

> 🤔 **Denkvraag:** Wat doet `Category::all()`? En wat gaat `findOrFail($id)` straks anders doen?

`Category::all()` haalt **alle** categorieën op. `findOrFail($id)` haalt **één** categorie op — namelijk die met het opgegeven ID.

---

##### Stap 19.6: Voeg de `show` methode toe

1. Voeg **na** de `index` methode de volgende code toe (binnen de class):
   ```php
   public function show($id)
   {
       $category = Category::findOrFail($id);
       return view('categories.show', compact('category'));
   }
   ```
2. Sla het bestand op.

> 💡 **Uitleg regel voor regel:**
> - `public function show($id)` — de methode ontvangt het getal uit de URL
> - `Category::findOrFail($id)` — zoek de categorie met dit ID op; als die niet bestaat, geef automatisch een 404-fout
> - `return view('categories.show', compact('category'))` — stuur de gevonden categorie door naar de view

---

##### Stap 19.7: Test de controller (verwachte fout)

1. Ga in de browser naar `https://spelshop.test/categories/1`.

> ✅ **Verwacht resultaat:** Je krijgt een nieuwe foutmelding. Lees wat er staat.

> 🤔 **Denkvraag:** Wat ontbreekt er nu nog?

De fout zegt nu dat de view `categories.show` niet bestaat. Dat klopt — we gaan die nu aanmaken.

---

##### Stap 19.8: Maak de view aan

1. Open je terminal.
2. Voer het volgende commando uit:
   ```bash
   php artisan make:view categories.show
   ```
3. Open het nieuwe bestand `resources/views/categories/show.blade.php`.
4. Vervang de volledige inhoud met:
   ```html
   <!DOCTYPE html>
   <html lang="nl">
   <head>
       <meta charset="UTF-8">
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <title>{{ $category->name }}</title>
   </head>
   <body>
       <h1>{{ $category->name }}</h1>
       <p>{{ $category->description }}</p>

       <a href="/categories">← Terug naar alle categorieën</a>
   </body>
   </html>
   ```
5. Sla het bestand op.

> 💡 **Uitleg van de code:**
> - `{{ $category->name }}` — toont de naam van de categorie
> - `{{ $category->description }}` — toont de beschrijving
> - De `<a href="/categories">← Terug</a>` — een link terug naar de lijstpagina

---

##### Stap 19.9: Test de detailpagina

1. Ga naar `https://spelshop.test/categories/1`.

> ✅ **Verwacht resultaat:** Je ziet de naam en beschrijving van "Bordspellen".

2. Ga naar `https://spelshop.test/categories/2`.

> ✅ **Verwacht resultaat:** Je ziet de naam en beschrijving van "Kaartspellen".

3. Ga naar `https://spelshop.test/categories/99`.

> ✅ **Verwacht resultaat:** Je ziet een 404-foutpagina. Dit is het werk van `findOrFail()`.

---

##### Stap 19.10: Voeg links toe aan de lijstpagina

Nu hebben we een detailpagina, maar er is geen manier om ernaar te navigeren vanuit de lijst. We gaan klikbare links toevoegen.

1. Open `resources/views/categories/index.blade.php`.
2. Zoek deze regel:
   ```html
   <h2>{{ $category->name }}</h2>
   ```
3. Vervang die ene regel door:
   ```html
   <h2>
       <a href="/categories/{{ $category->id }}">{{ $category->name }}</a>
   </h2>
   ```
4. Sla het bestand op.

> 💡 **Uitleg:** `{{ $category->id }}` plaatst het ID van elke categorie in de URL. Zo krijgt elke categorie een eigen klikbare link.

---

##### Stap 19.11: Test de volledige flow

1. Ga naar `https://spelshop.test/categories`.
2. Klik op een categorie.

> ✅ **Verwacht resultaat:** Je gaat naar de detailpagina van die categorie.

3. Klik op "← Terug naar alle categorieën".

> ✅ **Verwacht resultaat:** Je bent weer op de lijstpagina.

---

##### Stap 19.12: Commit je werk

```bash
git add .
git commit -m "Detailpagina categorieën toegevoegd"
```

---

#### Opdracht 20: Zelf doen — Detailpagina voor producten

Je hebt net stap voor stap een detailpagina voor categorieën gemaakt. Nu ga je **hetzelfde doen voor producten**. Je krijgt een stappenplan, maar de code schrijf je zelf.

> 💡 **Tip:** Houd `CategoryController.php` open als voorbeeld terwijl je werkt. De structuur is precies hetzelfde.

---

##### Stap A: Route

1. Open `routes/web.php`.
2. Voeg een nieuwe route toe voor `/products/{id}`.
3. Laat deze route verwijzen naar de `show` methode van `ProductController`.

> ✅ **Check:** Lijkt jouw route op die van categorieën, maar dan met `products` en `ProductController`?

4. Test in de browser: `https://spelshop.test/products/1`
   Verwacht: foutmelding dat `show` niet bestaat.

---

##### Stap B: Controller methode

1. Open `app/Http/Controllers/ProductController.php`.
2. Voeg een `show($id)` methode toe.
3. Gebruik `Product::findOrFail($id)` om het product op te halen.
4. Geef het product door aan de view `products.show`.

> ✅ **Check:** Test `https://spelshop.test/products/1` opnieuw.
> Verwacht: foutmelding dat de **view** `products.show` niet bestaat (de controller werkt nu!).

---

##### Stap C: View

1. Maak de view aan via de terminal:
   ```bash
   php artisan make:view products.show
   ```
2. Open `resources/views/products/show.blade.php`.
3. Zorg dat de view het volgende toont:
   - De naam van het product
   - De beschrijving van het product
   - De categorie waar het product bij hoort (gebruik `$product->category->name`)
   - Een "← Terug naar alle producten" link

> 💡 **Hint voor de categorie:** In hoofdstuk 1b heb je al `$product->category->name` gebruikt in de index-view. Gebruik dezelfde aanpak hier.

> ✅ **Check:** Test `https://spelshop.test/products/1`. Je ziet de productdetails.

---

##### Stap D: Links in de lijstpagina

1. Open `resources/views/products/index.blade.php`.
2. Maak de productnaam een klikbare link naar de detailpagina van dat product.

> ✅ **Check:** Ga naar de productlijst. Klik op een product. Je gaat naar de detailpagina.

---

##### Stap E: Volledig testen

Doorloop de volgende controles:

| Wat te testen | Verwacht resultaat |
|---|---|
| `https://spelshop.test/products` | Productlijst met klikbare namen |
| Klik op een product | Detailpagina van dat product |
| Detailpagina toont categorie | Naam van de categorie is zichtbaar |
| Klik op "← Terug" | Je bent terug op de productlijst |
| `https://spelshop.test/products/999` | 404-foutpagina |

---

##### Stap F: Commit

```bash
git add .
git commit -m "Detailpagina producten toegevoegd"
```

---

#### Terugblik: wat heb je geleerd?

| Concept | Uitleg |
|---|---|
| Route parameter `{id}` | Een variabel deel van de URL dat je doorgeeft aan de controller |
| `findOrFail($id)` | Zoekt één item op ID — geeft automatisch 404 als het niet bestaat |
| `show()` methode | De controller-methode voor één enkel item |
| Dynamische link in view | Met `{{ $item->id }}` in de href maak je per item een eigen link |

> 🤔 **Reflectievraag:** In welke vaste volgorde maak je een nieuwe pagina in Laravel?

**Route → Controller → View**

Dit patroon gebruik je in elk volgend hoofdstuk opnieuw.
