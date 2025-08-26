# StageFinder

StageFinder is een platform waar studenten en bedrijven elkaar kunnen vinden voor stageplekken. Het platform maakt het mogelijk voor bedrijven om stageplekken aan te bieden en voor studenten om deze te vinden en erop te reageren.

## Functionaliteiten

### Fase 1 - Basis
- Bedrijven kunnen stageplekken plaatsen
- Studenten kunnen stageplekken bekijken
- Zoeken en filteren op locatie, type stage en vakgebied
- Registratie en login systeem voor bedrijven en studenten

### Fase 2 - Interactie
- Studenten kunnen reageren op stageplekken
- Bedrijven kunnen reacties bekijken en beheren
- Messaging systeem tussen student en bedrijf
- Dashboard voor zowel studenten als bedrijven

### Fase 3 - Reviews & Beoordelingen
- Studenten kunnen reviews achterlaten over hun stage-ervaring
- Bedrijven kunnen beoordeeld worden door stagiairs
- Rating systeem voor stageplekken
- Overzicht van best beoordeelde bedrijven


## Technische Specificaties

- Laravel 10.x
- PHP 8.1+
- MySQL database
- Bootstrap 5 voor frontend
- Laravel Breeze voor authenticatie

## Installatie

1. Clone de repository
```bash
git clone [repository-url]
```

2. Installeer dependencies
```bash
composer install
npm install
```

3. Configureer je .env bestand
```bash
cp .env.example .env
php artisan key:generate
```

4. Configureer je database in .env

5. Run migraties
```bash
php artisan migrate
```

6. Start de development server
```bash
php artisan serve
npm run dev
```

## Database Structuur

### Users
- id
- name
- email
- password
- role (student/bedrijf)
- created_at
- updated_at

### Companies
- id
- user_id
- company_name
- description
- location
- website
- created_at
- updated_at

### Internships
- id
- company_id
- title
- description
- requirements
- start_date
- end_date
- status
- created_at
- updated_at

### Applications
- id
- internship_id
- student_id
- status
- motivation
- created_at
- updated_at

### Reviews
- id
- student_id
- company_id
- internship_id
- rating
- comment
- created_at
- updated_at

## Bijdragen

Wil je bijdragen aan dit project? Geweldig! Je kunt:
1. Een issue aanmaken
2. Een pull request indienen
3. De documentatie verbeteren

## License

Dit project is gelicenseerd onder de MIT License. 