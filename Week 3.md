## Week 3

- [Week 3](#week-3)
  - [Leerdoelen week 3](#leerdoelen-week-3)
  - [Vorige lessen](#vorige-lessen)
  - [Les 6: C.R.U.D.](#les-6-crud)
    - [Index method](#index-method)
      - [Opdracht 1](#opdracht-1)
    - [Show method](#show-method)
      - [Opdracht 2](#opdracht-2)
    - [Create method](#create-method)
    - [Store method](#store-method)
    - [foutmeldingen tonen](#foutmeldingen-tonen)
      - [Opdracht 3](#opdracht-3)
      - [Opdracht 4](#opdracht-4)
    - [Edit method](#edit-method)
      - [Opdracht 5](#opdracht-5)
    - [Update method](#update-method)
  - [Les 7: Eloquent Models](#les-7-eloquent-models)
    - [Model aanmaken](#model-aanmaken)
    - [Model gebruiken](#model-gebruiken)
      - [Opdracht 6](#opdracht-6)
    - [Overige Post methodes aanpassen](#overige-post-methodes-aanpassen)
      - [Opdracht 7](#opdracht-7)
      - [Opdracht 8](#opdracht-8)
        - [Opdracht 9](#opdracht-9)
        - [Opdracht 10](#opdracht-10)

### Leerdoelen week 3

> - Ik kan een formulier gebruiken in Laravel.
> - Ik kan gegevens uit een formulier halen in Laravel.
> - Ik kan gegevens opslaan in de database met een formulier in Laravel.
> - Ik kan een formulier valideren in Laravel.
> - Ik kan een foutmelding tonen bij een formulier in Laravel.
> - Ik kan een formulier opnieuw tonen met ingevulde gegevens in Laravel.
> - Ik kan een formulier gebruiken in een view in Laravel.
> - Ik maak gebruik van Eloquent Models in Laravel.

### Vorige lessen

> - Ik kan een layout gebruiken in Laravel.
> - Ik kan een controller gebruiken in Laravel.
> - Ik kan een view gebruiken in Laravel.
> - Ik kan een route gebruiken in Laravel.
> - Ik kan een database gebruiken in Laravel.
> - Ik kan een tabel aanmaken in de database met een migratie.
> - Ik kan testgegevens invoegen in de database met een seeder.
> - Ik kan gegevens uit de database tabel halen.
> - Ik kan gegevens doorgeven aan de view.
> - Ik kan een nieuwe route en view toevoegen aan mijn website.

### Les 6: C.R.U.D.

In de vorige les heb je een index methode gemaakt die alle rijen uit de database haalt en doorgeeft aan de view. In deze les ga je een C.R.U.D. systeem maken. C.R.U.D. staat voor Create, Read, Update en Delete. Met een C.R.U.D. systeem kan je gegevens toevoegen, lezen, bewerken en verwijderen uit de database.

#### Index method

De index methode uit de vorige les was niet helemaal goed. Deze gaan we refactoren (aanpassen).

##### Opdracht 1

1. Maak in de view map een nieuwe map aan genaamd `posts`.
2. Pas het bestand `posts.blade.php` aan naar `index.blade.php` en zet deze in de map `posts`
3. Pas de code in de `index` methode in de `PostController` aan zodat de view `posts/index.blade.php` wordt gereturned door `return view('posts.index', compact('posts'));` te schrijven.

#### Show method

1.  Voeg de volgende code toe aan `PostController.php` om een enkele post te tonen

```php
public function show($id)
{
   $post = DB::table('posts')->find($id);
   return view('posts.show', compact('post'));
}
```

2.  Maak een nieuwe route aan in `web.php` om de `show` methode te tonen

```php
Route::get('/posts/{id}', [ PostController::class, 'show' ]);
```

3.  Maak een nieuwe view aan met de naam `show.blade.php` in de map `posts` en toon de gegevens van de post.
4.  Test je code. Ga naar `http://blog.test/posts/1` en je ziet de gegevens van de post met id 1.

##### Opdracht 2

Maak een `show` methode in de `CategoryController` om een enkele categorie te tonen. Maak een nieuwe route aan in `web.php` om de `show` methode te tonen. Maak een nieuwe view aan met de naam `show.blade.php` in de map `categories` en toon de gegevens van de categorie.

#### Create method

1.  Maak het bestand `resources/views/posts/create.blade.php`
2.  Maak een nieuwe route aan in `web.php` om het formulier te tonen.

```php
Route::get('/posts/create', [ PostController::class, 'create' ]);
```

3.  Voeg de volgende code toe aan `PostController.php` om het formulier te tonen.

```php
public function create()
{
   return view('posts.create');
}
```

4.  Voeg de volgende code toe aan `create.blade.php` om een formulier te maken.

```php
<form action="/posts" method="POST">
   @csrf
   <label for="title">Title</label>
   <input type="text" name="title" id="title">
   <label for="content">Content</label>
   <textarea name="content" id="content"></textarea>
   <button type="submit">Submit</button>
</form>
```

#### Store method

1.  Maak een nieuwe route aan in `web.php` om het formulier te verwerken.

```php
Route::post('/posts', [ PostController::class, 'store' ]);
```

2.  Voeg de volgende code toe aan `PostController.php` om het formulier te verwerken.

```php
public function store(Request $request)
{
   //hier controleer je of de velden title en content zijn ingevuld
   $request->validate([
      'title' => 'required',
      'content' => 'required',
   ]);

   DB::table('posts')->insert([
      'title' => $request->title,
      'slug'  => Str::slug($request->title),
      'content' => $request->content,
   ]);

   return redirect('/posts');
}
```

4.  Waarschijnlijk krijg je een foutmelding dat de `Str` class niet bestaat. Voeg de volgende code toe bovenaan `PostController.php` om de `Str` class te importeren.

```php
use Illuminate\Support\Str;
```

5.  Test je code. Ga naar `http://blog.test/posts/create` en vul het formulier in. Klik op de submit knop. Je wordt doorgestuurd naar `http://blog.test/posts` en de gegevens zijn opgeslagen in de database.

#### foutmeldingen tonen

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

2.  Test je code. Ga naar `http://blog.test/posts/create` en klik op de submit knop zonder iets in te vullen. Je krijgt een foutmelding te zien.

##### Opdracht 3

Maak een formulier aan voor het toevoegen van een nieuwe categorie. Een categorie heeft een naam, een beschrijving en een slug. De slug wordt automatisch gegenereerd op basis van de naam. De gebruiker dient de naam en de beschrijving in te vullen. De slug wordt automatisch gegenereerd. Als de gebruiker de naam en de beschrijving niet invult, dan moet er een foutmelding getoond worden. Als de gebruiker de naam en de beschrijving invult, dan moet de categorie toegevoegd worden aan de database en moet de gebruiker doorgestuurd worden naar de categorieën pagina.

##### Opdracht 4

Zorg ervoor dat de data gevalideerd wordt en eventuele foutmeldingen getoond worden op de pagina `create.blade.php`.

#### Edit method

1.  Voeg de volgende code toe aan `PostController.php` om een post te bewerken

```php
public function edit($id)
{
      $post = DB::table('posts')->find($id);
      return view('posts.edit', compact('post'));
}
```

2.  Maak een nieuwe route aan in `web.php` om de `edit` methode te tonen

```php
Route::get('/posts/{id}/edit', [ PostController::class, 'edit' ]);
```

3.  Maak een nieuwe view aan met de naam `edit.blade.php` in de map `posts` en toon een formulier om de gegevens van de post te bewerken.
4.  Test je code. Ga naar `http://blog.test/posts/1/edit` en je ziet een formulier om de gegevens van de post met id 1 te bewerken.

##### Opdracht 5

Maak een `edit` methode in de `CategoryController` om een categorie te bewerken. Maak een nieuwe route aan in `web.php` om de `edit` methode te tonen. Maak een nieuwe view aan met de naam `edit.blade.php` in de map `categories` en toon een formulier om de gegevens van de categorie te bewerken.

#### Update method

1.  Voeg de volgende code toe aan `PostController.php` om een post te updaten

```php
public function update(Request $request, $id)
{
      $request->validate([
         'title' => 'required',
         'content' => 'required',
      ]);

      $post = DB::table('posts')->where('id', $id)->update([
         'title' => $request->title,
         'slug'  => Str::slug($request->title),
         'content' => $request->content,
      ]);


      return redirect('/posts');
}
```

2.  Maak een nieuwe route aan in `web.php` om de `update` methode te verwerken

```php
Route::put('/posts/{id}', [ PostController::class, 'update' ]);
```

3.  Voeg de volgende code toe aan `edit.blade.php` om de gegevens van de post te tonen in het formulier
4.  Test je code. Ga naar `http://blog.test/posts/1/edit` en bewerk de gegevens van de post met id 1.
5.  Klik op de submit knop en je wordt doorgestuurd naar `http://blog.test/posts` en de gegevens zijn geüpdatet in de database.
6.  Voeg de volgende code toe aan `edit.blade.php` om de gegevens van de post te tonen in het formulier

```php
<form action="/posts/{{ $post->id }}" method="POST">
   @csrf
   @method('PUT')
   <label for="title">Title</label>
   <input type="text" name="title" id="title" value="{{ $post->title }}">
   <label for="content">Content</label>
   <textarea name="content" id="content">{{ $post->content }}</textarea>
   <button type="submit">Submit</button>
</form>
```

7.  Test je code. Ga naar `http://blog.test/posts/1/edit` en bewerk de gegevens van de post met id 1. Klik op de submit knop en je wordt doorgestuurd naar `http://blog.test/posts` en de gegevens zijn geüpdatet in de database.

### Les 7: Eloquent Models

In de zevende les leer je hoe je Eloquent Models kan gebruiken in Laravel. Een Eloquent Model is een PHP-klasse die de gegevens van een tabel in de database representeert. Met een Eloquent Model kan je gegevens uit de database halen, gegevens in de database zetten en gegevens in de database verwijderen.

#### Model aanmaken

1.  Open een terminal
2.  Maak een nieuwe model aan met de naam `Post` door het volgende commando uit te voeren:

```bash
php artisan make:model Post
```

Dit model representeert de tabel `posts` in de database.
Laravel is slim genoeg om te weten dat de model `Post` de tabel `posts` representeert.

#### Model gebruiken

1.  Voeg de volgende code toe aan `PostController.php` om het model te gebruiken. (_Let op: voeg de juiste import toe bovenaan het bestand_)

```php
use App\Models\Post;
```

2.  Pas de code van de `index` methode in de `PostController.php` aan om gegevens uit de database te halen

```php
public function index()
{
   // $posts = DB::table('posts')->get();
   $posts = Post::all();
   return view('posts.index', compact('posts'));
}
```

##### Opdracht 6

Maak een model aan met de naam `Category` en zorg ervoor dat de model de tabel `categories` representeert. Voeg de velden `name`, `slug` en `description` toe aan het model. Gebruik de `Category` model in de `CategoryController` om gegevens uit de database te halen en te tonen in de view `categories/index.blade.php`.

#### Overige Post methodes aanpassen

We dienen het model Post ook te gebruiken in de show methode. We passen de show methode aan zodat we het model Post gebruiken.

```php
public function show($id)
{
   // $post = DB::table('posts')->find($id);
   $post = Post::find($id);
   return view('posts.show', compact('post'));
}
```

En in de store methode

```php
public function store(Request $request)
{
   $request->validate([
      'title' => 'required',
      'content' => 'required',
   ]);

   // DB::table('posts')->insert([
   Post::create([
      'title' => $request->title,
      'slug'  => Str::slug($request->title),
      'content' => $request->content,
   ]);

   return redirect('/posts');
}
```

En in de edit methode

```php
public function edit($id)
{
   // $post = DB::table('posts')->find($id);
   $post = Post::find($id);
   return view('posts.edit', compact('post'));
}
```

En in de update methode

```php
public function update(Request $request, $id)
{
   $request->validate([
      'title' => 'required',
      'content' => 'required',
   ]);

   // $post = DB::table('posts')->where('id', $id)->update([
   $post = Post::where('id', $id)->update([
      'title' => $request->title,
      'slug'  => Str::slug($request->title),
      'content' => $request->content,
   ]);

   return redirect('/posts');
}
```

##### Opdracht 7

Pas de show methode in de `CategoryController` aan zodat de `Category` model gebruikt wordt in plaats van de `DB` class.

##### Opdracht 8

Pas de store methode in de `CategoryController` aan zodat de `Category` model gebruikt wordt in plaats van de `DB` class.

###### Opdracht 9

Pas de edit methode in de `CategoryController` aan zodat de `Category` model gebruikt wordt in plaats van de `DB` class.

###### Opdracht 10
