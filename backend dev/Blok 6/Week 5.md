# WEEK 5

## Leerdoelen week 5

> - Ik installeer Laravel Breeze
> - Ik ben bekend met de nieuwe routes die Laravel Breeze toevoegt
> - Ik ben bekend met de nieuwe views die Laravel Breeze toevoegt
> - Ik ben bekend met de nieuwe controllers die Laravel Breeze toevoegt
> - Ik ben bekend met de nieuwe middleware die Laravel Breeze toevoegt
> - Ik maak gebruik van de auth middleware in mijn routes om te controleren of een gebruiker is ingelogd


## Les 9: Laravel Breeze

Laravel Breeze is een eenvoudige manier om een login en registratie systeem te implementeren in een Laravel project. Het is gebouwd op Tailwind CSS en is gemakkelijk aan te passen.

### Opdracht 1

1. Installeer Laravel Breeze in je project met de volgende commando:

```bash
composer require laravel/breeze --dev
```

2. Run de volgende commando:

```bash
php artisan breeze:install
``` 

Je ziet nu een aantal nieuwe bestanden en directories in je project. De belangrijkste zijn:

- `routes/web.php`: Deze file bevat de nieuwe routes die Laravel Breeze toevoegt.
- `resources/views/auth`: Deze directory bevat de nieuwe views die Laravel Breeze toevoegt.
- `app/Http/Controllers/Auth`: Deze directory bevat de nieuwe controllers die Laravel Breeze toevoegt.
- `app/Http/Middleware/Authenticate.php`: Deze file bevat de nieuwe middleware die Laravel Breeze toevoegt.

