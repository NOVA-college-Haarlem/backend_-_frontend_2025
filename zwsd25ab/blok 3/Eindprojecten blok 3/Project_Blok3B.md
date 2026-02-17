# Eindproject Blok 3 - Backend Development

## 📋 Projectomschrijving

Je gaat een dynamische website bouwen met PHP en MySQL. Je hebt al een overzichtspagina gemaakt met data uit een database. Nu ga je de website uitbreiden met een detail pagina en extra functionaliteit.

## 🎯 Projecten

Je werkt aan één van de volgende projecten:

| Project | Database | Thema |
|---------|----------|-------|
| **Gaming** | `games` | Videogame catalogus |
| **Recipes** | `recipes` | Recepten website |
| **Cars** | `cars` | Auto showroom |
| **Fitness** | `workouts` | Workout database |
| **Holidays** | `destinations` | Vakantie bestemmingen |
| **Bookstore** | `books` | Online boekwinkel |
| **Jewelry** | `jewelry` | Sieraden webshop |

**Database**: Je hebt al de SQL file geïmporteerd in PHPMyAdmin (zie de `sql/` folder).

## ✅ Wat je al hebt

- ✅ Een overzichtspagina met alle items uit de database
- ✅ Database connectie (`database.php`)
- ✅ Basic HTML structuur met menu
- ✅ Docker environment
- ✅ Geïmporteerde database met testdata

## 🛠️ Wat je moet bouwen

### 1. Detail Pagina (Verplicht)
Maak een detail pagina die **één specifiek item** uit de database toont.

**Vereisten:**
- Gebruik GET parameters in de URL (bijvoorbeeld: `detail.php?id=5`)
- Haal data op met een SELECT WHERE query
- Toon alle relevante informatie van dat item
- Style de pagina professioneel met CSS

**Voorbeeld voor Gaming project:**
```php
// detail.php?id=1
// Toont alle informatie over "The Witcher 3"
```

### 2. Navigatie (Verplicht)
- Link van overzichtspagina naar detail pagina
- "Terug naar overzicht" knop op detail pagina
- Menu die werkt op alle pagina's

### 3. Extra Functionaliteit 

#### A: Filtering
- Filter items op basis van een eigenschap
- Bijvoorbeeld:
  - Gaming: filter op genre/platform
  - Bookstore: filter op genre/author
  - Cars: filter op make/fuel_type
  - Recipes: filter op category/difficulty

#### B: Zoekfunctionaliteit
- Zoekbalk waarmee je items kunt zoeken
- Gebruik SQL LIKE query voor zoeken
- Toon resultaten dynamisch

#### C: Sortering
- Sorteer items op prijs, naam, jaar, etc.
- Knoppen voor oplopend/aflopend sorteren
- Gebruik ORDER BY in SQL queries

#### D: Statistieken Pagina
- Bereken en toon interessante statistieken
- Bijvoorbeeld:
  - Gaming: gemiddelde rating, aantal multiplayer games
  - Bookstore: aantal boeken per genre, gemiddelde prijs
  - Fitness: totale calorieën, aantal cardio workouts

## 📁 Bestandsstructuur

```
project/
├── index.php              # Overzichtspagina (al gemaakt)
├── detail.php             # Detail pagina (nieuw)
├── database.php           # Database connectie (al gemaakt)
├── menu.php               # Navigatie (al gemaakt)
├── style.css              # Styling
└── sql/
    └── [jouw-project].sql # Database (al geïmporteerd)
```

## 🎓 Technieken uit Blok 3

Je **moet** de volgende technieken gebruiken:

### PHP Basics
- ✅ PHP tags (`<?php ?>`)
- ✅ Variables en echo
- ✅ Include/require voor menu en database

### Arrays & Loops
- ✅ Associatieve arrays
- ✅ Foreach loops
- ✅ Array data uit database

### Database
- ✅ MySQLi connectie (`database.php`)
- ✅ SELECT queries
- ✅ WHERE clauses voor filtering
- ✅ Fetch associative arrays

### Dynamic Content
- ✅ Data uit database tonen
- ✅ GET parameters gebruiken
- ✅ Dynamic HTML genereren

### Code Kwaliteit
- ✅ DRY principle (Don't Repeat Yourself)
- ✅ Modulaire code (aparte bestanden)
- ✅ Duidelijke variabele namen

## 📊 Beoordelingscriteria

| Criterium | Punten | Omschrijving |
|-----------|--------|--------------|
| **Detail Pagina** | 30% | Werkende detail pagina met alle data |
| **Database Queries** | 20% | Correcte SQL queries met WHERE |
| **Extra Functionaliteit** | 25% | 2 van de 4 opties werkend |
| **Code Kwaliteit** | 15% | Nette code, DRY principle, comments |
| **Styling** | 10% | Professionele uitstraling, CSS |

**Totaal: 100%**

## 🚀 Stappenplan

### Week 1
1. ✅ Controleer dat je database correct is geïmporteerd
2. ✅ Test je overzichtspagina
3. 📝 Maak `detail.php` aan
4. 📝 Bouw de detail pagina met GET parameter
5. 📝 Test met verschillende IDs

### Week 2
6. 📝 Link overzichtspagina naar detail pagina
7. 📝 Kies 2 extra functionaliteiten
8. 📝 Implementeer filtering OF zoeken
9. 📝 Implementeer sortering OF statistieken

### Week 3
10. 📝 Verbeter styling met CSS
11. 📝 Test alle functionaliteit
12. 📝 Code opschonen en comments toevoegen
13. 📝 Final check met checklist

## ✅ Checklist voor Inleveren

**Functionaliteit:**
- [ ] Detail pagina werkt met verschillende IDs
- [ ] Navigatie werkt tussen overzicht en detail
- [ ] Minimaal 2 extra features werkend
- [ ] Alle database queries werken correct
- [ ] Geen PHP errors

**Code Kwaliteit:**
- [ ] DRY principle toegepast (menu in apart bestand)
- [ ] Database connectie in `database.php`
- [ ] Duidelijke variabele namen
- [ ] Comments bij complexe code
- [ ] Nette indentatie

**Styling:**
- [ ] Professionele uitstraling
- [ ] Responsive design (werkt op mobile)
- [ ] Consistente kleuren en fonts
- [ ] Overzichtelijke layout

**Git:**
- [ ] Reguliere commits met duidelijke messages
- [ ] Code gepusht naar GitHub

## 💡 Tips

1. **Start simpel**: Maak eerst de detail pagina werkend voordat je extra features toevoegt
2. **Test vaak**: Test na elke kleine wijziging of alles nog werkt
3. **Gebruik PHPMyAdmin**: Kijk in PHPMyAdmin welke kolommen je database heeft
4. **Console Debugging**: Gebruik `var_dump()` om te zien wat je queries teruggeven
5. **Vraag hulp**: Als je vastloopt, vraag dan hulp aan medestudenten of docent

## 📚 Handige Resources

- **PHPMyAdmin**: http://localhost:8080 (bekijk je database structuur)
- **PHP Manual**: https://www.php.net/manual/en/
- **W3Schools PHP**: https://www.w3schools.com/php/
- **Blok 3 Opdrachten**: Kijk terug naar Week 1-4 voor voorbeelden

## 📅 Deadline

**Inleverdatum**: 16 oktober 2025

**Inleveren via**: Submit je project in Github

---
