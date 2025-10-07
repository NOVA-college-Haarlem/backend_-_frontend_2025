# Week 4

## Les 1: Layout aanpassen
In deze les voegen we twee extra pagina's toe: "Over" en "Contact opnemen".
Natuurlijk zouden we in de IDE Bestand -> Opslaan als kunnen gebruiken vanaf home.blade.php en de tekst aanpassen waar nodig, maar dat zou veel dubbele code opleveren, en toekomstige wijzigingen zouden betekenen dat je elk bestand moet aanpassen.

In plaats daarvan moeten we een hoofdlayout maken en die op elke afzonderlijke pagina uitbreiden.

Layouts kunnen op twee manieren worden gemaakt:
- Met Blade-componenten
- Met layout-overerving.
Dit is een persoonlijke voorkeur. Ik kies voor Blade-componenten.

### Hoofdlayout en eerste pagina
Eerst moeten we een View-bestand maken voor de hoofdlayout. Dit komt in de map resources/views/layouts (maar je kunt het neerzetten waar je wilt binnen resources/views) en krijgt de naam app.blade.php.
In de layout voegen we de delen van de template toe die op elke pagina hergebruikt moeten worden. In ons geval is dat alles, behalve wat binnen het gedeelte <main> ... </main> staat.
En in plaats van de hoofdinhoud van de pagina in de layout te plaatsen, gebruiken we de Blade-directive @yield en geven we die sectie een naam.
De hoofdlayout ziet er dan ongeveer zo uit:
resources/views/layouts/app.blade.php:
```php
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Homepage</title>
    @vite(['resources/css/app.css', 'resources/js/app.js'])
</head>
<body class="bg-gray-100 text-gray-900">
<header class="bg-white shadow-md py-4">
    <div class="container mx-auto flex justify-between items-center px-6">
        <a href="/"><h1 class="text-xl font-bold">Brand</h1></a>
        <nav>
            <ul class="flex space-x-6">
                <li><a href="/about" class="hover:text-blue-500">About Us</a></li>
                <li><a href="/contact" class="hover:text-blue-500">Contact</a></li>
            </ul>
        </nav>
    </div>
</header>
<main class="container mx-auto mt-10 px-6 text-center">
     {{ $slot }}
</main>
<footer class="mt-10 py-6 bg-white text-center shadow-md">
    <p class="text-gray-600">&copy; 2025 Brand. All rights reserved.</p>
</footer>
</body>
</html>
```