# Hoofdstuk 4 - Data Visualisatie & E-mail

In dit hoofdstuk leer je twee nieuwe technieken die je als backend developer regelmatig tegenkomt:

1. **Data visualisatie met Chart.js** - Grafieken maken van je data
2. **E-mail versturen vanuit Laravel** - Contactformulieren en notificaties

We bouwen verder op het Crypto Dashboard uit Hoofdstuk 3. Daarna maken we een contactformulier dat daadwerkelijk e-mails verstuurt.

---

# Deel 1: Data Visualisatie met Chart.js

## Introductie

Je hebt in Hoofdstuk 3 een Crypto Dashboard gebouwd met een tabel. Tabellen zijn prima voor exacte cijfers, maar soms wil je data in één oogopslag begrijpen. Dan zijn grafieken veel krachtiger.

**Chart.js** is een gratis JavaScript library waarmee je grafieken kunt bouwen in de browser. Het werkt met het HTML `<canvas>` element en ondersteunt veel grafiektypen: staafdiagrammen, lijngrafieken, taartdiagrammen en meer.

**Wat gaan we bouwen?**

- Een staafdiagram (bar chart) van de top 10 crypto prijzen
- Een taartdiagram (doughnut chart) van de marktverdeling
- Een staafdiagram van de 24-uurs prijsverandering (positief/negatief)

---

## Opdracht 1: Chart.js toevoegen aan het project

**Doel:** Chart.js laden in het Crypto Dashboard project

### 1.1 Project openen

Open je **cryptodashboard** project uit Hoofdstuk 3 in VS Code. Controleer of het project nog werkt door naar http://cryptodashboard.test/coins te gaan.

**Zie je een foutmelding?** Controleer dan:
- Draait Laravel Herd?
- Bestaat de database nog? Zo niet, voer `php artisan migrate` uit.

### 1.2 Chart.js laden via CDN

We laden Chart.js via een CDN (Content Delivery Network). Dit is de makkelijkste manier - je hoeft niets te installeren.

Open `resources/views/coins/index.blade.php` en voeg de volgende regel toe in de `<head>` sectie:

```html
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
```

**Checkpoint:** De pagina laadt nog steeds normaal. Chart.js is nu beschikbaar maar nog niet zichtbaar.

---

## Opdracht 2: Staafdiagram van crypto prijzen

**Doel:** Een bar chart tonen met de prijzen van de top 10 coins

### 2.1 Canvas element toevoegen

Voeg onder de tabel in `index.blade.php` het volgende toe:

```html
<h2 style="color: #f5c542; margin-top: 40px;">Prijzen Top 10</h2>
<div style="background-color: #16213e; border-radius: 10px; padding: 20px; margin-top: 10px;">
    <canvas id="priceChart"></canvas>
</div>
```

Het `<canvas>` element is een leeg tekengebied. Chart.js tekent hier de grafiek in.

### 2.2 JavaScript voor de grafiek

Voeg onderaan de `<body>`, voor de sluitende `</body>` tag, het volgende script toe:

```html
<script>
    const priceCtx = document.getElementById('priceChart').getContext('2d');

    new Chart(priceCtx, {
        type: 'bar',
        data: {
            labels: [
                @foreach ($coins as $coin)
                    '{{ $coin->name }}',
                @endforeach
            ],
            datasets: [{
                label: 'Prijs in EUR',
                data: [
                    @foreach ($coins as $coin)
                        {{ $coin->current_price }},
                    @endforeach
                ],
                backgroundColor: [
                    '#f5c542', '#e74c3c', '#3498db', '#2ecc71', '#9b59b6',
                    '#e67e22', '#1abc9c', '#34495e', '#e91e63', '#00bcd4'
                ],
                borderWidth: 0,
                borderRadius: 5
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    display: false
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: {
                        color: '#e0e0e0',
                        callback: function(value) {
                            return '€' + value.toLocaleString('nl-NL');
                        }
                    },
                    grid: {
                        color: '#333'
                    }
                },
                x: {
                    ticks: {
                        color: '#e0e0e0'
                    },
                    grid: {
                        display: false
                    }
                }
            }
        }
    });
</script>
```

