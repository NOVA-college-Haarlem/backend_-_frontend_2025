# Samenvatting Leerdoelen Blok 5 - Backend Development

## Week 1: PDO & Prepared Statements
- PDO database connectie gebruiken in plaats van mysqli
- Prepared statements implementeren om SQL-injectie te voorkomen
- Begrijpen wat SQL-injectie is en hoe het werkt
- Placeholders gebruiken in queries (`:name` syntax)
- `fetch()` en `fetchAll()` methoden toepassen met `PDO::FETCH_ASSOC`
- CRUD operaties: CREATE en READ met PDO

## Week 2: Security & Update Functionaliteit
- `htmlspecialchars()` gebruiken voor XSS-bescherming
- Input validatie op formulieren implementeren
- UPDATE queries met prepared statements
- Password hashing introduceren met `password_hash()`
- Update functionaliteit voor brands, users en categories

## Week 3: Password Security
- Wachtwoorden hashen bij registratie met `password_hash(PASSWORD_DEFAULT)`
- Wachtwoorden verificeren bij login met `password_verify()`
- Veilige opslag van gebruikersgegevens

## Week 4: Soft Delete & AJAX
**Les 1 - Soft Delete:**
- Soft delete implementeren met `deleted_at` kolom
- Records markeren als verwijderd zonder fysieke verwijdering
- Restore functionaliteit voor verwijderde records
- Queries aanpassen met `WHERE deleted_at IS NULL`

**Les 2 - AJAX:**
- Asynchrone communicatie zonder page reload
- `fetch()` API gebruiken in JavaScript
- JSON data uitwisselen tussen frontend en backend
- Foreign keys en database relaties implementeren
- Cart functionaliteit met AJAX

## Week 5: Security & Filtering
**Les 1 - Security:**
- Session management en toegangscontrole
- Input validation en type checking (`is_numeric()`)
- Error handling en gebruikersfeedback
- Request method validatie (`$_SERVER["REQUEST_METHOD"]`)
- Logboek bijhouden van acties

**Les 2 - Filtering:**
- Filtering implementeren met GET parameters
- JOIN queries voor relaties tussen tabellen
- Dynamische WHERE clauses bouwen
- Meerdere filters combineren

## Week 6: Error Handling & Eindproject
**Les 1 - Custom Error Pages:**
- HTTP status codes begrijpen (200, 403, 404, 500)
- Custom error pages maken voor professionele UX
- `http_response_code()` functie gebruiken
- Redirects naar error pages implementeren
- Try-catch blokken voor database errors

**Les 2 - Eindproject Voorbereiding:**
- Code review checklist toepassen
- Alle technieken integreren en testen
- Best practices voor bestandsstructuur
- Security checklist doorlopen
- Functionaliteit volledig testen

## Kernvaardigheden Samengevat

### Database & PDO
- PDO database connectie met error handling
- Prepared statements met placeholders (`:name`)
- Foreign key constraints
- JOIN queries

### Security
- `password_hash()` bij registratie
- `password_verify()` bij login
- `htmlspecialchars()` op alle output
- Input validatie op alle forms
- Session management met role checks

### CRUD Operaties
- CREATE met INSERT INTO
- READ met SELECT queries
- UPDATE met prepared statements
- Soft DELETE met `deleted_at`
- Restore functionaliteit

### User Experience
- AJAX calls met fetch()
- JSON data uitwisseling
- Filtering met GET parameters
- Custom error pages (403, 404, 500)
- Success/error messages

### Code Kwaliteit
- Bestandsstructuur: logische naamgeving, gescheiden view en process bestanden
- Geen dubbele code (DRY principe)
- Duidelijke variabele namen
- Comments bij complexe code
- Consistente indentatie

## Eindproject Checklist

### Functionaliteit
- [ ] CRUD operaties werken allemaal
- [ ] Soft delete met restore functionaliteit
- [ ] AJAX implementatie zonder page reload
- [ ] Filtering werkt correct
- [ ] Custom error pages worden getoond

### Security
- [ ] Alle wachtwoorden gehashed
- [ ] Alle queries prepared statements
- [ ] Alle output escaped met htmlspecialchars()
- [ ] Alle beschermde pagina's hebben session checks
- [ ] Input validatie op alle forms

### Code Structuur
- [ ] Logische naamgeving (tool_create.php, tool_create_process.php)
- [ ] Gescheiden view en process bestanden
- [ ] Header/footer includes gebruikt
- [ ] Database connectie in apart bestand
- [ ] Geen dubbele code
- [ ] Consistente indentatie
