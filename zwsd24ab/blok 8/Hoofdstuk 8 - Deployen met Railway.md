# Hoofdstuk 8

## Deployen met Railway

Je hebt een werkende Laravel-applicatie gebouwd. Maar op dit moment draait die alleen op jouw laptop. Als je de link deelt met iemand anders, zien zij niets.

In dit hoofdstuk zet je jouw project **live op het internet** — op een echte server, bereikbaar via een publieke URL. Dit is wat developers doen als een feature "klaar" is: ze deployen.

Je gebruikt hiervoor **Railway**: een platform dat jouw GitHub-code automatisch bouwt en online zet, inclusief een MySQL-database.

---

## Waarom leer je dit?

Op stage of in een baan ga je code schrijven die op een server draait — niet op je eigen laptop. Deployen is een kerntaak van een developer. Recruiters vragen hier vaak naar: _"Kun je me een link sturen?"_ is een heel andere vraag dan _"Kun je me de code laten zien."_

Bovendien: als je straks op stage zit en jouw project al online staat, kun je het direct laten zien tijdens je sollicitatiegesprek.

---

## Wat is Railway?

**Railway** is een cloudplatform waarop je applicaties en databases kunt draaien. Het herkent automatisch dat je een Laravel-project hebt, bouwt het, en start het op.

Wat je krijgt:
- Een publieke URL (`jouwproject.up.railway.app`)
- Een MySQL-database in de cloud
- Automatische herimplementatie bij elke `git push`

Railway biedt een gratis proefperiode met $5 startkrediet — genoeg om jouw project weken live te houden. Een creditcard is niet altijd vereist.

---

## Voorbereiding

Controleer het volgende voordat je begint:

- [ ] Jouw project staat op **GitHub** (via een feature branch of `main`)
- [ ] Je hebt een werkende `.env.example` in je repo (zonder echte secrets)
- [ ] Je kunt `php artisan migrate` lokaal uitvoeren zonder fouten

> Je `.env`-bestand zelf staat in `.gitignore` en staat **niet** op GitHub. Dat is bewust — daar kom je zo op terug.

---

## Stap 1 — Railway account aanmaken

