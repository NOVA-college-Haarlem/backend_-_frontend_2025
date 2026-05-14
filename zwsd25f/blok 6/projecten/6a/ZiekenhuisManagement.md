# Project 5: Ziekenhuis Management

## Introductie

Het lokale ziekenhuis wil graag een applicatie om hun patiënten, afspraken, dokters en afdelingen te kunnen beheren. Daarnaast willen ze dat patiënten eenvoudig hun afspraken kunnen bekijken en maken.

## Opdracht 1 - Laravel Project beginnen

1. Start een nieuw Laravel project in Laravel Herd.
2. Kies voor "No Starter Kit"
3. Noem het project "ziekenhuismanagement"
4. Testing Framework: Pest
5. Install Laravel Boost: Ja
6. Initialize a Git repository: Ja
7. ga naar http://ziekenhuismanagement.test



## Opdracht 3 - Database ontwerp

Dit zijn de gegevens die we gaan opslaan.
- users (standaard Laravel users-tabel)
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

## Userstories

### Requirements
- Zorg ervoor dat je seeders alle situaties (testdata) bevatten die je nodig hebt om onderstaande userstories te realiseren.
- Gebruik geen Laravel-code of features die nog niet in de les zijn behandeld.
- Gebruik ten minste 2 Blade-componenten in moderne syntax (bijvoorbeeld <x-layout> en <x-ui.card>).
- Neem basisstyling op via een centrale CSS-file die je in de layout laadt (geen Tailwind).
- Maak gerelateerde gegevens klikbaar: toon je bijvoorbeeld een categorie, gebruiker of locatie, dan link je door naar de bijbehorende detailpagina.
- Begin met de onderstaande stories; de stories uit "Later oppakken" komen in projectweek 6A nog niet aan bod.
- Maak per role eerst een overzichtspagina (index/read), en breid daarna pas uit met extra functionaliteit.
- Controleer na elke stap of je pagina's werken met je seeddata, zodat je problemen vroeg ontdekt.

#### Algemene gebruiker
- [ ] Als gebruiker wil ik een navigatiemenu zien met links naar alle entiteiten zodat ik snel door de applicatie kan navigeren.
- [ ] Als gebruiker wil ik kunnen zien op welke pagina ik ben (actief menu-item) zodat ik altijd context heb.
- [ ] Als gebruiker wil ik op elke pagina een footer zien met projectnaam en klas/groep zodat de layout compleet en consistent is.
- [ ] Als gebruiker wil ik vanaf een overzicht naar een detailpagina kunnen klikken zodat ik meer informatie per item kan bekijken.
- [ ] Als gebruiker wil ik een duidelijke melding zien als er geen data is zodat ik begrijp waarom een lijst leeg is.
- [ ] Als gebruiker wil ik dat de applicatie goed leesbaar en bruikbaar is op mobiel.

#### Receptionist
- [ ] Als receptionist wil ik afspraken kunnen bekijken per dag zodat ik weet wat de planning is
- [ ] Als receptionist wil ik patiënt informatie kunnen opzoeken zodat ik hen snel kan helpen
- [ ] Als receptionist wil ik op de detailpagina van een patiënt alle afspraken van die patiënt zien zodat ik snel vervolgvragen kan beantwoorden

#### Patiënt
- [ ] Als patiënt wil ik mijn afspraken kunnen bekijken zodat ik weet wanneer ik moet komen
- [ ] Als patiënt wil ik beschikbare tijdslots kunnen zien zodat ik een afspraak kan maken
- [ ] Als patiënt wil ik mijn medische geschiedenis kunnen bekijken zodat ik geïnformeerd ben
- [ ] Als patiënt wil ik op de detailpagina van een afspraak de gekoppelde dokter zien zodat ik weet bij wie ik terecht kan

#### Dokter
- [ ] Als dokter wil ik mijn agenda kunnen bekijken zodat ik weet welke patiënten ik ga zien
- [ ] Als dokter wil ik patiënt informatie kunnen bekijken voordat een afspraak zodat ik me kan voorbereiden
- [ ] Als dokter wil ik op de detailpagina van een patiënt alle medische notities zien zodat ik een compleet beeld van de behandeling heb

#### Afdelings Manager
- [ ] Als manager wil ik alle afspraken van mijn afdeling kunnen zien zodat ik de workload kan monitoren
- [ ] Als manager wil ik patiënt statistieken kunnen bekijken zodat ik trends kan identificeren
- [ ] Als manager wil ik op de detailpagina van een afdeling alle dokters in die afdeling zien zodat ik de bezetting kan beoordelen

### Later oppakken (als formulieren en crud-operaties behandeld zijn)

#### Receptionist
- [ ] Als receptionist wil ik nieuwe patiënten kunnen registreren met naam, geboortedatum en contactgegevens zodat ze in het systeem staan
- [ ] Als receptionist wil ik afspraken kunnen inplannen met beschikbare dokters zodat patiënten geholpen kunnen worden

#### Patiënt
- [ ] Als patiënt wil ik contact informatie kunnen updaten zodat het ziekenhuis me kan bereiken

#### Dokter
- [ ] Als dokter wil ik behandeling notities kunnen toevoegen zodat de patiënt geschiedenis compleet is
- [ ] Als dokter wil ik mijn beschikbaarheid kunnen aangeven zodat receptie afspraken kan inplannen

#### Afdelings Manager
- [ ] Als manager wil ik dokter roosters kunnen beheren zodat er altijd voldoende dekking is