### 2.3 Uitleg van de code

Laten we de belangrijkste onderdelen doorlopen:

| Onderdeel | Wat het doet |
|-----------|-------------|
| `getContext('2d')` | Maakt een 2D tekenomgeving op het canvas |
| `type: 'bar'` | Kiest een staafdiagram |
| `labels` | De namen op de X-as (Bitcoin, Ethereum, etc.) |
| `data` | De waarden per staaf (de prijzen) |
| `backgroundColor` | Kleuren van de staven |
| `borderRadius: 5` | Afgeronde hoeken op de staven |
| `beginAtZero: true` | Y-as begint bij 0 |
| `callback` | Formatteert de Y-as labels met euroteken |

**Let op de Blade-syntax:** We gebruiken `@foreach` in het JavaScript om de data vanuit PHP in de grafiek te laden. Laravel voert de `@foreach` uit op de server en het resultaat is gewoon JavaScript met de juiste waarden.

**Checkpoint:** Je ziet een staafdiagram onder de tabel met de prijzen van alle 10 coins. Bitcoin zal waarschijnlijk veel hoger zijn dan de rest.

**Vraag:** Waarom is het staafdiagram misschien niet ideaal als Bitcoin veel duurder is dan de andere coins?

---

## Opdracht 3: Taartdiagram van marktverdeling

**Doel:** Een doughnut chart tonen die de verdeling van marktkapitalisatie laat zien

### 3.1 Canvas toevoegen

Voeg onder het staafdiagram toe:

```html
<h2 style="color: #f5c542; margin-top: 40px;">Marktverdeling</h2>
<div style="background-color: #16213e; border-radius: 10px; padding: 20px; margin-top: 10px; max-width: 500px; margin-left: auto; margin-right: auto;">
    <canvas id="marketCapChart"></canvas>
</div>
```

### 3.2 JavaScript voor het taartdiagram

Voeg toe aan het bestaande `<script>` blok (voor de sluitende `</script>` tag):

```javascript
const marketCapCtx = document.getElementById('marketCapChart').getContext('2d');

new Chart(marketCapCtx, {
    type: 'doughnut',
    data: {
        labels: [
            @foreach ($coins as $coin)
                '{{ $coin->name }}',
            @endforeach
        ],
        datasets: [{
            data: [
                @foreach ($coins as $coin)
                    {{ $coin->market_cap }},
                @endforeach
            ],
            backgroundColor: [
                '#f5c542', '#e74c3c', '#3498db', '#2ecc71', '#9b59b6',
                '#e67e22', '#1abc9c', '#34495e', '#e91e63', '#00bcd4'
            ],
            borderColor: '#1a1a2e',
            borderWidth: 3
        }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: {
                position: 'bottom',
                labels: {
                    color: '#e0e0e0',
                    padding: 15,
                    usePointStyle: true
                }
            },
            tooltip: {
                callbacks: {
                    label: function(context) {
                        const value = context.parsed;
                        const total = context.dataset.data.reduce((a, b) => a + b, 0);
                        const percentage = ((value / total) * 100).toFixed(1);
                        return context.label + ': ' + percentage + '%';
                    }
                }
            }
        }
    }
});
```

### 3.3 Uitleg

| Onderdeel | Wat het doet |
|-----------|-------------|
| `type: 'doughnut'` | Een taartdiagram met een gat in het midden |
| `borderColor: '#1a1a2e'` | Rand tussen de segmenten (zelfde kleur als achtergrond) |
| `usePointStyle: true` | Ronde bolletjes in de legenda in plaats van vierkanten |
| `tooltip.callbacks.label` | Berekent het percentage wanneer je over een segment hovert |

De tooltip callback is interessant: `context.dataset.data.reduce((a, b) => a + b, 0)` telt alle marktkapitalisaties bij elkaar op. Daarna berekent het welk percentage de gehovereerde coin is van het totaal.

**Checkpoint:** Je ziet een doughnut chart die laat zien hoeveel procent van de totale marktkapitalisatie elke coin heeft. Hover over de segmenten om de percentages te zien.

