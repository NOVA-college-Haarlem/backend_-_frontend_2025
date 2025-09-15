# Blok 5

## Week 3

### Hashing

In deze les gaan we hashing toevoegen aan de applicatie van tools4ever.
Hashing is een proces waarbij een willekeurige tekst wordt omgezet in een unieke tekst. Deze tekst is onomkeerbaar en uniek.
Hashing wordt gebruikt om wachtwoorden veilig op te slaan in de database.

#### Opdracht 10

1. Bij het registreren van een nieuwe gebruiker moeten we het wachtwoord hashen.
2. We passen de bestaande code aan zodat de wachtwoord wordt hashed.
3. Dit doen we in het bestand `user_add_process.php`.
4. Heb je de bestaande code al aangepast naar PDO? Niet? Pas de code aan zie hieronder.
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

Dat gaan we regelen...

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

### 1 to many






