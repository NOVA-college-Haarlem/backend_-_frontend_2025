# Week 3

## Les 1 - Sessions

In deze les gaan we een session starten. Een session is een manier om data tussen de server en de client te bewaren. Dit is handig voor het inloggen van gebruikers.

### Opdracht 1

We schermen de pagina `dashboard.php` af. Dit kunnen we doen met de volgende code:

```php
session_start();

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit();
}
``` 

We controlleren of de user_id in de session array bestaat. Als deze niet bestaat, wordt de gebruiker doorgestuurd naar de `login.php` pagina.


### Opdracht 2

Hoe zorgen we er dan voor dat de gebruiker succesvol kan inloggen?

We hebben al een login formulier gemaakt in de vorige les. We hebben ook al een login proces gemaakt in de vorige les.

Tijdens het inloggen moeten we de gebruiker ID in de session zetten. Om de session array te gebruiken, moeten we de session starten. Alleen dan hebben we toegang tot de session array. Dit is net als $_GET en $_POST een superglobale variabele. Ook deze zijn altijd beschikbaar. 
Dit noemen we ook wel een superglobale associatieve array.

Dus op het moment dat de gebruiker succesvol is ingelogd, zetten we de gebruiker ID in de session array. Dit is na de controle van het wachtwoord en de email.

```php
session_start();
$_SESSION['user_id'] = $user['id'];
```

Als de sessie dan gestart is dan sturen we de gebruiker door naar de `dashboard.php` pagina.

```php
header('Location: dashboard.php');
exit();
```

Als je alles goed hebt gedaan, zou je nu na het inloggen naar de `dashboard.php` pagina moeten worden doorgestuurd. En nu mag je wel op dit dashboard zien dat je bent ingelogd.

#### Opdracht 3

Nu we succesvol ingelogd zijn, willen we de gebruiker kunnen laten uitloggen.

1. Maak een link aan die de gebruiker uitlogt: `<a href="logout.php">Uitloggen</a>
2. Maak een nieuw bestand aan genaamd `logout.php`
3. In dit bestand zetten we de session uit

```php
session_start(); //dit is nodig om de session te kunnen gebruiken
session_destroy(); //dit is nodig om de session te vernietigen
header('Location: login.php'); //dit is nodig om de gebruiker door te sturen naar de login pagina
exit(); //dit is nodig om de script te stoppen
```

Als je alles goed hebt gedaan, zou je nu na het uitloggen naar de `login.php` pagina moeten worden doorgestuurd.

#### Opdracht 4

We kunnen het dashboard iets persoonlijker maken.

1. We hebben al de gebruiker ID in de session zetten.
2. We kunnen deze gebruiker ID gebruiken om de gebruiker te selecteren uit de database.
3. We kunnen deze gebruiker gegevens in de session zetten.
4. We kunnen deze gebruiker gegevens in de database zetten.

## Les 2 - Dashboard data

In deze les gaan we de data uit de database halen en tonen op het dashboard.

### Opdracht 1











