# Hoofdstuk 5 - Zoeken

In deze les gaan we zoeken in de database en nog een keer filters aanbrengen. Omdat jullie dat wilde gaan we met het project Formula1-256 verder.

Dus open het project in VS Code en open de terminal. Run `docker compose up -d` om de database op te starten.

Dan open je de browser en ga naar `http://localhost:8000`.

### Opdracht 1 - Zoeken in de database

1. Maak een nieuw bestand aan genaamad search.php.
2. Voeg de volgende code toe:
    ```php
    <form action="search_process.php" method="GET">
        <label for="zoekterm">Zoek op naam</label>
        <input type="text" name="zoekterm" id="zoekterm" placeholder="Zoek op naam">
        <button type="submit">Zoek!</button>
    </form>
    ```
3. Maak een nieuw bestand aan genaamad search_process.php.
4. Voeg de volgende code toe:
    ```php
    <?php
    //validatie
    if(isset($_GET['zoekterm']) && !empty($_GET['zoekterm'])){
        
        $zoekterm = $_GET['zoekterm'];

        require 'database.php';
        $sql = "SELECT * FROM drivers WHERE name = '$zoekterm%'";
        $result = mysqli_query($conn, $sql);
        $drivers = mysqli_fetch_all($result, MYSQLI_ASSOC);

        foreach($drivers as $driver){
            echo $driver['forename'] . " " . $driver['surname'] . "<br>";
           
        }
       
    }
    else{
        echo "Voer een zoekterm in";
        exit;
    }
    ```

### Opdracht 2 - Zoeken op specifieke kolommen

1. We gaan search.php aanpassen zodat we per kolom kunnen zoeken.
2. Voeg de volgende code toe:
    ```php
  <form action="search_process.php" method="get">

    <input type="search" name="zoekterm" id="zoekterm">
    <div>
        <label for="voornaam">Voornaam</label>
        <input type="radio" name="soort" id="voornaam" value="voornaam">
    </div>
    <div>
        <label for="achternaam">Achternaam</label>
        <input type="radio" name="soort" id="achternaam" value="achternaam">
    </div>

    <button type="submit">Zoek!</button>
</form>
```

### Opdracht 3 - Search_process.php aanpassen
1. We gaan search_process.php aanpassen zodat we per kolom kunnen zoeken.
2. Voeg de volgende code toe:
 
```php
<?php
//valideren van het formulier
if(isset($_GET['zoekterm']) && !empty($_GET['zoekterm'])){

    if(isset($_GET['soort'])){
        $soort = $_GET['soort'];

        switch ($soort) {
            case 'voornaam':
                $soort = 'forename';
                break;
            case 'achternaam':
                $soort = 'surname';
                break;
            default:
                $soort = 'id';
                break;
        }
        $zoekterm = $_GET['zoekterm'];
        
        require 'database.php';
        
        $sql = "SELECT * FROM drivers WHERE $soort LIKE '$zoekterm%' ";
        $result = mysqli_query($conn, $sql);
        $drivers = mysqli_fetch_all($result, MYSQLI_ASSOC);
    }


    foreach($drivers as $driver):
        echo "<div>";
        echo $driver['forename'] . " " . $driver['surname'];

        echo "</div>";

    endforeach;

}
?>
```

### Opdracht 4 - Verbeterde validatie

1. Voeg minimum karakter lengte validatie toe (minimaal 2 karakters).
2. Voeg een check toe voor het aantal resultaten.
3. Toon een bericht wanneer er geen resultaten zijn.

```php
<?php
//validatie
if(isset($_GET['zoekterm']) && !empty($_GET['zoekterm'])){
    
    if(isset($_GET['soort'])){
        $soort = $_GET['soort'];

        switch ($soort) {
            case 'voornaam':
                $soort = 'forename';
                break;
            case 'achternaam':
                $soort = 'surname';
                break;
            default:
                $soort = 'id';
                break;
        }
    
    $zoekterm = trim($_GET['zoekterm']); // Verwijder spaties aan begin/einde
    
    // Minimum lengte check
    if(strlen($zoekterm) < 2){
        echo "Voer minimaal 2 karakters in";
        exit;
    }
    
    require 'database.php';
    
    // Zoek in zowel forename als surname
    $sql = "SELECT * FROM drivers 
            WHERE $soort LIKE '%$zoekterm%'"; 
    $result = mysqli_query($conn, $sql);
    $drivers = mysqli_fetch_all($result, MYSQLI_ASSOC);
    
    // Toon aantal resultaten
    $aantal = count($drivers);
    echo "<p>Aantal gevonden resultaten: $aantal</p>";
    
    if($aantal > 0){
        foreach($drivers as $driver){
            echo $driver['forename'] . " " . $driver['surname'] . "<br>";
        }
    } else {
        echo "<p>Geen resultaten gevonden voor: " . $zoekterm . "</p>";
    }
}
else{
    echo "Voer een zoekterm in";
    exit;
}
?>
```

