# Blok 9 - Laravel Todo List Project

## Week 2

### Introductie
Vorige week hebben we data naar de views toegestuurd via de PageController. Nu gaan we data naar de views toegestuurd via de TaskController.

## Data naar View via de TaskController

### Opdracht 1.1 TaskController aanpassen

1. Open de controller `app/Http/Controllers/TaskController.php`
2. Voeg de volgende methode toe:
    ```php
    public function index()
    {
        $title = "Takenoverzicht";
        $tasks = Task::all();
        return view('tasks.index', compact('tasks', 'title'));
    }
    ```
3. Sla de wijzigingen op en open de pagina `/tasks` in je browser.

Deze methode zal de view `tasks.index` weergeven met de variabele $tasks en $title. We zien de taken in een lijst.

### Opdracht 1.2 View aanpassen
1. Open de view `tasks.index.blade.php`
2. Voeg de volgende code toe:
    ```php
    <h1>{{ $title }}</h1>
    <ul>
        @foreach ($tasks as $task)
            <li>{{ $task->title }}</li>
        </ul>   

    ```
3. Sla de wijzigingen op en open de pagina `/tasks` in je browser.

Deze view zal de takenoverzicht pagina weergeven met de variabele $tasks en $title. We zien de taken in een lijst.

## Data naar View via de CategoryController

### Opdracht 2.1 CategoryController aanpassen

1. Open de controller `app/Http/Controllers/CategoryController.php`
2. Voeg de volgende methode toe:
    ```php
    public function index()
    {
        $title = "Categorieoverzicht";
        $categories = Category::all();
        return view('categories.index', compact('categories', 'title'));
    }
    ```
3. Sla de wijzigingen op en open de pagina `/categories` in je browser.

Deze methode zal de view `categories.index` weergeven met de variabele $categories en $title. We zien de categories in een lijst.

### Opdracht 2.2 View aanpassen
1. Open de view `categories.index.blade.php`
2. Voeg de volgende code toe:
    ```php
    <h1>{{ $title }}</h1>
    <ul>
        @foreach ($categories as $category)
            <li>{{ $category->name }}</li>
        </ul>
    ```
3. Sla de wijzigingen op en open de pagina `/categories` in je browser.

Deze view zal de categorieoverzicht pagina weergeven met de variabele $categories en $title. We zien de categories in een lijst.

## Data toevoegen via de TaskController

### Opdracht 3.0 Route aanpassen
1. Open het bestand `routes/web.php`
2. Voeg de volgende route toe:
    ```php
    Route::get('/tasks/create', [TaskController::class, 'create']);
    ```
3. Sla de wijzigingen op en open de pagina `/tasks/create` in je browser.

Deze route zal naar de pagina `/tasks/create` verwijzen.

### Opdracht 3.1 TaskController aanpassen

1. Open de controller `app/Http/Controllers/TaskController.php`
2. Voeg de volgende methode toe:
    ```php
    public function create()
    {
        return view('tasks.create');
    }
    ```
3. Sla de wijzigingen op en open de pagina `/tasks/create` in je browser.

Deze methode zal de view `tasks.create` weergeven. Echter is de view nog niet aangemaakt.

### Opdracht 3.2 View aanpassen
1. Open de view `tasks.create.blade.php`
2. Voeg de volgende code toe:
    ```php
    <h1>Taak aanmaken</h1>
    <form action="{{ route('tasks.store') }}" method="post">
        @csrf
        <label for="title">Titel</label>
        <input type="text" name="title" id="title">
        <label for="description">Description</label>
        <textarea name="description" id="description"></textarea>
        <label for="due_date">Due Date</label>
        <input type="date" name="due_date" id="due_date">
        <label for="completed">Completed</label>
        <input type="checkbox" name="completed" id="completed">
        <button type="submit">Taak aanmaken</button>
    </form>
    ```
3. Sla de wijzigingen op en open de pagina `/tasks/create` in je browser.

