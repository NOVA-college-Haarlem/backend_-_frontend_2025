# Blok 4

## Week 2

### Les 1 - Registreren

In de vorige les hebben we gewerkt met een database en hebben we gebruik gemaakt van een form om gereedschap (tool) op te slaan. In deze les gaan we een nieuwe gebruiker registreren.

#### Opdracht 1

1. Importeer het bestand `users.sql` in je database.
2. Controleer of de (3) gebruikers correct zijn ingevoegd.
3. Zoals je kunt zien heeft de tabel `users` de volgende kolommen:
    - id
    - email
    - password
    - firstname
    - lastname
    - address
    - city
    - is_active
    - role
4. In de tab "Structuur" (PhpMyAdmin) kun je van bovenstaande velden zien welke verplicht zijn en wat de maximumlengte is.


#### Opdracht 2

1. Maak een nieuw bestand aan genaamd `user_create.php`
2. Maak in dit bestand een form aan voor het registreren van een nieuwe gebruiker.
3. Gebruik de volgende velden:
    - firstname
    - lastname
    - email
    - password
    - address
    - city
    - is_active
    - role
4. Zorg ervoor dat de gebruiker weet welke velden verplicht ingevuld moeten worden (zet een sterretje bij het label).
5. Zorg ervoor dat de `name`-attributen dezelfde namen hebben als de kolommen in de tabel `users`.
6. Voor rol moeten we een selectieveld maken.
```html
<select name="role" id="role">
    <option value="administrator">Admin</option>
    <option value="teacher">Docent</option>
    <option value="student">Leerling</option>
</select>
```

#### Opdracht 3

1. Maak een nieuw bestand aan genaamd `user_create_process.php`
2. Schrijf hier code waarmee je de data uit het formulier kunt valideren.
   1. Controleer of de velden bestaan (`isset()`).
   2. Controleer of de velden niet leeg zijn (`empty()`).
   3. Controleer of de email een geldig email adres is.
   4. Controleer of de password minstens 8 karakters lang is.
3. Schrijf hier code waarmee je de data uit het formulier kunt halen en deze in de database kunt zetten.
4. Als een gebruiker succesvol is geregistreerd, wordt deze doorgestuurd naar de `users_create_thankyou.php` pagina.
5. Als een gebruiker niet succesvol is geregistreerd, wordt deze doorgestuurd naar de `users_create_error.php` pagina.
