-- ====================================
-- DATABASE 3: CARS
-- ====================================
CREATE TABLE cars (
    id INT PRIMARY KEY AUTO_INCREMENT,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year INT,
    color VARCHAR(30),
    price DECIMAL(10,2),
    mileage INT,
    fuel_type VARCHAR(20),
    transmission VARCHAR(20),
    body_type VARCHAR(30)
);

INSERT INTO cars (make, model, year, color, price, mileage, fuel_type, transmission, body_type) VALUES
('Toyota', 'Camry', 2022, 'Silver', 28500.00, 15000, 'Gasoline', 'Automatic', 'Sedan'),
('Honda', 'Civic', 2021, 'Blue', 24000.00, 22000, 'Gasoline', 'Manual', 'Sedan'),
('Ford', 'F-150', 2023, 'Black', 45000.00, 8000, 'Gasoline', 'Automatic', 'Pickup Truck'),
('Tesla', 'Model 3', 2022, 'White', 52000.00, 18000, 'Electric', 'Automatic', 'Sedan'),
('BMW', 'X5', 2021, 'Gray', 65000.00, 25000, 'Gasoline', 'Automatic', 'SUV'),
('Volkswagen', 'Golf', 2020, 'Red', 19500.00, 35000, 'Gasoline', 'Manual', 'Hatchback'),
('Audi', 'A4', 2022, 'Black', 48000.00, 12000, 'Gasoline', 'Automatic', 'Sedan'),
('Jeep', 'Wrangler', 2021, 'Green', 38000.00, 20000, 'Gasoline', 'Manual', 'SUV'),
('Nissan', 'Leaf', 2023, 'Blue', 32000.00, 5000, 'Electric', 'Automatic', 'Hatchback'),
('Mercedes-Benz', 'C-Class', 2022, 'Silver', 55000.00, 16000, 'Gasoline', 'Automatic', 'Sedan');