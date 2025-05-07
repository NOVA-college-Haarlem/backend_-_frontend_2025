# Week 3

## Les 1 - Registreren

In de vorige les hebben we gewerkt met een database en hebben we gebruik gemaakt van een form om pokemon kaarten op te slaan. In deze les gaan we een nieuwe gebruiker registreren.

### Opdracht 1

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

### Opdracht 2

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

### Opdracht 3

1. Maak een nieuw bestand aan genaamd `user_create_process.php`
2. Schrijf hier code waarmee je de data uit het formulier kunt valideren.
   1. Controleer of de velden bestaan.
   2. Controleer of de velden niet leeg zijn.
   3. Controleer of de email een geldig email adres is.
   4. Controleer of de password minstens 8 karakters lang is.
3. Schrijf hier code waarmee je de data uit het formulier kunt halen en deze in de database kunt zetten.
4. Als een gebruiker succesvol is geregistreerd, wordt deze doorgestuurd naar de `users_create_thankyou.php` pagina.
5. Als een gebruiker niet succesvol is geregistreerd, wordt deze doorgestuurd naar de `users_create_error.php` pagina.