### Opdracht 3 - Zoeken in meerdere velden

1. Breid de zoekfunctie uit zodat je ook kunt zoeken op:
   - Nationaliteit
   - Geboortedatum (jaar)
   - Constructor naam (als je een JOIN gebruikt)

```php
// Zoek in meerdere velden
$sql = "SELECT * 
        FROM drivers
        WHERE forename LIKE '%$zoekterm%' 
        OR surname LIKE '%$zoekterm%'
        OR nationality LIKE '%$zoekterm%'
        OR YEAR(dob) LIKE '%$zoekterm%'";
```

### Opdracht 4 - Sorteren van resultaten

1. Voeg een dropdown toe om te sorteren op:
   - Naam (A-Z)
   - Nationaliteit
   - Geboortedatum (oudste eerst)

```php
// In search.php, voeg een select dropdown toe:
<select name="sorteer">
    <option value="naam">Sorteer op naam</option>
    <option value="nationaliteit">Sorteer op nationaliteit</option>
    <option value="geboortedatum">Sorteer op geboortedatum</option>
</select>

// In search_process.php:
$sorteer = isset($_GET['sorteer']) ? $_GET['sorteer'] : 'naam';
$orderBy = '';

switch($sorteer){
    case 'naam':
        $orderBy = 'ORDER BY surname ASC, forename ASC';
        break;
    case 'nationaliteit':
        $orderBy = 'ORDER BY nationality ASC';
        break;
    case 'geboortedatum':
        $orderBy = 'ORDER BY dob ASC';
        break;
}

$sql = "SELECT * FROM drivers 
        WHERE forename LIKE '%$zoekterm%' 
        OR surname LIKE '%$zoekterm%' 
        $orderBy";
```

### Opdracht 6 - Highlighting van zoekterm

1. Markeer de gevonden zoekterm in de resultaten.

```php
function highlight($text, $zoekterm){
    return str_ireplace($zoekterm, "<mark>$zoekterm</mark>", $text);
}

foreach($drivers as $driver){
    $forename = highlight($driver['forename'], $zoekterm);
    $surname = highlight($driver['surname'], $zoekterm);
    echo $forename . " " . $surname . "<br>";
}
```

### Opdracht 7 - Betere HTML structuur

1. Verbeter de HTML output met een mooie tabel of card layout.

```php
if($aantal > 0){
    echo "<table border='1'>";
    echo "<tr><th>Voornaam</th><th>Achternaam</th><th>Nationaliteit</th><th>Geboortedatum</th></tr>";
    foreach($drivers as $driver){
        echo "<tr>";
        echo "<td>" . htmlspecialchars($driver['forename']) . "</td>";
        echo "<td>" . htmlspecialchars($driver['surname']) . "</td>";
        echo "<td>" . htmlspecialchars($driver['nationality']) . "</td>";
        echo "<td>" . htmlspecialchars($driver['dob']) . "</td>";
        echo "</tr>";
    }
    echo "</table>";
}
```

### Opdracht 8 - Zoekgeschiedenis (Optioneel)

1. Sla de laatste 5 zoektermen op in een sessie.
2. Toon deze als suggesties onder het zoekveld.

```php
session_start();

// Sla zoekterm op in sessie
if(!isset($_SESSION['zoekgeschiedenis'])){
    $_SESSION['zoekgeschiedenis'] = [];
}

if(!in_array($zoekterm, $_SESSION['zoekgeschiedenis'])){
    array_unshift($_SESSION['zoekgeschiedenis'], $zoekterm);
    $_SESSION['zoekgeschiedenis'] = array_slice($_SESSION['zoekgeschiedenis'], 0, 5);
}

// Toon zoekgeschiedenis
if(!empty($_SESSION['zoekgeschiedenis'])){
    echo "<p>Recente zoekopdrachten: ";
    foreach($_SESSION['zoekgeschiedenis'] as $historie){
        echo "<a href='?zoekterm=$historie'>$historie</a> ";
    }
    echo "</p>";
}
```

