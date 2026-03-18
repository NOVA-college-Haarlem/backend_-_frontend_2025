# Hoofdstuk 5

## Laravel Mail & Notifications

In vrijwel elk project wil je gebruikers informeren over wat er gebeurt. Iemand heeft zich aangemeld voor je evenement — stuur een bevestiging. Een bezoeker is ingecheckt — notificeer de ontvanger. Een ticket is bijgewerkt — laat het de melder weten.

Laravel heeft hier twee mechanismen voor: **Mail** en **Notifications**.

---

## Laravel Mail

### Mailable aanmaken

Een Mailable is een klasse die één specifieke e-mail vertegenwoordigt.

```bash
php artisan make:mail AanmeldingBevestiging
```

Dit maakt `app/Mail/AanmeldingBevestiging.php` aan.

```php
<?php

namespace App\Mail;

use App\Models\Aanmelding;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class AanmeldingBevestiging extends Mailable
{
    use Queueable, SerializesModels;

    public function __construct(public Aanmelding $aanmelding)
    {
        //
    }

    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'Bevestiging aanmelding: ' . $this->aanmelding->evenement->naam,
        );
    }

    public function content(): Content
    {
        return new Content(
            view: 'emails.aanmelding-bevestiging',
        );
    }
}
```

### E-mail template maken

Maak een Blade-bestand aan in `resources/views/emails/aanmelding-bevestiging.blade.php`:

```blade
<h1>Bedankt voor je aanmelding!</h1>

<p>Hoi {{ $aanmelding->user->name }},</p>

<p>Je bent aangemeld voor <strong>{{ $aanmelding->evenement->naam }}</strong>.</p>

<p>
    Datum: {{ $aanmelding->evenement->datum->format('d-m-Y') }}<br>
    Locatie: {{ $aanmelding->evenement->locatie }}
</p>

<p>Tot dan!</p>
```

### E-mail versturen vanuit een Controller

```php
use App\Mail\AanmeldingBevestiging;
use Illuminate\Support\Facades\Mail;

public function store(Request $request, Evenement $evenement)
{
    $aanmelding = Aanmelding::create([
        'user_id'      => auth()->id(),
        'evenement_id' => $evenement->id,
    ]);

    Mail::to(auth()->user()->email)->send(new AanmeldingBevestiging($aanmelding));

    return redirect()->back()->with('success', 'Je bent aangemeld! Check je e-mail.');
}
```

### E-mail lokaal testen met Mailpit

Je wilt geen echte e-mails sturen tijdens development. Gebruik **Mailpit** — dit vangt alle e-mails op die je applicatie verstuurt en toont ze in een webinterface.

Als je Laravel Herd gebruikt, is Mailpit standaard beschikbaar op: [http://localhost:8025](http://localhost:8025)

Zorg dat je `.env` zo is ingesteld:

```
MAIL_MAILER=smtp
MAIL_HOST=127.0.0.1
MAIL_PORT=1025
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_FROM_ADDRESS="noreply@jouwapp.test"
MAIL_FROM_NAME="${APP_NAME}"
```

---

## Laravel Notifications

Notifications zijn flexibeler dan Mailables. Met één Notification-klasse kun je een gebruiker bereiken via meerdere kanalen: e-mail, database (in-app notificatie), of SMS.

### Notification aanmaken

```bash
php artisan make:notification TicketStatusGewijzigd
```

```php
<?php

namespace App\Notifications;

use App\Models\Ticket;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class TicketStatusGewijzigd extends Notification
{
    public function __construct(public Ticket $ticket)
    {
        //
    }

    public function via(object $notifiable): array
    {
        return ['mail', 'database']; // Via e-mail én opgeslagen in de database
    }

    public function toMail(object $notifiable): MailMessage
    {
        return (new MailMessage)
            ->subject('Update op je ticket: ' . $this->ticket->titel)
            ->line('De status van je ticket is gewijzigd naar: ' . $this->ticket->status)
            ->action('Bekijk ticket', route('tickets.show', $this->ticket))
            ->line('Bedankt voor je geduld.');
    }

    public function toArray(object $notifiable): array
    {
        return [
            'ticket_id' => $this->ticket->id,
            'status'    => $this->ticket->status,
            'bericht'   => 'Je ticket "' . $this->ticket->titel . '" is bijgewerkt.',
        ];
    }
}
```

### Notification versturen

```php
use App\Notifications\TicketStatusGewijzigd;

$ticket->user->notify(new TicketStatusGewijzigd($ticket));
```

### Database notificaties tonen

Als je `'database'` gebruikt als kanaal, heb je een `notifications`-tabel nodig:

```bash
php artisan notifications:table
php artisan migrate
```

Haal ongelezen notificaties op in je controller:

```php
$notificaties = auth()->user()->unreadNotifications;
```

Markeer als gelezen:

```php
auth()->user()->unreadNotifications->markAsRead();
```

Toon in Blade (bijv. in de navigatie):

```blade
@if(auth()->user()->unreadNotifications->count() > 0)
    <span class="badge">
        {{ auth()->user()->unreadNotifications->count() }}
    </span>
@endif
```

---

## Opdracht 1 – E-mail versturen

Kies een actie in jouw project waarbij het logisch is om een e-mail te sturen. Voorbeelden:

- Bevestiging na aanmelding voor een evenement
- Notificatie aan een medewerker als er een bezoeker voor hem is
- Bevestiging na ingediend urenformulier

1. Maak een Mailable aan.
2. Maak de bijbehorende Blade-template.
3. Roep de mail aan vanuit de juiste controller.
4. Test het via Mailpit.

---

## Opdracht 2 – In-app notificatie (bonus)

Implementeer een database-notificatie voor een actie in jouw project:

1. Maak een Notification aan met kanaal `['database']`.
2. Maak de migration aan en voer hem uit.
3. Stuur de notificatie vanuit de juiste controller.
4. Toon het aantal ongelezen notificaties ergens in de navigatie.
5. Markeer notificaties als gelezen wanneer de gebruiker ze bekijkt.
