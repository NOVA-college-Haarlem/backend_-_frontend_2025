# Eindproject Blok 3A - Overzichtspagina & Dynamisch Menu

## 📋 Projectomschrijving

Je gaat een dynamische website bouwen met PHP en MySQL. Je bouwt een **overzichtspagina** die data uit een database toont en een **dynamisch menu** dat op alle pagina's werkt. Dit project vormt de basis voor het vervolgproject in Blok 3B.

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

**Database**: Importeer de SQL file in PHPMyAdmin (zie de `sql/` folder in je project).

## 🛠️ Wat je moet bouwen

### 1. Overzichtspagina (Verplicht)

Maak een overzichtspagina (`index.php`) die **alle items** uit de database toont.

**Vereisten:**
- Database connectie via `database.php`
- SELECT query om alle data op te halen
- Foreach loop om de items te tonen
- Professionele opmaak met HTML en CSS
- Elk item in een kaart/card layout

**Voorbeeld voor Gaming project:**
```php
// index.php
// Toont alle games uit de database in een grid van kaarten
```

### 2. Dynamisch Menu (Verplicht)

Maak een dynamisch menu dat op alle pagina's werkt.

**Vereisten:**
- Apart bestand `menu.php` (DRY principle)
- Associatieve array met menu-items
- Foreach loop om menu-items te genereren
- Include/require in elke pagina
- Menu moet werken op index.php en eventuele andere pagina's

**Voorbeeld:**
```php
<?php
$menuItems = [
    'Home' => 'index.php',
    'Over ons' => 'about.php',
    'Contact' => 'contact.php'
];
?>
<?php foreach($menuItems as $label => $url): ?>
    <a href="<?php echo $url; ?>"><?php echo $label; ?></a>
<?php endforeach; ?>
```

### 3. Project Setup

- HTML bestanden omzetten naar PHP
- Docker environment starten
- Database importeren in PHPMyAdmin

## 📁 Bestandsstructuur

```
project/
├── index.php              # Overzichtspagina met database data
├── database.php           # Database connectie
├── menu.php               # Dynamisch menu (include in elke pagina)
├── style.css              # Styling
└── sql/
    └── [jouw-project].sql # Database (te importeren in PHPMyAdmin)
```

## 🎓 Technieken uit Hoofdstuk 1 t/m 3

Je **moet** de volgende technieken gebruiken:

### Hoofdstuk 1 - Introductie PHP
- ✅ PHP tags (`<?php ?>`)
- ✅ Variables en echo
- ✅ Include/require voor menu
- ✅ DRY principle (menu in apart bestand)
- ✅ Associatieve arrays
- ✅ Foreach loop voor dynamisch menu

### Hoofdstuk 2 - Data ophalen en tonen
- ✅ Database connectie (`database.php`)
- ✅ MySQLi connectie met mysqli_connect
- ✅ SELECT query
- ✅ mysqli_query en mysqli_fetch_all
- ✅ Foreach loop met database data
- ✅ Dynamische HTML in de loop

### Hoofdstuk 3 - Herhaling
- ✅ Modulaire structuur (navbar/menu apart)
- ✅ Data uit database in tabel of grid
- ✅ Kolomnamen uit database correct gebruiken

### Code Kwaliteit
- ✅ DRY principle (Don't Repeat Yourself)
- ✅ Modulaire code (aparte bestanden)
- ✅ Duidelijke variabele namen

## 📊 Beoordelingscriteria

| Criterium | Punten | Omschrijving |
|-----------|--------|--------------|
| **Overzichtspagina** | 40% | Alle items uit database correct getoond |
| **Dynamisch Menu** | 25% | Menu met array en foreach, werkt op alle pagina's |
| **Database** | 20% | Correcte connectie en SELECT query |
| **Code Kwaliteit** | 10% | DRY principle, menu.php, duidelijke code |
| **Styling** | 5% | Overzichtelijke layout, professionele uitstraling |

**Totaal: 100%**

## 🚀 Stappenplan

### Week 1
1. 📝 Fork en clone je project repository
2. 📝 Start Docker met `docker compose up -d`
3. 📝 Importeer de SQL file in PHPMyAdmin (http://localhost:8080)
4. 📝 Maak `database.php` met database connectie
5. 📝 Test de connectie

### Week 2
6. 📝 Maak `menu.php` met associatieve array en foreach
7. 📝 Maak `index.php` met include voor menu
8. 📝 Bouw de overzichtspagina: SELECT query + foreach loop
9. 📝 Toon de data in kaarten/grid met HTML en CSS

### Week 3
10. 📝 Verbeter styling
11. 📝 Test alle functionaliteit
12. 📝 Code opschonen
13. 📝 Final check met checklist

## ✅ Checklist voor Inleveren

**Functionaliteit:**
- [ ] Overzichtspagina toont alle items uit database
- [ ] Dynamisch menu werkt op alle pagina's
- [ ] Database connectie werkt
- [ ] Geen PHP errors

**Code Kwaliteit:**
- [ ] Menu in apart bestand `menu.php`
- [ ] Database connectie in `database.php`
- [ ] Associatieve array voor menu-items
- [ ] Foreach loop voor menu en overzicht
- [ ] Duidelijke variabele namen

**Styling:**
- [ ] Overzichtelijke layout
- [ ] Items netjes weergegeven in grid/kaarten

**Git:**
- [ ] Reguliere commits met duidelijke messages
- [ ] Code gepusht naar GitHub

## 💡 Tips

1. **Start met het menu**: Volg de stappen uit Hoofdstuk 1, Opdracht 7 en 8
2. **Database eerst**: Controleer in PHPMyAdmin welke kolommen je tabel heeft
3. **Kopieer de structuur**: Gebruik het Pokémon of Formula 1 voorbeeld als referentie
4. **Test stap voor stap**: Test na elke wijziging of alles nog werkt
5. **var_dump()**: Gebruik dit om te zien wat je query teruggeeft

## 📚 Referenties

- **Hoofdstuk 1**: PHP basics, menu.php, dynamisch menu met array
- **Hoofdstuk 2**: database.php, SELECT query, foreach met database data
- **Hoofdstuk 3**: navbar.php, driver-table met database

## 📅 Deadline

**Inleverdatum**: Zie planning van je docent

**Inleveren via**: Submit je project in Github

---

*Dit project vormt de basis voor Blok 3B, waar je de detail pagina en extra functionaliteit toevoegt.*
