# Week 5

## Les 1 - Security

In deze les gaan we security toevoegen aan onze applicatie.

### Opdracht 1

1. Alleen ingelogde gebruikers mogen gebruik maken van de tools_delete.php pagina.
2. Bouw dit verder uit.


### Opdracht 2

1. Het bestand tools_delete.php is nog niet veilig. We moeten het aanpassen. We gaan __input validation__ toevoegen.
2. Voeg de volgende code toe:
```php
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    // Toon een foutmelding
    exit('Ongeldige ID');
}
$id = (int)$_GET['id'];
```

### Opdracht 3

1. We passen de een klein beetje de code aan.
2. Voeg de volgende code toe:
```php
$result = $stmt->execute(
        [':id' => $id]
);
```

### Opdracht 4
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

### Opdracht 5

1. Dan willen we dat geen gebruiker deze pagina kan benaderen die niet ingelogd is.
2. Voeg de volgende code toe:
```php
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}
```

### Opdracht 6

1. Eventueel kunnen we ook nog een __logboek__ toevoegen.
2. Voeg de volgende code toe:
```php
if ($result) {
    file_put_contents('delete.log', date('Y-m-d H:i:s') . " - Tool $id deleted by user {$_SESSION['user_id']}\n", FILE_APPEND);
}
```

## Les 2 - Filtering

### Opdracht 7

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

### Opdracht 8

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

### Opdracht 9

1. Dan gaan we de code aanpassen zodat de gebruiker op tools kan filteren.
2. Want als we nu op een filter klikken, dan gaat de gebruiker naar de tools_index.php pagina met een GET parameter.
3. Test de code in je browser.

### Opdracht 10

We gaan nu PHP code toevoegen aan de `tools_index.php` pagina zodat de gebruiker op tools kan filteren.

### Opdracht 11

1. We gaan eerst controlleren welke filter en value de gebruiker heeft gekozen.
2. Voeg de volgende code toe:
```php
if (isset($_GET['filter']) && isset($_GET['value'])) {
    $filter = $_GET['filter'];

    if($filter === 'brands'){
        $filter = 'brands.brand_name';
    }
    $value = $_GET['value'];
}
```

### Opdracht 12

1. We gaan nu de query aanpassen.
2. Voeg de volgende code toe:
```php  
// we hebben nu TWEE voorwaarden aan de WHERE clause toegevoegd. Bestudeer deze code zelf.
 $sql = "SELECT * FROM tools JOIN brands ON brands.brand_id = tools.tool_brand WHERE tools.deleted_at IS NULL AND $filter = :value";
$stmt = $conn->prepare($sql);
$stmt->execute(['value' => $value]);
$tools = $stmt->fetchAll(PDO::FETCH_ASSOC);
```

### Opdracht 13

1. Maak nu nog meer filters aan. Bijvoorbeeld voor een alle ander bekende brands.
2. Ga je een foreach gebruiken?