# Blok 9 - Laravel Nieuws Project

## Week 1 - Project Setup

### Introductie
We gaan een nieuwswebsite bouwen met Laravel. In dit project leren we de basis van Laravel en maken we een volledig functionele nieuwswebsite met artikelen, categorieën en gebruikersbeheer.

### Opdracht 1: Project Aanmaken

1. Maak gebruik van Laravel Herd.
2. Kies voor het gebruik van Laravel Breeze voor authenticatie.
3. Noem het project "nieuws".
4. Kies Blade voor de frontend.
5. Testing Framework: PHPUnit.
6. Target location: _hoef je niet te kiezen_.
7. Ga naar http://nieuws.test.

### Opdracht 2: Maak Model

1. Maak een nieuw model aan met de naam "Post".
2. Maak gebruik van de volgende terminal commando:
    ```bash
    php artisan make:model Post -m -c -s
    ```
3. Maak een nieuw model aan met de naam "Category".
4. Maak gebruik van de volgende terminal commando:
    ```bash
    php artisan make:model Category -m -c -s
    ```

### Opdracht 3: Maak Migration

1. Maak een nieuw migration aan met de naam "create_articles_table".
2. Maak een nieuw migration aan met de naam "create_categories_table".