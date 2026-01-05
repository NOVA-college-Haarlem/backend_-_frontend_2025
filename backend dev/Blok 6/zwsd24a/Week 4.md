# Week 4 - Laravel Todo List Project

## Les 1: Veel-op-veel relatie tussen taken en tags (labels)

### Introductie
Vorige week hebben we de edit en delete functionaliteit toegevoegd aan de todo list. We gaan nu werken met een veel-op-veel relatie tussen taken en tags (labels). We gaan een nieuwe tabel aanmaken met de naam `task_tags` en deze tabel zal de veel-op-veel relatie tussen taken en tags bevatten.

### Leerdoelen
- Veel-op-veel relatie tussen taken en tags (labels)
- Nieuwe tabel aanmaken met de naam `task_tags`
- Veel-op-veel relatie tussen taken en tags (labels) definiëren in de models
- Veel-op-veel relatie tussen taken en tags (labels) gebruiken in de controllers
- Veel-op-veel relatie tussen taken en tags (labels) gebruiken in de views

### Opdracht 1: Nieuwe tabel aanmaken
1. Maak een nieuwe migration aan met de naam `create_task_tags_table`:
    ```bash
    php artisan make:migration create_task_tags_table
    ```
2. Open de migration `create_task_tags_table`
3. Voeg de volgende code toe:
    ```php
    public function up()
    {
        Schema::create('task_tags', function (Blueprint $table) {
            $table->id();
            $table->foreignId('task_id')->constrained()->cascadeOnDelete();
            $table->foreignId('tag_id')->constrained()->cascadeOnDelete();
        });
    }
    ```
4. Voer de migration uit:
    ```bash
    php artisan migrate
    ```
5. De database is nu opnieuw migreerd en de nieuwe tabel is aangemaakt. We zien de nieuwe tabel in de database.

### Opdracht 2: Veel-op-veel relatie tussen taken en tags (labels) definiëren in de models
1. Open het bestand `app/Models/Task.php`
2. Voeg de volgende code toe:
    ```php  
    public function tags()
    {
        return $this->belongsToMany(Tag::class);
    }
    ```
3. Open het bestand `app/Models/Tag.php`
4. Voeg de volgende code toe:
    ```php
    public function tasks()
    {
        return $this->belongsToMany(Tag::class);
    }
    ```
5. De database is nu opnieuw migreerd en de nieuwe tabel is aangemaakt. We zien de nieuwe tabel in de database.

### Opdracht 3: Veel-op-veel relatie tussen taken en tags (labels) gebruiken in de controllers
1. Open het bestand `app/Http/Controllers/TaskController.php`
2. Voeg de volgende code toe:
    ```php
    public function store(Request $request) 
    {
        $task = Task::create($request->all());
        $task->tags()->attach($request->tags);
        return redirect()->route('tasks.index')->with('success', 'Taak succesvol aangemaakt!');
    }
    ```
3. Sla de wijzigingen op en open de pagina `/tasks/create` in je browser.
4. We zien nu de tags in de taak.

### Opdracht 4: Veel-op-veel relatie tussen taken en tags (labels) gebruiken in de views
1. Open de view `tasks.create.blade.php`
2. Voeg de volgende code toe:
    ```php
    <label for="tags">Tags</label>
    <select name="tags[]" id="tags" multiple>
        @foreach($tags as $tag)
            <option value="{{ $tag->id }}">{{ $tag->name }}</option>
        @endforeach
    </select>
    ```
3. Sla de wijzigingen op en open de pagina `/tasks/create` in je browser.
4. We zien nu de tags in de taak.

### Opdracht 5: Veel-op-veel relatie tussen taken en tags (labels) gebruiken in de routes
1. Open het bestand `routes/web.php`
2. Voeg de volgende code toe:
    ```php
    Route::post('/tasks/{task}/tags', [TaskController::class, 'addTag'])->name('tasks.addTag'); 

    ```
3. Sla de wijzigingen op en open de pagina `/tasks/create` in je browser.
4. We zien nu de tags in de taak.

## Les 2: Veel-op-veel relatie tussen taken en users
Vorige les hebben we de veel-op-veel relatie tussen taken en tags (labels) toegevoegd aan de todo list. We gaan nu werken met een veel-op-veel relatie tussen taken en users. We gaan een nieuwe tabel aanmaken met de naam `task_users` en deze tabel zal de veel-op-veel relatie tussen taken en users bevatten.

### Plan van aanpak
1. Nieuwe tabel aanmaken met de naam `task_users`
2. Veel-op-veel relatie tussen taken en users definiëren in de models
3. Veel-op-veel relatie tussen taken en users gebruiken in de controllers
4. Veel-op-veel relatie tussen taken en users gebruiken in de views
5. Route aanpassen
6. Controller aanpassen
7. View aanpassen
8. Route aanpassen
9. Controller aanpassen
10. View aanpassen  

