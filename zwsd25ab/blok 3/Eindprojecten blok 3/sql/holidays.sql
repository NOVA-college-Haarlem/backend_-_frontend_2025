-- ====================================
-- DATABASE 5: HOLIDAYS
-- ====================================
CREATE TABLE destinations (
    id INT PRIMARY KEY AUTO_INCREMENT,
    destination VARCHAR(100) NOT NULL,
    country VARCHAR(50),
    continent VARCHAR(30),
    best_season VARCHAR(20),
    average_cost_per_day DECIMAL(8,2),
    main_attraction VARCHAR(100),
    language VARCHAR(50),
    currency VARCHAR(20),
    beach_destination BOOLEAN
);

INSERT INTO destinations (destination, country, continent, best_season, average_cost_per_day, main_attraction, language, currency, beach_destination) VALUES
('Paris', 'France', 'Europe', 'Spring', 150.00, 'Eiffel Tower', 'French', 'Euro', false),
('Tokyo', 'Japan', 'Asia', 'Spring', 180.00, 'Shibuya Crossing', 'Japanese', 'Yen', false),
('Bali', 'Indonesia', 'Asia', 'Dry Season', 80.00, 'Rice Terraces', 'Indonesian', 'Rupiah', true),
('New York City', 'USA', 'North America', 'Fall', 200.00, 'Statue of Liberty', 'English', 'Dollar', false),
('Santorini', 'Greece', 'Europe', 'Summer', 120.00, 'Blue Domed Churches', 'Greek', 'Euro', true),
('Dubai', 'UAE', 'Asia', 'Winter', 250.00, 'Burj Khalifa', 'Arabic', 'Dirham', false),
('Machu Picchu', 'Peru', 'South America', 'Dry Season', 90.00, 'Ancient Ruins', 'Spanish', 'Sol', false),
('Maldives', 'Maldives', 'Asia', 'Dry Season', 300.00, 'Overwater Bungalows', 'Dhivehi', 'Rufiyaa', true),
('Rome', 'Italy', 'Europe', 'Spring', 130.00, 'Colosseum', 'Italian', 'Euro', false),
('Sydney', 'Australia', 'Oceania', 'Summer', 160.00, 'Opera House', 'English', 'Dollar', true);
