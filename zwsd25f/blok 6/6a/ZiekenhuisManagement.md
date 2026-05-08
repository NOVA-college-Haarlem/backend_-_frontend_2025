# Project 5: Ziekenhuis Management

## Introductie

Het lokale ziekenhuis wil graag een applicatie om hun patiënten, afspraken, dokters en afdelingen te kunnen beheren. Daarnaast willen ze dat patiënten eenvoudig hun afspraken kunnen bekijken en maken.

## Opdracht 1 - Laravel Project beginnen

1. Start een nieuw Laravel project in Laravel Herd.
2. Kies voor het gebruik van Laravel Breeze voor authenticatie
3. Noem het project "ziekenhuismanagement"
4. Kies Blade voor de frontend
5. Testing Framework: PHPUnit
6. Target location: _hoef je niet te kiezen_
7. ga naar http://ziekenhuismanagement.test

## Opdracht 2a - Database server/file opzetten

Standaard werkt Laravel met een SQLITE database. Dit is een eenvoudige database die in een enkele file staat.

Als je met PHPMyAdmin wilt werken dan moeten we eerst een Docker omgeving opzetten. In opdracht 2a en 2b zetten we deze omgeving op.

1. Open VS Code
2. Open je projecten folder (dus werk netjes volgens de eerdere afspraken/opdrachten)
3. Open een terminal
4. Clone deze repository: https://github.com/NOVA-college-Haarlem/mysql-phpmyadmin in de projecten folder
    - `git clone https://github.com/NOVA-college-Haarlem/mysql-phpmyadmin`
5. Open de map `mysql-phpmyadmin`
6. Open een terminal in deze map
7. Run `docker compose up -d`
8. Open een browser en ga naar http://localhost:8000
9. Je hebt nu toegang tot een MySQL database met een phpmyadmin interface.

## Opdracht 2b - Database connectie

1. Druk op Ctrl + P
2. Open .env file
3. Gebruik je liever mysql en phpmyadmin. Vul de correcte database connectie in. Zie regel 24 tm 29
```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3307
DB_DATABASE=ziekenhuismanagement
DB_USERNAME=root
DB_PASSWORD=password
```

## Userstories

### Receptionist
- [ ] Als receptionist wil ik nieuwe patiënten kunnen registreren met naam, geboortedatum en contactgegevens zodat ze in het systeem staan
- [ ] Als receptionist wil ik afspraken kunnen inplannen met beschikbare dokters zodat patiënten geholpen kunnen worden
- [ ] Als receptionist wil ik afspraken kunnen bekijken per dag zodat ik weet wat de planning is
- [ ] Als receptionist wil ik patiënt informatie kunnen opzoeken zodat ik hen snel kan helpen

### Patiënt
- [ ] Als patiënt wil ik mijn afspraken kunnen bekijken zodat ik weet wanneer ik moet komen
- [ ] Als patiënt wil ik beschikbare tijdslots kunnen zien zodat ik een afspraak kan maken
- [ ] Als patiënt wil ik mijn medische geschiedenis kunnen bekijken zodat ik geïnformeerd ben
- [ ] Als patiënt wil ik contact informatie kunnen updaten zodat het ziekenhuis me kan bereiken

### Dokter
- [ ] Als dokter wil ik mijn agenda kunnen bekijken zodat ik weet welke patiënten ik ga zien
- [ ] Als dokter wil ik patiënt informatie kunnen bekijken voordat een afspraak zodat ik me kan voorbereiden
- [ ] Als dokter wil ik behandeling notities kunnen toevoegen zodat de patiënt geschiedenis compleet is
- [ ] Als dokter wil ik mijn beschikbaarheid kunnen aangeven zodat receptie afspraken kan inplannen

### Afdelings Manager
- [ ] Als manager wil ik alle afspraken van mijn afdeling kunnen zien zodat ik de workload kan monitoren
- [ ] Als manager wil ik dokter roosters kunnen beheren zodat er altijd voldoende dekking is
- [ ] Als manager wil ik patiënt statistieken kunnen bekijken zodat ik trends kan identificeren

## Opdracht 3 - Database ontwerp

Dit zijn de gegevens die we gaan opslaan.
- users (Laravel Breeze)
- patients (naam, geboortedatum, contactgegevens)
- doctors (naam, specialisatie, afdeling)
- departments (naam, beschrijving)
- appointments (datum, tijd, status)
- medical_notes (datum, notities)

### Relaties

#### Users
Users ofwel gebruikers zijn receptionisten, dokters, afdelings managers of patiënten.

#### Patients
Een patiënt kan meerdere afspraken hebben.
Een patiënt kan meerdere medische notities hebben.

#### Doctors
Een dokter heeft één afdeling.
Een dokter kan meerdere afspraken hebben.
Een dokter kan meerdere medische notities schrijven.

#### Departments
Een afdeling kan meerdere dokters hebben.

#### Appointments
Een afspraak heeft één patiënt.
Een afspraak heeft één dokter.

#### Medical Notes
Een medische notitie heeft één patiënt.
Een medische notitie heeft één dokter.

## Opdracht 4 - Migrations maken

1. Maak via de `php artisan` commando de migrations aan. 
    > `php artisan make:migration create_patients_table`
2. Zorg ervoor dat je alle attributen uit je database ontwerp hebt meegenomen.
3. Controleer of de migrations zijn aangemaakt.
4. Laat je migrations door de docent goedkeuren.

## Opdracht 5 - Models maken

1. Maak via de `php artisan` commando de models aan. Deze zijn altijd in enkelvoud en in het Engels.
   > `php artisan make:model Patient`
2. Laat je models door de docent goedkeuren.

## Opdracht 6 - Seeding

1. Maak via de `php artisan` commando de seeders aan.
    > `php artisan make:seeder PatientsSeeder`
2. Zorg ervoor dat alle niet-verplichte kolommen zijn voorzien van een default waarde of een nullable waarde.
3. Probeer de database te seeden.
4. Laat je seeders door de docent goedkeuren.

## Opdracht 7 - Userstories maken

Realiseer de userstories.