Deze view zal het formulier tonen om een taak aan te maken.

### Opdracht 3.3 TaskController aanpassen
1. Open de controller `app/Http/Controllers/TaskController.php`
2. Voeg de volgende methode toe:
    ```php
    public function store(Request $request)
    {
        $task = Task::create($request->all());
        return redirect()->route('tasks.index');
    }
    ```
3. Sla de wijzigingen op en open de pagina `/tasks/create` in je browser.

Deze methode zal de taak opslaan in de database.

### Opdracht 3.4 Route aanpassen
1. Open het bestand `routes/web.php`
2. Voeg de volgende route toe:
    ```php
    Route::post('/tasks', [TaskController::class, 'store'])->name('tasks.store');
    ```
3. Sla de wijzigingen op en open de pagina `/tasks/create` in je browser.

Deze route zal naar de methode `store` in de `TaskController` verwijzen.

> Zoals je ziet is de route genaamd `tasks.store`. Dit is de naam van de route die we in de view gebruiken.

## Route namen

Route namen zijn belangrijk voor het genereren van URL's. We kunnen deze namen gebruiken in de view om naar de juiste route te verwijzen.

### Opdracht 3.5 Routes aanpassen
1. Open het bestand `routes/web.php`
2. Pas de reeds gemaakte routes aan zodat deze gebruik maken van de route namen:
    ```php
    Route::get('/tasks', [TaskController::class, 'index'])->name('tasks.index');
    Route::get('/tasks/create', [TaskController::class, 'create'])->name('tasks.create');
    Route::post('/tasks', [TaskController::class, 'store'])->name('tasks.store');
    ```
3. Sla de wijzigingen op en open de pagina `/tasks` in je browser.

Deze routes zullen naar de juiste methoden in de `TaskController` verwijzen.

> Zoals je ziet is de route genaamd `tasks.index`. Dit is de naam van de route die we in de view gebruiken.


## Migratie aanpassen

- user firstname en lastname toevoegen

Standaard komt Laravel met een create_users_table migration. We gaan deze aanpassen om firstname en lastname toe te voegen.
```php
public function up()
{
    Schema::table('users', function (Blueprint $table) {
        // $table->string('name'); DEZE VERWIJDEREN WE
        $table->string('firstname');
        $table->string('lastname');
    });
}
```

Als we dat hebben gedaan dan moeten we ook nog de seeder en de factory aanpassen.

#### Factory aanpassen
```php
public function definition()
{
    return [
        'firstname' => $this->faker->firstName(),
        'lastname' => $this->faker->lastName(),
    ];
}
```

#### Seeder aanpassen
```php
public function run()
{
    User::create([
        'firstname' => 'John',
        'lastname' => 'Doe',
    ]);

    //overige code...
}
```

Nu kunnen we de database opnieuw migreren.
```bash
php artisan migrate:fresh --seed
```

De database is nu opnieuw migreerd en de seeders zijn uitgevoerd. We zien de data in de database.

## Models en relaties

Meestal zijn er relaties tussen de tabellen. We gaan deze relaties middels foreign keys toevoegen.

- task koppelen aan user (foreign key user_id)
- task koppelen aan category (foreign key category_id)

## Opdracht 4.1 Migratie aanpassen  
1. Open de migration `create_tasks_table`
2. Voeg de volgende code toe:
    ```php
    public function up()
    {
        Schema::table('tasks', function (Blueprint $table) {
            //overige code...
            $table->foreignId('user_id')->nullable()->constrained()->cascadeOnDelete();
            $table->foreignId('category_id')->nullable()->constrained()->cascadeOnDelete();
        });
    }
    ```

> - Een __taak__ wordt gedaan door een __user__
> - Een __taak__ kan een __categorie__ hebben


Nu we de database tabellen hebben aangepast, moeten we de data in de database aanpassen. Ofwel de seeders aanpassen.
Aan elke taak moeten we een user en een categorie toevoegen.

