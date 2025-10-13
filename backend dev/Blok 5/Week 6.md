# Week 6

## Les 1 - Custom Error Pages

Tot nu toe tonen we simpele error berichten met `echo` en `exit`. Dit is niet gebruiksvriendelijk en ziet er niet professioneel uit. We gaan custom error pages maken voor:
- **403 Forbidden**: Gebruiker heeft geen toegang tot de pagina
- **404 Not Found**: Pagina bestaat niet

### Wat is een HTTP Status Code?

Elke keer als je een webpagina bezoekt, stuurt de server een HTTP status code terug:
- **200 OK**: Pagina succesvol geladen
- **403 Forbidden**: Je mag deze pagina niet zien
- **404 Not Found**: Pagina bestaat niet
- **500 Internal Server Error**: Er is iets fout gegaan op de server

### Opdracht 1: 403 Forbidden Error Page

1. Maak een nieuw bestand aan genaamd `403.php`:

```php
<?php
session_start();
http_response_code(403); // Zet de HTTP status code naar 403
require 'header.php';
?>
<main style="text-align: center; padding: 60px 20px;">
    <h1 style="font-size: 120px; color: #e74c3c; margin: 0;">403</h1>
    <h2 style="color: #333;">Toegang Geweigerd</h2>
    <p style="color: #666; font-size: 18px;">
        Je hebt geen toestemming om deze pagina te bekijken.
    </p>
    <p style="color: #999; margin-top: 20px;">
        <?php if (isset($_SESSION['user_id'])): ?>
            Je bent ingelogd als <strong><?php echo htmlspecialchars($_SESSION['email'] ?? 'gebruiker'); ?></strong>
            <br>maar je hebt niet de juiste rechten voor deze actie.
        <?php else: ?>
            Je bent momenteel niet ingelogd.
        <?php endif; ?>
    </p>
    <div style="margin-top: 40px;">
        <?php if (isset($_SESSION['user_id'])): ?>
            <a href="index.php" class="btn">Terug naar Home</a>
        <?php else: ?>
            <a href="login.php" class="btn">Inloggen</a>
        <?php endif; ?>
    </div>
</main>
<?php require 'footer.php'; ?>
```

2. Test de pagina door direct naar `403.php` te navigeren in je browser.
3. Wat zie je?

### Opdracht 2: 404 Not Found Error Page

1. Maak een nieuw bestand aan genaamd `404.php`:

```php
<?php
session_start();
http_response_code(404); // Zet de HTTP status code naar 404
require 'header.php';
?>
<main style="text-align: center; padding: 60px 20px;">
    <h1 style="font-size: 120px; color: #3498db; margin: 0;">404</h1>
    <h2 style="color: #333;">Pagina Niet Gevonden</h2>
    <p style="color: #666; font-size: 18px;">
        De pagina die je zoekt bestaat niet (meer).
    </p>
    <p style="color: #999; margin-top: 20px;">
        Mogelijk is de link verouderd of is de pagina verwijderd.
    </p>
    <div style="margin-top: 40px;">
        <a href="index.php" class="btn">Terug naar Home</a>
        <a href="tools_index.php" class="btn">Bekijk Tools</a>
    </div>
</main>
<?php require 'footer.php'; ?>
```

2. Test de pagina door direct naar `404.php` te navigeren.

### Opdracht 3: Gebruik Error Pages in je Applicatie

Nu gaan we de bestaande error handling vervangen door redirects naar onze custom pages.

1. **Vervang in `tools_delete.php`** de oude error messages:

```php
// OUD:
if (!isset($_SESSION['user_id'])) {
    echo "You are not logged in, please login. ";
    echo "<a href='login.php'>Login here</a>";
    exit;
}

if ($_SESSION['role'] != 'administrator') {
    echo "You are not allowed to view this page, please login as admin";
    exit;
}

// NIEUW:
if (!isset($_SESSION['user_id'])) {
    header('Location: 403.php');
    exit;
}

if ($_SESSION['role'] != 'administrator') {
    header('Location: 403.php');
    exit;
}
```

2. Test de code:
   - Probeer `tools_delete.php` te bezoeken zonder ingelogd te zijn
   - Wat gebeurt er?

### Opdracht 4: Vervang Error Messages in tools_index.php

1. **Vervang in `tools_index.php`** de error messages:

```php
// OUD:
if (!isset($_SESSION['user_id'])) {
    echo "You are not logged in, please login. ";
    echo "<a href='login.php'>Login here</a>";
    exit;
}

if ($_SESSION['role'] != 'administrator') {
    echo "You are not allowed to view this page, please login as admin";
    exit;
}

// NIEUW:
if (!isset($_SESSION['user_id'])) {
    header('Location: 403.php');
    exit;
}

if ($_SESSION['role'] != 'administrator') {
    header('Location: 403.php');
    exit;
}
```

