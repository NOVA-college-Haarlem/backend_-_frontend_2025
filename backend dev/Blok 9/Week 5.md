# Week 5 - Spatie Permission & User Roles

## Les 1: Posts koppelen aan Users

In deze les gaan we nieuwsberichten (posts) koppelen aan gebruikers (users). Elk nieuwsbericht krijgt een auteur en we breiden het user model uit met een `is_admin` attribuut.

### Opdracht 1: Migration aanpassen - User uitbreiden

1. Maak een nieuwe migration aan om het `users` model uit te breiden:
```bash
php artisan make:migration add_is_admin_to_users_table
```

2. Open het migration bestand in `database/migrations/` en voeg het volgende toe:
```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->boolean('is_admin')->default(false)->after('email');
        });
    }

    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn('is_admin');
        });
    }
};
```

3. Voer de migration uit:
```bash
php artisan migrate
```

---

### Opdracht 2: Migration aanpassen - Posts koppelen aan Users

1. Maak een nieuwe migration aan om posts te koppelen aan users:
```bash
php artisan make:migration add_user_id_to_posts_table
```

2. Open het migration bestand en voeg het volgende toe:
```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('posts', function (Blueprint $table) {
            $table->foreignId('user_id')->after('id')->constrained()->onDelete('cascade');
        });
    }

    public function down(): void
    {
        Schema::table('posts', function (Blueprint $table) {
            $table->dropForeign(['user_id']);
            $table->dropColumn('user_id');
        });
    }
};
```

3. Voer de migration uit:
```bash
php artisan migrate
```

---

### Opdracht 3: Models aanpassen - Relaties defini�ren

1. Open het `User` model (`app/Models/User.php`) en voeg de relatie toe:
```php
<?php

namespace App\Models;

// ... andere imports

class User extends Authenticatable
{
    // ... bestaande code

    /**
     * Get the posts for the user.
     */
    public function posts()
    {
        return $this->hasMany(Post::class);
    }

    /**
     * Check if user is admin.
     */
    public function isAdmin()
    {
        return $this->is_admin;
    }
}
```

2. Open het `Post` model (`app/Models/Post.php`) en voeg de relatie toe:
```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'content',
        'user_id',
    ];

    /**
     * Get the user that owns the post.
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
```

---

### Opdracht 4: Seeder aanpassen

1. Open `database/seeders/DatabaseSeeder.php` en pas deze aan:
```php
<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Post;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        // Maak een admin user
        $admin = User::factory()->create([
            'name' => 'Admin User',
            'email' => 'admin@example.com',
            'is_admin' => true,
        ]);

        // Maak gewone users
        $user1 = User::factory()->create([
            'name' => 'John Doe',
            'email' => 'john@example.com',
        ]);

        $user2 = User::factory()->create([
            'name' => 'Jane Smith',
            'email' => 'jane@example.com',
        ]);

        // Maak posts voor admin
        Post::create([
            'user_id' => $admin->id,
            'title' => 'Welkom op onze nieuwssite',
            'content' => 'Dit is het eerste nieuwsbericht op onze site.',
        ]);

        // Maak posts voor gewone users
        Post::create([
            'user_id' => $user1->id,
            'title' => 'Laravel is geweldig',
            'content' => 'Laravel maakt webdevelopment een stuk makkelijker.',
        ]);

        Post::create([
            'user_id' => $user2->id,
            'title' => 'PHP 8.3 nieuwe features',
            'content' => 'PHP 8.3 brengt geweldige nieuwe features.',
        ]);
    }
}
```

2. Reset en seed de database:
```bash
php artisan migrate:fresh --seed
```

---

### Opdracht 5: Posts tonen met auteur informatie

1. Pas de posts index view aan om auteur informatie te tonen (`resources/views/posts/index.blade.php`):
```blade
<x-app-layout>
    <div class="container mx-auto px-6 py-8">
        <h1 class="text-3xl font-bold mb-6">Alle Nieuwsberichten</h1>

        @foreach($posts as $post)
            <div class="bg-white rounded-lg shadow-md p-6 mb-4">
                <h2 class="text-2xl font-bold mb-2">{{ $post->title }}</h2>
                <p class="text-gray-600 text-sm mb-4">
                    Door: <strong>{{ $post->user->name }}</strong>
                    @if($post->user->is_admin)
                        <span class="text-red-600">(Admin)</span>
                    @endif
                    | {{ $post->created_at->format('d-m-Y H:i') }}
                </p>
                <p class="text-gray-700">{{ Str::limit($post->content, 200) }}</p>
                <a href="{{ route('posts.show', $post) }}" class="text-blue-600 hover:underline mt-2 inline-block">
                    Lees meer �
                </a>
            </div>
        @endforeach
    </div>
</x-app-layout>
```

