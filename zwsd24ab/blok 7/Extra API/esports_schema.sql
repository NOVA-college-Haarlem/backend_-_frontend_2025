-- ============================================================
--  Esports Platform — Schema
--  Compatibel met MySQL / MariaDB
-- ============================================================

CREATE DATABASE IF NOT EXISTS esports_platform
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE esports_platform;

-- ------------------------------------------------------------
--  users
-- ------------------------------------------------------------
CREATE TABLE users (
    id         BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    username   VARCHAR(50)     NOT NULL UNIQUE,
    email      VARCHAR(100)    NOT NULL UNIQUE,
    password   VARCHAR(255)    NOT NULL,
    avatar_url VARCHAR(500)    NULL,
    role       ENUM('player', 'organizer', 'admin') NOT NULL DEFAULT 'player',
    created_at TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (id),
    INDEX idx_users_role (role)
) ENGINE=InnoDB;

-- ------------------------------------------------------------
--  games
-- ------------------------------------------------------------
CREATE TABLE games (
    id         BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name       VARCHAR(100)    NOT NULL,
    slug       VARCHAR(100)    NOT NULL UNIQUE,
    genre      VARCHAR(50)     NOT NULL,
    cover_url  VARCHAR(500)    NULL,
    is_active  TINYINT(1)      NOT NULL DEFAULT 1,
    created_at TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (id),
    INDEX idx_games_slug (slug),
    INDEX idx_games_active (is_active)
) ENGINE=InnoDB;