---

## Opdracht 4: Prijsverandering grafiek (positief/negatief)

**Doel:** Een staafdiagram waarbij positieve veranderingen groen zijn en negatieve rood

### 4.1 Canvas toevoegen

```html
<h2 style="color: #f5c542; margin-top: 40px;">Prijsverandering (24 uur)</h2>
<div style="background-color: #16213e; border-radius: 10px; padding: 20px; margin-top: 10px;">
    <canvas id="changeChart"></canvas>
</div>
```

### 4.2 JavaScript

Voeg toe aan het script blok:

```javascript
const changeCtx = document.getElementById('changeChart').getContext('2d');

const changeData = [
    @foreach ($coins as $coin)
        {{ $coin->price_change_percentage_24h ?? 0 }},
    @endforeach
];

const changeColors = changeData.map(value => value >= 0 ? '#00c853' : '#ff1744');

new Chart(changeCtx, {
    type: 'bar',
    data: {
        labels: [
            @foreach ($coins as $coin)
                '{{ $coin->name }}',
            @endforeach
        ],
        datasets: [{
            label: 'Verandering in %',
            data: changeData,
            backgroundColor: changeColors,
            borderWidth: 0,
            borderRadius: 5
        }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: {
                display: false
            }
        },
        scales: {
            y: {
                ticks: {
                    color: '#e0e0e0',
                    callback: function(value) {
                        return value + '%';
                    }
                },
                grid: {
                    color: '#333'
                }
            },
            x: {
                ticks: {
                    color: '#e0e0e0'
                },
                grid: {
                    display: false
                }
            }
        }
    }
});
```

### 4.3 Uitleg: dynamische kleuren

Het interessante hier is hoe we de kleuren bepalen:

```javascript
const changeColors = changeData.map(value => value >= 0 ? '#00c853' : '#ff1744');
```

De `.map()` functie loopt door elke waarde heen:
- Is de waarde **0 of hoger**? → Groene kleur (`#00c853`)
- Is de waarde **negatief**? → Rode kleur (`#ff1744`)

Zo zie je in één oogopslag welke coins in de plus staan en welke in de min.

De `?? 0` in de Blade-code is de **null coalescing operator**: als `price_change_percentage_24h` leeg is (null), wordt er `0` gebruikt.

**Checkpoint:** Je ziet een staafdiagram met groene en rode staven. Groene staven gaan omhoog (positieve verandering), rode staven gaan omlaag (negatieve verandering).

---

## Opdracht 5: Chart data via de controller

**Doel:** De chart data voorbereiden in de controller in plaats van in Blade

Tot nu toe hebben we `@foreach` in het JavaScript gebruikt. Dit werkt, maar het is netter om de data in de controller voor te bereiden en als JSON door te geven. Dit is een betere scheiding tussen backend (data) en frontend (weergave).

### 5.1 Controller aanpassen

Open `app/Http/Controllers/CoinController.php` en pas de `index` methode aan. Voeg de volgende regels toe **voor** de `return view(...)`:

```php
$chartData = [
    'labels' => $coins->pluck('name')->toArray(),
    'prices' => $coins->pluck('current_price')->toArray(),
    'marketCaps' => $coins->pluck('market_cap')->toArray(),
    'changes' => $coins->pluck('price_change_percentage_24h')->toArray(),
];
```

Pas de return aan zodat `$chartData` wordt meegegeven:

```php
return view('coins.index', compact('coins', 'fromCache', 'chartData'));
```

### 5.2 Wat doet `pluck`?

`pluck` is een Collection methode die één specifieke kolom uit de collection haalt:

```php
$coins->pluck('name')
// Resultaat: ['Bitcoin', 'Ethereum', 'Tether', ...]

$coins->pluck('current_price')
// Resultaat: [85000.50, 3200.75, 1.00, ...]
```

Met `->toArray()` zetten we het om naar een gewone PHP array, zodat we het als JSON kunnen doorgeven.

### 5.3 View aanpassen

Nu kunnen we in de view de data veel schoner doorgeven. Vervang het hele `<script>` blok door:

