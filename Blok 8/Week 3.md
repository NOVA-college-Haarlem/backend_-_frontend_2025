# Week 3

- [Week 3](#week-3)
  - [Leerdoelen week 3](#leerdoelen-week-3)
  - [Les 6: C.R.U.D.](#les-6-crud)
    - [Index method](#index-method)
      - [Opdracht 1](#opdracht-1)
    - [Show method](#show-method)
      - [Opdracht 2](#opdracht-2)
    - [Create method](#create-method)
    - [Store method](#store-method)
    - [Foutmeldingen tonen](#foutmeldingen-tonen)
      - [Opdracht 3](#opdracht-3)
      - [Opdracht 4](#opdracht-4)
    - [Edit method](#edit-method)
      - [Opdracht 5](#opdracht-5)
    - [Update method](#update-method)
  - [Les 7: Eloquent Models](#les-7-eloquent-models)
    - [Model maken](#model-maken)
    - [Model gebruiken](#model-gebruiken)
      - [Opdracht 6](#opdracht-6)
    - [Overige InternshipController methodes aanpassen](#overige-internshipcontroller-methodes-aanpassen)
      - [Opdracht 7](#opdracht-7)
      - [Opdracht 8](#opdracht-8)
        - [Opdracht 9](#opdracht-9)
      - [Opdracht 10](#opdracht-10)
    - [EducationController](#educationcontroller)
      - [Opdracht 11](#opdracht-11)
      - [Opdracht 12](#opdracht-12)
      - [Opdracht 13](#opdracht-13)
      - [Opdracht 14](#opdracht-14)
      - [Opdracht 15](#opdracht-15)
      - [Opdracht 16](#opdracht-16)

## Leerdoelen week 3

> - Ik kan een formulier gebruiken in Laravel.
> - Ik kan gegevens uit een formulier halen in Laravel.
> - Ik kan gegevens opslaan in de database met een formulier in Laravel.
> - Ik kan een formulier valideren in Laravel.
> - Ik kan een foutmelding tonen bij een formulier in Laravel.
> - Ik kan een formulier opnieuw tonen met ingevulde gegevens in Laravel.
> - Ik kan een formulier gebruiken in een view in Laravel.
> - Ik maak gebruik van Eloquent Models in Laravel.

## Les 6: C.R.U.D.

In de vorige les heb je een index methode gemaakt die alle stages uit de database haalt en doorgeeft aan de view. In deze les ga je een C.R.U.D. systeem maken. C.R.U.D. staat voor Create, Read, Update en Delete. Met een C.R.U.D. systeem kan je gegevens toevoegen, lezen, bewerken en verwijderen uit de database.

### Index method

De index methode uit de vorige les was niet helemaal goed. Deze gaan we refactoren (aanpassen).

#### Opdracht 1

1. Maak in de view map een nieuwe map aan genaamd `internships`.
2. Pas het bestand `internships.blade.php` aan naar `index.blade.php` en zet deze in de map `internships`
3. Pas de code in de `index` methode in de `InternshipController` aan zodat de view `internships/index.blade.php` wordt gereturned door `return view('internships.index', compact('internships'));` te schrijven.

### Show method

1.  Voeg de volgende code toe aan `InternshipController.php` om een enkele stage te tonen

```php
public function show($id)
{
   $internship = DB::table('internships')->find($id);
   return view('internships.show', compact('internship'));
}
```

2.  Maak een nieuwe route aan in `web.php` om de `show` methode te tonen

```php
Route::get('/internships/{id}', [ InternshipController::class, 'show' ]);
```

3.  Maak een nieuwe view aan met de naam `show.blade.php` in de map `internships` en toon de gegevens van de stage.
4.  Test je code. Ga naar `http://NOVA-ICT-BPV.test/internships/1` en je ziet de gegevens van de stage met id 1.

#### Opdracht 2

Maak een `show` methode in de `EducationController` om een enkele opleiding te tonen. Maak een nieuwe route aan in `web.php` om de `show` methode te tonen. Maak een nieuwe view aan met de naam `show.blade.php` in de map `educations` en toon de gegevens van de opleiding.

### Create method

1.  Maak het bestand `resources/views/internships/create.blade.php`
2.  Maak een nieuwe route aan in `web.php` om het formulier te tonen.

```php
Route::get('/internships/create', [ InternshipController::class, 'create' ]);
```

3.  Voeg de volgende code toe aan `InternshipController.php` om het formulier te tonen.

```php
public function create()
{
   return view('internships.create');
}
```

4.  Voeg de volgende code toe aan `create.blade.php` om een formulier te maken.

```php
<form action="/internships" method="POST">
   @csrf
   <label for="title">Title</label>
   <input type="text" name="title" id="title">
   <label for="description">Description</label>
   <textarea name="description" id="description"></textarea>
   <label for="start_date">Start Date</label>
   <input type="date" name="start_date" id="start_date">
   <label for="end_date">End Date</label>
   <input type="date" name="end_date" id="end_date">
   <label for="hours_per_week">Hours per Week</label>
   <input type="number" name="hours_per_week" id="hours_per_week">
   <label for="compensation">Compensation</label>
   <input type="text" name="compensation" id="compensation">
   <label for="type">Type</label>
   <select name="type" id="type">
            <option value="full-time">Full-time</option>
            <option value="part-time">Part-time</option>
        <select>
   <label for="level_of_education">Level of Education</label>
   <input type="text" name="level_of_education" id="level_of_education">
   <button type="submit">Submit</button>
</form>
```

### Store method

1.  Maak een nieuwe route aan in `web.php` om het formulier te verwerken.

```php
Route::post('/internships', [ InternshipController::class, 'store' ]);
```

2.  Voeg de volgende code toe aan `InternshipController.php` om het formulier te verwerken.

```php
public function store(Request $request)
{
   $request->validate([
      'title' => 'required',
      'description' => 'required',
      'start_date' => 'required|date',
      'end_date' => 'required|date|after:start_date',
      'hours_per_week' => 'required|numeric|min:1',
      'compensation' => 'required',
      'type' => 'required',
      'level_of_education' => 'required'
   ]);

   DB::table('internships')->insert([
      'title' => $request->title,
      'slug'  => Str::slug($request->title),
      'description' => $request->description,
      'start_date' => $request->start_date,
      'end_date' => $request->end_date,
      'hours_per_week' => $request->hours_per_week,
      'compensation' => $request->compensation,
      'type' => $request->type,
      'level_of_education' => $request->level_of_education
   ]);

   return redirect('/internships');
}
```

### Foutmeldingen tonen

1.  Voeg de volgende code toe aan `create.blade.php` om foutmeldingen te tonen.

```php
@if ($errors->any())
   <div>
      <ul>
            @foreach ($errors->all() as $error)
               <li>{{ $error }}</li>
            @endforeach
      </ul>
   </div>
@endif
```

2.  Test je code. Ga naar `http://NOVA-ICT-BPV.test/internships/create` en klik op de submit knop zonder iets in te vullen. Je krijgt een foutmelding te zien.

#### Opdracht 3

Maak een formulier aan voor het toevoegen van een nieuwe opleiding. Een opleiding heeft een naam, een beschrijving, een niveau en een duur. De gebruiker dient de naam, beschrijving, niveau en duur in te vullen. Als de gebruiker de velden niet invult, dan moet er een foutmelding getoond worden. Als de gebruiker de velden invult, dan moet de opleiding toegevoegd worden aan de database en moet de gebruiker doorgestuurd worden naar de opleidingen pagina.

#### Opdracht 4

Zorg ervoor dat de data gevalideerd wordt en eventuele foutmeldingen getoond worden op de pagina `create.blade.php`.

### Edit method

1.  Voeg de volgende code toe aan `InternshipController.php` om een stage te bewerken

```php
public function edit($id)
{
      $internship = DB::table('internships')->find($id);
      return view('internships.edit', compact('internship'));
}
```

2.  Maak een nieuwe route aan in `web.php` om de `edit` methode te tonen

```php
Route::get('/internships/{id}/edit', [ InternshipController::class, 'edit' ]);
```

3.  Maak een nieuwe view aan met de naam `edit.blade.php` in de map `internships` en toon een formulier om de gegevens van de stage te bewerken.
4.  Test je code. Ga naar `http://NOVA-ICT-BPV.test/internships/1/edit` en je ziet een formulier om de gegevens van de stage met id 1 te bewerken.

#### Opdracht 5

Maak een `edit` methode in de `EducationController` om een opleiding te bewerken. Maak een nieuwe route aan in `web.php` om de `edit` methode te tonen. Maak een nieuwe view aan met de naam `edit.blade.php` in de map `educations` en toon een formulier om de gegevens van de opleiding te bewerken.

### Update method

1.  Voeg de volgende code toe aan `InternshipController.php` om een stage te updaten

```php
public function update(Request $request, $id)
{
      $request->validate([
         'title' => 'required',
         'description' => 'required',
         'start_date' => 'required|date',
         'end_date' => 'required|date|after:start_date',
         'hours_per_week' => 'required|numeric|min:1',
         'compensation' => 'required',
         'type' => 'required',
         'level_of_education' => 'required'
      ]);

      $internship = DB::table('internships')->where('id', $id)->update([
         'title' => $request->title,
         'slug'  => Str::slug($request->title),
         'description' => $request->description,
         'start_date' => $request->start_date,
         'end_date' => $request->end_date,
         'hours_per_week' => $request->hours_per_week,
         'compensation' => $request->compensation,
         'type' => $request->type,
         'level_of_education' => $request->level_of_education
      ]);

      return redirect('/internships');
}
```

2.  Maak een nieuwe route aan in `web.php` om de `update` methode te verwerken

```php
Route::put('/internships/{id}', [ InternshipController::class, 'update' ]);
```

3.  Voeg de volgende code toe aan `edit.blade.php` om de gegevens van de stage te tonen in het formulier

```php
<form action="/internships/{{ $internship->id }}" method="POST">
   @csrf
   @method('PUT')
   <label for="title">Title</label>
   <input type="text" name="title" id="title" value="{{ $internship->title }}">
   <label for="description">Description</label>
   <textarea name="description" id="description">{{ $internship->description }}</textarea>
   <label for="start_date">Start Date</label>
   <input type="date" name="start_date" id="start_date" value="{{ $internship->start_date }}">
   <label for="end_date">End Date</label>
   <input type="date" name="end_date" id="end_date" value="{{ $internship->end_date }}">
   <label for="hours_per_week">Hours per Week</label>
   <input type="number" name="hours_per_week" id="hours_per_week" value="{{ $internship->hours_per_week }}">
   <label for="compensation">Compensation</label>
   <input type="text" name="compensation" id="compensation" value="{{ $internship->compensation }}">
   <label for="type">Type</label>
   <input type="text" name="type" id="type" value="{{ $internship->type }}">
   <label for="level_of_education">Level of Education</label>
   <input type="text" name="level_of_education" id="level_of_education" value="{{ $internship->level_of_education }}">
   <button type="submit">Submit</button>
</form>
```

## Les 7: Eloquent Models

In de zevende les leer je hoe je Eloquent Models kan gebruiken in Laravel. Een Eloquent Model is een PHP-klasse die de gegevens van een tabel in de database representeert. Met een Eloquent Model kan je gegevens uit de database halen, gegevens in de database zetten en gegevens in de database verwijderen.

### Model maken

1.  Open een terminal
2.  Maak een nieuwe model aan met de naam `Internship` door het volgende commando uit te voeren:

```bash
php artisan make:model Internship
```

Dit model representeert de tabel `internships` in de database.
Laravel is slim genoeg om te weten dat de model `Internship` de tabel `internships` representeert.

### Model gebruiken

1.  Voeg de volgende code toe aan `InternshipController.php` om het model te gebruiken. (_Let op: voeg de juiste import toe bovenaan het bestand_)

```php
use App\Models\Internship;
```

2.  Pas de code van de `index` methode in de `InternshipController.php` aan om gegevens uit de database te halen

```php
public function index()
{
   // $internships = DB::table('internships')->get();
   $internships = Internship::all();
   return view('internships.index', compact('internships'));
}
```

#### Opdracht 6

Maak een model aan met de naam `Education` en zorg ervoor dat de model de tabel `educations` representeert. Voeg de velden `name`, `slug`, `description`, `level` en `duration` toe aan het model. Gebruik de `Education` model in de `EducationController` om gegevens uit de database te halen en te tonen in de view `educations/index.blade.php`.

### Overige InternshipController methodes aanpassen

We dienen het model Internship ook te gebruiken in de show methode. We passen de show methode aan zodat we het model Internship gebruiken.

```php
public function show($id)
{
   // $internship = DB::table('internships')->find($id);
   $internship = Internship::find($id);
   return view('internships.show', compact('internship'));
}
```

En in de store methode

```php
public function store(Request $request)
{
   $request->validate([
      'title' => 'required',
      'description' => 'required',
      'start_date' => 'required|date',
      'end_date' => 'required|date|after:start_date',
      'hours_per_week' => 'required|numeric|min:1',
      'compensation' => 'required',
      'type' => 'required',
      'level_of_education' => 'required'
   ]);

   // DB::table('internships')->insert([
   Internship::create([
      'title' => $request->title,
      'slug'  => Str::slug($request->title),
      'description' => $request->description,
      'start_date' => $request->start_date,
      'end_date' => $request->end_date,
      'hours_per_week' => $request->hours_per_week,
      'compensation' => $request->compensation,
      'type' => $request->type,
      'level_of_education' => $request->level_of_education
   ]);

   return redirect('/internships');
}
```

En in de edit methode

```php
public function edit($id)
{
   // $internship = DB::table('internships')->find($id);
   $internship = Internship::find($id);
   return view('internships.edit', compact('internship'));
}
```

En in de update methode

```php
public function update(Request $request, $id)
{
   $request->validate([
      'title' => 'required',
      'description' => 'required',
      'start_date' => 'required|date',
      'end_date' => 'required|date|after:start_date',
      'hours_per_week' => 'required|numeric|min:1',
      'compensation' => 'required',
      'type' => 'required',
      'level_of_education' => 'required'
   ]);

   // $internship = DB::table('internships')->where('id', $id)->update([
   $internship = Internship::where('id', $id)->update([
      'title' => $request->title,
      'slug'  => Str::slug($request->title),
      'description' => $request->description,
      'start_date' => $request->start_date,
      'end_date' => $request->end_date,
      'hours_per_week' => $request->hours_per_week,
      'compensation' => $request->compensation,
      'type' => $request->type,
      'level_of_education' => $request->level_of_education
   ]);

   return redirect('/internships');
}
```

#### Opdracht 7

Pas de show methode in de `EducationController` aan zodat de `Education` model gebruikt wordt in plaats van de `DB` class.

#### Opdracht 8

Pas de store methode in de `EducationController` aan zodat de `Education` model gebruikt wordt in plaats van de `DB` class.

##### Opdracht 9

Pas de edit methode in de `EducationController` aan zodat de `Education` model gebruikt wordt in plaats van de `DB` class.

#### Opdracht 10

Pas de update methode in de `EducationController` aan zodat de `Education` model gebruikt wordt in plaats van de `DB` class.

### EducationController

#### Opdracht 11
Maak een nieuwe controller aan met de naam `EducationController`. Maak voor de verschillende methodes een route aan in `web.php`

- index
- show
- create
- store
- edit
- update
- destroy

#### Opdracht 12

Schrijf de index methode in de `EducationController` en maak een view aan met de naam `index.blade.php` in de map `educations`. Toon in de view de opleidingen die in de database staan.

#### Opdracht 13

Schrijf de show methode in de `EducationController` en maak een view aan met de naam `show.blade.php` in de map `educations`. Toon in de view de opleiding die in de database staat.

#### Opdracht 14

Schrijf de edit methode in de `EducationController` en maak een view aan met de naam `edit.blade.php` in de map `educations`. Toon in de view een formulier met de gegevens van de opleiding die bewerkt moet worden.

De edit methode moet de opleiding ophalen uit de database en deze doorgeven aan de view. De view moet een formulier bevatten met de volgende velden:

- name (text input)
- description (textarea)
- level (text input)
- duration (number input)

Het formulier moet de gegevens van de opleiding al ingevuld hebben. Als er een fout optreedt bij het valideren van het formulier, moeten de ingevulde gegevens bewaard blijven.

#### Opdracht 15

Schrijf de update methode in de `EducationController`. Redirect de gebruiker naar de index pagina van de opleidingen.

#### Opdracht 16

Schrijf de destroy methode in de `EducationController` en maak een view aan met de naam `destroy.blade.php` in de map `educations`. Toon in de view een formulier met de gegevens van de opleiding die verwijderd moet worden.
