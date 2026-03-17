-- ============================================================
--  Esports Platform — Seed Data
--  Compatibel met MySQL / MariaDB
-- ============================================================


-- ------------------------------------------------------------
--  users  (role: player | organizer | admin)
-- ------------------------------------------------------------
INSERT INTO users (id, username, email, password, avatar_url, role, created_at) VALUES
(1,  'NightWolf',    'nightwolf@mail.com',    '$2y$10$abc...hashed', 'https://i.pravatar.cc/150?img=1',  'player',    '2024-01-10 09:00:00'),
(2,  'ShadowPulse',  'shadowpulse@mail.com',  '$2y$10$abc...hashed', 'https://i.pravatar.cc/150?img=2',  'player',    '2024-01-12 10:30:00'),
(3,  'IronReaper',   'ironreaper@mail.com',   '$2y$10$abc...hashed', 'https://i.pravatar.cc/150?img=3',  'player',    '2024-01-14 08:15:00'),
(4,  'BlazeFury',    'blazefury@mail.com',    '$2y$10$abc...hashed', 'https://i.pravatar.cc/150?img=4',  'player',    '2024-01-15 11:00:00'),
(5,  'CryptoStar',   'cryptostar@mail.com',   '$2y$10$abc...hashed', 'https://i.pravatar.cc/150?img=5',  'player',    '2024-01-16 14:00:00'),
(6,  'VoidHunter',   'voidhunter@mail.com',   '$2y$10$abc...hashed', 'https://i.pravatar.cc/150?img=6',  'player',    '2024-01-17 09:45:00'),
(7,  'StormBreaker', 'stormbreaker@mail.com', '$2y$10$abc...hashed', 'https://i.pravatar.cc/150?img=7',  'player',    '2024-01-18 13:20:00'),
(8,  'EchoFlame',    'echoflame@mail.com',    '$2y$10$abc...hashed', 'https://i.pravatar.cc/150?img=8',  'player',    '2024-01-19 16:00:00'),
(9,  'NeonByte',     'neonbyte@mail.com',     '$2y$10$abc...hashed', 'https://i.pravatar.cc/150?img=9',  'player',    '2024-01-20 10:00:00'),
(10, 'GlitchKing',   'glitchking@mail.com',   '$2y$10$abc...hashed', 'https://i.pravatar.cc/150?img=10', 'player',    '2024-01-21 12:30:00'),
(11, 'TourneyPro',   'tourneypro@mail.com',   '$2y$10$abc...hashed', 'https://i.pravatar.cc/150?img=11', 'organizer', '2024-01-05 08:00:00'),
(12, 'AdminAce',     'adminace@mail.com',     '$2y$10$abc...hashed', 'https://i.pravatar.cc/150?img=12', 'admin',     '2024-01-01 00:00:00');

-- ------------------------------------------------------------
--  games
-- ------------------------------------------------------------
INSERT INTO games (id, name, slug, genre, cover_url, is_active) VALUES
(1, 'Valorant',          'valorant',          'Tactical Shooter', 'https://picsum.photos/seed/valorant/400/200',   1),
(2, 'League of Legends', 'league-of-legends', 'MOBA',             'https://picsum.photos/seed/lol/400/200',        1),
(3, 'CS2',               'cs2',               'FPS',              'https://picsum.photos/seed/cs2/400/200',         1),
(4, 'Rocket League',     'rocket-league',     'Sports',           'https://picsum.photos/seed/rocketleague/400/200',1),
(5, 'Apex Legends',      'apex-legends',      'Battle Royale',    'https://picsum.photos/seed/apex/400/200',        0);

-- ------------------------------------------------------------
--  teams  (captain_id → users.id)
-- ------------------------------------------------------------
INSERT INTO teams (id, game_id, name, tag, logo_url, captain_id, founded_at) VALUES
(1, 1, 'Phantom Strike',  'PHS', 'https://picsum.photos/seed/phs/100/100',  1, '2024-02-01 10:00:00'),
(2, 1, 'Neon Wolves',     'NEW', 'https://picsum.photos/seed/new/100/100',  4, '2024-02-03 12:00:00'),
(3, 2, 'Iron Legends',    'IRL', 'https://picsum.photos/seed/irl/100/100',  5, '2024-02-05 09:00:00'),
(4, 2, 'Blaze Squad',     'BLZ', 'https://picsum.photos/seed/blz/100/100',  7, '2024-02-07 11:00:00'),
(5, 3, 'Ghost Protocol',  'GHP', 'https://picsum.photos/seed/ghp/100/100',  9, '2024-02-10 08:30:00'),
(6, 3, 'Dark Matter',     'DKM', 'https://picsum.photos/seed/dkm/100/100', 10, '2024-02-11 14:00:00');