```html
<script>
    const chartData = @json($chartData);

    // Kleuren array
    const colors = [
        '#f5c542', '#e74c3c', '#3498db', '#2ecc71', '#9b59b6',
        '#e67e22', '#1abc9c', '#34495e', '#e91e63', '#00bcd4'
    ];

    // === Prijzen Chart ===
    new Chart(document.getElementById('priceChart').getContext('2d'), {
        type: 'bar',
        data: {
            labels: chartData.labels,
            datasets: [{
                label: 'Prijs in EUR',
                data: chartData.prices,
                backgroundColor: colors,
                borderWidth: 0,
                borderRadius: 5
            }]
        },
        options: {
            responsive: true,
            plugins: { legend: { display: false } },
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: {
                        color: '#e0e0e0',
                        callback: function(value) {
                            return '€' + value.toLocaleString('nl-NL');
                        }
                    },
                    grid: { color: '#333' }
                },
                x: {
                    ticks: { color: '#e0e0e0' },
                    grid: { display: false }
                }
            }
        }
    });

    // === Marktverdeling Chart ===
    new Chart(document.getElementById('marketCapChart').getContext('2d'), {
        type: 'doughnut',
        data: {
            labels: chartData.labels,
            datasets: [{
                data: chartData.marketCaps,
                backgroundColor: colors,
                borderColor: '#1a1a2e',
                borderWidth: 3
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'bottom',
                    labels: { color: '#e0e0e0', padding: 15, usePointStyle: true }
                },
                tooltip: {
                    callbacks: {
                        label: function(context) {
                            const value = context.parsed;
                            const total = context.dataset.data.reduce((a, b) => a + b, 0);
                            const percentage = ((value / total) * 100).toFixed(1);
                            return context.label + ': ' + percentage + '%';
                        }
                    }
                }
            }
        }
    });

    // === Prijsverandering Chart ===
    const changeColors = chartData.changes.map(v => (v ?? 0) >= 0 ? '#00c853' : '#ff1744');

    new Chart(document.getElementById('changeChart').getContext('2d'), {
        type: 'bar',
        data: {
            labels: chartData.labels,
            datasets: [{
                label: 'Verandering in %',
                data: chartData.changes,
                backgroundColor: changeColors,
                borderWidth: 0,
                borderRadius: 5
            }]
        },
        options: {
            responsive: true,
            plugins: { legend: { display: false } },
            scales: {
                y: {
                    ticks: {
                        color: '#e0e0e0',
                        callback: function(value) { return value + '%'; }
                    },
                    grid: { color: '#333' }
                },
                x: {
                    ticks: { color: '#e0e0e0' },
                    grid: { display: false }
                }
            }
        }
    });
</script>
```

### 5.4 De `@json` directive

De belangrijkste verandering is deze regel:

```html
const chartData = @json($chartData);
```

`@json()` is een Blade directive die een PHP array automatisch omzet naar een JavaScript object. Laravel zorgt ervoor dat speciale tekens correct worden ge-escaped. Dit is veiliger en netter dan handmatig `@foreach` gebruiken in JavaScript.

Het resultaat in de browser is:

```javascript
const chartData = {
    "labels": ["Bitcoin", "Ethereum", "Tether", ...],
    "prices": [85000.50, 3200.75, 1.00, ...],
    "marketCaps": [1623456789012, 384567890123, ...],
    "changes": [2.45, -1.23, 0.01, ...]
};
```

**Checkpoint:** Alle drie de grafieken werken nog steeds, maar de code is nu veel schoner en overzichtelijker.

---

## Bonusopdracht: Chart op de detailpagina

Voeg een grafiek toe aan `resources/views/coins/show.blade.php` die de prijs vergelijkt met de gemiddelde prijs van alle coins in je database.

**Hint:** Je hebt `Coin::avg('current_price')` nodig in de controller om het gemiddelde te berekenen.

---

# Deel 2: E-mail versturen vanuit Laravel

## Introductie

Bijna elke webapplicatie verstuurt e-mails: wachtwoord vergeten, orderbevestigingen, contactformulieren, notificaties. Laravel maakt dit eenvoudig met het **Mail** systeem.

