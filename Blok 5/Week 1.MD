# Blok 5

## Week 1

Welkom terug.

Wij gaan verder met het project tools4ever. We gaan het project verder uitbouwen. Daarnaast gaan we veiliger programmeren door gebruik te maken van prepared statements om zo sql-injecties te voorkomen.
Je hebt tot dusver de volgende technieken toegepast met betrekking tot Create Read Update Delete (CRUD): create en read.
### Create
Met een POST-formulier kun je data bevragen aan de gebruiker. Daarbij controleer je de ingevoerde data om uiteindelijk met INSERT INTO data op te slaan in de database.
### Read
Met SELECT-query vraag je data op door gebruik te maken van een GET request en associatieve arrays kun je dynamisch data tonen op het scherm.
We gaan het project uitbreiden met Delete en Update.
### Delete
De delete query gebruiken we om een enkele rij uit de database te verwijderen op basis van de primary key van diezelfde rij. We gebruiken hiervoor een GET-request. Dit werkt bijna hetzelfde als het benaderen van een detail-pagina.
### Update
Met de Update query kunnen we bestaande records (rijen) wijzigen/updaten naar de correcte informatie. Hiervoor gebruiken we ten eerste een GET-request in combinatie met een SELECT WHERE statement om de juiste data op te halen (detail-pagina-techiek). En ten tweede gebruiken we een POST-request in combiniatie met de UPDATE WHERE query om het gewenste resultaat te behalen. 

We gaan tijdens dit blok verder met het project Tools4ever. Dit project kun je forken en clonen vanaf github: https://github.com/NOVA-college-Haarlem//toolsforever-blok4/

In de vorige twee periodes hebben we gebruik gemaakt van eenvoudige functies om de queries uit te voeren. Echter zijn deze functies niet veilig genoeg. Deze manier van coderen met PHP kan leiden tot SQL-injecties met grote negatieve gevolgen. Dit jaar introduceren we een andere wijze van connectie maken met de database en daardoor een iets andere schrijfwijze. We gaan gebruik maken van een object binnen php genaamd pdo.
Om het probleem met sql injecties te demonstreren volgt hieronder een korte toelichting
### SQL INJECTIONS
Je hebt in het vorige blok geleerd om een sql statement in een variabele te zetten en deze variabele aan de functie mysqli_query() mee te geven:
 
Daarnaast heb je ook geleerd om een variabele te plaatsen in de string als je bijvoorbeeld 1 gebruiker wilt ophalen:
 
Een variabele direct plaatsen in een sql-statement is gevaarlijk. Het kan namelijk misbruikt worden door een andere expert. Hij/zij kan namelijk de gegevens zo aanpassen dat er andere gegevens opgehaald worden of verwijderd. Of zelfs de gehele database kan verwijderd worden. Dit noemen ze ook wel SQL-Injections. Het injecteren van sql. Eerst volgt nu een uitleg over hoe je een sql-injection uitvoert. En daarna hoe je je code zo aanpast dat het niet meer mogelijk is, met behulp van prepared statements
### OPDRACHT 51: SQL-INJECTIE
1.	Voer de onderstaande opdracht uit in het inlogscherm van je eerder gemaakte project
Probeer maar eens met een van je eerder gemaakte projecten waarin een inlog-functionaliteit gebouwd is…
 
Een van de volgende waardes in te vullen in het email scherm:
' or 1=1;#	" or ""="	" or ""="
Als je dat gedaan hebt dan wordt je sql-statement als volgt:
 
Wat staat er nu eigenlijk? Alles van een de gebruikers tabel selecteren waar het email adres leeg is OF waar 1 gelijk is aan 1. En dat is TRUE dus…. Inloggen maar!!! 
Dit doe je dus allemaal op de client side, in het formulier. Dit betekent dat ook andere mensen dit kunnen uitvoeren. Dus een onveilige applicatie.

Om dit te voorkomen dien je gebruik te maken van prepared statements

### PREPARED STATEMENTS 

Met prepared statements stoppen we geen variabelen in een string. We werken met tijdelijke placeholders.

Maar eerst maken we een database connectie. Dit gaat op een andere wijze, we maken nu gebruik van PDO (een ander type databaseconnectie):

```php
<?php
$dbhost = 'localhost';
$dbname = 'tools4ever';
$dbuser = 'root';
$dbpass = '';
$conn = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);
?>
```
In onderstaande code willen we een hotelgast opslaan, daarvoor gebruiken we INSERT INTO. Maar nu stoppen we geen variabelen bij VALUES maar placeholders. Let op de dubbele punten. Tevens gebruiken we de Prepare methode. Kortom, we bereiden de query eerst voor, voordat deze naar de database gestuurd wordt.

```php
<?php
$stmt = $conn->prepare("INSERT INTO hotelgasten (name, email, phone) VALUES (:name, :email, :phone)");

$stmt->execute(['name' => 'John Doe', 'email' => 'john.doe@example.com', 'phone' => '1234567890']);
?>
```

> Vanaf nu gebruiken we alleen nog maar prepared statements om data op te halen, op te slaan, te verwerken en de verwijderen.

#### OPDRACHT 53: PAS DE QUERY AAN
1.	Pas de query aan die een enkele tool ophaalt binnen het project van tools4ever (tool_detail.php)
a.	Zorg ervoor dat je een placeholder gebruikt
2.	Gebruik bindParam om de juiste variabele te koppelen
3.	Voer de execute methode uit om de query uit te voeren.

Nu heb je dit:

```php
<?php

$id = $_GET['id'];
$stmt = $conn->prepare("SELECT * FROM tools WHERE tool_id = :id");
$stmt->bindParam(':id', $id);
$stmt->execute();
    $tool = $stmt->fetch(PDO::FETCH_ASSOC);
?>
```
Daarna halen we de data op en zetten deze om in een associatieve array:

```php
