# Blok 5 - Hoofdstuk 1 - PDO en Prepared statements

## Inhoudsopgave

- [Blok 5 - Hoofdstuk 1 - PDO en Prepared statements](#blok-5---hoofdstuk-1---pdo-en-prepared-statements)
  - [Inhoudsopgave](#inhoudsopgave)
  - [C.R.U.D.](#crud)
    - [Create](#create)
    - [Read](#read)
    - [Delete](#delete)
    - [Update](#update)
  - [SQL INJECTIONS](#sql-injections)
      - [Opdracht 0 - project setup](#opdracht-0---project-setup)
    - [Opdracht 0.1 - Database](#opdracht-01---database)
      - [OPDRACHT 1: SQL-INJECTIE](#opdracht-1-sql-injectie)
  - [PREPARED STATEMENTS](#prepared-statements)
      - [OPDRACHT 2: DATABASE CONNECTIE aanpassen](#opdracht-2-database-connectie-aanpassen)
      - [Opdracht 3: PAS DE QUERY AAN: INDEX.PHP](#opdracht-3-pas-de-query-aan-indexphp)
      - [OPDRACHT 4: PAS DE QUERY AAN: Tool\_detail.php](#opdracht-4-pas-de-query-aan-tool_detailphp)
      - [Opdracht 5: PAS DE QUERIES AAN](#opdracht-5-pas-de-queries-aan)

Welkom terug.

Wij gaan starten met het project tools4ever. We gaan een bestaand project verder uitbouwen. Daarnaast gaan we veiliger programmeren door gebruik te maken van prepared statements om zo sql-injecties te voorkomen.
Je hebt tot dusver de volgende technieken toegepast met betrekking tot Create Read Update Delete (CRUD): create en read.

## C.R.U.D.

### Create
Met een POST-formulier kun je data bevragen aan de gebruiker. Daarbij controleer je de ingevoerde data om uiteindelijk met INSERT INTO data op te slaan in de database.

### Read
Met SELECT-query vraag je data op door gebruik te maken van een GET request en associatieve arrays kun je dynamisch data tonen op het scherm.

> **Deze periode We gaan het project uitbreiden met Delete en Update.**

### Delete
De delete query gebruiken we om een enkele rij uit de database te verwijderen op basis van de primary key van diezelfde rij. We gebruiken hiervoor een GET-request. Dit werkt bijna hetzelfde als het benaderen van een detail-pagina.

### Update
Met de Update query kunnen we bestaande records (rijen) wijzigen/updaten naar de correcte informatie. Hiervoor gebruiken we ten eerste een GET-request in combinatie met een SELECT WHERE statement om de juiste data op te halen (detail-pagina-techiek). En ten tweede gebruiken we een POST-request in combiniatie met de UPDATE WHERE query om het gewenste resultaat te behalen. 

We gaan tijdens dit blok  met het project Tools4ever aan de slag. Dit project kun je forken en clonen vanaf github: https://github.com/NOVA-college-Haarlem//toolsforever-blok4/

In de vorige twee periodes hebben we gebruik gemaakt van eenvoudige functies om de queries uit te voeren. Echter zijn deze functies niet veilig genoeg. Deze manier van coderen met PHP kan leiden tot SQL-injecties met grote negatieve gevolgen. Dit jaar introduceren we een andere wijze van connectie maken met de database en daardoor een iets andere schrijfwijze. We gaan gebruik maken van een object binnen php genaamd pdo.
Om het probleem met sql injecties te demonstreren volgt hieronder een korte toelichting

## SQL INJECTIONS
Je hebt in het vorige blok geleerd om een sql statement in een variabele te zetten en deze variabele aan de functie mysqli_query() mee te geven:
 
Daarnaast heb je ook geleerd om een variabele te plaatsen in de string als je bijvoorbeeld 1 gebruiker wilt ophalen:
 
Een variabele direct plaatsen in een sql-statement is gevaarlijk. Het kan namelijk misbruikt worden door een andere expert. Hij/zij kan namelijk de gegevens zo aanpassen dat er andere gegevens opgehaald worden of verwijderd. Of zelfs de gehele database kan verwijderd worden. Dit noemen ze ook wel SQL-Injections. Het injecteren van sql. Eerst volgt nu een uitleg over hoe je een sql-injection uitvoert. En daarna hoe je je code zo aanpast dat het niet meer mogelijk is, met behulp van prepared statements

#### OPDRACHT 1: SQL-INJECTIE
1. Log in met de volgende gegevens:
   - Email: admin@admin.com
   - Wachtwoord: admin
  Wat zie je? Je wordt via een REDIRECT naar de dashboard pagina gestuurd.
2. Log uit.
3.	Voer de onderstaande opdracht uit in het inlogscherm.
 
Vul bij het emailadres het volgende in:
`' or 1=1;# `
Als je dat gedaan hebt dan stuur je eigenlijk de volgende query naar de database:

> SELECT * FROM users WHERE email = '' or 1=1;# '
 
Wat staat er nu eigenlijk? Alles van een de gebruikers tabel selecteren waar het email adres leeg is OF waar 1 gelijk is aan 1. En dat is TRUE dus…. Inloggen maar!!! 

**Wat gebeurt er precies?**
- De query `1=1` is altijd waar (TRUE), waardoor de WHERE-voorwaarde altijd klopt
- Het `#` teken zorgt ervoor dat alles na dit teken als commentaar wordt gezien en genegeerd
- De database retourneert nu waarschijnlijk de eerste gebruiker uit de tabel (meestal de admin)
- Je kunt nu inloggen zonder het juiste wachtwoord te kennen!

**Waarom is dit gevaarlijk?**
Dit doe je dus allemaal op de client side, in het formulier. Dit betekent dat ook andere mensen dit kunnen uitvoeren. Dit betekent dat dit een onveilige applicatie is. Een aanvaller kan:
- Inloggen zonder geldige credentials
- Toegang krijgen tot gevoelige gegevens
- Mogelijk de hele database manipuleren of verwijderen

**Andere voorbeelden van SQL-injectie:**
- `' OR '1'='1` - Vergelijkbaar met bovenstaand voorbeeld
- `admin'--` - Logt in als admin (alles na -- wordt genegeerd)
- `' UNION SELECT * FROM users--` - Haalt alle gebruikersgegevens op

Om dit te voorkomen dien je gebruik te maken van **prepared statements**, zoals we in de volgende sectie zullen leren.

## PREPARED STATEMENTS 

Met prepared statements stoppen we geen variabelen in een string. We werken met tijdelijke placeholders.

#### OPDRACHT 2: DATABASE CONNECTIE aanpassen

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

In onderstaande code willen we een gereedschap opslaan, daarvoor gebruiken we INSERT INTO. Maar nu stoppen we geen variabelen bij VALUES maar placeholders. Let op de dubbele punten. Tevens gebruiken we de Prepare methode. Kortom, we bereiden de query eerst voor, voordat deze naar de database gestuurd wordt.

```php
<?php
$stmt = $conn->prepare("INSERT INTO tools (tool_name, tool_category, tool_price, tool_brand) VALUES (:tool_name, :tool_category, :tool_price, :tool_brand)");

$stmt->execute(['tool_name' => 'Hamer 2000', 'tool_category' => 'Hamers', 'tool_price' => '100', 'tool_brand' => 'Makita']);
?>
```

> VANAF NU gebruiken we alleen nog maar prepared statements om data op te halen, op te slaan, te verwerken en de verwijderen.

#### Opdracht 3: PAS DE QUERY AAN: INDEX.PHP

1. Op `index.php` passen we de query aan:
```php
<?php
$stmt = $conn->prepare("SELECT * FROM tools");
$stmt->execute();
$tools = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
```

> Let op de fetchAll methode voor het ophalen van alle data.

#### OPDRACHT 4: PAS DE QUERY AAN: Tool_detail.php
1.	Pas de query aan die een enkele tool ophaalt binnen het project van tools4ever (tool_detail.php). Zorg ervoor dat je een placeholder gebruikt
3.	Voer de execute methode uit om de query uit te voeren.

Dit doe je zo:

```php
<?php

$id = $_GET['id'];
$stmt = $conn->prepare("SELECT * FROM tools WHERE tool_id = :id");
$stmt->execute(['id' => $id]);
$tool = $stmt->fetch(PDO::FETCH_ASSOC);
?>
```
> Let op de fetch methode voor het ophalen van een enkele rij data

#### Opdracht 5: PAS DE QUERIES AAN

1. Bekijk nu de applicatie van tools4ever.
2. Op alle pagina's waar met de database wordt gewerkt moeten we de query aanpassen.
   - brands_index.php
   - login-process.php: Let op hier staat per ongeluk een extra database connectie. Deze moeten we verwijderen.
   - users_index.php
   - tools_index.php
3. Let op er staan een aantal fouten in de code. Fix deze fouten: 
   - Bij het inloggen als admin wordt de gebruiker niet geaccepteerd.