We gaan stap voor stap:
1. Een mailservice instellen (Mailtrap voor testen)
2. Een contactformulier bouwen
3. Een Mailable class aanmaken
4. De e-mail versturen

**Belangrijk:** We gebruiken **Mailtrap** als testomgeving. Mailtrap is een dienst die e-mails opvangt zodat je kunt testen zonder daadwerkelijk e-mails te versturen naar echte adressen. Zo kun je veilig ontwikkelen.

---

## Opdracht 6: Mailtrap instellen

**Doel:** Een testomgeving voor e-mail opzetten

### 6.1 Account aanmaken

1. Ga naar https://mailtrap.io
2. Klik op **Sign Up** en maak een gratis account aan (je kunt inloggen met je GitHub account).
3. Na het inloggen zie je het Mailtrap dashboard.

### 6.2 SMTP instellingen ophalen

1. Klik in het dashboard op **Email Testing** in het linkermenu.
2. Klik op **My Inbox**.
3. Klik op **Show Credentials** of het tabje **SMTP Settings**.
4. Je ziet de volgende gegevens:
   - Host
   - Port
   - Username
   - Password

### 6.3 Laravel configureren

Open het `.env` bestand van je **cryptodashboard** project en pas de mail-instellingen aan:

```
MAIL_MAILER=smtp
MAIL_HOST=sandbox.smtp.mailtrap.io
MAIL_PORT=2525
MAIL_USERNAME=jouw_mailtrap_username
MAIL_PASSWORD=jouw_mailtrap_password
MAIL_ENCRYPTION=tls
MAIL_FROM_ADDRESS="dashboard@cryptodashboard.test"
MAIL_FROM_NAME="Crypto Dashboard"
```

Vervang `jouw_mailtrap_username` en `jouw_mailtrap_password` met de gegevens van Mailtrap.

### 6.4 Config cache legen

Na het aanpassen van het `.env` bestand moet je de config cache legen:

```bash
php artisan config:clear
```

**Checkpoint:** De configuratie is ingesteld. We gaan nu het formulier en de mail opbouwen.

---

## Opdracht 7: Contactformulier bouwen

**Doel:** Een pagina met een contactformulier maken

### 7.1 Route aanmaken

Voeg twee routes toe aan `routes/web.php`:

```php
use App\Http\Controllers\ContactController;

Route::get('/contact', [ContactController::class, 'index']);
Route::post('/contact', [ContactController::class, 'send']);
```

De eerste route (GET) toont het formulier. De tweede route (POST) verwerkt het verstuurde formulier.

### 7.2 Controller aanmaken

```bash
php artisan make:controller ContactController
```

Voeg de `index` methode toe:

```php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ContactController extends Controller
{
    public function index()
    {
        return view('contact');
    }
}
```

### 7.3 View aanmaken

Maak `resources/views/contact.blade.php`:

```html
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact - Crypto Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #1a1a2e;
            color: #e0e0e0;
        }
        h1 { color: #f5c542; }
        a { color: #f5c542; }
        form {
            background-color: #16213e;
            padding: 30px;
            border-radius: 10px;
            margin-top: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #f5c542;
            font-weight: bold;
        }
        input, textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #333;
            border-radius: 5px;
            background-color: #1a1a2e;
            color: #e0e0e0;
            font-size: 16px;
            box-sizing: border-box;
        }
        textarea {
            height: 150px;
            resize: vertical;
        }
        button {
            background-color: #f5c542;
            color: #1a1a2e;
            padding: 12px 24px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }
        button:hover {
            background-color: #d4a937;
        }
        .error {
            color: #ff1744;
            font-size: 14px;
            margin-top: -15px;
            margin-bottom: 15px;
        }
        .success {
            background-color: #1b5e20;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <a href="/coins">&larr; Terug naar dashboard</a>
    <h1>Contact</h1>

    @if (session('success'))
        <div class="success">
            {{ session('success') }}
        </div>
    @endif

    <form method="POST" action="/contact">
        @csrf

        <label for="name">Naam</label>
        <input type="text" id="name" name="name" value="{{ old('name') }}">
        @error('name')
            <p class="error">{{ $message }}</p>
        @enderror

        <label for="email">E-mailadres</label>
        <input type="email" id="email" name="email" value="{{ old('email') }}">
        @error('email')
            <p class="error">{{ $message }}</p>
        @enderror

        <label for="subject">Onderwerp</label>
        <input type="text" id="subject" name="subject" value="{{ old('subject') }}">
        @error('subject')
            <p class="error">{{ $message }}</p>
        @enderror

        <label for="message">Bericht</label>
        <textarea id="message" name="message">{{ old('message') }}</textarea>
        @error('message')
            <p class="error">{{ $message }}</p>
        @enderror

        <button type="submit">Verstuur bericht</button>
    </form>
</body>
</html>
```