2. Test de code:
   - Probeer `tools_index.php` te bezoeken zonder ingelogd te zijn
   - Probeer `tools_index.php` te bezoeken als normale user (niet admin)

### Opdracht 5: 404 Voor Niet-Bestaande Records

We kunnen ook een 404 tonen als een tool niet gevonden wordt in de database.

1. **Pas `tools_detail.php` aan:**

```php
<?php
session_start();
require 'database.php';

// Controleer of id meegegeven is
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    header('Location: 404.php');
    exit;
}

$id = (int)$_GET['id'];

$stmt = $conn->prepare("SELECT * FROM tools WHERE tool_id = :id AND deleted_at IS NULL");
$stmt->execute(['id' => $id]);
$tool = $stmt->fetch(PDO::FETCH_ASSOC);

// Als tool niet bestaat, toon 404
if (!$tool) {
    header('Location: 404.php');
    exit;
}

require 'header.php';
?>
<main>
    <h1><?php echo htmlspecialchars($tool['tool_name']); ?></h1>
    <!-- Rest van de pagina -->
</main>
<?php require 'footer.php'; ?>
```

2. **Test de code:**
   - Ga naar `tools_detail.php?id=999999` (niet-bestaand ID) → Wat zie je?
   - Ga naar `tools_detail.php?id=abc` (ongeldige waarde) → Wat zie je?
   - Ga naar een bestaande tool → Werkt de pagina nog steeds?

### Opdracht 6: Styling Verbeteren

1. Voeg CSS toe aan `style.css` voor betere error pages:

```css
/* Error Pages */
.error-page {
    text-align: center;
    padding: 60px 20px;
    min-height: 60vh;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

.error-code {
    font-size: 120px;
    font-weight: bold;
    margin: 0;
    line-height: 1;
}

.error-403 .error-code {
    color: #e74c3c;
}

.error-404 .error-code {
    color: #3498db;
}

.error-page h2 {
    color: #333;
    margin: 20px 0 10px;
    font-size: 28px;
}

.error-page p {
    color: #666;
    font-size: 18px;
    margin: 10px 0;
    max-width: 600px;
}

.error-page .btn {
    margin: 10px 5px;
    display: inline-block;
}
```

2. Update `403.php` om de classes te gebruiken:

```php
<?php
session_start();
http_response_code(403);
require 'header.php';
?>
<main class="error-page error-403">
    <h1 class="error-code">403</h1>
    <h2>Toegang Geweigerd</h2>
    <p>Je hebt geen toestemming om deze pagina te bekijken.</p>
    <p>
        <?php if (isset($_SESSION['user_id'])): ?>
            Je bent ingelogd als <strong><?php echo htmlspecialchars($_SESSION['email'] ?? 'gebruiker'); ?></strong>
            <br>maar je hebt niet de juiste rechten voor deze actie.
        <?php else: ?>
            Je bent momenteel niet ingelogd.
        <?php endif; ?>
    </p>
    <div>
        <?php if (isset($_SESSION['user_id'])): ?>
            <a href="index.php" class="btn">Terug naar Home</a>
        <?php else: ?>
            <a href="login.php" class="btn">Inloggen</a>
        <?php endif; ?>
    </div>
</main>
<?php require 'footer.php'; ?>
```

3. Update `404.php` om de classes te gebruiken:

```php
<?php
session_start();
http_response_code(404);
require 'header.php';
?>
<main class="error-page error-404">
    <h1 class="error-code">404</h1>
    <h2>Pagina Niet Gevonden</h2>
    <p>De pagina die je zoekt bestaat niet (meer).</p>
    <p>Mogelijk is de link verouderd of is de pagina verwijderd.</p>
    <div>
        <a href="index.php" class="btn">Terug naar Home</a>
        <a href="tools_index.php" class="btn">Bekijk Tools</a>
    </div>
</main>
<?php require 'footer.php'; ?>
```

4. Test beide pagina's opnieuw. Zien ze er beter uit?

### Opdracht 7: Pas Alle Beschermde Pagina's Aan

1. Pas **alle beschermde pagina's** aan om de custom error pages te gebruiken in plaats van `echo` berichten:
   - `users_index.php`
   - `brands_index.php`
   - `categories_index.php` (als deze bestaat)
   - `tool_create.php`
   - `tool_update.php`

2. Vervang in al deze bestanden:
```php
// OUD:
if (!isset($_SESSION['user_id'])) {
    echo "You are not logged in, please login.";
    exit;
}

// NIEUW:
if (!isset($_SESSION['user_id'])) {
    header('Location: 403.php');
    exit;
}
```

