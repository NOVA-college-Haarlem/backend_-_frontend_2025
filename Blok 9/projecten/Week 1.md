# Week 1

## Herhaling Blok 8

We gaan in dit blok verder met project Taxi Pro uit blok 8. Je kunt dit project vinden in de repository [https://github.com/nova-college-haarlem/taxi-pro](https://github.com/nova-college-haarlem/taxi-pro). 

- Fork het project en kloon het naar je eigen computer in de Herd directory.
- Open het project in VS Code.
- Open een terminal in VS Code en type `npm install` in.
- Type `npm run dev` in de terminal. Deze terminal NIET sluiten.
  


### Opdracht 1 - Bestuderen

- Bestudeerde de bestaande CarController en de routes.
- Bestudeerde de views.
- Bestudeerde de migrations.
- Bestudeerde de models.

#### Opdracht 1.1

- Wat is het voordeel van named routes?
- Wat is het verschil tussen de edit en show methoden in de CarController?
- Wat is het verschil tussen de store en update methoden in de CarController?


### Opdracht 2 - CRUD

- Maak voor `drivers` alle CRUD functionaliteiten aan:

#### Opdracht 2.1

- Maak een nieuwe migration aan met de naam `create_drivers_table`.
- Maak een nieuwe model aan met de naam `Driver`.
- Maak een nieuwe controller aan met de naam `DriverController`.

#### Opdracht 2.2 Create

- Maak een create route aan met de naam `drivers.create` in de file `routes/web.php`.
- Maak een create view aan met de naam `create.blade.php` in de directory `resources/views/drivers`.
- Maak een form aan in de create view.
- Maak een controller method aan met de naam `create` in de `DriverController`.
- Maak een store route aan met de naam `drivers.store` in de file `routes/web.php`.
- Maak een controller method aan met de naam `store` in de `DriverController`.
- 

#### Opdracht 2.3 Read

- Maak een index view aan met de naam `index.blade.php` in de directory `resources/views/drivers`.
- Maak een show view aan met de naam `show.blade.php` in de directory `resources/views/drivers`.
- Maak een index route aan met de naam `drivers.index` in de file `routes/web.php`.
- Maak een show route aan met de naam `drivers.show` in de file `routes/web.php`.
- Maak een controller method aan met de naam `index` in de `DriverController`.
- Maak een controller method aan met de naam `show` in de `DriverController`.

#### Opdracht 2.4 Update

- Maak een edit view aan met de naam `edit.blade.php` in de directory `resources/views/drivers`.
- Maak een edit route aan met de naam `drivers.edit` in de file `routes/web.php`.
- Maak een edit method aan met de naam `edit` in de `DriverController`.
- Maak een update route aan met de naam `drivers.update` in de file `routes/web.php`.
- Maak een update method aan met de naam `update` in de `DriverController`.

#### Opdracht 2.5 Delete

- Maak een delete route aan met de naam `drivers.delete` in de file `routes/web.php`.
- Maak een delete method aan met de naam `delete` in de `DriverController`.

#### Opdracht 3 - Layout

Zorg ervoor dat de stijling op elke pagina correct is. Dit kun je doen door de home.blade.php als component te gebruiken. 

#### Opdracht 3.1

- Maak een nieuwe component door in de terminal `php artisan make:component HomeLayout` te typen.

Er zijn nu twee bestanden aangemaakt: `HomeLayout.blade.php` en `HomeLayout.php`.

- Kopieer de code van de `home.blade.php` naar de `HomeLayout.blade.php` file.
- Zet de variable `{{ $slot }}` in de `HomeLayout.blade.php` file.

#### Opdracht 3.2

- Zorg ervoor dat de homeLayout component wordt gebruikt in alle views