---

## Les 2: Spatie Permission Installeren

Nu gaan we Spatie Permission (v6) installeren voor een professioneel rollen en permissies systeem.

### Opdracht 6: Spatie Permission Installeren

1. Installeer het package via Composer:
```bash
e
```

2. Publiceer de configuratie en migrations:
```bash
php artisan vendor:publish --provider="Spatie\Permission\PermissionServiceProvider"
```

3. Voer de migrations uit:
```bash
php artisan migrate
```

Dit cre�ert de volgende tabellen:
- `roles` - Voor rollen (bijv. admin, editor, author)
- `permissions` - Voor specifieke permissies (bijv. create-post, edit-post)
- `model_has_roles` - Koppeltabel tussen users en rollen
- `model_has_permissions` - Koppeltabel tussen users en directe permissies
- `role_has_permissions` - Koppeltabel tussen rollen en permissies

---

### Opdracht 7: User Model aanpassen

1. Voeg de `HasRoles` trait toe aan het `User` model:
```php
<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Spatie\Permission\Traits\HasRoles;

class User extends Authenticatable
{
    use HasRoles;

    // ... rest van de code
}
```

---

### Opdracht 8: Roles en Permissions Seeder maken

1. Maak een nieuwe seeder:
```bash
php artisan make:seeder RolePermissionSeeder
```

2. Open `database/seeders/RolePermissionSeeder.php` en voeg toe:
```php
<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Models\User;

class RolePermissionSeeder extends Seeder
{
    public function run(): void
    {
        // Reset cached roles and permissions
        app()[\Spatie\Permission\PermissionRegistrar::class]->forgetCachedPermissions();

        // Maak permissions
        $permissions = [
            'view posts',
            'create posts',
            'edit posts',
            'delete posts',
            'publish posts',
            'manage users',
        ];

        foreach ($permissions as $permission) {
            Permission::create(['name' => $permission]);
        }

        // Maak rollen en wijs permissions toe

        // Admin rol - alle rechten
        $adminRole = Role::create(['name' => 'admin']);
        $adminRole->givePermissionTo(Permission::all());

        // Editor rol - kan posts beheren maar geen users
        $editorRole = Role::create(['name' => 'editor']);
        $editorRole->givePermissionTo([
            'view posts',
            'create posts',
            'edit posts',
            'delete posts',
            'publish posts'
        ]);

        // Author rol - kan alleen eigen posts maken en bewerken
        $authorRole = Role::create(['name' => 'author']);
        $authorRole->givePermissionTo([
            'view posts',
            'create posts',
            'edit posts'
        ]);

        // Reader rol - kan alleen lezen
        $readerRole = Role::create(['name' => 'reader']);
        $readerRole->givePermissionTo(['view posts']);

        // Wijs rollen toe aan bestaande users
        $admin = User::where('email', 'admin@example.com')->first();
        if ($admin) {
            $admin->assignRole('admin');
        }

        $john = User::where('email', 'john@example.com')->first();
        if ($john) {
            $john->assignRole('editor');
        }

        $jane = User::where('email', 'jane@example.com')->first();
        if ($jane) {
            $jane->assignRole('author');
        }
    }
}
```

3. Voeg de seeder toe aan `DatabaseSeeder.php`:
```php
public function run(): void
{
    // ... bestaande code

    // Voeg toe na het aanmaken van users en posts
    $this->call([
        RolePermissionSeeder::class,
    ]);
}
```

4. Reset en seed de database opnieuw:
```bash
php artisan migrate:fresh --seed
```

---

### Opdracht 9: Middleware voor Permissions

1. Publiceer de Spatie middleware configuratie (optioneel, maar handig):
```bash
php artisan vendor:publish --provider="Spatie\Permission\PermissionServiceProvider" --tag="config"
```

2. Registreer de middleware in `app/Http/Kernel.php` (of `bootstrap/app.php` voor Laravel 11+):

Voor Laravel 10:
```php
// In app/Http/Kernel.php
protected $middlewareAliases = [
    // ... andere middleware
    'role' => \Spatie\Permission\Middleware\RoleMiddleware::class,
    'permission' => \Spatie\Permission\Middleware\PermissionMiddleware::class,
    'role_or_permission' => \Spatie\Permission\Middleware\RoleOrPermissionMiddleware::class,
];
```

