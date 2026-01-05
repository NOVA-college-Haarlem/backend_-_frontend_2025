-- ====================================
-- DATABASE 4: FITNESS
-- ====================================
CREATE TABLE workouts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    exercise_name VARCHAR(100) NOT NULL,
    muscle_group VARCHAR(50),
    equipment VARCHAR(50),
    difficulty VARCHAR(20),
    calories_per_minute INT,
    duration_minutes INT,
    sets_recommended INT,
    reps_recommended VARCHAR(20),
    cardio BOOLEAN
);

INSERT INTO workouts (exercise_name, muscle_group, equipment, difficulty, calories_per_minute, duration_minutes, sets_recommended, reps_recommended, cardio) VALUES
('Push-ups', 'Chest', 'None', 'Beginner', 8, 10, 3, '10-15', false),
('Running', 'Full Body', 'None', 'Intermediate', 12, 30, 1, 'Continuous', true),
('Squats', 'Legs', 'None', 'Beginner', 6, 15, 3, '12-20', false),
('Bench Press', 'Chest', 'Barbell', 'Intermediate', 5, 20, 4, '8-12', false),
('Cycling', 'Legs', 'Bike', 'Beginner', 10, 45, 1, 'Continuous', true),
('Pull-ups', 'Back', 'Pull-up Bar', 'Advanced', 9, 10, 3, '5-10', false),
('Planks', 'Core', 'None', 'Beginner', 4, 5, 3, '30-60 sec', false),
('Deadlifts', 'Full Body', 'Barbell', 'Advanced', 8, 25, 3, '6-10', false),
('Jump Rope', 'Full Body', 'Jump Rope', 'Intermediate', 15, 20, 1, 'Continuous', true),
('Yoga Flow', 'Full Body', 'Yoga Mat', 'Beginner', 3, 60, 1, 'Flow', false);