### 7.4 Uitleg van het formulier

Een paar belangrijke Blade-elementen:

| Element | Wat het doet |
|---------|-------------|
| `@csrf` | Beveiligingstoken dat Laravel vereist bij POST requests. Zonder dit krijg je een 419 error. |
| `old('name')` | Vult het veld opnieuw in als het formulier validatiefouten had. Zo verliest de gebruiker niet wat hij al had getypt. |
| `@error('name')` | Toont een foutmelding als de validatie voor dit veld faalt. |
| `session('success')` | Toont een succesbericht na het succesvol versturen van het formulier. |

**Checkpoint:** Bezoek http://cryptodashboard.test/contact. Je ziet een contactformulier. Het verstuurt nog niets - dat bouwen we in de volgende opdrachten.

---

## Opdracht 8: Formuliervalidatie

**Doel:** Controleren of de ingevulde gegevens kloppen voordat we de e-mail versturen

### 8.1 Send methode toevoegen

Voeg de `send` methode toe aan `ContactController.php`:

```php
public function send(Request $request)
{
    $validated = $request->validate([
        'name' => 'required|min:2',
        'email' => 'required|email',
        'subject' => 'required|min:3',
        'message' => 'required|min:10',
    ]);

    // E-mail versturen komt in de volgende opdracht

    return redirect('/contact')->with('success', 'Bedankt voor je bericht! We nemen zo snel mogelijk contact op.');
}
```

### 8.2 Validatieregels uitleg

| Regel | Betekenis |
|-------|-----------|
| `required` | Het veld mag niet leeg zijn |
| `min:2` | Minimaal 2 tekens |
| `email` | Moet een geldig e-mailadres zijn |
| `min:10` | Minimaal 10 tekens (voor het bericht) |

Je kunt de regels combineren met `|` (pipe). Laravel controleert ze van links naar rechts.

### 8.3 Testen

1. Bezoek http://cryptodashboard.test/contact
2. Klik op "Verstuur bericht" zonder iets in te vullen
3. Je ziet rode foutmeldingen bij elk veld
4. Vul alles correct in en verstuur
5. Je ziet het groene succesbericht

**Checkpoint:** De validatie werkt. Foutieve invoer wordt afgewezen, correcte invoer toont het succesbericht. De e-mail wordt nog niet daadwerkelijk verstuurd - dat is de volgende stap.

---

## Opdracht 9: Mailable class aanmaken

**Doel:** Een e-mailtemplate aanmaken met Laravel's Mailable systeem

### 9.1 Mailable genereren

Voer in de terminal uit:

```bash
php artisan make:mail ContactMail
```

Dit maakt het bestand `app/Mail/ContactMail.php` aan.

### 9.2 Mailable invullen

Open `app/Mail/ContactMail.php` en vervang de inhoud:

```php
<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class ContactMail extends Mailable
{
    use Queueable, SerializesModels;

    public function __construct(
        public string $senderName,
        public string $senderEmail,
        public string $mailSubject,
        public string $mailMessage,
    ) {}

    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'Contactformulier: ' . $this->mailSubject,
            replyTo: [$this->senderEmail],
        );
    }

    public function content(): Content
    {
        return new Content(
            view: 'emails.contact',
        );
    }
}
```

