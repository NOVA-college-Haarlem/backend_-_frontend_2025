-- ====================================
-- DATABASE 1: GAMING
-- ====================================
CREATE TABLE games (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    platform VARCHAR(50),
    release_year INT,
    rating DECIMAL(3,1),
    price DECIMAL(8,2),
    developer VARCHAR(100),
    multiplayer BOOLEAN
);

INSERT INTO games (title, genre, platform, release_year, rating, price, developer, multiplayer) VALUES
('The Witcher 3', 'RPG', 'PC/PS4/Xbox', 2015, 9.3, 39.99, 'CD Projekt RED', false),
('Fortnite', 'Battle Royale', 'Multi-platform', 2017, 8.2, 0.00, 'Epic Games', true),
('Minecraft', 'Sandbox', 'Multi-platform', 2011, 9.0, 26.95, 'Mojang Studios', true),
('Grand Theft Auto V', 'Action', 'Multi-platform', 2013, 9.5, 29.99, 'Rockstar Games', true),
('League of Legends', 'MOBA', 'PC', 2009, 8.7, 0.00, 'Riot Games', true),
('Cyberpunk 2077', 'RPG', 'PC/PS4/Xbox', 2020, 7.8, 59.99, 'CD Projekt RED', false),
('Among Us', 'Social Deduction', 'Multi-platform', 2018, 8.1, 4.99, 'InnerSloth', true),
('Call of Duty: Warzone', 'FPS', 'Multi-platform', 2020, 8.3, 0.00, 'Activision', true),
('Super Mario Odyssey', 'Platformer', 'Nintendo Switch', 2017, 9.7, 49.99, 'Nintendo', false),
('Valorant', 'FPS', 'PC', 2020, 8.5, 0.00, 'Riot Games', true);