-- ------------------------------------------------------------
--  team_members  (role: captain | coach | substitute | player)
-- ------------------------------------------------------------
INSERT INTO team_members (id, team_id, user_id, role, joined_at, left_at) VALUES
-- Phantom Strike (Valorant)
(1,  1, 1, 'captain',    '2024-02-01 10:00:00', NULL),
(2,  1, 2, 'player',     '2024-02-01 10:00:00', NULL),
(3,  1, 3, 'player',     '2024-02-02 11:00:00', NULL),
-- Neon Wolves (Valorant)
(4,  2, 4, 'captain',    '2024-02-03 12:00:00', NULL),
(5,  2, 5, 'player',     '2024-02-03 12:00:00', NULL),
(6,  2, 6, 'substitute', '2024-02-04 09:00:00', NULL),
-- Iron Legends (LoL)
(7,  3, 5, 'captain',    '2024-02-05 09:00:00', NULL),
(8,  3, 6, 'player',     '2024-02-05 09:00:00', NULL),
(9,  3, 7, 'player',     '2024-02-06 10:00:00', NULL),
-- Blaze Squad (LoL)
(10, 4, 7, 'captain',    '2024-02-07 11:00:00', NULL),
(11, 4, 8, 'player',     '2024-02-07 11:00:00', NULL),
(12, 4, 3, 'player',     '2024-02-08 13:00:00', NULL),
-- Ghost Protocol (CS2)
(13, 5, 9,  'captain',   '2024-02-10 08:30:00', NULL),
(14, 5, 10, 'player',    '2024-02-10 08:30:00', NULL),
(15, 5, 1,  'coach',     '2024-02-11 09:00:00', NULL),
-- Dark Matter (CS2)
(16, 6, 10, 'captain',   '2024-02-11 14:00:00', NULL),
(17, 6, 2,  'player',    '2024-02-11 14:00:00', NULL),
(18, 6, 4,  'substitute','2024-02-12 10:00:00', NULL);

-- ------------------------------------------------------------
--  tournaments  (format: single_elimination | double_elimination | round_robin)
-- ------------------------------------------------------------
INSERT INTO tournaments (id, game_id, organizer_id, name, format, max_teams, prize_pool, starts_at, ends_at) VALUES
(1, 1, 11, 'Valorant Spring Cup',    'single_elimination', 8,  500.00,  '2024-03-01 14:00:00', '2024-03-03 22:00:00'),
(2, 2, 11, 'LoL Clash Season 1',     'round_robin',        4,  1000.00, '2024-03-10 12:00:00', '2024-03-17 20:00:00'),
(3, 3, 11, 'CS2 Dutch Open',         'double_elimination', 8,  750.00,  '2024-04-05 10:00:00', '2024-04-07 22:00:00'),
(4, 1, 11, 'Valorant Summer Series', 'single_elimination', 8,  300.00,  '2024-06-15 14:00:00', '2024-06-16 20:00:00');

-- ------------------------------------------------------------
--  tournament_registrations  (status: pending | accepted | rejected)
-- ------------------------------------------------------------
INSERT INTO tournament_registrations (id, tournament_id, team_id, status, registered_at) VALUES
(1, 1, 1, 'accepted',  '2024-02-15 10:00:00'),
(2, 1, 2, 'accepted',  '2024-02-16 11:00:00'),
(3, 2, 3, 'accepted',  '2024-02-20 09:00:00'),
(4, 2, 4, 'accepted',  '2024-02-21 10:30:00'),
(5, 3, 5, 'accepted',  '2024-03-01 08:00:00'),
(6, 3, 6, 'accepted',  '2024-03-02 09:00:00'),
(7, 4, 1, 'pending',   '2024-05-20 14:00:00'),
(8, 4, 2, 'pending',   '2024-05-21 15:00:00');

-- ------------------------------------------------------------
--  matches  (winner_team_id NULL = nog niet gespeeld)
-- ------------------------------------------------------------
INSERT INTO matches (id, tournament_id, team_home_id, team_away_id, round, score_home, score_away, winner_team_id, played_at) VALUES
(1, 1, 1, 2, 1, 13,  7,  1, '2024-03-01 15:00:00'),
(2, 1, 1, 2, 2,  8, 13,  2, '2024-03-02 16:00:00'),
(3, 1, 1, 2, 3, 13, 10,  1, '2024-03-03 18:00:00'),
(4, 2, 3, 4, 1,  2,  1,  3, '2024-03-10 13:00:00'),
(5, 2, 4, 3, 1,  1,  2,  3, '2024-03-12 14:00:00'),
(6, 3, 5, 6, 1, 16, 14,  5, '2024-04-05 11:00:00'),
(7, 3, 6, 5, 1, 16, 12,  6, '2024-04-06 12:00:00'),
(8, 4, 1, 2, 1, NULL, NULL, NULL, NULL);

