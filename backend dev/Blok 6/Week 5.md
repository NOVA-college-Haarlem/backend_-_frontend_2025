# Week 5 - Laravel Todo List Project

We gaan nu flash messages toevoegen aan de todo list.

### Opdracht 1: Flash messages toevoegen
1. Open het bestand `app/Http/Controllers/TaskController.php`
2. Voeg de volgende code toe:
    ```php
    return redirect()->route('tasks.index')->with('success', 'Taak succesvol aangemaakt!');
    ```
3. Sla de wijzigingen op en open de pagina `/tasks/create` in je browser.
4. We zien nu de flash message.

### Opdracht 2: Flash messages toevoegen in de views    

1. Open de view `tasks.create.blade.php`
2. Voeg de volgende code toe:
    ```php
    <div class="alert alert-success">
        {{ session('success') }}
    </div>
    ```
3. Sla de wijzigingen op en open de pagina `/tasks/create` in je browser.
4. We zien nu de flash message.

### Opdracht 3.

1. Voe de flash messages toe aan de delete functionaliteit binnen je applicatie
2. Voeg flash messages toe aan de edit functionaliteit binnen je applicatie
3. Voeg flash messages toe aan de create functionaliteit binnen je applicatie
4. Voeg flash messages toe aan de index functionaliteit binnen je applicatie
5. Voeg flash messages toe aan de show functionaliteit binnen je applicatie
6. Voeg flash messages toe aan de destroy functionaliteit binnen je applicatie
7. Voeg flash messages toe aan de restore functionaliteit binnen je applicatie
8. Voeg flash messages toe aan de force delete functionaliteit binnen je applicatie
9. Voeg flash messages toe aan de restore all functionaliteit binnen je applicatie
10. Voeg flash messages toe aan de force delete all functionaliteit binnen je applicatie

