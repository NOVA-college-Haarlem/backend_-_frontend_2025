# Hoofdstuk 5 — Reviews en Autorisatie

In dit hoofdstuk bouwen we de reviewfunctionaliteit. Ingelogde klanten kunnen een review schrijven bij een product. We passen autorisatie toe zodat alleen de schrijver zijn eigen review kan verwijderen, en admins alle reviews kunnen beheren.

## Inhoudsopgave
- [Hoofdstuk 5 — Reviews en Autorisatie](#hoofdstuk-5--reviews-en-autorisatie)
  - [Inhoudsopgave](#inhoudsopgave)
  - [Leerdoelen](#leerdoelen)
  - [Opdracht 1: Review model verkennen](#opdracht-1-review-model-verkennen)
  - [Opdracht 2: ReviewController aanmaken](#opdracht-2-reviewcontroller-aanmaken)
    - [Opdracht 2.1: Routes voor reviews](#opdracht-21-routes-voor-reviews)
  - [Opdracht 3: Review formulier in de product-show view](#opdracht-3-review-formulier-in-de-product-show-view)
  - [Opdracht 4: Review opslaan (store)](#opdracht-4-review-opslaan-store)
    - [Opdracht 4.1: Test het opslaan](#opdracht-41-test-het-opslaan)
  - [Opdracht 5: Reviews weergeven](#opdracht-5-reviews-weergeven)
  - [Opdracht 6: Review verwijderen](#opdracht-6-review-verwijderen)
  - [Opdracht 7: Policy aanmaken voor autorisatie](#opdracht-7-policy-aanmaken-voor-autorisatie)
    - [Opdracht 7.1: Policy toepassen in de controller](#opdracht-71-policy-toepassen-in-de-controller)
    - [Opdracht 7.2: Policy toepassen in de view](#opdracht-72-policy-toepassen-in-de-view)
  - [Opdracht 8: Gemiddelde beoordeling tonen](#opdracht-8-gemiddelde-beoordeling-tonen)
  - [Opdracht 9: Tests](#opdracht-9-tests)
  - [Afronding / Reflectie](#afronding--reflectie)

## Leerdoelen
- Een geneste resource route aanmaken (`products/{product}/reviews`).
- De ingelogde gebruiker koppelen aan een nieuw record via `Auth::id()`.
- Een sterrenbeoordeling valideren (integer, 1 t/m 5).
- Autorisatie per record regelen met een Laravel Policy.
- `@can` gebruiken in Blade om knoppen conditioneel te tonen.
- Een gemiddelde berekenen met Eloquent (`avg()`).

---

## Opdracht 1: Review model verkennen

In Hoofdstuk 2 hebben we het `Review`-model al aangemaakt met de bijbehorende migration. Laten we de huidige staat controleren.

1. Open `app/Models/Review.php`. Controleer of de volgende zaken aanwezig zijn:
   ```php
   protected $fillable = ['comment', 'rating', 'user_id', 'product_id'];

   public function product() {
       return $this->belongsTo(Product::class);
   }

   public function user() {
       return $this->belongsTo(User::class);
   }
   ```

2. Open de migration voor reviews en controleer of de tabel de kolommen `comment`, `rating`, `user_id` en `product_id` heeft.

3. Controleer of `Product.php` de relatie heeft:
   ```php
   public function reviews() {
       return $this->hasMany(Review::class);
   }
   ```

4. En `User.php`:
   ```php
   public function reviews() {
       return $this->hasMany(Review::class);
   }
   ```

Als iets ontbreekt, voeg het dan toe op basis van Hoofdstuk 2.

---

## Opdracht 2: ReviewController aanmaken

Reviews horen bij een product. We gebruiken een geneste resource: een review bestaat altijd in de context van een product.

```bash
php artisan make:controller ReviewController
```

Open `app/Http/Controllers/ReviewController.php` en zorg dat de volgende imports aanwezig zijn:
```php
use App\Models\Product;
use App\Models\Review;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
```

### Opdracht 2.1: Routes voor reviews

1. Open `routes/web.php`.
2. Voeg de review-routes toe binnen de `auth`-middleware groep:
   ```php
   Route::middleware('auth')->group(function () {
       // ... bestaande product-routes ...

       // Geneste routes: reviews horen bij een product
       Route::post('/products/{product}/reviews', [ReviewController::class, 'store'])
           ->name('reviews.store');
       Route::delete('/products/{product}/reviews/{review}', [ReviewController::class, 'destroy'])
           ->name('reviews.destroy');
   });
   ```

> **Geneste routes** geven aan dat een resource afhankelijk is van een andere. De URL `/products/5/reviews` maakt duidelijk dat deze reviews bij product 5 horen. Laravel geeft automatisch beide model-instanties (`$product` en `$review`) mee aan de controller via Route Model Binding.

---

## Opdracht 3: Review formulier in de product-show view

We bouwen het formulier uit dat we in Hoofdstuk 4 al klaargezet hadden.

Open `resources/views/products/show.blade.php` en vervang het `@auth`-blok onderaan door:

```html
<hr class="my-4">

@auth
    <div class="card mb-4">
        <div class="card-header">
            <h4 class="mb-0">Schrijf een review</h4>
        </div>
        <div class="card-body">
            <form action="{{ route('reviews.store', $product) }}" method="POST">
                @csrf

                <div class="mb-3">
                    <label class="form-label">Beoordeling</label>
                    <div class="d-flex gap-2">
                        @for($i = 1; $i <= 5; $i++)
                            <div class="form-check">
                                <input class="form-check-input"
                                       type="radio"
                                       name="rating"
                                       id="rating{{ $i }}"
                                       value="{{ $i }}"
                                       {{ old('rating') == $i ? 'checked' : '' }}>
                                <label class="form-check-label" for="rating{{ $i }}">
                                    {{ $i }} ster{{ $i > 1 ? 'ren' : '' }}
                                </label>
                            </div>
                        @endfor
                    </div>
                    @error('rating')
                        <div class="text-danger small mt-1">{{ $message }}</div>
                    @enderror
                </div>

                <div class="mb-3">
                    <label for="comment" class="form-label">Jouw review</label>
                    <textarea class="form-control @error('comment') is-invalid @enderror"
                              id="comment"
                              name="comment"
                              rows="4"
                              placeholder="Vertel anderen wat je van dit spel vindt...">{{ old('comment') }}</textarea>
                    @error('comment')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>

                <button type="submit" class="btn btn-primary">Review plaatsen</button>
            </form>
        </div>
    </div>
@else
    <div class="alert alert-info">
        <a href="{{ route('login') }}">Log in</a> om een review te schrijven.
    </div>
@endauth
```

---

## Opdracht 4: Review opslaan (store)

1. Open `app/Http/Controllers/ReviewController.php`.
2. Voeg de `store`-methode toe:

```php
public function store(Request $request, Product $product)
{
    $validated = $request->validate([
        'rating'  => 'required|integer|between:1,5',
        'comment' => 'required|string|min:10|max:1000',
    ]);

    $product->reviews()->create([
        'rating'  => $validated['rating'],
        'comment' => $validated['comment'],
        'user_id' => Auth::id(),
    ]);

    return redirect()
        ->route('products.show', $product)
        ->with('success', 'Je review is geplaatst. Bedankt!');
}
```

> **`Auth::id()`** geeft het ID van de ingelogde gebruiker terug — hetzelfde als `Auth::user()->id`, maar iets compacter.

> **`$product->reviews()->create(...)`**: Omdat we via de relatie aanmaken, wordt `product_id` automatisch ingesteld door Eloquent. We hoeven het niet handmatig mee te geven.

> **Validatieregel `between:1,5`**: Controleert of het getal tussen 1 en 5 ligt (inclusief). Handig voor beoordelingen.

### Opdracht 4.1: Test het opslaan

1. Log in als een gewone gebruiker (geen admin).
2. Ga naar een productpagina.
3. Vul het reviewformulier in en klik op "Review plaatsen".
4. Je ziet de flash message en de review verschijnt op de pagina.

```bash
php artisan test --group=ReviewStoreTest
```

---

## Opdracht 5: Reviews weergeven

Pas de `show`-methode in `ProductController` aan om reviews met gebruikersinformatie te laden:

```php
public function show(Product $product)
{
    $product->load([
        'category',
        'prices',
        'reviews' => fn($q) => $q->with('user')->latest(),
    ]);

    return view('products.show', compact('product'));
}
```

Vervang het reviews-blok in `products/show.blade.php` door:

```html
<h3 class="mt-4">
    Reviews
    @if($product->reviews->isNotEmpty())
        <span class="badge bg-secondary fs-6">{{ $product->reviews->count() }}</span>
    @endif
</h3>

@forelse($product->reviews as $review)
    <div class="card mb-3">
        <div class="card-body">
            <div class="d-flex justify-content-between align-items-start">
                <div>
                    <strong>{{ $review->user->name }}</strong>
                    <span class="text-muted small ms-2">
                        {{ $review->created_at->diffForHumans() }}
                    </span>
                </div>
                <div>
                    @for($i = 1; $i <= 5; $i++)
                        <span style="color: {{ $i <= $review->rating ? '#ffc107' : '#dee2e6' }}">★</span>
                    @endfor
                </div>
            </div>
            <p class="mt-2 mb-0">{{ $review->comment }}</p>
        </div>
    </div>
@empty
    <p class="text-muted">Nog geen reviews voor dit product.</p>
@endforelse
```

> **`$review->created_at->diffForHumans()`**: Geeft een mensleesbare tijdsaanduiding zoals "3 minuten geleden" of "gisteren". Dit werkt doordat Eloquent timestamps automatisch omzet naar Carbon-objecten.

---

## Opdracht 6: Review verwijderen

Voeg de `destroy`-methode toe aan `ReviewController`:

```php
public function destroy(Product $product, Review $review)
{
    $review->delete();

    return redirect()
        ->route('products.show', $product)
        ->with('success', 'Review verwijderd.');
}
```

Voeg een verwijderknop toe in de review-weergave (tijdelijk zichtbaar voor iedereen — we beveiligen dit in opdracht 7):

```html
<div class="mt-2">
    <form action="{{ route('reviews.destroy', [$product, $review]) }}" method="POST"
          onsubmit="return confirm('Review verwijderen?')">
        @csrf
        @method('DELETE')
        <button type="submit" class="btn btn-sm btn-outline-danger">Verwijderen</button>
    </form>
</div>
```

---

## Opdracht 7: Policy aanmaken voor autorisatie

Op dit moment kan iedereen elke review verwijderen. We willen:
- Een gebruiker mag alleen zijn **eigen** reviews verwijderen.
- Een admin mag **alle** reviews verwijderen.

We regelen dit met een **Policy**: een klasse die autorisatieregels voor een specifiek model bevat.

```bash
php artisan make:policy ReviewPolicy --model=Review
```

Open `app/Policies/ReviewPolicy.php` en vul de `delete`-methode in:

```php
public function delete(User $user, Review $review): bool
{
    // Admin mag alles verwijderen
    if ($user->isAdmin()) {
        return true;
    }

    // Gebruiker mag alleen zijn eigen review verwijderen
    return $user->id === $review->user_id;
}
```

> **Policy vs. Gate**: Gates zijn handig voor losse, algemene rechten ("mag iemand producten beheren?"). Policies zijn gekoppeld aan een model en regelen per record wie wat mag ("mag *deze* gebruiker *deze* review verwijderen?").

### Opdracht 7.1: Policy toepassen in de controller

```php
public function destroy(Product $product, Review $review)
{
    $this->authorize('delete', $review);

    $review->delete();

    return redirect()
        ->route('products.show', $product)
        ->with('success', 'Review verwijderd.');
}
```

> **`$this->authorize('delete', $review)`**: Laravel zoekt automatisch de bijbehorende Policy op basis van het model (`Review` → `ReviewPolicy`) en roept de `delete`-methode aan.

### Opdracht 7.2: Policy toepassen in de view

Vervang de tijdelijke verwijderknop door een conditionele versie:

```html
@can('delete', $review)
    <div class="mt-2">
        <form action="{{ route('reviews.destroy', [$product, $review]) }}" method="POST"
              onsubmit="return confirm('Review verwijderen?')">
            @csrf
            @method('DELETE')
            <button type="submit" class="btn btn-sm btn-outline-danger">Verwijderen</button>
        </form>
    </div>
@endcan
```

**Test de autorisatie:**
1. Log in als een gewone klant.
2. Schrijf een review.
3. De verwijderknop verschijnt bij jouw review, maar niet bij die van anderen.
4. Log in als admin — de verwijderknop verschijnt bij alle reviews.

---

## Opdracht 8: Gemiddelde beoordeling tonen

We tonen de gemiddelde beoordeling per product op de detailpagina en in de productlijst.

1. Voeg een scope toe aan `Review.php` die het gemiddelde berekent:
   ```php
   // In Product.php
   public function averageRating(): float|null
   {
       return $this->reviews()->avg('rating');
   }
   ```

2. Pas de product-detailpagina aan om het gemiddelde te tonen:
   ```html
   @if($product->reviews->isNotEmpty())
       <p class="lead">
           Gemiddelde beoordeling:
           <strong>{{ number_format($product->averageRating(), 1) }}</strong> / 5
           ({{ $product->reviews->count() }} review{{ $product->reviews->count() > 1 ? 's' : '' }})
       </p>
   @endif
   ```

3. Pas de `index`-view aan om ook het gemiddelde te tonen in de tabel:
   ```html
   <td>
       {{ $product->reviews->isNotEmpty()
           ? number_format($product->reviews->avg('rating'), 1) . ' / 5'
           : '—' }}
   </td>
   ```

   Vergeet niet de tabelkop `<th>Beoordeling</th>` toe te voegen.

---

## Opdracht 9: Tests

```bash
php artisan test --group=ReviewTest
```

Controleer dat de volgende scenario's werken:
- Een ingelogde gebruiker kan een review plaatsen.
- Een niet-ingelogde gebruiker wordt doorgestuurd naar de loginpagina.
- Een gebruiker kan alleen zijn eigen review verwijderen (Policy).
- Een admin kan alle reviews verwijderen.
- Het gemiddelde wordt correct berekend.

---

## Afronding / Reflectie

In dit hoofdstuk heb je:
- Een reviewformulier gebouwd met sterrenrating en tekstcommentaar.
- De ingelogde gebruiker automatisch gekoppeld via `Auth::id()`.
- Geneste routes gebruikt om reviews aan een product te koppelen.
- Autorisatie per record geregeld met een Laravel Policy.
- `@can` gebruikt om de verwijderknop conditioneel te tonen.
- Een gemiddelde beoordeling berekend met `avg()`.

**Gate vs. Policy — wanneer gebruik je wat?**
| | Gate | Policy |
|---|---|---|
| Gebonden aan model? | Nee | Ja |
| Gebruik | Algemene rechten | Per-record rechten |
| Voorbeeld | "Mag je producten beheren?" | "Mag je *deze* review verwijderen?" |

**Volgende stap:** Bestellingen plaatsen via een many-to-many relatie met de `orderrows`-pivot tabel.