### 9.3 Uitleg van de Mailable class

| Onderdeel | Wat het doet |
|-----------|-------------|
| `__construct` | Ontvangt de data die in de e-mail komt. Door `public` zijn deze automatisch beschikbaar in de view. |
| `envelope()` | Bepaalt de "envelop": onderwerp, reply-to adres. Dit is wat de ontvanger ziet in zijn inbox. |
| `content()` | Bepaalt de inhoud: welke Blade view wordt gebruikt als e-mailtemplate. |
| `replyTo` | Als de ontvanger op "beantwoorden" klikt, gaat het antwoord naar dit adres (het e-mailadres van de afzender). |

### 9.4 E-mailtemplate aanmaken

Maak de map `resources/views/emails` aan. Maak daarin het bestand `contact.blade.php`:

```html
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            color: #333;
            max-width: 600px;
            margin: 0 auto;
        }
        .header {
            background-color: #1a1a2e;
            color: #f5c542;
            padding: 20px;
            border-radius: 5px 5px 0 0;
        }
        .content {
            background-color: #f9f9f9;
            padding: 20px;
            border: 1px solid #ddd;
        }
        .footer {
            background-color: #eee;
            padding: 15px 20px;
            font-size: 12px;
            color: #888;
            border-radius: 0 0 5px 5px;
        }
        .label {
            font-weight: bold;
            color: #555;
        }
    </style>
</head>
<body>
    <div class="header">
        <h2>Nieuw contactbericht</h2>
    </div>

    <div class="content">
        <p><span class="label">Van:</span> {{ $senderName }}</p>
        <p><span class="label">E-mail:</span> {{ $senderEmail }}</p>
        <p><span class="label">Onderwerp:</span> {{ $mailSubject }}</p>

        <hr>

        <p><span class="label">Bericht:</span></p>
        <p>{{ $mailMessage }}</p>
    </div>

    <div class="footer">
        <p>Dit bericht is verstuurd via het contactformulier van Crypto Dashboard.</p>
    </div>
</body>
</html>
```

**Checkpoint:** De Mailable class en de e-mailtemplate zijn aangemaakt. In de volgende opdracht koppelen we alles aan elkaar.

---

## Opdracht 10: E-mail versturen

**Doel:** Het contactformulier daadwerkelijk een e-mail laten versturen

### 10.1 Controller aanpassen

Open `app/Http/Controllers/ContactController.php` en pas de `send` methode aan:

```php
<?php

namespace App\Http\Controllers;

use App\Mail\ContactMail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class ContactController extends Controller
{
    public function index()
    {
        return view('contact');
    }

    public function send(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|min:2',
            'email' => 'required|email',
            'subject' => 'required|min:3',
            'message' => 'required|min:10',
        ]);

        Mail::to('admin@cryptodashboard.test')->send(
            new ContactMail(
                senderName: $validated['name'],
                senderEmail: $validated['email'],
                mailSubject: $validated['subject'],
                mailMessage: $validated['message'],
            )
        );

        return redirect('/contact')->with('success', 'Bedankt voor je bericht! We nemen zo snel mogelijk contact op.');
    }
}
```

### 10.2 Uitleg

De belangrijkste regel is:

```php
Mail::to('admin@cryptodashboard.test')->send(
    new ContactMail(...)
);
```

Dit leest als: "Stuur een e-mail **naar** admin@cryptodashboard.test met de inhoud van een **nieuwe ContactMail**."

De `Mail` facade is Laravel's mail systeem. Het gebruikt de SMTP instellingen uit je `.env` bestand om de e-mail te versturen.

Omdat we Mailtrap gebruiken, wordt de e-mail **niet** echt afgeleverd bij admin@cryptodashboard.test. In plaats daarvan wordt de e-mail onderschept door Mailtrap, zodat je hem kunt bekijken in je Mailtrap inbox.

### 10.3 Testen