-- ------------------------------------------------------------
--  teams
-- ------------------------------------------------------------
CREATE TABLE teams (
    id          BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    game_id     BIGINT UNSIGNED NOT NULL,
    name        VARCHAR(100)    NOT NULL,
    tag         VARCHAR(10)     NOT NULL,
    logo_url    VARCHAR(500)    NULL,
    captain_id  BIGINT UNSIGNED NOT NULL,
    founded_at  TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_at  TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (id),
    UNIQUE KEY uq_teams_tag_game (tag, game_id),
    INDEX idx_teams_game (game_id),
    INDEX idx_teams_captain (captain_id),

    CONSTRAINT fk_teams_game
        FOREIGN KEY (game_id) REFERENCES games (id)
        ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT fk_teams_captain
        FOREIGN KEY (captain_id) REFERENCES users (id)
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- ------------------------------------------------------------
--  team_members
-- ------------------------------------------------------------
CREATE TABLE team_members (
    id         BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    team_id    BIGINT UNSIGNED NOT NULL,
    user_id    BIGINT UNSIGNED NOT NULL,
    role       ENUM('captain', 'player', 'substitute', 'coach') NOT NULL DEFAULT 'player',
    joined_at  TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    left_at    TIMESTAMP       NULL DEFAULT NULL,
    created_at TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (id),
    INDEX idx_team_members_team (team_id),
    INDEX idx_team_members_user (user_id),

    CONSTRAINT fk_team_members_team
        FOREIGN KEY (team_id) REFERENCES teams (id)
        ON DELETE CASCADE ON UPDATE CASCADE,

    CONSTRAINT fk_team_members_user
        FOREIGN KEY (user_id) REFERENCES users (id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

-- ------------------------------------------------------------
--  tournaments
-- ------------------------------------------------------------
CREATE TABLE tournaments (
    id           BIGINT UNSIGNED  NOT NULL AUTO_INCREMENT,
    game_id      BIGINT UNSIGNED  NOT NULL,
    organizer_id BIGINT UNSIGNED  NOT NULL,
    name         VARCHAR(150)     NOT NULL,
    format       ENUM('single_elimination', 'double_elimination', 'round_robin') NOT NULL,
    max_teams    INT UNSIGNED     NOT NULL DEFAULT 8,
    prize_pool   DECIMAL(10, 2)   NOT NULL DEFAULT 0.00,
    starts_at    TIMESTAMP        NULL DEFAULT NULL,
    ends_at      TIMESTAMP        NULL DEFAULT NULL,
    created_at   TIMESTAMP        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at   TIMESTAMP        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (id),
    INDEX idx_tournaments_game (game_id),
    INDEX idx_tournaments_organizer (organizer_id),
    INDEX idx_tournaments_starts (starts_at),

    CONSTRAINT fk_tournaments_game
        FOREIGN KEY (game_id) REFERENCES games (id)
        ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT fk_tournaments_organizer
        FOREIGN KEY (organizer_id) REFERENCES users (id)
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- ------------------------------------------------------------
--  tournament_registrations
-- ------------------------------------------------------------
CREATE TABLE tournament_registrations (
    id              BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    tournament_id   BIGINT UNSIGNED NOT NULL,
    team_id         BIGINT UNSIGNED NOT NULL,
    status          ENUM('pending', 'accepted', 'rejected') NOT NULL DEFAULT 'pending',
    registered_at   TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_at      TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (id),
    UNIQUE KEY uq_registration (tournament_id, team_id),
    INDEX idx_registrations_tournament (tournament_id),
    INDEX idx_registrations_team (team_id),
    INDEX idx_registrations_status (status),

    CONSTRAINT fk_registrations_tournament
        FOREIGN KEY (tournament_id) REFERENCES tournaments (id)
        ON DELETE CASCADE ON UPDATE CASCADE,

    CONSTRAINT fk_registrations_team
        FOREIGN KEY (team_id) REFERENCES teams (id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

-- ------------------------------------------------------------
--  matches
-- ------------------------------------------------------------
CREATE TABLE matches (
    id              BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    tournament_id   BIGINT UNSIGNED NOT NULL,
    team_home_id    BIGINT UNSIGNED NOT NULL,
    team_away_id    BIGINT UNSIGNED NOT NULL,
    round           INT UNSIGNED    NOT NULL DEFAULT 1,
    score_home      INT UNSIGNED    NULL DEFAULT NULL,
    score_away      INT UNSIGNED    NULL DEFAULT NULL,
    winner_team_id  BIGINT UNSIGNED NULL DEFAULT NULL,
    played_at       TIMESTAMP       NULL DEFAULT NULL,
    created_at      TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (id),
    INDEX idx_matches_tournament (tournament_id),
    INDEX idx_matches_home (team_home_id),
    INDEX idx_matches_away (team_away_id),
    INDEX idx_matches_winner (winner_team_id),
    INDEX idx_matches_round (round),

    CONSTRAINT fk_matches_tournament
        FOREIGN KEY (tournament_id) REFERENCES tournaments (id)
        ON DELETE CASCADE ON UPDATE CASCADE,

    CONSTRAINT fk_matches_home
        FOREIGN KEY (team_home_id) REFERENCES teams (id)
        ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT fk_matches_away
        FOREIGN KEY (team_away_id) REFERENCES teams (id)
        ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT fk_matches_winner
        FOREIGN KEY (winner_team_id) REFERENCES teams (id)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB;

-- ------------------------------------------------------------
--  match_stats
-- ------------------------------------------------------------
CREATE TABLE match_stats (
    id             BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    match_id       BIGINT UNSIGNED NOT NULL,
    user_id        BIGINT UNSIGNED NOT NULL,
    kills          INT UNSIGNED    NOT NULL DEFAULT 0,
    deaths         INT UNSIGNED    NOT NULL DEFAULT 0,
    assists        INT UNSIGNED    NOT NULL DEFAULT 0,
    damage_dealt   INT UNSIGNED    NOT NULL DEFAULT 0,
    kda_ratio      FLOAT           NOT NULL DEFAULT 0.00,
    created_at     TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at     TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (id),
    UNIQUE KEY uq_match_stats (match_id, user_id),
    INDEX idx_match_stats_match (match_id),
    INDEX idx_match_stats_user (user_id),
    INDEX idx_match_stats_kda (kda_ratio),

    CONSTRAINT fk_match_stats_match
        FOREIGN KEY (match_id) REFERENCES matches (id)
        ON DELETE CASCADE ON UPDATE CASCADE,

    CONSTRAINT fk_match_stats_user
        FOREIGN KEY (user_id) REFERENCES users (id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

-- ------------------------------------------------------------
--  achievements
-- ------------------------------------------------------------
CREATE TABLE achievements (
    id          BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name        VARCHAR(100)    NOT NULL UNIQUE,
    description VARCHAR(255)    NOT NULL,
    icon_url    VARCHAR(500)    NULL,
    rarity      ENUM('common', 'rare', 'epic', 'legendary') NOT NULL DEFAULT 'common',
    created_at  TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (id),
    INDEX idx_achievements_rarity (rarity)
) ENGINE=InnoDB;

-- ------------------------------------------------------------
--  user_achievements
-- ------------------------------------------------------------
CREATE TABLE user_achievements (
    id             BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id        BIGINT UNSIGNED NOT NULL,
    achievement_id BIGINT UNSIGNED NOT NULL,
    earned_at      TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_at     TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at     TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (id),
    UNIQUE KEY uq_user_achievement (user_id, achievement_id),
    INDEX idx_user_achievements_user (user_id),
    INDEX idx_user_achievements_achievement (achievement_id),

    CONSTRAINT fk_user_achievements_user
        FOREIGN KEY (user_id) REFERENCES users (id)
        ON DELETE CASCADE ON UPDATE CASCADE,

    CONSTRAINT fk_user_achievements_achievement
        FOREIGN KEY (achievement_id) REFERENCES achievements (id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;