3. Test alle pagina's:
   - Bezoek ze zonder ingelogd te zijn
   - Bezoek ze als normale user (niet admin)
   - Controleer of je correct naar `403.php` wordt doorverwezen

### Opdracht 8: Extra - 500 Internal Server Error

Maak een **500 Internal Server Error** pagina voor database fouten.

1. Maak een nieuw bestand `500.php`:

```php
<?php
session_start();
http_response_code(500);
require 'header.php';
?>
<main class="error-page" style="text-align: center;">
    <h1 style="font-size: 120px; color: #e67e22; margin: 0;">500</h1>
    <h2 style="color: #333;">Server Error</h2>
    <p style="color: #666; font-size: 18px;">
        Er is iets fout gegaan op de server.
    </p>
    <p style="color: #999;">
        Probeer het later opnieuw of neem contact op met de beheerder.
    </p>
    <div style="margin-top: 40px;">
        <a href="index.php" class="btn">Terug naar Home</a>
    </div>
</main>
<?php require 'footer.php'; ?>
```

2. Gebruik `try-catch` blokken om database errors op te vangen in `tools_detail.php`:

```php
<?php
session_start();
require 'database.php';

if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    header('Location: 404.php');
    exit;
}

$id = (int)$_GET['id'];

try {
    $stmt = $conn->prepare("SELECT * FROM tools WHERE tool_id = :id AND deleted_at IS NULL");
    $stmt->execute(['id' => $id]);
    $tool = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$tool) {
        header('Location: 404.php');
        exit;
    }
} catch (PDOException $e) {
    // Log de error (niet tonen aan gebruiker!)
    error_log("Database error: " . $e->getMessage());
    header('Location: 500.php');
    exit;
}

require 'header.php';
?>
<main>
    <h1><?php echo htmlspecialchars($tool['tool_name']); ?></h1>
    <!-- Rest van de pagina -->
</main>
<?php require 'footer.php'; ?>
```

3. Test door tijdelijk een foute query te maken (bijvoorbeeld een niet-bestaande kolom opvragen).

## Les 2 - Eindproject Voorbereiding

In deze les gaan we ons voorbereiden op het eindproject van Blok 5.

### Opdracht 9: Check je Skills

Ga door je eigen code heen en controleer of je de volgende technieken beheerst:

**Database & PDO:**
- [ ] PDO database connectie met error handling
- [ ] Prepared statements met placeholders (`:name`)
- [ ] Foreign key constraints
- [ ] JOIN queries

**Security:**
- [ ] `password_hash()` bij registratie
- [ ] `password_verify()` bij login
- [ ] `htmlspecialchars()` op alle output
- [ ] Input validatie op alle forms
- [ ] Session management met role checks

**CRUD Operaties:**
- [ ] CREATE met INSERT INTO
- [ ] READ met SELECT queries
- [ ] UPDATE met prepared statements
- [ ] Soft DELETE met `deleted_at`
- [ ] Restore functionaliteit

**User Experience:**
- [ ] AJAX calls met fetch()
- [ ] JSON data uitwisseling
- [ ] Filtering met GET parameters
- [ ] Custom error pages (403, 404)
- [ ] Success/error messages

### Opdracht 10: Verbeter je Code

1. Ga door je code en verbeter de volgende punten:
   - Zijn alle queries prepared statements?
   - Gebruik je overal `htmlspecialchars()`?
   - Hebben alle beschermde pagina's session checks?
   - Zijn alle error messages vervangen door custom pages?

2. Test alle functionaliteit:
   - Kan je inloggen?
   - Kan je tools toevoegen/wijzigen/verwijderen?
   - Werkt de AJAX winkelwagen?
   - Werken de filters?
   - Werken de error pages?

### Opdracht 11: Code Review Checklist

Gebruik deze checklist voor je eindproject:

**Bestandsstructuur:**
- [ ] Logische naamgeving (tool_create.php, tool_create_process.php)
- [ ] Gescheiden view en process bestanden
- [ ] Header/footer includes gebruikt
- [ ] Database connectie in apart bestand

**Code Kwaliteit:**
- [ ] Geen dubbele code (DRY principe)
- [ ] Consistente indentatie
- [ ] Duidelijke variabele namen
- [ ] Comments bij complexe code

**Security:**
- [ ] Alle wachtwoorden gehashed
- [ ] Alle queries prepared statements
- [ ] Alle output escaped met htmlspecialchars()
- [ ] Alle beschermde pagina's hebben session checks
- [ ] Input validatie op alle forms

**Functionaliteit:**
- [ ] CRUD operaties werken allemaal
- [ ] Soft delete met restore functionaliteit
- [ ] AJAX implementatie zonder page reload
- [ ] Filtering werkt correct
- [ ] Custom error pages worden getoond

Je bent nu klaar voor het eindproject! 🎉