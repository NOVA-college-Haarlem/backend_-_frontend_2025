# Blok 5 - Hoofdstuk 2 - Veilige data

## Inhoudsopgave

- [Blok 5 - Hoofdstuk 2 - Veilige data](#blok-5---hoofdstuk-2---veilige-data)
  - [Inhoudsopgave](#inhoudsopgave)
  - [Code verbeteren](#code-verbeteren)
      - [Opdracht 1](#opdracht-1)
  - [Htmlspecialchars](#htmlspecialchars)
      - [Opdracht 2: HTMLspecialchars](#opdracht-2-htmlspecialchars)
      - [Opdracht 3](#opdracht-3)
  - [Validatie](#validatie)
      - [Opdracht 6](#opdracht-6)
  - [Hashing](#hashing)
      - [Opdracht 10](#opdracht-10)
      - [Opdracht 11](#opdracht-11)
      - [Opdracht 12](#opdracht-12)

## Code verbeteren

#### Opdracht 1

1. Ga verder met het verbeteren van de code door overal pdo te gebruiken.
2. Controleer of de code werkt door alle pagina's te testen

## Htmlspecialchars

Met de htmlspecialchars functie kunnen we de data die we op het scherm tonen van de gebruiker veilig maken.
Deze functie zorgt ervoor dat de data die we op het scherm tonen niet uitgevoerd wordt als code.

```php
echo htmlspecialchars($tool_name);
```

#### Opdracht 2: HTMLspecialchars

1. Maak via het create formulier een nieuwe tool aan met de volgende data:
   - tool_name: <h1>Hamer van Jupiter</h1>
   - tool_category: Hamers
   - tool_price: 100
   - tool_brand: Makita
2. Test de code:
3. Wat zie je op de pagina? We zien dat de data wel uitgevoerd wordt als code.

#### Opdracht 3

1. Pas overal in de code waar data wordt getoond de htmlspecialchars functie toe.

Bijvoorbeeld:
```php
echo htmlspecialchars($data['tool_name']);
echo htmlspecialchars($data['tool_category']);
echo htmlspecialchars($data['tool_price']);
echo htmlspecialchars($data['brand_name']);
```

## Validatie

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

## Hashing

In deze les gaan we hashing toevoegen aan de applicatie van tools4ever.
Hashing is een proces waarbij een willekeurige tekst wordt omgezet in een unieke tekst. Deze tekst is onomkeerbaar en uniek.
Hashing wordt gebruikt om wachtwoorden veilig op te slaan in de database.

#### Opdracht 10

1. Bij het registreren van een nieuwe gebruiker moeten we het wachtwoord hashen.
2. We passen de bestaande code aan zodat de wachtwoord wordt hashed.
3. Dit doen we in het bestand `user_add_process.php`.
4. Heb je de bestaande code al aangepast naar PDO? Heb je dat nog niet gedaan? Pas de code aan zie hieronder.
5. Test de code.

```php

//van mysqli naar PDO
$sql = "INSERT INTO users (email, password, firstname, lastname, role, address, city, is_active) VALUES ('$email', '$password', '$firstname', '$lastname', '$role', '$address', '$city', '$is_active')";
$result = mysqli_query($conn, $sql);

//naar...   
$stmt = $conn->prepare("INSERT INTO users (email, password, firstname, lastname, role, address, city, is_active) VALUES (:email, :password, :firstname, :lastname, :role, :address, :city, :is_active)");
$result = $stmt->execute(['email' => $email, 'password' => $password, 'firstname' => $firstname, 'lastname' => $lastname, 'role' => $role, 'address' => $address, 'city' => $city, 'is_active' => $is_active]);
//check if the query was successful
if($result){
    $stmt->lastInsertId();
    $backgroundColor = $_POST['backgroundColor'];
    $font = $_POST['font'];
    $sql = "INSERT INTO user_settings (user_id, backgroundColor, font) VALUES (:user_id, :backgroundColor, :font)";
    $result = $stmt->execute(['user_id' => $user_id, 'backgroundColor' => $backgroundColor, 'font' => $font]);
    if ($result) {
        header("Location: users_index.php");
}
```

Nu gaan we het wachtwoord hashen bij het registreren van een nieuwe gebruiker.

#### Opdracht 11

1. Wachtwoord hashen bij het registreren/aanmaken van een gebruiker.
2. Voeg onderstaande code toe aan het bestand `user_add_process.php`.

```php
//zet deze code net boven de query
$password = password_hash($password, PASSWORD_DEFAULT);
```
3. Test de code door een nieuwe gebruiker te registreren.

#### Opdracht 12

1. Wachtwoord unhashen bij het inloggen van een gebruiker.
2. Voeg onderstaande code toe aan het bestand `login_process.php`.
```php

$password = password_verify($passwordForm, $user['password']);

```
3. Daarnaast moeten we de if-statement aanpassen.
```php
if($password == $user['password']){ //deze code moet vervangen worden door de code hieronder
}

if(password_verify($passwordForm, $dbuser['password'])){
    session_start();
    //etc...
}
```








