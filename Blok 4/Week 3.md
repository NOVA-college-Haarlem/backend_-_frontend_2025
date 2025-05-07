# Blok 4

## Week 3

### Les 1 - Registreren

In de vorige les hebben we gewerkt met een database en hebben we gebruik gemaakt van een form om pokemon kaarten op te slaan. In deze les gaan we een nieuwe gebruiker registreren.

#### Opdracht 1

1. Importeer het bestand `users.sql` in je database.
2. Controleer of de gebruikers correct zijn ingevoegd.
3. Zoals je kunt zien zijn volgende kolommen in de tabel `users`:
    - id
    - firstname
    - lastname
    - email
    - password
    - role
    - address
    - city
    - zipcode
    - phonenumber

#### Opdracht 2

1. Maak een nieuw bestand aan genaamd `user_create.php`
2. Maak in dit bestand een form aan voor het registreren van een nieuwe gebruiker.
3. Gebruik de volgende velden:
    - firstname
    - lastname
    - email
    - password
    - role
    - address
    - city
    - zipcode
    - phonenumber
4. Zorg ervoor dat de gebruiker weet welke velden hij moet invullen.
5. Zorg ervoor dat de `name`-attributen dezelfde namen hebben als de kolommen in de tabel `users`.

#### Opdracht 3

1. Maak een nieuw bestand aan genaamd `user_create_process.php`
2. Schrijf hier code waarmee je de data uit het formulier kunt valideren.
   1. Controleer of de velden bestaan.
   2. Controleer of de velden niet leeg zijn.
   3. Controleer of de email een geldig email adres is.
   4. Controleer of de password minstens 8 karakters lang is.
3. Schrijf hier code waarmee je de data uit het formulier kunt halen en deze in de database kunt zetten.
4. Als een gebruiker succesvol is geregistreerd, wordt deze doorgestuurd naar de `users_create_thankyou.php` pagina.
5. Als een gebruiker niet succesvol is geregistreerd, wordt deze doorgestuurd naar de `users_create_error.php` pagina.

### Les 2 - Login

In deze les gaan we een login functionaliteit toevoegen aan onze website.

Een login functionaliteit bestaat uit twee delen:
1. Een login formulier.
2. Een login proces.

#### Opdracht 1

1. Maak een nieuw bestand aan genaamd `login.php`
2. Maak in dit bestand een form aan voor het inloggen van een gebruiker.
3. Gebruik de volgende velden:
    - email
    - password
4. Zorg ervoor dat de gebruiker weet welke velden hij moet invullen.
5. Zorg ervoor dat de `name`-attributen dezelfde namen hebben als de kolommen in de tabel `users`.

#### Opdracht 2

1. Maak een nieuw bestand aan genaamd `login_process.php`
2. Schrijf hier code waarmee je de data uit het formulier kunt valideren.   
3. Controleer of de email bestaat in de database.
4. Controleer of de password correct is.
5. Als de gebruiker correct is ingelogd, wordt deze doorgestuurd naar de `dashboard.php` pagina.
6. Als de gebruiker niet correct is ingelogd, wordt deze doorgestuurd naar de `login.php` pagina.


#### Opdracht 3

1. We zetten voor nu op dashboard.php de volgende code:

```php
<h1>Dashboard</h1>
<p>Je bent ingelogd.</p>
```

2. Maar stel nou dat iemand deze URL probeert te openen zonder ingelogd te zijn. Op dit moment kan elke gebruiker naar dashboard.php gaan. Uiteraard is dit niet de bedoeling.
3. Dit zullen we in de volgende les oplossen.

#### Opdracht 3
Parameters aanbrengen in de URL

Als het inloggen mislukt, willen we de gebruiker terugsturen naar de `login.php` pagina met een error message.

We kunnen hiervoor parameters toevoegen aan de URL.

1. Voeg een parameter `error` toe aan de URL.
2. Als het inloggen mislukt, wordt deze parameter toegevoegd aan de URL.
3. We kunnen deze parameter gebruiken om een error message te tonen.
4. Dit doen we door te controlleren of de parameter `error` bestaat.
5. Als de parameter bestaat, wordt deze erbij getoond.  


