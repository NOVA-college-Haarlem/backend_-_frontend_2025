### Data controleren

Nu kunnen we beginnen met het controleren van de data die de server ontvangt. Dit doen we door gebruik te maken van de [ingebouwde functies](#_Ingebouwde_PHP_functies).

We willen controleren op:

1. **Is de request een POST request / is er geen GET gebruikt?**
2. **Is er op de knop gedrukt / is het formulier opgestuurd?**
3. **Bestaan de verwachte keys uberhaubt / bestaan de door ons gecodeerde name-attributen?**
4. **Zijn de values niet leeg zijn / is er data ingevoerd?**

De vier controles worden hieronder uitgelegd.

**Is de request een POST request / is er geen GET gebruikt?**

Als een gebruiker via de url naar het bestand tools_create_process.php gaat, dan wordt dit gedaan via een GET request en dat moet **niet** mogelijk zijn. En dus moet het programma dus stoppen.

Door gebruik te maken van de superglobal array `$_SERVER` kunnen we controleren welk type request gebruikt is:

```php
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    // Stop het programma
    exit('Invalid request method');
}
```

Als we deze voorwaarde omdraaien door een uitroepteken te gebruiken in de voorwaarde en het programma dan laten stoppen dan hebben we goed werkende code:

Zie je het uitroepteken **!**

_Als er geen POST request wordt gebruikt dan moet het programma stoppen._

**Is er op de knop gedrukt / is het formulier opgestuurd?**

Je kunt controleren of de submit knop is ingedrukt door te checken of de submit key aanwezig is in de `$_POST` array:

```php
if (!isset($_POST['submit'])) {
    // Stop het programma
    exit('Form not submitted');
}
```

> zie uitroepteken!

**Bestaan de verwachte keys uberhaubt / bestaan de door ons gecodeerde name-attributen?**

Met de `isset()` functie kunnen we controleren of een variabelen bestaat. En ook of een key in een array bestaat.

Als geen van de keys aanwezig zijn dan moet het programma stoppen en dus zouden we dat ook zo kunnen opschrijven. Let op ALLE uitroeptekens en de _OR-tekens ( || )_ in onderstaande code.

```php
if (!isset($_POST['name']) || !isset($_POST['email']) || !isset($_POST['message'])) {
    // Stop het programma
    exit('Form fields missing');
}
```

**Zijn de values niet leeg zijn / is er data ingevoerd?**

Met de `empty()` functie kunnen we controleren of een variabele een waarde heeft, ofwel niet leeg is. Zie uitroepteken!

```php
if (empty($_POST['name']) || empty($_POST['email']) || empty($_POST['message'])) {
    // Stop het programma
    exit('Form fields empty');
}
```

Of per veld een if-statement met een voorwaarde:

Als het veld leeg is dan laten we aan de gebruiker weten wat er gebeurt:

````php
if (empty($_POST['name'])) {
    exit('Name field empty');
}

Als al deze if-statements doorlopen zijn (voorwaardes getest) dan gaan we werkelijk iets doen met de data.

We kunnen de `$_POST` array lezen en variabelen *vullen.*

```php
$name = $_POST['name'];
$email = $_POST['email'];
$message = $_POST['message'];
````

Als we de code dan combineren dan krijgen we dit:

    ```php
    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        exit('Invalid request method');
    }

    if (!isset($_POST['submit'])) {
        exit('Form not submitted');
    }

    if (!isset($_POST['name']) || !isset($_POST['email']) || !isset($_POST['message'])) {
        exit('Form fields missing');
    }

    if (empty($_POST['name']) || empty($_POST['email']) || empty($_POST['message'])) {
        exit('Form fields empty');
    }

    $name = $_POST['name'];
    $email = $_POST['email'];
    $message = $_POST['message'];
    ```

### Data opslaan

Nu we de data uit het formulier hebben gehaald gaan we deze opslaan in de database. We gebruiken hiervoor de SQL query `INSERT INTO`.

De query ziet er als volgt uit:

```sql
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...
```

We moeten de query nog wel dynamisch maken door de variabelen te gebruiken die we eerder hebben gevuld met de data uit het formulier.

```php
$sql = "INSERT INTO messages (name, email, message)
VALUES ('$name', '$email', '$message')";
```

De functie `mysqli_query()` geeft een boolean terug (return). Dus na het _runnen (uitvoeren)_ van de functie komt er een boolean uitgerold, dus een TRUE of een FALSE. Door deze in een if statement te zetten kunnen we de gebruiker later weten dat het opslaan gelukt is:

```php
if (mysqli_query($conn, $sql)) {
    echo 'Data saved successfully';
} else {
    echo 'Error saving data: ' . mysqli_error($conn);
}
```
