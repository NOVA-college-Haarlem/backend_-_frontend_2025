### Eloquent relaties in views

In de vorige hoofdstukken heb je categorieën en producten opgebouwd, detailpagina's gemaakt en je views netter gemaakt met een layout en componenten.

In dit hoofdstuk gaan we een stap verder: we koppelen modellen met Eloquent relaties en tonen die relationele data in je views. We werken hier met een 1-op-meer-relatie: een product hoort bij één categorie en een categorie kan meerdere producten hebben.

---

#### Wat ga je leren?

| Nieuw begrip | Wat betekent het? |
|---|---|
| `belongsTo()` | Een model hoort bij een ander model, bijvoorbeeld een product hoort bij een categorie |
| `hasMany()` | Een model heeft meerdere gekoppelde records, bijvoorbeeld een categorie heeft meerdere producten |
| Eloquent relatie | Een methode in een model die een relatie met een ander model beschrijft |
| Eager loading | Relaties vooraf laden om onnodige extra queries te voorkomen |
| Relationele data in views | Gegevens van gekoppelde modellen tonen in Blade |

> Patroon dat we volgen: relatie definiëren -> controller aanpassen -> data tonen in views -> slimmer laden met eager loading.

---

#### Opdracht 26: Relaties toevoegen aan de models

We beginnen met de relatie tussen categorieën en producten. Een product hoort bij één categorie. Een categorie kan meerdere producten hebben.

##### Stap 26.1: Product hoort bij een categorie

1. Open `app/Models/Product.php`.
2. Bekijk nog eens deze functie:
   ```php
   public function category()
   {
       return $this->belongsTo(Category::class);
   }
   ```

> Uitleg:
> - `belongsTo()` gebruik je wanneer dit model gekoppeld is aan één record van een ander model.
> - Een product heeft dus één categorie.

##### Stap 26.2: Een categorie heeft meerdere producten

1. Open `app/Models/Category.php`.
2. Voeg in de class de relatie toe:
   ```php
   public function products()
   {
       return $this->hasMany(Product::class);
   }
   ```

> Uitleg:
> - `hasMany()` gebruik je wanneer één record meerdere gekoppelde records kan hebben.
> - Een categorie kan dus meerdere producten bevatten.

---

#### Opdracht 27: Relaties testen met Tinker

Voordat we de views aanpassen, testen we eerst in Tinker of de relaties goed werken.

##### Stap 27.1: Start Tinker

1. Open de terminal.
2. Start Tinker:
    ```text
    php artisan tinker
    ```

##### Stap 27.2: Bekijk de categorie van een product

1. Typ:
    ```text
    $product = App\Models\Product::find(1)
    ```
    Tinker laat nu het gevonden product zien.
2. Typ daarna:
    ```text
    $product->category
    ```
    Tinker laat nu het gekoppelde category-object zien.
3. Typ daarna:
    ```text
    $product->category->name
    ```
    Tinker laat nu alleen de naam van de categorie zien.

##### Stap 27.3: Bekijk de producten van een categorie

1. Typ:
    ```text
    $category = App\Models\Category::find(1)
    ```
    Tinker laat nu de gevonden categorie zien.
2. Typ daarna:
    ```text
    $category->products
    ```
    Tinker laat nu alle producten uit deze categorie zien.
3. Typ daarna:
    ```text
    $category->products->count()
    ```
    Tinker laat nu zien hoeveel producten aan deze categorie gekoppeld zijn.

##### Stap 27.4: Reflectie

Beantwoord kort:

1. Welke relatie gebruik je in `Product`: `belongsTo()` of `hasMany()`?
2. Welke relatie gebruik je in `Category`: `belongsTo()` of `hasMany()`?
3. Waarom geeft `$category->products` meerdere resultaten terug en `$product->category` meestal maar één?

---

#### Opdracht 28: Relationele data tonen op de productpagina

