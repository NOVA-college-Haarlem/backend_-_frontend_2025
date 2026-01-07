# Hoofdstuk 6 - Dashboard data

In deze les gaan we de data uit de database halen en tonen op het dashboard.

#### Opdracht 1

1. Pas het bestand `admin-dashboard.php` aan: 
2. We maken een connectie met de database.
3. We maken een query om de data uit de database te halen.
4. Toon het aantal gebruikers uit de database op het scherm:


```php
// Query data
$sql = "SELECT COUNT(*) as total_users FROM users";
$result = mysqli_query($conn, $sql);
$total_users = mysqli_fetch_assoc($result)['total_users'];
?>

<div class="bg-blue-500 text-white p-6 rounded-lg shadow-md text-center">
    <h2 class="text-4xl font-bold"><?php echo $total_users; ?></h2>
    <p class="mt-2">Totaal aantal gebruikers</p>
</div>
```

#### Opdracht 2

1. Pas het bestand `admin-dashboard.php` aan: 
2. We maken een connectie met de database.
3. We maken een query om de data uit de database te halen.
4. Toon het aantal kaarten uit de database op het scherm:


```php
// Query data
$sql = "SELECT COUNT(*) as total_cards FROM cards";
$result = mysqli_query($conn, $sql);
$total_cards = mysqli_fetch_assoc($result)['total_cards'];
?>
 <div class="bg-green-500 text-white p-6 rounded-lg shadow-md text-center">
    <h2 class="text-4xl font-bold"><?php echo $total_cards; ?></h2>
    <p class="mt-2">Totaal aantal kaarten</p>
</div>
```

#### Opdracht 3

1. Pas het bestand `admin-dashboard.php` aan: 
2. We maken een connectie met de database.
3. We maken een query om de data uit de database te halen.
4. Toon het aantal normale gebruikers uit de database op het scherm:

### Les 3 - Meerdere tabellen

In deze les gaan we meerdere tabellen in de database gebruiken. We maken gebruik van een one-to-one relatie. 

#### Opdracht 1

1. We importeren een nieuwe tabel in de database.

```sql
CREATE TABLE user_settings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    theme ENUM('light', 'dark', 'auto') DEFAULT 'light',
    cards_per_page INT DEFAULT 12,
    default_sort ENUM('name', 'type', 'hp', 'attack') DEFAULT 'name',
    show_card_stats BOOLEAN DEFAULT TRUE,
    email_notifications BOOLEAN DEFAULT TRUE,
    two_factor_enabled BOOLEAN DEFAULT FALSE,
    last_login_ip VARCHAR(45),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    UNIQUE KEY unique_user_settings (user_id)
);

INSERT INTO user_settings (user_id, theme, cards_per_page, default_sort, email_notifications) VALUES
(1, 'dark', 24, 'hp', TRUE),
(2, 'light', 12, 'name', FALSE),
(4, 'auto', 18, 'type', TRUE);
```

#### Opdracht 2

1. We maken een nieuwe pagina aan genaamd `profile.php`.
2. Deze pagina mag alleen worden bekeken als de gebruiker is ingelogd.
3. De code hiervoor staat elders in de applicatie.   

#### Opdracht 3

1. Haal de data van de ingelogde gebruiker op.
2. Toon de data het formulier.




