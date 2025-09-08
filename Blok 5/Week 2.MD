# Blok 5

## Week 2

### Verder met fixen van de code

#### Opdracht 1

1. Ga verder met het verbeteren van de code door overal pdo te gebruiken.
2. Controleer of de code werkt.

#### Opdracht 2: Opslaan van gereedschap

1. Kun je het formulier gebruiken waarmee je gereedschap kunt opslaan?
2. Wat gebeurt er als je alleen een naam invult?
3. Wat gebeurt er als je alleen een merk invult?
4. Wat gebeurt er als je alleen een prijs invult?
5. Wat gebeurt er als je alleen een beschrijving invult?

### Update

1. Binnen de applicatie van tools4ever gaan we de data updaten.
2. Als je naar tools_index.php gaat dan zie je een tabel met tool data, de link wijzig werkt nog niet.
3. We maken een nieuw bestand aan genaamd `tool_update.php`, Dit bestand moet de huidige tool data tonen.
4. We maken een connectie met de database.
5. We maken een query om de data uit de database te halen.
6. We tonen de data in een formulier.
7. We zorgen ervoor dat het formulier een POST request verstuurd naar de server naar het bestand `tool_update_process.php`
8.  We maken een nieuw bestand aan genaamd `tool_update_process.php`
9.  We maken een connectie met de database.
10. We maken een query om de data uit de database te halen.
11. We tonen de data in een tabel.
12. We maken een nieuw bestand aan genaamd `tool_update_process.php`
13. We maken een POST request naar de server.

## htmlspecialchars

#### Opdracht 2

1. Test: Sla eens de volgende tool op met behulp van het formulier in `tool_create.php`

tool_name: <script>alert('Hacked');</script>

2. Wat gebeurt er?
3. We zien dat het script wordt uitgevoerd.
4. Dit is niet wat we willen.
5. We moeten de data die we op het scherm tonen van de gebruiker veilig maken.

#### Opdracht 3

1. Nog een voorbeeld waarom we het veiliger moeten maken
2. Stel iemand slaat wederom een nieuwe tool op met behulp van het formulier in `tool_create.php`
3. tool_name: <h1>Hamer van Jupiter</h1>
4. Test de code:
5. Wat zie je op de pagina?

Om dit te voorkomen kunnen we de data die we op het scherm tonen van de gebruiker veilig maken.

Dat doe je zo:

```php
$tool_name = htmlspecialchars($tool_name);
```
#### Opdracht 4

1. Doe de bovenstaande tool_names nog een keer en kijk of het nu wel goed werkt.
2. Pas daarna alle getoonde data aan zodat deze issues niet meer voorkomen.

#### Opdracht 5

1. Waar in de applicatie van tools4ever moeten we de data veilig maken?
2. Pas de code aan zodat de data veilig is.



