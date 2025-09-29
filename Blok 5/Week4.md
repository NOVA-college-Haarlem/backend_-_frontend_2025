# Week 4


## Les 1 - Soft Delete

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
We gaan gebruik maken van de `ajax.php` pagina.

