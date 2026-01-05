# Hoofdstuk 4 - Soft Delete & AJAX

## Inhoudsopgave
- [Hoofdstuk 4 - Soft Delete \& AJAX](#hoofdstuk-4---soft-delete--ajax)
  - [Inhoudsopgave](#inhoudsopgave)
  - [Soft Delete](#soft-delete)
    - [Opdracht 1](#opdracht-1)
    - [Opdracht 2](#opdracht-2)
    - [Opdracht 3](#opdracht-3)
    - [Opdracht 4](#opdracht-4)
    - [Opdracht 5](#opdracht-5)
    - [Opdracht 6](#opdracht-6)
  - [Les 2 - AJAX](#les-2---ajax)
    - [Opdracht 1](#opdracht-1-1)
    - [Opdracht 2](#opdracht-2-1)
    - [Opdracht 3](#opdracht-3-1)
    - [Opdracht 4](#opdracht-4-1)
    - [Opdracht 5](#opdracht-5-1)

## Soft Delete

In deze les gaan we een soft delete toevoegen aan onze applicatie.

Wat is een soft delete?
Een soft delete is een manier om een record in de database te verwijderen zonder dat deze fysiek uit de database wordt verwijderd.
Het record blijft in de database maar wordt gemarkeerd als verwijderd.
We gaan een soft delete toevoegen aan onze applicatie.
We gaan gebruik maken van de `deleted_at` kolom in de tabel tools.


### Opdracht 1

1. We gaan de database aanpassen door de `tools` tabel aan te passen.
2. Open PHPMyAdmin en ga naar de `tools4ever` database.
3. Ga naar de `tools` tabel.
4. Klik op het tabblad SQL en voeg de volgende code toe:

```sql
ALTER TABLE tools ADD COLUMN deleted_at DATETIME NULL;
```

### Opdracht 2

1. We gaan de code aanpassen om de `deleted_at` kolom te gebruiken.
2. Open het bestand `tool_delete.php` en pas de code aan:
3. Voeg de volgende code toe:

```php
// In plaats van DELETE FROM tools
$stmt = $conn->prepare("UPDATE tools SET deleted_at = NOW() WHERE tool_id = :id");
$stmt->execute(['id' => $id]);
?>
```

### Opdracht 3

1. Maak nu een pagina waarin we alle soft deleted tools tonen in een tabel.
2. Maak een nieuw bestand aan genaamd `tools_deleted.php`.
3. Voeg de volgende code toe:

```php
$stmt = $conn->prepare("SELECT * FROM tools WHERE deleted_at IS NOT NULL");
$stmt->execute();
$tools = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
```

### Opdracht 4

1. Maak een link aan op de `tools_deleted.php` pagina die naar de `tools_deleted_restore.php` pagina verwijst.
2. Maak een nieuw bestand aan genaamd `tools_deleted_restore.php`.
3. Voeg de volgende code toe:

```php
$id = $_GET['id'];
$stmt = $conn->prepare("UPDATE tools SET deleted_at = NULL WHERE tool_id = :id");
$stmt->execute(['id' => $id]);
header('Location: tools_deleted.php');
exit();
?>
```

### Opdracht 5

1. Op de `tools_index.php` pagina moeten we nog aangeven dat we soft deleted tools ook tonen.
2. Voeg de volgende code toe:

```php
$stmt = $conn->prepare("SELECT * FROM tools WHERE deleted_at IS NOT NULL");
$stmt->execute();
$tools = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
```

### Opdracht 6

1. Maak nu ook soft deleted functionaliteit aan voor users.


## Les 2 - AJAX

In deze les gaan we AJAX toevoegen aan onze applicatie.

Wat is AJAX?
AJAX is een techniek waarmee we data kunnen ophalen van de server zonder dat de pagina helemaal opnieuw geladen wordt.
We gaan AJAX toevoegen aan onze applicatie.
We gaan gebruik maken van de `add_to_cart.php` pagina.


### Opdracht 1

1. Maar eerst gaan we een counter maken bij de winkelmand in `header.php`.
2. We vervangen de huidige code van winkelmand door de volgende code:
```html
 <li>
    <a href="">Winkelmand</a>
    <span class="cart-count">
        <?php echo $_SESSION['cart_count'] ?? 0 ?>
    </span>
</li>   
```

### Opdracht 2

1. Dan passen we de CSS nog aan in `style.css`
2. Voeg de volgende code toe:

```css
.cart-count {
  background: #e74c3c;
  color: #fff;
  border-radius: 50%;
  padding: 2px 8px;
  font-size: 0.9em;
  margin-left: 6px;
  font-weight: bold;
  vertical-align: middle;
}
```

### Opdracht 3
1. We gaan de `tools_detail.php` pagina aanpassen.
2. De huidige link moeten we aanpassen, we voegen een id-attribuut toe:
```html
<a href="add_to_cart.php?id=<?php echo $tool['tool_id']; ?>" class="btn" id="bestelBtn">Bestel</a>
```

### Opdracht 4

1. Dan voegen we Javascript toe aan de `tools_detail.php` pagina. Zet deze code onderaan `</main>`
2. Voeg de volgende code toe:

```javascript
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const bestelBtn = document.querySelector('#bestelBtn');//anchor tag
        const countSpan = document.querySelector('.cart-count');
        if (bestelBtn && countSpan) {
            bestelBtn.addEventListener('click', function(e) {
                e.preventDefault();
                let count = parseInt(countSpan.textContent, 10);
                countSpan.textContent = count + 1;

                // AJAX call naar de server maken
                fetch('add_to_cart.php', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        tool_id: <?php echo $tool['tool_id']; ?>
                    })
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        // eventueel extra feedback aan gebruiker
                        console.log(data)
                    } else {
                        alert('Er is iets misgegaan bij het toevoegen aan de winkelwagen.');
                    }
                })
                .catch(error => {
                    console.table('Serverfout: ' + error);
                });
            });
        }
    });
</script>
```

Zoals je ziet spreken we hier van een AJAX call. Dit is een call naar de server zonder dat de pagina helemaal opnieuw geladen wordt.
We sturen data in de vorm van een JSON object naar de server en specifiek naar de `add_to_cart.php` pagina. 
Deze pagina moeten we maken.

### Opdracht 5

1. Maak een nieuw bestand aan genaamd `add_to_cart.php`.
2. Voeg de volgende code toe:
```php
session_start();
require 'database.php';

header('Content-Type: application/json');//vertelt de browser dat we JSON teruggeven

// Lees de JSON body
$input = file_get_contents('php://input');//leest de JSON body
$data = json_decode($input, true);//decode de JSON body

if (!isset($_SESSION['user_id']) || !isset($data['tool_id'])) {
    echo json_encode(['success' => FALSE]);// geven aan de browser dat het NIET gelukt is
    exit;
}

$user_id = $_SESSION['user_id'];
$tool_id = $data['tool_id'];

// Voeg toe aan winkelwagen (of verhoog aantal)
$sql = "INSERT INTO cart (user_id, tool_id, quantity) VALUES (:user_id, :tool_id, 1)
        ON DUPLICATE KEY UPDATE quantity = quantity + 1";
$stmt = $conn->prepare($sql);
$stmt->execute(['user_id' => $user_id, 'tool_id' => $tool_id]);

$success = TRUE;
echo json_encode(['success' => $success]);//geven aan de browser dat het GELUKT is
```

Bij dit bestand zie je dat we een INSERT INTO query uitvoeren. We schrijven een record naar de cart tabel. Maar ook deze bestaat niet. We moeten deze dus eerst aanmaken. Gebruik de volgende code in het tabblad SQL van PHPMyAdmin:

```sql
CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tool_id` int(11) NOT NULL,
  `quantity` int(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `tool_id` (`tool_id`);

ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`tool_id`) REFERENCES `tools` (`tool_id`);
COMMIT;
```

We hebben nu een cart tabel aangemaakt. We hebben ook een FOREIGN KEY toegevoegd aan de user_id en tool_id kolommen.

> Als je alles goed hebt gedaan, zou je nu in de browser naar de `tools_detail.php` pagina moeten gaan en een tool kunnen toevoegen aan de winkelwagen. Controleer dit door ook in de database te kijken of de record in de cart tabel is toegevoegd.