1. Bezoek http://cryptodashboard.test/contact
2. Vul het formulier in met testgegevens
3. Klik op "Verstuur bericht"
4. Je ziet het groene succesbericht
5. Ga naar **Mailtrap** (https://mailtrap.io) en open je inbox
6. Je ziet de e-mail met de opgemaakte template!

**Checkpoint:** De e-mail verschijnt in je Mailtrap inbox met de juiste opmaak, afzendergegevens en het bericht.

---

## Opdracht 11: Link in het dashboard

**Doel:** Een link naar het contactformulier toevoegen aan het Crypto Dashboard

Open `resources/views/coins/index.blade.php` en voeg onder de `<h1>` (maar boven de cache-status) toe:

```html
<nav style="margin-bottom: 20px;">
    <a href="/coins" style="color: #f5c542; margin-right: 15px;">Dashboard</a>
    <a href="/contact" style="color: #e0e0e0;">Contact</a>
</nav>
```

Voeg dezelfde navigatie ook toe aan `resources/views/contact.blade.php` (vervang de bestaande "Terug" link):

```html
<nav style="margin-bottom: 20px;">
    <a href="/coins" style="color: #e0e0e0; margin-right: 15px;">Dashboard</a>
    <a href="/contact" style="color: #f5c542;">Contact</a>
</nav>
```

**Checkpoint:** Je kunt nu navigeren tussen het dashboard en het contactformulier.

---

## Bonusopdracht A: Prijsalert e-mail

Maak een functie die automatisch een e-mail verstuurt wanneer een coin meer dan 5% gestegen of gedaald is in 24 uur.

**Hints:**
- Maak een nieuwe Mailable: `php artisan make:mail PriceAlertMail`
- Voeg een methode toe aan `CoinController` die de coins filtert op grote prijsveranderingen
- Maak een route `/coins/alerts` die de check uitvoert

Voorbeeld van het filteren:

```php
$alertCoins = Coin::where('price_change_percentage_24h', '>', 5)
    ->orWhere('price_change_percentage_24h', '<', -5)
    ->get();
```

## Bonusopdracht B: E-mail met grafiek

Voeg aan de prijsalert e-mail een samenvatting toe met de gegevens van de coin. Denk aan:
- Naam en symbool
- Huidige prijs
- Prijsverandering in %
- Marktkapitalisatie

**Let op:** Chart.js werkt niet in e-mails (e-mailclients ondersteunen geen JavaScript). Gebruik in plaats daarvan een HTML tabel met gekleurde balken via CSS:

```html
<div style="background-color: {{ $change >= 0 ? '#00c853' : '#ff1744' }};
            width: {{ abs($change) * 10 }}px;
            height: 20px;
            border-radius: 3px;">
</div>
```

---

## Samenvatting

In dit hoofdstuk heb je geleerd:

| Concept | Wat je hebt geleerd |
|---------|---------------------|
| **Chart.js** | Grafieken maken in de browser met JavaScript |
| **Bar chart** | Staafdiagrammen voor het vergelijken van waarden |
| **Doughnut chart** | Taartdiagrammen voor het tonen van verhoudingen |
| **Dynamische kleuren** | Kleuren aanpassen op basis van data (positief/negatief) |
| **@json** | PHP data veilig doorgeven aan JavaScript |
| **pluck** | Eén kolom ophalen uit een Eloquent collection |
| **Mailtrap** | Testomgeving voor e-mail tijdens ontwikkeling |
| **Mailable** | Laravel class voor het opbouwen van e-mails |
| **Envelope** | Onderwerp en reply-to adres instellen |
| **Mail::to()->send()** | E-mails versturen vanuit je applicatie |
| **Formuliervalidatie** | Gebruikersinvoer controleren met `$request->validate()` |
| **@csrf** | Beveiliging tegen cross-site request forgery |

**Vergelijking van de technieken:**

| | Chart.js | E-mail |
|---|---|---|
| **Type** | Frontend visualisatie | Backend communicatie |
| **Waar draait het** | In de browser (JavaScript) | Op de server (PHP/Laravel) |
| **Data richting** | Server → Browser | Server → Mailserver → Ontvanger |
| **Testen** | Direct zichtbaar in browser | Via Mailtrap testomgeving |
| **Gebruik** | Dashboards, rapportages | Notificaties, contactformulieren |
