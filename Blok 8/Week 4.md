# Week 4

- [Week 4](#week-4)
  - [Leerdoelen week 4](#leerdoelen-week-4)
  - [Les 8: Relaties tussen tabellen](#les-8-relaties-tussen-tabellen)
    - [Opdracht 1](#opdracht-1)
    - [1-op-veel relatie](#1-op-veel-relatie)
  - [Formulieren en relaties](#formulieren-en-relaties)
  - [Veel-op-veel relatie](#veel-op-veel-relatie)
    - [Migratie Pivot table](#migratie-pivot-table)
      - [Relatie Post - Tag](#relatie-post---tag)
      - [Relatie Tag - Post](#relatie-tag---post)


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

1. Open het migratiebestand `create_posts_table.php` in de map `database/migrations`.
2. Voeg de volgende code toe aan de `posts` tabel:

```php
 //net na description
 $table->foreignId('category_id')->constrained();

```

3. In de terminal, run `php artisan migrate:fresh --seed` om de migraties opnieuw uit te voeren en de seeders te runnen.
4. Open het bestand `Post.php` in de map `app/Models`.
5. Voeg de volgende code toe aan het `Post` model:

```php
public function category()
{
    return $this->belongsTo(Category::class);
}
```

Nu hebben we een relatie tussen de `posts` en `categories` tabellen. 

> Een post heeft dus een category.

Als we de category name van de post willen tonen, kunnen we dit doen met de volgende code:

```php
echo $post->category->name;
```

### 1-op-veel relatie

Om de relatie de andere kant op te maken, moeten we de Category model aanpassen.

```php
public function posts()
{
    return $this->hasMany(Post::class);
}
```

Als je dan andersom de posts van een category wilt tonen, kun je dit doen met de volgende code:

```php
//categories show
foreach ($category->posts as $post) {
    echo $post->title;
}
```

## Formulieren en relaties

Stel je maakt een nieuwe post aan, dan moet je ook de category_id invullen. Dit kan je doen met de volgende code in de `store` methode van de `PostController`:

```php
$post = new Post();
$post->title = $request->title;
$post->description = $request->description;
$post->category_id = $request->category_id;
$post->save();
```

De `category_id` moet een integer zijn en een verwijzing naar een rij in de `categories` tabel. 

In het formulier moet je dan ook een selectie maken met de mogelijke categories. Dit kan je doen met de volgende code in de `create` view:

```php
<select name="category_id">
    @foreach ($categories as $category)
        <option value="{{ $category->id }}">{{ $category->name }}</option>
    @endforeach
</select>
```

Als je deze code in de `create` view zet, dan krijg je een dropdown met de mogelijke categories.
Maar daarvoor moet je wel de categories naar de view sturen. Dit kan je doen met de volgende code in de `index` methode van de `PostController`:

```php
return view('posts.index', compact('posts', 'categories'));
```

Bij het updaten van een post moet je ook de category_id invullen. Dit kan je doen met de volgende code in de `update` methode van de `PostController`:

```php
$post = Post::find($id); // of Post::findOrFail($id); // of via model view binding
$post->title = $request->title;
$post->description = $request->description;
$post->category_id = $request->category_id;
$post->save();
```

In het formulier, in de view `edit.blade.php` moet je dan ook de category_id invullen. Bestaande gegevens worden meegegeven aan de view.

```php
<form action="{{ route('posts.update', $post->id) }}" method="POST">
    @csrf
    @method('PUT')
    <div>
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" value="{{ old('title', $post->title ?? '') }}" required>
    </div>
    <div>
        <label for="description">Description:</label>
        <textarea id="description" name="description" required>{{ old('description', $post->description ?? '') }}</textarea>
    </div>
    <div>
        <label for="category_id">Category:</label>
        <select id="category_id" name="category_id" required>
            @foreach ($categories as $category)
                <option value="{{ $category->id }}" {{ (old('category_id', $post->category_id ?? '') == $category->id) ? 'selected' : '' }}>
                    {{ $category->name }}
                </option>
            @endforeach
        </select>
    </div>
    <div>
        <button type="submit">Save Post</button>
    </div>
</form>
```

Toelichting:

- CSRF Token: De @csrf-directive wordt gebruikt om een CSRF-token in het formulier op te nemen voor beveiliging.
- Method: De @method('PUT')-directive wordt gebruikt om de HTTP-methode PUT te specificeren, wat betekent dat het formulier gebruikt wordt om een bestaande resource bij te werken.
- Titel en Beschrijving: Deze velden zijn bedoeld voor het invoeren van de titel en beschrijving van de post. De waarde en inhoud van de textarea gebruiken de old() helper om het formulier opnieuw in te vullen met eerdere invoergegevens in geval van validatiefouten, of met bestaande gegevens als je een post bewerkt.
- Categorie Selectie: Er wordt een dropdownmenu aangeboden om een categorie te selecteren. Het gebruikt een lus om opties uit de $categories-collectie te vullen, en de old() helper om de geselecteerde categorie te behouden in geval van fouten of bij het bewerken.
- Verzendknop: Een eenvoudige knop om het formulier te verzenden.
Dit formulier gaat ervan uit dat je een route hebt genaamd posts.update voor het afhandelen van de formulierinzending, en dat je een $categories-collectie en optioneel een $post-object naar de view stuurt. Pas de route- en variabelenamen aan indien nodig voor je applicatie.


## Veel-op-veel relatie

Om een veel-op-veel relatie tussen tags en posts te maken in Laravel, moet je een pivot table aanmaken en de nodige relaties in de modellen definiëren. Hier zijn de stappen:

### Migratie Pivot table

1. Maak een migratie voor de pivot table
Je moet een pivot table maken die de post_id en tag_id bevat. Voer het volgende commando uit om een migratie te maken:

> php artisan make:migration create_post_tag_table

2. Vul de migratie aan met de volgende code:

```php
public function up()
{
    Schema::create('post_tag', function (Blueprint $table) {
        $table->id();
        $table->foreignId('post_id')->constrained()->onDelete('cascade');
        $table->foreignId('tag_id')->constrained()->onDelete('cascade');
        $table->timestamps();
    });
}
```

Defineer de relaties in de Post en Tag modellen.

#### Relatie Post - Tag

```php
public function tags()
{
    return $this->belongsToMany(Tag::class);
}
```


#### Relatie Tag - Post
```php
public function posts()
{
    return $this->belongsToMany(Post::class);
}
```

Toon de tags bij het maken van een post in de PostController, create method:

```php
public function create(Request $request)
{
    $categories = Category::all();
    $tags = Tag::all();
    return view('posts.create', compact('categories', 'tags'));
}