-- ------------------------------------------------------------
--  match_stats  (kda = (kills + assists) / MAX(deaths, 1))
-- ------------------------------------------------------------
INSERT INTO match_stats (id, match_id, user_id, kills, deaths, assists, damage_dealt, kda_ratio) VALUES
-- Match 1 (Phantom Strike vs Neon Wolves, round 1)
(1,  1, 1,  28, 14, 10, 4200, 2.71),
(2,  1, 2,  18, 16,  8, 3100, 1.63),
(3,  1, 3,  22, 12, 14, 3800, 3.00),
(4,  1, 4,  12, 18,  6, 2400, 1.00),
(5,  1, 5,   9, 20, 11, 2100, 1.00),
-- Match 2 (Neon Wolves win)
(6,  2, 1,  10, 20,  5, 2000, 0.75),
(7,  2, 2,  14, 15,  9, 2600, 1.53),
(8,  2, 3,   8, 18,  7, 1900, 0.83),
(9,  2, 4,  25,  9, 12, 4400, 4.11),
(10, 2, 5,  20, 11, 14, 3700, 3.09),
-- Match 3 (Phantom Strike win — decider)
(11, 3, 1,  30, 10, 12, 5100, 4.20),
(12, 3, 2,  24, 13, 10, 4000, 2.62),
(13, 3, 3,  19, 11,  9, 3400, 2.55),
(14, 3, 4,  14, 17,  7, 2700, 1.24),
(15, 3, 5,  11, 19,  5, 2200, 0.84),
-- Match 4 (Iron Legends vs Blaze Squad)
(16, 4, 5,   8,  3, 14, 3800, 7.33),
(17, 4, 6,   5,  5, 10, 2900, 3.00),
(18, 4, 7,   3,  7,  6, 2100, 1.29),
(19, 4, 8,   6,  8,  8, 2600, 1.75),
-- Match 5 (LoL round 2)
(20, 5, 5,  10,  2, 12, 4200, 11.00),
(21, 5, 6,   7,  4,  9, 3100, 4.00),
(22, 5, 7,   4,  6,  5, 2000, 1.50),
(23, 5, 8,   5,  9,  7, 2400, 1.33),
-- Match 6 (CS2: Ghost Protocol vs Dark Matter)
(24, 6, 9,  22, 16,  8, 3900, 1.88),
(25, 6, 10, 18, 18, 10, 3200, 1.56),
(26, 6, 1,   0,  0,  0,    0, 0.00),
(27, 6, 2,  15, 19,  7, 2800, 1.16),
-- Match 7 (reverse)
(28, 7, 9,  14, 20,  6, 2600, 1.00),
(29, 7, 10, 24, 12, 12, 4100, 3.00),
(30, 7, 2,  20, 14,  9, 3500, 2.07);

-- ------------------------------------------------------------
--  achievements  (rarity: common | rare | epic | legendary)
-- ------------------------------------------------------------
INSERT INTO achievements (id, name, description, icon_url, rarity) VALUES
(1, 'First Blood',     'Win je eerste match',                        'https://picsum.photos/seed/ach1/64/64', 'common'),
(2, 'Hat Trick',       'Haal 3 overwinningen op rij',                'https://picsum.photos/seed/ach2/64/64', 'rare'),
(3, 'Carry',           'Eindig een match met 30+ kills',             'https://picsum.photos/seed/ach3/64/64', 'epic'),
(4, 'Untouchable',     'Voltooi een match met minder dan 5 deaths',  'https://picsum.photos/seed/ach4/64/64', 'rare'),
(5, 'Tournament Winner','Win een officieel toernooi',                'https://picsum.photos/seed/ach5/64/64', 'legendary'),
(6, 'Support Star',    'Haal 10+ assists in één match',              'https://picsum.photos/seed/ach6/64/64', 'common'),
(7, 'KDA Legend',      'Behaal een KDA van 5.0 of hoger',            'https://picsum.photos/seed/ach7/64/64', 'epic'),
(8, 'Multi-Game Pro',  'Speel in teams voor 3 verschillende games',  'https://picsum.photos/seed/ach8/64/64', 'legendary');

-- ------------------------------------------------------------
--  user_achievements
-- ------------------------------------------------------------
INSERT INTO user_achievements (id, user_id, achievement_id, earned_at) VALUES
(1,  1,  1, '2024-03-01 15:30:00'),   -- NightWolf: First Blood
(2,  1,  2, '2024-03-03 19:00:00'),   -- NightWolf: Hat Trick
(3,  1,  3, '2024-03-03 18:45:00'),   -- NightWolf: Carry (30 kills match 3)
(4,  1,  5, '2024-03-03 20:00:00'),   -- NightWolf: Tournament Winner
(5,  4,  4, '2024-03-02 17:00:00'),   -- BlazeFury: Untouchable
(6,  4,  7, '2024-03-02 17:05:00'),   -- BlazeFury: KDA Legend (4.11)
(7,  5,  6, '2024-03-10 14:00:00'),   -- CryptoStar: Support Star
(8,  5,  7, '2024-03-12 15:00:00'),   -- CryptoStar: KDA Legend (11.00)
(9,  9,  1, '2024-04-05 12:00:00'),   -- NeonByte: First Blood
(10, 2,  6, '2024-04-06 13:00:00');   -- ShadowPulse: Support Star
