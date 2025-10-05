# Week 5

## Les 1 - Security

In deze les gaan we security toevoegen aan onze applicatie.

### Opdracht 1

1. Het bestand tools_delete.php is nog niet veilig. We moeten het aanpassen. We gaan __input validation__ toevoegen.
2. Voeg de volgende code toe:
```php
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    // Toon een foutmelding
    exit('Ongeldige ID');
}
$id = (int)$_GET['id'];
```

### Opdracht 2

1. We passen de een klein beetje de code aan.
2. Voeg de volgende code toe:
```php
$result = $stmt->execute(
        [':id' => $id]
);
```

### Opdracht 3
3. Dan gaan we ook nog __error handling__ toevoegen.
4. Voeg de volgende code toe:
```php
if ($result) {
    // Succes: redirect naar de tools_index.php pagina
    header('Location: tools_index.php?deleted=1'); // we kunnen deze GET parameter gebruiken om een succes bericht te tonen
    exit;
} else {
    // Failure: toon een foutmelding
    echo 'Verwijderen mislukt. Probeer het opnieuw.';
}
```

### Opdracht 4

1. Dan willen we dat geen gebruiker deze pagina kan benaderen die niet ingelogd is.
2. Voeg de volgende code toe:
```php
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}
```

### Opdracht 5

1. Eventueel kunnen we ook nog een __logboek__ toevoegen.
2. Voeg de volgende code toe:
```php
if ($result) {
    file_put_contents('delete.log', date('Y-m-d H:i:s') . " - Tool $id deleted by user {$_SESSION['user_id']}\n", FILE_APPEND);
}
```

### Opdracht 6

1. Filtering toevoegen.
2. Op de pagina tools_index.php gaan we filters aanbrengen zodat de gebruiker op tools kan filteren.
3. Voeg de volgende code toe aan `<main>`:
```html
<aside>
    <h2>Filters</h2>
    <ul>
        <li><a href="tools_index.php?filter=brand&value=makita">makita</a></li>
    </ul>
</aside>
```
4. Daarnaast moeten we ook een class toevoegen aan `<main>`: `class="table"`

### Opdracht 7

1. Nu gaan we de CSS aanpassen.
2. Voeg de volgende code toe:
```css
.table {
  display: flex;
  flex-direction: row;
}

.table aside {
  display: flex;
  justify-content: start;
  width: 12%;
  height: 100vh;
  flex-direction: column;
}

.table aside h2 {
  font-size: 14px;
}

```

### Opdracht 7

1. Dan gaan we de code aanpassen zodat de gebruiker op tools kan filteren.
2. Want als we nu op een filter klikken, dan gaat de gebruiker naar de tools_index.php pagina met een GET parameter.
3. Test de code in je browser.

### Opdracht 8