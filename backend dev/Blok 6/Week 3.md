# Blok 9 - Laravel Todo List Project

## Week 3

### Introductie
Vorige week hebben we de taken toegevoegd aan de database en de views aangepast. Nu gaan we de CRUD operaties uitbreiden met edit en delete functionaliteit.

### Leerdoelen
- CRUD operaties uitbreiden met edit en delete functionaliteit
- Flash messages gebruiken

---

## Opdracht 1: Edit Functionaliteit

### Opdracht 1.1: Edit Method in Controller
1. Open de controller `app/Http/Controllers/TaskController.php`
2. Voeg de volgende methode toe:
    ```php
    public function edit(Task $task)
    {
        return view('tasks.edit', compact('task'));
    }
    ```

### Opdracht 1.2: Edit View Maken
1. Maak een nieuwe view aan voor het bewerken van een taak. Voeg een route toe in `routes/web.php` en maak gebruik van de `edit` methode in `TaskController` om de view `tasks.edit.blade.php` te tonen.
2. Pas de view `tasks.edit.blade.php` aan zodat er een formulier getoond wordt om een taak te kunnen bewerken. Denk aan alle attributen zoals ze beschreven staan in de tabel `tasks` in de database.


Zie hieronder de volledige code:
```php
<x-base-layout>
    <h1>Taak bewerken</h1>
    <form action="{{ route('tasks.update', $task) }}" method="post">
        @csrf
        @method('PUT')

        <label for="title">Titel</label>
        <input type="text" name="title" id="title" value="{{ $task->title }}">
        <label for="description">Description</label>
        <textarea name="description" id="description">{{ $task->description }}</textarea>
        <label for="due_date">Due Date</label>
        <input type="date" name="due_date" id="due_date" value="{{ $task->due_date }}">
        <label for="completed">Completed</label>
        <input type="checkbox" name="completed" id="completed" value="{{ $task->completed }}">
        <button type="submit">Taak bewerken</button>
    </form>
</x-base-layout>
```

Je web.php route:
```php
Route::get('/tasks/{task}/edit', [TaskController::class, 'edit'])->name('tasks.edit');
Route::put('/tasks/{task}', [TaskController::class, 'update'])->name('tasks.update');
```

De TaskController edit methode:
```php
public function edit(Task $task)
{
    return view('tasks.edit', compact('task'));
}
``` 


De TaskController update methode:
```php
public function update(Request $request, Task $task)
{
   $task = Task::findOrFail($id);
        $task->title = $request->title;
    $task->description = $request->description;
    $task->due_date = $request->due_date;
    $task->is_completed = $request->completed ? false : true;
    $task->user_id = 1; //tijdelijke user_id, later aanpassen naar ingelogde gebruiker
    $task->category_id = 1; //tijdelijke category_id, later aanpassen naar gekozen categorie
    $task->save(); //hiermee slaan we de taak op in de database
    return redirect()->route('tasks.index');
}
```

### Opdracht 1.3: Delete Functionaliteit

De TaskController delete methode:
```php
    public function destroy($id)
    {
        $task = Task::findOrFail($id);
        $task->delete();

        return redirect()->route('tasks.index');
    }
```

In de index view:
```php
<p>
    <form method="post" action="{{ route('tasks.destroy', $task->id) }}">
        @csrf
        @method('DELETE')
        <button type="submit">DELETE</button>
    </form>
</p>
```

In de web.php route:
```php
Route::delete('/tasks/{task}', [TaskController::class, 'destroy'])->name('tasks.destroy');


```
