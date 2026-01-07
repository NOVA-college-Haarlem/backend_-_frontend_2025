# Week 5

## Les 1 - Security

In deze les gaan we security toevoegen aan onze applicatie.

### Opdracht 1

1. Alleen ingelogde gebruikers mogen gebruik maken van de tools_delete.php pagina.
2. Bouw dit verder uit met session checks.


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
