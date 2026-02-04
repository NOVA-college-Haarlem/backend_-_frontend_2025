# Hoofdstuk 1 - Create en Validatie

In blok 3 hebben we PHP een introductie gedaan. We hebben gekeken naar:

- Variabelen
- Data types
- Arrays
- Associative arrays
- Conditionals
- Loops
- Ingebouwde PHP functies
- Database connectie
- Request Response Cycle

#### Opdracht 0 - project setup

In deze les gaan we verder met het project tools4ever. Dit is een project waarin we tools en brands tonen. Kijk naar de herhaling les van blok 3 voor meer informatie over het project.

### Opdracht 1

We gaan met behulp van een formulier een nieuwe tool aanmaken. De attributen die we moeten invullen zijn:
- naam (tool_name)
- brand (tool_brand)
- categorie (tool_category)
- prijs (tool_price)
- afbeelding (tool_image)

1. Maak het bestand `create_tool.php` in de www folder.
2. Maak een formulier aan dat een POST request verstuurt naar de server.
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
        label{
            width:140px;
            display: inline-block;
        }

        .form-group{
            margin:10px 0px;
        }

    </style>
</head>
<body>
    <h1>Maak tool</h1>
    <form action="create_tool_process.php" method="post">

        <div class="form-group">
            <label for="naam_tool">Naam tool</label>
            <input type="text" name="naam" id="naam_klas" placeholder="vb: zwsd25f ">
        </div>
        <div class="form-group">
            <label for="brand">Naam brand</label>
            <input type="text" name="lokaal" id="lokaal" placeholder="B222">
        </div>
             <div class="form-group">
            <label for="categorie">Categorie</label>
            <input type="text" name="categorie" id="categorie" placeholder="Konings">
        </div>
        <div class="form-group">
            <label for="prijs">Prijs</label>
            <input type="number" name="prijs" id="prijs" placeholder="20">
        </div>
        <div class="form-group">
            <label for="afbeelding">Afbeelding</label>
            <input type="text" name="afbeelding" id="afbeelding" placeholder="https://example.com/image.jpg">
        </div>

        <button type="submit">Maak klas</button>
    
 
    </form>
</body>
</html>
```

We bestuderen dit formulieren. Wat zien we hier?

- de afbeelding is een input veld van het type text. Dit is niet correct. Dit gaan we later verbeteren.
- action: de url waar de data naartoe wordt verstuurd
- method: de methode waarmee de data naartoe wordt verstuurd
- div: de div waar de input velden in worden geplaatst
- button: de knop waarmee de data naartoe wordt verstuurd

De `name attribuut` is belangrijk. Deze wordt gebruikt om de data naar de server te sturen. 

#### Opdracht 2

1. Maak een nieuw bestand aan genaamd `create_tool_process.php`

## Data validatie

In deze les gaan we de data validatie toevoegen aan het formulier. We willen controleren of de data die we versturen voldoet aan de vereisten. Dit doen we met behulp van PHP in het bestand `create_tool_process.php`.

Ten eerste moeten we controleren of de naam is ingevuld.

```php
if(empty($_POST['naam'])){
    echo "Naam tool is required";
    exit;
}
```

#### Opdracht 3

1. Controleer of de naam minimaal 3 karakters heeft
```php
if(strlen($_POST['naam'])  < 3){{
    echo "Naam tool is too short";
    exit;
}
```

#### Opdracht 4

1. Controleer of de naam van de brand langer is dan 3 karakters.

```php  
if( empty($_POST['brand']) && strlen($_POST['brand'] < 3) ){
        echo "brand veld moet volledig zijn";
        exit;
    }
``` 

#### Opdracht 5

1. Controleer of de prijs een getal is.
```php
if(  ! is_numeric($_POST['prijs'])   ){
    echo "prijs moet wel een getal zijn";
    exit;
}
```

#### Opdracht 6

1. Controleer of de prijs niet groter is dan 1000.
```php
if( $_POST['prijs'] > 1000  ){
    echo "prijs is te groot, de prijs moet kleiner zijn dan 1000";
    exit;
}
```

#### Opdracht 7

1. Controleer of de afbeelding een geldige URL is.
```php
if( !filter_var($_POST['afbeelding'], FILTER_VALIDATE_URL) ){
    echo "afbeelding moet wel een geldige URL zijn";
    exit;
}
``` 

#### Opdracht 8

1. Controleer of de afbeelding niet groter is dan 255 karakters.
```php
if( strlen($_POST['afbeelding']) > 255  ){
    echo "afbeelding moet wel kleiner zijn dan 255 karakters";
    exit;
}
```

Als bovenstaande controles succesvol zijn, dan kunnen we de data opslaan in de database.

```php
$naam = $_POST['naam'];
$brand = $_POST['brand'];
$categorie = $_POST['categorie'];
$prijs = $_POST['prijs'];
$afbeelding = $_POST['afbeelding'];

$query = "INSERT INTO tools (tool_name, tool_brand, tool_category, tool_price, tool_image) VALUES ('$naam', '$brand', '$categorie', '$prijs', '$afbeelding')";
$result = mysqli_query($conn, $query);

if($result){
    echo "Tool aangemaakt";
} else {
    echo "Tool niet aangemaakt";
}
```

of je stuurt de gebruiker naar de index pagina.

```php
if($result){
    header("location: tools_index.php");
    exit;
}
```
