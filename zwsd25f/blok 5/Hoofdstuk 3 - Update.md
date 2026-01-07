# Blok 5 - Hoofdstuk 3 - Update

## Inhoudsopgave

- [Blok 5 - Hoofdstuk 3 - Update](#blok-5---hoofdstuk-3---update)
  - [Inhoudsopgave](#inhoudsopgave)
  - [Update](#update)
      - [Opdracht 7](#opdracht-7)
      - [Opdracht 8](#opdracht-8)
      - [Opdracht 9](#opdracht-9)
      - [Opdracht 10](#opdracht-10)

## Update

Zoals we eerder hebben gemeld maken we een CRUD applicatie. We hebben al de Create en Read gedaan. Nu gaan we de Update toevoegen aan onze applicatie.

De Update is een belangrijk onderdeel van elke webapplicatie. Het is de proces van het bijwerken van bestaande data in de database.

#### Opdracht 7

1. Binnen de applicatie van tools4ever gaan we de data updaten.
2. Als je naar tools_index.php gaat dan zie je een tabel met tool data, de link wijzig werkt nog niet.
3. Fix de link wijzig en stuur de gebruiker naar het bestand `tool_update.php` met de tool_id.
4. We maken een nieuw bestand aan genaamd `tool_update.php`, 

#### Opdracht 8

1. We maken in het bestand `tool_update.php` een formulier aan waarmee we de data kunnen updaten.
2. We maken een POST request verstuurd naar de server naar het bestand `tool_update_process.php`

#### Opdracht 9
1. We maken een nieuw bestand aan genaamd `tool_update_process.php`
2. Include de connectie met de database.
3. We maken een query om de data uit de database te updaten.
4. Redirect naar de tool_index.php pagina.
5. Test de code.
    
#### Opdracht 10

1. Maak nu een update mogelijkheid voor brands, users en categories.