Aan elke taak-array moeten we een user_id en een category_id toevoegen.
```php
'user_id' => 1,
'category_id' => 1,
```

> We kunnen de database opnieuw migreren en de seeders uitvoeren met het volgende commando:
```bash
php artisan migrate:fresh --seed
```

De database is nu opnieuw migreerd en de seeders zijn uitgevoerd. We zien de data in de database.

Nu we de database tabellen hebben aangepast, moeten we de models aanpassen.

### Opdracht 4.2 Task model aanpassen
1. Open het bestand `app/Models/Task.php`
2. Voeg de volgende code toe:
    ```php
    public function user()
    {
        return $this->belongsTo(User::class);
    }
    ```
3. Voeg de volgende code toe:
    ```php
    public function category()
    {
        return $this->belongsTo(Category::class);
    }
    ```

### Opdracht 4.3 Category model aanpassen
1. Open het bestand `app/Models/Category.php`
2. Voeg de volgende code toe:
    ```php
    public function tasks()
    {
        return $this->hasMany(Task::class);
    }
    ```

> - Een __categorie__ kan meerdere __taken__ hebben

Nu we de models hebben aangepast, moeten we de data in de database aanpassen.

### Opdracht 4.4 View aanpassen
1. Open de view `tasks.index.blade.php`
2. Voeg de volgende code toe:
`$task->user->firstname` is de naam van de user die de taak heeft gemaakt. Zoals je ziet is deze relatie gemaakt middels de foreign key user_id in de tasks tabel.
We kunnen ook de categorie van de taak weergeven.
```php
<h4>{{ $task->category->name }}</h4> //DEZE REGEL IS TOEGEVOEGD
```

Zie hieronder de volledige code:
```php
<x-base-layout>
    <h1>{{$title}}</h1>
    <ul>
        @foreach($tasks as $task)
            <li>
                <h2>{{ $task->title }}</h2>
                <p>{{$task->description}}</p>
                <h4>{{ $task->user->firstname }}</h4> //DEZE REGEL IS TOEGEVOEGD
                <h4>{{ $task->category->name }}</h4> //DEZE REGEL IS TOEGEVOEGD
            </li>
        @endforeach
    </ul>
</x-base-layout>
```

## Opdracht 4.5 View aanpassen
1. Open de view `tasks.create.blade.php`
2. In opdracht 3.2 hebben we de view aangepast. We gaan deze nu aanpassen met een dropdown voor de categorie.
```php
<label for="category_id">Categorie</label>
<select name="category_id" id="category_id">
    @foreach($categories as $category)
        <option value="{{ $category->id }}">{{ $category->name }}</option>
    @endforeach
</select>
```

3. Sla de wijzigingen op en open de pagina `/tasks/create` in je browser.

Deze view zal het formulier tonen om een taak aan te maken met een dropdown voor de categorie. Of toch niet?
We moeten de categories ophalen van de database, en dus moeten we de controller aanpassen.

### Opdracht 4.6 TaskController aanpassen
1. Open de controller `app/Http/Controllers/TaskController.php`
2. Voeg de volgende code toe:
    ```php
    public function create()
    {
        $categories = Category::all();//DEZE REGEL IS TOEGEVOEGD
        return view('tasks.create', compact('categories'));//DEZE REGEL IS TOEGEVOEGD
        
    }
    ```
3. Sla de wijzigingen op en open de pagina `/tasks/create` in je browser.
4. We zien nu de dropdown voor de categorie.

### Opdracht 4.7 TaskController aanpassen

Om de gebruiker op te slaan moeten we de controller aanpassen. Maar aangezien we nog geen ingelogde gebruiker hebben, schrijven we even een dummy user in de store method.
```php
public function store(Request $request)
{
    $task = Task::create(
        [
        ...$request->all(),
        'user_id' => User::first()->id,
    ]);
    return redirect()->route('tasks.index');
}
```

3. Sla de wijzigingen op en open de pagina `/tasks/create` in je browser.
4. We zien nu de taak opgeslagen in de database.