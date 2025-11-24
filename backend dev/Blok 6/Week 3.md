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

