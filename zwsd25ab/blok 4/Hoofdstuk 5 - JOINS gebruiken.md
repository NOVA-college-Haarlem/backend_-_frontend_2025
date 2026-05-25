# Hoofdstuk 5 - JOINS gebruiken

In deze les gaan we JOINS gebruiken om data uit meerdere tabellen tegelijk op te halen.

---

## Waarom een JOIN?

In onze database hebben we de tabel `users` en de tabel `usersettings`. De usersettings tabel bevat instellingen die horen bij een gebruiker, zoals een thema of taalvoorkeur. Elke rij in `usersettings` heeft een `user_id` die verwijst naar de `id` in de tabel `users`.

Als we nu een gebruikersinstellingen-pagina willen bouwen, hebben we informatie uit **beide** tabellen nodig: de naam uit `users` én de instellingen uit `usersettings`.

Met een **JOIN** koppelen we de twee tabellen aan elkaar op basis van een overeenkomende kolom.

```
users                          usersettings
+----+----------+----------+   +----+---------+-------+---------------------+
| id | firstname| lastname |   | id | user_id | backgroundColor | font      |
+----+----------+----------+   +----+---------+-------+---------------------+
|  1 | Jan      | de Vries |   |  1 |    1    | yellow          | "Georgia" |
|  2 | Sara     | Bakker   |   |  2 |    2    | pink            | "Arial"   |
+----+----------+----------+   +----+---------+-------+---------------------+
```

De kolom `usersettings.user_id` is de **foreign key** die verwijst naar `users.id` (de **primary key**).

---

#### Opdracht 1 - Gebruikers met hun instellingen tonen

We maken een overzichtspagina waarop we alle gebruikers tonen samen met hun instellingen.

1. Voer de SQL-code van `sql/user_settings.sql` uit in PhpMyAdmin.
2. Voer de volgende SQL-code uit:
    ```sql
    INSERT INTO `user_settings` (`user_id`, `backgroundColor`, `font`) VALUES
    (1, '#ffffff', 'Arial'),
    (2, '#f0f0f0', 'Verdana'),
    (3, '#e8e8e8', 'Georgia');
    ```
2. Maak een nieuw bestand aan genaamd `users_settings_overview.php`.
3. Voeg eerst de database connectie toe en haal de data op:

```php
<?php

require 'database.php';

$sql = "SELECT * FROM users
            LEFT JOIN usersettings
                ON users.id = usersettings.user_id";

$result = mysqli_query($conn, $sql);
$users = mysqli_fetch_all($result, MYSQLI_ASSOC);
```

Met `ON users.id = usersettings.user_id` vertellen we de database: *koppel de rijen waarbij de id van users overeenkomt met de user_id van usersettings.*

3. Toon de opgehaalde data in een HTML-pagina:

```php
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gebruikers & Instellingen</title>
</head>
<body>
    <h1>Gebruikersoverzicht</h1>

    <?php foreach($users as $user): ?>
        <div style="border: 1px solid #ccc; margin: 10px; padding: 10px;">
            <h2><?php echo $user['firstname'] . ' ' . $user['lastname']; ?></h2>
            <p>Email: <?php echo $user['email']; ?></p>
            <p>Backgroundcolor: <?php echo $user['backgroundColor']; ?></p>
            <p>Font: <?php echo $user['font']; ?></p>
        </div>
    <?php endforeach; ?>

</body>
</html>
```

> **Let op:** Als twee tabellen een kolom met dezelfde naam hebben (bijv. beide een `id` kolom), kan dat problemen geven. Gebruik dan specifieke kolomnamen in je SELECT:

```php
$sql = "SELECT users.id, users.firstname, users.lastname, users.email,
               usersettings.backgroundColor, usersettings.font
        FROM users
            LEFT JOIN usersettings
                ON users.id = usersettings.user_id";
```

---

#### Opdracht 2 - Profielpagina van de ingelogde gebruiker

Nu we weten hoe een JOIN werkt, gaan we dit toepassen op de ingelogde gebruiker. We willen een profielpagina maken waar de gebruiker zijn eigen gegevens én instellingen ziet.

1. Maak een nieuw bestand aan genaamd `profile.php`.
2. Zorg voor een sessie controle zodat alleen ingelogde gebruikers de pagina kunnen zien:

```php
<?php
require 'session_check.php';
require 'database.php';
```

3. Haal de gegevens van de ingelogde gebruiker op met een JOIN:

```php
$user_id = $_SESSION['user_id'];

$sql = "SELECT users.firstname, users.lastname, users.email,
               user_settings.backgroundColor, user_settings.font
        FROM users
            LEFT JOIN user_settings
                ON users.id = user_settings.user_id
        WHERE users.id = $user_id";

$result = mysqli_query($conn, $sql);
$user = mysqli_fetch_assoc($result);
```

4. Toon de gegevens op de pagina:

```php
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <title>Mijn profiel</title>
</head>
<body>
    <h1>Welkom, <?php echo $user['firstname']; ?>!</h1>

    <h2>Mijn gegevens</h2>
    <p>Naam: <?php echo $user['firstname'] . ' ' . $user['lastname']; ?></p>
    <p>Email: <?php echo $user['email']; ?></p>

    <h2>Mijn instellingen</h2>
    <p>Thema: <?php echo $user['backgroundColor']; ?></p>
    <p>Taal: <?php echo $user['font']; ?></p>
</body>
</html>
```

---

#### Opdracht 3 - Uitbreiding (voor als je klaar bent)

Voeg aan de profielpagina een tabel toe waarbij je alle gebruikers én hun instellingen netjes in rijen en kolommen toont. Gebruik de kennis uit opdracht 1.

De tabel moet de volgende kolommen bevatten:
- Naam
- Email
- Backgroundcolor
- Font

---

#### Opdracht 4 - Adresgegevens koppelen aan gebruikers

Breid je database en profielpagina uit met een extra tabel voor adresgegevens.

1. Maak een nieuwe tabel aan, bijvoorbeeld `address`.
2. Bepaal zelf welke velden deze tabel bevat, maar neem minimaal 4 adresvelden op.
3. Voeg een `user_id` kolom toe als foreign key naar `users.id`.
4. Voeg testdata toe voor meerdere gebruikers.
5. Pas `profile.php` aan zodat de adresgegevens van de ingelogde gebruiker zichtbaar worden.

Voorwaarden:
- Minimaal 4 zelfgekozen adresvelden.
- Een werkende relatie via een foreign key (vreemde sleutel) met de tabel `users`.
- De profielpagina toont zowel gebruikersgegevens, instellingen als adresgegevens.

Tip:
Gebruik een extra LEFT JOIN in je query op de profielpagina, bijvoorbeeld op basis van `users.id = address.user_id`.