Voor Laravel 11:
```php
// In bootstrap/app.php
->withMiddleware(function (Middleware $middleware) {
    $middleware->alias([
        'role' => \Spatie\Permission\Middleware\RoleMiddleware::class,
        'permission' => \Spatie\Permission\Middleware\PermissionMiddleware::class,
        'role_or_permission' => \Spatie\Permission\Middleware\RoleOrPermissionMiddleware::class,
    ]);
})
```

---

### Opdracht 10: Routes beveiligen met Permissions

1. Pas `routes/web.php` aan om routes te beschermen:
```php
<?php

use App\Http\Controllers\PostController;
use Illuminate\Support\Facades\Route;

// Publieke routes
Route::get('/', [PostController::class, 'index'])->name('home');
Route::get('/posts', [PostController::class, 'index'])->name('posts.index');
Route::get('/posts/{post}', [PostController::class, 'show'])->name('posts.show');

// Routes die authenticatie vereisen
Route::middleware(['auth'])->group(function () {
    Route::get('/dashboard', function () {
        return view('dashboard');
    })->name('dashboard');

    // Posts maken - alleen voor users met 'create posts' permission
    Route::middleware(['permission:create posts'])->group(function () {
        Route::get('/posts/create', [PostController::class, 'create'])->name('posts.create');
        Route::post('/posts', [PostController::class, 'store'])->name('posts.store');
    });

    // Posts bewerken - alleen voor users met 'edit posts' permission
    Route::middleware(['permission:edit posts'])->group(function () {
        Route::get('/posts/{post}/edit', [PostController::class, 'edit'])->name('posts.edit');
        Route::put('/posts/{post}', [PostController::class, 'update'])->name('posts.update');
    });

    // Posts verwijderen - alleen voor users met 'delete posts' permission
    Route::delete('/posts/{post}', [PostController::class, 'destroy'])
        ->name('posts.destroy')
        ->middleware('permission:delete posts');
});

// Admin routes - alleen voor admin rol
Route::middleware(['auth', 'role:admin'])->prefix('admin')->name('admin.')->group(function () {
    Route::get('/users', function () {
        return view('admin.users.index');
    })->name('users.index');
});
```

---

### Opdracht 11: Controller aanpassen met Authorization

1. Pas `PostController` aan om permissions te checken:
```php
<?php

namespace App\Http\Controllers;

use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PostController extends Controller
{
    public function index()
    {
        $posts = Post::with('user')->latest()->get();
        return view('posts.index', compact('posts'));
    }

    public function create()
    {
        // Check permission (redundant als je middleware gebruikt, maar extra veiligheid)
        if (!Auth::user()->can('create posts')) {
            abort(403, 'Je hebt geen toestemming om posts aan te maken.');
        }

        return view('posts.create');
    }

    public function store(Request $request)
    {
        if (!Auth::user()->can('create posts')) {
            abort(403);
        }

        $validated = $request->validate([
            'title' => 'required|max:255',
            'content' => 'required',
        ]);

        $post = Auth::user()->posts()->create($validated);

        return redirect()->route('posts.show', $post)
            ->with('success', 'Post succesvol aangemaakt!');
    }

    public function show(Post $post)
    {
        return view('posts.show', compact('post'));
    }

    public function edit(Post $post)
    {
        // Check of user ofwel admin is, ofwel de eigenaar van de post
        if (!Auth::user()->can('edit posts') ||
            (!Auth::user()->hasRole('admin') && $post->user_id !== Auth::id())) {
            abort(403, 'Je kunt alleen je eigen posts bewerken.');
        }

        return view('posts.edit', compact('post'));
    }

    public function update(Request $request, Post $post)
    {
        if (!Auth::user()->can('edit posts') ||
            (!Auth::user()->hasRole('admin') && $post->user_id !== Auth::id())) {
            abort(403);
        }

        $validated = $request->validate([
            'title' => 'required|max:255',
            'content' => 'required',
        ]);

        $post->update($validated);

        return redirect()->route('posts.show', $post)
            ->with('success', 'Post succesvol bijgewerkt!');
    }

    public function destroy(Post $post)
    {
        if (!Auth::user()->can('delete posts')) {
            abort(403);
        }

        // Alleen admin of de eigenaar kan verwijderen
        if (!Auth::user()->hasRole('admin') && $post->user_id !== Auth::id()) {
            abort(403, 'Je kunt alleen je eigen posts verwijderen.');
        }

        $post->delete();

        return redirect()->route('posts.index')
            ->with('success', 'Post succesvol verwijderd!');
    }
}
```

---

### Opdracht 12: Blade directives gebruiken

1. Pas je views aan om knoppen conditioneel te tonen op basis van permissions:

