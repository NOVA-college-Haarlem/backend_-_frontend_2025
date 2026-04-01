# Laravel lesprogramma

## Inleiding

In dit lesprogramma leer je hoe je een website maakt met Laravel. Laravel is een PHP framework waarmee je snel en eenvoudig een website kan maken. Laravel is een van de populairste PHP frameworks en wordt veel gebruikt door professionele webdevelopers.

### Leerdoelen week 1

> - Ik kan Laravel Herd installeren op mijn computer.
> - Ik kan een Laravel project aanmaken met Laravel Herd.
> - Ik kan de homepage van mijn website aanpassen.
> - Ik kan Bootstrap CSS toevoegen aan mijn website.
> - Ik kan een nieuwe route en view toevoegen aan mijn website.
> - Ik kan een controller aanmaken in Laravel.
> - Ik kan de homepage van mijn website aanpassen met een controller.
> - Ik kan data doorgeven aan de view met een controller.

### Leerdoelen week 2

> - Ik kan een layout aanmaken in Laravel.
> - Ik kan een layout gebruiken in Laravel.
> - Ik kan een database aanmaken in Laravel.
> - Ik kan een tabel aanmaken in de database met een migratie.
> - Ik kan testgegevens invoegen in de database met een seeder.
> - Ik kan gegevens uit de database halen
> - Ik kan gegevens doorgeven aan de view
> - Ik kan een nieuwe route en view toevoegen aan mijn website.

### Leerdoelen week 3

> - Ik kan Eloquent gebruiken om gegevens uit de database te halen.
> - Ik kan een formulier maken in Laravel.
> - Ik kan gegevens opslaan in de database met een formulier.
> - Ik kan gegevens valideren in Laravel.
> - Ik kan foutmeldingen weergeven bij een formulier.
> - Ik kan een formulier maken om gegevens te bewerken.
> - Ik kan gegevens bewerken in de database met een formulier.
> - Ik kan gegevens verwijderen uit de database.
> - Ik kan een bevestigingspagina maken voor het verwijderen van gegevens.
> - Ik kan een zoekfunctie maken in Laravel.

## Inhoudsopgave

| Hoofdstuk | Onderwerp | Week |
|-----------|-----------|------|
| [Hoofdstuk 1](Hoofdstuk%201%20-%20Introductie%20Laravel.md) | Project Setup en Basis Functionaliteit | 1 |
| [Hoofdstuk 2](Hoofdstuk%202%20-%20Models%20en%20Relaties.md) | Models en Relaties | 2 |
| [Hoofdstuk 3](Hoofdstuk%203%20-%20CRUD%20Formulieren%20en%20Validatie.md) | CRUD Formulieren en Validatie | 3 |
| [Hoofdstuk 4](Hoofdstuk%204%20-%20Authenticatie%20en%20Middleware.md) | Authenticatie en Middleware | 4 |
| [Hoofdstuk 5](Hoofdstuk%205%20-%20Reviews%20en%20Autorisatie.md) | Reviews en Autorisatie | 5 |
| [Hoofdstuk 6](Hoofdstuk%206%20-%20Bestellingen%20en%20Many-to-Many.md) | Bestellingen en Many-to-Many | 6 |
| [Hoofdstuk 7](Hoofdstuk%207%20-%20Herhaling%20en%20Verdieping.md) | Herhaling en Verdieping | 7 |
| [Samenvatting H1-3](Samenvatting%20Hoofdstukken%201-3.md) | Samenvatting eerste drie hoofdstukken | — |

---

## Week 4 - Authenticatie & Bestellingen
> - Authenticatie met Laravel Breeze
>   - Auth middleware toepassen
>   - `Auth::user()` en `@auth` in views
>   - Rolsysteem (admin / klant)
>   - Gates voor autorisatie
> - Bestellingen (many-to-many via pivot)
>   - `orderrows`-tabel
>   - `attach()`, `sync()`, `detach()`
>   - Bestellingenoverzicht per gebruiker

## Week 5 - Reviews, Policies & Verdieping
> - Reviews door ingelogde klanten
>   - Geneste routes
>   - `Auth::id()` koppelen aan records
>   - Gemiddelde beoordeling berekenen
> - Autorisatie per record met Policies
>   - Eigen review verwijderen
>   - `@can` in Blade
> - FormRequest classes
>   - Validatie buiten de controller
>   - Nederlandstalige foutmeldingen
> - Zelfstandige opdrachten (eindproject voorbereiding)