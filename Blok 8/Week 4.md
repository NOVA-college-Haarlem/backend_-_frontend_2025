# Week 4

- [Week 4](#week-4)
  - [Leerdoelen week 4](#leerdoelen-week-4)
  - [Les 8: Relaties tussen tabellen](#les-8-relaties-tussen-tabellen)
    - [Opdracht 1](#opdracht-1)
    - [1-op-veel relatie](#1-op-veel-relatie)
  - [Formulieren en relaties](#formulieren-en-relaties)
  - [Veel-op-veel relatie](#veel-op-veel-relatie)
    - [Migratie Pivot table](#migratie-pivot-table)
      - [Relatie Internship - Education](#relatie-internship---education)
      - [Relatie Education - Internship](#relatie-education---internship)


## Leerdoelen week 4

> - Ik maak relaties tussen tabellen in een database.
> - In een model definieer ik de relatie tussen de models.
> - Ik gebruik Eloquent om gegevens uit de database op te halen.
> - Ik gebruik Eloquent om gegevens in de database op te slaan.
> - Ik gebruik Eloquent om gegevens in de database te wijzigen.
> - Ik gebruik Eloquent om gegevens uit de database te verwijderen.



## Les 8: Relaties tussen tabellen

In een database kan je relaties leggen tussen tabellen. Een relatie beschrijft hoe de gegevens in de ene tabel gerelateerd zijn aan de gegevens in een andere tabel. Er zijn verschillende soorten relaties die je kan leggen tussen tabellen:

- **One-to-One**: Elke rij in de ene tabel is gerelateerd aan één rij in de andere tabel.
- **One-to-Many**: Elke rij in de ene tabel is gerelateerd aan meerdere rijen in de andere tabel.
- **Many-to-Many**: Elke rij in de ene tabel is gerelateerd aan meerdere rijen in de andere tabel, en vice versa.

In Laravel kan je relaties leggen tussen tabellen met behulp van Eloquent. Eloquent is een ORM (Object-Relational Mapping) die het mogelijk maakt om gegevens uit de database te halen en te bewerken met behulp van PHP-objecten.

### Opdracht 1

1. Open het migratiebestand `create_internships_table.php` in de map `database/migrations`.
2. Voeg de volgende code toe aan de `internships` tabel:

```php
 //net na description
 $table->foreignId('company_id')->constrained();

```

3. In de terminal, run `php artisan migrate:fresh --seed` om de migraties opnieuw uit te voeren en de seeders te runnen.
4. Open het bestand `Internship.php` in de map `app/Models`.
5. Voeg de volgende code toe aan het `Internship` model:

```php
public function company()
{
    return $this->belongsTo(Company::class);
}
```

Nu hebben we een relatie tussen de `internships` en `companies` tabellen. 

> Een stage heeft dus een bedrijf.

Als we de company name van de stage willen tonen, kunnen we dit doen met de volgende code:

```php
echo $internship->company->name;
```

### 1-op-veel relatie

Om de relatie de andere kant op te maken, moeten we de Company model aanpassen.

```php
public function internships()
{
    return $this->hasMany(Internship::class);
}
```

Als je dan andersom de stages van een bedrijf wilt tonen, kun je dit doen met de volgende code:

```php
//companies show
foreach ($company->internships as $internship) {
    echo $internship->title;
}
```

## Formulieren en relaties

Stel je maakt een nieuwe stage aan, dan moet je ook de company_id invullen. Dit kan je doen met de volgende code in de `store` methode van de `InternshipController`:

```php
$internship = new Internship();
$internship->title = $request->title;
$internship->description = $request->description;
$internship->company_id = $request->company_id;
$internship->save();
```

De `company_id` moet een integer zijn en een verwijzing naar een rij in de `companies` tabel. 

In het formulier moet je dan ook een selectie maken met de mogelijke bedrijven. Dit kan je doen met de volgende code in de `create` view:

```php
<select name="company_id">
    @foreach ($companies as $company)
        <option value="{{ $company->id }}">{{ $company->name }}</option>
    @endforeach
</select>
```

Als je deze code in de `create` view zet, dan krijg je een dropdown met de mogelijke bedrijven.
Maar daarvoor moet je wel de bedrijven naar de view sturen. Dit kan je doen met de volgende code in de `index` methode van de `InternshipController`:

```php
return view('internships.index', compact('internships', 'companies'));
```

Bij het updaten van een stage moet je ook de company_id invullen. Dit kan je doen met de volgende code in de `update` methode van de `InternshipController`:

```php
$internship = Internship::find($id); // of Internship::findOrFail($id); // of via model view binding
$internship->title = $request->title;
$internship->description = $request->description;
$internship->company_id = $request->company_id;
$internship->save();
```

In het formulier, in de view `edit.blade.php` moet je dan ook de company_id invullen. Bestaande gegevens worden meegegeven aan de view.

```php
<form action="{{ route('internships.update', $internship->id) }}" method="POST">
    @csrf
    @method('PUT')
    <div>
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" value="{{ old('title', $internship->title ?? '') }}" required>
    </div>
    <div>
        <label for="description">Description:</label>
        <textarea id="description" name="description" required>{{ old('description', $internship->description ?? '') }}</textarea>
    </div>
    <div>
        <label for="company_id">Company:</label>
        <select id="company_id" name="company_id" required>
            @foreach ($companies as $company)
                <option value="{{ $company->id }}" {{ (old('company_id', $internship->company_id ?? '') == $company->id) ? 'selected' : '' }}>
                    {{ $company->name }}
                </option>
            @endforeach
        </select>
    </div>
    <div>
        <button type="submit">Save Internship</button>
    </div>
</form>
```

Toelichting:

- CSRF Token: De @csrf-directive wordt gebruikt om een CSRF-token in het formulier op te nemen voor beveiliging.
- Method: De @method('PUT')-directive wordt gebruikt om de HTTP-methode PUT te specificeren, wat betekent dat het formulier gebruikt wordt om een bestaande resource bij te werken.
- Titel en Beschrijving: Deze velden zijn bedoeld voor het invoeren van de titel en beschrijving van de stage. De waarde en inhoud van de textarea gebruiken de old() helper om het formulier opnieuw in te vullen met eerdere invoergegevens in geval van validatiefouten, of met bestaande gegevens als je een stage bewerkt.
- Bedrijf Selectie: Er wordt een dropdownmenu aangeboden om een bedrijf te selecteren. Het gebruikt een lus om opties uit de $companies-collectie te vullen, en de old() helper om het geselecteerde bedrijf te behouden in geval van fouten of bij het bewerken.
- Verzendknop: Een eenvoudige knop om het formulier te verzenden.


## Veel-op-veel relatie

Om een veel-op-veel relatie tussen stages en opleidingen te maken in Laravel, moet je een pivot table aanmaken en de nodige relaties in de modellen definiëren. Hier zijn de stappen:

### Migratie Pivot table

1. Maak een migratie voor de pivot table
Je moet een pivot table maken die de internship_id en education_id bevat. Voer het volgende commando uit om een migratie te maken:

> php artisan make:migration create_education_internship_table

2. Vul de migratie aan met de volgende code:

```php
public function up()
{
    Schema::create('education_internship', function (Blueprint $table) {
        $table->id();
        $table->foreignId('internship_id')->constrained()->onDelete('cascade');
        $table->foreignId('education_id')->constrained()->onDelete('cascade');
        $table->timestamps();
    });
}
```

Defineer de relaties in de Internship en Education modellen.

#### Relatie Internship - Education

```php
public function educations()
{
    return $this->belongsToMany(Education::class);
}
```

#### Relatie Education - Internship
```php
public function internships()
{
    return $this->belongsToMany(Internship::class);
}
```

Toon de opleidingen bij het maken van een stage in de InternshipController, create method:

```php
public function create(Request $request)
{
    $companies = Company::all();
    $educations = Education::all();
    return view('internships.create', compact('companies', 'educations'));
}