`resources/views/posts/show.blade.php`:
```blade
<x-app-layout>
    <div class="container mx-auto px-6 py-8">
        <div class="bg-white rounded-lg shadow-md p-8">
            <h1 class="text-3xl font-bold mb-4">{{ $post->title }}</h1>

            <div class="text-gray-600 text-sm mb-6">
                <p>Door: <strong>{{ $post->user->name }}</strong></p>
                <p>Gepubliceerd op: {{ $post->created_at->format('d-m-Y H:i') }}</p>
            </div>

            <div class="prose max-w-none mb-6">
                {{ $post->content }}
            </div>

            <div class="flex gap-4">
                <a href="{{ route('posts.index') }}" class="text-blue-600 hover:underline">
                    � Terug naar overzicht
                </a>

                @can('edit posts')
                    @if(Auth::user()->hasRole('admin') || $post->user_id === Auth::id())
                        <a href="{{ route('posts.edit', $post) }}"
                           class="text-green-600 hover:underline">
                            Bewerken
                        </a>
                    @endif
                @endcan

                @can('delete posts')
                    @if(Auth::user()->hasRole('admin') || $post->user_id === Auth::id())
                        <form method="POST" action="{{ route('posts.destroy', $post) }}"
                              onsubmit="return confirm('Weet je zeker dat je deze post wilt verwijderen?')">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="text-red-600 hover:underline">
                                Verwijderen
                            </button>
                        </form>
                    @endif
                @endcan
            </div>
        </div>
    </div>
</x-app-layout>
```

2. Update je navigatie om admin panel te tonen:

`resources/views/layouts/navigation.blade.php`:
```blade
<!-- Voeg toe aan de navigatie -->
@role('admin')
    <x-nav-link :href="route('admin.users.index')" :active="request()->routeIs('admin.*')">
        {{ __('Admin Panel') }}
    </x-nav-link>
@endrole

@can('create posts')
    <x-nav-link :href="route('posts.create')" :active="request()->routeIs('posts.create')">
        {{ __('Nieuw Bericht') }}
    </x-nav-link>
@endcan
```

---

### Opdracht 13: Policy maken (Optioneel maar Aanbevolen)

1. Maak een Policy voor Posts:
```bash
php artisan make:policy PostPolicy --model=Post
```

2. Open `app/Policies/PostPolicy.php` en voeg toe:
```php
<?php

namespace App\Policies;

use App\Models\Post;
use App\Models\User;

class PostPolicy
{
    /**
     * Determine if the user can view any posts.
     */
    public function viewAny(?User $user): bool
    {
        return true; // Iedereen kan posts zien
    }

    /**
     * Determine if the user can view the post.
     */
    public function view(?User $user, Post $post): bool
    {
        return true; // Iedereen kan een post zien
    }

    /**
     * Determine if the user can create posts.
     */
    public function create(User $user): bool
    {
        return $user->can('create posts');
    }

    /**
     * Determine if the user can update the post.
     */
    public function update(User $user, Post $post): bool
    {
        // Admin kan alles bewerken, of je moet de eigenaar zijn
        return $user->hasRole('admin') ||
               ($user->can('edit posts') && $user->id === $post->user_id);
    }

    /**
     * Determine if the user can delete the post.
     */
    public function delete(User $user, Post $post): bool
    {
        // Admin kan alles verwijderen, of je moet de eigenaar zijn
        return $user->hasRole('admin') ||
               ($user->can('delete posts') && $user->id === $post->user_id);
    }
}
```

3. Registreer de Policy in `app/Providers/AuthServiceProvider.php`:
```php
<?php

namespace App\Providers;

use App\Models\Post;
use App\Policies\PostPolicy;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    protected $policies = [
        Post::class => PostPolicy::class,
    ];

    public function boot(): void
    {
        //
    }
}
```

4. Vereenvoudig je Controller door Policies te gebruiken:
```php
public function edit(Post $post)
{
    $this->authorize('update', $post);
    return view('posts.edit', compact('post'));
}

public function update(Request $request, Post $post)
{
    $this->authorize('update', $post);

    $validated = $request->validate([
        'title' => 'required|max:255',
        'content' => 'required',
    ]);

    $post->update($validated);

    return redirect()->route('posts.show', $post)
        ->with('success', 'Post succesvol bijgewerkt!');
}
```

---

## Samenvatting & Belangrijke Concepten

### Spatie Permission Basis Commando's

