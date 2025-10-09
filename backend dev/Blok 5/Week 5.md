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

Tot nu toe hebben we de volgende code in tools_delete.php:
```php
<?php
session_start();

if (!isset($_SESSION['user_id'])) {
    echo "You are not logged in, please login. ";
    echo "<a href='login.php'>Login here</a>";
    exit;
}

if ($_SESSION['role'] != 'administrator') {
    echo "You are not allowed to view this page, please login as admin";
    exit;
}   

if($_SERVER["REQUEST_METHOD"] != "GET"){
    echo "Huh? Wat doe je?";
    exit;
}




if(    isset($_GET['id'])   ){


    if ( !is_numeric($_GET['id'])) {
    // Toon een foutmelding
        exit('Ongeldige ID');
    }
    $id = (int)$_GET['id'];

    require 'database.php';

    $id = $_GET["id"];

    // $sql = "DELETE FROM tools WHERE tool_id = :id";


    $sql = "UPDATE tools SET deleted_at = NOW() WHERE tool_id = :id";

    $stmt = $conn->prepare($sql);

    $result = $stmt->execute([':id' => $id]);

    if($result){
        header("location: tools_index.php?deleted=success");
        exit;

    }

    header("Location: tools_index.php?deleted=failure");
    exit;
}   
```

En `tools_index.php` moet er nu als volgt uit zien:

```php
<?php
session_start();

if (!isset($_SESSION['user_id'])) {
    echo "You are not logged in, please login. ";
    echo "<a href='login.php'>Login here</a>";
    exit;
}

if ($_SESSION['role'] != 'administrator') {
    echo "You are not allowed to view this page, please login as admin";
    exit;
}



require 'database.php';

$sql = "SELECT * FROM tools JOIN brands ON brands.brand_id = tools.tool_brand WHERE tools.deleted_at IS NULL";
$stmt = $conn->prepare($sql);
$stmt->execute();
$tools = $stmt->fetchAll(PDO::FETCH_ASSOC);

if (isset($_GET['filter']) && isset($_GET['value'])) {
    $filter = $_GET['filter'];

    if($filter === 'brands'){
        $filter = 'brands.brand_name';
    }

    $value = $_GET['value'];

    if ($filter && $value) {
        $sql = "SELECT * FROM tools JOIN brands ON brands.brand_id = tools.tool_brand WHERE tools.deleted_at IS NULL AND $filter = :value";
        $stmt = $conn->prepare($sql);
        $stmt->execute(['value' => $value]);
        $tools = $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}

require 'header.php';
?>
<main class="table">

    <?php if(isset($_GET['deleted'])):?>
        <?php if($_GET['deleted'] == 'success'): ?>
            <div class="alert-box">
                Tool is verwijderd!
            </div>
        <?php endif; ?>
        
    <?php endif; ?>


    <aside>
        <h2>Filters</h2>
        <ul>
            <li><a href="tools_index.php?filter=brands&value=makita">makita</a></li>
        </ul>
    </aside>
    <table>
        <thead>
            <tr>
                <th>Naam</th>
                <th>Categorie</th>
                <th>Prijs</th>
                <th>Merk</th>
                <th>Acties</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($tools as $tool) : ?>
                <tr>
                    <td><?php echo htmlspecialchars( $tool['tool_name'] )    ?></td>
                    <td><?php echo htmlspecialchars($tool['tool_category']) ?></td>
                    <td><?php echo htmlspecialchars($tool['tool_price']) ?></td>
                    <td><?php echo htmlspecialchars($tool['brand_name']) ?></td>
                    <td>

                        <a href="tools_detail.php?id=<?php echo $tool['tool_id'] ?>">Bekijk</a>
                        <a href="tools_update.php?id=<?php echo $tool['tool_id'] ?>">Wijzig</a>
                        
                        


                        <!-- <a href="tools_edit.php?id=<?php echo $tool['tool_id'] ?>">Wijzig</a> -->
                        <a href="tools_delete.php?id=<?php echo $tool['tool_id'] ?>"
                        onclick="return confirm('weet je het zeker dat je deze tool wilt verwijderen?')"
                        >
                        Verwijder
                    </a> 
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</main>
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