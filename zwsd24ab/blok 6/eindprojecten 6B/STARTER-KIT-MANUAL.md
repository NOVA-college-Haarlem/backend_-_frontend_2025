# Starter Kit Manual

In dit document wordt uitgelegd hoe je een starter kit van LaravelDaily kunt installeren en gebruiken.

## LaravelDaily Starter Kit

LaravelDaily heeft een starter kit voor Laravel 12. Deze starter kit bevat een volledig functionele Laravel project met alle benodigde bestanden en configuratie.

## Repository local-remote koppelen

1. Clone de repository naar de Herd folder
```bash
git clone https://github.com/LaravelDaily/starter-kit.git ProjectBlok6B
```

### Nieuwe eigen repository aanmaken
1. Start een nieuwe repository op GitHub door daar de GUI te gebruiken, zie groene knop rechtsboven.
2. Kopieer de URL van de repository.

## Open je project in VS Code
1. Open VS Code
2. Open het project in VS Code
3. Open een terminal in VS Code
4. Typ in de terminal:
```bash
git remote rm origin
``` 
Dit verwijdert de origin (link) naar de oude repository.

5. Typ in de terminal:
```bash
git remote add origin https://github.com/<jouw github username>/<naam van de repository>
```
Dit voegt de nieuwe origin (link) toe aan de repository.

6. Typ in de terminal:
```bash
it branch -M main
git push -u origin main
```
Dit push de code naar de nieuwe repository.

## Installeer de dependencies
1. Run `composer install`
2. Run `npm install`
3. Run `npm run dev`

## Laravel configuratie
1. Maak een kopie van de .env.example file en noem deze .env
2. Maak een database.sqlite bestand aan in de map database
3. Maak een unieke key aan voor de app in de .env file
4. Run `php artisan key:generate`
5. Migreer de huidige migraties naar de nieuwe database
6. Run `php artisan migrate`