**Users & Roles:**
```php
// Role toewijzen
$user->assignRole('admin');
$user->assignRole(['author', 'editor']);

// Role verwijderen
$user->removeRole('admin');

// Checken of user een role heeft
$user->hasRole('admin'); // boolean
$user->hasAnyRole(['admin', 'editor']); // boolean
$user->hasAllRoles(['admin', 'editor']); // boolean

// Alle rollen van een user ophalen
$user->getRoleNames(); // Collection
```

**Users & Permissions:**
```php
// Permission direct toewijzen aan user
$user->givePermissionTo('edit posts');
$user->givePermissionTo(['edit posts', 'delete posts']);

// Permission verwijderen
$user->revokePermissionTo('edit posts');

// Checken of user een permission heeft
$user->can('edit posts'); // boolean
$user->hasPermissionTo('edit posts'); // boolean

// Alle permissions van een user ophalen (via roles EN directe permissions)
$user->getAllPermissions(); // Collection
```

**Roles & Permissions:**
```php
// Permission toewijzen aan role
$role = Role::findByName('admin');
$role->givePermissionTo('edit posts');
$role->givePermissionTo(['edit posts', 'delete posts']);

// Permission verwijderen van role
$role->revokePermissionTo('edit posts');

// Alle permissions van een role ophalen
$role->permissions; // Collection
```

### Blade Directives

```blade
@role('admin')
    <!-- Alleen zichtbaar voor admin role -->
@endrole

@hasrole('admin')
    <!-- Alleen zichtbaar voor admin role -->
@endhasrole

@can('edit posts')
    <!-- Alleen zichtbaar als user 'edit posts' permission heeft -->
@endcan

@cannot('delete posts')
    <!-- Alleen zichtbaar als user GEEN 'delete posts' permission heeft -->
@endcannot

@hasanyrole('admin|editor')
    <!-- Zichtbaar als user admin OF editor is -->
@endhasanyrole

@hasallroles('admin|editor')
    <!-- Alleen zichtbaar als user admin EN editor is -->
@endhasallroles
```

### Middleware in Routes

```php
// Check role
Route::middleware(['role:admin'])->group(function () {
    // Routes alleen voor admins
});

// Check permission
Route::middleware(['permission:edit posts'])->group(function () {
    // Routes alleen voor users met 'edit posts' permission
});

// Check role OR permission
Route::middleware(['role_or_permission:admin|edit posts'])->group(function () {
    // Routes voor admins OF users met 'edit posts' permission
});

// Multiple roles
Route::middleware(['role:admin|editor'])->group(function () {
    // Routes voor admins OF editors
});
```

---

## Testing & Troubleshooting

### Test je permissions:

1. Log in als verschillende users:
   - admin@example.com (Admin rol)
   - john@example.com (Editor rol)
   - jane@example.com (Author rol)

2. Test de volgende scenario's:
   - Kan admin alles zien en bewerken?
   - Kan editor posts aanmaken en bewerken?
   - Kan author alleen eigen posts bewerken?
   - Worden knoppen correct getoond/verborgen?

### Debug commands:

```bash
# Cache clearen
php artisan cache:clear
php artisan permission:cache-reset

# Kijk welke roles en permissions bestaan
php artisan tinker
>>> \Spatie\Permission\Models\Role::all()
>>> \Spatie\Permission\Models\Permission::all()

# Check user permissions
>>> $user = \App\Models\User::find(1)
>>> $user->getRoleNames()
>>> $user->getAllPermissions()->pluck('name')
>>> $user->can('edit posts')
```

---

## Bonusopdrachten

1. **Admin Dashboard**: Maak een admin panel waar admins alle users kunnen zien en rollen kunnen toewijzen
2. **Role Management**: Maak een interface waar admins nieuwe rollen kunnen aanmaken en permissions kunnen toewijzen
3. **Activity Log**: Gebruik Spatie Activity Log om bij te houden wie wat bewerkt/verwijdert
4. **Soft Deletes**: Voeg soft deletes toe zodat posts niet echt verwijderd worden
5. **Post Status**: Voeg een 'published' status toe en een 'publish posts' permission

---

## Checklist

- [ ] Users hebben `is_admin` attribuut
- [ ] Posts zijn gekoppeld aan users via `user_id`
- [ ] Spatie Permission is ge�nstalleerd
- [ ] Roles zijn aangemaakt (admin, editor, author, reader)
- [ ] Permissions zijn aangemaakt en toegewezen aan roles
- [ ] Users hebben roles toegewezen gekregen
- [ ] Routes zijn beveiligd met middleware
- [ ] Controller gebruikt authorization checks
- [ ] Blade views tonen knoppen conditioneel
- [ ] Policy is aangemaakt voor Post model
- [ ] Alles is getest met verschillende user roles