Nu Laravel de relatie kent, kunnen we in de product-detailpagina ook gegevens van de categorie tonen.

##### Stap 28.1: Product controller uitbreiden

1. Open `app/Http/Controllers/ProductController.php`.
2. Zoek de `show`-methode.
3. Zorg dat het product inclusief categorie wordt opgehaald:
   ```php
   public function show(Product $product)
   {
       $product->load('category');

       return view('products.show', compact('product'));
   }
   ```

> Uitleg:
> - _Route model binding_ betekent dat Laravel automatisch het juiste model uit de URL haalt.
> - In `show(Product $product)` zorgt Laravel er dus voor dat `$product` al een volledig Product-object is.
> - Met `findOrFail($id)` bereik je hetzelfde eindresultaat, maar route model binding scheelt boilerplate-code en maakt je methode-signature duidelijker.
> - Gebruik je deze notatie, dan moet je routeparameternaam in `routes/web.php` ook matchen met het modelargument:
>   ```php
>   Route::get('/products/{product}', [ProductController::class, 'show']);
>   ```
>   Dus met `{product}` in plaats van `{id}`.
> - Werk je nog met een los id uit de URL, dan mag je ook de variant hieronder gebruiken.

Als je nog geen route model binding gebruikt, mag dit ook:
```php
public function show($id)
{
    $product = Product::with('category')->findOrFail($id);

    return view('products.show', compact('product'));
}
```

##### Stap 28.2: Categorienaam tonen in de view

1. Open `resources/views/products/show.blade.php`.
2. Voeg in je panel of onder de productinformatie toe:
   ```html
   <p><strong>Categorie:</strong> {{ $product->category->name ?? 'Onbekend' }}</p>
   ```

> Uitleg:
> - `$product->category` gebruikt de relatie uit het model.
> - Met `?? 'Onbekend'` voorkom je een fout als er geen categorie gekoppeld is.

---

#### Opdracht 29: Producten tonen bij een categorie

Nu doen we ook de omgekeerde richting: op de categorie-detailpagina tonen we alle producten uit die categorie.

##### Stap 29.1: Category controller aanpassen

1. Open `app/Http/Controllers/CategoryController.php`.
2. Zoek de `show`-methode.
3. Laad de gekoppelde producten mee:
   ```php
   public function show(Category $category)
   {
       $category->load('products');

       return view('categories.show', compact('category'));
   }
   ```

> Uitleg:
> - Gebruik je hier route model binding, dan moet de routeparameternaam in `routes/web.php` ook matchen met het modelargument:
>   ```php
>   Route::get('/categories/{category}', [CategoryController::class, 'show']);
>   ```
>   Dus met `{category}` in plaats van `{id}`.

Als je nog geen route model binding gebruikt, mag dit hier ook:
```php
public function show($id)
{
    $category = Category::with('products')->findOrFail($id);

    return view('categories.show', compact('category'));
}
```

##### Stap 29.2: Productlijst tonen in de categorie-view

1. Open `resources/views/categories/show.blade.php`.
2. Voeg onder de beschrijving toe:
   ```html
   <h2>Producten in deze categorie</h2>

   @if($category->products->isEmpty())
       <p>Er zijn nog geen producten in deze categorie.</p>
   @else
       <ul>
           @foreach($category->products as $product)
               <li>
                   <a href="/products/{{ $product->id }}">{{ $product->name }}</a>
               </li>
           @endforeach
       </ul>
   @endif
   ```

##### Stap 29.3: Wat gebeurt hier precies?

- `Category::with('products')` haalt de categorie op, samen met alle gekoppelde producten.
- `$category->products` geeft een collectie terug met alle producten in die categorie.
- In Blade kun je daar direct over loopen met `@foreach`.

---

#### Opdracht 30: Eager loading op de productoverzichtspagina

Wanneer je meerdere producten toont en per product ook de categorie laat zien, wil je die categorieën slim vooraf laden.

