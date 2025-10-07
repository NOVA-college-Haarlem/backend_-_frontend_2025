# Blok 5

## Week 2

### Verder met fixen van de code

#### Opdracht 1

1. Ga verder met het verbeteren van de code door overal pdo te gebruiken.
2. Controleer of de code werkt.

### htmlspecialchars

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

### Validatie

In deze les gaan we validatie toevoegen aan de applicatie van tools4ever.

Validatie is een belangrijk onderdeel van elke webapplicatie. Het is de proces van het controleren of de ingevoerde data voldoet aan de vereisten die we hebben gedefinieerd.

Validatie wordt gebruikt om te voorkomen dat ongeldige data in de database wordt opgeslagen. Dit helpt bij het verbeteren van de data kwaliteit en de betrouwbaarheid van de applicatie.

We hebben al een aantal validaties toegepast in de vorige les of er staan ook al validaties in de code. We gaan deze validaties nu verbeteren.

> - Wat gebeurt er bijvoorbeeld als je geen naam invult?
> - Wat gebeurt als je geen prijs invult?

#### Opdracht 6
1. Open het bestand `tool_create_process.php` en kijk naar de code.
2. Waar in de code wordt de data gevalideerd?
3. Wat gebeurt er als de data niet voldoet aan de vereisten? Bedenk zelf een paar eisen.
4. Pas de code aan zodat de data voldoet aan de vereisten.

### Update

#### Opdracht 7

1. Binnen de applicatie van tools4ever gaan we de data updaten.
2. Als je naar tools_index.php gaat dan zie je een tabel met tool data, de link wijzig werkt nog niet.
3. Fix de link wijzig en stuur de gebruiker naar het bestand `tool_update.php` met de tool_id.
4. We maken een nieuw bestand aan genaamd `tool_update.php`, 
5. Include de connectie met de database.
6. We maken een query om de data uit de database te halen.
7. Toon de data in een formulier, deze moet een POST request verstuurd naar de server naar het bestand `tool_update_process.php`
8. We maken een nieuw bestand aan genaamd `tool_update_process.php`
9. Include de connectie met de database.
10. We zorgen ervoor dat ook hier de data wordt gevalideerd.
11. Maak een query om de data uit de database te updaten.
12. Redirect naar de tool_index.php pagina.
13. Test de code.


#### Opdracht 9

1. Maak nu een update mogelijkheid voor brands, users en categories.

### Hashing

In deze les gaan we hashing toevoegen aan de applicatie van tools4ever.
Hashing is een proces waarbij een willekeurige tekst wordt omgezet in een unieke tekst. Deze tekst is onomkeerbaar en uniek.
Hashing wordt gebruikt om wachtwoorden veilig op te slaan in de database.

#### Opdracht 10

1. Bij het registreren van een nieuwe gebruiker moeten we het wachtwoord hashen.
2. Bij het inloggen van een gebruiker moeten we het wachtwoord unhashen.

Dat gaan we regelen...





