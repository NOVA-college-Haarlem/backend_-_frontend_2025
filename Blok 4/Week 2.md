
# Blok 4

## Week 2

### Les 1 - Formulier

In deze week gaan we verder met de pokemon applicatie. We introduceren nu een nieuw type request: POST. Dit type request wordt gebruikt om data naar de server te sturen.
Om data naar de server te sturen hebben we een form nodig. Dit formulier gaan we nu maken.

#### Opdracht 1

1. Maak in de www folder een nieuw bestand aan genaamd `pokemon_create.php`
2. Maak een formulier aan dat een POST request verstuurt naar de server.

```html
<h1>Create new Pokemon</h1>
<form action="pokemon_create_process.php" method="POST">
    <input type="text" name="name" placeholder="Name">
    <input type="text" name="type" placeholder="Type">
    <input type="text" name="image" placeholder="Image">
    <button type="submit">Create new Pokemon</button>
</form>
```

We bestuderen dit formulieren. Wat zien we hier?

- de afbeelding is een input veld van het type text. Dit is niet correct. Dit gaan we later verbeteren.
- action: de url waar de data naartoe wordt verstuurd
- method: de methode waarmee de data naartoe wordt verstuurd
- input: de input velden waar de data in wordt ingevuld 
- attributen:
    - name: de naam van het input veld
    - placeholder: de placeholder van het input veld
    - type: het type van het input veld
    - value: de waarde van het input veld

De `name attribuut` is belangrijk. Deze wordt gebruikt om de data naar de server te sturen. 

#### Opdracht 2

1. Maak een nieuw bestand aan genaamd `pokemon_create_process.php`
2. Maak een POST request naar de server.

```php 
$name = $_POST['name'];
$type = $_POST['type'];
$image = $_POST['image'];

$query = "INSERT INTO cards (name, type, image) VALUES ('$name', '$type', '$image')";
$result = mysqli_query($conn, $query);

header('Location: index.php');
```

Wat zien we hier?

- We halen de data op uit de POST request array. Deze array is een associatieve array. De key is de `name` attribuut van het input veld.
- We voegen de data toe aan de database met een INSERT query.
- We redirecten naar de index pagina met een header functie.

#### Opdracht 3
1. Voer het aanmaken van een pokemon uit.
2. Kijk in de database of de data is toegevoegd.
3. Kijk in de browser of we naar de index pagina zijn gegaan.


#### Opdracht 4

1. Wat gebeurt er als we geen naam invullen?
2. Wat gebeurt er als we geen type invullen?
3. Wat gebeurt er als we geen afbeelding invullen?

#### Opdracht 5

1. Bekijk de database tabel eens. 
2. Welke attributen van een pokemon zijn niet verplicht om in te vullen?
3. Kun je deze attributen toevoegen aan het formulier?
4. Pas de code aan zodat ook deze attributen worden opgeslagen in de database.

## Les 2 - Validatie

We hebben nu een formulier dat data naar de server stuurt. Maar we hebben geen validatie. We gaan deze validatie nu toevoegen. We moeten controleren of de data die we versturen voldoet aan de vereisten. Dit doen we met behulp van PHP in het bestand `pokemon_create_process.php`.

Ten eerste moeten we controleren of de naam is ingevuld.

```php
if (empty($name)) {
    echo "Name is required";
    exit;
}
```

#### Opdracht 6

1. Controleer of de naam is ingevuld met behulp van een if statement.
2. Controleer of de type is ingevuld met behulp van een if statement.
3. Controleer of de afbeelding is ingevuld met behulp van een if statement.

Dan willen we ook nog controleren of de naam niet langer is dan 20 karakters.

```php
if (strlen($name) > 20) {
    echo "Name is too long";
    exit;
}
```

#### Opdracht 7

1. Controleer of de naam niet langer is dan 20 karakters met behulp van een if statement.
2. Controleer of de type niet langer is dan 20 karakters met behulp van een if statement.
3. Controleer of de afbeelding niet langer is dan 255 karakters met behulp van een if statement.

Dan willen we ook nog controleren of de afbeelding een geldige URL is.

```php
if (!filter_var($image, FILTER_VALIDATE_URL)) {
    echo "Invalid image URL";
    exit;
}
```

Dan willen we ook nog een voorwaarde toevoegen. We willen controleren of de naam minimaal 3 karakters is.

```php
if (strlen($name) < 3) {
    echo "Name is too short";
    exit;
}
```

#### Opdracht 8

Je hebt misschien ook gemerkt dat voor weight en height wij decimalen moeten gebruiken. Dit is onhandig in een text veld. We gaan deze dus laten zijn in een float veld.

1. Pas de code aan zodat weight en height floats zijn.
```php
$weight = floatval($_POST['weight']);
$height = floatval($_POST['height']);
```

#### Opdracht 9
Dan hebben we ook nog te maken met hitpoints (hp). Dit is een integer.

1. Pas de code aan zodat hp een integer is.
```php
$hp = intval($_POST['hp']);
```

2. Kun je dit ook aanpassen voor attack en defense?









