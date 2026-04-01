# Hoofdstuk 6 — Bestellingen en Many-to-Many

In dit hoofdstuk bouwen we de bestelfunctionaliteit van de spelshop. Een bestelling kan meerdere producten bevatten, en een product kan in meerdere bestellingen voorkomen. Dit is een many-to-many relatie die via de `orderrows`-pivot tabel loopt.

## Inhoudsopgave
- [Hoofdstuk 6 — Bestellingen en Many-to-Many](#hoofdstuk-6--bestellingen-en-many-to-many)
  - [Inhoudsopgave](#inhoudsopgave)
  - [Leerdoelen](#leerdoelen)
  - [Opdracht 1: De datastructuur begrijpen](#opdracht-1-de-datastructuur-begrijpen)
  - [Opdracht 2: Orderseeder aanmaken](#opdracht-2-orderseeder-aanmaken)
  - [Opdracht 3: Bestelling plaatsen — formulier](#opdracht-3-bestelling-plaatsen--formulier)
    - [Opdracht 3.1: Routes](#opdracht-31-routes)
    - [Opdracht 3.2: OrderController aanmaken](#opdracht-32-ordercontroller-aanmaken)
    - [Opdracht 3.3: Bestelformulier in de product-show view](#opdracht-33-bestelformulier-in-de-product-show-view)
  - [Opdracht 4: Bestelling opslaan](#opdracht-4-bestelling-opslaan)
    - [Opdracht 4.1: Prijs valideren](#opdracht-41-prijs-valideren)
    - [Opdracht 4.2: Test het opslaan](#opdracht-42-test-het-opslaan)
  - [Opdracht 5: Bestellingenoverzicht voor de gebruiker](#opdracht-5-bestellingenoverzicht-voor-de-gebruiker)
    - [Opdracht 5.1: View voor het overzicht](#opdracht-51-view-voor-het-overzicht)
    - [Opdracht 5.2: View voor de besteldetails](#opdracht-52-view-voor-de-besteldetails)
  - [Opdracht 6: attach, sync en detach begrijpen](#opdracht-6-attach-sync-en-detach-begrijpen)
    - [Opdracht 6.1: Oefening](#opdracht-61-oefening)
  - [Opdracht 7: Bestelling annuleren](#opdracht-7-bestelling-annuleren)
  - [Opdracht 8: Paginatie toevoegen](#opdracht-8-paginatie-toevoegen)
  - [Opdracht 9: Tests](#opdracht-9-tests)
  - [Afronding / Reflectie](#afronding--reflectie)

## Leerdoelen
- De many-to-many relatie via een pivot tabel begrijpen en toepassen.
- Een bestelling aanmaken en koppelen aan producten via `orderrows`.
- `attach()`, `sync()` en `detach()` gebruiken bij pivot-relaties.
- Het bestellingenoverzicht tonen voor de ingelogde gebruiker.
- Paginatie toevoegen met `paginate()`.
- Een bestelling annuleren met een statuswijziging.

---

## Opdracht 1: De datastructuur begrijpen

Bekijk het ERD nog eens. Een bestelling werkt als volgt:

```
users ──── orders ──── orderrows ──── products
                 (pivot tabel)
```

- Een `Order` hoort bij één `User`.
- Een `Order` heeft meerdere `Orderrow`-regels (pivot).
- Elke `Orderrow` verwijst naar één `Product` en bevat het aantal en de prijs op het moment van bestellen.

Waarom bewaren we de prijs in `orderrows`? Omdat de prijs van een product kan veranderen. Als je een historische bestelling bekijkt, wil je de prijs zien die gold op het moment van bestellen — niet de huidige prijs.

1. Open `app/Models/Order.php` en controleer of de volgende relaties aanwezig zijn:
   ```php
   protected $fillable = ['orderdate', 'user_id', 'status', 'total_price'];

   public function user() {
       return $this->belongsTo(User::class);
   }

   public function orderrows() {
       return $this->hasMany(Orderrow::class);
   }
   ```

2. Open `app/Models/Orderrow.php`:
   ```php
   protected $fillable = ['order_id', 'product_id', 'quantity', 'total_price'];

   public function order() {
       return $this->belongsTo(Order::class);
   }

   public function product() {
       return $this->belongsTo(Product::class);
   }
   ```

3. Voeg aan `Product.php` een relatie toe als die ontbreekt:
   ```php
   public function orderrows() {
       return $this->hasMany(Orderrow::class);
   }
   ```

4. Voeg aan `User.php` een relatie toe als die ontbreekt:
   ```php
   public function orders() {
       return $this->hasMany(Order::class);
   }
   ```

---

## Opdracht 2: Orderseeder aanmaken

We voegen wat testbestellingen toe zodat we het overzicht kunnen testen.

```bash
php artisan make:seeder OrdersSeeder
```

Vul `database/seeders/OrdersSeeder.php` in:

```php
use App\Models\Order;
use App\Models\Orderrow;
use App\Models\Product;
use App\Models\User;

public function run()
{
    $user = User::where('email', 'admin@spelshop.nl')->first();
    $products = Product::with('prices')->take(3)->get();

    if (!$user || $products->isEmpty()) {
        return;
    }

    $order = Order::create([
        'user_id'     => $user->id,
        'orderdate'   => now(),
        'status'      => 'ordered',
        'total_price' => 0,
    ]);

    $totalPrice = 0;

    foreach ($products as $product) {
        $price = $product->prices->sortByDesc('in_effect_date')->first()?->price ?? 0;
        $quantity = 1;

        Orderrow::create([
            'order_id'    => $order->id,
            'product_id'  => $product->id,
            'quantity'    => $quantity,
            'total_price' => $price * $quantity,
        ]);

        $totalPrice += $price * $quantity;
    }

    $order->update(['total_price' => $totalPrice]);
}
```

Voeg de seeder toe aan `DatabaseSeeder.php` na de producten- en prijzen-seeders:

```php
$this->call([
    RolesSeeder::class,
    UsersSeeder::class,
    CategoriesSeeder::class,
    ProductsSeeder::class,
    PricesSeeder::class,
    ReviewsSeeder::class,
    OrdersSeeder::class,
]);
```

Draai opnieuw:
```bash
php artisan migrate:fresh --seed
```

---

## Opdracht 3: Bestelling plaatsen — formulier

We bouwen een eenvoudig bestelformulier op de productdetailpagina. Een gebruiker kiest een aantal en klikt op "Bestellen".

### Opdracht 3.1: Routes

Voeg de bestelroutes toe in `routes/web.php` binnen de `auth`-middleware groep:

```php
Route::middleware('auth')->group(function () {
    // ... bestaande routes ...

    Route::get('/bestellingen', [OrderController::class, 'index'])->name('orders.index');
    Route::get('/bestellingen/{order}', [OrderController::class, 'show'])->name('orders.show');
    Route::post('/products/{product}/bestellen', [OrderController::class, 'store'])->name('orders.store');
    Route::patch('/bestellingen/{order}/annuleren', [OrderController::class, 'cancel'])->name('orders.cancel');
});
```

### Opdracht 3.2: OrderController aanmaken

```bash
php artisan make:controller OrderController
```

Voeg de imports toe bovenaan `app/Http/Controllers/OrderController.php`:

```php
use App\Models\Order;
use App\Models\Orderrow;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
```

### Opdracht 3.3: Bestelformulier in de product-show view

Voeg een bestelformulier toe in `products/show.blade.php`, boven het reviewformulier:

```html
@auth
    <div class="card mb-4">
        <div class="card-header">
            <h4 class="mb-0">Bestellen</h4>
        </div>
        <div class="card-body">
            @php
                $currentPrice = $product->prices->sortByDesc('in_effect_date')->first();
            @endphp

            @if($currentPrice)
                <p class="fs-5">
                    Prijs: <strong>€ {{ number_format($currentPrice->price / 100, 2, ',', '.') }}</strong>
                </p>

                <form action="{{ route('orders.store', $product) }}" method="POST">
                    @csrf
                    <div class="row g-2 align-items-end">
                        <div class="col-auto">
                            <label for="quantity" class="form-label">Aantal</label>
                            <input type="number"
                                   class="form-control @error('quantity') is-invalid @enderror"
                                   id="quantity"
                                   name="quantity"
                                   value="{{ old('quantity', 1) }}"
                                   min="1"
                                   max="10"
                                   style="width: 80px">
                            @error('quantity')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>
                        <div class="col-auto">
                            <button type="submit" class="btn btn-success">
                                Bestellen
                            </button>
                        </div>
                    </div>
                </form>
            @else
                <p class="text-muted">Prijs niet beschikbaar.</p>
            @endif
        </div>
    </div>
@else
    <div class="alert alert-info">
        <a href="{{ route('login') }}">Log in</a> om dit product te bestellen.
    </div>
@endauth
```

---

## Opdracht 4: Bestelling opslaan

Voeg de `store`-methode toe in `OrderController`:

```php
public function store(Request $request, Product $product)
{
    $validated = $request->validate([
        'quantity' => 'required|integer|min:1|max:10',
    ]);

    // Huidige prijs ophalen
    $currentPrice = $product->prices()
        ->latest('in_effect_date')
        ->first();

    if (!$currentPrice) {
        return back()->with('error', 'Dit product heeft geen prijs. Bestellen is niet mogelijk.');
    }

    $quantity   = $validated['quantity'];
    $unitPrice  = $currentPrice->price;         // prijs in cents
    $totalPrice = $unitPrice * $quantity;

    // Nieuwe bestelling aanmaken
    $order = Order::create([
        'user_id'     => Auth::id(),
        'orderdate'   => now(),
        'status'      => 'ordered',
        'total_price' => $totalPrice,
    ]);

    // Orderregel aanmaken
    $order->orderrows()->create([
        'product_id'  => $product->id,
        'quantity'    => $quantity,
        'total_price' => $totalPrice,
    ]);

    return redirect()
        ->route('orders.show', $order)
        ->with('success', 'Bestelling geplaatst! Bestelnummer: #' . $order->id);
}
```

> **Prijs opslaan op het moment van bestellen**: We slaan `$currentPrice->price` op in `orderrows.total_price`. Als de prijs later wijzigt, blijft de historische bestelprijs correct.

### Opdracht 4.1: Prijs valideren

Voeg aan de validatie een extra controle toe via een custom regel:

```php
$validated = $request->validate([
    'quantity' => 'required|integer|min:1|max:10',
]);

// Extra check buiten validate()
if (!$product->prices()->exists()) {
    return back()->with('error', 'Geen prijs beschikbaar voor dit product.');
}
```

### Opdracht 4.2: Test het opslaan

1. Log in als een gewone klant.
2. Ga naar een productpagina.
3. Voer een aantal in en klik op "Bestellen".
4. Je wordt doorgestuurd naar de besteldetailpagina.

```bash
php artisan test --group=OrderStoreTest
```

---

## Opdracht 5: Bestellingenoverzicht voor de gebruiker

### Opdracht 5.1: View voor het overzicht

Voeg de `index`-methode toe in `OrderController`:

```php
public function index()
{
    $orders = Auth::user()
        ->orders()
        ->with(['orderrows.product'])
        ->latest('orderdate')
        ->paginate(10);

    return view('orders.index', compact('orders'));
}
```

Maak de view aan:

```bash
php artisan make:view orders.index
```

Vul `resources/views/orders/index.blade.php` in:

```html
@extends('layouts.app')

@section('title', 'Mijn bestellingen')

@section('content')
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h1>Mijn bestellingen</h1>
    </div>

    @if($orders->isEmpty())
        <div class="alert alert-info">
            Je hebt nog geen bestellingen geplaatst.
            <a href="{{ route('products.index') }}">Bekijk onze producten</a>.
        </div>
    @else
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Datum</th>
                    <th>Producten</th>
                    <th>Totaal</th>
                    <th>Status</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                @foreach($orders as $order)
                    <tr>
                        <td>{{ $order->id }}</td>
                        <td>{{ $order->orderdate->format('d-m-Y') }}</td>
                        <td>{{ $order->orderrows->count() }} artikel(en)</td>
                        <td>€ {{ number_format($order->total_price / 100, 2, ',', '.') }}</td>
                        <td>
                            @php
                                $badges = [
                                    'ordered'   => 'primary',
                                    'delivered' => 'success',
                                    'canceled'  => 'danger',
                                ];
                            @endphp
                            <span class="badge bg-{{ $badges[$order->status] ?? 'secondary' }}">
                                {{ ucfirst($order->status) }}
                            </span>
                        </td>
                        <td>
                            <a href="{{ route('orders.show', $order) }}"
                               class="btn btn-sm btn-outline-primary">Details</a>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>

        {{ $orders->links() }}
    @endif
@endsection
```

Voeg een link toe in de navigatie van `layouts/app.blade.php`:

```html
@auth
    <a class="nav-link" href="{{ route('orders.index') }}">Mijn bestellingen</a>
@endauth
```

### Opdracht 5.2: View voor de besteldetails

Voeg de `show`-methode toe in `OrderController`:

```php
public function show(Order $order)
{
    // Gebruiker mag alleen zijn eigen bestellingen zien
    if ($order->user_id !== Auth::id() && !Auth::user()->isAdmin()) {
        abort(403);
    }

    $order->load(['orderrows.product', 'user']);

    return view('orders.show', compact('order'));
}
```

Maak de view aan:

```bash
php artisan make:view orders.show
```

Vul `resources/views/orders/show.blade.php` in:

```html
@extends('layouts.app')

@section('title', 'Bestelling #' . $order->id)

@section('content')
    <a href="{{ route('orders.index') }}" class="btn btn-secondary mb-3">← Terug</a>

    <h1>Bestelling #{{ $order->id }}</h1>
    <p class="text-muted">
        Geplaatst op {{ $order->orderdate->format('d-m-Y \o\m H:i') }}
    </p>

    <table class="table">
        <thead>
            <tr>
                <th>Product</th>
                <th>Aantal</th>
                <th>Prijs per stuk</th>
                <th>Subtotaal</th>
            </tr>
        </thead>
        <tbody>
            @foreach($order->orderrows as $row)
                <tr>
                    <td>
                        <a href="{{ route('products.show', $row->product) }}">
                            {{ $row->product->name }}
                        </a>
                    </td>
                    <td>{{ $row->quantity }}</td>
                    <td>€ {{ number_format(($row->total_price / $row->quantity) / 100, 2, ',', '.') }}</td>
                    <td>€ {{ number_format($row->total_price / 100, 2, ',', '.') }}</td>
                </tr>
            @endforeach
        </tbody>
        <tfoot>
            <tr class="table-active fw-bold">
                <td colspan="3">Totaal</td>
                <td>€ {{ number_format($order->total_price / 100, 2, ',', '.') }}</td>
            </tr>
        </tfoot>
    </table>

    <div class="mt-3">
        @if($order->status === 'ordered')
            <form action="{{ route('orders.cancel', $order) }}" method="POST"
                  onsubmit="return confirm('Bestelling annuleren?')">
                @csrf
                @method('PATCH')
                <button type="submit" class="btn btn-outline-danger">
                    Bestelling annuleren
                </button>
            </form>
        @else
            <span class="badge bg-{{ $order->status === 'delivered' ? 'success' : 'danger' }} fs-6">
                Status: {{ ucfirst($order->status) }}
            </span>
        @endif
    </div>
@endsection
```

---

## Opdracht 6: attach, sync en detach begrijpen

In onze spelshop werken we met `orderrows` als expliciete pivot-tabel (met extra kolommen zoals `quantity` en `total_price`). Maar Laravel heeft ook ingebouwde methoden voor eenvoudigere many-to-many relaties. Het is belangrijk deze te kennen.

Stel dat `Product` en `Order` rechtstreeks een `belongsToMany`-relatie zouden hebben (zonder extra pivot-kolommen):

```php
// Product.php
public function orders() {
    return $this->belongsToMany(Order::class);
}
```

Dan kun je:

| Methode | Wat het doet | Voorbeeld |
|---------|-------------|-----------|
| `attach($id)` | Voegt een koppeling toe | `$order->products()->attach(3)` |
| `detach($id)` | Verwijdert een koppeling | `$order->products()->detach(3)` |
| `sync([$ids])` | Vervangt alle koppelingen | `$order->products()->sync([1, 3, 5])` |
| `toggle([$ids])` | Wisselt koppelingen aan/uit | `$order->products()->toggle([2, 4])` |

> In onze spelshop gebruiken we `orderrows()->create(...)` in plaats van `attach()`, omdat we extra gegevens (prijs, aantal) willen opslaan in de pivot tabel.

### Opdracht 6.1: Oefening

Open `php artisan tinker` en probeer het volgende:

```php
// Haal een product op
$product = App\Models\Product::with('orderrows.order')->find(1);

// Bekijk alle bestellingen van dit product
$product->orderrows->pluck('order_id');

// Bekijk alle producten in een bestelling
$order = App\Models\Order::with('orderrows.product')->find(1);
$order->orderrows->pluck('product.name');
```

---

## Opdracht 7: Bestelling annuleren

Voeg de `cancel`-methode toe in `OrderController`:

```php
public function cancel(Order $order)
{
    if ($order->user_id !== Auth::id() && !Auth::user()->isAdmin()) {
        abort(403);
    }

    if ($order->status !== 'ordered') {
        return back()->with('error', 'Alleen bestellingen met status "ordered" kunnen worden geannuleerd.');
    }

    $order->update(['status' => 'canceled']);

    return redirect()
        ->route('orders.show', $order)
        ->with('success', 'Bestelling geannuleerd.');
}
```

---

## Opdracht 8: Paginatie toevoegen

We hebben al `paginate(10)` toegevoegd in de `index`-methode en `{{ $orders->links() }}` in de view. Laten we ook de productlijst pagineren.

1. Open de `index`-methode in `ProductController`.
2. Vervang `->get()` door `->paginate(12)`:
   ```php
   $products = $query->paginate(12);
   ```
3. Voeg onderaan de productlijst in de view toe:
   ```html
   <div class="mt-4">
       {{ $products->withQueryString()->links() }}
   </div>
   ```

> **`withQueryString()`**: Behoudt de zoekparameters in de paginatielinks. Zonder dit verlies je de zoekterm bij het doorklikken naar pagina 2.

> **Standaard Bootstrap-stijl**: Om de paginatielinks Bootstrap-stijl te geven, voeg je dit toe in `app/Providers/AppServiceProvider.php`:
> ```php
> use Illuminate\Pagination\Paginator;
>
> public function boot(): void
> {
>     Paginator::useBootstrap();
>     // ... rest van boot
> }
> ```

---

## Opdracht 9: Tests

```bash
php artisan test --group=OrderTest
```

Controleer dat de volgende scenario's werken:
- Een ingelogde gebruiker kan een bestelling plaatsen.
- De prijs wordt opgeslagen in cents op het moment van bestellen.
- Een gebruiker ziet alleen zijn eigen bestellingen.
- Een bestelling met status "ordered" kan worden geannuleerd.
- Een al geannuleerde bestelling kan niet opnieuw worden geannuleerd.
- Paginatie werkt correct bij meer dan 10 bestellingen.

---

## Afronding / Reflectie

In dit hoofdstuk heb je:
- De many-to-many relatie via een pivot tabel begrepen en toegepast.
- Een bestelling aangemaakt en gekoppeld aan producten via `orderrows`.
- `attach()`, `sync()` en `detach()` geleerd voor eenvoudige pivot-relaties.
- Het bestellingenoverzicht gebouwd met paginatie.
- Een bestelling kunnen annuleren via een statuswijziging.
- Autorisatie toegepast zodat gebruikers alleen hun eigen bestellingen zien.

**Volgende stap:** Herhaling en verdieping — FormRequest classes, extra oefeningen ter voorbereiding op het eindproject.
