## CRUD

### Create

#### View aanmaken

Maak een nieuwe view `cars.create.blade.php` aan voor het aanmaken van een nieuwe auto.

Pas de view `cars.create.blade.php` aan zodat er een formulier getoond wordt om een nieuwe auto aan te maken. Denk aan alle attributen zoals ze beschreven staan in de tabel `cars` in de database.

#### Route aanmaken

Voeg een route toe in `web.php` voor het tonen van de view om een nieuwe auto aan te maken.

#### Methode in controller

Pas de methode `create()` aan in `CarController` om de view `cars.create.blade.php` te tonen.

#### Store methode

Pas een nieuwe methode `store()` aan in `CarController` om de gegevens van het formulier op te slaan in de database.

### Read

Maak een nieuwe view aan voor het tonen van een enkele auto. Voeg een route toe in `web.php` en maak gebruik van de `show` methode in `CarController` om de view `cars.show.blade.php` te tonen.

Pas de view `cars.show.blade.php` aan zodat de gegevens van een enkele auto getoond worden.

### Update

Maak een nieuwe view aan voor het aanpassen van een auto. Voeg een route toe in `web.php` en een methode in `CarController` om de view `cars.edit.blade.php` te tonen.

Pas de view `cars.edit.blade.php` aan zodat er een formulier getoond wordt om een auto te kunnen bewerken. Denk aan alle attributen zoals ze beschreven staan in de tabel `cars` in de database.

#### Route aanmaken

Voeg een route toe in `web.php` voor het tonen van de view om auto's te bewerken.

#### Methode in controller

Pas de methode `edit()` aan in `CarController` om de view `cars.edit.blade.php` te tonen.

#### Store methode

Pas een nieuwe methode `update()` aan in `CarController` om de gegevens van het formulier op te slaan in de database.