##### Stap 30.1: Product index aanpassen

1. Open `app/Http/Controllers/ProductController.php`.
2. Zoek de `index`-methode.
3. Zorg dat producten inclusief categorie worden opgehaald:
   ```php
   public function index()
   {
       $products = Product::with('category')->get();

       return view('products.index', compact('products'));
   }
   ```

##### Stap 30.2: Categorie tonen in het overzicht

1. Open `resources/views/products/index.blade.php`.
2. Voeg per product de categorienaam toe:
   ```html
   <p>Categorie: {{ $product->category->name ?? 'Onbekend' }}</p>
   ```

##### Stap 30.3: Waarom is dit beter?

Zonder eager loading zou Laravel eerst alle producten ophalen, en daarna voor ieder product apart de categorie kunnen opvragen. Dat betekent onnodig veel databasequeries.

Met:
```php
Product::with('category')->get()
```
laad je de categorieën in één keer mee. Dat is sneller en netter.

---

#### Opdracht 31: Extra oefening met gerelateerde producten

Als extra oefening kun je op de product-detailpagina ook andere producten uit dezelfde categorie tonen.

##### Stap 31.1: Controller uitbreiden

1. Open `app/Http/Controllers/ProductController.php`.
2. Pas de `show`-methode uit zodat ook andere producten uit dezelfde categorie beschikbaar zijn:
   ```php
   public function show(Product $product)
   {
       $product->load('category.products');

       return view('products.show', compact('product'));
   }
   ```

##### Stap 31.2: Gerelateerde producten tonen

1. Open `resources/views/products/show.blade.php`.
2. Voeg bijvoorbeeld onder je productinformatie toe:
   ```html
   <h2>Andere producten in deze categorie</h2>

   @php
       $relatedProducts = $product->category?->products->where('id', '!=', $product->id);
   @endphp

   @if($relatedProducts && $relatedProducts->isNotEmpty())
       <ul>
           @foreach($relatedProducts as $relatedProduct)
               <li>
                   <a href="/products/{{ $relatedProduct->id }}">{{ $relatedProduct->name }}</a>
               </li>
           @endforeach
       </ul>
   @else
       <p>Geen andere producten in deze categorie.</p>
   @endif
   ```

> Dit is een goede oefening om te zien dat relaties ook meerdere niveaus diep kunnen werken: product -> category -> products.

---

#### Opdracht 32: Test en controle

1. Controleer of de product-detailpagina de juiste categorienaam toont.
2. Controleer of de categorie-detailpagina een lijst met producten toont.
3. Controleer of de product-overzichtspagina per product de categorie laat zien.
4. Test een categorie zonder producten en controleer of de lege melding correct verschijnt.
5. Test een product zonder categorie en controleer of `Onbekend` wordt getoond.

Als alles goed werkt, controleer dan deze pagina's in de browser:
- `https://spelshop.test/categories`
- `https://spelshop.test/categories/1`
- `https://spelshop.test/products`
- `https://spelshop.test/products/1`

---

#### Opdracht 33: Commit

```bash
git add .
git commit -m "Hoofdstuk 1e: eloquent relaties in views"
```

---

#### Terugblik: wat heb je geleerd?

| Concept | Uitleg |
|---|---|
| `belongsTo()` | Gebruik je wanneer een model bij één ander model hoort |
| `hasMany()` | Gebruik je wanneer een model meerdere gekoppelde records heeft |
| Relaties in views | Je kunt via een model direct gekoppelde data tonen |
| Eager loading | Relaties vooraf laden met `with()` voorkomt extra queries |
| Omgekeerde relatie | Je kunt zowel van product naar categorie als van categorie naar producten werken |

#### Vooruitblik

In het volgende hoofdstuk ga je meerdere modellen, migrations en seeders opzetten volgens een groter datamodel. De relatie tussen categorieën en producten die je hier hebt gebruikt, vormt daarvoor de basis.