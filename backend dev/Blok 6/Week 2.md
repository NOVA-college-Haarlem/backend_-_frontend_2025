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
    <form action="tasks/store/" method="post"
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
    Route::post('/tasks/store', [TaskController::class, 'store']);
    ```
3. Sla de wijzigingen op en open de pagina `/tasks/create` in je browser.