1. Ga naar [railway.app](https://railway.app)
2. Klik op **Start a New Project**
3. Log in met je **GitHub-account**
4. Geef Railway toestemming om je repositories te bekijken

---

## Stap 2 — Project koppelen

1. Klik op **Deploy from GitHub repo**
2. Zoek jouw project-repository op en selecteer hem
3. Railway detecteert automatisch dat het een PHP-project is

Railway gebruikt **Nixpacks**: een tool die herkent welk type project je hebt en automatisch de buildstappen bepaalt. Je hoeft hier zelf niets voor in te stellen.

---

## Stap 3 — MySQL database toevoegen

Je applicatie heeft een database nodig. Die draait niet mee in dezelfde service — je voegt hem apart toe.

1. Klik in je Railway-project op **New** → **Database** → **Add MySQL**
2. Railway maakt een MySQL-instantie aan en koppelt die aan jouw project
3. Open de MySQL-service en ga naar het tabblad **Variables**

Je ziet hier variabelen zoals `MYSQL_HOST`, `MYSQL_PORT`, `MYSQL_DATABASE`, `MYSQL_USER` en `MYSQL_PASSWORD`. Die heb je straks nodig.

---

## Stap 4 — Environment variables instellen

Jouw Laravel-app leest instellingen uit environment variables. In productie stel je die in via het Railway-dashboard in plaats van een `.env`-bestand.

Ga naar jouw **Laravel-service** → tabblad **Variables** en voeg het volgende toe:

| Variable | Waarde |
|---|---|
| `APP_ENV` | `production` |
| `APP_DEBUG` | `false` |
| `APP_KEY` | _(zie stap 5)_ |
| `APP_URL` | _(jouw Railway-URL, bijv. `https://mijn-project.up.railway.app`)_ |
| `DB_CONNECTION` | `mysql` |
| `DB_HOST` | _(waarde van `MYSQL_HOST` uit de database-service)_ |
| `DB_PORT` | _(waarde van `MYSQL_PORT`)_ |
| `DB_DATABASE` | _(waarde van `MYSQL_DATABASE`)_ |
| `DB_USERNAME` | _(waarde van `MYSQL_USER`)_ |
| `DB_PASSWORD` | _(waarde van `MYSQL_PASSWORD`)_ |

> **Tip**: Railway heeft een handige functie: typ `${{MySQL.MYSQL_HOST}}` als waarde en Railway vult automatisch de juiste waarde in vanuit de gekoppelde database-service. De naam vóór de punt (`MySQL`) moet overeenkomen met de naam van jouw database-service in Railway.

---

## Stap 5 — APP_KEY aanmaken

Laravel heeft een geheime sleutel nodig voor encryptie van sessies en cookies. Genereer er een in je terminal:

```bash
php artisan key:generate --show
```

De output ziet er zo uit:

```
base64:AbCdEfGhIjKlMnOpQrStUvWxYz1234567890==
```

Kopieer deze waarde en plak hem als de waarde van `APP_KEY` in Railway.

> Genereer altijd een **nieuwe** sleutel voor productie. Gebruik nooit dezelfde sleutel als in je lokale `.env`.

---

## Stap 6 — Migrations uitvoeren

Je database in de cloud is leeg. Je moet de migrations draaien om de tabellen aan te maken.

Railway heeft een ingebouwde terminal waarmee je rechtstreeks commando's kunt uitvoeren op je server.

1. Ga naar jouw Laravel-service in Railway
2. Klik op het tabblad **Deploy** → **Connect** → **Railway Shell**
3. Er opent een terminal in de browser. Typ:

```bash
php artisan migrate --force
```

De `--force`-vlag is nodig omdat Laravel in productie-modus anders weigert te migreren als extra beveiliging.

> Je hoeft dit normaal gesproken maar één keer te doen. Nieuwe migrations die je later toevoegt kun je op dezelfde manier uitvoeren.

---

## Stap 7 — Controleer de live URL

1. Ga naar jouw Laravel-service in Railway
2. Klik op **Settings** → **Networking** → **Generate Domain**
3. Railway geeft je een publieke URL (bijv. `mijn-project.up.railway.app`)
4. Open de URL in je browser

Werkt je homepagina? Dan staat je applicatie live.

---

## Wat hoort NIET op GitHub?

Dit is een belangrijk principe dat je de rest van je carrière meeneemt:

**Secrets horen nooit in versiebeheer.**

| Bestand / gegeven | Wel op GitHub? | Waarom |
|---|---|---|
| `.env` | Nee | Bevat wachtwoorden en sleutels |
| `.env.example` | Ja | Alleen structuur, geen echte waarden |
| `APP_KEY` | Nee | Gevoelige encryptiesleutel |
| Databasewachtwoord | Nee | Kan misbruikt worden |
| Publieke HTML/CSS/PHP | Ja | Gewone code |

Als je per ongeluk een wachtwoord op GitHub hebt gezet: wijzig het direct. GitHub indexeert repositories en er zijn bots die actief scannen op gelekte API-sleutels en wachtwoorden.

---

## Automatisch deployen bij elke push

Railway koppelt automatisch aan jouw GitHub-repository. Elke keer dat je naar de gekoppelde branch pusht, start Railway een nieuwe deploy.

```bash
git add .
git commit -m "feat: voeg zoekfunctie toe"
git push origin main
```

Railway pakt dit op, bouwt de nieuwe versie, en zet die live — zonder dat je iets extra's hoeft te doen.

---

## Veelgemaakte fouten

- **APP_KEY ontbreekt** — Laravel geeft een 500-fout als `APP_KEY` niet is ingesteld. Controleer de variables.
- **DB_HOST is localhost** — Lokaal werkt `localhost`, maar in productie gebruik je het Railway MySQL-adres.
- **Migrations vergeten** — De database bestaat maar de tabellen niet. Voer `php artisan migrate --force` uit.
- **APP_DEBUG staat op true** — In productie geeft dit foutmeldingen met gevoelige informatie aan bezoekers. Altijd op `false`.
- **`.env` in de repo gezet** — Verwijder hem direct, verander alle wachtwoorden en sleutels die erin stonden.

---

## Opdracht 1 – Jouw project live zetten (verplicht)

Zet het Laravel-project dat je in blok 8 hebt gebouwd live op Railway.

**Stappen:**
1. Controleer dat je project op GitHub staat
2. Maak een Railway-account aan en koppel de repository
3. Voeg een MySQL-database toe
4. Stel alle environment variables in
5. Voer de migrations uit
6. Genereer een publieke URL

**Inlevereis:**
- Jouw applicatie is bereikbaar via een publieke Railway-URL
- Je kunt inloggen met een testaccount
- Je kunt mondeling uitleggen welke variabelen je hebt ingesteld en waarom

---

## Opdracht 2 – Automatisch testen met GitHub Actions (verdieping)

Je hebt in hoofdstuk 7 Pest-tests geschreven. Nu ga je die automatisch laten draaien bij elke push naar GitHub. Dit heet een **CI-pipeline** (Continuous Integration).

### Wat is GitHub Actions?

GitHub Actions is een automatiseringstool ingebouwd in GitHub. Je schrijft een instructiebestand (een _workflow_) en GitHub voert dat automatisch uit op hun servers.

Elke keer dat iemand in jouw team pusht, worden de tests gedraaid. Als een test faalt, zie je dat meteen in GitHub — voordat de code op de server belandt.

### Workflow aanmaken

Maak in je project de volgende mappenstructuur aan:

```
.github/
└── workflows/
    └── tests.yml
```

Inhoud van `tests.yml`:

```yaml
name: Tests

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  tests:
    runs-on: ubuntu-latest

    steps:
      - name: Code ophalen
        uses: actions/checkout@v4

      - name: PHP instellen
        uses: shivammathur/setup-php@v2
        with:
          php-version: '8.3'
          extensions: pdo_sqlite

      - name: Composer dependencies installeren
        run: composer install --no-interaction --prefer-dist

      - name: .env aanmaken
        run: cp .env.example .env

      - name: APP_KEY genereren
        run: php artisan key:generate

      - name: Tests draaien
        run: php artisan test
        env:
          DB_CONNECTION: sqlite
          DB_DATABASE: ":memory:"
```

> De tests draaien hier met SQLite in het geheugen. Dat is snel en heeft geen aparte database nodig. Zorg dat je testbestanden `RefreshDatabase` gebruiken (dat heb je al geleerd in hoofdstuk 7).

### Controleren of het werkt

1. Commit en push dit bestand naar GitHub
2. Ga naar jouw repository op GitHub
3. Klik op het tabblad **Actions**
4. Je ziet een workflow draaien — groen betekent: alle tests geslaagd

Voortaan zie je bij elke push meteen of je code de tests doorstaat.

---

## Koppeling met assessment

Tijdens je assessment kun je laten zien dat je meer weet dan alleen lokale development. Als je kunt uitleggen:

- waarom `APP_DEBUG=false` in productie staat;
- wat het verschil is tussen een `.env`-bestand en environment variables op Railway;
- waarom de tests automatisch draaien bij een push (opdracht 2);

dan laat je zien dat je denkt als een developer die code naar productie brengt — niet alleen iemand die iets op zijn eigen laptop werkend heeft.
